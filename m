Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E333FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m6w/Ct8nuPMBPRpUy8/kJfgTP+J5orD9plu8W5VIflo=; b=cMJVXOxXB85kqP
	UDWtf/4XSorFkVE4TqMOVt/4TJaHSqck7HCDkCk1OYJcMMWU1jboH8AmE5EpXDiELbIFOXRRa4WfH
	hCHIiPgGwSltXFTH+HWTA20QIgQ/eI+I4vAttkIpxkSCb7gfbjZSxEyexpbUFX/uhYHxV1k1653NN
	shrzHPQX4KG9suTsPiw2C7HDn4YqYAARlo2WC1JWObe1lZcl3iXEKDPuoUU2AnNdUHIqmKAEVP3pH
	XftWbQhfvC+63QTg7Wc9j2LRyS8RO74ltvmTmeBF1F+DVUOQX1foeOoL2sQh30jTpRw5m4fHQ0+NR
	2CPw40rtl8OwLU8BHGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbtF-00000000q4p-3Dnv;
	Wed, 06 May 2026 13:02:13 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKbtE-00000000q44-0vxM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:02:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-44b052142e1so2739354f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778072530; x=1778677330; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6w/Ct8nuPMBPRpUy8/kJfgTP+J5orD9plu8W5VIflo=;
        b=JZHtg7Vm/U08GzJ1QiVAb0jsymwE6tQtAY+YuRYfAuLWsyvAMA0vGNOewwFZsxboNE
         Ra80MgGmYLb/oEixnDMXXo/kGfTLkQ/uSI8+GDeCWznKAVdPJ48LazAVVrWXyfhojcZV
         3QLi7R7O/GH0TvIddj8lvXdkxGfXN2qtAfOvd0Qi8rOlAY0Ld1FJapaoSSNgaWZWTakj
         HmR1uFNIbjB2ktB2mzrwOOsw1Ww8F7xKIcACtFHTTZciK5/1clNJbjOEK33U3Oeru0wE
         B1+fSr2DUd24wdzNPCys5TBcnBOMSdp4UdALXcRAPJW9iitagOj4ylG9ejze3ZM38CmE
         SNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072530; x=1778677330;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6w/Ct8nuPMBPRpUy8/kJfgTP+J5orD9plu8W5VIflo=;
        b=XlU5r57TOg88YnoieEylDXDUswY79+RLMjQE1ycur4qQpprlnW6yGSJA7QcjS+ahh1
         OyDu/5zlYpUpRVKeBbCsVmL36r9FQfClfikx4OZYhfBNyBn6EauJ4Ob+Bp2OHSLA+eoo
         9o0D/YShntQf1UdDwzgdST+bjJ1aQ+D5pp3aRSpIWo0Zx2gh4od4YfbBZVaHEjp8MT6v
         WhC3ZljjkNY05gDWkUzXuXPd4DmFr0p1cZGcADlZhNGEhR4Lo4Qes6KNW0uhhUsivc89
         5oF2guQ86Ppxe0CxEgCEJfN2KxEUwYZU0c0q5MLVDO9UcrNXnhBkB/pCKIddqJva2YCo
         VE0A==
X-Forwarded-Encrypted: i=1; AFNElJ/gvARC4sHUNA2vwYcpdsVTfmuQenfHlP49tVx+d/c+z7pECxXgDT55o+xh6UXs5e51Esm28pwOPJrEnx4nGRey@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ+PeJH81os/2MyBbMmIqtsatQ/ldIIfnNRH9oyfmgckvKvLZn
	Us1t5tkPpyOWoTx/sDHOfPG0Aufsk0Qsjih/NoYoeCUpXtplWU74HY1q
X-Gm-Gg: AeBDiesvFhFwORrlsF2xN2+UC+jSk5FDrKaMCBWm9vMVP1Sps+68sh5uaxgsUc1WJ/N
	sobYugNdq6dgA+WmZR6C3md3zKXPaWXgtyNSDfU0v6DuGkYgYW2PmfEfLef5IgsyrGFXBHjaDFy
	fieROXV21Im19E82Jj/vkYYCZwmJDnVEdLnQ0sawJfeTYpmh0/bqF6hQ4IcnPcWwvpkoH54Lypa
	ogL5n7XG8+wCIxYf7BylofBYUy+1J1aE/n/g60h28ImwfsS7Sp2CW6ufWAbl/DJPReDhz6Yx+9V
	SsBHGEfddQS2esdcPbul6uaGvDFahxSsXMBXkghRJv1PSG/wI2B0sWE+sgjrJw0NJZTktDJiLxv
	Nq3MUFxScbw0J4+jo80A4c3b/NIzijJMKU/8fU4V67jueuY89Qf4pEfSeLcG1FF7GXh6l+OicPW
	37qOz6vPxvlfEsKtFdCw8Zonwpi7MIcZjDNEe4MRLIstikUtu4e+iWYNsiTrcXRoBkAo2dgHjpF
	JY9O5X0k9hXCdl9J2WO6NfXtV+TXdtYfKf5MSHjeadun3YtnFZshDp2SZV4x3eKlZuCZ67rsqEq
	bNAzhbr74zI=
X-Received: by 2002:a05:6000:268a:b0:451:3b12:9bca with SMTP id ffacd0b85a97d-4515ce1cde3mr5834248f8f.25.1778072528841;
        Wed, 06 May 2026 06:02:08 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a488d8sm12288076f8f.12.2026.05.06.06.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:02:08 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Wed, 06 May 2026 15:01:54 +0200
Message-Id: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMI7+2kC/x3MSwqAMAwA0atI1gbaaAW9irgINmrAb4siiHe3u
 HyLmQeiBJUITfZAkEujbmuCzTPoJ15HQfXJQIYq44xF9h75OHVm1OWuHZZUkKt4KDxZSNkeZND
 7X7bd+34RJCVxYgAAAA==
X-Change-ID: 20260501-add-aquila-imx95-423256af3d21
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Antoine Gouby <antoine.gouby@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_060212_282495_C956C863 
X-CRM114-Status: UNSURE (   9.42  )
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

This patch series adds support for the Toradex Aquila i.MX95 SoM and its
currently available carrier boards: the Aquila Development Board and the
Clover carrier board.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and 
Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
lane DSI or CSI interface, one LVDS interface (one or two channels), and
some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0, 
and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Antoine Gouby (1):
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Franz Schnyder (1):
      dt-bindings: arm: fsl: add Aquila iMX95

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

 Documentation/devicetree/bindings/arm/fsl.yaml     |    8 +
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  294 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  398 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1862 insertions(+)
---
base-commit: ebdfb84ecf7a0bba26d7a04edae98dd600fd4b42
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
-- 
Franz Schnyder <franz.schnyder@toradex.com>


