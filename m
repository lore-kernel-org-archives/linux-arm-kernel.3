Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0F8C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2OgOP+jxXWQNRYRoolW60fTXYG8LulWcgv1fskPdr4Y=; b=xTGtN7jP4ge0Rv8gSQjfj0+If5
	/iFlPLpkVmVckFNjJS0ZSNqt2tNLlZRtqviBgB7gZwyVHvFFts/fhl/2TqWgjiOiLUM6Mjhcps5iR
	9QKXGHzHT/+mDfcKGeaZo0Ngtk/6+uNS1RaRpgdIQqw7OQ9rR0mYNNY8GoP7JV/MxfsjEG4SGoAaL
	VzisIGIGZJDKCQ9J8RXIwDRB4KwlF8hRFieB/wnLo3nbgtAylPZ8RNALNFmmoJ7hQJVYaFNfl4GeK
	Z0GAR3hLrs5fcRHCjDdTrbGmhgFRYxrdCD11jm742LC67cz/C/hLzn/mVAR8Yr0IGXHoyW3zxBY05
	H3LiEuPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kTs-00000008dQr-44vg;
	Wed, 16 Sep 2026 07:55:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kTs-00000008dQO-160L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:55:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA90D412D1;
	Wed, 16 Sep 2026 07:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E231F00893;
	Wed, 16 Sep 2026 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789545299;
	bh=2OgOP+jxXWQNRYRoolW60fTXYG8LulWcgv1fskPdr4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jQXJc38XSm97lmRc3872XmOkSrrP4O7h/wvOdwT7rH0JjjxQW4cNAr9TTZwr74C0n
	 80EfU1uu+E+g+W+Bs0Q6W3kcEqYqXbXO2Ua9Ug27DvF4br/xVOMoYA7Ma5XZ9Fwuy9
	 PReFtdG7zkupeROqWNOMVKONS3zG7eUFtju86SKbnRaM54vTd6j956O4XxZudRzdXR
	 pyxGjlAU8sFIu/MCIfBmquaKqYekFAuF0/JSB70ySWn9YPVTKhcraaovyhwRXNSScL
	 IvhY69JsGl31fCnN1fbWy3JqFxF7kB670kqCp3y5fDneGSYN9R6mTmg4pxTrMoOMGC
	 q6e33yDcE3m1A==
Date: Wed, 16 Sep 2026 09:54:55 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shengzhuo Wei <me@cherr.cc>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@atmel.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yao Yuan <yao.yuan@freescale.com>, Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 0/3] i2c: fix DMA channel leaks on probe error and remove
Message-ID: <aqpLLgjoREHUkj5C@zenone.zhora.eu>
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
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

Hi Shengzhuo,

> Shengzhuo Wei (3):
>       i2c: at91: release DMA channels on remove and probe error
>       i2c: imx: release DMA channels on probe error
>       i2c: qcom-geni: release DMA channels on probe error

pushed to i2c/i2c-fixes.

Thanks,
Andi

