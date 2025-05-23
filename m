Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAA4C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y4tw7qmJ3jSvvoRbf0zUM7ZRt2Sjeuu4sfQXYus+jSY=; b=I37FtVhaj9LWTYsWapQrhzN9oJ
	JthsMj4Qrccgc+uP4El5xr7cvHx6GVVt67SiqgSYH6o2S46uszTpzKzMVPLBJucq4JOHzGgYxncmg
	HuDC0YF+fNPtgzb4GXtyWAWLlqYr6dQysPuksbz9zqT2YpeE69jCUzwxitj8ZuASdv3Q6XoERzx4N
	XLf1OEyz3DLM7tCv6yAbpEUhSLXUpSoBjyWjOocQyw4u4LqWmzynTxyyUHyriWtXYdtkTFeyunTEU
	iU12vm65Zhz90F9NYg4bMwvRG/BDGj5pkr8KTFCXiBcbwK9gCmIPgDHgKwBU765EjEU2EouNqFZV+
	LVDPd/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQUm-00000003hHr-2lHd;
	Fri, 23 May 2025 11:23:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPNQ-00000003YCz-3GoT;
	Fri, 23 May 2025 10:11:45 +0000
X-UUID: 507e6d7237be11f0bed96b30c12bc3d6-20250523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Y4tw7qmJ3jSvvoRbf0zUM7ZRt2Sjeuu4sfQXYus+jSY=;
	b=sPuMG2SrFHnAkvWaCugRz5veb7BclODgAlRZjoF2fTDL3huBBTQQzS9mPo9YhNKC4BRtHInlzx/jVgpCcI0PoZryEsHHoxeA4lj0OR87cCCJFjgAfCbWKeP7PS7CNViIrjpgUdM0MILLng3+GqPwOHXpyJYghPgysj0Q7i+2/ao=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:593b35e1-9d16-4f39-8198-dde544ec9460,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:7196e657-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 507e6d7237be11f0bed96b30c12bc3d6-20250523
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <naomi.chu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1371416136; Fri, 23 May 2025 03:11:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 23 May 2025 18:11:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 23 May 2025 18:11:34 +0800
From: <naomi.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <naomi.chu@mediatek.com>,
	<peter.wang@mediatek.com>, <alice.chao@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<yi-fan.peng@mediatek.com>
Subject: [PATCH 1/1] ufs: core: add fatal errors check for LINERESET
Date: Fri, 23 May 2025 18:10:34 +0800
Message-ID: <20250523101041.3615819-1-naomi.chu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_031144_835378_BF0348BB 
X-CRM114-Status: GOOD (  13.54  )
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

From: Naomi Chu <naomi.chu@mediatek.com>

The current error handling flow directly checks the power mode after a
LINERESET occurs. However, if a PA_INIT_ERR occurs after the LINERESET,
checking the power mode may require waiting for three DME_GET timeouts,
which wastes 1.5 seconds.

To improve efficiency, when a LINERESET occurs, wait for PA_INIT to
complete and check for any other errors. After a LINERESET, PA_INIT
takes up to 75.4ms to complete. Therefore, a 100ms delay is added.

Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7735421e3991..c7cc62429fc9 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6359,6 +6359,46 @@ static inline bool ufshcd_is_saved_err_fatal(struct ufs_hba *hba)
 	       (hba->saved_err & (INT_FATAL_ERRORS | UFSHCD_UIC_HIBERN8_MASK));
 }
 
+static bool ufshcd_is_linereset_fatal(struct ufs_hba *hba)
+{
+	bool needs_reset = true;
+	unsigned long flags;
+	int err;
+
+	spin_lock_irqsave(hba->host->host_lock, flags);
+
+	if (ufshcd_is_saved_err_fatal(hba)) {
+		spin_unlock_irqrestore(hba->host->host_lock, flags);
+		goto out;
+	}
+
+	/*
+	 * Wait for 100ms to ensure the PA_INIT flow is complete,
+	 * and check for PA_INIT_ERR or other fatal errors.
+	 */
+	spin_unlock_irqrestore(hba->host->host_lock, flags);
+	msleep(100);
+	spin_lock_irqsave(hba->host->host_lock, flags);
+
+	if (ufshcd_is_saved_err_fatal(hba)) {
+		spin_unlock_irqrestore(hba->host->host_lock, flags);
+		goto out;
+	}
+
+	/*
+	 * PA_INIT_ERR on the device side will not trigger UIC
+	 * error interrupt.
+	 * Send NOP to check if the link is alive.
+	 */
+	spin_unlock_irqrestore(hba->host->host_lock, flags);
+	err = ufshcd_verify_dev_init(hba);
+	if (!err)
+		needs_reset = false;
+
+out:
+	return needs_reset;
+}
+
 void ufshcd_schedule_eh_work(struct ufs_hba *hba)
 {
 	lockdep_assert_held(hba->host->host_lock);
@@ -6655,6 +6695,11 @@ static void ufshcd_err_handler(struct work_struct *work)
 		if (!hba->saved_uic_err)
 			hba->saved_err &= ~UIC_ERROR;
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
+		if (ufshcd_is_linereset_fatal(hba)) {
+			needs_reset = true;
+			spin_lock_irqsave(hba->host->host_lock, flags);
+			goto do_reset;
+		}
 		if (ufshcd_is_pwr_mode_restore_needed(hba))
 			needs_restore = true;
 		spin_lock_irqsave(hba->host->host_lock, flags);
-- 
2.45.2


