Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50AED1268E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEOmEUIWEDF7SgnAXC7LFB2+RlkdSDmMXXTrTiqEAFA=; b=EarSYkbWuI/PC3//a2pmpzxfvY
	HgwbzHjZtaFDCQmbcmruJkZso1JmKv5da/LaJzSt219UnEcCid3fznCa+5qknw9XnqQuQVeITkL9S
	UlgMfAkcHzbwLNY6kUevVNmWoZsDnCKLzPTWrvRpMVCxIoMshXn8jzR/ehBvFzr3DsQrq7Gg2UPMj
	Qwx2n23I/J4Py4RzEULfpxciAju72h227VWbpCs/AexefxsddC7IbyJSHoj0ixT9X8TdFEXdBxIQm
	LKQy3ATk+6e2vJ5fOFBAs3AnTso2uxJI5E1enJMkEUvNLmcs1SYcAtTZatXpMy/DURVmjmI/BHVNB
	eB6m3m8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdUp-000000064dX-0jQh;
	Wed, 03 Dec 2025 03:25:41 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdUj-000000064bk-3Exc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 03:25:36 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dLjdv1WXYz1cyNt;
	Wed,  3 Dec 2025 11:23:31 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 92B69140278;
	Wed,  3 Dec 2025 11:25:23 +0800 (CST)
Received: from localhost.localdomain (10.90.31.46) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 3 Dec 2025 11:25:22 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <viresh.kumar@linaro.org>, <rafael@kernel.org>, <ionela.voinescu@arm.com>,
	<beata.michalska@arm.com>, <pierre.gondois@arm.com>,
	<zhenglifeng1@huawei.com>
CC: <linux-pm@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>,
	<zhanjie9@hisilicon.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <yubowen8@huawei.com>, <lihuisong@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH v4 1/3] ACPI: CPPC: Factor out and export per-cpu cppc_perf_ctrs_in_pcc_cpu()
Date: Wed, 3 Dec 2025 11:24:20 +0800
Message-ID: <20251203032422.3232957-2-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
References: <20251203032422.3232957-1-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_192534_151898_ABCAF170 
X-CRM114-Status: GOOD (  13.14  )
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

Factor out cppc_perf_ctrs_in_pcc_cpu() for checking whether per-cpu CPC
regs are defined in PCC channels, and export it out for further use.

Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
---
 drivers/acpi/cppc_acpi.c | 45 +++++++++++++++++++++-------------------
 include/acpi/cppc_acpi.h |  5 +++++
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index 3bdeeee3414e..aa80dbcf42c0 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -1422,6 +1422,29 @@ int cppc_get_perf_caps(int cpunum, struct cppc_perf_caps *perf_caps)
 }
 EXPORT_SYMBOL_GPL(cppc_get_perf_caps);
 
+bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
+{
+	struct cpc_desc *cpc_desc = per_cpu(cpc_desc_ptr, cpu);
+	struct cpc_register_resource *ref_perf_reg;
+
+	/*
+	 * If reference perf register is not supported then we should use the
+	 * nominal perf value
+	 */
+	ref_perf_reg = &cpc_desc->cpc_regs[REFERENCE_PERF];
+	if (!CPC_SUPPORTED(ref_perf_reg))
+		ref_perf_reg = &cpc_desc->cpc_regs[NOMINAL_PERF];
+
+	if (CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
+	    CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
+	    CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]) ||
+	    CPC_IN_PCC(ref_perf_reg))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(cppc_perf_ctrs_in_pcc_cpu);
+
 /**
  * cppc_perf_ctrs_in_pcc - Check if any perf counters are in a PCC region.
  *
@@ -1436,27 +1459,7 @@ bool cppc_perf_ctrs_in_pcc(void)
 	int cpu;
 
 	for_each_online_cpu(cpu) {
-		struct cpc_register_resource *ref_perf_reg;
-		struct cpc_desc *cpc_desc;
-
-		cpc_desc = per_cpu(cpc_desc_ptr, cpu);
-
-		if (CPC_IN_PCC(&cpc_desc->cpc_regs[DELIVERED_CTR]) ||
-		    CPC_IN_PCC(&cpc_desc->cpc_regs[REFERENCE_CTR]) ||
-		    CPC_IN_PCC(&cpc_desc->cpc_regs[CTR_WRAP_TIME]))
-			return true;
-
-
-		ref_perf_reg = &cpc_desc->cpc_regs[REFERENCE_PERF];
-
-		/*
-		 * If reference perf register is not supported then we should
-		 * use the nominal perf value
-		 */
-		if (!CPC_SUPPORTED(ref_perf_reg))
-			ref_perf_reg = &cpc_desc->cpc_regs[NOMINAL_PERF];
-
-		if (CPC_IN_PCC(ref_perf_reg))
+		if (cppc_perf_ctrs_in_pcc_cpu(cpu))
 			return true;
 	}
 
diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
index 13fa81504844..4bcdcaf8bf2c 100644
--- a/include/acpi/cppc_acpi.h
+++ b/include/acpi/cppc_acpi.h
@@ -154,6 +154,7 @@ extern int cppc_get_perf_ctrs(int cpu, struct cppc_perf_fb_ctrs *perf_fb_ctrs);
 extern int cppc_set_perf(int cpu, struct cppc_perf_ctrls *perf_ctrls);
 extern int cppc_set_enable(int cpu, bool enable);
 extern int cppc_get_perf_caps(int cpu, struct cppc_perf_caps *caps);
+extern bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu);
 extern bool cppc_perf_ctrs_in_pcc(void);
 extern unsigned int cppc_perf_to_khz(struct cppc_perf_caps *caps, unsigned int perf);
 extern unsigned int cppc_khz_to_perf(struct cppc_perf_caps *caps, unsigned int freq);
@@ -204,6 +205,10 @@ static inline int cppc_get_perf_caps(int cpu, struct cppc_perf_caps *caps)
 {
 	return -EOPNOTSUPP;
 }
+static inline bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
+{
+	return false;
+}
 static inline bool cppc_perf_ctrs_in_pcc(void)
 {
 	return false;
-- 
2.33.0


