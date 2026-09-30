Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA8DCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPj+gJE+m9/33mikgKRuFOW0wzU7IUN0eD8vymH7cBw=; b=D4IULkVAZZAh0zeCwjxuqekg+W
	s81myuPcG4kazg39pgwwRw87rn9CN7rPCcBiDaB4WymIFnfaks2/FdZXPAojkfR0KoENvKX9xYG3t
	CePbptzXWGxPu+GEEoNJWmTXAUh15pCqmqJTvrrZ6d789tlEfesn47TsLRe2qW0XtFWF/BZoac6oK
	wycsUthsYe7NT3ZwJcuY0l0YvbFA7tqzDfIWxF/J7VVsqXLWEHwpL8lTBTAiL5VH7JhTNEmv9VPl3
	M1ZkQklSZIDDhznvIU6xknPLqHigJT2IsPX/Z1acFFjp9VEjgSmv9wD6FfstBLIDB1o6zoO+ICuPL
	ci2vOolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByDc-00000006rty-3mHg;
	Wed, 30 Sep 2026 17:35:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByD6-00000006r4f-2BP5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aPj+gJE+m9/33mikgKRuFOW0wzU7IUN0eD8vymH7cBw=; b=TGusLtqdbWSVzLF4bGQOnl6SXq
	V8+TVBpmrZ1N1gzlHq5DsXOPb71NM7NowqfJs54+sXgHJpSrHJOxds8fO7b/oe79SZHVoCc5uwEeH
	/e2YwWHAb/SwF0Nx0PlaS0lj7RAbdvOI4B9LXoKLcOax3Wk3KHFsrmww3fwBhconfZRNEUxfXFojN
	ZyYHMDvICWlcqzH3qESmPVzEC5NrXb2ckKtxwnHWp2hceCDzV1ibdRNjRIyOW/Zfv4eZyhbB5rK28
	dWdU8Ht1bEdeBw1rtEu0iACC3nRU6UNpglw3tld8GpfG/o6FKamzSPVGhZorvoqiRjeiClL5u+b8x
	aFGRQYQA==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xByD3-000000049E4-0yB6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:35:15 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE5Yoe1932879;
	Wed, 30 Sep 2026 17:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aPj+gJE+m9/33mikg
	KRuFOW0wzU7IUN0eD8vymH7cBw=; b=QZYiw5SbIIiPbEBNVgON+ItKcgmu22UFu
	unOHVoJVP8em5NdsvE1JUH21ShnUuV8DenYmDSyteNIgNwhu+fhL+0vPQkfuXvUx
	CNBN3AfmOm/v+JAihUqX2CF+00KI+JoA4oHTzqYYLG+2N/pRtU8rVvumc3Q2HkFP
	uPy/DTv7J0b49B4ywzvVXfYOv4jkuyO1ZIBJJ9xZQg+CqJLvnijZeyGGZssGyqA5
	z3jFQosj2zeG1cd6yqmVv+0U84wJkw0QEzE19S0C+xtfAf1r0paLu3deG19L7p9P
	mLpHMsYBZ8WXD7WhNK9P+c0EevH4lwfaMV2Tc9UA9JguQ9yDx6R1g==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx4fedn4g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE36fS3605919;
	Wed, 30 Sep 2026 17:34:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gxsvhqkfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:58 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68UHYp6E49611098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 17:34:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D970420040;
	Wed, 30 Sep 2026 17:34:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C39B2006C;
	Wed, 30 Sep 2026 17:34:50 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 17:34:50 +0000 (GMT)
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
Subject: [PATCH v9 24/24] KVM: s390: arm64: Integrate arm on s390
Date: Wed, 30 Sep 2026 19:34:39 +0200
Message-ID: <20260930173441.66762-25-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930173441.66762-1-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=FYWiV5+6 c=1 sm=1 tr=0 ts=6abd4843 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=G4QZG555kC8JGPZt_3gA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX5hKpgjxlzJl+
 VLfLVtnrNLShq83Ok8F3VqOky3sLljLx/K1WgxljzoBCD8mbHTcjGuR5CXbth10ShiFywK5do7U
 6Yh/HunzBMb2xwl0fZ5tYL9QJBERJko=
X-Proofpoint-ORIG-GUID: 2xonzUBohUb8EphCWPJerylqy2BHOV1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX45l/PSNN7jYb
 +oISkuUSHC6OF4f8vMEhz4yzK73gBywoclwdovNnchOmYes4tXOu1ykPW993Qm+HCl6w3T8Kbsg
 smP8iWvVfqt2aWUVzmFZV6/8f8BeBlbSbzmV+V69qgYwZhw5wYUah8q3Y5CUlmRUllcCDS2wWcW
 E3ogw1QAKlPTk9Ej1Db8wpkFKZDfSTeuMrSF7ccYNtzqMMeCaV5KgXXhGa95KpWWCcR7S+4KQhH
 BhYb2/Zt/9Jie7p6JzAa2fFLwTfaZJWZffeaqn4RnoX91iXrqPj7DRVg40oOp9hZcL0vi8eqOjQ
 MbA2QsE/G1rp46K50dtw6S/gkcKOoEzZao46ECnWp9E6dRnoo+aFMAVRXNzzZR2c7LdtC8ad6QJ
 mN6kc3qZzTKAG0F9cVl+KWnXamLm/UNQSog/fCEn4fjzeSKfDq13y+QWNGgqJ6xELmyczxOsZMi
 ddhtLuZCFtoskh7McLw==
X-Proofpoint-GUID: 8F0KotcFXPpF-oPlCQNfsAEO73-j6t2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_183513_601183_7C7A3CB1 
X-CRM114-Status: GOOD (  23.73  )
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

Add all Kbuild/Makefile configurations to build a second KVM module on
s390 implementing the arm64 KVM API. The new module is named kvm_arm64.

Symbol conflicts with kvm_s390 are prevented by localising all internal
symbols in kvm_arm64 when compiled as built-in (=y): kvm-unnamespaced.o
holds all constituent objects. objcopy --localize-symbols then produces
kvm-namespaced.o which is what kvm-arm64.o resolves to. For =m the
normal module symbol scoping applies and no localisation step is needed.

Because the %-arm64.o pattern targets do not match any kvm-arm64-y entry,
kbuild would derive a wrong KBUILD_MODNAME (e.g. "kvm_main_arm64") and
a wrong KBUILD_MODFILE for the virt/kvm and gmap copies.

Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Co-developed-by: Gautam Gala <ggala@linux.ibm.com>
Signed-off-by: Gautam Gala <ggala@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/kvm/Kconfig        |  25 +++++---
 arch/s390/kvm/Makefile       |   1 +
 arch/s390/kvm/arm64/Makefile | 110 +++++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+), 9 deletions(-)
 create mode 100644 arch/s390/kvm/arm64/Makefile

diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
index 9045ae20fd89..e7b525d04c6d 100644
--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -30,15 +30,22 @@ config KVM
 	select KVM_MMU_LOCKLESS_AGING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
 	help
-	  Support hosting paravirtualized guest machines using the SIE
-	  virtualization capability on the mainframe. This should work
-	  on any 64bit machine.
-
-	  This module provides access to the hardware capabilities through
-	  a character device node named /dev/kvm.
-
-	  To compile this as a module, choose M here: the module
-	  will be called kvm.
+	  Enable support for hosting virtualized, hardware-accelerated
+	  virtual machines via two modules: kvm and kvm_arm64.
+
+	  The kvm module provides access to host hardware-accelerated s390
+	  guests using the Start Interpretive Execution (SIE) instruction via a
+	  character device node named /dev/kvm. This requires a 64-bit machine
+	  (hardware model).
+
+	  The kvm_arm64 module provides access to host hardware-accelerated
+	  arm64 guests using the Start ARM Execution (SAE) instruction via a
+	  character device node named /dev/kvm_arm64. This requires hardware
+	  models that support the Arm execution facility (AEF).
+
+	  To compile this driver as a module, choose M here. The module will be
+	  called kvm for the SIE acceleration and kvm_arm64 for the SAE
+	  acceleration.
 
 	  If unsure, say N.
 
diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index a4e3875b5bdd..380db443a0e9 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -4,3 +4,4 @@
 # Copyright IBM Corp. 2008
 
 obj-$(CONFIG_KVM) += s390/
+obj-$(CONFIG_KVM) += arm64/
diff --git a/arch/s390/kvm/arm64/Makefile b/arch/s390/kvm/arm64/Makefile
new file mode 100644
index 000000000000..3f0fe5c9f0a1
--- /dev/null
+++ b/arch/s390/kvm/arm64/Makefile
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0
+
+KVM := ../../../../virt/kvm
+KVM_DEV_NAME = kvm_arm64
+KVM_DEV_MINOR = MISC_DYNAMIC_MINOR
+include $(srctree)/virt/kvm/Makefile.kvm
+include $(srctree)/arch/$(SRCARCH)/kvm/gmap/Makefile
+include $(src)/Makefile.gen
+
+ccflags-y += -I $(src) -I $(objtree)/$(obj) -I$(srctree)/arch/$(SRCARCH)/kvm/gmap -DKVM_S390_ARM64
+
+kvm-arm64-local := \
+	arm.o \
+	guest.o \
+	handle_exit.o \
+	inject_fault.o \
+	mmio.o \
+	mmu.o \
+	reset.o
+
+kvm-arm64-obj := $(kvm-arm64-local)
+kvm-arm64-obj += $(patsubst %.o,%-arm64.o,$(kvm-y))
+kvm-arm64-obj += $(patsubst %.o,%-arm64.o,$(gmap-y))
+
+targets += $(kvm-arm64-obj)
+
+$(obj)/%-arm64.o: $(src)/%.c FORCE
+	@mkdir -p $(dir $@)
+	$(call if_changed_rule,cc_o_c)
+	$(call cmd,force_checksrc)
+
+# %-arm64.o stems don't match any kvm-arm64-y entry so Kbuild derives wrong
+# KBUILD_MODNAME/KBUILD_MODFILE. Force include a generated header to override.
+KVM_ARM64_MODNAME_H := $(obj)/generated/kvm_arm64_modname.h
+ccflags-y += -include $(KVM_ARM64_MODNAME_H)
+
+$(addprefix $(obj)/,$(kvm-arm64-obj)): $(KVM_ARM64_MODNAME_H)
+$(foreach sfx, i s ll lst, \
+	$(eval $(patsubst %.o,%.$(sfx),$(addprefix $(obj)/,$(kvm-arm64-local))): $(KVM_ARM64_MODNAME_H)))
+
+targets += generated/kvm_arm64_modname.h
+
+define filechk_kvm_arm64_modname
+	echo '#ifndef __KVM_ARM64_MODNAME_H';			\
+	echo '#define __KVM_ARM64_MODNAME_H';			\
+	echo '#undef KBUILD_MODNAME';				\
+	echo '#define KBUILD_MODNAME "$(KVM_DEV_NAME)"';	\
+	echo '#undef __KBUILD_MODNAME';				\
+	echo '#define __KBUILD_MODNAME $(KVM_DEV_NAME)';	\
+	echo '#undef KBUILD_MODFILE';				\
+	echo '#define KBUILD_MODFILE "$(obj)/kvm-arm64"';	\
+	echo '#endif /* __KVM_ARM64_MODNAME_H */'
+endef
+
+$(KVM_ARM64_MODNAME_H): FORCE
+	$(call filechk,kvm_arm64_modname)
+
+# Members are not in real-obj-y. Set part-of-builtin to enable instrumentation.
+$(addprefix $(obj)/,$(kvm-arm64-obj)): private part-of-builtin := y
+
+ifeq ($(CONFIG_KVM),m)
+
+kvm-arm64-y = $(kvm-arm64-obj)
+
+else ifeq ($(CONFIG_KVM),y)
+
+prereq-o-cmd = $(foreach o, $(filter %.o, $^), $(dir $(o)).$(notdir $(o)).cmd)
+cmd_gen_symversions_o = \
+	grep --no-filename "^\#SYMVER" $(prereq-o-cmd) >> $(dot-target).cmd || true
+
+cmd_ld_o_o = $(cmd_ld)
+define rule_ld_o_o
+	$(call cmd_and_savecmd,ld)
+	$(call cmd,gen_symversions_o)
+endef
+
+LDFLAGS_kvm-unnamespaced.o := -r
+$(obj)/kvm-unnamespaced.o: $(addprefix $(obj)/,$(kvm-arm64-obj)) FORCE
+	$(call if_changed_rule,ld_o_o)
+
+quiet_cmd_nm_filter = NMFLTR  $@
+	cmd_nm_filter = $(NM) --defined-only --format=just-symbols $< | sort -u > $@
+
+$(obj)/kvm_symbol_list: $(obj)/kvm-unnamespaced.o FORCE
+	$(call if_changed,nm_filter)
+
+# cmd_oc_o_o carries -DKBUILD_MODFILE so generate_builtin_ranges.awk
+# can attribute kvm-namespaced.o to kvm_arm64 via its .cmd file.
+cmd_oc_o_o = $(cmd_objcopy) -DKBUILD_MODFILE='"$(obj)/kvm-arm64"'
+define rule_oc_o_o
+	$(call cmd,objcopy)
+	@printf '%s\n' 'savedcmd_$@ := $(call make-cmd,oc_o_o)' > $(dot-target).cmd
+	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_symversions_o)
+endef
+
+OBJCOPYFLAGS_kvm-namespaced.o := -O $(LD_BFD) --localize-symbols=$(obj)/kvm_symbol_list
+$(obj)/kvm-namespaced.o: $(obj)/kvm-unnamespaced.o $(obj)/kvm_symbol_list FORCE
+	$(call if_changed_rule,oc_o_o)
+
+kvm-arm64-y = kvm-namespaced.o
+
+targets += kvm-unnamespaced.o kvm_symbol_list kvm-namespaced.o
+
+endif
+
+clean-files += kvm-unnamespaced.o kvm_symbol_list kvm-namespaced.o
+
+obj-$(CONFIG_KVM) += kvm-arm64.o
+
-- 
2.53.0


