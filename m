Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CD8CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UVpggI6/ihWC+nmbcQ6eFom0q7lhdlvWvI95TJ5lCfk=; b=X95Ctars3GENSAVzq9iOSyXRTh
	DING39DoGzreW3CdRKl8n7Qu86w73h2GBmWr3Jr6nLRIkpQXCOJ6BnBU4FBRO/z6NtNs3rki2eMqb
	c9YqiDZibeW6IrVmuIsjF5NFAmTYnbcxZRr+fSPRX/w3UxlLCNUx55FJmw54udbMBMf5hXYukrQZ0
	pm7PoixeBPieCc6axw6fACiM+6CrJ7nIQt2DVMzt6Xqxw63ujfChlpav2TRexga0UVP1REs85O4Y3
	nxvywE33B04cEcoKz1xak/Q7/HA7tGNdnePgXaG/KRlq4QK1O929s9xkRs83nSPpnINpTAuUPpoQf
	oYkYVMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlP1-0000000F8at-2dmm;
	Wed, 03 Jun 2026 13:12:59 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlOy-0000000F8Yd-04dH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:12:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4600ddc4017so3127004f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492374; x=1781097174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UVpggI6/ihWC+nmbcQ6eFom0q7lhdlvWvI95TJ5lCfk=;
        b=RCVLX+CnsnEkoNaLh9RyGtLEtSbcyMVfaojVoCDWFhj5R8P/o1GFYNn34c4+fC5Ixr
         7SWICZ0S5ksttxGEJ8q4MAVSFGe3dUbk3s5oRTdgqajz+3EJPfwEwjq64bAO3IYdLSNv
         6Vu+nu4IrRgelqvFs6CMxvKjioYlzDhAIfjQtM/Q2O6ViYQ+wu06XJ4wH0K6TD+xqvMO
         NYrdrhNsKVwPz/p/3ikOccrr+MEasvzbvNXmscAQCax5c+a15H2TH4tBv7R9qMDZ17c8
         I8iaEmqWRTyr6GxewkfOKDIt/ipnyevXlx+7SUpMPRWNu4C2grLDPMx1yNKveETjYzrL
         W7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492374; x=1781097174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVpggI6/ihWC+nmbcQ6eFom0q7lhdlvWvI95TJ5lCfk=;
        b=O24rLzZZ3lzggJD2uORQ9M06xBIEtPhHmZTmX1u623vZiGXqc+sRZFIQm2dmnB8VC3
         XOaVE+Dhx/72YT+CorZK0ZL0boCbk1U7LNroQi+q5Sry+pesNV75n4YjP2NhbH8+Onma
         m5MyUEeJGQDDfpmiaZwTV255LHaW/HmmYjzT9AaBdbezwKPjAKFp3dVIOK/0ANe6jym0
         loDvY2Z4WO9RiIFo94d9wMsvQn84v5MU5XBGsErRtn6bt28u17R5DbuMXYFvEvLjqwUk
         ZJCCl+u7CCi8/Zjlv5SQdO2lHVRQYot7h8hDESMewt3BwQt8yuQ5IXICzEomqs9HB2p2
         dV1w==
X-Forwarded-Encrypted: i=1; AFNElJ9Slwm/gGFzJIT+SVvwORT/qNWr9RrGasFfkjDKImT1lUCySwSac/P/mbLglgjuS6b9xnrCPxKulH3DgdfLi+hy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0JGF8ESOmWScjMskoQ10QNHmy4JA253vWxFc8B/xzpBSJqEPg
	AOrecvVB7IHt64TuGqSGX7eXZmRZ7fe5zpeSdYaeMAe0zyDI2Dr29ETe
X-Gm-Gg: Acq92OEIzXWa2qqKVqJDmsZpP5NKu+/9WFyN+Zfc7T0ktuvmWMDiPoNVBS2PtgQXROZ
	cpbPwJebL5DrpJUhCIGLxfgVkKNHcVHyJWNJHYvH0rAfkFhmSMXyndBno2nraRMm0sVl/3Kih6/
	JlDeIHFzz8+nekNVOTlmO9RYRYEIQDtmUXrVpsBf1fJhBgq5y56AUqhHKY621mNgUyj6nmgYRcj
	oJ4fRiw9hLxdMebBkqq74Oy377CgVXQP28s1yIQBBdiYVR0bzV2P6InGR1zZfVbcBe6cxAuXBad
	Np1lnWtBzkbUEuG4Vx9kiYGeJytikzVxYMWzrPZbufAJutz+tOIWEimrhNgRICC/97ZJJ59YvSY
	XKzc6YNohXEIMcSrNKK0dfpJvenj9wF8rPdYJfH1KC/5nJVTzkoC/CXtPeVFoTZ+6oS7vSYPMjq
	eX8LfdeXbFI/3CcWO85RumnRfAUOpXIOlYXm+h4ULyukcOHmLdUbYOyZ9JWR4ptL1YLsegGrVyO
	jOczlTlSb2i3h9MV8gf/wRUb4icZmFNa+Y+MopeyWfrtN99
X-Received: by 2002:a5d:5710:0:b0:453:e3a1:6580 with SMTP id ffacd0b85a97d-46021844ce7mr3696351f8f.25.1780492373927;
        Wed, 03 Jun 2026 06:12:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:53 -0700 (PDT)
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
Subject: [PATCH v2 00/12] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 15:12:38 +0200
Message-ID: <cover.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_061256_072539_CB427D29 
X-CRM114-Status: UNSURE (   9.72  )
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

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

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

 .../dts/freescale/imx8mp-var-som-symphony.dts | 320 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 330 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3


