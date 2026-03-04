Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE40EF8FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boVWtyOAgFlCOZgXa/1igeIS/1/YVE4YvcdDUJwkhuU=; b=fS8iuWQPVysgMULKqz4gm2wnUX
	X8SYHq7LZcSYfdxve1MAHzLgMRUvDxYPuL7loYrsnbTrhY2uMf7TpZ3YaVOImOKb9cSbnaoEvYV6u
	kTWm08OtjuOTTgqSbY1i2wPkf/AG7TL7bKBpm9PlQrFiR6ErxItvJsJyQAqbuEoNTyf6ZLn4caZiJ
	2EEopdC6zi1mWpT8kZ96QgA1TqAmUBQUZ1ugv86fTBiaQlCoA9IGEquBP+yIc8nOJpMEqxGJnGyll
	1pzaonu1DfhmOXnHWiWuL3uBd9HUGAuYXf9kQpP5nTpOEHNgUNbufiZ7sag8hZTKrpS9Czl5iiV+o
	A4jSOaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnbz-0000000HSEI-1pnY;
	Wed, 04 Mar 2026 14:54:07 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnbx-0000000HSAf-2Rez;
	Wed, 04 Mar 2026 14:54:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1772636026; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iFxZj7MKQ7mCoqiid+ygv6wrRqeRnDfcyc9B3xdz7FwzX0SWXHxFgeTBOzT668YD08XtLCVf7xSvZSVCQA00YM/EFA/BQ49cDe04YJon121g9mpDAyz3/D1TNZkM3wLKN+0QYarU5+Rkfj64zHCPvFvBsoxXjP3/9CZa3zOlYbM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772636026; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=boVWtyOAgFlCOZgXa/1igeIS/1/YVE4YvcdDUJwkhuU=; 
	b=UipkgSBj8fnFCXvUdosgBg1kIehDtsZ06UWv6gMpaOmCdYpJKHgp8p4avsBiL6MTZQYAnq6mBBLmLjaGmvOVSmBySvQqEHxf97ggWXvjA6mYSgKr811lwPvid0QQB+QdgFdTWauL0rXPQ7l3uijc0y0gpYPxr6J3J39bj9vSH+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772636026;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=boVWtyOAgFlCOZgXa/1igeIS/1/YVE4YvcdDUJwkhuU=;
	b=iLnXp0d7jtiGIMjCVYSEM8LIMRb+ObTBoy1OQWL0ywfxaN7kPwFPwl2JNdvly64H
	CbNj0FtbmirxsIEM86Dy0Q+8C/zKKH3e5AlIW2uANeHuvIMOqawb9VR9leie495uDJF
	bNG8mwU5qvErZXLsQywU/kIRf9ig9TuHuKBddSzw=
Received: by mx.zohomail.com with SMTPS id 1772636025691852.6367265313538;
	Wed, 4 Mar 2026 06:53:45 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 04 Mar 2026 15:53:08 +0100
Subject: [PATCH v8 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-mt8196-ufs-v8-3-5b0eac23314f@collabora.com>
References: <20260304-mt8196-ufs-v8-0-5b0eac23314f@collabora.com>
In-Reply-To: <20260304-mt8196-ufs-v8-0-5b0eac23314f@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_065405_698334_8254C13A 
X-CRM114-Status: GOOD (  12.53  )
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

The MediaTek MT8196 SoC's UFS controller uses three additional clocks
compared to the MT8195, and a different set of supplies. It is therefore
not compatible with the MT8195.

While it does have a AVDD09_UFS_1 pin in addition to the AVDD09_UFS pin,
it appears that these two pins are commoned together, as the board
schematic I have access to uses the same supply for both, and the
downstream driver does not distinguish between the two supplies either.

Add a compatible for it, and modify the binding correspondingly.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 58 +++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index e0aef3e5f56b..a82119ecbfe8 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -16,10 +16,11 @@ properties:
       - mediatek,mt8183-ufshci
       - mediatek,mt8192-ufshci
       - mediatek,mt8195-ufshci
+      - mediatek,mt8196-ufshci
 
   clocks:
     minItems: 1
-    maxItems: 13
+    maxItems: 16
 
   clock-names:
     minItems: 1
@@ -37,6 +38,9 @@ properties:
       - const: crypt_perf
       - const: ufs_rx_symbol0
       - const: ufs_rx_symbol1
+      - const: ufs_sel
+      - const: ufs_sel_min_src
+      - const: ufs_sel_max_src
 
   operating-points-v2: true
 
@@ -131,9 +135,27 @@ allOf:
       properties:
         clocks:
           minItems: 13
+          maxItems: 13
         clock-names:
           minItems: 13
+          maxItems: 13
         avdd09-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-ufshci
+    then:
+      properties:
+        clocks:
+          minItems: 16
+          maxItems: 16
+        clock-names:
+          minItems: 16
+          maxItems: 16
+        avdd18-supply: false
+      required:
+        - operating-points-v2
 
 examples:
   - |
@@ -183,3 +205,37 @@ examples:
 
         mediatek,ufs-disable-mcq;
     };
+  - |
+    #include <dt-bindings/reset/mediatek,mt8196-resets.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ufshci@16810000 {
+        compatible = "mediatek,mt8196-ufshci";
+        reg = <0x16810000 0x2a00>;
+        interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&ufs_ao_clk 6>, <&ufs_ao_clk 7>, <&clk26m>, <&ufs_ao_clk 3>,
+                 <&clk26m>, <&ufs_ao_clk 4>, <&ufs_ao_clk 0>,
+                 <&topckgen 7>, <&topckgen 41>, <&topckgen 105>, <&topckgen 83>,
+                 <&ufs_ao_clk 1>, <&ufs_ao_clk 2>, <&topckgen 42>,
+                 <&topckgen 84>, <&topckgen 102>;
+        clock-names = "ufs", "ufs_aes", "ufs_tick", "unipro_sysclk",
+                      "unipro_tick", "unipro_mp_bclk", "ufs_tx_symbol",
+                      "ufs_mem_sub", "crypt_mux", "crypt_lp", "crypt_perf",
+                      "ufs_rx_symbol0", "ufs_rx_symbol1", "ufs_sel",
+                      "ufs_sel_min_src", "ufs_sel_max_src";
+
+        operating-points-v2 = <&ufs_opp_table>;
+
+        phys = <&ufsphy>;
+
+        avdd09-supply = <&mt6363_vsram_modem>;
+        vcc-supply = <&mt6363_vemc>;
+        vccq-supply = <&mt6363_vufs12>;
+
+        resets = <&ufs_ao_clk MT8196_UFSAO_RST1_UFS_UNIPRO>,
+                 <&ufs_ao_clk MT8196_UFSAO_RST1_UFS_CRYPTO>,
+                 <&ufs_ao_clk MT8196_UFSAO_RST1_UFSHCI>;
+        reset-names = "unipro", "crypto", "hci";
+        mediatek,ufs-disable-mcq;
+    };

-- 
2.53.0


