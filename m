Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA909C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jv6bm7w1r44ux8eiNECNysQZlsA1xSn76XPifRRWIXI=; b=30Jy+GagYm30ALksRdRJjyeYZ1
	GRZ99gQRqNzKjEN47/j3CRsQczXqDDARl0j7JRVqu9MJ7KfESJvBA4G0zEByay0Szd+o0TA22oeWA
	Yz+Zq557AKoiySWEOQW0QqjfIehr66322hXPCjSig3C54W/JOmgr4/eMCNXYzK+OLKXIGxM+U993N
	HTirRJrTnJfcPOHu9Xz8EROEWksfyBYyL5sO6pIRVXVJQktUZPK2rkUxKfZjv5vOeyK9U2KA+Ot7l
	JplnfJwjZn0lj8J1V6ysesjivxVOkqNynuVMjZjJtjLXUgCS2tRzo7L9g6tVmrUzhUB5Zg7WayDTO
	/UCY+X/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8A5-000000072MX-3sxe;
	Tue, 21 Jan 2025 06:54:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta869-000000071tt-46M9;
	Tue, 21 Jan 2025 06:50:55 +0000
X-UUID: 0cb24c26d7c411ef9048ed6ed365623b-20250120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jv6bm7w1r44ux8eiNECNysQZlsA1xSn76XPifRRWIXI=;
	b=PKkIEaUwff73irRow7/sHH3Xzlaaval/rXCw+GWt0CLl0tLfJlCHTQoll9j7nMW0c2vFa+IfX8y/8dnVIfB4q9pxqovoZKJ8o/Yy+rgahjQmUPO3XhUuDEGL8CMb8fiJKt7io8WipECS8Uqk4koYy/2JaxzeuGYV3Aq5oKkQqVo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f803e211-f6d1-4377-ba39-9e5f2257df1e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:60aa074,CLOUDID:038e5d85-0f10-4f52-bb41-91703793d3e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0cb24c26d7c411ef9048ed6ed365623b-20250120
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1718783735; Mon, 20 Jan 2025 23:50:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 14:50:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 14:50:47 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Garmin Chang
	<garmin.chang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Friday Yang <friday.yang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188
Date: Tue, 21 Jan 2025 14:50:40 +0800
Message-ID: <20250121065045.13514-2-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250121065045.13514-1-friday.yang@mediatek.com>
References: <20250121065045.13514-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_225054_018597_177F0D62 
X-CRM114-Status: UNSURE (   9.63  )
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

SMI LARBs require reset functions when applying clamp operations.
Add '#reset-cells' for the clock controller located in image, camera
and IPE subsystems.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 .../bindings/clock/mediatek,mt8188-clock.yaml | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
index 860570320545..2985c8c717d7 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
@@ -57,6 +57,27 @@ required:
   - reg
   - '#clock-cells'

+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8188-camsys-rawa
+              - mediatek,mt8188-camsys-rawb
+              - mediatek,mt8188-camsys-yuva
+              - mediatek,mt8188-camsys-yuvb
+              - mediatek,mt8188-imgsys-wpe1
+              - mediatek,mt8188-imgsys-wpe2
+              - mediatek,mt8188-imgsys-wpe3
+              - mediatek,mt8188-imgsys1-dip-nr
+              - mediatek,mt8188-imgsys1-dip-top
+              - mediatek,mt8188-ipesys
+
+    then:
+      required:
+        - '#reset-cells'
+
 additionalProperties: false

 examples:
--
2.46.0


