Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC4CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJAlGRz75xEq17uv2UlpRAl3s1Z0RM73GiaeFljbD9I=; b=nsjGP6gwkw4TA4VyXdZx2c8Mc8
	A3i4cX9wblLZld3kv2/5XQNOLWNTcTtjlGZH5SCV70gtxJSiA56KFfBgkUXFTpn4cECOGsAXGyhGK
	tRql27VvXlGCcLKGaB8bmFr3rKUT3sSeD8Sh2yl4xnQzk6I11lek9C0HW9Dt2Dn4xQI2hyaPonT5W
	cabsTGpyG+v2uvdS/4fH5MnZVdL/qgw90tJagNvSOB2BVe8z5YOxWlm3dMUusgFmphfHuYQAZheyp
	FchPElFkVctVJAnckqZwqjR8tddE/fG4EftkT23SEisNn01Avd9MRO5thCqL2LsHTg6L7mEPJyAIG
	1LA9TVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmin-0000000FGkm-1uMw;
	Wed, 03 Jun 2026 14:37:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmil-0000000FGjn-1wTk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:28 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so13278755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497445; x=1781102245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJAlGRz75xEq17uv2UlpRAl3s1Z0RM73GiaeFljbD9I=;
        b=ibu0WCKmvX+0n7HviShRIRbaTx5Qc27XfiV5BNaAi5wqY3onFL3zaodX1ncWQshMPV
         4y8deY0vbxZasBOo4xcqTZBJ53H8nP2etiohdbIVFTkkGC1zw3eriY7WzFp3dc7hnfmO
         4JVFmwqX+EAVEn7FpCoapjgZ+kJgbjuaQelF6oLooEcVmNdjM6BY3fkApaPfBYJy1m+b
         Pca5qpHQMWVTs88fbhJscfBzVhChK5MmCf3gP6pklkWlk3nF2xVzjFNt1RMfQlSDcSZ4
         WQqF3JITs6nBsHlwA8qwRK4wFWBQj7ALBIDIiUFpVINmRjcFrH3xsMAA8nTX1rxUZTSC
         zRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497445; x=1781102245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJAlGRz75xEq17uv2UlpRAl3s1Z0RM73GiaeFljbD9I=;
        b=Om3K77SuiRmJou6I8lYJkwkiRCFmwvMX4t/spaPTdkZl1wjkNGBRP5gpekCH27cZ3X
         NLMFUuM+xrmRbvLou4Hjg2hsXbNYsh/Z2VtFqyhOtCp+jyk0DPf+Yues8Gs67KRlLbwf
         9rhXXe5S6f7XwoClw7tnC0Zp09OUVaFEhn3Sr1dbMTukxINobKyUvGVXQWyDdbjAyDmG
         +LDsgVpNhQeu2q9JcUHxKPUM7AErSQ8AcmRJnsMeqzIRViQoTsmn78ncbCHwFu8BhdP/
         quqEVp4u7Aqxt7E8oMlYyTPDPGvnLDROEQid9Cc9w2ooIWNEAy1hgD2qeJuUy3OFr8x2
         /vhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XKPsl5pzTVxLAJw2c7A1zg6EmjqBhUNXQSld25qkTSj94JAoZ1KgYx4Eh2cGvycAaLGLJP2PHwfxt8r4HsKia@lists.infradead.org
X-Gm-Message-State: AOJu0YxkKfcPNvB6oxLZLRYFFQ0B1zhFyjSfE+mJ5WunycSWQ2lZ68gU
	0YWfnCDYQqLCyeUhzdhmaozCohECwY9Bsr5mYraeolygHMhfyveifOq6
X-Gm-Gg: Acq92OGXg9MxI0KIOdDQ2LkQIBCbcyFgWSMTpD/u+koq4Y4QO8m1OUT0ewzOWjaa5D2
	tNX7LKHtfrXalwHvCOaymS+MiceJmQ49/FjwfPR+SOVOVHEMxoRLGDj3LK04aREjFZDbW0KhkgP
	mFOxaZm9OPkrZQIPLz65bZ4S3UkX4CwDC5k32FrCjm/T88omqL5qrVZItOnb0vYhbLifCif22nR
	B1o4Hf1camIx6qGihAwOpMh5scGLBLRWzuC2Ih+rc6LnIgxT3he2MLl07HUuf4ZfqyNeoQ5MMw7
	q6L/oaez4ubNflQVB0UXjzo+yRN1gZ3k5s9dwbEx/nLXvcXtlzXjY6zvhKOYPP6hm+zKYjmavDa
	nEGJHQeS0dFTmonzNWxBlbjDqGUKHd1ADsRMBpDOIkUSQXBKMEgfHoH6j5kb5B8z2v+iy8UmgRQ
	4n2K58LFMMLnzgU+soN4jgwsBpS20cQOqwlpKfrkSPQEp4gFuLrjLzt47qsZjQrehvj2lUuyjav
	S6q58qAAwndjsQTNQAm9o2quZ3Fk3h7bAQ+WzZqbLXVox+U
X-Received: by 2002:a05:600c:3107:b0:490:bad8:329c with SMTP id 5b1f17b1804b1-490bad833b6mr28402275e9.12.1780497445402;
        Wed, 03 Jun 2026 07:37:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:25 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 16:37:07 +0200
Message-ID: <cover.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073727_693836_9BE8B7A5 
X-CRM114-Status: GOOD (  10.42  )
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

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

v2->v3:
 - Add FlexCAN2 controller support
 - Add FEC controller and MaxLinear MXL86110 PHY support
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (14):
  arm64: dts: imx8mp-var-som-symphony: add input keys
  arm64: dts: imx8mp-var-som-symphony: enable USB support
  arm64: dts: imx8mp-var-som-symphony: add TPM support
  arm64: dts: imx8mp-var-som-symphony: add external RTC
  arm64: dts: imx8mp-var-som-symphony: enable header UARTs
  arm64: dts: imx8mp-var-som-symphony: enable PCIe
  arm64: dts: imx8mp-var-som-symphony: add HDMI support
  arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
  arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
  arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mp-var-som-symphony: enable PWM1
  arm64: dts: imx8mp-var-som-symphony: enable CAN
  arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 394 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 404 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3


