Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2BAFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v04zGq+pk2AFIVLTjVznhliSgYqvYsTVKWmiBCchCqY=; b=eKt/1qPvisEfxGWU5hcgVialNW
	PVqjC7Qh3sgWeU790L+bUrpzdDBHur5JIjDFGf3jY1/REWxo2xFuuy4jYPFYeAnkw2heC1aKCMgZq
	HjUguc2P50ibDXNWUoiKB5uXioGWlr5BLyxDQk/5737wzFWY8AqZPZI0FMLmeti5YK3rYK9OPXXYC
	ODfHt0L1trYRNGbmDb4aRAQJ4yYKlV5GMDfm35tqUaH7v65ypaYEZeg9u6x1JfaIrJ+S21DWiWGlb
	clxOyKN9qnfFYR0/UDs7hYwj1J2ernA3ZR9s2AZxANpSt4OEZPgZ8e3G0HfhbOSWrmSyseFzUhtvM
	y/zTJlvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkww-00000001pke-3rSy;
	Tue, 28 Apr 2026 16:06:14 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwf-00000001pSs-2suE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:05:58 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SB0EM3584793;
	Tue, 28 Apr 2026 16:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=v04zGq+pk2AFIVLTj
	VznhliSgYqvYsTVKWmiBCchCqY=; b=YpNWFxHaP8vGz+OXXMkuKmSThw8BetkFP
	F8pHNuG9CGZZFIB4yV0RUXQIqsD4OEPlOS7yAKBoU7vOjrdH/urbPiRYu1O04RpM
	BYsL4dtl/pNtDJWtRJPgg85Hho5ql4DHtu+LDQNLNdxRTAe0aPPC7cjiQCLcfWZt
	L9O9Tlvm45ZIGjppMyjIQGEf8ZLmks4WvHq5dNBki3Vve1T/191n9RhVqrFnCYnj
	I8wjuejYnGOobnKPkK5vv9AuXuwFJkNS6N6+EinoMXYeGXG2mf5CwodPyjpL49C5
	egZVf1EoJmVqcrOrZh3NYrVreRqOfvFVhetjqarusavkEh3ZrQfwg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4drn9r6dpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:05:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63SFrnfw027712;
	Tue, 28 Apr 2026 16:05:37 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dsamya6gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:05:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63SG5Xa941156954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Apr 2026 16:05:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3758820040;
	Tue, 28 Apr 2026 16:05:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9C9320043;
	Tue, 28 Apr 2026 16:05:32 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 28 Apr 2026 16:05:32 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: [RFC PATCH v2 15/28] MAINTAINERS: Add Steffen as reviewer for KVM/arm64
Date: Tue, 28 Apr 2026 18:05:12 +0200
Message-ID: <20260428160527.1378085-16-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428160527.1378085-1-seiden@linux.ibm.com>
References: <20260428160527.1378085-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -p9ZKmtFu6vBqfD4T6QT7oFv22Kjfvw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1MSBTYWx0ZWRfXw+0zIeNFScjy
 vJphXSskEUtli0lFXKAJgrNY9TJ90hXVdeM6COTWEVsmlJNj0kvwQeP55EOG7qbhGO2iJigHTbq
 9mohaOJvbGY5Q9dkg+KKNRJ6hF35Gli1upV+GEoei3yYyKb0fV3HSVWjhrGIA3FdF9FFQQ2SBlG
 iiKwIbBPALUpc5OGMPaqxlS4KWD6DwqUk+rdxp+le9LlH19IFD0IFBjDB3fifMG/wrh7RJscHmk
 PXT/eFZFKVIX/aW2RXU94WjmWWfFGtp0sv2Fcg4BumTAo0HT18A6Ev3CyAfonxdtoOmXS+VmTmT
 W37vXPFP1NecXtALQ8953TDLUPiY1DNah4AB3K5sOHtX3ueRFywNZ654Qt4ccAMjx86uHH7tuau
 KB596XFeQVDpi/fB7R7SFj0z8CnTiGlM+zBzBuoqI8Kyd3JliXOv8esP2ycSR8ILgvZIIjzt0Ky
 HIbAzF0b8PYCiQZl5og==
X-Authority-Analysis: v=2.4 cv=Kc7idwYD c=1 sm=1 tr=0 ts=69f0dad2 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=i0EeH86SAAAA:8 a=JfrnYn6hAAAA:8 a=LyeO4m0CWtv-FIbIQ4UA:9
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: -p9ZKmtFu6vBqfD4T6QT7oFv22Kjfvw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_090557_737278_0B964DDE 
X-CRM114-Status: GOOD (  11.66  )
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

KVM/arm64 and KVM/s390 now share some code.Add me as a cross-reviewer
from the s390 team to arm64 to help to keep both architectures in sync.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ddac3f73d9e..cd1485362a54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13993,6 +13993,7 @@ KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)
 M:	Marc Zyngier <maz@kernel.org>
 M:	Oliver Upton <oupton@kernel.org>
 R:	Joey Gouly <joey.gouly@arm.com>
+R:	Steffen Eiden <seiden@linux.ibm.com>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
 R:	Zenghui Yu <yuzenghui@huawei.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.51.0


