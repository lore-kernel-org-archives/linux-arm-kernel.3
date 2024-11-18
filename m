Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9B6D49225
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KedvWKey5BPekgZ33QSyGqNhec7IAEYxlEO+HyVNno=; b=D9N4LVXfaL7xjhRd8zmW7s8D5I
	tXHeG+icP2JLAYHsQ5p8F5dIuyON9riPiK3F2fNmw/FiaIoPTabbV/0DCFC2Q9WGy2QYN3xAGKmCA
	iv4xtia5r+nwrsYKIOvDDGEB1ylqi8mgLK5rrgZ5gZHv8SyfZ8DbbGpvePD6/wevHo5b7NStUChL1
	Pxq6NTXX/WuqpEIkSmvQZGxHg+0YTwfLCWFnCRQGmwrWoxpCVUPlcTB9GRpQ1WMbxwwj6GFeV+W4f
	9HKIW9dPyRZ3R8Ex4Iv3sPLu3hzHi5unggNDxd3m6FTopFNSbqLe+dlbZpvDhH79KhHl8J09xjhtL
	FwOPP+nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2J2-00000009gtt-1dY9;
	Mon, 18 Nov 2024 14:00:44 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD27L-00000009f2K-3WlX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:48:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F35D120008;
	Mon, 18 Nov 2024 13:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731937716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5KedvWKey5BPekgZ33QSyGqNhec7IAEYxlEO+HyVNno=;
	b=gti0D6R6RJzfhukjTit9/jNRZNer8Wc4I47CfHEBwOOA123LT7sGMvinzRVJauSjPR+RCb
	1XWl7zuKskAltxCHTnjiqJiBhqF34CzOMoTL+eZxi51LOQddbV0u2djRZAdPXsJJe6gRzB
	QWWjmwv0WOa3JIIv1I4ikRTzlYuxcf8/68j5qB0ABpAPiFkkZCbaPOhw2z4EJBZ6G0pBDN
	q/HTMvmAJN5YM4jssLf4ekSJ3IUS64p9f5vMJ5rXFQhBPcVwQTCgn6gxlxk/2sXaF1nZFo
	PRARuM8G0jSjRzv9BAbytPIk11jloDG0Rv608QXUzs0WLxZR6Nbr5Z4+kd7TLQ==
Date: Mon, 18 Nov 2024 14:48:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 13/15] rtc: brcmstb-waketimer: don't include
 'pm_wakeup.h' directly
Message-ID: <173193770578.39194.10840695643775625403.b4-ty@bootlin.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
 <20241118072917.3853-14-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118072917.3853-14-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_054840_022977_E9727ED8 
X-CRM114-Status: UNSURE (   7.47  )
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

On Mon, 18 Nov 2024 08:29:12 +0100, Wolfram Sang wrote:
> The header clearly states that it does not want to be included directly,
> only via 'device.h'. 'platform_device.h' works equally well. Remove the
> direct inclusion.
> 
> 

Applied, thanks!

[13/15] rtc: brcmstb-waketimer: don't include 'pm_wakeup.h' directly
        https://git.kernel.org/abelloni/c/5b42edefd733

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

