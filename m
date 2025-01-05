Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715A2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMcuEJIoEyeliFcoiN1rN1Xlq33F+vpylS/RXg2R5T8=; b=4zT2wA9D0kriG5CPIfnDHlib7p
	Z7eN50cr3opul9nCMh26Y/W0k8RPdUA0y9lcQdvfbI67ObE5qypqoXxA0OmcGbrFmLQW/o3DAQUpT
	/Zsi2FRYcRjvXMzpdkROCW9EXlOYQxG40pQQFKGZv43kZudM+aoCXCLp47rKMXX9sMMt5JZAoXulk
	bmSrWveDHyqtCtgw80+ORmErmpy29ukec7JfXyILQNJG+FQLvSmm7EPDGzOFzhT44dNA0ScajJkiD
	ZRGGXowNb4bJ9nfClC/d21i7qn6GiaZVuEbpIfzhYEuE74Wh1Yn0tZFBbjySNIVKDiXlRNZWgL1OU
	/AIoPp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTLx-0000000H4Ob-0KPH;
	Sun, 05 Jan 2025 16:19:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTGG-0000000H3Uf-2O7b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:13:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so11851905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736093635; x=1736698435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMcuEJIoEyeliFcoiN1rN1Xlq33F+vpylS/RXg2R5T8=;
        b=HoNX2iDutGJj8gafz4VgY4AW+YNQbUpLmGQ0/BBm0/G9rmFdL68oCHOCcomG1YdFHM
         qMMtO27bfgQ1+b3cju7lDYpS9V6776fllwdRDe2QYYCfAO5DxPLva7SwM5Tb0V35CGr5
         97iIYGxCAeNSKsoPCAzQrtsm7ldt4E18HpuVj1l60rdVuxy2AUa9dF44F1Rh1IWUjjeP
         skLDk8Vophw8Q8YUUEQlaetYC/uEk3CajGc38CuBBkNxVdQL7bKLlk0xTlsOyN6UnuzW
         bt0QoG2s2AD08WUtZski8/wd1ouXtof/OdRc5dsWWHEMjKHllW5GJGdyEk+lYgOF2n9U
         JJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736093635; x=1736698435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMcuEJIoEyeliFcoiN1rN1Xlq33F+vpylS/RXg2R5T8=;
        b=JNm14fK3BNInPzh/Rcc9PkG6HQgZ8uEQW3EQdRcwDS4F20epA5k6VoZAMBpNPeQkYR
         fXBMNdU0TQB6Gj32/zQ6p4OQ+bMOy6/Zc/+EC1NR0Ulhr1UNakD5NnmKWixQmzdnd2r+
         y5YfRuMNDpjCqPKbBW8vzY2z25fFDjlIGm4y5IouR+g9kANdY5yL0a75OWHZG9MAukTU
         52K6gNybAfb9EcwRGtpiTQnluthsxkDD1AjD+OpPSbRB79Jpp7AiEPozveAl3YlM/lnf
         oZOLxXEVkUgkH7WEJflf70CWdEF4oVtfNV0El6QbM8XI75167QGoUPJA5+/O+JB6r1CR
         6fSw==
X-Forwarded-Encrypted: i=1; AJvYcCVjG77JbdEoP2S2F9lkp5LfSkeWI/ZVug7tVzNdnjWEd5qoCtaE+vqasYxcA/E3esA9Z3am97dhgChDUnMmVOqZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzH8vaBQ/Aggv06DMH6EKE2Dp2/HhNoSdKDqPXQ+3VGlha7C6fl
	QGNL7n0IBhBgJ/fM+O/YdwsH/HLVCwQBMfe0/v53PJ3LGZCJ620m
X-Gm-Gg: ASbGncu4ItKTP5mFcDxDbBXAODv930V76A3f8NDQKpLkjaeDB7kMfKO0JAWRJ5ogFH3
	39UrUpt1DnWUS/DID7D4ytNwLIfb+dYLuHnwv4Xta+6FBDLhwRRkT9t+mIqDtC1Ihex5vHXKpZx
	wQKYY02y6NOwAHEsbbsnDlwlY7s8SrjLpcNUzKDhF150Eg2ABunYYQnGEPnUeeE68i2cHV/doY/
	hLOUC1A3LdGzjV4wx5Fu6tD+sHbqMxtQStDe5FlOKKX+QDt0M3PwspqYozIP48YEybKTeI=
X-Google-Smtp-Source: AGHT+IGi2vV5nk3t35IRdS2EtJiGq1THtyKt4WXcE+8E93rhZ7B0ooKHzQcnIOVx/iet4T+BYNL+oQ==
X-Received: by 2002:a05:600c:35cb:b0:436:1c04:aa9a with SMTP id 5b1f17b1804b1-4366864379bmr470705475e9.14.1736093634661;
        Sun, 05 Jan 2025 08:13:54 -0800 (PST)
Received: from ivaylo-T580.. ([94.131.202.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm578250565e9.38.2025.01.05.08.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:13:54 -0800 (PST)
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
Subject: [PATCH v3 4/6] arm64: dts: exynos8895: add a node for mmc
Date: Sun,  5 Jan 2025 18:13:42 +0200
Message-ID: <20250105161344.420749-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250105161344.420749-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_081356_597957_0C4AE834 
X-CRM114-Status: GOOD (  12.28  )
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

Add an MMC node in order to allow devices with that SoC to make use of
it. It's typically used as a secondary storage option for SD cards. In
the vendor kernels, it's labelled as mmc_2, but since there don't seem to
be any other blocks, treat it as the only MMC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index eedbd1728..f92d2a8a2 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -1296,6 +1296,22 @@ pinctrl_fsys1: pinctrl@11430000 {
 			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		mmc: mmc@11500000 {
+			compatible = "samsung,exynos8895-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
+			reg = <0x11500000 0x2000>;
+			assigned-clocks = <&cmu_top CLK_MOUT_CMU_FSYS1_MMC_CARD>;
+			assigned-clock-parents = <&cmu_top CLK_FOUT_SHARED4_PLL>;
+			clocks = <&cmu_fsys1 CLK_GOUT_FSYS1_MMC_CARD_I_ACLK>,
+				 <&cmu_fsys1 CLK_GOUT_FSYS1_MMC_CARD_SDCLKIN>;
+			clock-names = "biu", "ciu";
+			fifo-depth = <64>;
+			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pinctrl_abox: pinctrl@13e60000 {
 			compatible = "samsung,exynos8895-pinctrl";
 			reg = <0x13e60000 0x1000>;
-- 
2.43.0


