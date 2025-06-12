Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49020C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8NxJW8a0rDs+8sBFsEtXBrcHDs56LoiAx3JrdQr1I1I=; b=GOv8aZaOYJejxSZE6sBBSIZF3u
	j5i6JGVWEWKU/T5SBXm+HUWwmsyG0m5i9C9qTKobXKL3XEy7H/UPaUnAyhhHpG35ypSPaNnoMi3iv
	Y0XlkWSsFxGBBbsO5uJdLkwFWE7Rd0tZ6vols7ks8f5L2wujBedVOES+jCYzkuKqkUrFiP/Qu3g58
	CepRHp22w+Ei/3wdl+nE00AMaOB45y2i4m35/UZVV+3mYGuKIeZYS8uq8JpT5qewufkMVmha9i/Kr
	zOT5BQmhhGunzk24shKEJSaqeEK2g8a6jp5Equ7FlfDYZBtDFyCeUswVTYJAu8cRkf6sCFecmNdqM
	Mf0Q1x+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPesc-0000000Cvmu-0MyT;
	Thu, 12 Jun 2025 10:09:54 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdvA-0000000Clm3-3bc9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:08:30 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso1314441a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719307; x=1750324107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8NxJW8a0rDs+8sBFsEtXBrcHDs56LoiAx3JrdQr1I1I=;
        b=RmwKTx6sqkEIdWStzb4OzKFjmVvEeax48daX86nKJoh9cP+2n74fawbqO6HtAEaaJF
         VtmvQCs5Li+Z5SvBxL+vOQQ6L8mjv0Wy7ubMEpV52rcKJgOUgKsjoo5LpOD6HRiQs4pu
         B05CpOjOm/fSqivrpSqebXHvYsg1wcm4q+ZcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719307; x=1750324107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NxJW8a0rDs+8sBFsEtXBrcHDs56LoiAx3JrdQr1I1I=;
        b=iAA1xQ+4Zw1fLcRkeoi/qRwO9eT0gOcEPjM9LMf2Thq2CXzMHf+xjdtSsy+pb/knDb
         mh7r5CKE6jVh3bFc749RSBJBcgIWBC3R0CGTY4wpGnRgdgo8c/wMCkQmp69sDeY+Jfyo
         mvfYWhf3cnLhdM2BhVh/2NnBGIaXpAV5y0XdQhCQdDKN+vvs1UgEzvtuhhHf278AUMX1
         tGYshBf/RXtEiiTl5htck1zLrzMiMToTgfssRel1Uz55HXMfHGi+uLLVhA8q6CAX3ep/
         iq5+X3NFKYxVz3n9UIjXoHdYUE6LqVxnFRMnVs1qK8+RyKceclRA9Sb2FyFC7kDdeCKm
         k8nA==
X-Forwarded-Encrypted: i=1; AJvYcCVT5iQWEPBJText5+E6lh5y5RVN1fkBvwzI8TAgYwMt9Xw4/v/SHIN3p7wB0EqM2B9BuLJtzFTe7B9OHfOuq8/m@lists.infradead.org
X-Gm-Message-State: AOJu0YyHp+DD/XrFBxVxTZURLf1bjj7xWhmVXA3oALvQEikFYZbiNifH
	NWHDdhxj4lbJ9KrdDz7Dh01RAxZLHlCfwSKuAjlUQAB8PZuM4ua8GnvRkTiJt0YGAa4=
X-Gm-Gg: ASbGncsG9qAVQMt1J+r5GRtgAgRxx6Gkz3BBygC4D+fVj4BdAxxW2ezH57Pa82Zdu+r
	UHyiqrKtyPaR2m0jH/IpEFnO/7OgqDXPWq3/Bi+OiA94ZZxwJeQMFsLczJxUu4Ql16d0WT22X9s
	tAdZfbHVP00k0oBjX2ogqnHGQcZ9+XOfuImovgJPAkcj6M312s4szfJ4SyH7H7NJyOXtSwvyZko
	NydmDCzPxc0YvJz8br65jk87EGYr8lXtMnivAXPnIHZnHrxcFHvFIzgWLL3YqS22TB0Bbh7nrca
	b/aP5Y06cDoXygFw2K8J1ctOPoTasVNhhTwGY8gXKjAlC4z71FO2NQZcZ4ziVuIJMUEz197NqtB
	Nr838gbFmhiTCEH3H4q0zsQLQM71Vo6SuIYla
X-Google-Smtp-Source: AGHT+IHXDyupYzZCXJi0eiJsh48G5Ym1bzk1PJGvBlaIo3IRc/SJXPwW1VjHYYpk3eeIYvpgukMg0A==
X-Received: by 2002:a17:907:c807:b0:ad5:e18:2141 with SMTP id a640c23a62f3a-adea273e373mr294920066b.53.1749719306831;
        Thu, 12 Jun 2025 02:08:26 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 00/10] Support Engicam MicroGEA boards
Date: Thu, 12 Jun 2025 11:07:45 +0200
Message-ID: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_020828_904664_E7F6D0E9 
X-CRM114-Status: GOOD (  13.02  )
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

The series adds support for Engicam MicroGEA boards:

- BMM
- RMM
- GTW

based on MicroGEA-MX6UL SoM.

Changes in v4:
- Fix commit title. It was referring to a wrong configuration

Changes in v3:
- Drop an extra blank line from the iomuxc node.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.
- Drop an extra blank line from iomuxc and iomuxc_snvs nodes.
- Rename sgtl5000 node to audio-codec.
- Move the reg property of the audio-codec node right
  after the compatible property.
- Drop an extra blank line from iomuxc and iomuxc_snvs nodes.
- Drop an extra blank line from the iomuxc node.

Changes in v2:
- Change local-mac-address to 00 00 00 00 00 00. The actual value will
  be set by the bootloader. The previous one was assigned to Freescale
  Semiconductor.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.
- Drop an extra blank line
- Move iomuxc and iomuxc_snvs nodes to the end of the DTS file.

Dario Binacchi (10):
  dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
  ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
  ARM: dts: imx6ul: support Engicam MicroGEA BMM board
  ARM: imx_v6_v7_defconfig: cleanup with savedefconfig
  ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
  dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
  ARM: dts: imx6ul: support Engicam MicroGEA RMM board
  dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
  ARM: dts: imx6ul: support Engicam MicroGEA GTW board
  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503

 .../devicetree/bindings/arm/fsl.yaml          |   9 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   3 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  | 303 +++++++++++++++
 .../nxp/imx/imx6ull-engicam-microgea-gtw.dts  | 162 ++++++++
 .../nxp/imx/imx6ull-engicam-microgea-rmm.dts  | 360 ++++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  95 +++++
 arch/arm/configs/imx_v6_v7_defconfig          |  27 +-
 7 files changed, 938 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 2c4a1f3fe03edab80db66688360685031802160a
branch: imx6ull-engicam-microgea

