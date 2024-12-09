Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94280E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tqbr13cTVpmFqpleZm78ZDOWuVR4wFo0Qdc8LscuVcA=; b=k/MZFC7TfaYrinGU5S12uUvxSM
	rUQ6dQms3Q7HQ/A5A+GcikFV5WkKEU+YAdlgU/6qu8btuJvrR34ThhV24gmL6RQ7udJcSMOdydAGS
	3O2+pqErNY82QAnVraxla0DeL/gE2ChYCmbwE8WqeNXVlhDrardLqEKmXxiuxo8uZd6Ecy7yIFcnJ
	p0aZEfExC/PTidwwKQnWaxVgwScB+JjRTnwQ46voW0UpPtOl3/yfSC6I6u0We0z8uhh4iTrOdGdaJ
	yOzdbQ3v9Rb4tn3pcK32zbrdIwcnqOwMBLBVfbpFEQok1g8hx9Bdj3lIkkqfwFKNAositAUDth8vn
	RLfkosCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaKE-000000077uv-34XT;
	Mon, 09 Dec 2024 09:45:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaIF-000000077Sk-2BjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:43:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NkrgO019407;
	Mon, 9 Dec 2024 09:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tqbr13cTVpmFqpleZm78ZDOWuVR4wFo0Qdc8LscuVcA=; b=immPB09IHqdJ86ly
	Wt5sEZWvGhCy3KNGq40HOAuAcKo+CFcCg5agk6CeGJBseyHXs18IpTs2Yw96+HRJ
	/qNIyAry9Vj00yiPO+78nct5dI40owyBOnwYmERKtSEk9M0IHjMnqyNbQfViiIpk
	frhftXVoSs44Gw8MA+NWdBeOQoFiodZuZPq1ifoMkbbeXoj6Z+InNfDb7ETI8xj1
	qvsCfPwaiTQWcEi+qVfoqnS1mPUkJ11/OYkLtWTUvG9EacsEmRZrQVC7K0SuyUn9
	Ia6tGuR/LErbV3YG1Y4zALTxh1XG/7vjliIThRRpthLWbZLmRXSomB7lq5RUg4Q9
	wosV2g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cc2ecb4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 09:42:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B99guef019069
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 09:42:56 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 01:42:53 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>
CC: <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH v2 1/2] arm64: mm: vmemmap populate to page level if not section aligned
Date: Mon, 9 Dec 2024 17:42:26 +0800
Message-ID: <20241209094227.1529977-2-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
References: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4-q_SRzBcq3Y4hdw5tH8DRWs14OCq0fu
X-Proofpoint-GUID: 4-q_SRzBcq3Y4hdw5tH8DRWs14OCq0fu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=822 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_014307_566190_4C5F24D9 
X-CRM114-Status: GOOD (  14.36  )
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

Commit c1cc1552616d ("arm64: MMU initialisation")
optimizes the vmemmap to populate at the PMD section level. However, if
start or end is not aligned to a section boundary, such as when a
subsection is hot added, populating the entire section is wasteful. For
instance, if only one subsection hot-added, the entire section's struct
page metadata will still be populated.In such cases, it is more effective
to populate at page granularity.

This change also addresses mismatch issues during vmemmap_free(): When
pmd_sect() is true, the entire PMD section is cleared, even if there is
other effective subsection. For example, pagemap1 and pagemap2 are part
of a single PMD entry and they are hot-added sequentially. Then pagemap1
is removed, vmemmap_free() will clear the entire PMD entry, freeing the
struct page metadata for the whole section, even though pagemap2 is still
active.

Fixes: c1cc1552616d ("arm64: MMU initialisation")
Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
 arch/arm64/mm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e2739b69e11b..fd59ee44960e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1177,7 +1177,9 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 {
 	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
 
-	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
+	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
+	!IS_ALIGNED(page_to_pfn((struct page *)start), PAGES_PER_SECTION) ||
+	!IS_ALIGNED(page_to_pfn((struct page *)end), PAGES_PER_SECTION))
 		return vmemmap_populate_basepages(start, end, node, altmap);
 	else
 		return vmemmap_populate_hugepages(start, end, node, altmap);
-- 
2.25.1


