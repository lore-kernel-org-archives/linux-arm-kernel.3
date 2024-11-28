Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE07D690EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WtRgwkoqRvksdBwrK+9C+XcfQ8pm5qxMtRwdKGqLCI=; b=g2N5wcCtdik/ZHZD2ZdlsI71ei
	8WL3E0BCaU7+uLo6WeYcrZQTMR7QOBwCXDDH0zFvaMtYwQye2HZGxkVC/An5BqRKw7kqaGoFeE12D
	vBSRdU77PBbRndIQW9M4RQIdAMM9EOrzBffilSRwIxHEIwrldc4KoOt019XvMJMJ54ClEteS/uz1b
	710LBU7pPPwnaSOsH7JnbNg9yEbkPqyur8a/L0BlETmqL1qI9nC+Xg2d8hUMlHnXHqPaY9Mwdsqoh
	Uz9Du8/sGYRClFgsPFvGq0LURMbEp/FMIamomxrN8x9EjL+GbaV3NckxSl/k0v4eD9RDEPl4acxJI
	QMYITl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZxD-0000000F0t8-2DGp;
	Thu, 28 Nov 2024 08:32:51 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGZwD-0000000F0jM-3JkZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:31:51 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2C6822540134;
	Thu, 28 Nov 2024 03:31:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 28 Nov 2024 03:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1732782706; x=1732869106; bh=+WtRgwkoqR
	vksdBwrK+9C+XcfQ8pm5qxMtRwdKGqLCI=; b=cD13hdQ1XUG0xRZYw6rnafmsZb
	wVFv4wwJflBlc9vEDTsSSVc1Ar3Zqn5dTAGZIeev1ilMR6VZ9ffQ07ldvc2WwPb2
	eVDW0sXBHkM81jjoyQUc1jP6VQ9kQnQSUFl0eOX9+If3DgipElYdXHcTtgsP06rG
	fdjJI/e5h4s+xwJNNHF5P5xM2gyqvfQ1oW+TmBJD6Z7l29cJbMgr/f45T0Mj+4bD
	r7BMn7KRkVpS4tdOP7RnaF3Id42ieDAC+K1eft+3tMqnXJXrmWXHKM0lxu5ZcsxR
	VqLMaXHOm/UwaqJ1lOZEdlWnUCXmx4HSQJEZJIhtHMkXAp8jICm8Fnq3rO6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732782706; x=1732869106; bh=+WtRgwkoqRvksdBwrK+9C+XcfQ8pm5qxMtR
	wdKGqLCI=; b=vfuHfLkV7f86qQdkEzPEEi+3JL/OM1IQGjFe/eeyoJidcCwIlQq
	3p+TuMXhpmu4+yY+uaZwpzhzQ2MMbUKSroDcdjanlgbinwkXdxRf+WOW8X8Ld+kq
	gLMFmq/tDCNoFRcV6/8/PLuMmxWgd3XSVy0Q0ggiPK6HTKuv+7c2+tIlIpnQJ13l
	Y//6lvjJd/UbU/TkFwdEINRhe72zWAPyGvnSGs206fU2N9W3DqnwG3iSzZcwxdJ+
	p1S4OCoBKGUrQwuZ13Mvsu9GxQ3kZ8kYHrJtPd8ceOPvA0fbyxYP8P2T5FfPzGAN
	rAVHFjb9LzyRPmwEEkY4rD27y4bXM976e+g==
X-ME-Sender: <xms:cCpIZ0xVALxos2msEFwsnZKR_4dfpYeR00fawAv7uORAen1ZJ0MYQg>
    <xme:cCpIZ4S1zCqVW84msn6KX8Y1eDmtD9mZ3Gd5vsvQpzD_YmOl03BL0gWBWdm_uhD_f
    xH-xHcKdm_rTd7295Y>
X-ME-Received: <xmr:cCpIZ2U5TumEAhkXx8TB4q5aj3CDd3xPH-YiDRFGhP9hFE7A-ZkK5q5C3lFwVi4ZXhHNy-T1axJOpcfjWDCl99lplPnLq_wwVmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrhedtgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtjeen
    ucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefgvdffveelgedujeeffeehheekheelheefgfejffeftedugeet
    hfeuudefheefteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepledpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtghomh
    dprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehm
    rghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtthhopehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvhdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdp
    rhgtphhtthhopehlihhnuhigqdhsphhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehl
    ihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:cCpIZyia3mF4fBMsfu8O1EF91KcPpuX4JaCfnWs2kefFcuXDT2fPaw>
    <xmx:cCpIZ2BXa7MsELBiMvDJMEk9eQCSMMqgegOWzHG9buNzpAk0PSLLOA>
    <xmx:cCpIZzIQmyI9nnK8WpJ1uZ_1Ed2uzHeNhK_Z85MCo1_nSNDvhobTtw>
    <xmx:cCpIZ9BiSMnh9AmdqF8S5WI40eShpkDtR5AbsIzqE7iMbReKlb0Xww>
    <xmx:cipIZ-uU7o1W9WbkfADtT7LHpJQh8yMR85QKSI1KWopOCFw3gbjeL3xY>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Nov 2024 03:31:44 -0500 (EST)
Date: Thu, 28 Nov 2024 09:31:42 +0100
From: Janne Grunau <j@jannau.net>
To: fnkl.kernel@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-spi@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: apple: Set use_gpio_descriptors to true
Message-ID: <20241128083142.GB3782493@robin.jannau.net>
References: <20241127-gpio-descs-v1-1-c586b518a7d5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241127-gpio-descs-v1-1-c586b518a7d5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_003150_415534_C86257FD 
X-CRM114-Status: GOOD (  15.40  )
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

On Wed, Nov 27, 2024 at 11:18:29PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> There is at least one peripheral that is attached to this
> controller and can not use native CS. Make it possible to use
> a GPIO instead.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/spi/spi-apple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-apple.c b/drivers/spi/spi-apple.c
> index d4b126c8701a67083e7247d1c82fb56f1725d9cb..6273352a2b2861c9da0976a46ec2adbc4c71d3d2 100644
> --- a/drivers/spi/spi-apple.c
> +++ b/drivers/spi/spi-apple.c
> @@ -493,6 +493,7 @@ static int apple_spi_probe(struct platform_device *pdev)
>  	ctlr->prepare_message = apple_spi_prepare_message;
>  	ctlr->set_cs = apple_spi_set_cs;
>  	ctlr->transfer_one = apple_spi_transfer_one;
> +	ctlr->use_gpio_descriptors = true;
>  	ctlr->auto_runtime_pm = true;
>  
>  	pm_runtime_set_active(&pdev->dev);
> 

Reviewed-by: Janne Grunau <j@jannau.net>

Janne

