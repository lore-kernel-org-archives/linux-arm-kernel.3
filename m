Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B19BCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RDe3rLy4zwbLWq8QIOjW3QNgCqdLF/T/ByhSBBeRxlg=; b=IwmVmNslrPqfZLynAfHfKcKtxT
	LH4Qbr37tRcEupi92UcwOWSKDycTs+6e1w7k+q3CSyIn7NDcalJwSOxETuF97Ud/E2C3LOL0jVFou
	ZEBAkVGTrB1bB4iPUBxtT/F6E7spnTpkNCKoyeshm+lHpb3h1+3Nax6kGU0W9FWjVymczCQ47Etqg
	uRKGvOMP91uMf19IlsJavFRAmnCchcZOZCoajpwEySPbY+YedKmvLw+CbAIHl7/RVj2A1WJzEBLTT
	rA1GGhHaLLMxCEZcEJdZ/2HshlNrITiMY/dMl7imxDw4z3o2LVfcmj7lqMkY574MAyL56Uu/9kySh
	1AaAFi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGS-0000000F0IO-2VJ2;
	Wed, 03 Jun 2026 12:00:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGQ-0000000F0HA-1NME
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:03 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490b915ded5so4646105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488000; x=1781092800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDe3rLy4zwbLWq8QIOjW3QNgCqdLF/T/ByhSBBeRxlg=;
        b=hPi6xIVSY8IRIjYY4uPoRRNU2raMfsr3QLQSkhw64bh3IBc5PVuK9IUIKBu6yNVOS3
         O1kYwAq2/LAD/k5aDGqgSlbTMXt355z3GuWDK+VuyC+7q1WghZStuCrEMFeR7ZfPMQNg
         IAuJ2SWYkEKDeg3aNCc85v5FCSZpSA3HYGebTo0dJt2o017Vb3St8OLmv2N8lEDsaGvC
         PL7+Nu7VLnEh0UrchjVL+F6gnQCwmR9nCxwwlTlpcc4FHf1QApHx0w0jlGYMhA1PERJv
         F0qNJjnn6x1EyH420YmnR4LLVojDUSAV0D/tAGThnvPPYiHhVPZnDhfWZdII6x6WleKW
         7dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488000; x=1781092800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDe3rLy4zwbLWq8QIOjW3QNgCqdLF/T/ByhSBBeRxlg=;
        b=aakj4TBzZWq6MY5y7iTzrBV3ktcjcL8T4moKQPIYdUlHfivgSneJaW8qovbXpz65MD
         xUtWa9VpWDxryg981mx1heA9FG7ypcuab9KxgeHh4/9kXxqrCWSzESQC7Qd6afdaHQ6c
         I9hdws1DjMBhfX3Eho6JpskMkq1OT/lIhmrJNEX60a3JWXxSKZGThv9WeqPSVJqOu1tB
         3MbKCuskF5vC9AcKcTKdEs2CAgjzqnhfNpdT3Cx6p3ng/fLv2ABExz1plUhgF3AMWOlU
         73ch1Z0CCRkCozR3cXVP7momrpsoK97v9Cur0SBzO691ZNYcN9fQxHVY2LtZhc6A3Qhu
         Q8xA==
X-Forwarded-Encrypted: i=1; AFNElJ8aVq77rntgKBQzwt1bo29yiavTdXmj28q3N5dSyxtwaua3iUdrUv5cDb/T/WUT7iU29jjMEJ8hYz21M26dAfUH@lists.infradead.org
X-Gm-Message-State: AOJu0YwOwgA8mZ5y76U77VZDNgpXItIGiBO1+fyeomsnZuEoqtdGsrTZ
	6w+Odybp97DBLgnRv8x2pqwK4LufAkTws+37AbQASY6nPUY5fT0Pw83c
X-Gm-Gg: Acq92OF4vH2no0T7lsN2fGtykhTtSCId/siyr9GA0FvWBl4UdDSIpKIN/oTs0SioCI/
	uHD3oXunwnTnVug/jgSXmH3iuXz9hGOVdWVq+P3vN1ANmTOmQexCHA6A1DI20zjkvX+dheBfsLL
	IZngYrJlgFAMjudQ+lDwraZuFvv71m3aRGudnbmAtwNFw+Ynhdxi048Drl1n5ARTVYx923A/usD
	jhGyjNQb849Sxpp5uuDSfWTFc3JPQfhzsJgOGIgdJgO3xdnWFYalPDYHj9eA/IlowCrLayTg4WT
	XxmovHA+1+Pj3BWSPS3v8yXZE0SgEpUtbRmhAwbS0Du6EWY/wf0PZ4eXR/DCyRFmG8U0yIsUoaI
	jMcY0vBLDXgNMgUpFdyxvtEYHOihuMNu3YiPStiU0YcvLCfcMdxYPE+3xko4T4A3DAG0uG76Mtv
	ue/zofWcfGZIptXK9D/Xk8gO7niUV+SJo9dj21/flyAwOJaFTlBHhAXGasCfqSfLnq9AQYzEifL
	DtpEiaaIHFO1VNRih6/jy7RKb7kpvlHKiwmu1OZKE3dFw/6
X-Received: by 2002:a05:600c:3ba9:b0:490:b072:1be6 with SMTP id 5b1f17b1804b1-490b60f6d03mr55331115e9.25.1780488000209;
        Wed, 03 Jun 2026 05:00:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:59:59 -0700 (PDT)
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
Subject: [PATCH v1 00/12] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 13:55:38 +0200
Message-ID: <cover.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050002_383884_08DEB321 
X-CRM114-Status: UNSURE (   9.29  )
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

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

Stefano Radaelli (12):
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
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 307 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 317 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3


