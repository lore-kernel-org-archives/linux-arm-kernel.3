Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC2C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 19:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJueEuqTtjiM6Dim8VP7OcBzmxZWJQ/hM96x+rO92Gw=; b=4EtphRqF5TMfWSwwGJbyX/3ERp
	4+86YIBmaNwNfgas8j4lxs7CYwIDJeEw17ORzO3NrPy4e5E98W2CZqzaqKlePFMcwT0TdPPtiRUKS
	s5PbRy13Z8dXqxipTLFsJjP0p+ghyp/AB0A5kX5jbkzOkLforItDfvkfA1TuhB+oHs7x7kT6ZwHEZ
	vswRZ/QVKjHSrWi/F0fWvlRmQxnotv0ff6WpfR/mOAbgIHQGPk9HvzlVos42kHrvJ/qDbJGx0m+uE
	iMxrojfgaEiki5h8metF5xgBZPy8dlmBdiW92N1u46CxHmVV87aaZwkOrLSs+RkqJHxUNIWuPMfLO
	BI5CDQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCwE-00000002KNe-1ZV4;
	Wed, 30 Jul 2025 19:58:10 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrI-00000002JZE-1IWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b78bca0890so117440f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905183; x=1754509983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJueEuqTtjiM6Dim8VP7OcBzmxZWJQ/hM96x+rO92Gw=;
        b=QmLoDi2shWlbHFuVo9TPHsqpfvqGdwZKzCvN14a86wBiS+B3Ie9C+FGaqQnX5m/Ir+
         ofZqKq2XzErn4SCQsnmHl+kyxDiEU9HZUbiKEz8CA3uHP0XC8n0ccVvLe//1pRlhJwWd
         g8GqQ78dAvZ1fSSwqhLOLRA8oVwz2FYbNEU/Osm5Onmvja4GS2iJMZ2FBzUgJxTp74bA
         IaFdG4cA/sK/rIAZbsja1WhM4s/nIZ/9LitpVYDPilNivF+gJ/b8YZVYOIQaN5Azi/zZ
         9jWi9Tql7UR/lIy/FsHFdbXBiyqASVVCK3P/RvU0L20dUWAQl/7idGCc67Eh980gUywd
         aC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905183; x=1754509983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJueEuqTtjiM6Dim8VP7OcBzmxZWJQ/hM96x+rO92Gw=;
        b=WwPiupWkGSjhhCGaCowPO2q6Zcad154C5hJ8pq3gCxhB3pU7elCGbN3WjUsUx/8TBE
         Nvo35awnXTs/ay9/hpi5shHpB/HFRtcr64jhOSKz3btoXT08lR9MfNiVvRFShJWuoNJN
         rbl9EM3sbP7kVvdSbtfzK9I38rCbP3FDzCZB9Qw+VhIP2qPdTAMdJoMcmSuVhE++QB3i
         dgCgqvcEiGrWhMkuHgUqnvyBXHniLMp8xQehyrrf6udnpTuhGnp5/ITLAvxQLzCxy6GF
         i2F+etaoHWhjEMwZudj3Z2ni+nkPdKwt3RObpa2LKhrObGOfWbwuQd3ey3RO/4XEAgK6
         M4dw==
X-Forwarded-Encrypted: i=1; AJvYcCV1DOQUj+NVj/waQOPCUA4UxiPBIw1+iME7zTRACBmsJhTHnriBMZocwNDb/D8HzTJbIVMM/PStJ1SzXZZZmY4s@lists.infradead.org
X-Gm-Message-State: AOJu0YxvJlw+KDy/hQYdGqNKCDHh/XM0FQH4fCRi7aR9fL6JBsKfH4Zw
	2wJVx6tPnI2yicho9Bae6qKVBbqUi5E9h0//16p7RkJ/tex3Tk3CgdmF00RTdHx5hlw=
X-Gm-Gg: ASbGncvrSTh/BkyEyb/0g8zTIt3F9Z6ZjM+Sh5QW9NhS/2DCh3zAGfskRwcNqm9SXCw
	3dTyc84SFHxC1PYmVRpJp9DYx2to0dkR18iVM4MsVNdlnuijNhnIe8RbsNbJCiyCxVw97FV2cOa
	OnFa4RUv7Muvm7PN2oUBfVV1TD7IoLSQNlNuFoUdX6NU0ERKjBdj63Y9c7tTLYOvGphMDlpqp7Y
	7aNJ0fnATCgSWQZHE3ZJ1FWBzwLAy/4Vijx6j2nSYuI7FBrhsZjc7CyuJ2XyV69q3ja+EShQc7X
	Mm86gesGwQjAgh0Qrt+uQdcQQkAtdaC1DRogICzi/c0/zaxj6yrjCHXj1dD4bmR6/dXo9jUb/XP
	i99xdHSXKBVMPGIfXOt8SXkwi6zGj5iBMGA0rPDxec1Zuv7Z7
X-Google-Smtp-Source: AGHT+IF7rvI/lJ/fkpm1P7rRxksLVW4UNZm0omkhDcU4fWbM+p01RshTyd0V7avWFg7SQdZZGsyTzw==
X-Received: by 2002:a05:6000:401e:b0:3b7:9173:6948 with SMTP id ffacd0b85a97d-3b794ffa8admr3769630f8f.49.1753905182660;
        Wed, 30 Jul 2025 12:53:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:02 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 1/8] arm64: dts: s32g2: Add the STM description
Date: Wed, 30 Jul 2025 21:50:14 +0200
Message-ID: <20250730195022.449894-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125304_346855_5B4D3E14 
X-CRM114-Status: GOOD (  11.61  )
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

The s32g2 has a STM module containing 8 timers. Each timer has a
dedicated interrupt and share the same clock.

Add the timers STM0->STM6 description for the s32g2 SoC. The STM7 is
not added because it is slightly different and needs an extra property
which will be added later when supported by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..3e775d030e37 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -503,5 +503,68 @@ gic: interrupt-controller@50800000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 		};
+
+		stm0: timer@4011c000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x4011c000 0x3000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm1: timer@40120000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40120000 0x3000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm2: timer@40124000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40124000 0x3000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm3: timer@40128000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40128000 0x3000>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm4: timer@4021c000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x4021c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm5: timer@40220000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40220000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm6: timer@40224000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40224000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


