Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49400C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 10:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWkcPM2e2CFvrTsTyG7tZ0840K//JOCba07mPmCwF68=; b=Wps+WG0rTy5W6oW/TKLm6pK76H
	eHpRGdzM0RjQI5FJDpldK8ywFsb3npfy1OAd7HWWNy3/BJwWwWdYjRjnEwQ8pO2Fa6ijnPsLSatKY
	23VRr2pfaGW5Ejhzr2iR69e/gAdu20dT8IXm4BLEyrZdixp9crY3/qE1itwODp0C39IVX83ZmOpwq
	v5bzb2qRHtXNczSSCVQdCTTYuy2cbqCGywpWRqASPQqlskI9KvkcdfMxHM+gnAX8FhXKeMurIj2le
	VD7UU4a2BnyUnhvltfvgpc5Z5Pr6ebYZs022DfEoEfCXQOWeRwLzrKsQpHcA6BNvgOSsSDMxYDyuy
	OhSRC7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDrK-0000000CpFe-07rg;
	Wed, 28 May 2025 10:18:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKDYz-0000000Cmlw-0WAN;
	Wed, 28 May 2025 09:59:10 +0000
X-UUID: 63c775d23baa11f08d385d50fb11b32d-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sWkcPM2e2CFvrTsTyG7tZ0840K//JOCba07mPmCwF68=;
	b=irL0AyQVqkoQ1enut3PxP+q+cMPc8QSLv+IZuJ0uNHCsmDnA5T38loJCORNd5uqfAHex+KwzEhDhoNMinId/n+ILXywFdK1rGPRn252t6mrB8OrnClPucKq0mNnWUBICTOZS0Tiz+mGO1nG7sXWG0ye96ffB5eItZTXc57qQxMc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:cd7fb304-932b-4d58-9b36-369c5b1406bc,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:1850d247-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 63c775d23baa11f08d385d50fb11b32d-20250528
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1455222842; Wed, 28 May 2025 02:59:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 17:59:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 17:59:00 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: media: mediatek-jpeg-encoder: Add MT8189 compatible string
Date: Wed, 28 May 2025 17:57:47 +0800
Message-ID: <20250528095748.17485-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250528095748.17485-1-jianhua.lin@mediatek.com>
References: <20250528095748.17485-1-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_025909_163004_DD3DD67D 
X-CRM114-Status: UNSURE (   8.53  )
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

Add compatible for MT8189 jpeg encoder.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..1d6589468d10 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt8183-jpgenc
           - mediatek,mt8186-jpgenc
           - mediatek,mt8188-jpgenc
+          - mediatek,mt8189-jpgenc
       - const: mediatek,mtk-jpgenc
   reg:
     maxItems: 1
-- 
2.46.0


