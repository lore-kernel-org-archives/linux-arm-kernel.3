Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC23BCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 07:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyjHIshOwF3QP9j3tT6Kjm7WCoOd6J77B7Bsl61p83I=; b=W1zzfTSnTvUq/+xopGzQFZqc13
	8SKDjEdfLy38+kIVY8QPMoYLK2DglVa9fInhrWFlfVLOei+m60kardtLSsxE7uo/Pdmld8Csuqvy0
	zwYA3JIiaGAea9HGCifh+N3SlWEyUavB6Gx58Dz+NFgDuRYOiqxjtGwxy+9+4UojIhV6jjuipDKfX
	yZrznUJnks8jVSLRLCKxIk7I4OdMdh4WanKRnyFTHMncwUjfJzHownt+9B2cnf1qcP22vwv5Zoz8N
	yJ/qRukJ8Fij8XKDlW3ncXLOE2nGWb4SMsdkZNAnh5Vqrssf+AsM8qAHbor8cLAfqFFKJIqUc823Y
	CNa/PA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eXL-00000006vFG-2zgq;
	Fri, 17 Oct 2025 07:06:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eXG-00000006vCl-1Aac;
	Fri, 17 Oct 2025 07:05:59 +0000
X-UUID: 95630576ab2511f09f706fa2197c6ceb-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vyjHIshOwF3QP9j3tT6Kjm7WCoOd6J77B7Bsl61p83I=;
	b=oe6oaXZUjXjMRF0UmlZVaYG75NfZcUBZGW9yEgWK2AW+mw7KUmVtE28LYqH282gJ3IpBiANENcacJUwwaNvak00VkqFzVgcV6YL629+sZlhmeY+qP2Vn2V8E52a6L2P9bA7GCY/bpDGpFlnjUB6y2Ytt7PsIuETZASm0RrGqfFA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:65fe2a8c-1438-46fa-a208-be16c7e02755,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:a9d874c,CLOUDID:2dda5086-2e17-44e4-a09c-1e463bf6bc47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	3|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 95630576ab2511f09f706fa2197c6ceb-20251016
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 789400123; Thu, 16 Oct 2025 23:50:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Oct 2025 14:50:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:32 +0800
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
Subject: [PATCH v8 20/20] mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
Date: Fri, 17 Oct 2025 14:44:45 +0800
Message-ID: <20251017065028.1676930-21-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_000558_311848_1C3862FE 
X-CRM114-Status: GOOD (  12.36  )
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


