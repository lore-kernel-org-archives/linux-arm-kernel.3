Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E627CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLf0bzHt+kUtDapNbo6iALZJVNt6NOFjS74bsVLgWEc=; b=YJp4GBWl+7QJ3ZO7iUB/oDQPa1
	3645Kgtrfq8ScofgTaPCKOHX8itS5F7Rg/FrSp5RvGIm45LkPE/+9z5oRGpZFoTZc7FZUyY0Yvy9d
	yhhqbd7AewcgOTpLzr0cPYOe1c4VYOq9IfU3iZlcU3Tsg4Blwe00a8JRNUU6ODjpHHascYXXAimug
	yUsUHj6Jm89jY9+pjTfIY78BRDJRdZJRACLB9+7fNJ2bixLndEk8qXB6FshEu5hFcVkRSsDcaoQyt
	dR5jcUIvWIf7UX7v07vEZ5AEH9rg6bNN3NR1x/43uY3R8sbsda0mYsphf/rNBVlJIDqC4kIE9Mjzj
	BhpfkWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eXP-00000006vJx-3oxz;
	Fri, 17 Oct 2025 07:06:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eXL-00000006vFY-46vS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 07:06:05 +0000
X-UUID: 95447f5cab2511f09f706fa2197c6ceb-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eLf0bzHt+kUtDapNbo6iALZJVNt6NOFjS74bsVLgWEc=;
	b=TNRSoyF0iH68lViMGZLknF731UMvOpFt5IBD7L3XVcN4EzmmIMiKtuSLnq4v8qWuQSgrN3PpFc97y+79B8NKZZZa5Ui2Y6vGGLcdSnb44Jyyuv+udeO4eb7VSRRz17f/9fbWRa7K0jo8ppf34kwWxdVp/+qwpay6apS3IS+TsoI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:aa02c822-0f20-4358-9e84-249c107c2ee9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:27c17d02-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 95447f5cab2511f09f706fa2197c6ceb-20251016
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1812048473; Thu, 16 Oct 2025 23:50:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Oct 2025 14:50:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:31 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v8 13/20] drm/mediatek:Use reg_write function pointer for subsys ID compatibility
Date: Fri, 17 Oct 2025 14:44:38 +0800
Message-ID: <20251017065028.1676930-14-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_000604_047913_205B20A2 
X-CRM114-Status: GOOD (  10.61  )
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

Switch to reg_write and reg_write_mask function pointers for register
access, enabling compatibility with platforms regardless of subsys ID
support.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index ac6620e10262..aa217fb11fd7 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -72,8 +72,8 @@ void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
-			       cmdq_reg->offset + offset, value);
+		cmdq_reg->reg_write(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
+				    cmdq_reg->offset + offset, value);
 	else
 #endif
 		writel(value, regs + offset);
@@ -85,8 +85,8 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, cmdq_reg->subsys,
-			       cmdq_reg->offset + offset, value);
+		cmdq_reg->reg_write(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
+				    cmdq_reg->offset + offset, value);
 	else
 #endif
 		writel_relaxed(value, regs + offset);
@@ -98,8 +98,8 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
-		cmdq_pkt_write_mask(cmdq_pkt, cmdq_reg->subsys,
-				    cmdq_reg->offset + offset, value, mask);
+		cmdq_reg->reg_write_mask(cmdq_pkt, cmdq_reg->subsys, cmdq_reg->pa_base,
+					 cmdq_reg->offset + offset, value, mask);
 	} else {
 #endif
 		u32 tmp = readl(regs + offset);
-- 
2.43.0


