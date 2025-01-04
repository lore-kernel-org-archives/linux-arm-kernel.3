Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722B6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=; b=yIAjQzqfgFliAz7N++/FS4xJqd
	E1n1RFbsN8z6utA1+hDk6XqBKwODXzqmXpmjzwD/oAEDKgH1Mw+3tQbuU+rZomR4G0YGj/+zTkzmS
	da0S7kL0RInPtLEPMSJhjQnBZuHYfAgSdx+joSB0rc4kQ1+OtDQDIaucdpp8fl0GRfG/STUbl2Jd3
	Ojobf2AOjw2DA3kl4NYXnhYaJezHX2m3u9wUoqYm9VCbi2N4x2DB35Gczm75YAtEp6MZhL+d6KhPP
	50XE42Fz9O8fsIVERTBXcHBq6DuJP5DhnmwV3AhPOZi9//QoWn/NRo5DHWoVV9FS2ER56K0lcZ0fN
	w91Oau5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7Ij-0000000FITv-0Ptb;
	Sat, 04 Jan 2025 16:47:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7FJ-0000000FHuv-3JtU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:43:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4368a293339so95486025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 08:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736009008; x=1736613808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=;
        b=cyM8wyrlnpK76VG16G6vz2Vkd4W02D5D0H5OBvJvbBVp4+qTlsNAqeO6Z2MJ7fJWIz
         LdNBNEb7UiEqNrp5BAlS1+9E2SxCKD89EJ2NddFkSP6nKO0oi9OpubG33W7ZGkmD9EKX
         SYehFgcu4sE7N99mCPrE2DGXjWjIbNsXPqilleFDMcLh0U8VWMZV9mIBVS/n5Dx9kaUe
         bDJVlq9ynvbYhy4kEAmTLAzJQz9X19R2YSVgbuwfU4vFvPw8mGkvDTWlOC2S0IqjHh9R
         nphPaqJpHzMuROjQnvM6cQ1O+tZm4+NbjZi7jGqrJu+SqW+r8tzsZukPP0TxBBNGzHHs
         4Vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736009008; x=1736613808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCu8j5qgaYDYPnaPdDgFFNsAqlm/hMgJljoqnUl2UNc=;
        b=qiYNMgRS57pVr4XnidsGapOM/35YBECsnw1P94HwJIwsXMavyU63+ItSw6ro7oKaex
         WzHbjTi5liVuruZg68zxocZW2ufoXMlO/S3bc1cREswRdj405YcY+XVs0lijwlY4hjbT
         EYbWLjt1+1vgXKdu8u3a0DowIZ959WLlzSR1FSmyNTTKV4h2q7WK93VyAOoF9DtPWKim
         5Fje6MP52CYHDmF+hZWtmn0p+XCyfRgVk1YajksQyFoWvZKYtYIwqqv6EzcA4CnNtj+8
         H0iyVU3r9IupQvCH/H+DqQ7tLMJsyqlXpiGmxYa12pz8AHiGMeSFFJoKzn92ax5iGgvh
         nkPw==
X-Forwarded-Encrypted: i=1; AJvYcCVIgPPhRCrlpgxuLm64OOcaDkDv6eVTUUPAMq76io0dwi63KSvf5MjkE6EevgmM+94sOQR283drF94NFNpuq/IQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5GVIkCNxADoGxEAjvV5ysZa0ZfzI+N1QEM9+sUM3y/f85B8Sv
	tWqN0ICwUgNXvKs1G8UDt6+A5gItqhIY9ol7DfDfCdM1UzPi0mGlVaV90A==
X-Gm-Gg: ASbGnct5o9m7OtoY9zFrcvE315+cyHonZML0UX4LnMaQAhoJPP4rBXG9/PK1l2zy7YQ
	8OminSDk8251f6OoOsugT0iwK38BCxcVHsRPm6OZtGp2pNEdXhqbRMKdfXx5N9hJqM2tvcEbevf
	PIWv1e3NTkwXf6d40oT9lz79jW9UasFQW3m9EHqXiioXD5HljQ6PYCnNF/2PY6l4FoQQBb34dE+
	xXVFqPlp1ofZ0u8x48Dgr7yKjcAK4M3/Xs84AMa9kVwmYK5q4NTC7RT2zM+wBupo0EnJ6A=
X-Google-Smtp-Source: AGHT+IFdsIXpWhtVBKBADkN2xim5hg9rIrv0ODPLKZhGU0lkrGOTgVqV2MCfi/6pnaxRSohjyT+i5Q==
X-Received: by 2002:a05:600c:468f:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-43668b785ddmr413028385e9.24.1736009007850;
        Sat, 04 Jan 2025 08:43:27 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm513321455e9.24.2025.01.04.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 08:43:27 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
Date: Sat,  4 Jan 2025 18:43:17 +0200
Message-ID: <20250104164321.333669-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250104164321.333669-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084329_820815_2E3F8359 
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

Add syscon nodes for peric0/1, typically used for USI, and fsys0/1,
typically used for PCI.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 4fb9be850..5302a8c1b 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -228,6 +228,12 @@ cmu_peric0: clock-controller@10400000 {
 				      "usi1", "usi2", "usi3";
 		};
 
+		syscon_peric0: syscon@10420000 {
+			compatible = "samsung,exynos8895-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x2000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK>;
+		};
+
 		serial_0: serial@10430000 {
 			compatible = "samsung,exynos8895-uart";
 			reg = <0x10430000 0x100>;
@@ -273,6 +279,12 @@ cmu_peric1: clock-controller@10800000 {
 				      "usi10", "usi11", "usi12", "usi13";
 		};
 
+		syscon_peric1: syscon@10820000 {
+			compatible = "samsung,exynos8895-peric1-sysreg", "syscon";
+			reg = <0x10820000 0x2000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK>;
+		};
+
 		serial_1: serial@10830000 {
 			compatible = "samsung,exynos8895-uart";
 			reg = <0x10830000 0x100>;
@@ -380,6 +392,12 @@ cmu_fsys0: clock-controller@11000000 {
 				      "ufs", "usbdrd30";
 		};
 
+		syscon_fsys0: syscon@11020000 {
+			compatible = "samsung,exynos8895-fsys0-sysreg", "syscon";
+			reg = <0x11020000 0x2000>;
+			clocks = <&cmu_fsys0 CLK_GOUT_FSYS0_SYSREG_FSYS0_PCLK>;
+		};
+
 		pinctrl_fsys0: pinctrl@11050000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11050000 0x1000>;
@@ -398,6 +416,12 @@ cmu_fsys1: clock-controller@11400000 {
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
 		};
 
+		syscon_fsys1: syscon@11420000 {
+			compatible = "samsung,exynos8895-fsys1-sysreg", "syscon";
+			reg = <0x11420000 0x2000>;
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_SYSREG_FSYS1_PCLK>;
+		};
+
 		pinctrl_fsys1: pinctrl@11430000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x11430000 0x1000>;
-- 
2.43.0


