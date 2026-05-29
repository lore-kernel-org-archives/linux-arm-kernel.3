Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD822CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/FkRX+SkHZmJLVfESRkOboCdzcmTpr5KGDuU5B1jY4=; b=cK/2jLIGFOmr/jg6q7EMkTmAXb
	ixBjlBUGR5ewhl6GYigvKxX5SeJJp8VPANzTjKmmAVYQDxaZ7fgt8LuPG3i3d1D4PcDNy9tSnfZN9
	v0SXRyx51bqfXxHqWaAj85p2o9PM+R/CrtF4MKK+Qx0zEB2LHeCjMuRKbBfg2RXo8JWqmtxzZzWPq
	qSX0enw7cUbVaLzl2WqkhDLDFZRaGQGx/7TTR8MWzK73anXoSlEWVhxycEdMcpUC/qhs5o/zCLu1c
	0pevT5Ax60Se/XwTYxoIqTQecaUMjne4p5CtgU8omU3KvGIXRVSxH8nQg3reyQsVFc44eShBvdJbf
	dheO8K0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZo-00000007ma5-1iXl;
	Fri, 29 May 2026 15:56:48 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZP-00000007mDB-3brk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:25 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TFAXSC2419213;
	Fri, 29 May 2026 15:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3/FkRX+SkHZmJLVfE
	SRkOboCdzcmTpr5KGDuU5B1jY4=; b=V34lUfcpaRVZPqVpvVs+sLOJLgO7gfRJ+
	kLjFvhE+ysG946P89jOQOn+qoddOadzUGpB3v3/IDkrYxGjGcSW3JbO8ZFRp7M1U
	AbpK0G2b84n4SpJSGrkCioEo2Zi8hoQSuoLROclb7ft/mjNGDcqmWBWm1VH56nEz
	4xQhC/YnXvSKQmMjjk7YwSeAtmDB4kYoPGJmN/edDOMCnrju08jfQa300PMKk3It
	6hBxZbZ4g5tlOfXx0da5DWQdxVAI9xCwtPFyzxfR+wMlu5aS0pswlaE8z9mhEetX
	SvJeJsX5AJUTEuXpl84JK4wlY4XDpIur99sLkht/KLCtQTFFhgwTQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee884vknk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:12 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFs814023079;
	Fri, 29 May 2026 15:56:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4edjrc0k1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFu4t616187700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:56:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1F6120040;
	Fri, 29 May 2026 15:56:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 865482004D;
	Fri, 29 May 2026 15:56:04 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 May 2026 15:56:04 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v1 07/26] KVM: arm64: Remove kvm_has_feat_range
Date: Fri, 29 May 2026 17:55:40 +0200
Message-ID: <20260529155601.2927240-8-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155601.2927240-1-seiden@linux.ibm.com>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=L4MtheT8 c=1 sm=1 tr=0 ts=6a19b71c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=3-yqm4NPzKxgNXSuSH0A:9
X-Proofpoint-ORIG-GUID: iRKEu5XZGYdTQl1aubAOq9aFT057y5V6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfX8mTz7O9VCZFE
 R0XL99rl7E3yEfO2jUkeFCw65+CjRp4OtiyuZQ1D5P2YKaZ5EPpZvFlCGZr+o/HVLxaELK6D7Ze
 M0AtUF8VESpOJGbVIVny3zPZGSxbHohy/2AWVERM3iaFZoKVPDad7OUka8DmDmbvwXrteTCsGyf
 MQOx0qVS16L7/aughYsjRWDyG658HCwKaMl/024pux99SZ3aZoTC7E7tQFMCKdvdHnbvqy4JCdg
 NtzHTu32KWRqIwB9lvmn6xo7XXgoLSBDInAdOHbivz2jvi6Mv2hOqkcZ55OAUERGvQGQqiYA+Nb
 a/cia20Md2aMzdbkM62zv9QzcFe3OOFHP3WjG+f4ClqvLCHvZt5qE2ldnWJpd4oOC6d/1RH+wJ8
 3BczdDf9r4VraVSDORZon4KkHF3EPgCb5J1zZNGEKxQJl1sMH9iptxmZXjV1sD4k7XdcMsrS3d1
 swNwplc0CQkEp1ZfrCA==
X-Proofpoint-GUID: iRKEu5XZGYdTQl1aubAOq9aFT057y5V6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_085623_902185_ABE44A3B 
X-CRM114-Status: GOOD (  10.80  )
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

It is (and has been) unused.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/include/asm/kvm_feature.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_feature.h b/arch/arm64/include/asm/kvm_feature.h
index da9ba5041f44..27a472d2343e 100644
--- a/arch/arm64/include/asm/kvm_feature.h
+++ b/arch/arm64/include/asm/kvm_feature.h
@@ -46,8 +46,6 @@
 
 #define kvm_has_feat_enum(kvm, ...) __kvm_has_feat_enum(kvm, __VA_ARGS__)
 
-#define kvm_has_feat_range(kvm, id, fld, min, max)			\
-	id_has_feat_range(kvm_read_vm_id_reg((kvm), SYS_##id), id, fld, min, max)
 
 /* Check for a given level of PAuth support */
 #define kvm_has_pauth(k, l)						\
-- 
2.53.0


