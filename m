Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4BFC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PKHQ/mFxNZbAIae9wAVHTQfR/S1prWOZmagk8WbpsI=; b=4zZwwlrMTIaf2FVzZ3uwBV9WQ6
	otEX/ikRksp8l6Ydly7aPRuJpNovCthtl30Iv0wCIpKaXjX6q1c9QHcBqdHc5NqneAIY7wMSoVEAH
	fd5zWoxNIHPB+oOA8EdHiHxK+iaAehs+kRwLIpBL3VbrOoRqVSFVKjoghFYxBtgUlB3UPRHVN8vBG
	3eZGLNdKCAejU7Sh99DVW6REvfdAdeRQBWcK2bvBVMbWwRkGx0cVWJlcQEHnSEeVG5E05mZSHlo25
	z4yNqNlv+CmlNhmbDnBfUtxWUpeH4ChRBzluaEFUdZ6N1dwmushMxPqxJFwlS4mpUVWOH1A3Q2bS3
	BuDvfuWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1WD-00000004OjK-29Wx;
	Tue, 08 Jul 2025 06:09:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1PZ-00000004Nd0-2jQI;
	Tue, 08 Jul 2025 06:02:38 +0000
X-UUID: 22538ce45bc111f09eb0dd999d3936bf-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9PKHQ/mFxNZbAIae9wAVHTQfR/S1prWOZmagk8WbpsI=;
	b=dkpPTDgYztjfs7i8x6X4Csx1CX457znZun0OwPOS4JmS9BjOp1RUXHfrlCsNlTUqEBvznQ80LwK5Pnhjw+W1zsAhaDzSH1HSgvXZVxGuaNQZkIPN4c6TXbquRg1Z9pf+v4pBWx+gKHMc2juhSKl4BePofTQmN7/4/KRtQn8M8XY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:6aafc21e-64ac-429f-8166-4cc56dc709ef,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:6d797804-5c3a-48d0-8df8-5650ace2a56a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 22538ce45bc111f09eb0dd999d3936bf-20250707
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ot_zhangchao.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1261721461; Mon, 07 Jul 2025 23:02:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Jul 2025 14:02:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Jul 2025 14:02:27 +0800
From: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Hao Qin
	<Hao.qin@mediatek.com>, Wallace Yu <Wallace.Yu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, devicetree
	<devicetree@vger.kernel.org>, Zhangchao Zhang
	<ot_zhangchao.zhang@mediatek.com>
Subject: [PATCH v6] dt-bindings: net: mediatek,mt7925-bluetooth.yaml
Date: Tue, 8 Jul 2025 14:01:49 +0800
Message-ID: <20250708060150.27375-3-ot_zhangchao.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250708060150.27375-1-ot_zhangchao.zhang@mediatek.com>
References: <20250708060150.27375-1-ot_zhangchao.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_230237_723502_EB4D0163 
X-CRM114-Status: GOOD (  19.78  )
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

Reset BT via BT_KILL_1V2_L hardware pin.

On the M.2 standard hardware pin interface, the MTK chip
has a pin called BT_KILL_1V2_L or W_DISABLE#2, it uses
function-level device reset (FLDR) to reset Bluetooth.
When it is pulled low, it can external shut down the BT
function, it is defined as 5 on the MT7925 chip, and is
defined as 248 on the device tree pio controller.

Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
---
 .../bluetooth/mediatek,mt7925-bluetooth.yaml  | 55 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
new file mode 100644
index 000000000000..636b8b3d6a14
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7925-bluetooth.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bluetooth mediatek use BT_KILL_1V2_L hardware pin to reset BT
+
+maintainers:
+  - Sean Wang <sean.wang@mediatek.com>
+
+description:
+  MT7925 chip uses the USB bus to communicate with the host.
+  Two methods are used to reset Bluetooth. It provide hardware
+  pin, when an exception occurs, resetting Bluetooth by hardware
+  pin is more stable than resetting Bluetooth by software. If the
+  corresponding pin is not found in dts, bluetooth can also be
+  reset successfully.
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt7925-bluetooth
+
+  "#gpio-cells":
+    const: 2
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      Default high level, this pin can external shut down the BT function
+      when this pin is pull low, at the same time, USB interface will be also
+      disabled. When this function is not required, external pull high is not
+      required. After 200ms, it is pulled high to 3.3v and the next probe is
+      performed. On typical M.2 key E modules this is the W_DISABLE2# pin.
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    bluetooth {
+      compatible = "mediatek,mt7925-bluetooth";
+      #gpio-cells = <2>;
+      reset-gpios = <&pio 248 GPIO_ACTIVE_LOW>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5959513a7359..d104a5821f20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14676,6 +14676,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,bluetooth.txt
 F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
+F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7925-bluetooth.yaml
 F:	drivers/bluetooth/btmtkuart.c
 
 MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS
-- 
2.46.0


