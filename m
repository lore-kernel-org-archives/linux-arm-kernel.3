Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7337BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtABRAQ0YEr/CI1X8BieMgHVTu9h5oCNjef5fZpS0XE=; b=YhFTrbbYvvpavjHpDkYkqpV7kJ
	W5gW9bQSuapD1pquG1Lqwn3aaCR8Ajk9r5k/xsFCHaODAlKKWIJLLN/+RFusaIZGLN7P/p8cgqOTd
	iu1ol3jg2dpIGhZPuhwUungjYpBkm335t8uBRMHll/SJN5Eco9YGhAqJuY1GsQL2OdW+ojLxO1pPq
	dwyTOVxQ3wogMzwHpk0Af7UOXlccSPN2DikrNSmuWZ8GVgqXk1Ty3QTpbcYtZoKIR2dpnA7bxSss+
	7jyIMCa6tu8+pOrKEFCyGuH17fVte1x2laWwFo/CDA69pEpljTGURXcJuxQ8mGamw6X0MixP8iSkd
	kPRHGglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaLE-0000000784j-1Ttq;
	Mon, 09 Dec 2024 09:46:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaIL-000000077VA-3Kez
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:43:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8MMWYR012704;
	Mon, 9 Dec 2024 09:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtABRAQ0YEr/CI1X8BieMgHVTu9h5oCNjef5fZpS0XE=; b=c1hrRAJJUL8NJMcq
	bM+hWcCgUlXoeumzTI0rTfVNnCGanA1GHZUX0iaNAVx0gTD65t7S2hVMHqz/1228
	dxZWbR1IC0FpQGAERJJdktQWQDsyF0F5i6wFdOgAODynMMZvo+mtumH+Q2NXpomQ
	FXfo3RfJbC2L7C9TBvfRz+7QpoiZwP0jDDftWf0hXY0xkjTfwmRWnu1Ra+Z62SgJ
	7lS3wvzcfqJbggRwcMEsoh648vPKW9STcPvOHllQGBN14YKsCcA4uR468o5wsBG2
	dcxSyy195O1lQyHJPTVumAWygsFdC3PEVuGLXChRKtJ+fvedB93NbkGUWuHVKh0k
	4yPoKw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetm41g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 09:43:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B99h322017647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 09:43:03 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 01:42:59 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>
CC: <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH v2 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
Date: Mon, 9 Dec 2024 17:42:27 +0800
Message-ID: <20241209094227.1529977-3-quic_zhenhuah@quicinc.com>
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
X-Proofpoint-GUID: gs-sJae984RW_OSNds3kolLIBqleNwa7
X-Proofpoint-ORIG-GUID: gs-sJae984RW_OSNds3kolLIBqleNwa7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=497
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_014313_937537_2FE2E97A 
X-CRM114-Status: GOOD (  11.51  )
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

vmemmap_check_pmd() is used to determine if needs to populate to base
pages. Implement it for arm64 arch.

Fixes: 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
 arch/arm64/mm/mmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index fd59ee44960e..41c7978a92be 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1169,7 +1169,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
 	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-	return 1;
+
+	return pmd_sect(*pmdp);
 }
 
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
-- 
2.25.1


