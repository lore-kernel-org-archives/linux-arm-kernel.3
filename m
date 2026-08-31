Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB672C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2ZzltNpkHex+iQja5blDK4Zfeh6RPF38XtKZ59DEuQ=; b=4grebL0yegZqfrq5N3tX9I6TuA
	QYgGJLGDCIDDDoE+uSSX7nPoEL+jm5+IqI+kNNFO5yt9R6NqtmQ2SMaA6RCXa9xCNbSASFjTi7VU5
	RUx1ZTyhEyhqjyFL/mXqLghoVmhaGgQkXdEu2MJCPkZl+BEy52ZaB8mNijQeNtI/+SViH+ruTRvcU
	sVnOdL0WFF2ZAM+hPFjf7+2FyiFRNmbxDYzu4U+eEPiggBZgKXaNU7/SV1OHyv8ER+yObnINyqhUF
	ZBtYCzAqmmePedlJZP7JUTsaRszuhcbuuUmGIEvw/6qvdhq6t8IPjaSJb4f1dnhRQsiubMtFUEj36
	XTUB+qtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Vg-00000009mD0-0hbU;
	Mon, 31 Aug 2026 15:01:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13VZ-00000009m3h-215S
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 15:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n2ZzltNpkHex+iQja5blDK4Zfeh6RPF38XtKZ59DEuQ=; b=OR1jN+oH2gTTT5FHy78De0pMiR
	a2Fx5DPzLI9SFN5Ar4Tmqf3riwSDCqcQkVHZGrkY9odxBgzLFWI/sAE4zdqyLAlzwMbQ5F4qafUlo
	wjHcFzuXMl+OEumE2K7lzCxIExMQhrlZsBnVLaV9Zesw8fCt9d3XbZU6lL+MH1/TNnPXthzMTG41U
	kcS3Xbm739HQBPAp9llqpPeKIkfCgAeCmnwmsfjytMx4hpkfuKiWGmnLh41AJrOJKUd7H4yv/1EpC
	OUd2jfuceIdopDo6LviwrDFx6NtVmDJroebzHpgLrfoIb7Km8QfX33HcXKqN2QaFC9OPVSfKb9VB5
	a2ht3/YA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x13VV-00000009xw0-3viw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:01:12 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VEZ6Pq2525491;
	Mon, 31 Aug 2026 14:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=n2ZzltNpkHex+iQja
	5blDK4Zfeh6RPF38XtKZ59DEuQ=; b=toO4gntqB+R1xnmWlXz1820gEEYdGyFww
	ehvPQhatz/6HutiVJw5Z4AV9QmnO5D6foxKVumyazUluy7qtw3yGwKcAC1Ad8miE
	+Tb1awLhZTzxVFHDqxJZDBUkmjHqLNMHuFqi1CQTI+dsECIdSLtI1hFPmsgOdv+y
	z8dEUa8A1TN7JNvi0wRiIIsWT/h1vRoU+XRqORzTSEOtPjmhIUV8YO0qnkxX2Wcw
	3H6rddkCmbPS18a0nt6nud9XH8J5VA5Zo8UdgnSE2WWQYBt4yPgy/i5vPy9u8edr
	9tqRculiLhhRyVsmknjsTriTC85hxGaM4JMRlLi3TpXZ5lfi71Qvw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq54j0sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:55:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67VEfjML016993;
	Mon, 31 Aug 2026 14:55:45 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gcb8h6dp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 14:55:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67VEtcTC42140014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2026 14:55:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DACB20040;
	Mon, 31 Aug 2026 14:55:38 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECC3B20043;
	Mon, 31 Aug 2026 14:55:37 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Aug 2026 14:55:37 +0000 (GMT)
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
Subject: [PATCH v2 02/20] KVM: arm64: Extract number of sys_reg_desc into a constant
Date: Mon, 31 Aug 2026 16:55:17 +0200
Message-ID: <20260831145536.913567-3-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831145536.913567-1-seiden@linux.ibm.com>
References: <20260831145536.913567-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyNSBTYWx0ZWRfXwwsp7QcqGon2
 /naIXQfKKua5WSm0UYnBmbYcGAAuBpiKPe+QRx1LH9Jcg1N9u8qsvCGMR54NNL3KpF342u2zdSL
 TwbRVL28+x1LHBgnPhwXYHEYU2HmwoTEJKlFcebGAYrazJVVZq+/s3mx8LhpnQtVrP9EQBN1hTN
 CDvk3+I+c0BOfarZkK+as8xMp8khnzd45LY46DaVB83beX+7lTGDWzdWzvz7RuQGvywPqDH6Jmi
 1gBoEc4ChP3VBSntlZnor/OUtkiCG9KscZ7SmucZ0KIwswwFCWGVFNqSDJrMtZSKq0pQIGYZ80B
 cteKX8bgzxZ3I3IyUujaSCLnXvq13lzkhym5hOu4Q5P1ZLLX7bldbMItxmMTi/hmOI6F88IRYqI
 gbgoxNiaSTJm7EdXiYo485rHJ1QoTCJjQwq1tVArIfzD9lI0jlApsGkrnmwLMSmA7RN6pLaSqqB
 Rwt5cIwf/oYMJu08ocQ==
X-Proofpoint-ORIG-GUID: zGEpnRcRaj9hXPagxpChJ2f52TpXAKp3
X-Authority-Analysis: v=2.4 cv=CNgamxrD c=1 sm=1 tr=0 ts=6a9595f3 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=z2kGeGWSKoQvA0gLZOcA:9
X-Proofpoint-GUID: cHDuoPV_7b1T8YBK4QJkYjJg0tuyxjyH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyNSBTYWx0ZWRfX7yvVyKvIySnJ
 PxXbUipa4CqqC3wqGM/ndkTBFXUZr1yb8LKVQoqF16DpE2FzkwwU+xTX4F0ljI883XQzSsLWrni
 x4axGiEm8Ya5iM7ySkrRgP9Gfdu8tb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_160110_401864_3807BCE6 
X-CRM114-Status: GOOD (  19.02  )
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

Define the constant `num_sys_reg_descs` which stores the number of
elements in the sys_reg_descs array. Replace all occurrences of
ARRAY_SIZE(sys_reg_descs) with the new constant.

This refactoring eases the integration of handling system registers for
arm on s390.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/kvm/sys_regs.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 06dc8ec7a883..7d0047b542f4 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3976,6 +3976,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	EL2_REG(SP_EL2, NULL, reset_unknown, 0),
 };
 
+static const size_t num_sys_reg_descs = ARRAY_SIZE(sys_reg_descs);
+
 static bool handle_at_s1e01(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			    const struct sys_reg_desc *r)
 {
@@ -5187,7 +5189,7 @@ static bool emulate_sys_reg(struct kvm_vcpu *vcpu,
 {
 	const struct sys_reg_desc *r;
 
-	r = find_reg(params, sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
+	r = find_reg(params, sys_reg_descs, num_sys_reg_descs);
 	if (likely(r)) {
 		perform_access(vcpu, params, r);
 		return true;
@@ -5205,7 +5207,7 @@ static const struct sys_reg_desc *idregs_debug_find(struct kvm *kvm, loff_t pos)
 {
 	unsigned long i, idreg_idx = 0;
 
-	for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
+	for (i = 0; i < num_sys_reg_descs; i++) {
 		const struct sys_reg_desc *r = &sys_reg_descs[i];
 
 		if (!is_vm_ftr_id_reg(reg_to_encoding(r)))
@@ -5268,7 +5270,7 @@ static const struct sys_reg_desc *sr_resx_find(struct kvm *kvm, loff_t pos)
 {
 	unsigned long i, sr_idx = 0;
 
-	for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
+	for (i = 0; i < num_sys_reg_descs; i++) {
 		const struct sys_reg_desc *r = &sys_reg_descs[i];
 
 		if (r->reg < __SANITISED_REG_START__)
@@ -5370,7 +5372,7 @@ void kvm_reset_sys_regs(struct kvm_vcpu *vcpu)
 	struct kvm *kvm = vcpu->kvm;
 	unsigned long i;
 
-	for (i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
+	for (i = 0; i < num_sys_reg_descs; i++) {
 		const struct sys_reg_desc *r = &sys_reg_descs[i];
 
 		if (!r->reset)
@@ -5594,8 +5596,8 @@ int kvm_arm_sys_reg_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg
 	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_DEMUX)
 		return demux_c15_get(vcpu, reg->id, uaddr);
 
-	return kvm_sys_reg_get_user(vcpu, reg,
-				    sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
+	return kvm_sys_reg_get_user(vcpu, reg, sys_reg_descs,
+				    num_sys_reg_descs);
 }
 
 int kvm_sys_reg_set_user(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg,
@@ -5634,8 +5636,8 @@ int kvm_arm_sys_reg_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg
 	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_DEMUX)
 		return demux_c15_set(vcpu, reg->id, uaddr);
 
-	return kvm_sys_reg_set_user(vcpu, reg,
-				    sys_reg_descs, ARRAY_SIZE(sys_reg_descs));
+	return kvm_sys_reg_set_user(vcpu, reg, sys_reg_descs,
+				    num_sys_reg_descs);
 }
 
 static unsigned int num_demux_regs(void)
@@ -5723,7 +5725,7 @@ static int walk_sys_regs(struct kvm_vcpu *vcpu, u64 __user *uind)
 	int err;
 
 	i2 = sys_reg_descs;
-	end2 = sys_reg_descs + ARRAY_SIZE(sys_reg_descs);
+	end2 = sys_reg_descs + num_sys_reg_descs;
 
 	while (i2 != end2) {
 		err = walk_one_sys_reg(vcpu, i2++, &uind, &total);
@@ -5772,7 +5774,7 @@ int kvm_vm_ioctl_get_reg_writable_masks(struct kvm *kvm, struct reg_mask_range *
 	if (clear_user(masks, KVM_ARM_FEATURE_ID_RANGE_SIZE * sizeof(__u64)))
 		return -EFAULT;
 
-	for (int i = 0; i < ARRAY_SIZE(sys_reg_descs); i++) {
+	for (int i = 0; i < num_sys_reg_descs; i++) {
 		const struct sys_reg_desc *reg = &sys_reg_descs[i];
 		u32 encoding = reg_to_encoding(reg);
 		u64 val;
@@ -5939,7 +5941,7 @@ int __init kvm_sys_reg_table_init(void)
 	int ret = 0;
 
 	/* Make sure tables are unique and in order. */
-	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), true);
+	valid &= check_sysreg_table(sys_reg_descs, num_sys_reg_descs, true);
 	valid &= check_sysreg_table(cp14_regs, ARRAY_SIZE(cp14_regs), false);
 	valid &= check_sysreg_table(cp14_64_regs, ARRAY_SIZE(cp14_64_regs), false);
 	valid &= check_sysreg_table(cp15_regs, ARRAY_SIZE(cp15_regs), false);
@@ -5958,7 +5960,7 @@ int __init kvm_sys_reg_table_init(void)
 
 	check_feature_map();
 
-	for (i = 0; !ret && i < ARRAY_SIZE(sys_reg_descs); i++)
+	for (i = 0; !ret && i < num_sys_reg_descs; i++)
 		ret = populate_sysreg_config(sys_reg_descs + i, i);
 
 	for (i = 0; !ret && i < ARRAY_SIZE(sys_insn_descs); i++)
-- 
2.53.0


