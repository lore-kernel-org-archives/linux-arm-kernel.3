Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82809E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EK54y8CHU5sNfi7hM3+XjOQepNeNKL+xAEwrzp2ynPQ=; b=uFzXFOeigKAUCg4Ej9AuWeQnC9
	mVDb2JRjZdAC3+LYT/xUNlO5hTOOJQA9vMOXAGAxStvQZ/XP8xRCOBncNbg+OY0M5rXFfUD/uFjPV
	Kkg9pKko01ygovGFTqAlWpRR+KOVXfSCqFac04M7Mf1vz3l5lY+ZpJ4hxkx2gDtODh1WHJgeU43Dh
	Rvkgy8VB9cvNmDQBX1vKhMgJWzrV6Ba7lg8wnSrefnvqdjSyVEfwPMIYM3s2ceajdCI6qXrPvQWzy
	KssC82s5PDSiZfN8fPt5JyxcQDJVX1pC7ngDzPo/4H0wBzSPuC/AilA0/QWX4u5Ist4ka3qSLh+Hr
	RgBjQoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTFr0-00000009sfu-0hHy;
	Thu, 02 Jan 2025 07:42:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTFpp-00000009saX-0KnL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 07:41:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5020NAnD007852;
	Thu, 2 Jan 2025 07:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EK54y8CHU5sNfi7hM3+XjO
	QepNeNKL+xAEwrzp2ynPQ=; b=DO3jzXliYb9ipc+HEeE9I3ElqmQmeQVWBEYO+q
	qehVoXrbkJTCOvn9gZHYc8hpZX0xpITUvHG1O0i4uKArO5pSkTpb40Q/zWCv4ixv
	9MOaClHVFCTg7et7Zyy60rq0mi14YwNcc0aptXkIVCUJIxiRXvEalX8paXoLrEr8
	DqZeTtVUUbw8tP4ai92rqISHHY9H7iipUDadvnPMUIo/4TeOoEbdfAtRdCRM5HS8
	/xk4ZqcvRwj9VFMxcoNW+V4DDUUldddnZ6Qed94OZdC5qZ6qCKnupA5ro+RkQzEF
	/w/j5Jo3PXAgl+RmAmckoZqjxdT4TCCHW3HPPFwA///4bFJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wba18yc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 07:41:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5027f6J0012349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 Jan 2025 07:41:06 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 1 Jan 2025 23:41:02 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <anshuman.khandual@arm.com>, <catalin.marinas@arm.com>
CC: <will@kernel.org>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
        <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH v3] arm64: mm: Test for pmd_sect() in vmemmap_check_pmd()
Date: Thu, 2 Jan 2025 15:40:47 +0800
Message-ID: <20250102074047.674156-1-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Lhnmhoqz3CUaDTaNRgp3XVbPTfOmZ51M
X-Proofpoint-ORIG-GUID: Lhnmhoqz3CUaDTaNRgp3XVbPTfOmZ51M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=475 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501020064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_234137_256056_B03FB786 
X-CRM114-Status: GOOD (  13.11  )
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

Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
introduces the vmemmap_check_pmd() while does not verify if the entry is a
section mapping, as is already done for Loongarch & X86.
The update includes a check for pmd_sect(). Only if pmd_sect() returns true,
further vmemmap population for the addr is skipped.

Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
Separate the patch out based on the discussion:
https://lore.kernel.org/linux-arm-kernel/20241209094227.1529977-3-quic_zhenhuah@quicinc.com/T/#m41d49cd91b348ecfe2c37c4b3c0911180426934e
 
 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 9afeb35673a3..50a22c63f450 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1172,7 +1172,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
 	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-	return 1;
+
+	return pmd_sect(READ_ONCE(*pmdp));
 }
 
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
-- 
2.25.1


