Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7C7CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAOsRM1+80/MwNu76Lnr/NEqUOkPH7Rb8BzB/sMmpYI=; b=Y6YA/NReTf1SnR
	a53p0gRskoRp9QxLjfHiyByykL39jC3ZAiRtAMsD6WT6gTiwclCRGj+y9EINuuVob5t78y6yqCaMI
	CAH4IwGBDolOyft7ukAeJgDBrSH6Fl50N8cgz5rPsxxRMfeqmajDTWfq0Hxlp3AM1oHhUMTc3l5Ot
	Y9blgF8DEl2Y0V+8XNrNHO8JbXc+849m8s12Lr6nB9LRLM+EGSdon56r8l5x6WjZbe2tGbrUBcpoE
	SjlScX2dS4KUuksgp9QExIndBCXWQK9n3bYQUGSDrLQwy/MbndUdhisJazCosdWeh8TVVT/mQJsO6
	KPOdkhLma2ICGoC3VF3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzJr-00000007EVu-28xh;
	Thu, 21 May 2026 09:03:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzJn-00000007ETr-2ubG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:03:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891b0786beso40621865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779354230; x=1779959030; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAOsRM1+80/MwNu76Lnr/NEqUOkPH7Rb8BzB/sMmpYI=;
        b=N6WZrWjhWBrdCEEd0/KnahxqGWINcOYHpLUrPp+ynCrewsJmbpVfLUlUOXqrFTofWy
         +9GmbSSXOH+BvDZmpOPVJi99Jm/NnpSUE9W7GZMkpUQNnVD231QcJ2NX6IDA5Ci7VHxp
         TdFq+8mCdWYF8gWy+lwiswUQUvtkDk235nHiRcr5nB+4rGViFo2lbnO/ZSvQDMASG78A
         a1Ox5ZDkbvmSekVwVpo2brrjgeoIMTklUieykidMCWc2tFuZie86FRG4yvU5Z53A1+Dh
         FR0GoH17gjuWX9cYT1C4XjPOT6Z0ykCkKT7PPuKVM+yiL1A4Iu+11FWvHwF6nTIJjycK
         ibDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354230; x=1779959030;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAOsRM1+80/MwNu76Lnr/NEqUOkPH7Rb8BzB/sMmpYI=;
        b=pvVBwqEC1GIfPitlc+IW21nWXLFZIcGZc/35cgmDCigQmti+951QsWaADlQ46VuuZj
         s11tHlzTA9GXVTfQeX5NjeuiUxNTSaTj89ordTNGAi7p+JNVAzH4h21VuBH3gL7KraEC
         KlxrNMJD7XmoG1s3lmKc8dlcq+Ym6gtBNueK8TiOWFzw+2VoYq1HWoHla783K4ryCVsK
         xw+S9xoph6bH1CEwL5kRfyLOQE18EWF7me6fsGeEjfy6WRkOqtS7eQApbx97/HgTw1mG
         BoO9yOQWy6QRPhRyxT7BDV0RHB12LUceHmxfhMpLc1GM+MYMRGR8BadXSVP3c49bU/Js
         LFjA==
X-Forwarded-Encrypted: i=1; AFNElJ8ryJprkb1hGNfXVsjftyVu4xm8Va0C0ecaLyfA5MslBoSS1mcJL3vJ9rje/18ZPBZ5rvPQZ0jghF+6WqLE9Vkp@lists.infradead.org
X-Gm-Message-State: AOJu0YxPw3ri7tWKxTryA1fNMbsq8r7MFdFkp/K2qFdcnIdbLMK7Gk2u
	P7Z5iOXd592KYwLoZTlAlEZV9beTQ86kfmdN6/UBJWlYGF66KfmkhObS
X-Gm-Gg: Acq92OEV6eMhQ73uyBiWSIvSPDu4ZFOAxOMPkVAe8XytB5G1qpyv4TzHCdLcAdgld8/
	bMnJtgr+i+zZinrkAnAi5hN3EXmB7LUenJxotDrXrh5RLleoln/buu/VQ+yu7mHIl2BRLGCMIJM
	cy1dLQfkQOND0yjHcMkQ2KdXAvPveW9PdjWVJaBsv0hKDtbT9fh9Jzgvb+NjXx2YSJYxWvsoSNA
	yEjkvDlTilTEiFuJAKqJyM8fmj3ckgSwIK94fxbyqYo5dpYfu0mT3HzHbychAwwGTZ9jwpzv44J
	YwJSnYytkXiqLksKerD19m+Cij08wtQottv+mb/MIz2MATTmNe9ADiwOrIlSwDs9xxD3/Z6QWBa
	UUI+/g0mNDpjeanC6pXkGKmqg+int5FGjbDG7GIib46GqTfGPJQmBHqV8Zqkx1gGUmojTA6ZBF9
	i121i9qT0O28l2gl8CA5nhje9jV5ZsssewKLt4TfwH2Tu2BTbH0bFeB34/oCfMIHIp+wLCN/3eW
	pBeOVMjhhjVtOaFfDVundot053fUlUDnGgPuiCvCUsb2md/uQSciLjQiJUeF5f0UHaLbYooBM3Q
	EXtZdO0kwFNY
X-Received: by 2002:a05:600c:45c6:b0:48d:46a:6e5b with SMTP id 5b1f17b1804b1-4903602dbf4mr24843875e9.7.1779354229452;
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c72c78sm16151525e9.3.2026.05.21.02.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:03:49 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Thu, 21 May 2026 11:03:44 +0200
Message-Id: <20260521-add-aquila-imx95-v3-0-621843807def@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHDKDmoC/23NTQrCMBCG4auUrI0kkx+sK+8hLkIytQO21URDp
 fTupgVB0eU78D0zsYSRMLF9NbGImRINfQm1qZhvXX9GTqE0AwFWGCG5C4G724MujlM31oZrUGC
 sa1QAycrsGrGhcSWPp9ItpfsQn+uHLJfrG7O/WJZccFv7HaL0Rkt1KFsXcNz6oWMLl+GDAPGHg
 EIIq0E7I1Ep903M8/wCdVXtpPUAAAA=
X-Change-ID: 20260501-add-aquila-imx95-423256af3d21
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_020351_770846_33F3A49C 
X-CRM114-Status: GOOD (  10.49  )
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
Changes in v3:
- Changed QSPI_1 4bit iomux node name to 'flexspi14bitgrp'
- Deleted the cdns,* properties from flexspi1
- Link to v2: https://patch.msgid.link/20260520-add-aquila-imx95-v2-0-06424a51e33a@toradex.com

Changes in v2:
- Add 'acked-by' tag from Conor to the bindings patch
- Reordering iomux by node name
- Changed Francesco's tags to have the Toradex mail address
- Link to v1: https://lore.kernel.org/r/20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com

---
Antoine Gouby (1):
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Franz Schnyder (1):
      dt-bindings: arm: fsl: add Aquila iMX95

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

 Documentation/devicetree/bindings/arm/fsl.yaml     |    8 +
 arch/arm64/boot/dts/freescale/Makefile             |    2 +
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  289 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  393 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 5 files changed, 1852 insertions(+)
---
base-commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0
change-id: 20260501-add-aquila-imx95-423256af3d21

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>


