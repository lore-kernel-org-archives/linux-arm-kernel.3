Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D46D12D55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 22:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUdaOedIQ8kUg4x9LzwEvFzayNO8i4Q73skUB7XP6nE=; b=lgp30/sBPWJc/jpFGEv5/IndsC
	xHR+yEoiRN95/Ie0CJh0/4cpuv3j/bbL27thijkYL6WBXy/Kqwc0Llq5Xxs0dkIKGqCXMVNLDbzhy
	1Tvn9GiukDCxKTw6QYRWkEc4tt8YH9peHXj4Z1UWRTAF+fEcQMskmlFvI9g3YM5hWQfDKxAD0FpFF
	MLxPvhGbcYIK8Cc+osne6jE8JC1br8t2T8biKvaX2Dfyxxu0sjfhq4M8C+lUjrBZZYSblayxXJASH
	XGeM47/+OEnEZm1+eW7Xq4KO/LrE1A7qiAC47pHba9fmz8xoy2bI5W3uvY8/gsz12Tk5n+p7stt7q
	8Hfe9zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAG6M-0000000FhBC-3n3f;
	Sun, 10 Nov 2024 22:08:10 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAG4X-0000000FgwM-3pJz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 22:06:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4138D20003;
	Sun, 10 Nov 2024 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731276374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zUdaOedIQ8kUg4x9LzwEvFzayNO8i4Q73skUB7XP6nE=;
	b=Sfo4PljnlqS27SB2PJ9FfKpI2ZiaRbV7otawTkMzyTbtUY0PINozJKZmopnIPKCfOG3uJz
	yR+6J3euujKK8ebiqYr/Zz1QKLrLAx/J+ow4JaMbuxZqIrd4L6+Ai1HRgqQ6RKV67yBTY6
	iekNdnPSR4PFWY5YWrT/oEHfbWZPd6GC8teEQpfUMxwYiQ8HOr2B4MW9MvH+cWXm71rAVU
	ZBeIFS3uZHqJgVgVS6q8YXxlRlcRyM1dUk3AT8eVI386TEiEJhRj1mss9YMBf49xmzIXYi
	Zv2w58JkepakbW5A0GHD1nfNudjb1jZZ18C9hEBagpCyGRc1P41YNBhmEeb7zg==
Date: Sun, 10 Nov 2024 23:06:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: patrice.chotard@foss.st.com, lee@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH] rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <173127618343.3020900.8341724701726838297.b4-ty@bootlin.com>
References: <20240912033727.3013951-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033727.3013951-1-ruanjinjie@huawei.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_140618_118592_130D6917 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 12 Sep 2024 11:37:27 +0800, Jinjie Ruan wrote:
> If request_irq() fails in st_rtc_probe(), there is no need to enable
> the irq, and if it succeeds, disable_irq() after request_irq() still has
> a time gap in which interrupts can come.
> 
> request_irq() with IRQF_NO_AUTOEN flag will disable IRQ auto-enable when
> request IRQ.
> 
> [...]

Applied, thanks!

[1/1] rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()
      https://git.kernel.org/abelloni/c/b6cd7adec0cf

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

