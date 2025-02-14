Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D53C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bd1SEl58hRjLit531fXO640LwjMPruVn6dM/zQMBCk=; b=ULnhF/W5Z72K//iCWBV6G9xfvd
	rz6A10pxkpM4d891Z6a1AWvgyjA8I+NL0KAtRSX+4F0353ZFBgW4YIPXtdHZR4hoOWLRnZjAaMi4l
	zxED1wOlUlKjg7qaJdk1Edik5h+NAHW3upuQVuEmApne3HFfiTh0e1D08Ui8petHrvr9PO2/tP4U8
	KzC5jNK2Wimtg2HAP/LzRQ0utz6JETxDzjhDWgujZal49R7Ludx0wVNR8WOMbtEjCsfQAsIvaXyuS
	T6k3A0x34mh8UGPO1DN9+Pd6Qomd3g7wEjM0Af8iGhv5gCMrLTuoJMoJwH84oaVz+36MBbPORUMpT
	iJJorDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqSw-0000000E0p6-1jIs;
	Fri, 14 Feb 2025 07:50:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqMj-0000000DzkR-1LPs;
	Fri, 14 Feb 2025 07:44:05 +0000
X-UUID: 72209ff4eaa711ef82ff63e91e7eb18c-20250214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9bd1SEl58hRjLit531fXO640LwjMPruVn6dM/zQMBCk=;
	b=klcsRgQlX7FFDSfPwegFRdsmfui3f8a7uIiCkDVP1SFLrPFoaaSboGMPj9Es9IqTi9m5scQ+ovUBgI+ZmrqovSIwj72C3a+IbZokNpOtKw255GnieX72imLjhPaqFr2jSF8nOMzHQnguZj/1mTjri8R3JKdpcOqV5fboAxfV33w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:85da6103-c032-4551-b779-14cd78485d97,IP:0,U
	RL:0,TC:0,Content:28,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:28
X-CID-META: VersionHash:60aa074,CLOUDID:1fde5b88-f9ab-4ac1-951b-e3a689bed90c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 72209ff4eaa711ef82ff63e91e7eb18c-20250214
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 954688922; Fri, 14 Feb 2025 00:43:56 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 14 Feb 2025 15:43:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 14 Feb 2025 15:43:53 +0800
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
Subject: [PATCH v3 2/3] cpufreq: mediatek: Add CPUFREQ_ASYNC_NOTIFICATION flag
Date: Fri, 14 Feb 2025 15:43:33 +0800
Message-ID: <20250214074353.1169864-3-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_234401_370902_E9AF3DF7 
X-CRM114-Status: GOOD (  10.72  )
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

Add CPUFREQ_ASYNC_NOTIFICATION flages for cpufreq policy because some of
process will get CPU frequency by cpufreq sysfs node. It may get wrong
frequency then call cpufreq_out_of_sync() to fixed frequency.

Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 07d5958e106a..68fcb6fcbe48 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -209,12 +209,12 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	struct dev_pm_opp *opp;
 	long freq_hz, pre_freq_hz;
 	int vproc, pre_vproc, inter_vproc, target_vproc, ret;
+	struct cpufreq_freqs freqs;
 
 	mutex_lock(&mtk_policy_lock);
 
 	inter_vproc = info->intermediate_voltage;
-
-	pre_freq_hz = clk_get_rate(cpu_clk);
+	pre_freq_hz = policy->cur * 1000;
 
 	if (unlikely(info->pre_vproc <= 0))
 		pre_vproc = regulator_get_voltage(info->proc_reg);
@@ -307,6 +307,10 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	}
 
 	info->current_freq = freq_hz;
+	freqs.old = policy->cur;
+	freqs.new = freq_table[index].frequency;
+	cpufreq_freq_transition_begin(policy, &freqs);
+	cpufreq_freq_transition_end(policy, &freqs, false);
 
 out:
 	mutex_unlock(&mtk_policy_lock);
@@ -629,6 +633,7 @@ static unsigned int mtk_cpufreq_get(unsigned int cpu)
 static struct cpufreq_driver mtk_cpufreq_driver = {
 	.flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
 		 CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
+		 CPUFREQ_ASYNC_NOTIFICATION |
 		 CPUFREQ_IS_COOLING_DEV,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = mtk_cpufreq_set_target,
-- 
2.45.2


