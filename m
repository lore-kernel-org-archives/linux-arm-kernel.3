Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00E2D75BB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYsVxPJwUafvgN3ouBHNxY+jbFDGOPc1851ZkHUAz0Q=; b=M14X97crh7RVHsEuq6yWlxiQEh
	ym0ndRxZHEHu6qwa6X1h9NPta0pPmapqiTcEqVV6nW22nju5q05MV8vlUrIWLEB6piZJgnM2FRpOI
	e8FCeBRle8pk30RNNvB/g1i2Jnn39nlqlS3NhgfEAVwVpVa796ahFHYQ+X6zfNRrNE+WoBN8rwjXx
	M5/NbUV9Zau2Y/wpz5wjFeCOGuqUbg7IHwD+AJOJxuFd0dOe2JRp+OBBFcRC3MtTxd0t/8svcMotM
	1xJSsQFB+Gg+atbj8WSLoYjily8+d0iQEOgtvz0H1lb/ARASgFcld/irt6kmiUwkaZ8wyq2IqMi4b
	yy96drDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDymd-0000000GmQs-3rO8;
	Thu, 21 Nov 2024 04:27:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDylg-0000000Gm4Y-0jZh;
	Thu, 21 Nov 2024 04:26:13 +0000
X-UUID: bac95964a7c011ef82ff63e91e7eb18c-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iYsVxPJwUafvgN3ouBHNxY+jbFDGOPc1851ZkHUAz0Q=;
	b=R9meqaIdw4b5XPI2MkXlE8yc+zwpkHsvWKsCDpCtxSVgy5FRzv18FFvZkl9w2Ey3ADtk8CV7Z7rO+DZKMCnZ8jjDwj5E7Ui8/svATf3P20qLuKwrrvrBVXGrXt4Sn0uTTgXEUYtNDLuWgfA8aVukNrvaQS89zueIE0TP66/iOl4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:50c4d98e-7766-4b1e-a4f5-23733d3603ea,IP:0,U
	RL:0,TC:0,Content:54,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:54
X-CID-META: VersionHash:464815b,CLOUDID:0b1b8fa0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|801,TC:nil,Content:3,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bac95964a7c011ef82ff63e91e7eb18c-20241120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 897848466; Wed, 20 Nov 2024 21:26:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:04 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Moudy
 Ho" <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 2/8] dt-bindings: mailbox: mediatek: Add MT8196 support for gce-mailbox
Date: Thu, 21 Nov 2024 12:25:56 +0800
Message-ID: <20241121042602.32730-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.390200-8.000000
X-TMASE-MatchedRID: hnk2xlnUc9YD2WXLXdz+ARbjReJSRusbpsZw4P6Q+TmjxYyRBa/qJQJj
	6WxgWJYb5MIx11wv+CPGVuWouVipch3y9EPQ29hTS4QvMgPi4rT00uCJK/yUIdV+smgttBpwMA0
	aaWeqSaKniFIa4757SbiNqDm+7pwF4HIrrZ284hLKTveX26lSvY6H7DI0GsVcMmI24qiENwrMpI
	bcl3IoA+q1XYAYw09qIdY9jOi4lTI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.390200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 54E379BF026BF219D9EA77783C85C521D5323C141728D201CE6D173B3C59F7D52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_202612_215900_CCF4AE2A 
X-CRM114-Status: UNSURE (   9.46  )
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

Add compatible name and iommus property for MT8196.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..73d6db34d64a 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8188-gce
           - mediatek,mt8192-gce
           - mediatek,mt8195-gce
+          - mediatek,mt8196-gce
       - items:
           - const: mediatek,mt6795-gce
           - const: mediatek,mt8173-gce
@@ -49,6 +50,9 @@ properties:
     items:
       - const: gce
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - "#mbox-cells"
-- 
2.43.0


