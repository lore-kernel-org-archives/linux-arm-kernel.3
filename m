Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB70DC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xe2XBrrtNpTWWH4VufOJigZ8hod/OFS9cB8agzNiSY0=; b=kqXZQcZegJTl3dHpkBqME1TOP2
	hZNt5amwR04jgge0nndkekHvQ1/vo/mwtoji9zBh3+cEsbY/J5vQpCRmXxOiEa61lIC/wTQHd33ZI
	wrunsDsfJ+3m+J4q9a0DyOYZFk8Gu7DfEx5zBXAHYW7Ia/FODTz0A9VcB9eEGuZOgeUDsNUrMAGLB
	xNra3B5/7V1Hs6jU2jbKSBDU6O9+6RX71fzFjMRcOx97qewjYlttoXZqRSYGW3sqOs8ewIflLzACo
	tug8oPaSGnWcqOxBFFu/X2tAM1dFrPpnE4cuKe99ARALMqUZefKHe/V67id13/DAy6FrgSvfx/NKF
	wHc8QfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPd3-00000008yA0-3KOH;
	Mon, 12 May 2025 09:39:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEPNI-00000008uCg-20iy;
	Mon, 12 May 2025 09:23:05 +0000
X-UUID: b1cfcb5c2f1211f08d385d50fb11b32d-20250512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xe2XBrrtNpTWWH4VufOJigZ8hod/OFS9cB8agzNiSY0=;
	b=fZtJxNLZmLmGxUj1p1XHlXaE1KJnp+GUxUkIBBcFEFhOBFPasdAk1R0WYi1fG6oWZ1xz0ihO6Ed1Im5nWVIWKm/A4QiIVPBMocDnwRLS++RzgGaVvwWi3XPzs76a/tAZiq9Tm8aU6qGVVujtT1jMm8m2RsT1oEiI+c3pAFJQTNc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:196fcc5a-6724-4437-9304-f052bc93a594,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f1b5dce0-512b-41ef-ab70-9303a9a81417,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b1cfcb5c2f1211f08d385d50fb11b32d-20250512
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1681935058; Mon, 12 May 2025 02:22:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 12 May 2025 17:22:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 12 May 2025 17:22:53 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH RESEND v5 08/20] media: platform: mtk-mdp3: Use cmdq_pkt_jump_rel() without shift_pa
Date: Mon, 12 May 2025 17:19:30 +0800
Message-ID: <20250512092252.905629-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
References: <20250512092252.905629-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_022304_549915_34187AFC 
X-CRM114-Status: GOOD (  15.05  )
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

With the removal of the shift_pa parameter, cmdq_pkt_jump_rel_temp()
can be replaced by the new cmdq_pkt_jump_rel() without shift_pa.

Then, remove the cmdq_shift_pa variable in the mdp_dev structure for
each mbox client.

Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 --
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index aa245bf7e7c4..c4e0d376a055 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -628,7 +628,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 		goto err_free_path;
 	}
 	cmdq_pkt_eoc(&cmd->pkt);
-	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp_idx]);
+	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE);
 
 	for (i = 0; i < num_comp; i++) {
 		s32 inner_id = MDP_COMP_NONE;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index f571f561f070..5e94ff0d0756 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -312,8 +312,6 @@ static int mdp_probe(struct platform_device *pdev)
 			ret = PTR_ERR(mdp->cmdq_clt[i]);
 			goto err_mbox_destroy;
 		}
-
-		mdp->cmdq_shift_pa[i] = cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
 	}
 
 	init_waitqueue_head(&mdp->callback_wq);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 05cade1d098e..430251f63754 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -126,7 +126,6 @@ struct mdp_dev {
 	u32					id_count;
 	struct ida				mdp_ida;
 	struct cmdq_client			*cmdq_clt[MDP_PP_MAX];
-	u8					cmdq_shift_pa[MDP_PP_MAX];
 	wait_queue_head_t			callback_wq;
 
 	struct v4l2_device			v4l2_dev;
-- 
2.43.0


