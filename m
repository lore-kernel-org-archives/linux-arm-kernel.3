Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C9BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 20:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTngrYfAUFTcMg616558EOBLpim7WtyStRU50Tfvew8=; b=h21EBT26ZE5lzAYGV3irVJD3IS
	PRohXYMrgplxEYIGu38gT1ioK73PSEbHDadlLLKqdO70hZ6Fc9zAeqTZCYLfEenMfSiGc7FtwNHQL
	wIE/0WhaUO6sdEiBsRrtELpX/BIyLk/uuWI9QCvfYm0psyN1IhgAlU6hFmRtpo4K8FpBSroe3EK3a
	mAIrpyvMat69Y9b2Mb1y3EiyMipkkK3aZeGID1BrTGXYS6kvY5Zr9oCbGJWpyzAdkp45nh408vv78
	K5COJhCwMB1Cv9EEqOD7Ei5BQBqgqwFM+2VnclYqJl98sg5rU/6YSTPuG/r1bTpjmsNQjZk+2fkk1
	SL8/AN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFefm-00000008nta-2t7j;
	Sun, 02 Nov 2025 20:27:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFefk-00000008nsp-1y5l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 20:27:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso22054765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 12:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762115251; x=1762720051; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTngrYfAUFTcMg616558EOBLpim7WtyStRU50Tfvew8=;
        b=cfCpi8/BpDU/yM9boWNVl4ugqF4ROLCt/0lk8b3sLTpGfSXSZJGjRYMv1X6R6oQAap
         HyvWS4V7SDpmtN8mM2fJpCID2bQRB57kffBhG/52CXkUuyUX5ZY3+5bJW/lpXMIOCnS2
         kwFQFlFXdX1aNjXFvU0kAWjl8tgpns8CBJZ1Z53oThVANkU79mxlnuIImh+GxOk8CgV4
         ZUi/G2673id/7e1ThNOFPu/mYeeSu1dy7PbT2OUNN0Xk6tjZGx7JD7L8V7Lda/Xt/TGv
         B4jlE4Ignc/pZYZKXLAQXDnfN95p8nARfHr9UpgseCPnnbjQ6gTZABinSDfsQnzd7SrK
         gABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762115251; x=1762720051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTngrYfAUFTcMg616558EOBLpim7WtyStRU50Tfvew8=;
        b=ltnk3EaPGXNUORV7pwdJHwtb5VHoQnPeF7NrfwIp/wWvAL+8TkEdCTTNEvVmfzba0b
         thTBj7tzUdVKGOWad7MaxGejf6QK9yv6wFAT/7ez+AOrpxPqImP2zI2CUNdRyEmxEPq+
         jBO93QAl8C4hrImlFapuxT9S4N7DM7flKVo3r7AiT/9J5la2f63+LAF/XxbrdmwTB7oz
         MgRUWIggb4+bAJx8/dleMqZkIIxL18U8YdeNDemzVAX/JCrBBw7+ZwFW//Ntgd3sfzry
         iLJMUxOYxcVoOgcHIZsKkmTEhCQMxHn32HoEm6lsl5KL83bZmkiAB8b4uqCRrAu9apt8
         I1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUq/Ig1K3XI7vXijbQtWRyU08koo6i0RrU1/C46OT79nhE/MK05b1Y6Ffbh5sXI36WmDL32ZBKldvRwvSeYcDMZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ/9bOY86QtBCpQz9k7LOfXt52XmSxRWE8yaUfuMSTqRR5XPfx
	GLblLtxyWI4/vV+KHrSXcZwlP68KLdG/l46MexJ80MOLAt23DD0OwNpQOF9HxmdfWkg=
X-Gm-Gg: ASbGncuo4RI5EZo1WRTuFCwrQzrDHydpY1Q396LqItjnhWdteQf6/PJinjZNABhNz5X
	/k/dF0YIZkPxT6QPsot9RdbKbQ373luNLSE+6vbPA2v6ZgDFoQr4idJ6PHVEcv2T8pevzpYeCbu
	IFP7Rz7gn/IeYYWtTGRBzX/LLg/HLDrJhAECEOTj628Z/dQDRCgRiaD+/JojvQa9wZEZoOqweRC
	OYg8iTQQfknV8y8SuPBDMJGKeCEKWPKfPENn1e6Mcb6E6+5sFnHG9iJ0Qg1fo12XvJpSW5/Bic4
	Ak79GZTH0WaT4cP8nzslRALGKquql5hKBLT58N8eUO9VJM/oC3thBxjdg4UBul61J5SX+WWWJhC
	ExLzkpXj2R4iajJgsucaNrsw5x3HKQvVJOcI/lJ1qcvPrLxLFeCOh7rtSz2B1KNJ/NsVoiEnyrN
	JGXth8elH5ncgH27IswjLJPmln1H05lYc=
X-Google-Smtp-Source: AGHT+IF7iJ+IgLBUP9LE7khd4BTeU79k3SW+Aq/qgYQ2ReUgs8miL0YqahEetcsdRE6/eSU7CMke4A==
X-Received: by 2002:a05:600c:3489:b0:477:58:7d04 with SMTP id 5b1f17b1804b1-477307e214dmr92032845e9.9.1762115250618;
        Sun, 02 Nov 2025 12:27:30 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c374f84sm114664165e9.0.2025.11.02.12.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:27:30 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 02 Nov 2025 20:27:15 +0000
Subject: [PATCH v3 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-automatic-clocks-v3-2-ff10eafe61c8@linaro.org>
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
In-Reply-To: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=nN8tTkTawLljwHrR/jD0xbk9vXmrtVCl9Rq1rJpMFpY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpB76tYpUV3fOT+rf32etuSr6akf6snwSSeY/JQ
 uXlfMOQIJGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQe+rQAKCRDO6LjWAjRy
 usr2D/wID/WRNDiqnQlsa8OyzPlkf0/VUyOybWhKF0Kj5odKclbYF2mxiScH+cIq9O0KL65XXN9
 BeN/ur987Dump6bm/2RiO7OKViS6igi7fbZrb6xfY8yHXM97A3x8QM+s9y/K6HNTnW3ZfCbceeE
 qCWA7BQgey9BsTzvr9WBYq06XAVsqujR/vhd7U8xrO1ZWwYSR6os0mKeZ8iJIRmQv28Bbvk74I4
 RWP36iDmy46mIZCjcWQenVKLLB8wd//NzgF4+twS71jMrGyTCAyFtAkLYvjy4Hm/3QF3JD6IuDw
 SPM2IaGq2C2NRTE0P5HK97fsPI/2b6A/dYQpUcu8rjQdpBUr49RP89Azhn601bhgIKqydE0GZjI
 vQuban4CFg+pes9d3APbuvKQFVDDUpQWjTPLEpK70zw5sogUgzXlfXUA+zcpmzDeA2GpPo3YIPH
 p7z54RnNqv9HTnSCERNP5CqVdUIlYCVsVwk1E/v8ZLVy2T2yIiQXh/92tpgq+lKeZ7SIjBzHMBf
 78PLsvVuoaL4lDZQghUB8GBNXh6MAtg/eKTIpkgcTD53qPK3x68rMD0uImtxtqGynMEutGneU6k
 CrysUXcf6J4nvDbrssGgpWitEon14PdRMFpj1YwtRedtRksDMmmZZsJ54fgoYUb8MGwcQv8Jabl
 +Hfbv24jEDwvZGw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_122732_537538_72E7B392 
X-CRM114-Status: UNSURE (   9.70  )
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

sysreg bank contains BUSCOMPONENT_DRCG_EN and MEMCLK clock registers that
need to be initialized in the CMU clock driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..c39ca4c4508f046ca16ae86be42468c7245561b8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -578,6 +578,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -662,6 +663,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -1208,6 +1210,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1566,6 +1569,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1637,6 +1641,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1697,6 +1702,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.51.1.930.gacf6e81ea2-goog


