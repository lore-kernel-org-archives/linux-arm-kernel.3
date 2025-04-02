Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF202C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+qZsUJFapTf8u/JWcd9/gNfb6T4J9fVMDBIGBbhkls=; b=uvUkGj6Xp2gTC7L2RpJIpnoAQN
	++vBSsgVC4iY36zs5GjWhOp9Y5w1xNqyOhJtNHIp47YiZF5K+XIfgD7P4Kk+C+dFlckcpLX3E1dGH
	xfl05s+5XVsuT9fQF2VgQKKBy4URYNPA6DirO/CfTEyZVfCezersHI+CVa7mb8wwkq0VjocQ6Vios
	D19rqsIm+6Yt0RPAI2ow8t19JJ1M7maBfBqb7QkjBtmoSh891Nkpv1xNbymcVs+peZNDi5stIr65M
	zamFJbZywMTCh3zmSbSus6//08gvDrEKFwL3JsIadgmy1CmzZwdLCzbYMLNbgdA52NyvNnMJWQWqF
	2aKDaytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu8S-00000005e3g-0wtO;
	Wed, 02 Apr 2025 09:11:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu3C-00000005cw7-2ucG;
	Wed, 02 Apr 2025 09:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743584781;
	bh=+DtDgRryVbhRcjFy78n1sONheq+Cd0bctWKChaGqmPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=glGmzojd9QONIsyYXH+Ac+Qxl5ZQjqRVl+inbow79b4OO9QAtINNlQkWzqloGsL68
	 AF8tTQh0wctxVRvrjBraar4yDjbyJnBtXZyuXXboidhumzJtZCCb5KKzarlVYQGC9N
	 WiborEGzI7s9fwk/4uN0+axlNf8Iakas3ECiZJr1dRg98RqY2DN1QHTcAnR9s9kmC+
	 JXsl63FjWSzJZ89J8QeT6HgJXHxKhFGHZ2SX/QwNfbEexwUknDSkgMwvW/YkscNPSa
	 rHpyRbbHSRT2WsQSSH9baX5A0e8s3ZtOrP+sb7yH+VAv8dL0/R1UF95vY/95v6bPdM
	 mb+Y3jVKnwm9A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9195017E0809;
	Wed,  2 Apr 2025 11:06:20 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	weiyi.lu@mediatek.com,
	tinghan.shen@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/2] arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
Date: Wed,  2 Apr 2025 11:06:15 +0200
Message-ID: <20250402090615.25871-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_020622_875080_9F339D29 
X-CRM114-Status: GOOD (  10.65  )
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

By hardware, the first and second core of the video decoder IP
need the VDEC_SOC to be powered up in order to be able to be
accessed (both internally, by firmware, and externally, by the
kernel).
Similarly, for the video encoder IP, the second core needs the
first core to be powered up in order to be accessible.

Fix that by reparenting the VDEC1/2 power domains to be children
of VDEC0 (VDEC_SOC), and the VENC1 to be a child of VENC0.

Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 50 +++++++++++++-----------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 0cb96cba727a..aeca7eeb4067 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -619,22 +619,6 @@ power-domain@MT8195_POWER_DOMAIN_VPPSYS0 {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8195_POWER_DOMAIN_VDEC1 {
-						reg = <MT8195_POWER_DOMAIN_VDEC1>;
-						clocks = <&vdecsys CLK_VDEC_LARB1>;
-						clock-names = "vdec1-0";
-						mediatek,infracfg = <&infracfg_ao>;
-						#power-domain-cells = <0>;
-					};
-
-					power-domain@MT8195_POWER_DOMAIN_VENC_CORE1 {
-						reg = <MT8195_POWER_DOMAIN_VENC_CORE1>;
-						clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>;
-						clock-names = "venc1-larb";
-						mediatek,infracfg = <&infracfg_ao>;
-						#power-domain-cells = <0>;
-					};
-
 					power-domain@MT8195_POWER_DOMAIN_VDOSYS0 {
 						reg = <MT8195_POWER_DOMAIN_VDOSYS0>;
 						clocks = <&topckgen CLK_TOP_CFG_VDO0>,
@@ -680,15 +664,25 @@ power-domain@MT8195_POWER_DOMAIN_VDEC0 {
 							clocks = <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
 							clock-names = "vdec0-0";
 							mediatek,infracfg = <&infracfg_ao>;
+							#address-cells = <1>;
+							#size-cells = <0>;
 							#power-domain-cells = <0>;
-						};
 
-						power-domain@MT8195_POWER_DOMAIN_VDEC2 {
-							reg = <MT8195_POWER_DOMAIN_VDEC2>;
-							clocks = <&vdecsys_core1 CLK_VDEC_CORE1_LARB1>;
-							clock-names = "vdec2-0";
-							mediatek,infracfg = <&infracfg_ao>;
-							#power-domain-cells = <0>;
+							power-domain@MT8195_POWER_DOMAIN_VDEC1 {
+								reg = <MT8195_POWER_DOMAIN_VDEC1>;
+								clocks = <&vdecsys CLK_VDEC_LARB1>;
+								clock-names = "vdec1-0";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
+
+							power-domain@MT8195_POWER_DOMAIN_VDEC2 {
+								reg = <MT8195_POWER_DOMAIN_VDEC2>;
+								clocks = <&vdecsys_core1 CLK_VDEC_CORE1_LARB1>;
+								clock-names = "vdec2-0";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
 						};
 
 						power-domain@MT8195_POWER_DOMAIN_VENC {
@@ -696,7 +690,17 @@ power-domain@MT8195_POWER_DOMAIN_VENC {
 							clocks = <&vencsys CLK_VENC_LARB>;
 							clock-names = "venc0-larb";
 							mediatek,infracfg = <&infracfg_ao>;
+							#address-cells = <1>;
+							#size-cells = <0>;
 							#power-domain-cells = <0>;
+
+							power-domain@MT8195_POWER_DOMAIN_VENC_CORE1 {
+								reg = <MT8195_POWER_DOMAIN_VENC_CORE1>;
+								clocks = <&vencsys_core1 CLK_VENC_CORE1_LARB>;
+								clock-names = "venc1-larb";
+								mediatek,infracfg = <&infracfg_ao>;
+								#power-domain-cells = <0>;
+							};
 						};
 
 						power-domain@MT8195_POWER_DOMAIN_VDOSYS1 {
-- 
2.48.1


