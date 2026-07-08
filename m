Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954ABC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7OCS9ttjcsJjAtXg7NkqqhNNIFwWFmPdzpD3nDuHjg=; b=2TTFKskbpwKZItkt122FBS+nrT
	kxGs7MEgwRJcaypOw/ayGAVivXEEZkOlyKbbm6VUEYdt7BsLPxxsujOFk+v8jdfio2PTnwOp8IKWj
	wgUYsv+18IAgbXM5peM2KWsevRFkWAVqERJ3JUcJbzRGYxSYWZS5PGLbMNoAXK+KQpOQX4IEbZPFN
	LI6STR9o9fZg117c4S7iFSxOzLsndCNDDbheLkqu28D3P/+N+Usqf399RqWkOmbVQ7ls1NBJ9xQkJ
	8Z6Et5KVCs1icrWs3uBIYmLW0aKCtEUtAVGdOKNtPYGTOH/U+sYyW0bPuRc7uJ1sAbP6vv4wejkQJ
	kpv8nRfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNdz-0000000GcP0-0APp;
	Wed, 08 Jul 2026 08:28:35 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNdv-0000000GcNi-048J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:28:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m7OCS9ttjcsJjAtXg7NkqqhNNIFwWFmPdzpD3nDuHjg=;
	b=nJNt57MLrEVPte5Syar1+jRTg+YWjqen7Dz1aoXFz0/qSO1DjzXv/s+xQNLHSzE2c8xL6ZBJO
	a8y4KdgCkrkIT4/D1eHnyiTb+dVxJULuS1y8JNOd26kzKJaZ5ZCBJbWx/LBaSt617rIK3iiTjW3
	CHxgZjTGpR1jcm5e7Z9DaDo=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gw9wm2VTLz1prPP;
	Wed,  8 Jul 2026 16:19:04 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 51A1A4056D;
	Wed,  8 Jul 2026 16:28:20 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 8 Jul
 2026 16:28:19 +0800
From: Pengjie Zhang <zhangpengjie2@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <rafael@kernel.org>,
	<lenb@kernel.org>, <saket.dumbre@intel.com>, <beata.michalska@arm.com>,
	<zhenglifeng1@huawei.com>, <sumitg@nvidia.com>, <zhanjie9@hisilicon.com>,
	<geert+renesas@glider.be>, <cuiyunhui@bytedance.com>,
	<vanshikonda@os.amperecomputing.com>, <ionela.voinescu@arm.com>,
	<jeremy.linton@arm.com>, <viresh.kumar@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linuxarm@huawei.com>
CC: <prime.zeng@hisilicon.com>, <wanghuiqiang@huawei.com>,
	<xuwei5@huawei.com>, <lihuisong@huawei.com>, <yubowen8@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH v2 1/2] ACPI: CPPC: add paired FFH feedback-counter read hook
Date: Wed, 8 Jul 2026 16:28:17 +0800
Message-ID: <20260708082818.808041-2-zhangpengjie2@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260708082818.808041-1-zhangpengjie2@huawei.com>
References: <20260708082818.808041-1-zhangpengjie2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_012831_661819_7D757D5F 
X-CRM114-Status: GOOD (  13.84  )
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

cppc_get_perf_ctrs() reads the delivered and reference performance
counters one at a time.

Allow architectures to provide both FFH feedback counters in one
operation when that either narrows the sampling window or avoids extra
cross-CPU reads. Add a small FFH-specific hook for that case and fall
back to the existing per-register reads when unsupported.

Tested-by: Sumit Gupta <sumitg@nvidia.com>
Reviewed-by: Sumit Gupta <sumitg@nvidia.com>
Tested-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
Reviewed-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
---
 drivers/acpi/cppc_acpi.c | 50 ++++++++++++++++++++++++++++++++++++----
 include/acpi/cppc_acpi.h |  7 ++++++
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index 9f572f481241..b6356476a46e 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -1004,6 +1004,22 @@ int __weak cpc_read_ffh(int cpunum, struct cpc_reg *reg, u64 *val)
 	return -ENOTSUPP;
 }
 
+/**
+ * cpc_read_ffh_fb_ctrs() - Read FFH feedback counters together
+ * @cpunum:	Target CPU
+ * @reg1:	first CPPC register information
+ * @val1:	place holder for first return value
+ * @reg2:	second CPPC register information
+ * @val2:	place holder for second return value
+ *
+ * Return: 0 on success, error code otherwise
+ */
+int __weak cpc_read_ffh_fb_ctrs(int cpunum, struct cpc_reg *reg1,
+				u64 *val1, struct cpc_reg *reg2, u64 *val2)
+{
+	return -EOPNOTSUPP;
+}
+
 /**
  * cpc_write_ffh() - Write FFH register
  * @cpunum:	CPU number to write
@@ -1496,6 +1512,33 @@ bool cppc_perf_ctrs_in_pcc_cpu(unsigned int cpu)
 }
 EXPORT_SYMBOL_GPL(cppc_perf_ctrs_in_pcc_cpu);
 
+static int cppc_read_fb_ctrs(int cpunum,
+			     struct cpc_register_resource *delivered_reg,
+			     struct cpc_register_resource *reference_reg,
+			     u64 *delivered, u64 *reference)
+{
+	int ret;
+
+	/*
+	 * For FFH feedback counters, try a paired read first to reduce
+	 * sampling skew between delivered and reference counters. Fall
+	 * back to the existing per-register reads if unsupported.
+	 */
+	if (CPC_IN_FFH(delivered_reg) && CPC_IN_FFH(reference_reg)) {
+		ret = cpc_read_ffh_fb_ctrs(cpunum,
+					&delivered_reg->cpc_entry.reg, delivered,
+					&reference_reg->cpc_entry.reg, reference);
+		if (ret != -EOPNOTSUPP)
+			return ret;
+	}
+
+	ret = cpc_read(cpunum, delivered_reg, delivered);
+	if (ret)
+		return ret;
+
+	return cpc_read(cpunum, reference_reg, reference);
+}
+
 /**
  * cppc_perf_ctrs_in_pcc - Check if any perf counters are in a PCC region.
  *
@@ -1561,11 +1604,8 @@ int cppc_get_perf_ctrs(int cpunum, struct cppc_perf_fb_ctrs *perf_fb_ctrs)
 		}
 	}
 
-	ret = cpc_read(cpunum, delivered_reg, &delivered);
-	if (ret)
-		goto out_err;
-
-	ret = cpc_read(cpunum, reference_reg, &reference);
+	ret = cppc_read_fb_ctrs(cpunum, delivered_reg, reference_reg,
+				&delivered, &reference);
 	if (ret)
 		goto out_err;
 
diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
index 8693890a7275..5acebe62feac 100644
--- a/include/acpi/cppc_acpi.h
+++ b/include/acpi/cppc_acpi.h
@@ -176,6 +176,8 @@ extern int cppc_get_transition_latency(int cpu);
 extern bool cpc_ffh_supported(void);
 extern bool cpc_supported_by_cpu(void);
 extern int cpc_read_ffh(int cpunum, struct cpc_reg *reg, u64 *val);
+extern int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
+				struct cpc_reg *reg2, u64 *val2);
 extern int cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val);
 extern int cppc_get_epp_perf(int cpunum, u64 *epp_perf);
 extern int cppc_set_epp_perf(int cpu, struct cppc_perf_ctrls *perf_ctrls, bool enable);
@@ -250,6 +252,11 @@ static inline int cpc_read_ffh(int cpunum, struct cpc_reg *reg, u64 *val)
 {
 	return -EOPNOTSUPP;
 }
+static inline int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
+				       struct cpc_reg *reg2, u64 *val2)
+{
+	return -EOPNOTSUPP;
+}
 static inline int cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val)
 {
 	return -EOPNOTSUPP;
-- 
2.33.0


