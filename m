Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C713D767F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiKI67UhXbYKoP9AKaDP+SpWLvcVFNqyksY5P+mdC2A=; b=Dm02g8z2/ZFnkyr1iXeJfof015
	B2uTzujImmVNZbkrS6M95NYa67G0C6ipJoT/b+I3nQO3n3DgUVooNNKoaMnYDRhz3p64FA6aWxVAE
	QlSbCd4GNVm4YDvnMMHrJ44KFESr8RMRcG6skZ5w75lJix6oBHBLnsuzyq477bKX/510v/+IgmqWS
	1e8U5IZ6LFw9PKApJJHL7ukCQ9reqtDkmMt+m+4WOtKftUgber93uezzMomkERwUfyGPu8TYJ7Obm
	rdymhaSTZMdKXnh+KGaA1tLrYvulqB5b8w6C5MGY707qUCjFy71B+imYzcS3aAW8lCZPzsSYRl41N
	JqjPQkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YzD-00000004LYR-2h9n;
	Thu, 31 Oct 2024 17:29:31 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Yuq-00000004KwC-0BwU;
	Thu, 31 Oct 2024 17:25:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0433260007;
	Thu, 31 Oct 2024 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730395496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KiKI67UhXbYKoP9AKaDP+SpWLvcVFNqyksY5P+mdC2A=;
	b=PUunbCFrG/Z9WuONmUXFWmILS0BsqKio5QLZgvp+0cn5wg9UixGX2+FR3Jp8CpCNl7nIyA
	hYplzYL+1S/GVqzMbFZAZF33TLBNdcG/YkJG9xCp/mQQlpOTWHCg/dDTwqUrRzH99MEdwv
	+iKsd+7TC4iKQAOiNZPm4QyWRbnalcpxhiejxXOi8IHOMFB6+hQ5R0GveSp2pvj3rsaOzY
	vAa1Apqt8D6sZ4gPStvuiwpvfEPp2s1DsPr/Nemo0NoziseZlMpmBNGLzBqpSQcYDXQOdF
	xsm7yDOrDn+tvwpLPs136v32XIeNRjFRP2MaEr39DmZHTQ2akIGw1RxciKV+uQ==
Date: Thu, 31 Oct 2024 18:24:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: shunxi zhang <ot_shunxi.zhang@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	lee@kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] rtc: mediatek: Add mt6685 RTC driver
Message-ID: <20241031172455faa7688a@mail.local>
References: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031135807.31605-1-ot_shunxi.zhang@mediatek.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_102500_270181_A0DB36FB 
X-CRM114-Status: UNSURE (   7.32  )
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

On 31/10/2024 21:58:02+0800, shunxi zhang wrote:
> +/* we map HW YEA 0 (2000) to 1968 not 1970 because 2000 is the leap year */
> +#define RTC_MIN_YEAR            1968
> +#define RTC_BASE_YEAR           1900
> +#define RTC_NUM_YEARS           128
> +#define RTC_MIN_YEAR_OFFSET     (RTC_MIN_YEAR - RTC_BASE_YEAR)

I will not take another driver with this. mt6397 needs to be fixed
first.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

