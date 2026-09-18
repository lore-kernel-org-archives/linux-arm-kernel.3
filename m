Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E28C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5SCNP8saHi3O3B1kNvg87I+cyuIzf7H9GcjrjizG3o=; b=DKj2QBV0JUIV+p6cWfYQG16TX1
	NbeZh1z3eooLgjwFiGokb1EPAeHCcamnzS27+8CndNvwTfaWgiHYnThesjuXRM/n2zakUoAUKJxi5
	c6dMAcBcjBEyDM7z+MwEAV//RYzapOBvIiZVQtK1+yWaMHYU2W/jrPkgTuIkkPcWpkSpOZRStW3Ca
	SkxFhfYZI0OAskXFcEbKpA3JW/L9hxxMDlMOqeW1Y4UbTEuwp9rqya0G8QQFTAwHfZmtrMSUOCKcc
	hzIwWEaWcLL46XtaxKnXbCfOQg5V323BNHHemlan7/YYT3O4EOklpTnYCsMa9754VdLXc3gOYm+Oe
	CfEeWt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ygu-0000000EX0q-0XTQ;
	Fri, 18 Sep 2026 13:31:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ygl-0000000EWuC-2SmB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=C5SCNP8saHi3O3B1kNvg87I+cyuIzf7H9GcjrjizG3o=; b=aJbODqe9kxHWlEdF+LAqLK2zrP
	VEJ0vI59zk2IGz7AinkonmneaA50mdA7vHd5kVswcY9hOfW3gdhqz9Vh0sr5LhnbYFVXZd3tuMKXT
	4PgDZ6MgA42qxbYzgi8V6UepciAtScQNEVZOGD+2M0m7RVAZSQH0OvzPE+cnurxV8Md2wvR1+wCiO
	AKmwOFEJ7H/vfLhifPoTSuwBeBGhJ8TjuSuP9QkBLii9JSurJXasUgrcTU+OOTZH7jMyFL3JfJ5AV
	No0q3KKIcEXPbZ64PZ2IhRweXaXjkfzou+Ay+Y+1Qv7T6lxj6ctUFdwdJXr9mo+yNcMsTfRub/+/+
	IFK4wORA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Ygh-0000000A8XM-1dDO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:31:38 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA1VXo960914;
	Fri, 18 Sep 2026 13:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=C5SCNP8saHi3O3B1k
	Nvg87I+cyuIzf7H9GcjrjizG3o=; b=Ko8fDgQ4pLot/CcAAYQGooiN4YjvVU1QK
	jB6gjcmUricbP39QTj2QoRkRZs0xJ150QY3lUVzkQGbU/U4yAgl5E3AbFMo98dlp
	4Qnra5FwZ0DawM3dfQh9k0sM+5R77SS1lU8YsH3h8Auz5R8DSe2JgSrdH9Vno7xb
	kJd+HWe9BPZkYeeLCaimYiiiJ1mSkNviSR7smoOQiXPE+3DUOWRh0ca+cihA1Sbw
	z/pBn0+E5xP8c4iGvsRqfYwg+2ZEC7jJfTeZyg9PdPP530O4yZTMCiZe0QpTBJfa
	N497h2gUSwBKIhggJjJBp3GJxPS32rR7uSw1hf9IqChvm5uIQEDFg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmxf5gb75-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDNufH771797;
	Fri, 18 Sep 2026 13:31:22 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gr5fffhcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:22 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IDVEWv20841000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 13:31:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 536782004B;
	Fri, 18 Sep 2026 13:31:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 045D520049;
	Fri, 18 Sep 2026 13:31:14 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 13:31:13 +0000 (GMT)
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
Subject: [PATCH v8 17/29] KVM: arm64: Share arm64 code with s390
Date: Fri, 18 Sep 2026 15:30:54 +0200
Message-ID: <20260918133107.1042730-18-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918133107.1042730-1-seiden@linux.ibm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Gd5dYhDmS8id6aAs38q-IeAloOoIi_tv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX384FMWKEv2aj
 QvUqUYOdWfojFvSd4aUPC8ThKjbYvjuwNodZTRunetGk4xZqQcDpd6sOyG8Pg3jly9KFfhozTJT
 9GLSI7QMqFC84u3CyZg7sXU2Ap84ZHs=
X-Authority-Analysis: v=2.4 cv=cvgOAF4i c=1 sm=1 tr=0 ts=6aad3d2b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=3a0hE5hcTyqzKRjSqTQA:9
X-Proofpoint-ORIG-GUID: RxgjPLRIDeiqnHJfQ4CCB1Yd2NanKony
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX5B0YoHVfggDR
 ycvbVN32uWWkZYYDaGkzET0g11OuYLetTBpKvfBVtCBMUbLUCcRcVZyc49ajtFNWyJ8IIfl+eAo
 Ho7pmjjWwVOaylJX0YMHLjl3G2FksTx1W14U/knkWnKaCi3i1v8SFaqka7LVC4DSIs+mveJQzLI
 CF89nSz6tjn1PFax+8ojBwHYun1c1GJWkTNB5JzFBTQPiq41G/cuQmniirBLK2fN1BH4Z3dTW1v
 oJ6rJPYzwwpz9wg3Sr8LXi+f1Xyfbp2Y4Vpit4VjIB90mwNN/0BF52JpvfzgUtEa+08yS9VOrKP
 nwIVlBqc1y3tS8bq/+merr94S6NR+VHi+wsr6SRh2QMsxyOHy88pw6Cxhx0oU7hnMxwvWU5dqTt
 oe1rITDoZ6vKUsT/Ta8LHLSqDKfMyQEuvnTGn+PFMzE1QZE0QTKdz11QW7BwjrLiEjhkjpRA42P
 RkzhCkcgeLTwHL7DMjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_143135_808823_4D8D350E 
X-CRM114-Status: GOOD (  15.61  )
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

Mark functions that s390 can use to implement arm on s390 as shared
functions.

No functional change.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/kvm/arm.c   | 3 +++
 arch/arm64/kvm/guest.c | 6 ++++++
 arch/arm64/kvm/mmio.c  | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90..6b92a3c1d490 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1603,6 +1603,7 @@ static unsigned long system_supported_vcpu_features(void)
 	return features;
 }
 
+#ifdef ARM64_S390_COMMON
 static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 					const struct kvm_vcpu_init *init)
 {
@@ -1656,6 +1657,8 @@ static bool kvm_vcpu_init_changed(struct kvm_vcpu *vcpu,
 			     KVM_VCPU_MAX_FEATURES);
 }
 
+#endif /* ARM64_S390_COMMON */
+
 static int kvm_setup_vcpu(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 773f6c8e5026..6ca5a9f357cd 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -62,6 +62,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 		       sizeof(kvm_vcpu_stats_desc),
 };
 
+#ifdef ARM64_S390_COMMON
 static bool core_reg_offset_is_vreg(u64 off)
 {
 	return off >= KVM_REG_ARM_CORE_REG(fp_regs.vregs) &&
@@ -306,6 +307,8 @@ static int set_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	return err;
 }
 
+#endif /* ARM64_S390_COMMON */
+
 #define vq_word(vq) (((vq) - SVE_VQ_MIN) / 64)
 #define vq_mask(vq) ((u64)1 << ((vq) - SVE_VQ_MIN) % 64)
 #define vq_present(vqs, vq) (!!((vqs)[vq_word(vq)] & vq_mask(vq)))
@@ -543,6 +546,7 @@ int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 	return -EINVAL;
 }
 
+#ifdef ARM64_S390_COMMON
 static int copy_core_reg_indices(const struct kvm_vcpu *vcpu,
 				 u64 __user *uindices)
 {
@@ -591,6 +595,8 @@ static unsigned long num_core_regs(const struct kvm_vcpu *vcpu)
 	return copy_core_reg_indices(vcpu, NULL);
 }
 
+#endif /* ARM64_S390_COMMON */
+
 static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
 {
 	const unsigned int slices = vcpu_sve_slices(vcpu);
diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
index d1c3a352d5a2..5161102da507 100644
--- a/arch/arm64/kvm/mmio.c
+++ b/arch/arm64/kvm/mmio.c
@@ -10,6 +10,7 @@
 
 #include "trace.h"
 
+#ifdef ARM64_S390_COMMON
 void kvm_mmio_write_buf(void *buf, unsigned int len, unsigned long data)
 {
 	void *datap = NULL;
@@ -258,3 +259,4 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	run->exit_reason	= KVM_EXIT_MMIO;
 	return 0;
 }
+#endif /* ARM64_S390_COMMON */
-- 
2.53.0


