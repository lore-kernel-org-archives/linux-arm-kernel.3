Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE0FC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG0PGngxZ9eJCxWKdqWKn36vkLKB7SwSqjxijh1UYCU=; b=cY/t9SOv6ZCx7UmhbOt4JXi0ak
	769Xoe9aX2CIAOe5TodPijj/7Dsyyk5JGhdbJUGJEH0EA4oOmhDX0kwzSC7BzN78rWlx5vboR/DC2
	+ski2cSxDTvLAiP/MHUUDnnoMQVQqC2P5wxBDqDZDHNv6Iy6JXSFLlXLAjU69WBcA9aJ1UwfWcIZu
	YlFzSzsuxpcUVCDyH36nlqEr0wrGY6Y40KPqeO+eQzqfJ7xdse/mdoNxLrBKoceswgzDT0Qx/iI6E
	Edmhwdqmroq7bVlmXMfEZ/toZ4NremQ3vsDw4p17wN0Szg37H6DgWOIRpyS8Ai9PkkGySBxLsctRx
	043eCGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8g00-00000002csZ-26hE;
	Mon, 21 Sep 2026 15:32:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzc-00000002cYe-0K79
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rG0PGngxZ9eJCxWKdqWKn36vkLKB7SwSqjxijh1UYCU=; b=NenCZRWbqf4ZDW2ZEY8rDd9Bku
	DF54R/+ykuv62De3FVbObzTd94mTzbpb6p9Lq5y+qV9hIH7XlYipPMXQP5QpH+T93GO7+1dasmpME
	eQJlhM+e+aDF6S3eqxVf8tbKJGWuzSpbxsRE1AtWBqXw2wA3EiimaY8hf9eTgTRfOAPxKziCLpuye
	CWr+kHj0uhs00p4NWz4Ue3HVGlLKPjBqAg/+BdXJyzqv+LyMPaowbYZ7UQZo+qQOriWB08PBKSFzI
	RsukiKVfkAYUW90PVqQxqV7J+Qnw06GgxSdEjdcRtD+ve3j8mNcUyrDyWgo/DLEvsQGp+Dfd2FTDH
	DPT8XMRA==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8fzV-0000000CThI-3GTP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:31:39 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4858bc96fabso2552065f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004696; x=1790609496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG0PGngxZ9eJCxWKdqWKn36vkLKB7SwSqjxijh1UYCU=;
        b=CO0xy9swKagvHKnXEKMiiM0vPElyF5+MIv8j6nmctwqUzhlrfhBWZ1+IzXpF9s26b5
         GCEqXXXgDbnuY2ymM1z6GOispNeX75rV1aT29GmF7pHALxzs8XYHg4AtTzDDiIByKsze
         sq1ZUhqcmRiOHhl6Gh8CmnB0Fl6dYzpfeylh2GBRFBKKqjngdXXIcnpWzljA7Jq+e5eC
         a/Qm+B6tkwNWZxgZkeYOckI4Sz5cei7jXSs1w/bu1xBvMpUE9yTuZu6dLioFattIeBZD
         XxvqIfIm5o/Kzdq4ULimRz+l2g487xikd/IUHE/nzmM2iaQVopggTvgGKcduF6JNHZ3B
         Yzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004696; x=1790609496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rG0PGngxZ9eJCxWKdqWKn36vkLKB7SwSqjxijh1UYCU=;
        b=fWgjJo9Fc1khA1EYieTEHlUMoBASvD48pajnekhehUvTA0LJ4d5FDE3usjDglATV/M
         M0M4WYhw5qo2y9MzTNh4xazHgemyVmW2NYlGdQ70NrdqR5pDSz5SzbWPuIZRf/Kjx1+Z
         qEd/wxtLcTlezV1M+ZDx8Zi1v62ycyMWAZXWI0Z4hFe1y3dsIog+RBZtkSqDUUdnveqK
         FjCrc58OYQK/yky821/XpUSBxdnWdsp21EJa//zTNZCxjx9hqScxlHKknmj20WGYUQa1
         pdp+sOVgi/ATqsgkM8pbrQp5370xQhg/4RHx5Car6TN05x2w21mpXILMFZ2/RbyF9wgp
         0M2A==
X-Forwarded-Encrypted: i=1; AKwUvBwtHKe2wXvdP2cGTDG6C2zIsvU0GMs6SE9X564PiSknh2lFjLItzDzuoeHlyOE1vknNzPe5FzzkOhuZ/XYVh58d@lists.infradead.org
X-Gm-Message-State: AFuF++mcV1eTUmzXtpsEIx7j2OmqAc51UUp5Oc5XtIHZQQgwZjYCSKdz
	8ufjmBDLQLrmIuDhGAO8vpfVC5J3rENMCSuhW/XbFXWk7BptjeX5gdiP
X-Gm-Gg: AYBFou3lW7s9430FQUiujIL98Ed8wlGynJAPR5rA3OCuQmYzUyoRy2eCgW9KmSuBQik
	0nr5XQlqyKBGtk23m4tSj5FsPUPOVzST6Wh426tyuxkS/h7LUB3vkiXgWvmg5EeIUyF4pYZRdKY
	wk2QqJYQdWIOWTH8u/Dg0VcUuDeYzEdIhO1rCZZjGOMP5sSEBMzoHkDU04HzsN/IQB+RgchNkRP
	DAuj4jWCon5JiKbBmk5TzBhyFeOjPaCLxvdTy0oTrIVoBm4P4LW+MEE6LFdnO2DRMxoZCW0qBka
	ZNmZ9Cg58oUO/89R6smzZ1AwLLANNmYxseOpCWYOrwzPvjStk0k5NnGKRa3Alo2+CrGRiG00cth
	XDlSzxT4OJA6kRRqD9lL/9eRwdFlNXn+5Y9a+bwEqpzk/Dig+BpMQ28i5e6Tgl7LUsdeWAdD0XP
	gfgsx1SNTfJh5od6Due7O79TnpMUGSWbb6GEbXivIBi8pNJNXJasL4aFo9aVxdll/Fuz2LflQqC
	dbgUrYNCJEgoCgUXZnoL0fnigo9pG07UbABqkqGTd+F8lY+4498UOD5nQ==
X-Received: by 2002:a05:6000:26cc:b0:486:f9d9:fe0d with SMTP id ffacd0b85a97d-4871e3961dcmr15911596f8f.29.1790004696322;
        Mon, 21 Sep 2026 08:31:36 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:30:01 +0200
Subject: [PATCH v2 5/5] arm64: dts: rockchip: add vicap node to rk3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-5-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=3338;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=ZC4qyA+QqW+G5Bs4L+6PfR/B7WGJI496vaWFRnkBXSU=;
 b=0LFg7TskclcAaCKsLisQlh1M5J7hMLHO+H4Vs4clqqE8Vi5mMqDn0Btt6CcQ37cSRzpVaha+6
 WJotjvQpMwjD/J9lQ19LZJojwTq6AFHEacSCgvrUauDIJ1MgRuVpGdE
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_163138_022958_AB568ADB 
X-CRM114-Status: GOOD (  12.33  )
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

Add the device tree node for the Video Capture (VICAP) unit of the
RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
receivers that are usable with the MIPI D-PHYs in full mode.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 83 ++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index cbf8b70cc15a..0c46accf5657 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1323,6 +1323,81 @@ vdec_mmu: iommu@27b00800 {
 			rockchip,disable-mmu-reset;
 			#iommu-cells = <0>;
 		};
+		vicap: video-capture@27c10000 {
+			compatible = "rockchip,rk3576-vicap";
+			reg = <0x0 0x27c10000 0x0 0x800>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+				 <&cru DCLK_VICAP>,
+				 <&cru CLK_VICAP_I0CLK>, <&cru CLK_VICAP_I1CLK>,
+				 <&cru CLK_VICAP_I2CLK>, <&cru CLK_VICAP_I3CLK>,
+				 <&cru CLK_VICAP_I4CLK>;
+			clock-names = "aclk", "hclk", "dclk",
+				      "iclk", "iclk1", "iclk2", "iclk3", "iclk4";
+			iommus = <&vicap_mmu>;
+			power-domains = <&power RK3576_PD_VI>;
+			resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+				 <&cru SRST_D_VICAP>,
+				 <&cru SRST_VICAP_I0CLK>, <&cru SRST_VICAP_I1CLK>,
+				 <&cru SRST_VICAP_I2CLK>, <&cru SRST_VICAP_I3CLK>,
+				 <&cru SRST_VICAP_I4CLK>;
+			reset-names = "arst", "hrst", "drst",
+				      "irst0", "irst1", "irst2", "irst3", "irst4";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				vicap_dvp: port@0 {
+					reg = <0x0>;
+				};
+
+				vicap_mipi0: port@1 {
+					reg = <0x1>;
+				};
+
+				vicap_mipi1: port@2 {
+					reg = <0x2>;
+
+					vicap_mipi1_input: endpoint {
+						remote-endpoint = <&csi1_output>;
+					};
+				};
+
+				vicap_mipi2: port@3 {
+					reg = <0x3>;
+				};
+
+				vicap_mipi3: port@4 {
+					reg = <0x4>;
+
+					vicap_mipi3_input: endpoint {
+						remote-endpoint = <&csi3_output>;
+					};
+				};
+
+				vicap_mipi4: port@5 {
+					reg = <0x5>;
+				};
+
+				vicap_toisp0: port@10 {
+					reg = <0x10>;
+				};
+			};
+		};
+
+		vicap_mmu: iommu@27c10800 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27c10800 0x0 0x100>;
+			interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VI>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+			status = "disabled";
+		};
 
 		csi1: csi@27c90000 {
 			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
@@ -1346,6 +1421,10 @@ csi1_in: port@0 {
 
 				csi1_out: port@1 {
 					reg = <1>;
+
+					csi1_output: endpoint {
+						remote-endpoint = <&vicap_mipi1_input>;
+					};
 				};
 			};
 		};
@@ -1372,6 +1451,10 @@ csi3_in: port@0 {
 
 				csi3_out: port@1 {
 					reg = <1>;
+
+					csi3_output: endpoint {
+						remote-endpoint = <&vicap_mipi3_input>;
+					};
 				};
 			};
 		};

-- 
2.43.0


