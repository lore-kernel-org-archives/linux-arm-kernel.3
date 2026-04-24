Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851B3FB44BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZykPdAha4NPT9VYizZPytw0N8+6UcZsOK/5u+ZCHSTU=; b=m1IltpzJvZ3a6o4H7YwpGSeRIJ
	TzAEPWLYN5rUJCkheHLmLgQE/qt1nxH2Ky2JRKzf7KStuv89yi25lxEjCBCJkXjWeTcBZdbUq4TRk
	mMJz5mJbMBOcE3wot2ciuiFHfP8uq9MYXvWKRUY6NkaQEZeGWugSiaCnMiOlXsbiqUn+6j1r4bRMh
	JUfSv8hvZKAeOOxSspmW1dQiGtD+tAShDkacULbfdwDxGnfi7hkBeZlQeTQ6BPibpzLXiOAB0nzSv
	g4t6dJx5xp88OJVRzcVZKz39kDSLxoG3sSZnmoH03Li0hBGududYNBdLb21zoF1l1B94baW8pTuI9
	BEHc6zbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAAJ-0000000CiOf-2Kq2;
	Fri, 24 Apr 2026 06:37:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAAG-0000000CiNy-3O4o;
	Fri, 24 Apr 2026 06:37:25 +0000
X-UUID: 09927f8c3fa811f1a6de359d7043e138-20260423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZykPdAha4NPT9VYizZPytw0N8+6UcZsOK/5u+ZCHSTU=;
	b=NvhB94IyKRtXtcAP+Fn/BQJkYrbizGILFYMCKfGjop6GBhe5BzDBfQyheWtaIbVa5UjMvy8UsWrDl6kDrJtTXt4lDRJ4FmVo2rQ/R3DKWpM2SSRxUgY1B2x42H/GMZqbZ7pwSFT/YFGtFtqB/RP+ViNv/nHManH8y56yJvzc8cQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:020d0bad-ed46-4235-acdc-464bff532b57,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:afe98964-469e-4eb6-aeb8-4b21454b0f32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 09927f8c3fa811f1a6de359d7043e138-20260423
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 185509761; Thu, 23 Apr 2026 23:37:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 24 Apr 2026 14:37:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 24 Apr 2026 14:37:14 +0800
From: <ed.tsai@mediatek.com>
To: <ed.tsai@mediatek.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
	<avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<linux-scsi@vger.kernel.org>
Subject: [PATCH 1/1] Revert "scsi: ufs: Use pre-calculated offsets in ufshcd_init_lrb()"
Date: Fri, 24 Apr 2026 14:35:55 +0800
Message-ID: <20260424063603.382328-2-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_233724_859142_043A2E50 
X-CRM114-Status: GOOD (  12.62  )
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

From: Ed Tsai <ed.tsai@mediatek.com>

This reverts commit d5130c5a093257aa4542aaded8034ef116a7624a.

The offsets stored in utp_transfer_req_desc are in double words on
hosts without UFSHCD_QUIRK_PRDT_BYTE_GRAN, using them directly to
compute ucd_rsp_dma_addr and ucd_prdt_dma_addr results in incorrect
DMA addresses. The manual offsetof(struct utp_transfer_cmd_desc, ...)
calculations always yield correct byte offsets regardless of the quirk
and should be used instead.

Note that these DMA addresses are only used in ufshcd_print_tr() for
error logging, so the impact is limited to misleading error logs.

Fixes: d5130c5a0932 ("scsi: ufs: Use pre-calculated offsets in ufshcd_init_lrb()")
Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4805e40ed4d7..3df2b44111cc 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2971,8 +2971,9 @@ static void ufshcd_init_lrb(struct ufs_hba *hba, struct scsi_cmnd *cmd)
 	struct utp_transfer_req_desc *utrdlp = hba->utrdl_base_addr;
 	dma_addr_t cmd_desc_element_addr =
 		hba->ucdl_dma_addr + i * ufshcd_get_ucd_size(hba);
-	u16 response_offset = le16_to_cpu(utrdlp[i].response_upiu_offset);
-	u16 prdt_offset = le16_to_cpu(utrdlp[i].prd_table_offset);
+	u16 response_offset = offsetof(struct utp_transfer_cmd_desc,
+				       response_upiu);
+	u16 prdt_offset = offsetof(struct utp_transfer_cmd_desc, prd_table);
 	struct ufshcd_lrb *lrb = scsi_cmd_priv(cmd);
 
 	lrb->utr_descriptor_ptr = utrdlp + i;
-- 
2.45.2


