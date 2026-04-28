Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52403FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpkwpjmEOahBklIHgJpYekLcfvR2iJqFKR0bzut9rQw=; b=fQugL5rxTEoidQQ7YApOg3xFSL
	QNzlz5F0j4SpjXxbVkvLEpMB5bwicthnAKMT2iK7x8C3JEfPFe32AI/MGAXgDZXB77YzQ6srCbwey
	NBlN9O+KU1RnVe+cVjkhXaIpwVb8zpHm/k3pHAvpeyuHTUAaP3VvOll2G+PImPngoniG0eMAXtBIf
	l3e91BDqI/YtPZmt74GnMz162MoWuHRhvM/d4ocN3Q11bJzmqbpYXplVVUxF5/AQDLKN1cAuBvKGy
	bP8oEWLxHC49f3clKVbQOX01LGy0KCznTescmJiZ/AN1tMiX7sXwMOzpFHmsjNIwlDcjBmQJUBEUe
	R6ddvDQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwj-00000001pX0-18GD;
	Tue, 28 Apr 2026 16:06:01 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkwX-00000001pP6-0iFK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:05:57 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SF8tiT2551013;
	Tue, 28 Apr 2026 16:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=gpkwpjmEOahBklIHg
	JpYekLcfvR2iJqFKR0bzut9rQw=; b=F/M6la3R/hXhveTQ86C8sAqPhTBtDTFKo
	ZoADY2jz8MwcEbwo6cN5nJjRIWCNbJ2weWufJw8zgasAdVyTUHLxSRjpYS+QoNvq
	aSSP6JhOf6hv+kcdXaIuM7N85bCQs9QQlueWilLtaCRbXoBEHyiTWahcjg2z/pmI
	/N9s44NFMlql9KET06juN8Quy6tGjSjtjJRjqNBqnfkf31IqktEAalEIwAERl843
	ONWIFwQ2wCs2X3docf2mF0eRUobhuVLnBEoAPB5n0qdGDK/XbxDeBu9ZTJLD7Tmx
	+0ihzZUi8wBGn5cRjAX299JBennvD+5j6aydZ2XmJXKkEwAa+kR7Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4drm1dw95a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:05:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63SFroLh032226;
	Tue, 28 Apr 2026 16:05:36 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ds9ehabb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:05:36 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63SG5WW046137738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Apr 2026 16:05:32 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DE6E20040;
	Tue, 28 Apr 2026 16:05:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35B0720043;
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
Subject: [RFC PATCH v2 13/28] KVM: arm64: Extract & share ipa size shift calculation
Date: Tue, 28 Apr 2026 18:05:10 +0200
Message-ID: <20260428160527.1378085-14-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428160527.1378085-1-seiden@linux.ibm.com>
References: <20260428160527.1378085-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ky7bbT1OsSx3d4qG0f90nGSzDqtgJmm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1MSBTYWx0ZWRfX/pc1ACEFtLlK
 c+EXYAz+Xfqutreo4dQC7nQaRaNqJnDHdZCy8GbbK6iwbP1njAevZ8LzooFQMAgM5hr8YKGgocZ
 GzdKT4GXdnKCmrf+pPTVKHmUbhOjY1qqE861j5aTecqbiWw1YJ1uP4s51D0zdBFsJyg97U7U5cN
 D9WwotzLhFPe1SaCz8KMiGDn9Y/wL0vfBtMVowUeo9fhTjxkuBnUs4wD0wYYvYtLStRVATBLVYP
 gepkLHpWBhH3sESTVZTm7uLLB1Fdjue20Vst7F0DiICx1tjGwPnP29KroUFfmoImnEQZn5B+5xo
 qPqYumpIS4X9CYNnLu7tD9FMSYh0P3nQ+lwdrhmbU1qwWt9SfBo1f+qwOybvzAQvy0q72zv1TVh
 zKY1QcKGcHrfSKtXkjtiuDXZNsbY8qv3Sq1ui3OTaG7PQbOo9PTnWq+8gNjA5aKtKcw7il8HmcE
 7Dxb4dGDocjS9ayofnQ==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=69f0dad1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=MB2ALdkwiJlipvWvu_wA:9
X-Proofpoint-GUID: ky7bbT1OsSx3d4qG0f90nGSzDqtgJmm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_090549_317880_07407581 
X-CRM114-Status: GOOD (  19.08  )
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

Extract the ipa shift calculation from kvm_init_ipa_range into its own
function kvm_vm_type_ipa_size_shift to be shared across architectures.

User space passes a type parameter to the VM creation ioctl, indicating
the physical size of the VM. Therefore extract the ipa shift calculation
from kvm_init_ipa_range into its own function kvm_vm_type_ipa_size_shift,
so all implementers of arm64 KVM can make use of it for VM creation.

Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/kvm/mmu.c         | 19 ++++++-------------
 include/kvm/arm64/kvm_host.h |  1 +
 virt/kvm/arm64/arm.c         | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e19ff77b3cd5..bec52291bc0c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -874,27 +874,20 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
 
 static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 {
-	u32 kvm_ipa_limit = get_kvm_ipa_limit();
 	u64 mmfr0, mmfr1;
 	u32 phys_shift;
+	int r;
 
 	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
 		return -EINVAL;
 
-	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
 	if (is_protected_kvm_enabled()) {
-		phys_shift = kvm_ipa_limit;
-	} else if (phys_shift) {
-		if (phys_shift > kvm_ipa_limit ||
-		    phys_shift < ARM64_MIN_PARANGE_BITS)
-			return -EINVAL;
+		phys_shift = get_kvm_ipa_limit();
 	} else {
-		phys_shift = KVM_PHYS_SHIFT;
-		if (phys_shift > kvm_ipa_limit) {
-			pr_warn_once("%s using unsupported default IPA limit, upgrade your VMM\n",
-				     current->comm);
-			return -EINVAL;
-		}
+		r = kvm_vm_type_ipa_size_shift(type);
+		if (r < 0)
+			return r;
+		phys_shift = r;
 	}
 
 	mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
diff --git a/include/kvm/arm64/kvm_host.h b/include/kvm/arm64/kvm_host.h
index d36ebea4d60f..8bf399508757 100644
--- a/include/kvm/arm64/kvm_host.h
+++ b/include/kvm/arm64/kvm_host.h
@@ -33,6 +33,7 @@ int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 				 const struct kvm_vcpu_init *init);
 bool kvm_vcpu_init_changed(struct kvm_vcpu *vcpu,
 			   const struct kvm_vcpu_init *init);
+int kvm_vm_type_ipa_size_shift(unsigned long type);
 
 /* MMIO helpers */
 void kvm_mmio_write_buf(void *buf, unsigned int len, unsigned long data);
diff --git a/virt/kvm/arm64/arm.c b/virt/kvm/arm64/arm.c
index b47adef65e5f..0bbfbe63e558 100644
--- a/virt/kvm/arm64/arm.c
+++ b/virt/kvm/arm64/arm.c
@@ -52,3 +52,24 @@ bool kvm_vcpu_init_changed(struct kvm_vcpu *vcpu,
 	return !bitmap_equal(vcpu->kvm->arch.vcpu_features, &features,
 			     KVM_VCPU_MAX_FEATURES);
 }
+
+int kvm_vm_type_ipa_size_shift(unsigned long type)
+{
+	int phys_shift;
+
+	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
+	if (phys_shift) {
+		if (phys_shift > get_kvm_ipa_limit() ||
+		    phys_shift < ARM64_MIN_PARANGE_BITS)
+			return -EINVAL;
+	} else {
+		phys_shift = KVM_PHYS_SHIFT;
+		if (phys_shift > get_kvm_ipa_limit()) {
+			pr_warn_once("%s using unsupported default IPA limit, upgrade your VMM\n",
+				     current->comm);
+			return -EINVAL;
+		}
+	}
+
+	return phys_shift;
+}
-- 
2.51.0


