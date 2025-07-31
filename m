Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A1C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z64nEAaTCVKG57zoeUfRDIzBYeQhTygoaGUdQv/8uC4=; b=fb1yPKwHZyiXVm20jhAceoLYzK
	Z25S90rY0nk6BDzY5FQAsRdPTwWgDXU9FeTcCt0CFwDSYu9cDlC8wB+qjpqIM64eAPagGjH/MNtQ1
	MmwkJRGA+nTePNnZy9eAMGsfjr/wZ+W/6HskWbITMH3tJ5wBFUmy2Uk001eoOBOfNYKRv4tCKG2Yd
	LKnRyXK5H9WNdhO0U8t6oAjtbMs7k8kAMk5og7M6N8mTv8VDaguBhAqfZUIksJw841EyJgm/HjUbv
	AjFzhzcz6xS0ZQaGHf3rJ/lIRXoqVRIV4XUh9vwTEwsXydpcJz1B4KpIsA/G3zeCtDOgIw0xaMQvN
	aEMuA36g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUYa-00000003sje-1EVe;
	Thu, 31 Jul 2025 14:46:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTrC-00000003lki-3top
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:02:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45619d70c72so15755125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970525; x=1754575325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z64nEAaTCVKG57zoeUfRDIzBYeQhTygoaGUdQv/8uC4=;
        b=i9c1MaVPGLwcHxfyvjMkHV5jWFb/Aex0jY4Rr0ZOCfI22ISb4NXqcpjYiYIPFV/pR2
         dtr+6PIauds5+gXQ3CVxh54uSJgHT2U4byeiccPZLM8FkY3h6JNC9+ZsYl+zkYHV2W4j
         22bgXbBaqT00+s90jiKjec+isLc1NCHSMoytRD28kRkEsidKczykPRhouYzEAztavTTb
         Yy0BbvLakFDKL+2pDjY3VB12SRdupaJgJjm9nX+zbNcfaHHl11BVlU8cPZVtLeIYLD5w
         jRlT7Omqf6JM9dWA2bN26bepJgUnzLZ+r5vmiwOy9gzshb3fIUOfYcPE28LcVyBwbIZ5
         p8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970525; x=1754575325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z64nEAaTCVKG57zoeUfRDIzBYeQhTygoaGUdQv/8uC4=;
        b=Jh1JHl0nEFk/KHLfKQDrxa0Umh6AAQVqhBAnN3Psca944JI56dyiYorA8NEhYKxbrb
         xzxCq+UKxWMhMV4OQyZXNWTMvJyCX/lHFh+HBLiAFYhnJj6E4uCb5RPiAoMsa+uSxbsf
         1UHY6a+9siRgTsDerkFt034cLPfI9Ii+3Jf9ngbqn7zsl9Xsd/+z+UAU/kjXX8jAQm8Y
         QGVWPdhvjPYd2wD/9HThSsiH0mYLk5l6hKK1TbQDaNZzon45jQHcNIM/ytRR5udM8vK9
         sAu52UX25WMHb7NKODqUFcdzh5A+V+q4q0svbwUQnAexm6XYCFilQYFk8WnRNnQ5OAY1
         RhfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNunVgRZXmZMQKhLsDNIZcinpDj5qeKM/X6lUkRkW5EUttY0LG/dC/M0abSodwhKaSWgr2D3crMaV1oZvzp/Av@lists.infradead.org
X-Gm-Message-State: AOJu0YzN87leTz4cemk0zt3fXJUyqggJXHZ3WTx2BleXuwsIBKqMOACS
	6v2mjUpXb8v1QOFU5OKjOX9TXLlSFjzbKcS/L65Q0cNh7BY328SJh8Vc88FPBAS628g=
X-Gm-Gg: ASbGnctKIhbwOvYxjkoj6WYr5Hy9HrfXR50jVmm86N7ZGsuj3EC21YaPXXZ4NTbem+X
	BxcqxxRcsK/qfwF6n7F0tT15p1Uc3uGl+qHbcg4mABPG4jWgFeS8Lz351mp+6OpUaHnNz4v9EZz
	fnwU87qdN6V1e4zUIGs7nftMYIxFR0ucIAAD3OBhaMZRZW9VketZo4g53op3ZDctHgw8BIkIBEa
	Y6sGLTfmC/9mzda7DitSjqwJJ1IiPnDtUDr4MYDuyOViW2vk5MJ8tkBwuniJ6zOEfTabbzVeKdb
	fketSA0Qo1yo+Je3t0S9Wus8Y95lq3i/gtWTKqTDUq9uyvcFl9idshZTLeFIbzm8ibnVmgYEBHq
	4fOYDJOzzhjP2fUX3HqlPDemFW1+D0kDelWCZFprivYDyqVsl
X-Google-Smtp-Source: AGHT+IG0Fg0obv6QNkBb8H8gLrRktxs7boJ84AHt095fewSVZFjevx0sKm5v6FUBwWIQGMfsDR/Uww==
X-Received: by 2002:a5d:64ec:0:b0:3b7:8cf0:4b2a with SMTP id ffacd0b85a97d-3b79d4e3623mr1743875f8f.16.1753970524846;
        Thu, 31 Jul 2025 07:02:04 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:04 -0700 (PDT)
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
Subject: [PATCH v2 7/8] arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes
Date: Thu, 31 Jul 2025 16:01:40 +0200
Message-ID: <20250731140146.62960-8-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070206_978198_0C8D47E9 
X-CRM114-Status: GOOD (  11.51  )
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
the s32g3 has 12 watchdogs. The number of watchdogs is designed to
allow dedicating one watchdog per Cortex-M7/A53 present on the SoC.

Add the SWT nodes in the device tree.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 96 ++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index c2c986f03986..0ceb0807537a 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -374,6 +374,38 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		swt0: watchdog@40100000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40100000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt1: watchdog@40104000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40104000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt2: watchdog@40108000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40108000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt3: watchdog@4010c000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4010c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm0: timer@4011c000 {
 			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
 			reg = <0x4011c000 0x3000>;
@@ -507,6 +539,38 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		swt4: watchdog@40200000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40200000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt5: watchdog@40204000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40204000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt6: watchdog@40208000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40208000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt7: watchdog@4020C000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4020C000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm4: timer@4021c000 {
 			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
 			reg = <0x4021c000 0x3000>;
@@ -623,6 +687,38 @@ usdhc0: mmc@402f0000 {
 			status = "disabled";
 		};
 
+		swt8: watchdog@40500000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <40500000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt9: watchdog@40504000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40504000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt10: watchdog@40508000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x40508000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		swt11: watchdog@4050c000 {
+			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
+			reg = <0x4050c000 0x1000>;
+			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		stm8: timer@40520000 {
 			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
 			reg = <0x40520000 0x3000>;
-- 
2.43.0


