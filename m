Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BA4CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 21:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgOXG7TGyvNy5LNqojYEnuxpJ1Y18mLxSMAS8yysg9I=; b=xcKLEzbVvJMakbFYHegT87dXoF
	7FKF0NYTb7wiCV4zx7ti8lxJda/jD6taTtRBOcYoyjT/UYIHpy6gpJ9PS55MpI6Ctfv09rI4IhvVb
	BFhqvpdlSP34X0Bsri1hzfvVdhT+jc4TtYnh+/ulyN5yeyy82Tr4wpiJMePnmgBDldWyAF4zoC/QE
	wYnJdYNqvnEBWIbFsu4OfetLy6dkrec6CocAhSMSqc4hBeRprnrbLveDcA81bPuTmvmOoRz8EqN2Y
	Tnkyccp049HIlSTY6E7dlhS1H9mFccONbtU7groWdflYIYJhGLqeWejcbMhZGweZCy9ATnVt6yEjV
	nBpCR38g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDkl-00000002xzA-3Gs3;
	Wed, 29 Oct 2025 21:30:47 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDkg-00000002xx4-0MbP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 21:30:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-427007b1fe5so257617f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 14:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761773440; x=1762378240; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgOXG7TGyvNy5LNqojYEnuxpJ1Y18mLxSMAS8yysg9I=;
        b=Ih21r0OlPuRl4Ep0ZcCjcWijOPfrB1umQNBbDxnxU8wM2sJ2r+mkqN4dqDW9X0rLrZ
         nCiTxFF3by1zkUC+IDqhv1fWkYjbBXnEGE/eWXPKpqs0MJTeR4CrGhLsP9IwzzcAefQi
         /UQc/vowGjrB22SD3IILPcRrrbAIRaKsChyOfLNSh2k6/a3cY6qMA4Y9iomzSNlqzezP
         tJ+EnTp5W4HsRjoxYEEbk7mBEaHZr+JSYG57qk6K/Skd9e4K8xN/PdaeYbqjYG575oy0
         ndiqD2VOPdD5Nr2+xaHh1aHrok18VNHawOlOXjqrh6GkqXp7CPZzmF9x/oJ26leqN/pf
         dBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761773440; x=1762378240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgOXG7TGyvNy5LNqojYEnuxpJ1Y18mLxSMAS8yysg9I=;
        b=lAwn48UkA9eu+asx5LiO5co6075VuUf6eXuqcfjFqXnY+jmCFCrh6APK3+4NanKJZq
         1ZcIRo1AnenI3MjpPCLgJfSxCov7lvgJyhJxsZr6KkHvD0OieW4/MZ5KBZt4LK/xSZSC
         E+xx3cvnwocFfsZMHW220JBG3wYMPBODkgpHv64FhLbOmVwIMDtrSvLSxsES+EA2lzDY
         ZudtJCC/tTVobA/zjiy8lWZlTu5JhEff78FRHpuGRWWQlzY8IicTzArBM/iNmlBrxqk4
         rhK/XsYJcZ4vtTW++BPoQchshl8Rrbro5Lr2uE86TwNj7T6cWTW7N1WuBIQUnO6lcToa
         k85A==
X-Forwarded-Encrypted: i=1; AJvYcCW5UJ6/Ns9yuaGPE0b5nLmOIFPazL4TfTdvByaEDhZ6PfIrRvhYOROQhi/oUzRglxtkUt356ko2mXF6yr53EZkR@lists.infradead.org
X-Gm-Message-State: AOJu0YyFcv+BPb2iBhSAo3Yf8uT5mEN9lA5QQ7n+870v7JZph4aKXepq
	SxltSV37PJUebkcZIhCPTwFvuSFUNdiytF9XiVHiNizAOh1mmsqSihAnkeo+6jdIbt8=
X-Gm-Gg: ASbGncvD5OhZbzIJGEi8MbB7vfh+Gb9JrZYCuxx8suExwxbJuOgHXyjsELdpgL9qit9
	uAdzocapC/ZuPdm3UpJgaXiyphnbvnstIuVIb+0S50kzbukunxejMieS9wBRvdPYncncDOXjGT2
	iPi+1D2iHo5U67x1jebMXGu+jh8lWvpaAHKsoJ+QmnA4jJ2kTB2COQ4yhDgrjsAUVtM1DPG55MN
	QFFleSbVChOeNRl3JmUstCnFiJLZ6cPB5QJ81fOTwZPeWDWKigFRYD5SwONI1BlCw9n6e9t7hLp
	TuH9iPaKkaOfBVMMDMVSWeThPSd03fG+KWBCligB7mP1ueAG9mwzEBGNFCLw5NLrkLThI7yZxsp
	p+n9lvEkCprS3/LOjwXLY3rinFjQpT+xVMoCq0gVuXnrvtbZWWex2o30cjemt3Vq4eDA55o4MrZ
	PcY1BmPTTfcXaZMZVpbXmbv9MfkY/XkQ==
X-Google-Smtp-Source: AGHT+IF1NqZoDJUY6TeuGYBLJNKGQkEzwN/DgNFQGT2wXbkV9AklBByYcgAlF2eMqVlmtU0H31lLUg==
X-Received: by 2002:a05:6000:4020:b0:425:6866:6a9e with SMTP id ffacd0b85a97d-429aed3223emr2945906f8f.0.1761773440213;
        Wed, 29 Oct 2025 14:30:40 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b43sm28573457f8f.6.2025.10.29.14.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:30:38 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 29 Oct 2025 21:29:23 +0000
Subject: [PATCH v2 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-automatic-clocks-v2-2-f8edd3a2d82b@linaro.org>
References: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
In-Reply-To: <20251029-automatic-clocks-v2-0-f8edd3a2d82b@linaro.org>
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
 bh=gQBv8QyJ2P1jjtV6AA0m325q9CwWFLoeKdBX4iFHs3A=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpAod3kd4vJM8za+qKnMN/EagAer8MUvMl1qLx5
 DjNy+dcNgeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQKHdwAKCRDO6LjWAjRy
 upJ2EACgknbxo8pYwwy3izcG3w2u3YzfOxNI7RlPV+Ql41r13R/QNJmqtMXsdkCOMLsNEjUdy1n
 +IdAYRIQarupDaFo5ZjuCWj7ymVajk+hrFUox9z7eSKilmbn3uVnfMB629gD0soxgnurqFBa4hn
 SbOOToZX/TPrFdf5ypy0Gy6PlzwzlY6pZMMgkphERHWmnGDOpUvfun6K3RT3shee0/9Y8LGhEEe
 yX94UFCulK9w6QxDXKJkuI2fvJiP2iezrz2BlSbd0WvdEHI2Jd83l63nj2uinJewjHZolne+lRe
 r9pf64Ob44HQ+eJJKKimB+f2XYmPEqQFPzLQay7SeosYrquIY1Y+XOWBtYn+oIHnIanb73MkNKf
 FLBpk6gHNojbh2hivl/0XPV+Ss7onM5L3Und0HMnr2OqDxZcrVeQQk4rfHWfBgrnDojmxrM+kDp
 XUuQV6Pfi/lHv2Xa2Q8q4fyZJzqM1A3+b8xgHXFm2Y6i20ML6MdIuPRjkBwlTsXOhhtQo/rxGit
 sGgTJiSuZPDLombSTXyMMFViKRZNqM1PyP1UKQAe5QaB0o7GVBYRQpm2hr34t7AH5vrsWwzaxCE
 EKYUq87a84MnO8MnERoMrZ2E2SyWf0MyVY7Cai+ofN9UoJUC99gu2ATKludB2wJwpd3+1Qmu2Ki
 dvzax6MjLXgjlzQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_143042_156174_AD4BFC98 
X-CRM114-Status: GOOD (  10.09  )
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
2.51.1.851.g4ebd6896fd-goog


