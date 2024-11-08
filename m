Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707C6D5E140
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 06:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZzOBJyGR/2ugctt1qnXoWEeJcymzZlDZvjwEAiy2rY=; b=OSqnc4o+hdUGoM6kRQGqAF78gI
	i7rYiLMcxYRHzjL7XMh8dQJvQHN/S9Jxxx18D5+PvQkHf9hqFYAAPl1Ng+d7LMZFjPJwjA5xQBf5c
	PlfH+WJnSc5ZGvUR2lPvOWp+rfUMaeaxnvIM5SFN90WmXaV2hNcLT870ec1H2gGHRGFZla4rCcGUm
	+XiBBQxFrjT5M6foSgHLVmaQ7lJ+hvGPlXCgA9+8/BtKzA5qhWYj0jQewwMBf+PX/eGl0GJv/Yy8c
	ppxxAdxu/3e8qw85g0lW++0Q4IyTC43Pjlzl/5yFRB3TGY8UGV/5zO1oU+dY8qkGgIA35iRGvHWmI
	jEj0b1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Im2-00000009XJ9-3KMx;
	Fri, 08 Nov 2024 06:47:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9If0-00000009Vum-22sI;
	Fri, 08 Nov 2024 06:40:00 +0000
X-UUID: 41dfbd509d9c11ef9048ed6ed365623b-20241107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fZzOBJyGR/2ugctt1qnXoWEeJcymzZlDZvjwEAiy2rY=;
	b=K7Mc2NdgXx3oJSf3978b5tDpGeNEUbq/kDmfOE34thx/rEnKx892REt0X9Jbi3ol9hx4RQeZcU08DdCaki5U35AtKIwoOtaTkfu9obBVXKCskzAt9hGYnjLUSgEXU2l0K4ujZoYgGfyVJJTO8lzW2NHWCm/Xb7+IpRfpUCBfNyo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:dda4b5f7-8fe7-49b3-9c7a-9f25886b3840,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:6945c106-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 41dfbd509d9c11ef9048ed6ed365623b-20241107
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1960439805; Thu, 07 Nov 2024 23:39:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 14:39:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 14:39:48 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v2 2/4] cpufreq: mediatek: using global lock avoid race condition
Date: Fri, 8 Nov 2024 14:39:40 +0800
Message-ID: <20241108063942.19744-3-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241108063942.19744-1-chun-jen.tseng@mediatek.com>
References: <20241108063942.19744-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.125600-8.000000
X-TMASE-MatchedRID: 2aTVZGXuTB8sJluZlyHlY8AmcZEx8XHJnQkHrAHoKqb8rSaNLblw6hG5
	9Y7tVhgxvNRgKxmpoNYwyeDC17g6+B2P280ZiGmROdTVX41pez3BDQIKmpUdLAqiCYa6w8tvMG4
	kjAsJeaAWra7pA1ewApurMMf0bt5Mup2UZ4H9upSk3yyn4uPtLU9nxZsOR/FTuqWf6Nh7tmFASA
	ka3p+8QkyDxZlLLvUwcV5MmhPtBFQM8jMXjBF+sBRFJJyf5BJe3QfwsVk0UbvdirxFVpmK9U5+L
	K/FQ32MzLexlFBo/3EJGanVe2V1AgN77mZJF+nGoxMg92LXk6M=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.125600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7423304FBCBAB8CF36A280E21E56FD3531BDAF052ED00A63F9444ADC805B115F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_223958_770527_44826981 
X-CRM114-Status: GOOD (  16.77  )
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
index f63183154e9a..6b3cd2b803bf 100644
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
@@ -610,13 +611,31 @@ static void mtk_cpufreq_exit(struct cpufreq_policy *policy)
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


