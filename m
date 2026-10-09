Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF68CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6SBIK/RTJ2gKGJUx4mMtmO3hND48ShXeu1KsGP31Dg=; b=43KtDl/t0k8ansuD4EMXNeQRfV
	OQd0+Cz/tDCKo3AOL0q8l+FjmEGInqOQbyQ6Bw9zrlGyosUr80okK90zYKWEZptYBbbGs1kFjr3td
	k2eZOZu9VHfnutdduQfqPaslU521GbWuCXCudszLph0q1jyORC7wcFQ2W5+dDSquKDJ4xso9pdgkg
	a3ii6bcjSYr2m1864ctQWqiYxLsByjOg/LVf1s84z13QbnbgJFaUzqoE1M/ti5xOhLxqFx8+kC7BY
	yWGiJN0VmWWl3O5/rMH6aFEhn6oInaXvC1gbbHRTZzQqgwfSXxFCsJhghA2J6ovYDGHC/LkpXRaXl
	OJjhyV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF80u-000000065aG-3W9W;
	Fri, 09 Oct 2026 10:39:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF80t-000000065a9-26sf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:39:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3328B43F66;
	Fri,  9 Oct 2026 10:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19BDE1F000FF;
	Fri,  9 Oct 2026 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791542383;
	bh=n6SBIK/RTJ2gKGJUx4mMtmO3hND48ShXeu1KsGP31Dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T8lb7rfFs5SCf8klrO8V53eGWKjoijHWEtYbXWHIP2InyTIod20TSCfW4WiG05/XK
	 WsO4WDNP+RulRO+g/hJl4SIWDguooxunbrMQ1CsENWaCEbGRaiT12Z7s7ONfUbXPpB
	 oFnc2yqY2SVEzp4nc76HrvxBr02aZxa8EwHAVjGBpjA2lc0+AxPgtnMhGwiqg7ewMv
	 PCzjvztCmmMiGtqwe8irX26Mop83S3WyOj/FygoOAwyX+wEkNqwgjkP+7Q38UT3k4+
	 tyeGEzr/Up/klrZyNO2lb4nUd7gg1ygwG/n7p8Mr3eb03rY4auMB/fhUPQpXsa+KP7
	 KIZuAK6XaO3LA==
Date: Fri, 9 Oct 2026 12:39:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Josua Mayer <josua@solid-run.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Maud Spierings <maudspierings@gocontroll.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v5 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ
 board variants
Message-ID: <20261009-dexterous-petrel-of-storm-8156bf@quoll>
References: <cover.1791487179.git.stefano.r@variscite.com>
 <cb2311ceda0efe83d2a05d2d0488d547043b1d47.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb2311ceda0efe83d2a05d2d0488d547043b1d47.1791487179.git.stefano.r@variscite.com>
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

On Thu, Oct 08, 2026 at 09:37:43PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Document VAR-SOM-6UL configurations on the Concerto and Symphony
> carriers and DART-6UL configurations on VAR-6ULCustomBoard with
> i.MX6ULZ.
> 
> The compatibles identify the SoM storage, wireless and audio options
> followed by the carrier, module and SoC compatibles.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v4->v5:
>  - Put fsl,imx6ulz before the fsl,imx6ull fallback in the new Variscite
>    entries. Leave the existing EVK and BSH compatible order unchanged.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


