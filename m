Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D37D185C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FX729w6H6Nqv4wBPOyEK7eBO51Uitkvy4i1Pv/OOpY4=; b=lKWpAw03fpzyb0WPGw4KjRE3dy
	vTrYC9HIVfkooZGLs8vx1R520xQPL8OQ/ejvkWUz1LDPVn0Slz9z8EqyqrtR5EhL+0Y+mlmEDCS9b
	smrK7KdUUDDwfB8wX3x46ObF1b9UohKJGmMsTq5NdSGU3dVkGyJrJNHqrGLknPiRk7VW1Gfp1D255
	OPn4MdI2joHnb0oLFSHWg8qaOS6mjS/Kq7o1pXKo7tzrEsCnvNjYHrhXaohB/2LGO7Z8TgENYbM3j
	Q7ToxeIcSAmkdAknTWsliSrSne5Pw2DZ+kv89MDhEe51+UnT2tweev16j8AchQ0UbmahcM9q6bC5Q
	ATgPUieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnbE-0000000GgiG-39hl;
	Thu, 08 Jan 2026 10:50:43 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdnb6-0000000GgZl-3AvR;
	Thu, 08 Jan 2026 10:50:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767869410; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hb0bqOACXjW9nULnVnocMyiRCQLSdACvLmGVUeP96pi/m99TjeYW0aIa6ipT/vMV3tw6S8wkSnF9mfitRXouFzSKBE3o2WdKAEIJGKC6bhXMXbgjRzmAneWWoZL79UK7/XMdR+PCw8OtqpCryI2DwfIT2t7T0tuBYzrgETAkT2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767869410; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FX729w6H6Nqv4wBPOyEK7eBO51Uitkvy4i1Pv/OOpY4=; 
	b=VRsgeL03VJ7TychzbYNgFfb4XfFb7Vx1XrQY5kmJvHzf+6/NjExH8kzIrRPNhP7JeOl7avJZpasa9tDyeRedWALX3w9+5oHfqYmo45HEyk60Lj2ReQjIHC27rnMVh3NacX0ChtB7qRMqJlthlPM4G4iUg+m0gGRWlGKwunUDzJc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767869410;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FX729w6H6Nqv4wBPOyEK7eBO51Uitkvy4i1Pv/OOpY4=;
	b=Q1I0qCEr7bO0oXKwQniaS9NDBRKW5ZbG8ynjk8r0WADRMmrMKwe2HWDkvW0BaLBN
	r85urNDLh0GngW5j6LXwHKQbXk1Pel/AWd4evVJQRfAgBToNz7Novgv8CSGWRoanZkR
	dmIDapDpEQyPlOvt+woyzUplixnygvfYWcbzAlEE=
Received: by mx.zohomail.com with SMTPS id 1767869409673349.5310051421236;
	Thu, 8 Jan 2026 02:50:09 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 08 Jan 2026 11:49:22 +0100
Subject: [PATCH v5 03/24] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-mt8196-ufs-v5-3-49215157ec41@collabora.com>
References: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
In-Reply-To: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
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
X-CRM114-CacheID: sfid-20260108_025032_841717_F1A4973B 
X-CRM114-Status: GOOD (  11.50  )
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
2.52.0


