Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B3EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EiTWrdPd+yj2FHOvAvudpCJ9LLU2BCANkcALvO3hnXg=; b=tr3MgAmj/ZEW02U2/3kXt/idYL
	LxI4St+kX6Tr3NJrFxAYatkIikqDvfZHRK7NvWchLjDvzoO2sI3CrGZLie8S5bAJ9ESR5bfveUNUW
	YgBZPqlt4nLMEMiJkmXVC/GLhnmShkQMb7KlxRjIX5C5e3bakEJqSioUtHJXnF1oDs2aGWgrCd5mV
	EnKqZZiXk8gSrlnZHOjFxluLhhxrPNRXiDsu/Dc2wjuN+Gmw+YK+IB+R0VgHa/1dp1RlJgtWARLsj
	diMjkgRuQDfSrQ5iCYsK3mWPeQ5FFhIjUw8sF5AfATnFgLapCfswlwR6Mja9tiBBo0OkIEWZwU1e0
	QW2LilFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfaX-0000000CnI4-1jBS;
	Fri, 03 Jan 2025 11:11:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdOH-0000000CVt1-36Za
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:50:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037FfaZ010711;
	Fri, 3 Jan 2025 08:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EiTWrdPd+yj2FHOvAvudpC
	J9LLU2BCANkcALvO3hnXg=; b=AIC0S8b3IAD6JaLfwl7qt0F4ciMStN5A2AfDLR
	IjfQ7gImt5FfelRLKmmma0ibHhH/C2/QPs3QLVHlCx4WCkOBdRAWbGx1pVOLgkBD
	uRZg5v40z2+LQ1Oyuoz5NH8IIJF5Pxyajxm3+lhx9K/6OFxbvyEIocycaT/RfLpW
	dAL8FJdWl9y3x0mLM+UM0bivGBq7+gaeFvWv2dh/4PxzGj4RBy+Fj6CYZkFKKUYB
	D9FqzueUbqIebYYbfj7A+QkGF4Rzm7SSsXFhOY8pPy5pDF+6gCnnREsT3hTDnDyk
	2FH51hxkmb7n6t0+P7tGJ7FjgW40SmN6NdRsHLjQ5rw4aV0Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xbbp06qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 08:50:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5038oWRY000962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 08:50:32 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 3 Jan 2025 00:50:28 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <anshuman.khandual@arm.com>, <catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>, <stable@vger.kernel.org>
Subject: [PATCH v3] arm64: mm: Populate vmemmap at the page level for hotplugged sections
Date: Fri, 3 Jan 2025 16:50:02 +0800
Message-ID: <20250103085002.27243-1-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pbTVjusVWVeqDA3YjrrNTLMewUxKBtXN
X-Proofpoint-GUID: pbTVjusVWVeqDA3YjrrNTLMewUxKBtXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=934
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_005045_898257_D90805D6 
X-CRM114-Status: GOOD (  21.21  )
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

Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
vmemmap to populate at the PMD section level which was suitable
initially since hotplugging granule is always 128M. However,
commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
which added 2M hotplugging granule disrupted the arm64 assumptions.

Considering the vmemmap_free -> unmap_hotplug_pmd_range path, when
pmd_sect() is true, the entire PMD section is cleared, even if there is
other effective subsection. For example pagemap1 and pagemap2 are part
of a single PMD entry and they are hot-added sequentially. Then pagemap1
is removed, vmemmap_free() will clear the entire PMD entry freeing the
struct page metadata for the whole section, even though pagemap2 is still
active.

To address the issue, we need to prevent PMD/PUD/CONT mappings for both
linear and vmemmap for non-boot sections if the size exceeds 2MB
(considering sub-section is 2MB). We only permit 2MB blocks in a 4KB page
configuration.

Cc: stable@vger.kernel.org # v5.4+
Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
Hi Catalin and Anshuman,
Based on your review comments, I concluded below patch and tested with my setup.
I have not folded patchset #2 since this patch seems to be enough for backporting..
Please see if you have further suggestions.

 arch/arm64/mm/mmu.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e2739b69e11b..2b4d23f01d85 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -42,9 +42,11 @@
 #include <asm/pgalloc.h>
 #include <asm/kfence.h>
 
-#define NO_BLOCK_MAPPINGS	BIT(0)
+#define NO_PMD_BLOCK_MAPPINGS	BIT(0)
 #define NO_CONT_MAPPINGS	BIT(1)
 #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
+#define NO_PUD_BLOCK_MAPPINGS	BIT(3)  /* Hotplug case: do not want block mapping for PUD */
+#define NO_BLOCK_MAPPINGS (NO_PMD_BLOCK_MAPPINGS | NO_PUD_BLOCK_MAPPINGS)
 
 u64 kimage_voffset __ro_after_init;
 EXPORT_SYMBOL(kimage_voffset);
@@ -254,7 +256,7 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 
 		/* try section mapping first */
 		if (((addr | next | phys) & ~PMD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		    (flags & NO_PMD_BLOCK_MAPPINGS) == 0) {
 			pmd_set_huge(pmdp, phys, prot);
 
 			/*
@@ -356,10 +358,11 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 
 		/*
 		 * For 4K granule only, attempt to put down a 1GB block
+		 * Hotplug case: do not attempt 1GB block
 		 */
 		if (pud_sect_supported() &&
 		   ((addr | next | phys) & ~PUD_MASK) == 0 &&
-		    (flags & NO_BLOCK_MAPPINGS) == 0) {
+		   (flags & NO_PUD_BLOCK_MAPPINGS) == 0) {
 			pud_set_huge(pudp, phys, prot);
 
 			/*
@@ -1175,9 +1178,16 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap)
 {
+	unsigned long start_pfn;
+	struct mem_section *ms;
+
 	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
 
-	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
+	start_pfn = page_to_pfn((struct page *)start);
+	ms = __pfn_to_section(start_pfn);
+
+	/* Hotplugged section not support hugepages */
+	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) || !early_section(ms))
 		return vmemmap_populate_basepages(start, end, node, altmap);
 	else
 		return vmemmap_populate_hugepages(start, end, node, altmap);
@@ -1339,9 +1349,24 @@ int arch_add_memory(int nid, u64 start, u64 size,
 		    struct mhp_params *params)
 {
 	int ret, flags = NO_EXEC_MAPPINGS;
+	unsigned long start_pfn = page_to_pfn((struct page *)start);
+	struct mem_section *ms = __pfn_to_section(start_pfn);
 
 	VM_BUG_ON(!mhp_range_allowed(start, size, true));
 
+	/* Should not be invoked by early section */
+	WARN_ON(early_section(ms));
+
+	if (IS_ENABLED(CONFIG_ARM64_4K_PAGES))
+	/*
+	 * As per subsection granule is 2M, allow PMD block mapping in
+	 * case 4K PAGES.
+	 * Other cases forbid section mapping.
+	 */
+		flags |= NO_PUD_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+	else
+		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+
 	if (can_set_direct_map())
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
 
-- 
2.25.1


