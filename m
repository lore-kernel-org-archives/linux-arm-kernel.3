Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F72CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+kNxvGMLv8nikKD5V7gvYAWirshtGm1lcEv3uAq4Bs=; b=F2J37t3VZYo26cOMSzWQbN6d5W
	aLJgiCeVH5UrAiPN+EnsYz2iSq0JczJ6+mVbTZAbJTl/KBSMn/EJ9cBVjMvLH3poDDDkYpB/pVI+d
	woq4H6mLvebDBJUSR2qseLGEHZbr4oNkU8QxCAHtx9aykQxMfEZiEF+L7kk6J68hkbRIJ/Vm6Gq5u
	NWmEZ1WtJMAJgBVPpKi/x2O/1uxhZSBJAfb5NHdy8Jkxx2MdK4JvTc+W33uayK7+RiODVXMDTADF8
	BK81cXVo5LGjIneJWctIf6uqzCGrayFblvxOG0FPoPm4a6LVmGCfTfPflQbXo1w7968HG/H3UfMNU
	ym4eMpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISmM-00000005ZPX-122r;
	Mon, 10 Nov 2025 14:21:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISmJ-00000005ZO8-3wXz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:21:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47778b23f64so8127685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 06:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762784514; x=1763389314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+kNxvGMLv8nikKD5V7gvYAWirshtGm1lcEv3uAq4Bs=;
        b=RC4m6DioQ7UR4ZNCeAJuo/CZ138q66a37yyA/0OyE0z+RQAdadOPkLhmPMy5xCajAL
         OZjvKU48ZBcPBxHinZByZqdoyrjk4reESAFapSqWdKrHzW09zdO3Oql2IIxjXcBKgYU7
         UwSkFNEVST7tfvvu0eZf/3khHOpK1A5Qed+iLvzz4G26dx5vAfunz+NmTz4V5YMM9yMT
         5aJfiNPaAmXMRdcfnkBvdpyxAzvJSh8hmYuBtOHiMrSSvH0NEm9UHN49VcLhq6uPY1PJ
         B1fQz25usfqvW24f58kVLcVco1F3kNsJxUmtzwjJ0Mz94x+UffKM/4qVEbCAczkBpfNM
         Idlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784514; x=1763389314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+kNxvGMLv8nikKD5V7gvYAWirshtGm1lcEv3uAq4Bs=;
        b=Z5IMrH7VuFaldRQdVuyndsLACOjvhI0GVKrNj/2dKtEM+94SvyYVqK0W/Ak27sU0SM
         HLTBKhkiEdaAuwRr+qbCajk/n1qCKJThlCSn3jN1C38Z4yS9PRULWD7z8KUkFRlN6npk
         oCtmDBPkEGhzG1xGCKSzckqdPd6gSMgVnn9HX7CPMPRGRPI0QRMrpl+HvJjwCndQZycf
         hcQbQsacb1qbUxBlyAOjdULVwkjEMYUH8PhnQEhJ3sPaRk/qgGOKQqzp+B7c+q8NRq6Y
         u+2Dmq6jHQy+NrI+RNmIgiQ8qAPC2+nZaCe4DHxtcvtzFgmmraaoAS79HG1eXrsuApT4
         Bigg==
X-Forwarded-Encrypted: i=1; AJvYcCVdrkqFL5yQKq31r3Ars0ZW9jWg1f+uyqKIUqhhjnsZGUFQZncia4losXPAEUTJIV7LIIXBs85KzXlovj3r3+hP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv174pWSniopsYjXYSoNwuwhZ6sF/o6L/6wxFe2LoOxrKF3+sW
	k7oFHvhn1ILAs997W7+fd1F5vtNFtvveeSvTvsMC7jXuPk3LgDDNnlf4Ioq7yAbTRS8=
X-Gm-Gg: ASbGncsNfgfuw1zVNylVykHk7kUWqeYc5UBbaS/Vrx3+6KhGWYqphUx5PEbAMX6Homw
	3dueSCJBw/vcDhVVkxcEBaiTpFvUyTaWml1xexeh1xTu+mWd6E6Q6GwuNUoT+1xeh2DKdnxT3bb
	4rxSFZIQmIONBEUOPUkV3RnbwAPl7zCNm4gBZmqdU2AaVgA4xgNUIBwenlUUhetPnzI0yrqRPhV
	l175uRgI2+KihAig9hmZP13cDJeSzE2J+H09B+MHIlqXyuNUUDuFh+DVClPk/Um3oZ5fN24f3yq
	AxdAlgczXKv0KYWrt7Ha37UqeuCknjSr2ZCa3ebaOnscFXRUk9Y/23HaPveErq2Evm8+6U3DbOg
	D2CFoG25h2U39swv6Xyh1JjrBbNYK3sqbQxJ5LYwuoimTTGDaftMV+PrBCcvJ5bS4yTZHs5wGdr
	RZd4DfjiQFby0/8xb67hq9+2LgiD9pFCCxSUH7Nq+8
X-Google-Smtp-Source: AGHT+IFs74p1QlslCAvC8vOV037XOkHMy0WjN9V1up8sDi5c/lrPsdoENM4mMiP24XnD3NBbIn1//A==
X-Received: by 2002:a05:600c:4f94:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-47773293992mr80137005e9.33.1762784514106;
        Mon, 10 Nov 2025 06:21:54 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776a953414sm104369435e9.0.2025.11.10.06.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:21:53 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Nov 2025 14:21:41 +0000
Subject: [PATCH v4 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-automatic-clocks-v4-2-8f46929f50b7@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
In-Reply-To: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=ziekP3Cu0EpRasXBxiEfoJmDDNZFdXrwdJ5OCgftxWw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpEfT7FGiMsEstVCKGb2cNl5JOVfCu7fpvJVdBw
 C5dI2aDaLOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRH0+wAKCRDO6LjWAjRy
 ukamD/45GTYto3C1g00lUnggUJ4361CD99eYDzuffC3kpS2dwn8cIlO4NMGs+iwXuEoA4RlJRRV
 N8oWpNmkRrHZbyjp+Lv5OlmFW+5XbSEv9mddsGjHIZvuZFZ9uoU+ATY4A7Qf2nGHeO5OjQeig65
 bbrHPLbONata4oiGav16Oeds/6H64Ji5InVgfBn+FOUq8H2YgYBXlS8h6iMpT202wiKSFLachLU
 2d9yGIiIQHqyggUORvWg36wtzI1CzdgxT2BAeJpI551XKqsD75puKhvfEV3XVf1/T82D/3j4LTs
 6jKPtX74iCKYugZjFtL3RAlG54coaAWvfveuX6jieIH4IUVNf4aXz5wBGZco86U+Smh1REx6ieD
 DSXzRXyjXZhXYA7atHw56vnEysmmE+MpfxgE1B9F5Cu3c9wlu1uX+gafvj6lxh7CrtgJ6uhJkna
 bJoU3Nrs2L7vGi26dWNWpAOM1SRG7Oyvg+/WzrW4aOsdVfjKnid/BYxEbQAopEmbamp9ao66I7D
 cVX1xy97hQ79J9Uy37F78P0JyL1v/Ydoc7UrK/2NcmHFdZEtDdVBfnbKMX3co7Wj11SkrH6DMY1
 5YydgXH3zTlCqzbQY0GHt/u4KzjIpPxnciTFZ4WvsnPdbT2REmmRLcMcfnUCyllQnQVjA/ZZZc8
 5X5ejS3tzKBfKYw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_062156_010334_00D35BFB 
X-CRM114-Status: GOOD (  12.10  )
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
2.51.2.1041.gc1ab5b90ca-goog


