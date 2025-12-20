Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA67DE6689E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Ju9j+YC1WJ2vWa+GZa2BXWls/TDlfesLoKVGyWNUzk=; b=VKoCiPSOAn1sKYsJOXO5dcKlAb
	HkN+WMk5g7fuTO6bRfhVVRq8G1eLTfoPa54rYPPQuV8lH3XBgUVPUub+A7OJNwGRGANWNkQsQDzHf
	8nR4yvAW62LAkJLTwgGmFqCmmgccJoVeNSG3xjmP/F8I2SrJo+cQe8/vlhEjBThnzkOKrT3k8gMJK
	oVKZCw7MSsz2ge3p2j3UmjRSuV1LsY+xusZjH6BOc8lmFU1x1E7l216TVAykTZ2T9zi97jQIA36Nm
	jwS8eIySQiH9BvkpMWPNLq3S6lc4C7nAFhHO5fC29k3QAsoBhf2xZrxYY/NzvrGJoHqTd0kEsBPAd
	80zs3Sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsub-0000000BRTL-3Wwd;
	Sat, 20 Dec 2025 09:06:05 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsuT-0000000BRQb-0qK3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 09:05:58 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so17625205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Dec 2025 01:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766221555; x=1766826355; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ju9j+YC1WJ2vWa+GZa2BXWls/TDlfesLoKVGyWNUzk=;
        b=KTujSGhgWOG8F3SMyv1qkQoaLsWX27OjRsux/r0hKgZ11SZDHS5hZmnW9eXVF5nJNu
         LrJb8wx2oDgvl4ox1yqveseDL+J2vFZECOiCKYn3bCYUHwKQZEXbb/n9UFpiiY86w15r
         HiD6MUmzKuwq5ks2xs3LE4HofLecaxSkH8TbJm2y1E9Z+lTqeGmCTYzhbQ0aeabjo6H7
         DC3rv32y75PMNdcoB2R6T0IwoTNak3Wma4Err+rxakwYhVSUDa3vtMx/Ag02HyeRWtj0
         clxJ2uxpg67semahL8azETRUYPpV7hHocOmE+wH+SVgM91+RqZjgSVyQvdu1ZmDl2frb
         tJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221555; x=1766826355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Ju9j+YC1WJ2vWa+GZa2BXWls/TDlfesLoKVGyWNUzk=;
        b=UG9Zy0xC2yXvmwipZ3iX5fbwb5J7ohVEafNeGDlcsnr8p8lzjNwOHgdDb0Qmsfyzkl
         IzBXBvXWc+im+9451gq1jX/MKt7A7cO4YUHBKofzIyntkNMqAPClPT/EdYc6qAWwMhFA
         ejdhQ0kVvFFhKQY7YRusLk38OyGqqZaYsV7cU4l02+cc0PO4rtT8uavnB896jSKaCnCD
         8DdFpCb5v9tBn+1or4k/8+pFHjBH4tNBinmeLbos+zqNwVbK6hCZdGV3IM5eLu17W54S
         tN6j78bYugmBofLhFQ3m7xUAFRDu5VqzGCDGgG/avf8OdcwWwA63r5g+bhEhEVB7Fv9R
         4q2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUB/QMJKsuIzpIc2A+8pzweSAOzYnWu64X6l7XA8MLPMs+DZbLGvjLGh+9ukz5ZLMctfBPW5wpBwWSVNWIQu3q0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvymo07KDJ2kHg0mmowr8yZfG8uRXIXEAyRf9Q6OIt6fX71M27
	sbGhyf/O6Ei/9bMJNfgOyUWbzVEIlmLlijd69SwvB5WeYiZxpGchFkddnK7I/IoM0sk=
X-Gm-Gg: AY/fxX5O9js57hwXeFHRbzcR6zMKAYYvBLPMgletQt+CLJDzanqFWgJtb0rQtQ0CNx2
	gV35tpMzidm3HavYU2wOtQOgBjwQwFfXXRKZBYQIv4M881d6xbt8GBcc8PoQ0mTgo+dBheAg61H
	15gNmfphPdNc6oSHS5Y0weR7eeRCpzi74Utj9bb1sNPE/vqsYc2+CHTB8C+lz29uC92GY7m36H8
	hLcXH5jDPGv9LLo33Jkv7KMKjWmjlA+1RFyt56uk0SCz8PKsNQiS0Ze9/9vuqz7tzj53tojQU51
	VbDJKfRbHuubiryefNSUvxKpOWGWkcSWiJ1YDmsPDyrM7MAXmBb7MrD+Ud5cM3dYlU9+rbRl87J
	OB6sir+bHSGgPAPxiP82pwyELBtOpjhEBC710oRgw3AeCphxM8210lyBZz3WIg9lwwV/i2BQAOt
	KmMDq2t1r29EdR9imaxJmdneG502HUu48O6yln5RZD1pdSG8pX/g==
X-Google-Smtp-Source: AGHT+IE1iVnBUqpj1iTbwtmkbTAjU6Y58uPgcEI500vkbYk4bozZEqi5QO1qW3InydBQVTDCJXx55Q==
X-Received: by 2002:a05:600c:6388:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-47d19557cd2mr51367045e9.16.1766221555250;
        Sat, 20 Dec 2025 01:05:55 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([150.228.9.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm88466685e9.8.2025.12.20.01.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 01:05:54 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 20 Dec 2025 09:05:40 +0000
Subject: [PATCH v6 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-automatic-clocks-v6-2-36c2f276a135@linaro.org>
References: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
In-Reply-To: <20251220-automatic-clocks-v6-0-36c2f276a135@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2739;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=h92o4zwYNSX6815UCmoJUrl3OjU4KjoLxMi/xiWmdfY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpRmbtPuXfNw2JAKPYzs1rhcAAssMDOJ5EMhC+b
 a9n1Uw1/bSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaUZm7QAKCRDO6LjWAjRy
 uicBD/9cejbAXAxcXgsCfHKp0zhJl64kTRLzpTC+2c+IDQndHym7x8DMGI57fTeMGZW3Amd+fnR
 F3NC609qaNexjPJRbLHQy4IoQvmikAmrple6ENuSaFFe26iae1Lk/GzSf5+kAkmkf/FHh87+gEH
 CozQ7H2BcVplfSO6QvApjfoDGMBjoMuqmA89P5hdP5dK8fGez8FG/wfIIQbf03miSO1AaR+uOwk
 rtI0mBShE29JCLUqFCOsZMsG0NyJi4AasPsW8ap2ACMJwe50rwHIvjDuFvvffQ1uf/DMYREsj3x
 aXbcAdn8ASKNEf0/7QpP6uww2RO6tvshK1ESczTqVGDNvL7tbAecAeYk7yR8FTEbqMiWH7/SGKM
 tjfHLlHCzlaRYSFMCdSIS0UdC953wvgJanvd4dyx0XEYX+zwKMLEAAWwfOru4yEf5YYpS6c3wcw
 G/JacgCF0vg+RP8hmr1UhlA/rCkpps2Js+grqjl4d3aF0FVdLNeOMdCZpI0O0uOQnjjKKnuCHmw
 pMloOkDvuJhukrvzDS5dO4fITuoei8X1OWC3F26o4E+FTdXPdB2J7V4kkLjVR/fKyzSGHPHAihC
 fGzycNMRAgwMd6Z8yo066VM7Hpqcp+jhyTPDQeyJhSu0sflctCO03gwFiPPP897Vr9HF4UVSkvy
 +y7nmadSJWu8SBQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_010557_323461_5DA349DA 
X-CRM114-Status: GOOD (  11.12  )
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

With the exception of cmu_top, each CMU has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, provide the
samsung,sysreg property so the driver can enable dynamic root clock
gating of bus components and gate sram clock.

Note without the property specified the driver simply falls back to
previous behaviour of not configuring these registers so it is not an ABI
break.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Update commit message (Peter)
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9b38c2248016aa65293c0abf9ccaf20857d89693..2e25eeb0c2590b99ef98c7bdac3caa0c34161706 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -578,6 +578,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -671,6 +672,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -1217,6 +1219,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1575,6 +1578,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1646,6 +1650,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1706,6 +1711,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.52.0.351.gbe84eed79e-goog


