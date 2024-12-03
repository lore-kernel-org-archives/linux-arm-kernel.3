Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC3EE64A8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WXLrd8ABNcSoG1qW8IbIWSc1U86lTtpYwQQ7tf8PS7M=; b=SAIBIUPGPYKaEDyXCxIhnTA6nj
	F0uYofEqag5uYCQBZX1zt3W/FcEr9VYPfL1CG6xzeMgIwEyStwcQS0XDl8Ni1hDFJNDhyqYD1L9J+
	Kt8uIL8IeDAZG+2z7FAWOI5GSZ298OfqpR4qFeaBhPJnxMw449HjiM3taebp58v9XHfJW+uSgphvR
	GCLoWp/BoR5SQisMrdsGNii4q/MIFF+50zmeINVMCPut2sDqevQrEPL70Q3hslj9cNZWPDmOvcXGl
	ZLg6sAufoL3VMRPQViaftveNW2yXih+anIAQPY1pSjOF0IoHP+C/a1i1lH/K4m23WlxaxLdsQ9kw+
	vkUG2LHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISvR-00000009boV-0bWf;
	Tue, 03 Dec 2024 13:26:49 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISuQ-00000009bh1-2EsL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:25:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49835FF803;
	Tue,  3 Dec 2024 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733232341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WXLrd8ABNcSoG1qW8IbIWSc1U86lTtpYwQQ7tf8PS7M=;
	b=gXxGUy3TlyX+gEi+BKC7mldOYoyJZZF95bB7ImyGoWvuyLqwNDnIeORJb1JCPJpZkkE3FH
	ytcRAYM+s+EAcUCcd07TiDkWfrxUO1+i5PaSoBOGzwpJf3BV5ESv8D5z2shI8Vvngsw3rm
	W2xLp9IMI7f/bGmJlzTp+AT3YoBm18x1yGisqOZTy4LS+vcv4k0IFHH9/Ur+ZLDn6cukyN
	ncZn1iA9Z+G2inxyEv26vH8MU1GMwEcSkktBKd7dIsBfoOJngaueBHl7FPOG/EWXZHvXiH
	PS7L0C8i0XuifQrh/rpvQFrQOI1kURlH+1y+GNfPWgeP3q1b8RQy6iVb49ydtg==
Date: Tue, 3 Dec 2024 14:25:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Esben Haabendal <esben@geanix.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH 4/6] rtc: st-lpc: Fix initial enable_irq/disable_irq
 balance
Message-ID: <202412031325408acbe302@mail.local>
References: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
 <20241203-rtc-uie-irq-fixes-v1-4-01286ecd9f3f@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203-rtc-uie-irq-fixes-v1-4-01286ecd9f3f@geanix.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_052546_716720_25DF75E8 
X-CRM114-Status: GOOD (  16.27  )
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

On 03/12/2024 11:45:34+0100, Esben Haabendal wrote:
> Interrupts are automatically enabled when requested, so we need to
> initialize irq_enabled accordingly to avoid causing an unbalanced enable
> warning.
> 
> To: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/rtc/rtc-st-lpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-st-lpc.c b/drivers/rtc/rtc-st-lpc.c
> index c6d4522411b312f94de2701ff4ff491e5323aa96..dbc2c23bca23f5de6de3fd4b39c9c67290bfd78d 100644
> --- a/drivers/rtc/rtc-st-lpc.c
> +++ b/drivers/rtc/rtc-st-lpc.c
> @@ -218,6 +218,7 @@ static int st_rtc_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	rtc->irq_enabled = true;
>  	ret = devm_request_irq(&pdev->dev, rtc->irq, st_rtc_handler,
>  			       IRQF_NO_AUTOEN, pdev->name, rtc);

Seeing the IRQF_NO_AUTOEN here, I guess the patch is not correct.

>  	if (ret) {
> 
> -- 
> 2.47.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

