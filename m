Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0BCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YB+35MEr5r2FDBPZ1kz7zF5c5n//UGnQ+j9Zn4d4bwE=; b=Z2Ix3nr6PjdEBYP8EBUHIDJN8b
	O/EF/VttAPGJRuMVHSY96MhMgIoDmfhb3EHGVfiWZQgOydm0xkeMP3jZTvv1RN0esbQqajJZkKNlQ
	XQKkcrp8YrfLZ+111lGMU1VProrCh5O1S0oLzmctmy0TW9Es+oYodUE0Nxj6QmzWIEaNfGk/xgMSR
	ZsMdGBEBuh0Bgtc7YiNhWQWJdyqqENXxDhHp27/McrkHAsCFvgoY1HE/bR7FJ8mb7z5ohoT+UtU9t
	hh3oi1cMezqGudBrLO+07eNchpPPW5nC/4WE15vLtvUKzAwQW4mDqZ+iAdb5lZJW8hRqKFmypje3r
	rJKnmyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNdz-0000000GcPI-1Iw2;
	Wed, 08 Jul 2026 08:28:35 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNdu-0000000GcNh-4BgD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:28:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=YB+35MEr5r2FDBPZ1kz7zF5c5n//UGnQ+j9Zn4d4bwE=;
	b=C2jjr0g7fj8bJ8QWOEDJDwuIBE9NMw3ey2vx4VBQ2Hr884UKHXN9GiEX9cmyQELPdttFYo5WA
	fLlTuRG8yI2LLxLT6uHA3FTkZ33VbN6GO8FVRegJeMZu7CEMsKQeD6qSHqmvMYWKPJp2iO5Bai/
	rAfrK7EF/AijjHbkQgy+PpQ=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gw9wn0yLPz1prn0;
	Wed,  8 Jul 2026 16:19:05 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 1862B40561;
	Wed,  8 Jul 2026 16:28:21 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 8 Jul
 2026 16:28:20 +0800
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
Subject: [PATCH v2 2/2] arm64: topology: read CPPC FFH feedback counters in one operation
Date: Wed, 8 Jul 2026 16:28:18 +0800
Message-ID: <20260708082818.808041-3-zhangpengjie2@huawei.com>
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
X-CRM114-CacheID: sfid-20260708_012831_662158_33F2FA2C 
X-CRM114-Status: GOOD (  14.21  )
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

arm64 implements CPPC FFH feedback-counter reads using AMU counters.
Because those counters must be sampled on the target CPU, reading the
delivered and reference counters separately widens the observation window
between them.

Implement the paired FFH feedback-counter read hook on arm64 and sample
both AMU counters together before decoding the requested CPC register
values.

Also factor the FFH bitfield extraction logic into a helper and reuse
it from the existing single-counter FFH read path.

Tested-by: Sumit Gupta <sumitg@nvidia.com>
Reviewed-by: Sumit Gupta <sumitg@nvidia.com>
Tested-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
Reviewed-by: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>
Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
---
 arch/arm64/kernel/topology.c | 92 ++++++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index b32f13358fbb..d28438f8b83f 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -373,6 +373,16 @@ core_initcall(init_amu_fie);
 #ifdef CONFIG_ACPI_CPPC_LIB
 #include <acpi/cppc_acpi.h>
 
+struct amu_ffh_ctrs {
+	u64 corecnt;
+	u64 constcnt;
+};
+
+enum cpc_ffh_ctr_id {
+	CPC_FFH_CTR_CORE  = 0x0,
+	CPC_FFH_CTR_CONST = 0x1,
+};
+
 static void cpu_read_corecnt(void *val)
 {
 	/*
@@ -397,7 +407,7 @@ static void cpu_read_constcnt(void *val)
 }
 
 static inline
-int counters_read_on_cpu(int cpu, smp_call_func_t func, u64 *val)
+int counters_read_on_cpu(int cpu, smp_call_func_t func, void *val)
 {
 	/*
 	 * Abort call on counterless CPU.
@@ -447,24 +457,90 @@ bool cpc_ffh_supported(void)
 	return true;
 }
 
+static void amu_read_core_const_ctrs(void *val)
+{
+	struct amu_ffh_ctrs *ctrs = val;
+
+	/*
+	 * cpu_read_constcnt() incurs slight latency due to the
+	 * ARM64_WORKAROUND_2457168 check. Read it first to minimize
+	 * the sampling skew between the const and core counters.
+	 */
+	cpu_read_constcnt(&ctrs->constcnt);
+	cpu_read_corecnt(&ctrs->corecnt);
+}
+
+static u64 cpc_ffh_extract_bits(const struct cpc_reg *reg, u64 val)
+{
+	val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
+			   reg->bit_offset);
+	val >>= reg->bit_offset;
+
+	return val;
+}
+
+static void cpc_ffh_ctr_value(const struct cpc_reg *reg,
+			      const struct amu_ffh_ctrs *ctrs, u64 *val)
+{
+	switch ((u64)reg->address) {
+	case CPC_FFH_CTR_CORE:
+		*val = ctrs->corecnt;
+		break;
+	case CPC_FFH_CTR_CONST:
+		*val = ctrs->constcnt;
+		break;
+	}
+
+	*val = cpc_ffh_extract_bits(reg, *val);
+}
+
+static bool is_amu_ctr_reg(const struct cpc_reg *reg)
+{
+	return reg->address == CPC_FFH_CTR_CORE ||
+		reg->address == CPC_FFH_CTR_CONST;
+}
+
+int cpc_read_ffh_fb_ctrs(int cpu, struct cpc_reg *reg1, u64 *val1,
+			 struct cpc_reg *reg2, u64 *val2)
+{
+	struct amu_ffh_ctrs ctrs;
+	int ret;
+
+	if (!is_amu_ctr_reg(reg1) || !is_amu_ctr_reg(reg2))
+		return -EINVAL;
+
+	ret = counters_read_on_cpu(cpu, amu_read_core_const_ctrs, &ctrs);
+	if (ret) {
+		/*
+		 * If AMU is unsupported (-EOPNOTSUPP), translate the error
+		 * to -ENODEV. This explicitly tells the generic CPPC layer
+		 * to abort immediately and avoid falling back to pointless
+		 * single-counter reads.
+		 */
+		return ret == -EOPNOTSUPP ? -ENODEV : ret;
+	}
+
+	cpc_ffh_ctr_value(reg1, &ctrs, val1);
+	cpc_ffh_ctr_value(reg2, &ctrs, val2);
+
+	return 0;
+}
+
 int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
 {
 	int ret = -EOPNOTSUPP;
 
 	switch ((u64)reg->address) {
-	case 0x0:
+	case CPC_FFH_CTR_CORE:
 		ret = counters_read_on_cpu(cpu, cpu_read_corecnt, val);
 		break;
-	case 0x1:
+	case CPC_FFH_CTR_CONST:
 		ret = counters_read_on_cpu(cpu, cpu_read_constcnt, val);
 		break;
 	}
 
-	if (!ret) {
-		*val &= GENMASK_ULL(reg->bit_offset + reg->bit_width - 1,
-				    reg->bit_offset);
-		*val >>= reg->bit_offset;
-	}
+	if (!ret)
+		*val = cpc_ffh_extract_bits(reg, *val);
 
 	return ret;
 }
-- 
2.33.0


