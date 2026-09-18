Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7445C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ultWEJhp6ZIJJNlF92dkS5UfNARIdvGV4toPmQvSUaE=; b=mAR6ewGhTJgDXMSrb+nehK6fuE
	4KHloUFM7Bz2qYpQh3D2gcKmgg2x/IoWvEL6JOf3KzIYfUKT996sHd7JtgCMM3UlJygliRY8nEWLn
	s1DWLltReK1IaPTO2Ap3boN2TyzTnWxCd5EKBTmmN99gJwIss75+vJEU+4PzQ5HogJ/3IciFQNvDM
	dI3HN6FpC9fdeGGwUJUKNAxQ8RYXHVC/0HrT/a9isFWXEIfeM3SqkbW9SUJR929uAp0u2qPOWk2MC
	+dRFEYU6k3aRHWyxhiVMGYlcyNii06O52GaGqxMkC/9gq53TZ4anFgaqI1K/k6/n1vtFUOBxDw5uC
	ZgyGlCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ygu-0000000EX1L-1Rug;
	Fri, 18 Sep 2026 13:31:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ygl-0000000EWuB-2U4w
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 13:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ultWEJhp6ZIJJNlF92dkS5UfNARIdvGV4toPmQvSUaE=; b=GE9yKrIFWNWlrraN8pXxgvexTb
	wc3Zlz96QH+izLmq1IzN19o7dUYwb07sipviZMGy9w3O7DglVrzAjrYhyaMLpfNJIjNja6Hm08jx5
	YeiHT72e//ZIHyIyiPErNDpVadvY3PJwnL8z0ESiogmYXd8y//vmzKZWDGBTTY3cduA4VD8XFTlYi
	IL53GCaeHYv210jlqI0EGGVPnC8CYGJTS0wcrfD7RHIizsgPYCkKpOf9SJvqPmzW8Mm8CmcWxyBCm
	wGDl4koTU3pCw13yFkZ83sMjz6wri1WZmaHwIvOzDdHNOq6Y0HR8NN0wrYHYeYc6Zl7YeK2ihlau+
	5dkE4VUg==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Ygg-0000000A8X4-3D9k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:31:38 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA1aql803423;
	Fri, 18 Sep 2026 13:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ultWEJhp6ZIJJNlF9
	2dkS5UfNARIdvGV4toPmQvSUaE=; b=VGA5hymlz2YlxdTIlYmAndnysWU1Y1bKi
	uzUB1HyJxNDeCQ1tFv5VmwK26WtQrb7EH1JNAue6LKj/iTpSaGWDYlSPkOhW5x9q
	qXvEu0FsY8/E0YJPqUef80iwRXfVtd9YD+LWna2kY/tn9p60V7WLOWz1JBedRZOl
	7MO8h/5XgoXUDAsYMZ3fDVYPlh1IkXZRGTt2iLKyp8h2/GhALdIc8PtaV0mjxjWf
	ynRrE1d0cjb7TOYKZKEl1jPYAdSjOvfJcQ46gT99UOtjQobvXtEEDOo6dicvKFki
	vlR0EKIU71VLK8aMtCfR1CT2pc2KjQHgMJ+W84E4FlIp2LZPSfJ9w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gmv5j813p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDNqsf722670;
	Fri, 18 Sep 2026 13:31:17 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gr5fjqgvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 13:31:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68IDVAgS51642852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Sep 2026 13:31:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 588D920040;
	Fri, 18 Sep 2026 13:31:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A3B02004D;
	Fri, 18 Sep 2026 13:31:10 +0000 (GMT)
Received: from tuxmaker.lnxne.boe (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Sep 2026 13:31:09 +0000 (GMT)
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
Subject: [PATCH v8 06/29] KVM: Move export symbol check macros to Makefile.kvm
Date: Fri, 18 Sep 2026 15:30:43 +0200
Message-ID: <20260918133107.1042730-7-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918133107.1042730-1-seiden@linux.ibm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX4ECV8w/7ItR+
 5Qv/vl2FdwTOaswJMK+Jy5EOVXfioy81ZhsW5RJTIEgkLCX3zoKk31bMjLJ7kVj7/ecyYuU4q71
 iwhi3Xxsv+bTPXsKImSofiJGwY7cfNpYPVMm2hblWB9xdo4wSM6TdQAZa6lakMoug1EA2AvdDTQ
 z+ofNsphWTo+pWGQbgtQY8waxW0wTeiD//sVOvYJuVjivIqKPS/QfWnTv08jcTnEbLj4vSyr5nI
 pk0VmyhYV2DZVYsaoRP9aztNZMdyERSSMelaAaeH2AauSYnobNxlnU9FxqB8jG3vJ8QUF7JI68O
 v99MCR7IZp1F3tngJgUX1wAWHXdoptY2Newv4QBwUnC18jLxpIcQdGS9dusTGGCIKiwV1RE/T0q
 0a7ZHA5YF7eD2wO2lyqaHWI/LDqcn8srCQdGcSaIs7oPA6Vm6/p2vS6lriM9ITMccmTpUgc0mVC
 PiHc1TOSfj+QWaNvTgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX5W2Vxqiy8jJs
 0BZFP2ztqyaKCBQxsuJ1S2BbC0tYFV32WmoPUbzBtsTcta2n8Al/LJDCOq2++HQo1a2z0ZzOa2N
 R7jtVJEMmXG7EOcHnkbTf4rOTbkQk9w=
X-Authority-Analysis: v=2.4 cv=Zsx4uN7G c=1 sm=1 tr=0 ts=6aad3d26 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=xeFIZLMA4NwSUji8HBwA:9
X-Proofpoint-ORIG-GUID: JiX0ns0nG5pKmZYWp0e1gsi3vLiY40wB
X-Proofpoint-GUID: L9ZS1jqqmo0O9XiSGMaRkjSrgjZgmqyC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_143135_388520_910DD656 
X-CRM114-Status: GOOD (  15.73  )
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

The EXPORT_SYMBOL_GPL/EXPORT_SYMBOL enforcement logic in
arch/x86/kvm/Makefile is useful for any KVM architecture wanting to
restrict the exported symbols. Move the check macros to
virt/kvm/Makefile.kvm so they can be shared.

Arch Makefiles only need to set kvm_exports_allowed to a space-separated
list of symbols that are permitted and then call kvm_check_exports for
each symbol type they want to enforce.

No functional change.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/x86/kvm/Makefile | 49 +++++++++----------------------------------
 virt/kvm/Makefile.kvm | 33 +++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 39 deletions(-)

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index c6bf463f5032..1bfd630c0767 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -54,43 +54,14 @@ clean-files += kvm-asm-offsets.h
 # Only a handful of exports intended for other modules (VFIO, KVMGT) should
 # use EXPORT_SYMBOL_GPL, and EXPORT_SYMBOL should never be used.
 ifdef CONFIG_KVM_X86
-# Search recursively for whole words and print line numbers.  Filter out the
-# allowed set of exports, i.e. those that are intended for external usage.
-exports_grep_trailer := --include='*.[ch]' -nrw $(srctree)/virt/kvm $(srctree)/arch/x86/kvm | \
-			grep -v -e kvm_page_track_register_notifier \
-				-e kvm_page_track_unregister_notifier \
-				-e kvm_write_track_add_gfn \
-				-e kvm_write_track_remove_gfn \
-				-e kvm_file_to_kvm_fn
-
-# Force grep to emit a goofy group separator that can in turn be replaced with
-# the above newline macro (newlines in Make are a nightmare).  Note, grep only
-# prints the group separator when N lines of context are requested via -C,
-# a.k.a. --NUM.  Simply request zero lines.  Print the separator only after
-# filtering out expected exports to avoid extra newlines in the error message.
-define get_kvm_exports
-$(shell grep "$(1)" -C0 $(exports_grep_trailer) | grep "$(1)" -C0 --group-separator="!SEP!")
-endef
-
-define check_kvm_exports
-nr_kvm_exports := $(shell grep "$(1)" $(exports_grep_trailer) | wc -l)
-
-ifneq (0,$$(nr_kvm_exports))
-$$(error ERROR ***\
-$$(newline)found $$(nr_kvm_exports) unwanted occurrences of $(1):\
-$$(newline)  $(subst !SEP!,$$(newline) ,$(call get_kvm_exports,$(1)))\
-$$(newline)in directories:\
-$$(newline)  $(srctree)/arch/x86/kvm\
-$$(newline)  $(srctree)/virt/kvm\
-$$(newline)Use EXPORT_SYMBOL_FOR_KVM_INTERNAL, not $(1))
-endif # nr_kvm_exports != 0
-undefine nr_kvm_exports
-endef # check_kvm_exports
-
-$(eval $(call check_kvm_exports,EXPORT_SYMBOL_GPL))
-$(eval $(call check_kvm_exports,EXPORT_SYMBOL))
-
-undefine check_kvm_exports
-undefine get_kvm_exports
-undefine exports_grep_trailer
+kvm_exports_allowed := kvm_page_track_register_notifier \
+		       kvm_page_track_unregister_notifier \
+		       kvm_write_track_add_gfn \
+		       kvm_write_track_remove_gfn \
+		       kvm_file_to_kvm_fn
+
+$(eval $(call kvm_check_exports,EXPORT_SYMBOL_GPL))
+$(eval $(call kvm_check_exports,EXPORT_SYMBOL))
+
+undefine kvm_exports_allowed
 endif # CONFIG_KVM_X86
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index d047d4cf58c9..dd40544b8ecb 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -13,3 +13,36 @@ kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o
 kvm-$(CONFIG_HAVE_KVM_PFNCACHE) += $(KVM)/pfncache.o
 kvm-$(CONFIG_KVM_GUEST_MEMFD) += $(KVM)/guest_memfd.o
+
+# Force grep to emit a goofy group separator that can in turn be replaced with
+# the above newline macro (newlines in Make are a nightmare).  Note, grep only
+# prints the group separator when N lines of context are requested via -C,
+# a.k.a. --NUM.  Simply request zero lines.  Print the separator only after
+# filtering out expected exports to avoid extra newlines in the error message.
+define __kvm_get_exports
+$(shell grep "$(1)" -C0 --include='*.[ch]' -nrw \
+	$(srctree)/virt/kvm $(srctree)/arch/$(SRCARCH)/kvm \
+	$(addprefix | grep -v -e ,$(kvm_exports_allowed)) \
+	| grep "$(1)" -C0 --group-separator="!SEP!")
+endef
+
+
+KVM_CHECK_EXPORT_DIRS ?= $(srctree)/virt/kvm $(srctree)/arch/$(ARCH)/kvm
+
+# Fail the build if any unwanted $(1) usage is found outside kvm_exports_allowed.
+define kvm_check_exports
+kvm_nr_exports := $(shell grep "$(1)" --include='*.[ch]' -nrw \
+	$(KVM_CHECK_EXPORT_DIRS) \
+	$(addprefix | grep -v -e ,$(kvm_exports_allowed)) | wc -l)
+
+ifneq (0,$$(kvm_nr_exports))
+$$(error ERROR ***\
+$$(newline)found $$(kvm_nr_exports) unwanted occurrences of $(1):\
+$$(newline)  $(subst !SEP!,$$(newline) ,$(call __kvm_get_exports,$(1)))\
+$$(newline)in directories:\
+$$(newline)  $(KVM_CHECK_EXPORT_DIRS)\
+$$(newline)If this is a valid exception add it to kvm_exports_allowed or\
+$$(newline)use EXPORT_SYMBOL_FOR_KVM_INTERNAL, not $(1))
+endif # kvm_nr_exports != 0
+undefine kvm_nr_exports
+endef # kvm_check_exports
-- 
2.53.0


