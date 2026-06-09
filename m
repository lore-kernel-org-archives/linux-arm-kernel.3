Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C66CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uz1LCOi55WKWYdvw5S6lq94qSe5/ZrUjswZ6FTB0rfY=; b=ug9QBXmPZTk5j1+Ja5npRkV3uf
	sNxDk+7I4DZeypQvqbgw5BauK8Hp9M/XQD0NNMGA/EJsV/d9HnwKe5FSjlPffaVl7kTASIQzVrTz4
	RbpMe5yVbo7Z/P+xhEA7uGqNEyD00IEFkuVz4aeZndb6eZ1DkMhy6R18vNkHz6Pa69P7ts4N4UT/n
	FLUn2sM7e3rC5fuvZjWsifddp7D9GFTlNJeq7ZSAcqGW/9jxqEHGlf+ez/T2MfHyJpFe8+XrFGObi
	/DaKZkSzfIEEsp6vS3eurkKojJSgXZyuw7CwcaUOVxHGkJmegrMhXj38HIA2EzMTrvJqg8ROwB1Sa
	co1mx1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsO6-000000058nh-2E6P;
	Tue, 09 Jun 2026 09:04:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsO4-000000058n5-0s3c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:04:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-46019edc13dso2507552f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995882; x=1781600682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uz1LCOi55WKWYdvw5S6lq94qSe5/ZrUjswZ6FTB0rfY=;
        b=GvIoSVfjsjaEymgSw54qqH6FUL5GgMXqG7jWxnK74wuvum1j4Kjav7yxV30DbaLxyL
         mWnZ0Ii4f4sU6Am5tvyIh6dkgMOgQlilruBA+wQCsTnbI/3kOaHpOiQ5fv1PcrJpsMp7
         O8xaFDyyFoJvYmEF+macLe12pscykFNmgvYB1uGadZTd7EYKi2JIbOix4VTudPJzNzHu
         Tj7Rs5Kv7k4qjRdGMGO3aw70lwmb7w+cWGKxBUY+Q+CqCFTGEixThoPTzv6Ehbv7PiQn
         TQQf91G2MMtFC/PWnpD5nRK8uJOOxuk/082jwTJ15X3JMECP4mO8WRKtnK9o+6CkscLJ
         0b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995882; x=1781600682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uz1LCOi55WKWYdvw5S6lq94qSe5/ZrUjswZ6FTB0rfY=;
        b=Dwt7/SI4VAZxTBbET6z/eDayVHIiGJJAuVVwJHz6K4PTbmDio29/5hqXiMhLDqFXZy
         3MBBkztw+i1oU25QhXHcb+vWGAAWRyMzd4A2BNA6hIzEvCXyuOf7EPzlEbjEq2es8INL
         N51NRNkuYlOcISBAhmfuw88H2cMiihumXyOrZbOaPqR0qBOYYfRmCv4A97Vz3BR8/tug
         PmPObRVFtAbRgRuFTdKmgaO7/r0QNVBfQ3q/Vd0QEbVhHHWSKn5Npf2RK8qruglU24SZ
         c+H2O3NiWeKH17LtKOWQrXeNfpmucXVkRaKEWzzfYaNAIB+1BcWKnYw6QTRlN9Q2IKB/
         BRVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+b/r589gsQDJifd3jv0wxK4628cKfyeU7qWKCvpVtu+nFNbYJ/UyTG52y6ZOTMKeusDxkMEy7Aq3vsFUbfOJn7@lists.infradead.org
X-Gm-Message-State: AOJu0YzswyCyIJpq3mUDNhktamixw9loyooNabCe/4dp4kCrmlYuSCSu
	ncDN6hgO50at4IBP+73oE6xZZ4aAyr7VgEez/k+IkabKIlFrTnzzlo+G
X-Gm-Gg: Acq92OHWpLTek4v1jNVEVpBWZA0S6RA2+L6lppROydGGDhyM7TdCdx8NtoWHO6qrJ19
	tMuKAu16fAoNDDl7Z9k6KxzOntAXFWGibrFnxr5ThuRLZjqSgaAUdn++ncjCT/YoEzyEgnpwFMz
	nHPoflNpMOu/zggkHYawOp+1MVKZnvaPhBndbMku02XmU6PC7WloOO6ucwvi8g3apN4WxtslTNT
	pwQVsMIapJZrSoLai9CyD8iwW4CuxuCiqRrJbwamxklqHlb5eYr/e9A32Pg/INZfyMUHl0i/LbI
	vVqtSeTVbZJsvbps7TSSgFzUUAYgMI51bB95x22pNnrx6fMIobSPW6XnjGkYn3a79a5jelmA6Ip
	FG67iBMLSQYxH4zVg+dOKvAC1LsZqOMz6SFImTMbpPDnpxBUDHsFf3tpZyKedOPIujPnobpwPHX
	tV0p/9Wz6iO0q3er33whaBw90/ypUbHSFnav9uVCeOH+lCG2GI78aCSi9jVm95dAPGsYiEiUY72
	fnA3GCEMqr74497AC9UqYdHawS0qi3d2G4M2neSc7DzuGGD
X-Received: by 2002:a05:6000:504:b0:456:d5bf:e24d with SMTP id ffacd0b85a97d-460304eb5d4mr22923693f8f.2.1780995882262;
        Tue, 09 Jun 2026 02:04:42 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm64910543f8f.23.2026.06.09.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:04:41 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v4 0/3] Add support for Variscite DART-MX8M-PLUS and Sonata board
Date: Tue,  9 Jun 2026 11:04:35 +0200
Message-ID: <cover.1780995737.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_020444_282916_78DFC970 
X-CRM114-Status: GOOD (  12.99  )
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

This patch series adds support for the Variscite DART-MX8M-PLUS
system on module and the Sonata carrier board.

The series includes:
- SOM device tree with on-module peripherals
- Sonata carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern
where the SOM dtsi contains only peripherals mounted on the module,
while carrier-specific interfaces are enabled in the board dts.

v3->v4:
 - Add snvs nodes

v2->v3:
 - Fixed wrong som eth phy address

v1->v2:
 - Fixed wrong sai peripheral reference
 - Fixed wrong eqos pinctrl gpio
 - Fixed model name
 - Added new usdhc2 regulator pinctrl
 - Adjusted irq edges

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
  arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
  arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

 .../devicetree/bindings/arm/fsl.yaml          |   6 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-var-dart-sonata.dts  | 731 ++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart.dtsi   | 476 ++++++++++++
 4 files changed, 1214 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3


