Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349F5D5E140
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 06:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUfXCWBMH14NMLsYilX9Z6Z+VvsztsPB6r7RvqOT/YM=; b=q7uy8aso+0bF5U1MI1zA7CohKI
	tLnHZcbbB4dWT6cXbx10Xe5mwlPsOAf7bvelRm6QNkEG40UZrqa14x/i72WFXeIgDayLvkRmjJNlx
	duHrjxwAgxIY2BM1R6BqcoeDisw1u1KIxGt1WGy5uERFSqsvUaE0mhZOd0oqhWotq8X1lCsAPhwGD
	DF59N01daTTjPGXMxkIPmPJIu+RmlRMAR2kiJ9qysDwkG8aDNdU2ubQv4+76OZw6zQuKm+Ly4k+CC
	Dpu7eonUz6K+3m9h1QEoZLf0LsKIwcIJaryw7Aqd7W+aqSWxHjxvUoNVonieqgCq8oQfp3LIC0w3r
	Ee2mvFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9IkF-00000009WyE-332L;
	Fri, 08 Nov 2024 06:45:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Iez-00000009Vv3-1hsS;
	Fri, 08 Nov 2024 06:39:59 +0000
X-UUID: 420ff1fa9d9c11ef82ff63e91e7eb18c-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HUfXCWBMH14NMLsYilX9Z6Z+VvsztsPB6r7RvqOT/YM=;
	b=B0te3za8+DxBtynEL5rppTJ/gmGnsjvFEu0LoHFVeWFOLqOfsUIDTLMe6n8s1A4DaWx7dHxAs5S64UUxrnbtzeymHniu31g34hesUYooZ6XuvlMpSqlBgKV/qvx3FmKqqADkXBIAHLJ6tLtReAyYp0Qg9nINMzkktaJgdfp8UZA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:eb73530a-d6f0-4de0-b82d-0d55b5e54667,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:c8ffb8ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 420ff1fa9d9c11ef82ff63e91e7eb18c-20241107
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 458820710; Thu, 07 Nov 2024 23:39:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 14:39:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 14:39:49 +0800
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
Subject: [PATCH v2 4/4] cpufreq: mediatek: data safety protect
Date: Fri, 8 Nov 2024 14:39:42 +0800
Message-ID: <20241108063942.19744-5-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241108063942.19744-1-chun-jen.tseng@mediatek.com>
References: <20241108063942.19744-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_223957_472072_ABA03DEC 
X-CRM114-Status: GOOD (  10.55  )
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
index 3369bdd9a348..3303b6d72ea7 100644
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


