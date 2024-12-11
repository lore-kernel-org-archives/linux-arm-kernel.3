Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB8AE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 03:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXYbZaarLcOFWSwit2AJs5GzodrHS17+95EDCQbDaJk=; b=gCcPdX/fCKR0pexrUhEDhUtZhS
	ICLpSJfNaP0sTlAMex5XPe+H3H/Xt1RPwrSVKVrpgKAdOtdCAi3rlePUnlqi0ETqcWLQhV7dICu+L
	9vmc09/LUYmyq9njqgbqnG0vqTFNfNCd1eiCH/2RPMEbsiCDINjkqVtr839EFjdvD9w9BxwE4Reuj
	CLiyumsCh65tsPBv8VFOVy3dDlUWF17FQ4SzUjSecUdKBX5AeyN7a8uQctq0rnvyyDLIuecFQ0Qxp
	l8P4VjeMaAsZHj2Lyw7qWJt5ZiPkZK90R+To0jySMihLBmv54A56Ef1iwNttur5Hy/4DhiuDYn4l0
	ScILe4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDKj-0000000Dd3S-0wKb;
	Wed, 11 Dec 2024 03:24:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLDJd-0000000Dccr-0KQY;
	Wed, 11 Dec 2024 03:23:10 +0000
X-UUID: 3ad977e8b76f11ef82ff63e91e7eb18c-20241210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XXYbZaarLcOFWSwit2AJs5GzodrHS17+95EDCQbDaJk=;
	b=MK2FNaR6gOUNiXx7D2effV2Vmhn5YBYgTNBuUuu38g0UMx6RA535eGAcXyBa5pGZEJjtzqhNCqYm3o8e2qA8vrLIsO2iQowMWwLdMBJzdWgYPGgmUk0CYW3V4/2LC2XfPKJRcpj1BLSvj25/11GN/an7vlGP5HGqFxrdypyLymQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ea97fb58-e372-4862-8dae-912eb11333f6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:63532dc1-1c82-4420-82d9-d6eb228f5c4a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 3ad977e8b76f11ef82ff63e91e7eb18c-20241210
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 768586599; Tue, 10 Dec 2024 20:23:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:22:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:22:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 8/8] media: mediatek: mdp3: Add programming flow for unsupported subsys ID hardware
Date: Wed, 11 Dec 2024 11:22:56 +0800
Message-ID: <20241211032256.28494-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
References: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_192309_121916_E85662BA 
X-CRM114-Status: GOOD (  14.41  )
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

To support hardware without subsys IDs on new SoCs, add a programming
flow that checks whether the subsys ID is valid. If the subsys ID is
invalid, the flow will call 2 alternative CMDQ APIs:
cmdq_pkt_assign() and cmdq_pkt_write_s_mask_value() to achieve the
same functionality.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 26 ++++++++++--
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    | 41 +++++++++++++++----
 2 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index df0ab338ef41..58beeffd3fdf 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -320,9 +320,18 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 		return ret;
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
+		struct cmdq_client *cl = (struct cmdq_client *)cmd->pkt.cl;
+
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    set->value, 0xFFFFFFFF);
+		if (cmdq_subsys_is_valid(cl->chan, set->subsys_id)) {
+			cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
+					    set->value, 0xFFFFFFFF);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_assign(&cmd->pkt, 0, CMDQ_ADDR_HIGH(set->reg));
+			cmdq_pkt_write_s_mask_value(&cmd->pkt, 0, CMDQ_ADDR_LOW(set->reg),
+						    set->value, 0xFFFFFFFF);
+		}
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -376,9 +385,18 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	}
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
+		struct cmdq_client *cl = (struct cmdq_client *)cmd->pkt.cl;
+
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    0, 0xFFFFFFFF);
+		if (cmdq_subsys_is_valid(cl->chan, set->subsys_id)) {
+			cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
+					    0, 0xFFFFFFFF);
+		} else {
+			/* only MMIO access, no need to check mminfro_offset */
+			cmdq_pkt_assign(&cmd->pkt, 0, CMDQ_ADDR_HIGH(set->reg));
+			cmdq_pkt_write_s_mask_value(&cmd->pkt, 0, CMDQ_ADDR_LOW(set->reg),
+						    0, 0xFFFFFFFF);
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 3e5d2da1c807..f6c041934779 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -9,9 +9,25 @@
 
 #include "mtk-mdp3-cmdq.h"
 
-#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)	\
-	cmdq_pkt_write_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
+#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)				\
+do {											\
+	typeof(cmd) (_cmd) = (cmd);							\
+	typeof(id) (_id) = (id);							\
+	typeof(base) (_base) = (base);							\
+	typeof(ofst) (_ofst) = (ofst);							\
+	typeof(val) (_val) = (val);							\
+	typeof(mask) (_mask) = (mask);							\
+	if (cmdq_subsys_is_valid(((struct cmdq_client *)_cmd->pkt.cl)->chan, _id)) {	\
+		cmdq_pkt_write_mask(&_cmd->pkt, _id, _base + _ofst, _val,		\
+				    _mask, ##__VA_ARGS__);				\
+	} else {									\
+		/* only MMIO access, no need to check mminfro_offset */			\
+		cmdq_pkt_assign(&_cmd->pkt, 0, CMDQ_ADDR_HIGH(_base));			\
+		cmdq_pkt_write_s_mask_value(&_cmd->pkt, 0,				\
+					    CMDQ_ADDR_LOW(_base + _ofst), _val,		\
+					    _mask, ##__VA_ARGS__);			\
+	}										\
+} while (0)
 
 #define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...)	\
 do {								\
@@ -49,11 +65,20 @@ do {								\
 	cmdq_pkt_set_event(&((c)->pkt), (e));			\
 } while (0)
 
-#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)	\
-do {								\
-	typeof(_mask) (_m) = (_mask);				\
-	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (_m), ##__VA_ARGS__);	\
+#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)				\
+do {											\
+	typeof(cmd) (_cmd) = (cmd);							\
+	typeof(id) (_id) = (id);							\
+	typeof(base) (_base) = (base);							\
+	typeof(ofst) (_ofst) = (ofst);							\
+	typeof(val) (_val) = (val);							\
+	typeof(_mask) (_m) = (_mask);							\
+	if (cmdq_subsys_is_valid(((struct cmdq_client *)_cmd->pkt.cl)->chan, _id))	\
+		cmdq_pkt_poll_mask(&_cmd->pkt, _id, _base + _ofst, _val,		\
+				   _m, ##__VA_ARGS__);					\
+	else										\
+		cmdq_pkt_poll_addr(&_cmd->pkt, _base + _ofst, _val,			\
+				   _m, ##__VA_ARGS__);					\
 } while (0)
 
 #define MM_REG_POLL(cmd, id, base, ofst, val, mask, ...)	\
-- 
2.43.0


