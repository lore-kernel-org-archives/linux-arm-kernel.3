Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757CECA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQXFB5CJ9p1R7R+1lxx2Mup+Y0yp9x/tWRHvoPiTk40=; b=l+tiMzMci3ZrWtvGmI7vFYJMlD
	WvQi+606AbyKgwyR72YYWNgRrQUUsVVlp3L1qE3D4N2pbGyBettP1lfxm+H6O/5IANLrLBN2tgoA8
	PSEIZqGQPqrKyQlrW6p3SSgL5VPkpDegx0O4uugrGAZEOllgtsb1Szd5iWW0NvaUvF8EYvB8Uf50t
	IhH/q0UzKlmeczn0iMyARk81x9TuQ8Z9rcvooywX7G8BCuvmQ1BEErylcctqpkQja1RWiwgocKX/9
	7Rjk1Q1wqqoIFDVy8vTpVzb0IaHuQKHlZ1Ie/CjdBP9M+VOTERjs1l6soiOKT+TKcqPhnDiZqt3k/
	MyezLYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBr6-000000085wW-0w4Z;
	Thu, 01 Oct 2026 08:09:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBr5-000000085wQ-0pid
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:09:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4A3341692;
	Thu,  1 Oct 2026 08:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801621F000FF;
	Thu,  1 Oct 2026 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842166;
	bh=FQXFB5CJ9p1R7R+1lxx2Mup+Y0yp9x/tWRHvoPiTk40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jCcPxnKYG4vKAWKRz0xj50Il7/xhWvdgRJPZ1UjX4Yj1m2p3vjoPFXBl6heVc5prG
	 1g5A1LDd2ekiJbh3Od7h1kRyi/XJAceBKALg4ekluZu58/BKZYFo6uzjdAvQ6UAvOA
	 MzZ4zxVZWbmytQALoWXxij1WfLFwHB9OwjLGDumTJS/3iyHUDyqL+AVncT2rx5HdVN
	 HutARDjLEslB1s7vQUYvQp2RyPU/CxnLRMv5DszIt9ZvVyr5RUCUDZNpBUlQ4eZaCd
	 0jOw7wiKWYj9U0FwN/gjQsENm7a/0ghzexJcJxVyvgpOsIERLEQo/HofBP3DHS0zN1
	 nRY3kPMfRIPNw==
Date: Thu, 1 Oct 2026 10:09:22 +0200
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
	Josua Mayer <josua@solid-run.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ
 board variants
Message-ID: <20261001-immortal-wild-wallaby-23de50@quoll>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
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

On Tue, Sep 29, 2026 at 05:17:30PM +0200, Stefano Radaelli wrote:
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
> v3->v4:
>  - Split the board binding by SoC and add separate VAR-SOM-6UL and
>    DART-6UL entries for i.MX6ULZ.
>  - Drop the redundant -board suffix from new Concerto and Symphony
>    compatibles and use sorted items/enum lists.
> 
>  .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 9b1224091e01..42d12624c1db 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -944,6 +944,50 @@ properties:
>            - const: fsl,imx6ull # This seems odd. Should be last?
>            - const: fsl,imx6ulz
>  
> +      - description: i.MX6ULZ Variscite DART-6UL board variants
> +        items:
> +          - enum:
> +              - variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard
> +              - variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard
> +          - const: variscite,dart-6ul-imx6ulz
> +          - const: fsl,imx6ull
> +          - const: fsl,imx6ulz

Is this the right order? Which one is superset of which?

Best regards,
Krzysztof


