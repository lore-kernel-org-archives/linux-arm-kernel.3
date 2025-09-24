Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDAECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoSu2fJTIg2tOBaQI/yiLzTwJrsr6QRQNWtcsqnm/A0=; b=vwaVBCBYLjdKqB+PGV5X9LHpaM
	jn8/FhIXSPz1cE5cmPWKujVcTNfyXEUwo73M8SdN2NdhjlfMJ4dVG9e+lOfS2evJqZTgntlqyO+WF
	GIEb5azRW5Mff7pZL89IMfxXD/YaQJyVHSq0HM08IrOr2vB9fe3FxXHzRG9nLYFV3fhNR9jvJ2BUj
	UNT+J8CHVNCUhiyYyS0HI8ce/yUM5D5ifA6AX9maVbL7l1MLEj9NpGTYh87GrgIPocGSGpTQvT9Ki
	7NtChvIiP7Gi7Cl3NE/XUxKILj6WoXNr2+5mzFF+HbgTIq142urn36kN9M3hS+xeK7OCsrMZK4DKz
	HbIPr/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1L7J-0000000Fvf3-1frL;
	Wed, 24 Sep 2025 08:44:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1L74-0000000FvSu-3ryB;
	Wed, 24 Sep 2025 08:44:36 +0000
X-UUID: ae941cca992211f0a52f393f94899d25-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XoSu2fJTIg2tOBaQI/yiLzTwJrsr6QRQNWtcsqnm/A0=;
	b=T3AVlxLgbsru6Rzcl6G3xogDcoX9vdzG9gToFSCa9Y5YZI1YbS88dO6albYlLKpXL/WtZ1GNatFms322t7m1I024oFx0hPyGwsrUSoqNDS0JkiTXcLvCL48E5xsTywiY3USL0omOoz6ZPXt+Si+h7MJFIezn4D1HO0NMrvf81d0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:984a2923-59ac-46e1-bf0b-b84515e94618,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:585da1e9-2ff9-4246-902c-2e3f7acb03c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ae941cca992211f0a52f393f94899d25-20250924
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 535039976; Wed, 24 Sep 2025 01:44:28 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 16:44:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 16:44:24 +0800
From: Huayu Zong <huayu.zong@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Huayu Zong
	<huayu.zong@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Add binding for mt8189 scp
Date: Wed, 24 Sep 2025 16:44:17 +0800
Message-ID: <20250924084422.4604-2-huayu.zong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250924084422.4604-1-huayu.zong@mediatek.com>
References: <20250924084422.4604-1-huayu.zong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_014434_961988_98931C68 
X-CRM114-Status: GOOD (  10.53  )
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

Add the compatible for mt8189 SCP to the binding.

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


