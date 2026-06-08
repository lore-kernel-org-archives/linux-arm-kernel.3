Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F6ECD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S9bZC8rw7YmoIyog8z2SdVy+ERoBgDn2wG881TA87OA=; b=EBhMlVHaf8eWuvbYAz5CX67XhA
	0hiUcN9Q9sDx6zTIv9E08qfUKqTOmAJt3w5u59IosB1YPlU0dYzdljPNhGo6pVj8YyRRT1X6MQQgF
	u+KZVjl6eU3VeVAg1pW1ATH4YzipUbJj3qSj7y9tXxKyhtto5JKGQ9J+32lpLaYU/YMVkgKNPBc4j
	1CMBn4GoDnOKiZF5qpV9R5Jsoagrp0E+sDNMTvRsogvS96BE6/YzgewPZMyjf8rv+JMfvlVlyt0TI
	GxEWIpzBW4dNdVefFzYIFziFkKiBhzLSpG3/frkhyD3/NO8N6374xTAIVTprEujdEijOUO3UzHl0o
	O3X5XSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAP-00000003o6P-0JeZ;
	Mon, 08 Jun 2026 14:41:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAL-00000003o42-317u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:26 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so2033956f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929684; x=1781534484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9bZC8rw7YmoIyog8z2SdVy+ERoBgDn2wG881TA87OA=;
        b=I+to9DfYs+DMN6x8dfaRX/FfnhxlrN7VRgVIFBXM3cP/6uf2leQapKNKPhi5jNEQ6D
         un3vuILGO22OfURtWakw9SttwdRQY3qqGBbQNIQO0ZueoHmEsIdT9SGICrti17ri/5/E
         7gVvxwxZgN5HcVhURQLrWLzSlTCROnZSR2TpXdY4ZWQLJfcl1SM2q2P+oZ956jIyKKYt
         BI+8dyOUL0+J1PTrEE/UCEwWSPDtPGYLNCCd1DBL6lH0c57ptTDgfajRZXnAz6yl0iJp
         PuWqurOjt+QlHBPSzwKYYBsrN31vjw+uGCxsiNYmbgYc6LTF7/asJz0zltVDLbtTyOTI
         6VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929684; x=1781534484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9bZC8rw7YmoIyog8z2SdVy+ERoBgDn2wG881TA87OA=;
        b=RKJBaBkmFF711BWgelCEpg6GZeDQro4u6JRKN5SE/gpzABBcVg48g+HEf2TYRkjHon
         HlXwguX24Jm2F70YLjCv87+oK3AhE2w8N/Zbjtp18fa5Sw1m4WQX6ecXoDgxFoZIK0nr
         bT00HU5Vt6n3XtcQXT5a4hQb2fwYc3KPyWTRw1t8iGxfmyRPDBIRY1FTyjPGxmXMK9wj
         rQ+6LS76I9h8okJ3XccME9kGubG0u8+0EaAuk8/AaFu10Q/n+tz2/GqNa3BC1OLLy1Yw
         JN6ly/kDXBLF04B8UErgMBX7+WGqEGOJttpnTKGUXokCB05QdeJGDncEUzCQt1uyc0dk
         ygwA==
X-Forwarded-Encrypted: i=1; AFNElJ/GHydK7COTyOuc4RphDfGuwn/laME999ihre+rB02CHL+5a8F914ZC+w9kjYh5u6AMzI/Qd7b1WKLqOfbTUzhN@lists.infradead.org
X-Gm-Message-State: AOJu0YwriIBAnoHRTSd0YRzKYayLOd9K+/sfxdt3e8rxlStmcJQOR431
	/dXje3Bce2ZHfG4gzLD7lhPRcyUYP/QWoB2dPkFdYl/l7sId0SHXTsGR
X-Gm-Gg: Acq92OGeVigj4QvS+qHIsUMzLBhgPavfUoSO38gFHcdco4qs4pfcPDGzIcHkUw6hha4
	TznoBPp+BfLGMJ6j7rzsf07Bie7SKhoeJOL01u20iqFTrKi8AXplqXqKoj92hOWh2fjduQXUsst
	PSDQruuIsLwyvL+1idOjgd84PuinyCKH+lA2iK6dXjYTaGHTNgYrC7Bs5ZgFKSExiihVuFKqvPy
	IRMnYt2Y+ei+Ro8pVq3spMK6ThjJNoMjL5q8W/IHbWzhauQcu5mUzSJnSG+nXK4xw7TvkCUfL8N
	vyQRewYzdcLqg6enQRkBTn06Ezg9xaqoFWQtzP9MaSueatrGJKpV2bMN9GYuF9r+h+WwYimC8KM
	XI8sUCTZrGUvXCQ1I4ZDpTTNDvFhR1W/lEEbyHAJYvzKRebYvL1e3ruBnDrM+t+l2IilnQDGiff
	N3hw1NUuYsBR76lNhuxTUc2tB3nDasBjCkRIMwJAeeLrHLBbuv1QrQmDh8M1bjqkJZ8g2QYtIpe
	nRXYBl2w+YZ9mGdFaUhCBu15ooS0uU03UeoLeWLg/BSK2eJOTWTDyI9FKE=
X-Received: by 2002:a5d:480a:0:b0:45e:f5b6:7bf9 with SMTP id ffacd0b85a97d-46030627a04mr16756707f8f.31.1780929683675;
        Mon, 08 Jun 2026 07:41:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:23 -0700 (PDT)
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
Subject: [PATCH v5 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Mon,  8 Jun 2026 16:41:01 +0200
Message-ID: <cover.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074125_773872_B19CB00C 
X-CRM114-Status: GOOD (  10.78  )
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

v4->v5:
 - Add the SION (Software Input On) bit for the I2C recovery pins
 - Remove regulator-always-on and duplicated vddio node

v3->v4:
 - Fixed USB irq edge type
 - Add HDMI HPD support
 - Add pcie reset-gpios instead of deprecated one
 - Fixed eth regulator

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

 .../dts/freescale/imx8mp-var-som-symphony.dts | 389 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 399 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3


