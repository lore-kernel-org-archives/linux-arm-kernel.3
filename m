Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B995BCCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ7Y6ikIfmTL4OiHioZhpeLNoYrylE0Dm3P0nx4WjG0=; b=E73xt6G5myz1oXBamQAUYYLZgS
	l+A5Kme/H29+jO07zogi70Pt7ZKDpZD9SjLTmYmwCfCBHZSgGqiKhsyvOnZAv60KUj7W9dHNmrWHW
	dFbBJfStBJpOwFXQ3L1S/K7kYcmoYB/VSl1QP5wUp+GXXixZkvsr8DFDlr/lhdyxbEmUTFNJ+Gi2c
	u8PJaecFK9KrlfldmAFVLVs21HkI5lKHyq/bn/+dI9TQencSWMsTkhX74vB6lY8bSbbVAh8sIv+SG
	gVbhKMGy+my5w6uLUy0owE8aJDSRMHX/Be4HCwH5iLeyf4P6dkyu3rhJF5pN2axDVRi1ToDvhZhi9
	zeGMZ8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErhg-00000006NkD-3NAH;
	Fri, 31 Oct 2025 16:10:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErhW-00000006Nf6-31Og;
	Fri, 31 Oct 2025 16:10:08 +0000
X-UUID: 0d938d00b67411f09f706fa2197c6ceb-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pQ7Y6ikIfmTL4OiHioZhpeLNoYrylE0Dm3P0nx4WjG0=;
	b=ZnPyPZNaO6nnN5VmxCL9MFP7zkwUa096CrCfWBD5sTEhswsXfIz9lr9sL7RYFBh/Ql5GepWy2Bu++WVNAlwAr81HvIat58slmkPVt4gQCFxBxxYbbHPJf1gRJbfpJn3fd1qLKqDLpCZywLVX9ESonVRJw58A3Kt7GEbbWUE7SQY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:86e79550-5e90-4f8a-8845-816873b6d374,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:a9d874c,CLOUDID:4a057a26-cfd6-4a1d-a1a8-72ac3fdb69c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	3|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0d938d00b67411f09f706fa2197c6ceb-20251031
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 355956828; Fri, 31 Oct 2025 09:10:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 1 Nov 2025 00:09:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sat, 1 Nov 2025 00:09:57 +0800
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
Subject: [PATCH 3/3] mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
Date: Sat, 1 Nov 2025 00:09:34 +0800
Message-ID: <20251031160955.1659524-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031160955.1659524-1-jason-jh.lin@mediatek.com>
References: <20251031160955.1659524-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_091006_770231_9093BCAB 
X-CRM114-Status: GOOD (  11.95  )
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

Since the mailbox driver data can be obtained using cmdq_get_mbox_priv()
and all CMDQ users have transitioned to cmdq_get_mbox_priv(),
cmdq_get_shift_pa() can be removed.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       |  8 --------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 12 ------------
 2 files changed, 20 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 1bf6984948ef..81cd98fc9664 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -123,14 +123,6 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
 }
 EXPORT_SYMBOL(cmdq_get_mbox_priv);
 
-u8 cmdq_get_shift_pa(struct mbox_chan *chan)
-{
-	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
-
-	return cmdq->pdata->shift;
-}
-EXPORT_SYMBOL(cmdq_get_shift_pa);
-
 static void cmdq_vm_init(struct cmdq *cmdq)
 {
 	int i;
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 07c1bfbdb8c4..a42b44d5fd49 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -96,16 +96,4 @@ struct cmdq_pkt {
  */
 void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv);
 
-/**
- * cmdq_get_shift_pa() - get the shift bits of physical address
- * @chan: mailbox channel
- *
- * GCE can only fetch the command buffer address from a 32-bit register.
- * Some SOCs support more than 32-bit command buffer address for GCE, which
- * requires some shift bits to make the address fit into the 32-bit register.
- *
- * Return: the shift bits of physical address
- */
-u8 cmdq_get_shift_pa(struct mbox_chan *chan);
-
 #endif /* __MTK_CMDQ_MAILBOX_H__ */
-- 
2.43.0


