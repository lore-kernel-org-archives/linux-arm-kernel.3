Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F20CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ru+KiglAiw/O5uCz0AVIdoM4zOCp0MNtiP3BB2SfZEo=; b=2ywub5UAnaScfkDQ3mxyfxuO4D
	dRUtcalSxuyxrs3uISy0NldN7Kit8lYugEEPc2J14kC181PwAWILws0AvP0IsNu4aiqWA4s7/M/Jy
	hVVjgMuhWD1txgnwzFkcwlLQJjI2rPv+9bYFRE1d7ptP6lL2yB3TXq+5h7m9PxkJ2ArUuE6BGC9nf
	mJtzVHNXjnMW26wN4+ZpO8VuCWWbfq9AYt7HFgAUb+7hnfT1tWlAj+LVXrc8zmlW5mY2XJ566Uld7
	2VNO9DAvRynie/2iSOJYINuSGfYB1Sze55AWus4Erdob3ByKOOMg17WCh6KYLxj9WLMlqpd46tOvm
	+jQ6Z2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOuX-000000059zg-1omX;
	Mon, 10 Nov 2025 10:14:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOuL-000000059tf-3P5B;
	Mon, 10 Nov 2025 10:13:59 +0000
X-UUID: f4e7bafebe1d11f0a52f393f94899d25-20251110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ru+KiglAiw/O5uCz0AVIdoM4zOCp0MNtiP3BB2SfZEo=;
	b=iWCXagEdXFGNw+CmoiMY+/U5/zUzl67gQKOS9WdkQgJjoMKMPOhaLOAO5gHTD415dxGxIWL8qpIwVQDE+Q3Zt/BkKB8r5ekONLYEt/IzF24xQjYOXv+J+GSTprikG9xxgdbxmf51llOkg9YhVPlZ5zg/fZl12r18ah1aVNUiTys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:7e1483bd-55e4-4d94-8816-9ef314a007ff,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c9e5ba57-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f4e7bafebe1d11f0a52f393f94899d25-20251110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 578508563; Mon, 10 Nov 2025 03:13:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 10 Nov 2025 18:13:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 10 Nov 2025 18:13:48 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH v3 3/3] dt-bindings: remoteproc: mediatek: Add MT8189 SCP binding
Date: Mon, 10 Nov 2025 18:13:31 +0800
Message-ID: <20251110101342.24261-4-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251110101342.24261-1-huayu.zong@mediatek.com>
References: <20251110101342.24261-1-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_021357_980499_3483DF80 
X-CRM114-Status: UNSURE (   8.95  )
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

Add a new compatible string for MT8189 SCP.
While MT8189 SCP is partially compatible with MT8192, the register layout
has some differences, so a separate binding is required.

Signed-off-by: Huayu Zong <huayu.zong@mediatek.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index 179c98b33b4d..407be544b404 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -20,6 +20,7 @@ properties:
       - mediatek,mt8186-scp
       - mediatek,mt8188-scp
       - mediatek,mt8188-scp-dual
+      - mediatek,mt8189-scp
       - mediatek,mt8192-scp
       - mediatek,mt8195-scp
       - mediatek,mt8195-scp-dual
@@ -168,6 +169,7 @@ allOf:
             - mediatek,mt8183-scp
             - mediatek,mt8186-scp
             - mediatek,mt8188-scp
+            - mediatek,mt8189-scp
     then:
       properties:
         reg:
-- 
2.45.2


