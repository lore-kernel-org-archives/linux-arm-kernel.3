Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D1CCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Enpj9fYg7Kdz2Uum8sy0T+MgG0vANtu/HY+5vlKFnNI=; b=eVZEN7CiTKT4/E6LcD2MwPPI7N
	vtEVCr0nPi3duvcClwbCKGIJVZ7AbF6JiGussVS616iEn/npX8IbDgafB0ieFzvG5B3fUufX/JTPz
	fpXph3N0CdSQUjCu5DnfQzoXxYDpdSBEijiHA6FbX6jGzfKKhPyxR+EevWDfIQcsBC+itXZYE2p6O
	a1pgPd2kR/3sj+wJh1/aFrBc7JEOnEQeWkJLM70+R2IRC8qhdWPTts3s4TF3Sr/Z22zOnKaaY7brI
	oLIBOMWTgV5m2p9VFb0krUYLTWewm3RRCCtGGGR88zJIehSEpdX1sFH57QF6NKSssCBb6qZBHYmYo
	0R6DVdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIa-00000006qNa-1UaC;
	Fri, 17 Oct 2025 06:50:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9eIS-00000006qAl-0QOq;
	Fri, 17 Oct 2025 06:50:41 +0000
X-UUID: 9539d084ab2511f0a52f393f94899d25-20251016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Enpj9fYg7Kdz2Uum8sy0T+MgG0vANtu/HY+5vlKFnNI=;
	b=qe2zc1k+o0jHzv9ZYxuT8zZUDucGlA4qn9ZQ7CdLhfObkK88N/852b6xG3Bb2zlthhTZDb2d9Q6rXZIq9eJXdigZI/FiUpEvqJK4Wt2G2tJ+hxWY0BkjYzjeMY2btrP45QLn0qrZT1iYt4bvnNS5S3jmLEXY7blEdrSgctk1lok=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e00ffc59-a8f9-4e70-8d1e-c0cdfe7e6cc7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:196d45b9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9539d084ab2511f0a52f393f94899d25-20251016
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 230061138; Thu, 16 Oct 2025 23:50:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Paul-PL
 Chen" <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
	"Xiandong Wang" <xiandong.wang@mediatek.com>, Sirius Wang
	<sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, Chen-yu Tsai
	<wenst@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v8 12/20] soc: mediatek: Use reg_write function pointer for subsys ID compatibility
Date: Fri, 17 Oct 2025 14:44:37 +0800
Message-ID: <20251017065028.1676930-13-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_235040_180911_0F9DF0D0 
X-CRM114-Status: GOOD (  11.94  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 8 +++++---
 drivers/soc/mediatek/mtk-mutex.c | 5 +++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index bb4639ca0b8c..5d3a9bbfda79 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -167,9 +167,11 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
 	u32 tmp;
 
 	if (mmsys->cmdq_base.size && cmdq_pkt) {
-		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
-					  mmsys->cmdq_base.offset + offset, val,
-					  mask);
+		ret = mmsys->cmdq_base.reg_write_mask(cmdq_pkt,
+						      mmsys->cmdq_base.subsys,
+						      mmsys->cmdq_base.pa_base,
+						      mmsys->cmdq_base.offset + offset,
+						      val, mask);
 		if (ret)
 			pr_debug("CMDQ unavailable: using CPU write\n");
 		else
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 38179e8cd98f..bb42ad5ee8ca 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -990,6 +990,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
+	dma_addr_t en_addr = mtx->addr + DISP_REG_MUTEX_EN(mutex->id);
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -998,8 +999,8 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 		return -ENODEV;
 	}
 
-	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
-		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
+	mtx->cmdq_reg.reg_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
-- 
2.43.0


