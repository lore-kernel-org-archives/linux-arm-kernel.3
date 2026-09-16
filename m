Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBC6C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCt+S52i9jhWLqP9Ai43Jys+VpUMZGBQ6OzhaRvb6Io=; b=BU3XetS9+QMcV1K0EArp2XX/kf
	tboXwuIgsaCx7kVwTJtYcJUJdb7mCApyKUnoYZvF2LokPIhC1DTZGb/ctIsK4MC/fXrSyV6PgXPUP
	tIGs1yLySxS8e+W72KUBp81zGSUq6pinqNCogu2PWx9v4vTNPswbQdFL2gSh538ML2PKhqLFnQcNy
	qVs9iAG6hUzMbzi11G0DniH/mx2HYQ80SyKeGXaFOz8KygFHL6riHh+v36xBN0zctQsSd0DtJPq57
	ttZq3QYXTl25GbWj1kQylrY4u7UIuQyki7tt79VNo+hAMJ1XhSZbs1t9Zwf6HtyT0sjT4HHRvFMP/
	woRmSVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lDy-00000008jwx-0RKm;
	Wed, 16 Sep 2026 08:42:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lDw-00000008jw2-3O0M
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 08:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uCt+S52i9jhWLqP9Ai43Jys+VpUMZGBQ6OzhaRvb6Io=; b=WzWlFx55KbuusyF83J5gc4ZHh5
	musalOq1SXKQW6hnndWdyLOvkeljDKPS8WDwAKSm1sVgRRbJbl97mDM4NNbLbOyUMt1EYwhKUrHlD
	qxhQ7TD1hjuBbolCUO1F5BO5QMHXrUX888Z5k2H4+DM9TqikYqoKN03G9SJWDsQLFShAjbCcB5DUE
	8Ksj2DVljxsG+H1CDdWtw25CMGHQabdYJXgdtUZs99JtlPSeKEFUIhABmut7CSdOh+JL/zK6oUXiv
	uZa4W4wrwxGBlbpXeeEHyG3x51p90up8dhOMF68/bfMHVC4QMCRiHgtr8jFxctlIy+ydLYReCEic0
	JJaCWaIQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6lDq-00000007dud-16hK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:42:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF7C11A08DB;
	Wed, 16 Sep 2026 08:42:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C39AF60337;
	Wed, 16 Sep 2026 08:42:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C28611C7B017;
	Wed, 16 Sep 2026 10:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789548147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uCt+S52i9jhWLqP9Ai43Jys+VpUMZGBQ6OzhaRvb6Io=;
	b=0gRJMAIfWz6BUbxtkOAo8e6cSqhth/n/K1YBrrTpLgEVFbS2QnVoq/U8AKVLciIeHSaxT5
	FzWDbx7Thb7Ers94EYnPTVOk41nLLyZIIooATPJQuNfsDyra7GKkz8wxo3JgN5FCsD0kF7
	S1dF6e3LTlw1mgMup3nDG3hdrFxqcFIEZGEaXZbkQEjsdqC3X0/ErSZllYp7+mfCRlbvd/
	hLXc8nXyRnrocos4BsnqafeBfYMlTdhskVIsFNmi/lyneHeKuwkI/bdRwSt5Gy9yN/I3OX
	r/RRLkuIedIxrpCuuy7e6mdn170mFrR6KuAW2m4yzaFB3x3R1MvN+wv1s6wx7g==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260813092836.38367-4-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-4-francesco@dolcini.it>
Date: Wed, 16 Sep 2026 10:42:13 +0200
Message-Id: <178954813309.214898.9623998050171113140.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_094233_360583_5F1A8579 
X-CRM114-Status: GOOD (  10.64  )
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

Hi Francesco,

> The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
> the bus-width property accordingly.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> index ec3c1e7301f4..1eb1cf2d7395 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> @@ -229,6 +229,7 @@ &lcdif {
>
>  	port {
>  		lcdif_out: endpoint {
> +			bus-width = <18>;

I don't know the hardware in detail, but the datasheet [0] mentions 16, 18
and 24 bits, and says "Up to 24-bit color (18-bit recommended)". More
details in ection 5.6.1.

This patch would force 18 bits, but "recommended" suggests 24 bits makes
sense in some cases, no?

Can you elaborate on this?

Same for patch 4.

[0] https://docs.toradex.com/104446-colibri-arm-som-imx6ull-datasheet.pdf

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


