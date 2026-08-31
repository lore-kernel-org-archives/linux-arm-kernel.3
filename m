Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3894AC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgOdmKk0HGp2w6txJNQpE2tFc4GPDNhhNoLF19m8si8=; b=AwWZpEUOv99+fHre3vXF+hsV0b
	ybi61arYkXu9U4sr0iLJny9hfGrrW99BznKvuDcsNa4gPVoyQR6NiAXnOS1x/yFNEzYIsBVskQ3tB
	ROy4Y86dWltekYURPFgh8+u1kv5s0/3pVl7qOOzN38zFMFvaUMw7VEv9GrjxVeo+7g35A4aPltELr
	by6dCaIap0IJlOQ962KpIDyPusta23/KM+8eLFSknYJ/ROwVitL9uglEKrKP4IJE/aazoZjYj/77g
	pB/hgnT9ZgmXbXngFAvwAZA6BvbX/K+s2dqlPUOsVnfvMNTH7aLgNI48ZQAvC/gfhI3Eo5inRWW7W
	JmWZcb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13RK-00000009jQj-2zmd;
	Mon, 31 Aug 2026 14:56:50 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13RH-00000009jMw-0L9U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:56:48 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VEZEvl2414993;
	Mon, 31 Aug 2026 14:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AgOdmKk0HGp2w6txJ
	NQpE2tFc4GPDNhhNoLF19m8si8=; b=aZOW/Z6dT9eqkuf8zgxy8EdUlI8knzwYY
	uW2ypbNaBCyVikctgWrOrKvIJUWO8sIRoXghKclGA8HbTt1wd/qGIZ+bSO06vljy
	EvNwXvRTmtL94WQNemm5YrZGa0R9pZ2DchH1hAjzwQmyVZbe+D8yXWsC5hNv9Z5W
	fg+bICXJbqhU24jbwsk8zcsjlvwOSN7M1Aruvkz1hUIm8q3IUiZ2FDvzu//X1enU
	GivG7ZFwZ7niZ31Fp/ADIqOHsLG1L/JQQFG5xzT1qGIXNYFALRT4ybVimv29TbZD
	zO87+NRVGb+nsYb0tuXquHvrqLdzSwhJMfzTK+GyusmlctmOGTvsw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbmuhj66b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:55:52 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67VEfbmC029519;
	Mon, 31 Aug 2026 14:55:51 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gccexx8v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:55:51 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67VEtjWA31981880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 14:55:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15E9E20040;
	Mon, 31 Aug 2026 14:55:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9694120043;
	Mon, 31 Aug 2026 14:55:44 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 14:55:44 +0000 (GMT)
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
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
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
Subject: [PATCH v2 15/20] KVM: s390: arm64: Use QAAF init save area
Date: Mon, 31 Aug 2026 16:55:30 +0200
Message-ID: <20260831145536.913567-16-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831145536.913567-1-seiden@linux.ibm.com>
References: <20260831145536.913567-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: NBzZ3vNIKerg2wA0OsIPkgrhomuar2rM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyNSBTYWx0ZWRfX9nekivU1Lxuu
 BbHWp/4tdO+b8ZawBA6/xXovRBsZWLlI493Lp4n41Pt/cUAy1uhctoA7LuQXD/3fpj40xmkj5YM
 ZOEAbGfhMr7siDEwIO6JeSlZ2noOLLADGGtpLuBZAFaGpuu+io2BknrQEOkwMBkXS1BVuK+Y9Rv
 /SexI8pLtKpPaJm6OXV69lrAk0iT0pjeph8B1h71SYqzRruU7tD6pbyj1tZQenuEBeDNjFpYKQ7
 KVavIP62XWxiACsQRb9WZTSSAu1IqtCwo9rjKmoRGZ15l5g3gNQpyXv3hXdOUzhd9USHq3x+iYD
 J/rVltz1cV3u1xzxtlKA+yhMc1KC77l4+od5JSBIWPoYU049eeMNVtuZOAbNFhqZ/AaLvJeE+7t
 ZJ4hT+EDO64fFE2LwvmmcG1hgoaRhHatuNuuvKg24+4rVh6Zu8hNFCJs5wrk7cvdvtk6Fbn5wMY
 wtczudlMVVpbqmOesIA==
X-Authority-Analysis: v=2.4 cv=Osl/DS/t c=1 sm=1 tr=0 ts=6a9595f9 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=4v_MITeQBDqVJkbHs2kA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyNSBTYWx0ZWRfX6500rR5VYJKJ
 iVcLUSoRYPoiu4PxA+WRrYJzq9/KOnvJ84VfSq3+/i5THd+EZbE+Bq0+1jjjNNf/3la8n6RGfVx
 p9qRg7Yfjyl55JaS/WP/oMVRQz/UVGI=
X-Proofpoint-ORIG-GUID: PRi0ymHEIIdEKaZWe21iewkiw92C0-he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_075647_236472_DD9F5E43 
X-CRM114-Status: GOOD (  15.04  )
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

Use the (cached) result of QAAF fc2 (Generate Initial
System-Registers-Save Area) to initialize the Save Area.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/arm64/arm.c   | 1 -
 arch/s390/kvm/arm64/reset.c | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
index 3a0bba6e0a06..ab6e7d135435 100644
--- a/arch/s390/kvm/arm64/arm.c
+++ b/arch/s390/kvm/arm64/arm.c
@@ -360,7 +360,6 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	int ret;
 
 	sae_block->save_area = virt_to_phys(save_area);
-	save_area->sdo = virt_to_phys(sae_block);
 
 	ret = kvm_vcpu_set_target(vcpu, init);
 	if (ret)
diff --git a/arch/s390/kvm/arm64/reset.c b/arch/s390/kvm/arm64/reset.c
index 74622ba6f081..bc7bcee75779 100644
--- a/arch/s390/kvm/arm64/reset.c
+++ b/arch/s390/kvm/arm64/reset.c
@@ -10,6 +10,8 @@
 
 #include <clocksource/arm_arch_timer.h>
 
+#include "qaaf.h"
+
 bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu)
 {
 	return true;
@@ -79,6 +81,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 	if (loaded)
 		vcpu_put(vcpu);
 
+	kvm_vcpu_init_save_area(&vcpu->arch.save_area);
+	vcpu->arch.save_area.sdo = virt_to_phys(&vcpu->arch.sae_block);
+
 	kvm_reset_vcpu_core(vcpu);
 	kvm_reset_sys_regs(vcpu);
 
-- 
2.53.0


