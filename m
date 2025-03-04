Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A61C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cz8mwoQe3GYg7tuptNj/Asda9H316llc4gDpuYCBPHQ=; b=5EXlBisk/qt5P6Z9Huk1RF8wDH
	NmmmHFv1N1O8fjQn+Fol1d5YWW7shz9HzkHmN7gUXZew77Ou9oDqPO+CjKbp9rSvqopPoh+1KXD8f
	+0ceqiDs3hVxYNT269zVPw75zhWt1BTFB6uQ+5/OuFugi/0PBl4CyYv7ntMUyUr7Pdt2l83mcz2y5
	WuftxeDo1ZgbkTcngUigt7twVKmdvcA+xOGsL/uTdkps2T++RBeMO3zZ2E/vcsHirr3uujvPw4oZl
	m+nlGrURvQx5KdIrxKUIOPyLij/yl+lg/mb4THTJ5VUvtjsScG66eezJmOmwyza0Gx4exIZjp26fy
	vSNKvskA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMia-00000003RhO-3GYH;
	Tue, 04 Mar 2025 07:29:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMgf-00000003RTg-0ui3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:27:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NXXo8007052;
	Tue, 4 Mar 2025 07:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cz8mwoQe3GYg7tuptNj/As
	da9H316llc4gDpuYCBPHQ=; b=MP3UWa8Frj5QM1eDEGIuUVYiIGXAsQopuF5PEd
	lIZDU+XQE3UTR0lT1Mu1qvZyi37PboVW36HpnFHZA4rLxV9FSu1DnNaj60zVCTQO
	nxwOIkikHizH2RUqVtdNhvl4cjJOJA42nWHae8/9lpvWtOeDPEhelnbX85GVItsN
	McWWNnQUKnX645yBZvSw7W6nm5ttaxb8h4cDL5kRRNXs5EC5iu3uUd0fJreozcD1
	g56Jc5BWdkP1WNz4iDYEpyS3Z4HZbyeAHGYIY9I4BmemnpkyMTw5Uy6/8GxguNg2
	fGEbwST74eDKYTfrFS6zErV09yOwufH232v+H9r/C/t3DpdA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6th0v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 07:27:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5247RLbv014113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 07:27:21 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Mar 2025 23:27:16 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <anshuman.khandual@arm.com>, <catalin.marinas@arm.com>, <david@redhat.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>, <stable@vger.kernel.org>
Subject: [PATCH v9] arm64: mm: Populate vmemmap at the page level if not section aligned
Date: Tue, 4 Mar 2025 15:27:00 +0800
Message-ID: <20250304072700.3405036-1-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HZbuTjE8 c=1 sm=1 tr=0 ts=67c6ab5a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=COk6AnOGAAAA:8 a=NceqpOgtns4pJs_QtpcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IPE3Tm_3UXzTcBxsIgZ8AE2r4qJy0ZOf
X-Proofpoint-ORIG-GUID: IPE3Tm_3UXzTcBxsIgZ8AE2r4qJy0ZOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_03,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_232733_363320_341FC979 
X-CRM114-Status: GOOD (  16.25  )
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

On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
to 27, making one section 128M. The related page struct which vmemmap
points to is 2M then.
Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
vmemmap to populate at the PMD section level which was suitable
initially since hot plug granule is always one section(128M). However,
commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
existing arm64 assumptions.

The first problem is that if start or end is not aligned to a section
boundary, such as when a subsection is hot added, populating the entire
section is wasteful.

The next problem is if we hotplug something that spans part of 128 MiB
section (subsections, let's call it memblock1), and then hotplug something
that spans another part of a 128 MiB section(subsections, let's call it
memblock2), and subsequently unplug memblock1, vmemmap_free() will clear
the entire PMD entry which also supports memblock2 even though memblock2
is still active.

Assuming hotplug/unplug sizes are guaranteed to be symmetric. Do the
fix similar to x86-64: populate to pages levels if start/end is not aligned
with section boundary.

Cc: <stable@vger.kernel.org> # v5.4+
Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
 arch/arm64/mm/mmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b4df5bc5b1b8..1dfe1a8efdbe 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1177,8 +1177,11 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		struct vmem_altmap *altmap)
 {
 	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
+	/* [start, end] should be within one section */
+	WARN_ON_ONCE(end - start > PAGES_PER_SECTION * sizeof(struct page));
 
-	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
+	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
+	    (end - start < PAGES_PER_SECTION * sizeof(struct page)))
 		return vmemmap_populate_basepages(start, end, node, altmap);
 	else
 		return vmemmap_populate_hugepages(start, end, node, altmap);
-- 
2.25.1


