Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648ACE8B38A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 02:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j2Fm07/YQ7UyZ+aL7eB1qY+4/c0JV0+nTKdkopufncI=; b=pO/yvi6sOn72HZRANT6+f/h+Vi
	kKDUEhnuwQUVWCDMg4ObS9vjBsbBuxijwEVtY4yHBIgDkfY3lUMUOme9mFVSlOqXCNdpvwyxbekFT
	Ea37TwpG30nLPDyHFLCQXShDZiPCZddhdYisFCco95d7V88WVLwO3b/sKWQx0wRjMrexx2MdonuSZ
	hnwaeFrprKcOOboCHyqZ3RyuAW4tFL274M7cW9Z+FAwDSKk7GvQ7WOM0yZ9YdXWtVrlJVR6PBtpb4
	i4Dt+y7HCKiRdKmP+kZL2pTGX0Obpz1Xzys3Um8OlV91DuR3c0yePwi5hv6XAjUjWkrWKpqXSuN8t
	LwJAZczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSKa-00000007kbb-1Di5;
	Wed, 04 Feb 2026 02:09:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSKX-00000007kb2-3lLW;
	Wed, 04 Feb 2026 02:09:22 +0000
X-UUID: 7faa5b36016e11f1ad39f32c34db0b1c-20260203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=j2Fm07/YQ7UyZ+aL7eB1qY+4/c0JV0+nTKdkopufncI=;
	b=KbCMShlS8bPDor02S73ZOYAhQS0DV3WHxOkxbotAFGF3RWhHzV3OXh8v+z+4sCJoSgwHt7Zdxq7Je5yQdtRJ/80VUjs5VtL3Y1J4jfoJt16lzDlooTehfprGqTB19zgrCrP4N5taMZqcCAh/Yc2AbAlq9zXmYko4dUd1Wx2UQng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:837f3dd8-0fe6-4c41-b330-95482885e87d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:59944cf0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7faa5b36016e11f1ad39f32c34db0b1c-20260203
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ot_cathy.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1336270601; Tue, 03 Feb 2026 19:09:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Feb 2026 10:09:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Feb 2026 10:09:09 +0800
From: Cathy Xu <ot_cathy.xu@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Mengqi Zhang <Mengqi.Zhang@mediatek.com>, Wenbin Mei
	<Wenbin.Mei@mediatek.com>, Andy-ld Lu <Andy-ld.Lu@mediatek.com>, Yong Mao
	<yong.mao@mediatek.com>, Cathy Xu <ot_cathy.xu@mediatek.com>
Subject: [PATCH] mmc: mtk-sd: disable new_tx/rx and modify related settings for mt8189
Date: Wed, 4 Feb 2026 10:06:29 +0800
Message-ID: <20260204020709.24604-1-ot_cathy.xu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_180921_954965_67C21758 
X-CRM114-Status: GOOD (  11.25  )
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

Disable new_tx/rx and modify related settings helps avoid data
transmission instability, and better compatibility for mt8189.

Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 302ac8529c4f..b2680cc054bd 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -682,15 +682,15 @@ static const struct mtk_mmc_compatible mt8189_compat = {
 	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
-	.data_tune = true,
+	.data_tune = false,
 	.busy_check = true,
 	.stop_clk_fix = true,
-	.stop_dly_sel = 1,
-	.pop_en_cnt = 2,
+	.stop_dly_sel = 3,
+	.pop_en_cnt = 8,
 	.enhance_rx = true,
 	.support_64g = true,
-	.support_new_tx = true,
-	.support_new_rx = true,
+	.support_new_tx = false,
+	.support_new_rx = false,
 	.support_spm_res_release = true,
 };
 
-- 
2.45.2


