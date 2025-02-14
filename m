Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22921C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Av2lEU68lYQ0S7L92vfD2pewctBQ4t+HkHiry0seZP8=; b=dm7e4pAgcbgqqXe8pkj5hCq6RA
	U1QDuRO06Uxe5ggHbxHOfuRJVIX4JGvm9W+s0R0wwDfliJ3OsTgHThWTYeE5xw9Gtod/gpsOV/N8n
	WeGumVQH1KcCAdwoDfBJh2ylSXEzp77SYAJEBsAHT+ArSXDAfB7GA3P6BxOpx0yOt2bMX+VA63QOF
	oBw+bxwClarlbCBIQrsMlpehdv8ne73h4+JvLZhu/++BpdhyaF+8Nh3Tp8s9/W4DSgMr8X9CEoGFq
	ukGTT7rAu3e7XOsM9qByL/U9x6C0L82yzHBxivZ0vl3DHsXvQVpmpqmUG9ZQdFDsThs47zlnoSgkq
	NraaAl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqQ8-0000000E0J8-0kwS;
	Fri, 14 Feb 2025 07:47:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqMj-0000000DzkI-1M1a;
	Fri, 14 Feb 2025 07:44:04 +0000
X-UUID: 7231cf5eeaa711ef82ff63e91e7eb18c-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Av2lEU68lYQ0S7L92vfD2pewctBQ4t+HkHiry0seZP8=;
	b=DHRE9W03+4Q6KpGc4CZizp8GR1RKNo5in8W42CZw2D02Mnl6h4tXz1Ks3kL6Oqomz4N1Z/dbbqPj20nOBJeXExBy3XJuvXIIvqBEsj3W1NTCMdRRLVi232U2RaTbcLKImp1qmQqz9N/R8U12F1I8q36g33R1r3hd26LeAW9HbqU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:06e68016-2dcf-4987-b509-41c6158381dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a1bcbe24-96bd-4ac5-8f2e-15aa1ef9defa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7231cf5eeaa711ef82ff63e91e7eb18c-20250214
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 531459243; Fri, 14 Feb 2025 00:43:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 15:43:54 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 15:43:54 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v3 3/3] cpufreq: mediatek: data safety protect
Date: Fri, 14 Feb 2025 15:43:34 +0800
Message-ID: <20250214074353.1169864-4-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_234401_367328_7F9075E7 
X-CRM114-Status: GOOD (  10.27  )
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

get policy data in global lock session avoid get wrong data.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 68fcb6fcbe48..37b929e81f70 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -201,11 +201,11 @@ static bool is_ccifreq_ready(struct mtk_cpu_dvfs_info *info)
 static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 				  unsigned int index)
 {
-	struct cpufreq_frequency_table *freq_table = policy->freq_table;
-	struct clk *cpu_clk = policy->clk;
-	struct clk *armpll = clk_get_parent(cpu_clk);
-	struct mtk_cpu_dvfs_info *info = policy->driver_data;
-	struct device *cpu_dev = info->cpu_dev;
+	struct cpufreq_frequency_table *freq_table;
+	struct clk *cpu_clk;
+	struct clk *armpll;
+	struct mtk_cpu_dvfs_info *info;
+	struct device *cpu_dev;
 	struct dev_pm_opp *opp;
 	long freq_hz, pre_freq_hz;
 	int vproc, pre_vproc, inter_vproc, target_vproc, ret;
@@ -213,6 +213,11 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 
 	mutex_lock(&mtk_policy_lock);
 
+	freq_table = policy->freq_table;
+	cpu_clk = policy->clk;
+	armpll = clk_get_parent(cpu_clk);
+	info = policy->driver_data;
+	cpu_dev = info->cpu_dev;
 	inter_vproc = info->intermediate_voltage;
 	pre_freq_hz = policy->cur * 1000;
 
-- 
2.45.2


