Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20C1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGx9P0mJqQozpBOCmZwQ+5UxE4Q0iSbhG8oMKQTzU8s=; b=ENoR1iimyM3pdgM0EhHL9NalfR
	+OKRYrmuvJtd6Yrtvrut47CXzpzswoKjP9oLXIMm1FQ2ISXTtVR0v5UajbyoEkfBuMBtoRJVioDFj
	cMuSbRp7BsbUL2RRjhifEu0UqX3fYey68hl7hQy++6hgvsu/oiE1Rx25DKDM9+bJbxao20pVHhH0r
	5upPXhL38OQyiRIQjQeeY+D1mtgS10SYnVodXXuWJs62sf8IKT6KXCYUta2D7y/9TxB84uQpAxRr9
	wmzORZJcoGYh5OnV3OBGU+/km0XvMPnhXPdLaMxJzNjbsWsucWTITo8Eb8dKgLsrkVsVCAxr6ly39
	TgnbWZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqUL-0000000E0yC-1s4L;
	Fri, 14 Feb 2025 07:51:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqMk-0000000DzlC-0Qf1;
	Fri, 14 Feb 2025 07:44:06 +0000
X-UUID: 7207c77ceaa711ef82ff63e91e7eb18c-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yGx9P0mJqQozpBOCmZwQ+5UxE4Q0iSbhG8oMKQTzU8s=;
	b=fWFzqQRGObW4P4gC1w8gwsRWpBKonwEy8O2vypG0kwi2GrAZNkAOiKlM7k6ymwIhXiXlGU6D+r9g4o5uLMQL5GlPEkmQp+OzT/pd5bqJJzqBX21Stu7TCh99eiz3LCmZNk6z4CZcPwAT9wx2eCihsYbGFLEU94O4CKK6edWKcDM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:e01bf2ed-dbe5-40f1-8d81-150767a2a239,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a0bcbe24-96bd-4ac5-8f2e-15aa1ef9defa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7207c77ceaa711ef82ff63e91e7eb18c-20250214
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 142410075; Fri, 14 Feb 2025 00:43:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 15:43:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 15:43:53 +0800
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
Subject: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race condition
Date: Fri, 14 Feb 2025 15:43:32 +0800
Message-ID: <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_234402_143627_8EA39457 
X-CRM114-Status: GOOD (  16.48  )
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

In mtk_cpufreq_set_target() is re-enter function but the mutex lock
decalre in mtk_cpu_dvfs_info structure for each policy. It should
change to global variable for critical session avoid race condition
with 2 or more policy.

add mtk_cpufreq_get() replace cpufreq_generic_get() and use global lock
avoid return wrong clock.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 39 ++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 2656b88db378..07d5958e106a 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -49,8 +49,6 @@ struct mtk_cpu_dvfs_info {
 	bool need_voltage_tracking;
 	int vproc_on_boot;
 	int pre_vproc;
-	/* Avoid race condition for regulators between notify and policy */
-	struct mutex reg_lock;
 	struct notifier_block opp_nb;
 	unsigned int opp_cpu;
 	unsigned long current_freq;
@@ -59,6 +57,9 @@ struct mtk_cpu_dvfs_info {
 	bool ccifreq_bound;
 };
 
+/* Avoid race condition for regulators between notify and policy */
+static DEFINE_MUTEX(mtk_policy_lock);
+
 static struct platform_device *cpufreq_pdev;
 
 static LIST_HEAD(dvfs_info_list);
@@ -209,12 +210,12 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	long freq_hz, pre_freq_hz;
 	int vproc, pre_vproc, inter_vproc, target_vproc, ret;
 
+	mutex_lock(&mtk_policy_lock);
+
 	inter_vproc = info->intermediate_voltage;
 
 	pre_freq_hz = clk_get_rate(cpu_clk);
 
-	mutex_lock(&info->reg_lock);
-
 	if (unlikely(info->pre_vproc <= 0))
 		pre_vproc = regulator_get_voltage(info->proc_reg);
 	else
@@ -308,7 +309,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	info->current_freq = freq_hz;
 
 out:
-	mutex_unlock(&info->reg_lock);
+	mutex_unlock(&mtk_policy_lock);
 
 	return ret;
 }
@@ -316,19 +317,20 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
 				    unsigned long event, void *data)
 {
-	struct dev_pm_opp *opp = data;
+	struct dev_pm_opp *opp;
 	struct dev_pm_opp *new_opp;
 	struct mtk_cpu_dvfs_info *info;
 	unsigned long freq, volt;
 	struct cpufreq_policy *policy;
 	int ret = 0;
 
+	mutex_lock(&mtk_policy_lock);
+	opp = data;
 	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
 
 	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
 		freq = dev_pm_opp_get_freq(opp);
 
-		mutex_lock(&info->reg_lock);
 		if (info->current_freq == freq) {
 			volt = dev_pm_opp_get_voltage(opp);
 			ret = mtk_cpufreq_set_voltage(info, volt);
@@ -336,7 +338,6 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
 				dev_err(info->cpu_dev,
 					"failed to scale voltage: %d\n", ret);
 		}
-		mutex_unlock(&info->reg_lock);
 	} else if (event == OPP_EVENT_DISABLE) {
 		freq = dev_pm_opp_get_freq(opp);
 
@@ -361,6 +362,7 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
 			}
 		}
 	}
+	mutex_unlock(&mtk_policy_lock);
 
 	return notifier_from_errno(ret);
 }
@@ -495,7 +497,6 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
-	mutex_init(&info->reg_lock);
 	info->current_freq = clk_get_rate(info->cpu_clk);
 
 	info->opp_cpu = cpu;
@@ -607,13 +608,31 @@ static void mtk_cpufreq_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_free_cpufreq_table(info->cpu_dev, &policy->freq_table);
 }
 
+static unsigned int mtk_cpufreq_get(unsigned int cpu)
+{
+	struct mtk_cpu_dvfs_info *info;
+	unsigned long current_freq;
+
+	mutex_lock(&mtk_policy_lock);
+	info = mtk_cpu_dvfs_info_lookup(cpu);
+	if (!info) {
+		mutex_unlock(&mtk_policy_lock);
+		return 0;
+	}
+
+	current_freq = info->current_freq / 1000;
+	mutex_unlock(&mtk_policy_lock);
+
+	return current_freq;
+}
+
 static struct cpufreq_driver mtk_cpufreq_driver = {
 	.flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
 		 CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
 		 CPUFREQ_IS_COOLING_DEV,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = mtk_cpufreq_set_target,
-	.get = cpufreq_generic_get,
+	.get = mtk_cpufreq_get,
 	.init = mtk_cpufreq_init,
 	.exit = mtk_cpufreq_exit,
 	.register_em = cpufreq_register_em_with_opp,
-- 
2.45.2


