Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39376E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 03:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2BfXDrGZ7RvRP4Ca4D5lZ3ETGg9zyB/1qmZRsOCQzA=; b=jEEAN4xIEJzyQOJy5b3I83yUqe
	ijLqstHhJTYONAVgSL37nczpqOWFcPiT64bwXx0PG9pl789Tb9TMxw7OEoy8RggmnxMBARNbOpTOo
	eZqnDcx5ygoCtCtqf8LsMUyz/j1ms9af+ee6gcZGplGAxz8woSJoo9HGYW0Fx4l76g5RYicExw0Nl
	qQfuq8F6yl3t1f+v+wozHLtdrdFiCqobpDD0ZHvlnUN6SQmd7FPaFKx8PSD0W8Z4v49e4UeZplQyI
	4BT4qIqeyP0kFSO46lMfWj++x195zEhUv2awnvfhVxrTOAUO39iyh2VXxlPggVcCD03znJAuQTHy/
	CQb3btZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6m6-00000004SrR-2a1I;
	Mon, 30 Dec 2024 03:49:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6jn-00000004STw-1ybQ;
	Mon, 30 Dec 2024 03:46:40 +0000
X-UUID: a9ce5574c66011ef9048ed6ed365623b-20241229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=K2BfXDrGZ7RvRP4Ca4D5lZ3ETGg9zyB/1qmZRsOCQzA=;
	b=gdrBUr8pyMIJtfU8NbkRJAkzR7EfaGfgw/Eg385LurzBxeDPjfJIBtzKG7q41W+bvKW7qSiJMhk/Wl4jAdClJj+Qld1ENOkpMW5xFq+X5GbokmeqwunsS4LpOFE4xe2awah1+6NLB55HQba1iSLwf93+9MvRqhsapK7rmyKx2kA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:775bed21-d8e6-4134-a384-e724c611c8e7,IP:0,U
	RL:25,TC:0,Content:100,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,AC
	TION:release,TS:100
X-CID-META: VersionHash:60aa074,CLOUDID:c88d1537-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|801,TC:nil,Content:3|50,ED
	M:1,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: a9ce5574c66011ef9048ed6ed365623b-20241229
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1478531017; Sun, 29 Dec 2024 20:46:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Dec 2024 11:46:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Dec 2024 11:46:30 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Karl Li <Karl.Li@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Chungying Lu <chungying.lu@mediatek.com>, Chien-Chih Tseng
	<Chien-Chih.Tseng@mediatek.com>, Andy Teng <Andy.Teng@mediatek.com>, Chen-Yu
 Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH v2 1/3] dt-bindings: mailbox: mediatek: Add apu-mailbox dt-bindings
Date: Mon, 30 Dec 2024 11:43:35 +0800
Message-ID: <20241230034446.1195728-2-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241230034446.1195728-1-karl.li@mediatek.com>
References: <20241230034446.1195728-1-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_194639_511622_D9FE715D 
X-CRM114-Status: GOOD (  13.90  )
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

From: Karl Li <karl.li@mediatek.com>

Add devicetree binding for apu-mailbox.

MediaTek APU (AI Processing Unit) is a microcontroller unit
designed for AI acceleration tasks. The MediaTek APU-Mailbox
facilitates communication with the APU microcontroller.

Signed-off-by: Karl Li <karl.li@mediatek.com>
---
 .../mailbox/mediatek,apu-mailbox.yaml         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
new file mode 100644
index 000000000000..fdb0dec5fb78
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,apu-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek APU mailbox
+
+maintainers:
+  - Karl Li <Karl.Li@mediatek.com>
+
+description:
+  MediaTek APU (AI Processing Unit) is a microcontroller unit
+  designed for AI acceleration tasks. The MediaTek APU-Mailbox
+  facilitates communication with the APU microcontroller.
+  Within the MediaTek APU subsystem, a message passing mechanism is
+  built on top of the mailbox system. The mailbox only has limited
+  space for each message. The firmware expects the message header
+  from the mailbox, while the message body is passed through some
+  fixed shared memory.
+
+properties:
+  compatible:
+    const: mediatek,mt8196-apu-mailbox
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The cell describe which channel the device will use.
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#mbox-cells"
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      mailbox@4c200000 {
+        compatible = "mediatek,mt8196-apu-mailbox";
+        reg = <0 0x4c200000 0 0xfffff>;
+        interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+        #mbox-cells = <1>;
+      };
+    };
-- 
2.18.0


