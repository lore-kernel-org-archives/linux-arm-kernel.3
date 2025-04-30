Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF46C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLzaKZV14Vn6EMb9E2bHvEtZk0V2ql8+6m7239vNBfc=; b=tvfIYcPMoO2AC1w5uvUDeTh4OY
	E4B5kM68CixDLMq6/xUzmAEsQII7p9nlG2cx1NOfEfnmpmyduROU1DVvXlGgToa7bpNWvDlHvtIfN
	4RdyoiOB3eK0IMF0NCuqSUMuDg6gmOJJchMGkG28YYp04pGpnWnAdNhbbYscZ1sMehjevtFz8YJSa
	msXBTmj4oDJRe0Plcv/zvspz55lBtME5rEQNu4h83uwAa6ZGm14DU5c1PuAGfnjT56wcAZormrJRA
	jV5r4A6av5lH3FCFPXWJolZFemm/7FyPPK84gr1TKa8SDauO9QwAzn3tIzLEBxgu0xe6X3KRYVJf+
	KKX7wKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5ct-0000000CgYs-1ETY;
	Wed, 30 Apr 2025 11:29:19 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4kf-0000000CXmW-3RS7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:33:19 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so11241947a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009196; x=1746613996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLzaKZV14Vn6EMb9E2bHvEtZk0V2ql8+6m7239vNBfc=;
        b=A2ejnvMOs+FN9CKMAgR8igKUTZIKa4WRHEKdUvTQnjMNxmAh5DYXAnRxC5Wru5qoF3
         ddNPCeG9BNNB7QnUVFrHKhlj0vEAun85aeJVMi9lDRmqff4nZd870YoghKI4lZz/polt
         55nWv2f5KTwxVrjCxQyQrL+rqfHtrK1REJqZhE+xCWhbAGNcYv5ZdnQ4ZepsWxd1Vmjg
         S3D8QaS3UIdg1Cx3XD4vrrzAnrASMfMBollFbKEYUNqWn3wUAFJAgdvYJgBAwncLe6wV
         z0gIzvgOW7H+KG6hKgEdfSUHQug1qXdagilLHOgTePIXkFtVvgOFHDmvJ1u0iAreZkqJ
         HPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009196; x=1746613996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLzaKZV14Vn6EMb9E2bHvEtZk0V2ql8+6m7239vNBfc=;
        b=sHhu6FW2LbZOWZmZ917M5W3QF75woE3dKCR23gUzddJZFMkp3urbvrpHjmcrUvQ5FA
         2AuB1NSjVnGtY++DoQBbjABZN044LyKRvjDSgaQWU08IOXVqwBkfbV55IyNxUBnCQZSR
         QmpVxs/Dl0DpVRm3RnV4J+qOduw9Y4DcNhp7YByOtUMiofVifiLkj2s/V/JC2Wp6SUy4
         MfCYNIz7P15WHjQLaK7lBAolZ+kFv2mYfurxPACSAPy2ee9PyJj0oVItuBa5zr/2aJ0D
         nuvUOrF1wEO3/p0HvrHUbtFQFFQp+jlIWoGOFopZASem0tQT3Nrq1aLYh25HR4IK9QFR
         fDPA==
X-Forwarded-Encrypted: i=1; AJvYcCWMS8BODFlo51hxVOAgSxUDZ1xuqHtcoOleDdes2PK2KP/Ip1+8I1NOK2B5owOVBtO6IfdUrx5Q19EGPXh0lSd+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0fLiG73px5B4BQRmPqaG7LT7nLRzCJof7R2EZfEnULZuV5+nU
	PBtqRpCqbn/6hKRyYxufOFZ6oSq0Uu//54cmosZwxpXr2+5IDOmlmXbYlK/VRvw=
X-Gm-Gg: ASbGncukJez2CImcTp0UuRpBoOAgguwljH4QSd6QZsAKHhIVJuuBxFVfPQx0U8ZZiSw
	rmeKnjDjXzbgkjbdOStGo5Vc71UM4wFBPvdEpArXoC2ikODqYdt7zyfZlNVbxtjB6AO1yf41byB
	3UQcLyw7J6Gb6/+h7HfKIxZIkpd1GaoPWPZDf9UGNpRGqaqzo6XAXq4+1sr6aFNyfrIt72CMJpO
	b/qewsKa9OMFNCfkNDyTR7xiM7dplL+Af0OyZbPB3qbYuafRAvsh55E51FEblM+8VOaf2pv5mcA
	XhhBSdApQVZFM9DSNyowcqN8mV/i21Zk5NbqIStERChDENdhPJ1gsYLtBgdIHFr+F99+uBA=
X-Google-Smtp-Source: AGHT+IEKSM0IXh8jKv5O+IVSv4mJ6z4oh82fv68+fLwY5atxsSRsGcvPXRiQe2VBDa9mA8yPM7H+KQ==
X-Received: by 2002:a17:907:3f0f:b0:abf:6aa4:924c with SMTP id a640c23a62f3a-acee21ae83amr165748366b.17.1746009195599;
        Wed, 30 Apr 2025 03:33:15 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 7/8] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Wed, 30 Apr 2025 13:32:35 +0300
Message-ID: <20250430103236.3511989-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033317_857426_7EA1F28B 
X-CRM114-Status: GOOD (  10.15  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..6e9e78aca0b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -132,6 +132,12 @@ power-monitor@44 {
 	};
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -159,6 +165,11 @@ key-3-gpio-hog {
 		line-name = "key-3-gpio-irq";
 	};
 
+	pcie_pins: pcie {
+		pinmux = <RZG2L_PORT_PINMUX(13, 2, 2)>, /* PCIE_RST_OUT_B */
+			 <RZG2L_PORT_PINMUX(13, 3, 2)>; /* PCIE_CLKREQ_B */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
-- 
2.43.0


