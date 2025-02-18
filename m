Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7EBC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VaGTcSN1wD5Urnyf0YoZkBhWlJQc2yOqVlder5VljG4=; b=p1aEIq/b6Gxs3GfQcauw1cd5Vl
	3NwfuYNY8tJth0EM4j5XaMbwls2lR9apsYBr06chzU7p7jB8Bi9PGaFYEoE2TBuroATV+JwSCuk7+
	g0QSvA29R+aFkDl3i9lXq8o2WofCys7x2OHxpKeov61FHAyXvu9AWDTkuQ04PZHe/5Kd+LyqWV/JW
	emuKUamB0nhzpaLbANyQso9qolxRPZ9KE3qnNUj+sqqtGmG4UCE4ClEtYEFYfWvXuTHvHDhDVQxfw
	oV3e7a9WOGd1hTdCcLnG3FXCA/w8tMO070oRdvHqtbKmlWd/6ZITKGny03D8o7FDD7L0XoQcM3GU2
	jXFw16Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSkX-00000009S7x-18zH;
	Tue, 18 Feb 2025 18:55:17 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkScu-00000009Q7k-3XiX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:47:26 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIkxib1730394
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 12:46:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739904419;
	bh=VaGTcSN1wD5Urnyf0YoZkBhWlJQc2yOqVlder5VljG4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=sOsCCaBENHWTqHe1BgBE9MgQbPYGYDmRraShvvUgyIbXKunywcEi1FN28QD2/dCXZ
	 8OmRn+3ExhwDBlnS8+jN32fV67Meb3xUaksUfA+zO0rFQDb88GFHH+qC6cnVeKx0u6
	 Rmn0BpWzQeN8m3mbomvXXwoliFGN81j0WUsKWhRQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51IIkxcI057016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Feb 2025 12:46:59 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Feb 2025 12:46:58 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Feb 2025 12:46:58 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51IIkw9t116037;
	Tue, 18 Feb 2025 12:46:58 -0600
Date: Tue, 18 Feb 2025 12:46:58 -0600
From: Nishanth Menon <nm@ti.com>
To: Sebastian LaVine <slavine@d3embedded.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado
	<nfraprado@collabora.com>,
        Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav
	<vaishnav.a@ti.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Biju Das
	<biju.das.jz@bp.renesas.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Elinor
 Montmasson <elinor.montmasson@savoirfairelinux.com>,
        Fabio Estevam
	<festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hans
 Verkuil <hverkuil@xs4all.nl>,
        Javier Carrasco
	<javier.carrasco@wolfvision.net>,
        Jianzhong Xu <xuj@ti.com>,
        Julien Massot
	<julien.massot@collabora.com>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Kory Maincent <kory.maincent@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Sakari
 Ailus <sakari.ailus@linux.intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Stuart Burtner <sburtner@d3embedded.com>,
        Tero Kristo <kristo@kernel.org>, Thakkar Devarsh <devarsht@ti.com>,
        Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Umang Jain
	<umang.jain@ideasonboard.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Will
 Deacon <will@kernel.org>,
        Zhi Mao <zhi.mao@mediatek.com>
Subject: Re: [PATCH 4/4] arm64: dts: ti: Add overlays for IMX728 RCM
Message-ID: <20250218184658.sgtrrwpltgrcnlr4@smugness>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-5-slavine@d3embedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250212195656.69528-5-slavine@d3embedded.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_104724_986441_701BB8EC 
X-CRM114-Status: GOOD (  14.87  )
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

On 14:56-20250212, Sebastian LaVine wrote:
> Adds overlays for the D3 IMX728 RCM.
> 
> Only a connection on port 0 is currently supported.
> 
> Signed-off-by: Sebastian LaVine <slavine@d3embedded.com>
> Mentored-by: Stuart Burtner <sburtner@d3embedded.com>
> ---
>  MAINTAINERS                                   |   1 +
>  arch/arm64/boot/dts/ti/Makefile               |   3 +
>  .../dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso     | 108 ++++++++++++++++++
>  3 files changed, 112 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bf6a48da0887..f109b5dc8fa5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21891,6 +21891,7 @@ L:      linux-media@vger.kernel.org
>  S:     Odd Fixes
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
>  F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> +F:     arch/arm64/boot/dts/ti/k3-fpdlink-imx728-rcm-0-0.dtso

Please route dts via SoC tree.

>  F:     drivers/media/i2c/imx728.c
> 
>  SONY MEMORYSTICK SUBSYSTEM
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index fcd8d11e5678..6c8bbea246f1 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -240,6 +240,9 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

