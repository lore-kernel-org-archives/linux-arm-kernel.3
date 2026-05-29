Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E05CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1A+YljpcvCERY1OoB5p2TF1PX3S8oCba6E+e91fZVo=; b=2xFr4TK0MKT6ffaoFN91Y49Weg
	KFeNTcL6S/YOwMqmjZeLssvLBqLQ2URPbN5njG9kVWMWyE2sZXtspenEEUOuBU7fUhYEUuQX2jv2P
	lRkiCg9kvIt1miqSF0xzI0+G0x4Ma3BOMeJ/eUuaZ8/NeQfOh5eaccJc1i7lFl+9QpaJttO+Vw0Rf
	2AZmZ1t2lPNDxBvHeYQ2AuswsWkl7J9AvH8Wroqm/UzPmfcKJHGQMVXgsM3MhoCvoxJbvO5PmQ74B
	autyiU5LNGySgEjeFRrDEnVyik9blhoBnZ2fXtHXSMpqx44r/+MtGoUfNIuxyqRz4dIqPqd321/um
	xBL5qRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZM-00000007m6N-15lh;
	Fri, 29 May 2026 15:56:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZG-00000007lzR-2cVX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso95586165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780070173; x=1780674973; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1A+YljpcvCERY1OoB5p2TF1PX3S8oCba6E+e91fZVo=;
        b=pcM0B49qqLNs7sTqrv+Tzh5niI6du7ZRWnx16SmPjB4/iIxiSVMFHYIf9vqGJZNr3P
         yeW7euI2BZOZhDT9QfqV/QuALzct+czVhQybfW7qSIiaudhfjyr+9ThnYZ+xc/x8h+NS
         tTz+1bdSiNqEVw2qsBm0bzukfTRfx6GR8Eh3vlRwr447OdktGM+ZHSafwGcunYbTKoX2
         hGP3X/DWyBFszx4Bc7ZAkvhbO5V9HRSkxS97ui+u2RNTOuvELPU3KiTWTPlyzEej9pBm
         JtIpidin4ngf0CathICfnktHloUUFb6TU1LYS1mAmBUnDMr4MteK1b7M8QYIdApH1PLl
         M3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780070173; x=1780674973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1A+YljpcvCERY1OoB5p2TF1PX3S8oCba6E+e91fZVo=;
        b=AMZqK0UCTQHywmiMbae5+3UtTdH5TcHzOhZZ1lfMD27zJYw+zU+sazpaVSzdDdOghT
         XX89o2vVHCTqgoYAzqyvQoVjKvH0idra3RNwIWZGX1FB+7T7soX10qV698XTQkFfyX9V
         VI107rd2tNMn6HCK07yu5RxEsgZFnq4pB1SdmpnB3q9RsITqq7hTJ+ks55Ld68+hn9iv
         n5eK+lrmSv/Lm4m5l+kVA5TPbny05J9BuciPBee3CUxYJbB34ArV5BXYP55jsVg77xXa
         TGTcpgIeOcU5/tflLQ5rDNIgZCYfjLb5W/8tFlbMAeO+tg6KsKvk4cLtn4qwiFaYXxyr
         Z7ng==
X-Forwarded-Encrypted: i=1; AFNElJ8WRDeS4oNMGIo77ii+U5jefiBh3u4r+qqtix5IztwQXDGPIEufmdomiZpqLzpii7ULZ7POo7JEzX884BMQ67BW@lists.infradead.org
X-Gm-Message-State: AOJu0YxEzWRYM8tGY5N/kuZqLsuhLHYfR6nwpyOXNL37LxXsbVXZLDjb
	HZ7kAql6OVNAT4suj9OShEtvaQTJgof2fjzxsuMKFBxnEG6Bbcygqvta
X-Gm-Gg: Acq92OHZ8/Wsy+ZstlcB7vQ4OOdHj1NbSb+eXDrm6DWliZYUQ8k8kpIIs4lKaMYGksx
	WyXnhXYXx2oNI8vJJro8HPbC/M5L2Ge2AlQlNCjJAbRmxpiltYzKmZ0GEAU6Eb6pZ5j662Z6oOR
	5lrlDIwMzRXF0yeB9GWeB+BeWSTtq0yzF9njMyI0x0CGxvjQvqkSY+7pbWIw92JDMroXATg/pnn
	Q5arMN7Yk6KCPqDlM89thGVWIrXdX5iwAjx+faaagi4ehDFqc+EmaCnmV6n9xK+jQ7TN7EaIA81
	JAHmAz2fYccZvAQ5y8klMChH2yYsky/Kj8jIZt2NefeHvSrws8bEBD3Qqcx6sWcH2qRLBzeyI6a
	7Ud3ics8oM/g5es4d8ZVQpWaU4aat6/3v7M3QiQ1lT3iCJJnwd6ApgFTsUh5/eLFc0/Zv7ZilbV
	g5JNXtSEynBExZcvukE0xQnHWnDifQauGL/krB2B5HZ5F3sxvDCq+lHePgWpXmH9/Y9ATJBdTbh
	8aZB6xYwSoRwoXOT3UHMrgW4MCQ4wdZ6uQnseF+
X-Received: by 2002:a05:600c:4703:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-490a2915c45mr3835355e9.14.1780070172686;
        Fri, 29 May 2026 08:56:12 -0700 (PDT)
Received: from debian.tailb81abf.ts.net (2a01cb09e0354cc878d00097536575e1.ipv6.abo.wanadoo.fr. [2a01:cb09:e035:4cc8:78d0:97:5365:75e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cabfd6esm55150315e9.15.2026.05.29.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 08:56:12 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: rk356x: Add NPU and its IOMMU
Date: Fri, 29 May 2026 17:58:23 +0200
Message-Id: <20260529155824.3099831-4-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260529155824.3099831-1-midgy971@gmail.com>
References: <20260529155824.3099831-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085614_678490_638EFB7E 
X-CRM114-Status: GOOD (  10.04  )
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

From: Midgy BALON <midgy971@gmail.com>

Add the RKNN core 0 and its IOMMU to the RK3568 SoC dtsi, mirroring
the RK3588 pattern in rk3588-base.dtsi but with rk3568-specific clocks,
resets, power domain, and a rockchip,pmu phandle required for the NPU
NOC bus de-idle sequence.

Both nodes remain disabled by default; boards enable them as needed.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 8893b7b6c..2c2a57ea3 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -929,6 +929,37 @@ qos_rga_wr: qos@fe158300 {
 		reg = <0x0 0xfe158300 0x0 0x20>;
 	};
 
+	rknn_core_0: npu@fde40000 {
+		compatible = "rockchip,rk3568-rknn-core";
+		reg = <0x0 0xfde40000 0x0 0x1000>,
+		      <0x0 0xfde41000 0x0 0x1000>,
+		      <0x0 0xfde43000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_NPU>, <&cru HCLK_NPU>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_PRE>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
+		resets = <&cru SRST_A_NPU>, <&cru SRST_H_NPU>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3568_PD_NPU>;
+		rockchip,pmu = <&pmu>;
+		iommus = <&rknn_mmu_0>;
+		status = "disabled";
+	};
+
+	rknn_mmu_0: iommu@fde4b000 {
+		compatible = "rockchip,iommu";
+		reg = <0x0 0xfde4b000 0x0 0x40>;
+		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "aclk", "iface";
+		clocks = <&cru ACLK_NPU>, <&cru HCLK_NPU>;
+		power-domains = <&power RK3568_PD_NPU>;
+		#iommu-cells = <0>;
+		status = "disabled";
+	};
+
 	qos_npu: qos@fe180000 {
 		compatible = "rockchip,rk3568-qos", "syscon";
 		reg = <0x0 0xfe180000 0x0 0x20>;
-- 
2.39.5


