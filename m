Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DFBE8FDA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 11:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIMoNY3Aw98ZzAyD/ql7BezuP1iCnP+4r2HUN/Krfmg=; b=LMQ8aiGnPSaG260TKmcEGK8yrx
	7OSwkrHG4FZGw/N/mOtszBij0SGq3zD20G/PX9z12khmdx2CDUa9+ViaSaSeRyjIMkqaMd4SVxmlI
	TM77DJkAG3kwzi+6mJ9nyRBeUAL6g7siQ/7V4qQeU0+WqWpXIZwnbdTT1B0PH7Qu8U0uf4cGb5Hcz
	2O2U0juLFJEge3W0QWygpB8jVxA3b1eMyNox42Pz+XmDERdk5OWPQnyK7O4CE7lDGSGruN5is3xNy
	yKLjq1y8nubjg4oCPlC+R1tsmm8HesdchpDRAwE/paNw/GU5r3Raw0GlRAIaSldQGQfOso6pzIp9+
	8AGQDxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ637-000000018w1-1uPV;
	Fri, 26 Dec 2025 11:32:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ634-000000018sz-2GUf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 11:31:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fb5810d39so3973245f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 03:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748717; x=1767353517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIMoNY3Aw98ZzAyD/ql7BezuP1iCnP+4r2HUN/Krfmg=;
        b=fReG/BL0NhpSRLvgKxtppVxSHIBXvBey7dItSCHBDC18i/MG7dOyFdOe+zTqZ8h6Il
         1KjBAxuMaANMNtEUqzFoexpeiSokZPUFPproifUBaKXElSNOB71dMCE6EKCcKZA3+XXM
         l5zkyjGfVj25DtvheskwD4gRC+koZrsf6FUc5hEeULJH7K6sydMGno5fnuAVBLNkMvAH
         U0kN2G2THHpnF3VqHkWb2zkty5r/jO+9WzAWiR853wfqXYS3ekMYo60rf95iX4M+HEJI
         +WvAnXHQj1R55jgVwq5oj9UGnt0znp3uSbGetfIfnrou9R848pnQXD0MwdNcyJ0EuBT1
         MqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748717; x=1767353517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIMoNY3Aw98ZzAyD/ql7BezuP1iCnP+4r2HUN/Krfmg=;
        b=HaPasBq7eejyXT0tKhBiZ8MMZ2mUnUeEmFASGN1WT5Hc9It3xeF1Jy6rAOH6XTcECC
         DRoLTocYLtSjm94Kr6ZwYXOWdjCs89dqWwqbNPH7pZDVZukub+6z1AmCD5vQFyA8xq/T
         RccI1rKz94p9Ze3vecQ7zihi31eWuolYpj70DO5ljzGC5pqYFOUTs2dRvOeKGfmf7Gll
         WLWvyHeImyWDfNijSkYLDaWUYuVHvVwQCrtv3Gdhi8VOQdX8i++uYuCZZJCfiSdXJiPP
         iX70xABqW4mwtI5N2pTRMSkyccSz9Lyt33vWM0OPGz9y3dOAInmk4EKItyGHP6KvXdxB
         ri/w==
X-Forwarded-Encrypted: i=1; AJvYcCXGZAVia3Cb9FlcE/mS2oAsCRiUNAyNVVucZ5CtiFSz02AA+u0lF2X/megOYv8y6gtB1zXo0FOh2fc3RmBuc1X8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcqiyv99vXH0tyWXLc21Zsvo/3eLaGOlfYQhm5zqgibw645DSA
	pn8Ta6FP6wJ4O7mMHllHk+qUb601K6+uxjCiYgHhR5XYX97zhogeHIfO
X-Gm-Gg: AY/fxX60YqTfS4CDPIBq08TgH1uLwZbHoWE6m8+YX3aLt0PMaovfNmNsfD4KVRA+PEp
	/F5g/EX+Aakr9AasBEap7hpYD+ZnqJ8qga1SPUSpJK9oG/ljiU8SZR5Jw5nChpL4Kw1txz2A/OU
	i7LZKx+wYIIp/YBIokf3+kWxSkQwPCkD8sbOvIO4+L1CikQM4togFTxA5weGA6CJCpd1Y6TXbnC
	tth8xuFeaDTF9vwtye+IP/OVN1Ixhf5OlfPl1n0JxYbbkjsx7f0I80LxzcErER3tgTqdyugag/F
	xgzIHncrwnck6IXhppYad2Jyzc7DS4Cy+RKpwRo2b/nVd0VDrK4uviNe9xeM3CtBu5qenGgOiK3
	7MzwIVzW+WoyTTOl2D3wZYMvRT76C1xODFCq7dK+bZwk2fLVik26NIIazM9TCAi+KCIVINn9LzL
	+7LvkrNvI1xSufS/Y=
X-Google-Smtp-Source: AGHT+IFFOJzfU27KrqGH3nfRwzkjvpp/3lBr9q9F1dbqFSb0UGV9ka2fDQLSk0GuKEIBX51sO7Kfhw==
X-Received: by 2002:a05:6000:24c8:b0:431:808:2d58 with SMTP id ffacd0b85a97d-4324e50d219mr27294070f8f.51.1766748716486;
        Fri, 26 Dec 2025 03:31:56 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm44182107f8f.8.2025.12.26.03.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:31:56 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
Date: Fri, 26 Dec 2025 11:31:40 +0000
Message-Id: <20251226113140.573759-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_033158_607487_2F1AAC62 
X-CRM114-Status: GOOD (  10.96  )
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

Add the vdpu346 Video Decoders to the rk356x-base devicetree to
enable support on RK3566 and RK3568 boards. Also add the needed
sram and vdec_mmu nodes.

Suggested-by: Diederik de Haas <didi.debian@cknow.org>
Suggested-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 8893b7b6cc9f..b37eea56c221 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -383,6 +383,19 @@ usb2phy1_grf: syscon@fdca8000 {
 		reg = <0x0 0xfdca8000 0x0 0x8000>;
 	};
 
+	sram@fdcc0000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0xfdcc0000 0x0 0xb000>;
+		ranges = <0x0 0x0 0xfdcc0000 0xb000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		vdec_sram: rkvdec-sram@0 {
+			reg = <0x0 0xb000>;
+			pool;
+		};
+	};
+
 	pmucru: clock-controller@fdd00000 {
 		compatible = "rockchip,rk3568-pmucru";
 		reg = <0x0 0xfdd00000 0x0 0x1000>;
@@ -619,6 +632,42 @@ vepu_mmu: iommu@fdee0800 {
 		#iommu-cells = <0>;
 	};
 
+	vdec: video-codec@fdf80100 {
+		compatible = "rockchip,rk3568-vdec";
+		reg = <0x0 0xfdf80200 0x0 0x500>,
+		      <0x0 0xfdf80100 0x0 0x100>,
+		      <0x0 0xfdf80700 0x0 0x100>;
+		reg-names = "function", "link", "cache";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>,
+			 <&cru CLK_RKVDEC_CA>, <&cru CLK_RKVDEC_CORE>,
+			 <&cru CLK_RKVDEC_HEVC_CA>;
+		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		assigned-clocks = <&cru ACLK_RKVDEC>,
+				  <&cru CLK_RKVDEC_CORE>,
+				  <&cru CLK_RKVDEC_CA>,
+				  <&cru CLK_RKVDEC_HEVC_CA>;
+		assigned-clock-rates = <297000000>, <297000000>,
+				       <297000000>, <600000000>;
+		iommus = <&vdec_mmu>;
+		power-domains = <&power RK3568_PD_RKVDEC>;
+		resets = <&cru SRST_A_RKVDEC>, <&cru SRST_H_RKVDEC>,
+			 <&cru SRST_RKVDEC_CA>, <&cru SRST_RKVDEC_CORE>,
+			 <&cru SRST_RKVDEC_HEVC_CA>;
+		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		sram = <&vdec_sram>;
+	};
+
+	vdec_mmu: iommu@fdf80800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdf80800 0x0 0x40>, <0x0 0xfdf80840 0x0 0x40>;
+		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3568_PD_RKVDEC>;
+		#iommu-cells = <0>;
+	};
+
 	vicap: video-capture@fdfe0000 {
 		compatible = "rockchip,rk3568-vicap";
 		reg = <0x0 0xfdfe0000 0x0 0x200>;
-- 
2.34.1


