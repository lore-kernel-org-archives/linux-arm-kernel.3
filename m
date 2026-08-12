Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbc7MwJqZ/oVGq1aCbVY0xikGd/ZXjZ5Sb3UUIYFWbs=; b=dCyR1cfr2996XyJIeMhr2JkA59
	2VmTQu6CWNydQvfram15+rzcOeBRAGxo/B41Vg+fiqoe1Wflh0/1DYJ4Tl2/pjVSzPLyTYYqZr6sh
	FEzvMNi5Eyh14oXA8XoDZt/k2k+i0s4l0z/ub+a86dwEzoOgysaIe3lb70Zgj3Gb6lP+IiDdhImrW
	1pULnJaR+EDa84ie3Gf078/V9SOCyjyuIy6q+T1inlacfawpRt43LLIJKnX+IiaQQaDEAF5sK05NU
	muVzIpODN5WVT/MERdnCEhsPNqcqzcUAXyy9iwNVThMbJ4bQjFM0nDKdX16EP9aJSCGd61Iylu4O5
	bM2kVvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB19-0000000GUTf-09J2;
	Wed, 12 Aug 2026 15:37:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB0q-0000000GU6B-09hN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Aug 2026 15:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mbc7MwJqZ/oVGq1aCbVY0xikGd/ZXjZ5Sb3UUIYFWbs=; b=nD/xUWLjReXfJ8/s0mUie0yzCZ
	v2ybnJcw0R+OzY5lfowjpWvKC8MWXpX4XlpyKLgDz8zm1hgh1Fz8EKGKVrhVv/0AJbprBPB05i/VK
	EHimxZbeyRCczZBIL1Arg6UU238HhjjE62ACDeJ+GFmKS7oOSsZQef3lcNsY4NyP2C/EugNUrixGl
	j0oSZ8F7+c0CPub1HAbiym1ZVwliOCjnLMay9xHzl6RHrplV1xN5CWARiU/uSWdd0sZdEaCagapYd
	Jh7FWhMj7v8Yp6ZVPOA3m/n9zEONI2i2YrLbT/IoUMurhtQcKPZBsOS1dMxLeE3dDi6FDiyxpAePC
	E5Ze+kEQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuB0m-0000000FZAn-3gJv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:37:02 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CE2IqY3595592;
	Wed, 12 Aug 2026 15:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mbc7MwJqZ/oVGq1aC
	bVY0xikGd/ZXjZ5Sb3UUIYFWbs=; b=dYQRnXNYotm7frMv7VWiZW6wNtSiNfnaD
	e0wItjx10TNZVJ4hHnXjZqMt3lf9/PuEcAw8AJ072A1VWz9BkgfrkTt8RT+5gPgc
	vx+ZalvtrsnGTNg5HXdQp5fFQuOQRA33D8iwnpPvSkgmQW+33j/71TAgaPwmCKXi
	vjA+m2ael5Uq1CL/UciQ8EAvIcjIMkpVQevFnY/j37uwZrnVf8c3J8rf4+Fh2lIO
	598fMhb40PZikRgMcpkOp48JggMJY79zAjqc70bE0t2OiHukWnsNBGC1EM0xX1jU
	si0Wco5kAidpC6lLeWgOx2aezNK6Xehfgvz3LPke+ZP1cIIqk6SjA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvp32e1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CFBKqP018660;
	Wed, 12 Aug 2026 15:36:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxf5w6tdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 15:36:43 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CFaeAx29425952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 15:36:40 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DADF32004D;
	Wed, 12 Aug 2026 15:36:39 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A0A92004B;
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
Subject: [PATCH v6 20/33] KVM: s390: gmap: Make CMMA optional
Date: Wed, 12 Aug 2026 17:36:16 +0200
Message-ID: <20260812153631.3376090-21-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812153631.3376090-1-seiden@linux.ibm.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AMtp2X5w c=1 sm=1 tr=0 ts=6a7c930d cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=xXhVJQDoiGTxmNljp-oA:9
X-Proofpoint-GUID: fsAwtltayVLSvOkRwSMx1HbJvAQEEUbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX1UIm/jR5T6w2
 SkLMqY0X8cljbMkJRx+SHGPxMB1svlxS3fAzWF0hFNyPmX0XDyVKBakrBWTvEskHbwNre5DYIze
 cjDzBVErIAOmvWovQYZX0MAz0msDPnTFoED1tpcKfXmcWItn+aNuPHk6VDPHS9QsbCMa+v7aP6u
 5IR3qpp5NDRJkYEFYZ66td4/UOnCr2Bogi+Hw44+/9vuxqeoxF/qQoQXzkYvjTAafwT6OmGuew9
 Su+tT4FkwWUGqcoCrbXIUkKBqoZfLqOYVIr54Fm5rBzIbFKPu/6GG4SBmzwna68QPOOAhHtc3y9
 3ohEtouSwrB/YTAMAJJVWIwOjRvzLo/PKqMTM6YtbDJ9Q9YJylTWf2c44uECzQP9zR/U6ebDc3v
 DR75QfWziYEWusO/1aoW+fUPYNZ6BVaj5imfvJYEAbAdOWziulqdeiNPiQTLwSRe3FkKpaNdICw
 WeyRHTL1jMPI7/IKWcw==
X-Proofpoint-ORIG-GUID: EozK7Pm1xakV4njc29zNzW026GCiJ_VO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyNiBTYWx0ZWRfX2ORiOJgtG1qd
 /2gsj0NmpZpvGAhhfyRHvaCpLD1VOHKYP/Q6LK6ndh/y5q42RDmnp0gcqS0Xq1c6geNqeBK2occ
 GoA1D6WAOayP8WXxRCUxciqPtErAQak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_163701_174995_54650C31 
X-CRM114-Status: GOOD (  14.56  )
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

Guard guest CMMA behind `KVM_S390_MANAGES_S390_GUEST`. This enables
other KVM implementations to use gmap without implementing CMMA.

No functional changes.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/gmap/dat.c  | 2 ++
 arch/s390/kvm/gmap/dat.h  | 2 ++
 arch/s390/kvm/gmap/gmap.c | 2 ++
 arch/s390/kvm/gmap/gmap.h | 4 +++-
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kvm/gmap/dat.c b/arch/s390/kvm/gmap/dat.c
index f4e142995367..43ebafb56ce5 100644
--- a/arch/s390/kvm/gmap/dat.c
+++ b/arch/s390/kvm/gmap/dat.c
@@ -1059,6 +1059,7 @@ int dat_set_prefix_notif_bit(union asce asce, gfn_t gfn)
 	return 0;
 }
 
+#if KVM_S390_MANAGES_S390_GUEST
 /**
  * dat_perform_essa() - Perform ESSA actions on the PGSTE.
  * @asce: The asce to operate on.
@@ -1336,3 +1337,4 @@ int dat_set_cmma_bits(struct kvm_s390_mmu_cache *mc, union asce asce, gfn_t gfn,
 	}
 	return _dat_walk_gfn_range(gfn, gfn + count, asce, &ops, DAT_WALK_IGN_HOLES, &state);
 }
+#endif /* KVM_S390_MANAGES_S390_GUEST */
diff --git a/arch/s390/kvm/gmap/dat.h b/arch/s390/kvm/gmap/dat.h
index 2cc072168810..4f11f9bbd83a 100644
--- a/arch/s390/kvm/gmap/dat.h
+++ b/arch/s390/kvm/gmap/dat.h
@@ -552,12 +552,14 @@ int dat_set_slot(struct kvm_s390_mmu_cache *mc, union asce asce, gfn_t start, gf
 int dat_set_prefix_notif_bit(union asce asce, gfn_t gfn);
 bool dat_test_age_gfn(union asce asce, gfn_t start, gfn_t end);
 
+#if KVM_S390_MANAGES_S390_GUEST
 int dat_perform_essa(union asce asce, gfn_t gfn, int orc, union essa_state *state, bool *dirty);
 long dat_reset_cmma(union asce asce, gfn_t start_gfn);
 int dat_peek_cmma(gfn_t start, union asce asce, unsigned int *count, u8 *values);
 int dat_get_cmma(union asce asce, gfn_t *start, unsigned int *count, u8 *values, atomic64_t *rem);
 int dat_set_cmma_bits(struct kvm_s390_mmu_cache *mc, union asce asce, gfn_t gfn,
 		      unsigned long count, unsigned long mask, const uint8_t *bits);
+#endif /* KVM_S390_MANAGES_S390_GUEST */
 
 int kvm_s390_mmu_cache_topup(struct kvm_s390_mmu_cache *mc);
 
diff --git a/arch/s390/kvm/gmap/gmap.c b/arch/s390/kvm/gmap/gmap.c
index c1b0e2572818..86513f653850 100644
--- a/arch/s390/kvm/gmap/gmap.c
+++ b/arch/s390/kvm/gmap/gmap.c
@@ -1098,6 +1098,7 @@ int gmap_protect_rmap(struct kvm_s390_mmu_cache *mc, struct gmap *sg, gfn_t p_gf
 	return 0;
 }
 
+#if KVM_S390_MANAGES_S390_GUEST
 static long __set_cmma_clean_pte(union pte *ptep, gfn_t gfn, gfn_t next, struct dat_walk *walk)
 {
 	union pgste pgste;
@@ -1140,6 +1141,7 @@ void _gmap_set_cmma_all(struct gmap *gmap, bool dirty)
 						  &gmap->kvm->arch.cmma_dirty_pages);
 	} while (gfn);
 }
+#endif /* KVM_S390_MANAGES_S390_GUEST */
 
 static void gmap_unshadow_level(struct gmap *sg, gfn_t r_gfn, int level)
 {
diff --git a/arch/s390/kvm/gmap/gmap.h b/arch/s390/kvm/gmap/gmap.h
index 328a81c72c7a..6f3bf11d2166 100644
--- a/arch/s390/kvm/gmap/gmap.h
+++ b/arch/s390/kvm/gmap/gmap.h
@@ -110,7 +110,6 @@ int gmap_insert_rmap(struct kvm_s390_mmu_cache *mc, struct gmap *sg, gfn_t p_gfn
 		     gfn_t r_gfn, int level);
 int gmap_protect_rmap(struct kvm_s390_mmu_cache *mc, struct gmap *sg, gfn_t p_gfn, gfn_t r_gfn,
 		      kvm_pfn_t pfn, int level, bool wr);
-void _gmap_set_cmma_all(struct gmap *gmap, bool dirty);
 void _gmap_handle_vsie_unshadow_event(struct gmap *parent, gfn_t gfn);
 struct gmap *gmap_create_shadow(struct kvm_s390_mmu_cache *mc, struct gmap *gmap,
 				union asce asce, int edat_level);
@@ -204,6 +203,8 @@ static inline bool pte_needs_unshadow(union pte oldpte, union pte newpte, union
 	return !newpte.h.p || !newpte.s.pr;
 }
 
+#if KVM_S390_MANAGES_S390_GUEST
+void _gmap_set_cmma_all(struct gmap *gmap, bool dirty);
 static inline void gmap_set_cmma_all_dirty(struct gmap *gmap)
 {
 	_gmap_set_cmma_all(gmap, true);
@@ -213,6 +214,7 @@ static inline void gmap_set_cmma_all_clean(struct gmap *gmap)
 {
 	_gmap_set_cmma_all(gmap, false);
 }
+#endif /* KVM_S390_MANAGES_S390_GUEST */
 
 static inline union pgste _gmap_ptep_xchg(struct gmap *gmap, union pte *ptep, union pte newpte,
 					  union pgste pgste, gfn_t gfn, bool needs_lock)
-- 
2.53.0


