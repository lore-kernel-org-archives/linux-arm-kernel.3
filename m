Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE0CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFtTq6aHl4LnmUX8oUJuJd7fxhJRJVthJLoqd2hrnzg=; b=1YNIazi14Q0to0SVxQqta4u6ID
	m5wEYihnwPn9SArlXGcuiQ/lJoMc2iYQH3DKSEc7XGWd/BkX8C3YSnknLAv2Bf5uz5C8cJus9u27h
	9GCz+Bt8g6+y/+Pj8iMS4VP+BNor/ZKc7TaeCLwfKZZzEuzveJ7xrXRMoZxzJy+zl1adYcwboT3MK
	+Z1GETR7s5NQW5esEyZ+puBFwYOxLxJ1t3wAoFsEnM0Eyf/DGsNlotdH90P0Lk8yUNEzlWnBG80RS
	sWrRvt088nRaGx/1mHsD7vh5e6QOjEXHGZGNoyNRxNcMmpjgsYDXboR6/jyN9/vIiuiESbvciN4rd
	ycGPVlLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwDK-00000005HzX-2HS3;
	Sat, 20 Sep 2025 11:57:14 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwDI-00000005HwA-08qk;
	Sat, 20 Sep 2025 11:57:13 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uzwDF-000000000XJ-3xao;
	Sat, 20 Sep 2025 11:57:10 +0000
Date: Sat, 20 Sep 2025 12:57:07 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: mediatek: mt7988a: add 'soc-uuid' cell to
 efuse
Message-ID: <2c205246baddde49c66fd918c46e5125b395d083.1758369130.git.daniel@makrotopia.org>
References: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_045712_074015_D564E735 
X-CRM114-Status: GOOD (  10.55  )
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

The efuse of the MediaTek MT7988 contains a 16-byte unique identifier.
Add a 'soc-uuid' cell covering those 16 bytes to the nvmem defininition
of the efuse to allow easy access from userspace, eg. to generate a
persistent random MAC address on boards like the BananaPi R4 which
doesn't have any factory-assigned addresses.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 366203a72d6d..93c9f8c3f223 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -714,6 +714,10 @@ efuse@11f50000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			soc-uuid@140 {
+				reg = <0x140 0x10>;
+			};
+
 			lvts_calibration: calib@918 {
 				reg = <0x918 0x28>;
 			};
-- 
2.51.0

