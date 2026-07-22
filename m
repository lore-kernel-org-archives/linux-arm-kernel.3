Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72451C44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QJ5C+F1DA/FJAjipor7GjfS6+nFhyDKOaKdbzVDlcI=; b=ScCkv22A/+Yxb8oDeDTkj/5C7g
	+OBQ8DboTsAB2+RRFRgPiLlMeBBindVyPFosU0ngza+PmMNVtdfrY35fqYo6VgQtX3FdFWku0DBQL
	qS7PLVS1B7ycHVLb5iFzH30caPVGcjAgQkUyfZqy1aIf+nopGTdVo7a77rSlCePdze6tCMB9hiDp6
	VlN5ySKPS3lr5HQ/FxBn37/Ulgap3RoXagXmFXcaY9rvl+ySfPSKO5m0bgZMu8D6d1n3ZvXXDTdkw
	YOK/2Jp8wupum9OERvdjfGM/MShbvTN5eRuOxfVP3x2ldnNnHjcjvDFXta2a4c4x4Z/3xSi5iCP+w
	ngI8OnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRTj-0000000B4u6-0qq6;
	Wed, 22 Jul 2026 07:34:55 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRTf-0000000B4qe-1GCG;
	Wed, 22 Jul 2026 07:34:53 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 666C5130010C;
	Wed, 22 Jul 2026 03:34:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 22 Jul 2026 03:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784705690; x=
	1784709290; bh=2QJ5C+F1DA/FJAjipor7GjfS6+nFhyDKOaKdbzVDlcI=; b=X
	jsLwTa3qxeUa9vqAFByWM2DhChTg9IRV0fdaA3GVEpCJaMvhrxAjjYW2CARhjxVr
	HvUpB395c8GnkjCI3l8kXiW36avt245jZFRGAwZTv1M5lPgg3FpnyBlpEQFPP31D
	2U+up1en62ORxuMGFfvwYaKRlRTQeXHME3swHfSV7/a8AiIT2B3XeALJyD9IjCDf
	tPu3g3/sJOJ4IHtXRzrPJ5lTAGSTIput2dnlv2iooEE9bYKO6IW27dxjYfkxMp/I
	KKnw9FITUOETN8KMjarvd5D9P9uia45tii4cu3IbZ9kATtVVbhSpGlbJkiSgJ9/d
	Sxc7n9vkuy/uarwLi/xIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784705690; x=1784709290; bh=2
	QJ5C+F1DA/FJAjipor7GjfS6+nFhyDKOaKdbzVDlcI=; b=oTiH/q+fknqYEY81U
	Tg5BmibOHkd1NvLmYN/+j2tTVrNGvHNjXG88LW2ZyOul66Vrt686pGf2VtCkzlus
	5kPuv7sJwp71128eU1BQIbF9EQsOJYr64CbaENVursKdPHsJiqFo2FjltC/4qsKb
	nTYWSi0Jol+1sL1WYY66ODPt2LSDj/+6q639dx34iBjb91noY48xvCqQb0CeDifn
	iAwK7vVj9CwYjbnFFgE0SKIzm/6KP3OiNl0JAcA5y89ku2s4JQ2dXVACLai4qGTE
	Y82NTkYTrTbyxWlVKj9kLggkuc477SCvyO2gx7XVlHc6+oWJNjMj6/L80tOCdyVi
	8aaGQ==
X-ME-Sender: <xms:mnJgappuegiI3u7VGDe60GUvIT5CfyFNcZ2_D9TqQvWLc7zscJ_DZg>
    <xme:mnJgarOylbthKyzl5GarYVVCnY3ApylwCUYl1-GO0X4LlTNCSpQsT5IsnlFuGZAZ8
    FCrYARUIy3SivH751MW_MwlGaaKCVXCmpyxR1idJfRDJPfXgaIID0fY>
X-ME-Received: <xmr:mnJgaqh7yTYioxTU6qLMGA9j7N88F6Bt2v23fAVwsR4NsSY2H0Zxvy6g8ZUJ6m5O2G5k1P3SyQ>
X-ME-Proxy-Cause: dmFkZTFVIK4vf39ogJgDXiZBsIX5cHfPmRxt3QSla0pIIZ9ScJ9tXi/bHP/vWEBkPVTl1L
    IfbuvU4DfaJZ1mwduzFfn7E4RMd539NAe4Nv+GvvkJmTdPbaA+JvnHDCfhQNm/6WIdwYjL
    bnGh6mut2Djvd521unXurTCICfSJGXOA/LgrSLF6h6FjfzLl2ui7YsqG66TcSyuAp0usRa
    DPI06wil8NZHdiBd0rqBHmtfxb7nDahAGAqng5wsY7aI5t2QiQ+4IYudVqXKUmsyMu69Ox
    QzC9N9P8oo19JgNPRBGnT3ZfcqE6mYyq5O1odinHV3EQNrhrinQyHolkpzdqCjM8/6yITv
    rKBuCjvL9LmhFur9CM0Ne68aiSSvr0srjurYHRGLtd9/V3TQT7IK5ld/amomT/9m05Hndm
    IBBZL6AEc4vG/Bb1AyQ59Gl1aPX8E0D+40sCfOyfNX2mLBkQrP5YSsAwzNeUcI68uhVyyp
    R5+oFF5zM35U39MctxxMKl1RcGCBvbkDkcFsQ796wWwtMsGCm4S+/nIYNX3p6xzBmzcKqh
    dpRFVyQw1HerrCQjFdfMIlc21TfKNN0vLSHbYYosK6sV0cbh1nyb9jqNDRYUssBNxfyCX5
    DoXOAZEJMCIdL+EzrKEBNGHgpsXZE1RvisQB/cpN/2Inl2rOJ41cmQ2AjC8g
X-ME-Proxy: <xmx:mnJganYWo0hqBEOYWGVusKbtksxVYWKtxh5fbWjMmncb1pJ9aRwR6w>
    <xmx:mnJgamglIr9IeWizwHfXLTPfwOyBO2DXh1L3XeW-3Sj0AK-hodvYtg>
    <xmx:mnJgahZyOkIP-QxMqFJcyS2sZOLzt92m2mUzCqb6HWsr-4tBTnDpRg>
    <xmx:mnJgakP3cKJQLlnMbcxh1kOzHWSJ2t3tL9ZwhsSMEe6DNf9byXTJsg>
    <xmx:mnJgavMlwcKCiGHLtFmo8IQDUFQ5h9DSzL0wH_KYwYiSUyymV9FszvNz>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 03:34:46 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.dufresne@collabora.com
Cc: ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH 3/3] arm64: dts: rockchip: rk3576: add VEPU H.264 encoder nodes
Date: Wed, 22 Jul 2026 19:34:17 +1200
Message-ID: <20260722073417.2064667-4-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722073417.2064667-1-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_003451_440319_8550E8D8 
X-CRM114-Status: UNSURE (   7.79  )
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

Add the two VEPU510 encoder cores at 0x27a00000 / 0x27a10000 and their
IOMMUs.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b622c6fee..9bf4f2c41 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1320,6 +1320,56 @@ vdec_mmu: iommu@27b00800 {
 			#iommu-cells = <0>;
 		};
 
+		vepu0: video-codec@27a00000 {
+			compatible = "rockchip,rk3576-vepu";
+			reg = <0x0 0x27a00000 0x0 0x6000>;
+			interrupts = <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VEPU0>, <&cru HCLK_VEPU0>, <&cru CLK_VEPU0_CORE>;
+			clock-names = "aclk_vcodec", "hclk_vcodec", "clk_core";
+			assigned-clocks = <&cru ACLK_VEPU0>, <&cru CLK_VEPU0_CORE>;
+			assigned-clock-rates = <400000000>, <702000000>;
+			resets = <&cru SRST_A_VEPU0>, <&cru SRST_H_VEPU0>, <&cru SRST_VEPU0_CORE>;
+			reset-names = "video_a", "video_h", "video_core";
+			power-domains = <&power RK3576_PD_VEPU0>;
+			iommus = <&vepu0_mmu>;
+		};
+
+		vepu0_mmu: iommu@27a0f000 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27a0f000 0x0 0x40>;
+			interrupts = <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VEPU0>, <&cru HCLK_VEPU0>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VEPU0>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+		};
+
+		vepu1: video-codec@27a10000 {
+			compatible = "rockchip,rk3576-vepu";
+			reg = <0x0 0x27a10000 0x0 0x6000>;
+			interrupts = <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VEPU1>, <&cru HCLK_VEPU1>, <&cru CLK_VEPU1_CORE>;
+			clock-names = "aclk_vcodec", "hclk_vcodec", "clk_core";
+			assigned-clocks = <&cru ACLK_VEPU1>, <&cru CLK_VEPU1_CORE>;
+			assigned-clock-rates = <400000000>, <702000000>;
+			resets = <&cru SRST_A_VEPU1>, <&cru SRST_H_VEPU1>, <&cru SRST_VEPU1_CORE>;
+			reset-names = "video_a", "video_h", "video_core";
+			power-domains = <&power RK3576_PD_VEPU1>;
+			iommus = <&vepu1_mmu>;
+		};
+
+		vepu1_mmu: iommu@27a1f000 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27a1f000 0x0 0x40>;
+			interrupts = <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_VEPU1>, <&cru HCLK_VEPU1>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VEPU1>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+		};
+
 		vop: vop@27d00000 {
 			compatible = "rockchip,rk3576-vop";
 			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;
-- 
2.43.0


