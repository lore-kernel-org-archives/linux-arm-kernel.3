Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA61DC5DF61
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaAObDlEPyOkMHd+7Cm8L/rvLRRZcLQUEVCbbkCwFzI=; b=pu82KXPwVs7QPV8/H2ZtL+MtvC
	sbiSjpXfxmGMsR+L/d9OeGc5Tu136zr57M7lVkRrQoLuqujOp7cOWZnFtTeoZ/XjWmx3XgbefRhik
	tYaiMYm/fOEGfmXQuvF58NZXIZ+7kUyEckCDlIvcmrXnN9THuG5nvyNMNVAkGd6jv5DMyp5QcPJhv
	rzgXEO6qrNkeLnFz0mMkv5jTONvumpUbjLUTpf5NtEN9JLKp4r/e+XayKPxSSRqH1QKqWtJAmuG4p
	YbA7KIJ/d5CpUhWYjc41XXv/GAa0rST7EhHsTRa1u0uQN6LdZvZhDVXqQcCS7SRvuQ3mp9EsGWXfX
	Aa6CRkyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB1E-0000000GUfE-2ZLg;
	Wed, 12 Aug 2026 15:37:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB0s-0000000GU9h-3hYY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Aug 2026 15:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aaAObDlEPyOkMHd+7Cm8L/rvLRRZcLQUEVCbbkCwFzI=; b=EwUuks76RQ43OlsFg278deg3dW
	DHkESaFUy0NKdHbPEFyZLoBF0pcd3Yr0+ZepXapmSnmgGCMy0zaSeyfRYHXC0rlL0RVe2DQly+QfK
	DGIswNvwy4rq4Z7l1PqAhPd3X8XnZEkyMVPlLXS6m9yThJ79ptFUDjH07MAQFQcZb4CSUR3NV09GX
	W7fltRwy6uSJKtB6fNYsr6zSDi+OkwgH9Qg4kcrcG4vL2ZYkBVNHSFT9VuZxaFjCAwPVTjsAoqTWh
	BBGVzvDh81rj+kuALGVYSyUKn2ObZj1wXl3mWXD4UeyKgFyO6omMbgG/fKvrpjP+ouM8NOPbT2k3M
	sXZ+5Fvg==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuB0o-0000000FZBn-3zUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:37:05 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CE1pvC3640582;
	Wed, 12 Aug 2026 15:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aaAObDlEPyOkMHd+7
	Cm8L/rvLRRZcLQUEVCbbkCwFzI=; b=HxChjJBk+k7fAePv/DkhdRciorxxPqNVs
	Fq/JOOl5KtqpPkwPGY6EVq4DBxxZnzJgMxZyIIL34JVvENNvcOvpyFNv1NinuD5N
	wsA4mk0Zsfe3ptTHwt0GoNmnxxCMlycyPEMtiHtvbLnfPrcOwZTbY9a8zUldAg9E
	17odPVqMU73cCmwNjTJExAv+16E+F1+AvqMKxvWzZgrtudGPSSjCaYKkDn+z4lnL
	tvGM3C5wv830MieC1Nchgx4a/92bgJiwn7b6Xa1SYsjkFvxRtHQ4tZPp9/rrdG3P
	IRvnzaddKGEAXthubSA2VnVeFs+HLgOWxLOGv6ArynwiOp10zrDrA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvq9k7ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CFQP1a013797;
	Wed, 12 Aug 2026 15:36:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxg9h6mka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CFaeeJ30474914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 15:36:40 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C7AE20049;
	Wed, 12 Aug 2026 15:36:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E07562004E;
	Wed, 12 Aug 2026 15:36:39 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 15:36:39 +0000 (GMT)
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
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v6 21/33] KVM: s390: gmap: Make prefix handling optional
Date: Wed, 12 Aug 2026 17:36:17 +0200
Message-ID: <20260812153631.3376090-22-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812153631.3376090-1-seiden@linux.ibm.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: TILkdj32NvlETDYS1R3Kh76anHKPAYH1
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a7c930e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=vumRUvCQ2wGzuXjOa00A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX60u34E28Gevj
 XaEGSbC9MtGkUrJiKx52XJFcqH1JW1p/+6yPZW55m2JZkohNGyfAKstJ3hqxdp1hpMcW+DDPSQr
 UZbWl9BtM/P1XTZnQbVNuvbHQbPmM9xl83PwH7rlW7wLaWMRD22o13ElQMR8n28nCmzcKGYawYc
 sMOw6+dWqoGxQodMUTuYI4MzFdXKij9QkvR52YKOxje2bvVWJLSRoSNMyboyWInHUps+cDfF61j
 Hb8Ti+9FjXSMW1Z/H7eIdW89UrzIkGmdptuZefXKxcNB7lwlI1KePjP0jqY62c//8gHc9mWtiLc
 IqqswPHEMaOzRYoSaCIkw74zol1uOVnJgeQccZ0QpFwl5V+JcQn/sWXOTQXRu+l4LVFu6H1Uz92
 RYqNcrEcoT4vc20eYgli/HN15wzIW8G0ppqDlL/6XctkVpkHjjT/7ZgaActxrLwW5sF+yVUYVmk
 qqM41I9xPcSrUFYwbMg==
X-Proofpoint-ORIG-GUID: DlOU6DU5XwB_cNfpOlA2Xr09lDEgC93l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX2Icw4x8d1zYO
 Ep+tonKZi74jupPab3UY229sbY3VK7tRNjZoFVo2FO8WbvzDCIedp8c2bdKLSTR4850pTCPMoxu
 RwaWACs6gPLGQVomeDy0Vx6NCTMZsV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163703_347525_76A69873 
X-CRM114-Status: GOOD (  15.96  )
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

Guard guest prefix handling behind `KVM_S390_MANAGES_S390_GUEST`. This
enables other KVM implementations to use gmap without implementing
prefix handling. The prefix handling is integrated deeply in the gmap
implementation. Therefore, provide safe default implementations for the
guarded functions.

No functional changes.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/gmap/dat.c  |  2 +-
 arch/s390/kvm/gmap/dat.h  |  9 +++++++++
 arch/s390/kvm/gmap/gmap.c | 12 +++++++-----
 arch/s390/kvm/gmap/gmap.h |  9 ++++++++-
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/s390/kvm/gmap/dat.c b/arch/s390/kvm/gmap/dat.c
index 43ebafb56ce5..3038eae1cfcc 100644
--- a/arch/s390/kvm/gmap/dat.c
+++ b/arch/s390/kvm/gmap/dat.c
@@ -1011,6 +1011,7 @@ bool dat_test_age_gfn(union asce asce, gfn_t start, gfn_t end)
 	return _dat_walk_gfn_range(start, end, asce, &test_age_ops, 0, NULL) > 0;
 }
 
+#if KVM_S390_MANAGES_S390_GUEST
 static long dat_set_pn_crste(union crste *crstep, gfn_t gfn, gfn_t next, struct dat_walk *walk)
 {
 	union crste newcrste, oldcrste;
@@ -1059,7 +1060,6 @@ int dat_set_prefix_notif_bit(union asce asce, gfn_t gfn)
 	return 0;
 }
 
-#if KVM_S390_MANAGES_S390_GUEST
 /**
  * dat_perform_essa() - Perform ESSA actions on the PGSTE.
  * @asce: The asce to operate on.
diff --git a/arch/s390/kvm/gmap/dat.h b/arch/s390/kvm/gmap/dat.h
index 4f11f9bbd83a..e452c141b841 100644
--- a/arch/s390/kvm/gmap/dat.h
+++ b/arch/s390/kvm/gmap/dat.h
@@ -549,7 +549,16 @@ void dat_set_ptval(struct page_table *table, struct ptval_param param, unsigned
 
 int dat_set_slot(struct kvm_s390_mmu_cache *mc, union asce asce, gfn_t start, gfn_t end,
 		 u16 type, u16 param);
+
+#if KVM_S390_MANAGES_S390_GUEST
 int dat_set_prefix_notif_bit(union asce asce, gfn_t gfn);
+#else
+static inline int dat_set_prefix_notif_bit(union asce asce, gfn_t gfn)
+{
+	return 0;
+}
+#endif /* KVM_S390_MANAGES_S390_GUEST */
+
 bool dat_test_age_gfn(union asce asce, gfn_t start, gfn_t end);
 
 #if KVM_S390_MANAGES_S390_GUEST
diff --git a/arch/s390/kvm/gmap/gmap.c b/arch/s390/kvm/gmap/gmap.c
index 86513f653850..4968330e9553 100644
--- a/arch/s390/kvm/gmap/gmap.c
+++ b/arch/s390/kvm/gmap/gmap.c
@@ -24,11 +24,6 @@
 #include "s390.h"
 #include "faultin.h"
 
-static inline bool kvm_s390_is_in_sie(struct kvm_vcpu *vcpu)
-{
-	return vcpu->arch.sie_block->prog0c & PROG_IN_SIE;
-}
-
 static int gmap_limit_to_type(gfn_t limit)
 {
 	if (!limit)
@@ -256,6 +251,12 @@ int s390_replace_asce(struct gmap *gmap)
 	return 0;
 }
 
+#if KVM_S390_MANAGES_S390_GUEST
+static inline bool kvm_s390_is_in_sie(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.sie_block->prog0c & PROG_IN_SIE;
+}
+
 bool _gmap_unmap_prefix(struct gmap *gmap, gfn_t gfn, gfn_t end, bool hint)
 {
 	struct kvm *kvm = gmap->kvm;
@@ -278,6 +279,7 @@ bool _gmap_unmap_prefix(struct gmap *gmap, gfn_t gfn, gfn_t end, bool hint)
 	}
 	return true;
 }
+#endif /* KVM_S390_MANAGES_S390_GUEST */
 
 struct clear_young_pte_priv {
 	struct gmap *gmap;
diff --git a/arch/s390/kvm/gmap/gmap.h b/arch/s390/kvm/gmap/gmap.h
index 6f3bf11d2166..8f47f29c89fd 100644
--- a/arch/s390/kvm/gmap/gmap.h
+++ b/arch/s390/kvm/gmap/gmap.h
@@ -85,7 +85,6 @@ struct gmap_cache {
 	for (pos = (head); n = pos ? pos->next : NULL, pos; pos = n)
 
 int s390_replace_asce(struct gmap *gmap);
-bool _gmap_unmap_prefix(struct gmap *gmap, gfn_t gfn, gfn_t end, bool hint);
 bool gmap_age_gfn(struct gmap *gmap, gfn_t start, gfn_t end);
 bool gmap_unmap_gfn_range(struct gmap *gmap, struct kvm_memory_slot *slot, gfn_t start, gfn_t end);
 int gmap_try_fixup_minor(struct gmap *gmap, struct guest_fault *fault);
@@ -163,6 +162,14 @@ static inline void gmap_handle_vsie_unshadow_event(struct gmap *parent, gfn_t gf
 		_gmap_handle_vsie_unshadow_event(parent, gfn);
 }
 
+#if KVM_S390_MANAGES_S390_GUEST
+bool _gmap_unmap_prefix(struct gmap *gmap, gfn_t gfn, gfn_t end, bool hint);
+#else
+static inline bool _gmap_unmap_prefix(struct gmap *gmap, gfn_t gfn, gfn_t end, bool hint)
+{
+	return true;
+}
+#endif /* KVM_S390_MANAGES_S390_GUEST */
 static inline bool gmap_mkold_prefix(struct gmap *gmap, gfn_t gfn, gfn_t end)
 {
 	return _gmap_unmap_prefix(gmap, gfn, end, true);
-- 
2.53.0


