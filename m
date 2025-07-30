Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305F2C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 20:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1tDMbTuCN3Y0uldNJTdwwCiPIYOQ819zTdnVjVwO+c=; b=quBluPWojLcKmPGKGnOXGp95hd
	B/0iTivxVfNuoxhsOD4XAG6xB8h11en8kIkLeRsQPfWqTQ4xOY8MMo+X9LJW6UtHTfdkedZnFSoN9
	MslAjoAhVQOE7/9n/Fpqh/gkATJTEg5rr2q5TU3a8pu7LFdNKktqoSf69opURBshrMs90Ia5PuB2O
	KGmFDTAKp+XmXbA1+8PRgC3ET+2OL903JrUSrbzulvpU2w6p1wR9I8M07G5JjhixiJZNDt1W9WQmi
	F+cA51PAvmQ/vTYVXk1pHdwKmqIgDMEvtzVGCwqBVIrF/NT3RN0EsGuGlkw0e2unp/LmMayQ43n9S
	eMzCS07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhD5y-00000002LcW-2oZN;
	Wed, 30 Jul 2025 20:08:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhCrN-00000002Jbd-1LOj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 19:53:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b77673fd78so115624f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905188; x=1754509988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1tDMbTuCN3Y0uldNJTdwwCiPIYOQ819zTdnVjVwO+c=;
        b=Xixb+BHWHrenkP5kE/DoFyU+RrkbOBHjiOVCnNUcFBe9SR9Z8J1RwJqcLMFoEFux0u
         hLW2wke/p9rJMeuHp1lIl7qRMFri5jmbeJYNlpi3XqtZ7WXA2srtWV1tUoc4eLLPuvLO
         SSB8aEkUJ6j6BVW7V52ad6yBfVisvhe7Buz/zWhOj0Dlhy/8V21UKM/brwnK7Pv43Gca
         5V4aYd1HGvgqqKQS+xc5fTXXgoCZ+hcSipB3yD9js6dF9bpRXNNnEOyayebW5UB9tu/G
         wxqK3OLnWZYCYKVaPrnTPSda2iMHBengVA0ANaaqZ5luNDZFK83Ak8ReLLuBCctM1T5v
         A+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905188; x=1754509988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1tDMbTuCN3Y0uldNJTdwwCiPIYOQ819zTdnVjVwO+c=;
        b=kDEmvjAF1gNrgErgtR0CO0rOAUqSxA7CL7ZCLWdHm4HJxc5SQ5qFusEUST95b2T7Ni
         s/IDG5dOW7RJrTZg3RhWY0u8gERqlgudIQ92bNf02EVpA/C5owT8GH2vYX6RglXy/FRW
         20tSH0sBMpFap9gYzLCE2fRJewU0dkiG8q8pfWRg787CPz/0HSxPCxPReTzfoXyCo9Lb
         L5Gfys+7408sWwlrTU8886KCTtD/lR44lftyKo4EAeTfxBk7TT8lWQ4j+o4IO+YvcqoR
         g5/Dr11jPvSOEiMXuLyRViq31OuoIk6bfbWC/0KUeHewlTLSN7T5TslZ88kfSwGB116J
         Plsg==
X-Forwarded-Encrypted: i=1; AJvYcCU3mOk/ueECD2iMZZuJRlR21SW4hWvOrNvpaeK3cyv9hI1uSM5K34Nyg4VITBw3uLdAxGFWIGTXTZhIjFLC0VeC@lists.infradead.org
X-Gm-Message-State: AOJu0YwMWkMEl2xjjU8YpmHjnIetfkgh3N7uq4vg/E3kl5plNCeRZW/P
	N5aEqCtw6lAOuBO6UFNY1wpQ3T6Kg76oO+Fksno6MGCUnZQ44+R/gUAjMtfuwdO7Yck=
X-Gm-Gg: ASbGnctiPgh1CzPRmMhmZWUMQJaMB2KFmDdOzggLVsV+OTnhSIbM5rcbMXBUioX1ITd
	9ttc0+9sXP0bWVt86PYa12l6vkXnHsr37r2pl54lFIhRgKAnPMMmutAkj+Y+p036dH1/YqsOS7q
	ZWNcRPF8yQE4F4SsbMV7SjuRoAZsKdp6gEXpX12gJI+xssT2/LjFwdbdVmeriEz++mK0yv+m6o+
	xvSc4CMRog2qIfg9Re8L8V7MzDNxFzjltrzaXsXR8oqNpwNqxR3kGP83tvz4uxBfZW4MTd2/gw3
	zpgjrKBgzJFaxSoMkPeeBE6QLWuzk7ESQAMC8yNkxlVc1k7qAcu6uw2FxRSYv4CFYfCRS1c4Uum
	qX8iffuqIS0ql5otCmTb/8NU4JMQNQojxAuFFcjECUE0EUx/j
X-Google-Smtp-Source: AGHT+IGRYElrDpNrl4+NOhTLGZelVLohbX8W6yyY1T9P0SsEBWFP5ZTfZfawxMYWXsxXjtUKCFrSbg==
X-Received: by 2002:a05:6000:25c6:b0:3b7:8984:5134 with SMTP id ffacd0b85a97d-3b794fc0fb7mr3760889f8f.16.1753905187980;
        Wed, 30 Jul 2025 12:53:07 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:07 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) description
Date: Wed, 30 Jul 2025 21:50:18 +0200
Message-ID: <20250730195022.449894-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_125309_357294_146E3627 
X-CRM114-Status: GOOD (  10.82  )
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

Referred in the documentation as the Software Timer Watchdog (SWT),
the s32g2 has 7 watchdogs. The number of watchdogs is designed to
allow dedicating one watchdog per Cortex-M7/A53 present on the SoC.

Describe them in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 56 ++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 3e775d030e37..12ce02525ae1 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -566,5 +566,61 @@ stm6: timer@40224000 {
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
+
+		swt0: watchdog@40100000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40100000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt1: watchdog@40104000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40104000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt2: watchdog@40108000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40108000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt3: watchdog@4010c000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x4010c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt4: watchdog@40200000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40200000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt5: watchdog@40204000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40204000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt6: watchdog@40208000 {
+			compatible = "nxp,s32g2-swt";
+			reg = <0x40208000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


