Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B40CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 00:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9g28iKd9GEEBKsPMgyqPsMIFKJGryqMtKFGw9hYR8o=; b=cioQByjXC01A7sCAIRlAVU2Jj1
	huA/fawOaUM+u46DpVgrs55OtuJhCgFPQv/3aACSBbaUhyiqIoBY1scHfNupIIv9Fn+yqquzTqPve
	/TVDnKwuRKR672TD1SZ6+5vJs7M9XbiPy867SFXpeIHZ+ie1eIZY/p7VzwMDG5ihOL+YhiPVY3ZjM
	Xg4I7zNv8TjZkj4qSpnwFdDHIXe8mirr65FfR0EcXR0BfROXFe/77So+BaTnLK2VG7ts2gA9iQygE
	t7TmeDgdx3mGOU/n+fcAyn7JLUMuBDvCqqJzl+4A36biiEEGuDZApp5yqpNMvcDPBV577PmwZZs7U
	DWT4ecsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHtPz-00000003br3-04ao;
	Sun, 09 Nov 2025 00:36:31 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHtPv-00000003bqg-1lOk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 00:36:29 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A90NKMP032066;
	Sun, 9 Nov 2025 00:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=C9g28iKd9GEEBKsPM
	gyqPsMIFKJGryqMtKFGw9hYR8o=; b=MTnMu/8ABAXg/m2/jlvr6e4NtbQfOtIgl
	xsZXD7uz5EFcl9m8ULFODxbC9eWTc5+3iPG+P/uQ8Z34rGDb1886yi1Ls+d8ISGM
	CsbUmQocRpG9ra8xmkEm/0Mhb2a5YRhAKAXlxJ6EvaXtcNDrIfKbYur+ZvQ8Awoh
	gqHnQiRQNxtY/KJG5z6hVZrkSYwcxOvIDK4Y3xvs3ZIgm5WvlZMJjtcjXCnOOXZ1
	Isfg96aCFghgIKl4rSHu9IvIDV9uIkbcpfvk7ANuYWnHHn25gdqjTmNiTogtF8U6
	jQtRBdnCyRt9wiGUkayMjQUTDk91yrBA6whl/7bYnqNZk8gtfgdzg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wc6tyfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 00:36:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8J0MGG012891;
	Sun, 9 Nov 2025 00:36:16 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5y82gnv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Nov 2025 00:36:16 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A90aEDK51183938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Nov 2025 00:36:14 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA15720043;
	Sun,  9 Nov 2025 00:36:14 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6FAE20040;
	Sun,  9 Nov 2025 00:36:14 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Nov 2025 00:36:14 +0000 (GMT)
From: Jan Polensky <japo@linux.ibm.com>
To: catalin.marinas@arm.com
Cc: akpm@linux-foundation.org, david@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        will@kernel.org
Subject: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging architectures
Date: Sun,  9 Nov 2025 01:36:13 +0100
Message-ID: <20251109003613.1461433-1-japo@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251031170133.280742-1-catalin.marinas@arm.com>
References: <20251031170133.280742-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAxOCBTYWx0ZWRfX4HQTAfYveTrz
 1GSXPLohTujNaxU6vabzpGMtuLy257+bS3xVUvxiFfUfDZbotVOwGVAPoiojhEPwzadJXVneGpL
 c4QWlNCEyPy4IUY6PXlMVi4nkRjjSw+PIS2gCXB1/IG8fAkxkH6D/8aHLR/4aYx7JjFsz9hHNHB
 d/RW+cn4nYCG+BJbH4E5Wj1yu4a9r+dpPCMNulF8ZUVgD8meTCbX+JbdG6Qafrg6URtPuKr72vC
 LYpr/L3nOYj01hODmr24m+7Inf+UjX7x9htx/+Sdf/5jyffYbfecGZIy8cF0vok5RnYO1dUZ+OD
 sf8JDMlrrqcs7+4OcWKEZnzGLgfL1LpsF/pJhzsCSBMRTHH9zMRVywtlbEyrgZg/El9atEqFxge
 dQ7WLMH4k6iZofdU1PRt82efdoSYDg==
X-Authority-Analysis: v=2.4 cv=GcEaXAXL c=1 sm=1 tr=0 ts=690fe201 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=VnNF1IyMAAAA:8 a=u5nbTVsyuFLneL7zQ6YA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 5yCytclTpiR2Si3mIT-NROSF3tV4cD0w
X-Proofpoint-ORIG-GUID: 5yCytclTpiR2Si3mIT-NROSF3tV4cD0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_07,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_163627_810719_1B375D3A 
X-CRM114-Status: GOOD (  14.35  )
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

The previous change added __GFP_ZEROTAGS when allocating the huge zero
folio to ensure tag initialization for arm64 with MTE enabled. However,
on s390 this flag is unnecessary and triggers a regression
(observed as a crash during repeated 'dnf makecache').

Restrict the use of __GFP_ZEROTAGS to architectures that support
hardware memory tagging (currently arm64 with MTE or KASAN HW tags).
This avoids unintended side effects on other platforms.

Fixes: 1579227fe0f0 ("mm/huge_memory: initialise the tags of the huge zero folio")
Link: https://lore.kernel.org/r/20251031170133.280742-1-catalin.marinas@arm.com
Signed-off-by: Jan Polensky <japo@linux.ibm.com>
---
 mm/huge_memory.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index aae283b00857..0c1794656d7a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -209,14 +209,15 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,

 static bool get_huge_zero_folio(void)
 {
+	gfp_t gfp = (GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE;
 	struct folio *zero_folio;
 retry:
 	if (likely(atomic_inc_not_zero(&huge_zero_refcount)))
 		return true;
-
-	zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
-				 ~__GFP_MOVABLE,
-			HPAGE_PMD_ORDER);
+#if IS_ENABLED(CONFIG_KASAN_HW_TAGS) || IS_ENABLED(CONFIG_ARM64_MTE)
+	gfp |= __GFP_ZEROTAGS;
+#endif
+	zero_folio = folio_alloc(gfp, HPAGE_PMD_ORDER);
 	if (!zero_folio) {
 		count_vm_event(THP_ZERO_PAGE_ALLOC_FAILED);
 		return false;
--
2.48.1


