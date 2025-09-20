Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDF2CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEHbQrE/sWm/pMJihk76GHvzoZEfps6Wywt9aTvb4NE=; b=DA/MTjwXWafLh3mzDwEt0Vev23
	Rbq+xWlaihL8+OacMu8AgTtemdo1V+J11HT2c+En8NZCRdShzWiI1SdKX4sgryZ0PZPGsMN+wlZtF
	IbvS9/OQ7qxbETzbJ401Fa6xmVJqDg78AqHu1gZvzdE592hHPkSAtBnkwwJRZL0rhjOKBmJIQJy1R
	d6r7j931GpKMnPDV5Z/xnXVRBe/XHrwT30k5BlnUDAc/oZogp5YUr29Dfp2b2PdJUsWoSEubkpJKu
	2D/y1BnWKDTmoYgwTceEtbTjhUkwCJ1VPWs5kOYdfuk4ELxkx7Avl21Jd69DL1q9yf9naG0P14SXI
	fooQgN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwCz-00000005HlF-2iqR;
	Sat, 20 Sep 2025 11:56:53 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzwCx-00000005HkM-25G1;
	Sat, 20 Sep 2025 11:56:52 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uzwCr-000000000Wa-2VFC;
	Sat, 20 Sep 2025 11:56:45 +0000
Date: Sat, 20 Sep 2025 12:56:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/4] arm64: dts: mediatek: mt7622: add 'soc-uuid' cell to
 efuse
Message-ID: <40004650c99c09ff540d8e2028a1393f4a70a6b4.1758369130.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_045651_534964_8F3ED9CB 
X-CRM114-Status: UNSURE (   9.55  )
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

The efuse of the MediaTek MT7622 contains an 8-byte unique identifier.
Add a 'soc-uuid' cell covering those 8 bytes to the nvmem defininition
of the efuse to allow easy access from userspace, eg. to generate a
persistent random MAC address on boards like the BananaPi R64 which
doesn't have any factory-assigned addresses.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 917fa39a74f8..158bd9a305d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -278,6 +278,10 @@ efuse: efuse@10206000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		soc-uuid@140 {
+			reg = <0x140 0x8>;
+		};
+
 		thermal_calibration: calib@198 {
 			reg = <0x198 0xc>;
 		};
-- 
2.51.0

