Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6872CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65dhcBTBumYdQfa285ync0lrxRIAn0zEtdaBrmq/jYw=; b=yIrdFflhfIL6tCX5CHo8mZH2rv
	PCZEo+GHRGg346g9GxahnJs6NmSScMV14CEswG7AueJCV+WhQIjg6Y2tjdIZ/HajYs1OKL8AcnDe/
	LudARC3vxw6mq8ZtidqjzUB6bsl6M/rm6q0MxIHUvStji17nxBAewWoZgQYU1IchhClihBlfaPNyR
	WHGIehKrUP1nL2fDx37tFrUp3QVl0uD5iug2exyT6QsBQqdqjtnegawq93G3g8YZdLIjFojrZQdLW
	52BeGwF6e9ZJ9IHWQVDwOC4uaivcbP396WrUSk3EqU01K4ZhfMtWGQPM913994ysqs1lxK3lfxKNy
	sErkGrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErWi-00000006L50-0UdO;
	Fri, 31 Oct 2025 15:58:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErWa-00000006Kxb-1LVy;
	Fri, 31 Oct 2025 15:58:49 +0000
X-UUID: 79b186b0b67211f0a52f393f94899d25-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=65dhcBTBumYdQfa285ync0lrxRIAn0zEtdaBrmq/jYw=;
	b=p8lu8T2KCwa6aqGuyEMLkqXOGmJcq84YOo2L/d2Vi77DsZIit7Q6/9qJxuk1BMatKoLXpr+IO8vQKFs/yil+WOGF/xF8vdPnBaLrhmaVbySpRZJ0kb+R8H1UWYkLBCYcHBZ9/GR2hEMPqqqscQnqG8vMUXRRC1HChda55iwFR0E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:87921d07-56f9-4ed8-b7d1-fc79d6d60541,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:a9d874c,CLOUDID:6ebdfedf-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	3|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 79b186b0b67211f0a52f393f94899d25-20251031
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1126067071; Fri, 31 Oct 2025 08:58:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 23:58:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 23:58:39 +0800
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
Subject: [PATCH 2/9] mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating instruction
Date: Fri, 31 Oct 2025 23:56:30 +0800
Message-ID: <20251031155838.1650833-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_085848_364537_507B807F 
X-CRM114-Status: GOOD (  15.23  )
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

Add the cmdq_mbox_priv structure to store the private data of GCE,
such as the shift bits of the physical address. Then, include the
cmdq_mbox_priv structure within the cmdq_pkt structure.

This allows CMDQ users to utilize the private data in cmdq_pkt to
generate GCE instructions when needed. Additionally, having
cmdq_mbox_priv makes it easier to expand and reference other GCE
private data in the future.

Add cmdq_get_mbox_priv() for CMDQ users to get all the private data
into the cmdq_mbox_priv of the cmdq_pkt.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       |  8 ++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 5791f80f995a..95e8a5331b7c 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -104,6 +104,14 @@ static inline dma_addr_t cmdq_revert_gce_addr(u32 addr, const struct gce_plat *p
 	return (dma_addr_t)addr << pdata->shift;
 }
 
+void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
+{
+	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
+
+	priv->shift_pa = cmdq->pdata->shift;
+}
+EXPORT_SYMBOL(cmdq_get_mbox_priv);
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index e1555e06e7e5..73b70be4a8a7 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -70,13 +70,31 @@ struct cmdq_cb_data {
 	struct cmdq_pkt		*pkt;
 };
 
+struct cmdq_mbox_priv {
+	u8 shift_pa;
+};
+
 struct cmdq_pkt {
 	void			*va_base;
 	dma_addr_t		pa_base;
 	size_t			cmd_buf_size; /* command occupied size */
 	size_t			buf_size; /* real buffer size */
+	struct cmdq_mbox_priv	priv; /* for generating instruction */
 };
 
+/**
+ * cmdq_get_mbox_priv() - get the private data of mailbox channel
+ * @chan: mailbox channel
+ * @priv: pointer to store the private data of mailbox channel
+ *
+ * While generating the GCE instruction to command buffer, the private data
+ * of GCE hardware may need to be referenced, such as the shift bits of
+ * physical address.
+ *
+ * This function should be called before generating the GCE instruction.
+ */
+void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv);
+
 /**
  * cmdq_get_shift_pa() - get the shift bits of physical address
  * @chan: mailbox channel
-- 
2.43.0


