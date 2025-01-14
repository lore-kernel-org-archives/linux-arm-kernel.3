Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2898CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQA9ecdMH25SErsniG43mqcD8jU+sSVQYQQTTt4OqsU=; b=CTFFmOZXTOcCJq3I2JTJvKYVsP
	E6wI2AZnQyS+RJ4OQagp9k9YD+SNZ0EBDHWqMu2AbK2usKIJM5CHWq05dzx3LdO+sMcdJ+YTgpjss
	lQlK2q7VKS+QhEv67DEdnDCcO0wjncCQ0702NUwbxP9OmihwhYxaMKTz7awao3+Oz+py3dIB0R9CC
	9bldsZBcVtS64DbIlr/AgbyQJYYuZc8i4L00Zx9YwUGxJaoAEk8EspPiKXDAMtUP8mtb8TZLBucT9
	3jbVJUzB886xq41eMtATKogePEu077+CNB6Sb4jpQIC6DxUm4mDFCSwlX9HZUsaS1zF8aEAimn5R5
	AECZi9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXj7a-00000008uri-29Ip;
	Tue, 14 Jan 2025 15:46:26 +0000
Received: from exchange.fintech.ru ([195.54.195.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXj6K-00000008uIn-22yp;
	Tue, 14 Jan 2025 15:45:09 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 14 Jan
 2025 18:44:45 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 14 Jan
 2025 18:44:45 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	"Ryder Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	"Sean Wang" <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] wifi: mt76: mt7915: fix possible integer overflows in mt7915_muru_stats_show()
Date: Tue, 14 Jan 2025 07:44:41 -0800
Message-ID: <20250114154441.16920-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_074508_521786_106B2F7A 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

Assuming sums of values stored in variables such as sub_total_cnt
and total_ppdu_cnt are big enough to warrant their u64 type, it
makes sense to ensure that their calculation takes into account
possible integer overflow issues.

Play it safe and fix the problem by casting right hand expressions
to u64 as well. Also, slightly adjust tabulation.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 1966a5078f2d ("mt76: mt7915: add mu-mimo and ofdma debugfs knobs")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
 .../net/wireless/mediatek/mt76/mt7915/debugfs.c    | 45 +++++++++++-----------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 578013884e43..4fec7d000a63 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -303,9 +303,9 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 		   phy->mib.dl_vht_3mu_cnt,
 		   phy->mib.dl_vht_4mu_cnt);
 
-	sub_total_cnt = phy->mib.dl_vht_2mu_cnt +
-			phy->mib.dl_vht_3mu_cnt +
-			phy->mib.dl_vht_4mu_cnt;
+	sub_total_cnt = (u64)phy->mib.dl_vht_2mu_cnt +
+			     phy->mib.dl_vht_3mu_cnt +
+			     phy->mib.dl_vht_4mu_cnt;
 
 	seq_printf(file, "\nTotal non-HE MU-MIMO DL PPDU count: %lld",
 		   sub_total_cnt);
@@ -353,26 +353,27 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 		   phy->mib.dl_he_9to16ru_cnt,
 		   phy->mib.dl_he_gtr16ru_cnt);
 
-	sub_total_cnt = phy->mib.dl_he_2mu_cnt +
-			phy->mib.dl_he_3mu_cnt +
-			phy->mib.dl_he_4mu_cnt;
+	sub_total_cnt = (u64)phy->mib.dl_he_2mu_cnt +
+			     phy->mib.dl_he_3mu_cnt +
+			     phy->mib.dl_he_4mu_cnt;
 	total_ppdu_cnt = sub_total_cnt;
 
 	seq_printf(file, "\nTotal HE MU-MIMO DL PPDU count: %lld",
 		   sub_total_cnt);
 
-	sub_total_cnt = phy->mib.dl_he_2ru_cnt +
-			phy->mib.dl_he_3ru_cnt +
-			phy->mib.dl_he_4ru_cnt +
-			phy->mib.dl_he_5to8ru_cnt +
-			phy->mib.dl_he_9to16ru_cnt +
-			phy->mib.dl_he_gtr16ru_cnt;
+	sub_total_cnt = (u64)phy->mib.dl_he_2ru_cnt +
+			     phy->mib.dl_he_3ru_cnt +
+			     phy->mib.dl_he_4ru_cnt +
+			     phy->mib.dl_he_5to8ru_cnt +
+			     phy->mib.dl_he_9to16ru_cnt +
+			     phy->mib.dl_he_gtr16ru_cnt;
 	total_ppdu_cnt += sub_total_cnt;
 
 	seq_printf(file, "\nTotal HE OFDMA DL PPDU count: %lld",
 		   sub_total_cnt);
 
-	total_ppdu_cnt += phy->mib.dl_he_su_cnt + phy->mib.dl_he_ext_su_cnt;
+	total_ppdu_cnt += (u64)phy->mib.dl_he_su_cnt +
+			       phy->mib.dl_he_ext_su_cnt;
 
 	seq_printf(file, "\nAll HE DL PPDU count: %lld", total_ppdu_cnt);
 
@@ -404,20 +405,20 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 		   phy->mib.ul_hetrig_9to16ru_cnt,
 		   phy->mib.ul_hetrig_gtr16ru_cnt);
 
-	sub_total_cnt = phy->mib.ul_hetrig_2mu_cnt +
-			phy->mib.ul_hetrig_3mu_cnt +
-			phy->mib.ul_hetrig_4mu_cnt;
+	sub_total_cnt = (u64)phy->mib.ul_hetrig_2mu_cnt +
+			     phy->mib.ul_hetrig_3mu_cnt +
+			     phy->mib.ul_hetrig_4mu_cnt;
 	total_ppdu_cnt = sub_total_cnt;
 
 	seq_printf(file, "\nTotal HE MU-MIMO UL TB PPDU count: %lld",
 		   sub_total_cnt);
 
-	sub_total_cnt = phy->mib.ul_hetrig_2ru_cnt +
-			phy->mib.ul_hetrig_3ru_cnt +
-			phy->mib.ul_hetrig_4ru_cnt +
-			phy->mib.ul_hetrig_5to8ru_cnt +
-			phy->mib.ul_hetrig_9to16ru_cnt +
-			phy->mib.ul_hetrig_gtr16ru_cnt;
+	sub_total_cnt = (u64)phy->mib.ul_hetrig_2ru_cnt +
+			     phy->mib.ul_hetrig_3ru_cnt +
+			     phy->mib.ul_hetrig_4ru_cnt +
+			     phy->mib.ul_hetrig_5to8ru_cnt +
+			     phy->mib.ul_hetrig_9to16ru_cnt +
+			     phy->mib.ul_hetrig_gtr16ru_cnt;
 	total_ppdu_cnt += sub_total_cnt;
 
 	seq_printf(file, "\nTotal HE OFDMA UL TB PPDU count: %lld",

