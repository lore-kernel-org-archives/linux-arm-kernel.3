Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD9EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/6lLQjCbagfAvXX/QHmNc4+6NAstu3XUaMziN2qYXc=; b=1I9aOP4bVtkLjRDqGCVytna9Je
	WjOWDJDCoXCwjCPHoHSZHT1OFiUvo+b0iBTYMtWwA4IAm9IrM87yCrPg0ZJG5RdR9nUn3p6nM20v5
	Nf/opBSkrWWv1M4oJX/Ozd+8RiEss9M9h2XC9+52EFsZhRH1s0hDwDLgvNKYMUBaJtIfiIUAbTs9L
	GgSmvxmasgjD/Fe810aGKB08jRNNl1MA48wA5NwrvKwUPDwA/Ds029j1iW0bLdpRTvTvNYGnjuNfg
	XU5zPuyBWcBFPKAyHpUZsfz4A0Aua9BDVX9ersjZUt7HpdsC5SpJndSleR4qh9QOfDrp6AkZdAQxX
	nik3j57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjF5W-0000000HPQs-0eFa;
	Sat, 15 Feb 2025 10:07:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjF44-0000000HPB3-27qf;
	Sat, 15 Feb 2025 10:06:25 +0000
X-UUID: 806daa9ceb8411ef9048ed6ed365623b-20250215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=G/6lLQjCbagfAvXX/QHmNc4+6NAstu3XUaMziN2qYXc=;
	b=lWwhtt5mYDKEH/CpkZVVvrn162UKeNbzeT3ADuPKPjhL1snp7EAAgroBMObz1jDAkcyP0ooM8syr9YsNB3lsMiMGiYc8i3U/GzwPnv5WOcTewBpZDv0NoPnWYMd4zZWKRut3ecGVj1OeR9bqYL0V9Zpys6jMMpTh26a6yds54qg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:71b1c370-aa9e-4b46-b112-c7820ded2a84,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:0b316988-f9ab-4ac1-951b-e3a689bed90c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 806daa9ceb8411ef9048ed6ed365623b-20250215
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1871670014; Sat, 15 Feb 2025 03:06:19 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 15 Feb 2025 18:06:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 15 Feb 2025 18:06:16 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/4] dt-bindings: usb: mtk-xhci: add support mt8196
Date: Sat, 15 Feb 2025 18:06:11 +0800
Message-ID: <20250215100615.808-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_020624_548977_7A6C8DE3 
X-CRM114-Status: UNSURE (   9.91  )
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

There are three USB controllers on mt8196, each controller's wakeup
control is different, add some specific versions for them, and add
a new compatilbe for mt8196.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: add acked by Conor
v2: no changes
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index ef3143f4b794..cacb3d3dc4ac 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -36,6 +36,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8196-xhci
           - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
@@ -164,7 +165,10 @@ properties:
             104 - used by mt8195, IP1, specific 1.04;
             105 - used by mt8195, IP2, specific 1.05;
             106 - used by mt8195, IP3, specific 1.06;
-          enum: [1, 2, 101, 102, 103, 104, 105, 106]
+            107 - used by mt8196, IP0, specific 1.07;
+            108 - used by mt8196, IP1, specific 1.08;
+            109 - used by mt8196, IP2, specific 1.09;
+          enum: [1, 2, 101, 102, 103, 104, 105, 106, 107, 108, 109]
 
   mediatek,u3p-dis-msk:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.46.0


