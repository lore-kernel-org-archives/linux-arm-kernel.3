Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E297D75BCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 07:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vkRCAdghAGV/OZOlixTRMei5ZBVvBmCuVWIGEfSSu0=; b=QbhUUfdn27Rxo/w796SYXM7Zth
	Y5v2/u8AmjjorvzUTLURH0cz6uyDhsinM5S4uBjyWcW8jcYhkk65APNS8BVmt57Fv1eAhCByvC0Gh
	IgufE9w2LIVDWXlf7vzLjR4wJ2Bwi3fHrLyaiO4iKYZyxcdCHvv8alUgXclkDpggw0Eq+BZ+OFlGe
	QJGf4n1ue7VcabS0YsSPnd6U5KQR+ndz0c3jd90Nx+68A9AJRkBppjndHmFwmLZ9bNgj18/aQ/5K8
	EN2jLkKLswBJhx/7A/3uHSGGomV9ddXWoPqQezvtqujwVtzR0DatgQsLEXGQTHYkxkwplYgVHy48H
	qu02tXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE1RQ-0000000GzbS-2ABD;
	Thu, 21 Nov 2024 07:17:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE1Oc-0000000GzDG-3Pd8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 07:14:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKLAvTZ029738;
	Thu, 21 Nov 2024 07:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5vkRCAdghAGV/OZOlixTRMei5ZBVvBmCuVWIGEfSSu0=; b=RZAcPA2SVXaUaFkq
	/1rMx9njFLozm9kqShP8EwrwvTdZ3yyW1dPKFeWLm5t+yVu8bU9lCHNVpcLUCW3y
	E/nXNSozVm/yFkJJfaOFt7ku/939OiMlcu6kMXUgmHkbPwi/GvJsp8vtZZSyAazk
	zX/Sue40Fn80Mllo2DEo47ShsexCCHNihyfvtkhz9hGNwbiA9maGumwxeQ01A3u4
	MebPnOMckZz6GX5QbmZG990rwURMG+x67M9Su67dwmklzG72hS1/fIev7ZJdmxYS
	u4UIVCAz5e/eNmiu2ayr7RuS9Yg+vNSVAclb3ypVXINrWHDolo9JyEOkr8DM5DO4
	u+oQtg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431952bjcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:14:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL7EQNh022335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:14:26 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 23:14:22 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH 2/2] arm64: mm: implement vmemmap_check_pmd for arm64
Date: Thu, 21 Nov 2024 15:12:56 +0800
Message-ID: <20241121071256.487220-3-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121071256.487220-1-quic_zhenhuah@quicinc.com>
References: <20241121071256.487220-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r26VgHDOWkqgknP0jjAujSu1yuk8ENqN
X-Proofpoint-GUID: r26VgHDOWkqgknP0jjAujSu1yuk8ENqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 spamscore=0 malwarescore=0
 mlxlogscore=520 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_231434_862153_E2ABCA75 
X-CRM114-Status: GOOD (  11.98  )
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
index bfecabac14a3..0e19dd1cfc0c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1143,7 +1143,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
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


