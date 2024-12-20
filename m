Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8813E77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 02:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dg8fmjMM2o4ZdUzcCM3IsD7JuuynFC9AcsVyNRsKeBU=; b=OeWSbI4goKexL+
	vmjsWOcHKe43jCyWyYFIghrxt3ic7KYySYdIn9oXUBDvonKvqb6iHhQ3eCFoSyE8WUSpQYgsKcwju
	aRvLlhyTgVBA9ALaA3IErfDV/NymqB3fDbR1gMpO6c59oHGHXGDtAEKkEoQlRazFQu5VFDdPUFxTC
	ra2W7DxzJqg0EQXgyRowd8hZFlSgzjtr9f79mSpMtGDnqGf1cwQlLhXoQWdx1aWdmpUkk4G+Uy1NA
	QHGdsK6QW0orR6+t4wNVywj7Nvt6AFWE6+zkoPD0sYIaJA/R6h2DAHQL/QPNpZSUbx8s3zE7Qu32I
	ETGynHsXJaic5smTq+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOTAi-00000003kxV-2SSP;
	Fri, 20 Dec 2024 02:55:24 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz9-00000003d4i-3ycS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:25 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7eaac1e95ffso910932a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 17:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658763; x=1735263563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg8fmjMM2o4ZdUzcCM3IsD7JuuynFC9AcsVyNRsKeBU=;
        b=VQW/HJbM8Mz3bqURjdEqVzHJuOW1beKe8KMUVYYgBUpoEbekOp/Ttp7z2fryLQc+LG
         4in6vEvTHVW2VYA4cfIbEhCY3fV4/GZUb3Gj68yUr0dWYkJKo2IMitVgjAnVie9Hkb/K
         Y0m/87mwKYYfISMAzBHEaBa9eneVxh7oVFXOhPOft93KBKvk/amOgS95AMV8sa4jPRmU
         W0JLxmP0mCnsLsAR1ju51a68sh2No9hzfFw/NlfACNiFK3FDQk5LSWIiTuB00iayF+Uy
         0dcGj3kZen7vV57o7Ls0brJ2o3QEcfgTUC8mO86uvgxOzre2kNGseopFJFfBSEOTddpj
         sf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658763; x=1735263563;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dg8fmjMM2o4ZdUzcCM3IsD7JuuynFC9AcsVyNRsKeBU=;
        b=YWh0irqHlMrU8ZWt4QrfY9FRtQdC5tnD/4Ww9oCX12+i2d+dSY/wh23PEg64wHOfVd
         ko3yzct26uokrTT58qa7JWipuGHe8S7HXHQzJUdmm3YrE53pERqQ0FV1B3Dr/Op/HYKF
         0Okq77UvpleQeRx2EysSiddnJ/IHF/V2UKa8XCf5DpU3n6j12cobbnlw4Nvq03bO4/no
         0HILYiU4YjlL/9+JG/LmKUUz/54M/B7UcICcIYfXvHYIkHlSO6Eqmj1GX/Mww24qijnf
         ll048RtESZI4p7Xo0YDgxdO8GOVZTtK6CKG78KMaaMj/HXGSgK2/O+EWGO4hS1cvMV+k
         AIJA==
X-Gm-Message-State: AOJu0YwNB6aA/QRdfx/dCmyPMKdj98rx2kxAkx8LeOiW6Cm3MMv9+E22
	yTtPM5tmapWT1bwcfsoxTXoO6z4tK9tALDeZ73Oxaa4GOv2IiI3uNbeh/qGx8p7IfNQ7kK9zbDv
	U9A==
X-Google-Smtp-Source: AGHT+IE6EA1Soh2HbsBhs8mA4Cxp5/kcHpg0QYYkszskXT1G6lUfvmxNE+q8q9njljny5qS/JMm3vKiIjQ4=
X-Received: from pgbbw29.prod.google.com ([2002:a05:6a02:49d:b0:801:d768:c174])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6681:b0:1e0:c6c0:1e1f
 with SMTP id adf61e73a8af0-1e5e07f8a98mr2122068637.36.1734658762701; Thu, 19
 Dec 2024 17:39:22 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:06 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-9-seanjc@google.com>
Subject: [PATCH 8/8] KVM: selftests: Add compile-time assertions to guard
 against stats typos
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173924_028198_97AA23E4 
X-CRM114-Status: GOOD (  14.61  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add compile-time assertions to the main binary stats accessor to verify
the stat is a known KVM stat of the appropriate scope, and "add" all
known stats for all architectures.

To build the set of known stats, define enums for each stat, with a
completely arbitrary magic value to specify the scope of the stat.  With
the assert in place, misuse of stat (or usage of a new stat) generates
error like so:

  In file included from include/x86/kvm_util_arch.h:8,
                   from include/kvm_util.h:23,
                   from x86/dirty_log_page_splitting_test.c:16:
   x86/dirty_log_page_splitting_test.c: In function =E2=80=98get_page_stats=
=E2=80=99:
  include/kvm_util.h:563:42: error: =E2=80=98VM_STAT_pages_4m=E2=80=99 unde=
clared
    (first use in this function); did you mean =E2=80=98VM_STAT_pages_2m=E2=
=80=99?
    563 | #define vm_get_stat(vm, stat) __get_stat(VM, &(vm)->stats, stat)
        |                                          ^~

  ...
  x86/dirty_log_page_splitting_test.c:45:27: note: in expansion of macro =
=E2=80=98vm_get_stat=E2=80=99
     45 |         stats->pages_2m =3D vm_get_stat(vm, pages_4m);
        |                           ^~~~~~~~~~~

Using pre-defined lists of stats doesn't completely eliminate human error,
e.g. it's obviously possible to make a typo when adding a state.  And
while there is also a non-zero cost to maintaining the set of stats,
adding stats in KVM is relatively uncommon, and removing stats is extremely
rare.  On the flip side, providing a list of known stats should make it
easier to use stats in test, at which point detecting goofs at compile-time
will also be more valuable.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/include/arm64/kvm_util_arch.h         |  12 ++
 .../testing/selftests/kvm/include/kvm_util.h  |  24 +++-
 .../selftests/kvm/include/kvm_util_types.h    |   6 +
 .../kvm/include/riscv/kvm_util_arch.h         |  14 +++
 .../kvm/include/s390/kvm_util_arch.h          | 113 ++++++++++++++++++
 .../selftests/kvm/include/x86/kvm_util_arch.h |  52 ++++++++
 6 files changed, 218 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h b/to=
ols/testing/selftests/kvm/include/arm64/kvm_util_arch.h
index e43a57d99b56..12097262f585 100644
--- a/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/arm64/kvm_util_arch.h
@@ -2,6 +2,18 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
=20
+#include "kvm_util_types.h"
+
 struct kvm_vm_arch {};
=20
+enum kvm_arm64_stats {
+	VCPU_STAT(hvc_exit_stat),
+	VCPU_STAT(wfe_exit_stat),
+	VCPU_STAT(wfi_exit_stat),
+	VCPU_STAT(mmio_exit_user),
+	VCPU_STAT(mmio_exit_kernel),
+	VCPU_STAT(signal_exits),
+	VCPU_STAT(exits),
+};
+
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing=
/selftests/kvm/include/kvm_util.h
index e0d23873158e..f4f0e27cea27 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -535,19 +535,37 @@ void read_stat_data(int stats_fd, struct kvm_stats_he=
ader *header,
 		    struct kvm_stats_desc *desc, uint64_t *data,
 		    size_t max_elements);
=20
+enum kvm_common_stats {
+	VM_STAT(remote_tlb_flush),
+	VM_STAT(remote_tlb_flush_requests),
+
+	VCPU_STAT(halt_successfull_poll),
+	VCPU_STAT(halt_attempted_poll),
+	VCPU_STAT(halt_poll_invalid),
+	VCPU_STAT(halt_wakeup),
+	VCPU_STAT(halt_poll_success_ns),
+	VCPU_STAT(halt_poll_fail_ns),
+	VCPU_STAT(halt_wait_ns),
+	VCPU_STAT(halt_poll_success_hist),
+	VCPU_STAT(halt_poll_fail_hist),
+	VCPU_STAT(halt_wait_hist),
+	VCPU_STAT(blocking),
+};
+
 void kvm_get_stat(struct kvm_binary_stats *stats, const char *name,
 		  uint64_t *data, size_t max_elements);
=20
-#define __get_stat(stats, stat)							\
+#define __get_stat(type, stats, stat)						\
 ({										\
 	uint64_t data;								\
 										\
+	kvm_static_assert(type##_STAT_##stat =3D=3D type##_STAT_MAGIC_NUMBER);	\
 	kvm_get_stat(stats, #stat, &data, 1);					\
 	data;									\
 })
=20
-#define vm_get_stat(vm, stat) __get_stat(&(vm)->stats, stat)
-#define vcpu_get_stat(vcpu, stat) __get_stat(&(vcpu)->stats, stat)
+#define vm_get_stat(vm, stat) __get_stat(VM, &(vm)->stats, stat)
+#define vcpu_get_stat(vcpu, stat) __get_stat(VCPU, &(vcpu)->stats, stat)
=20
 void vm_create_irqchip(struct kvm_vm *vm);
=20
diff --git a/tools/testing/selftests/kvm/include/kvm_util_types.h b/tools/t=
esting/selftests/kvm/include/kvm_util_types.h
index ec787b97cf18..20e6717a0d24 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_types.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_types.h
@@ -17,4 +17,10 @@
 typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address *=
/
 typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
=20
+#define VM_STAT_MAGIC_NUMBER   1
+#define VM_STAT(stat)  VM_STAT_##stat =3D VM_STAT_MAGIC_NUMBER
+
+#define VCPU_STAT_MAGIC_NUMBER   2
+#define VCPU_STAT(stat) VCPU_STAT_##stat =3D VCPU_STAT_MAGIC_NUMBER
+
 #endif /* SELFTEST_KVM_UTIL_TYPES_H */
diff --git a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h b/to=
ols/testing/selftests/kvm/include/riscv/kvm_util_arch.h
index e43a57d99b56..ea53d6aeb693 100644
--- a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
@@ -2,6 +2,20 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
=20
+#include "kvm_util_types.h"
+
 struct kvm_vm_arch {};
=20
+enum kvm_riscv_stats {
+	VCPU_STAT(ecall_exit_stat),
+	VCPU_STAT(wfi_exit_stat),
+	VCPU_STAT(wrs_exit_stat),
+	VCPU_STAT(mmio_exit_user),
+	VCPU_STAT(mmio_exit_kernel),
+	VCPU_STAT(csr_exit_user),
+	VCPU_STAT(csr_exit_kernel),
+	VCPU_STAT(signal_exits),
+	VCPU_STAT(exits),
+};
+
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h b/too=
ls/testing/selftests/kvm/include/s390/kvm_util_arch.h
index e43a57d99b56..64d4de333e09 100644
--- a/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/s390/kvm_util_arch.h
@@ -2,6 +2,119 @@
 #ifndef SELFTEST_KVM_UTIL_ARCH_H
 #define SELFTEST_KVM_UTIL_ARCH_H
=20
+#include "kvm_util_types.h"
+
 struct kvm_vm_arch {};
=20
+enum kvm_s390_stats {
+	VM_STAT(inject_io),
+	VM_STAT(inject_float_mchk),
+	VM_STAT(inject_pfault_done),
+	VM_STAT(inject_service_signal),
+	VM_STAT(inject_virtio),
+	VM_STAT(aen_forward),
+	VM_STAT(gmap_shadow_reuse),
+	VM_STAT(gmap_shadow_create),
+	VM_STAT(gmap_shadow_r1_entry),
+	VM_STAT(gmap_shadow_r2_entry),
+	VM_STAT(gmap_shadow_r3_entry),
+	VM_STAT(gmap_shadow_sg_entry),
+	VM_STAT(gmap_shadow_pg_entry),
+
+	VCPU_STAT(exit_userspace),
+	VCPU_STAT(exit_null),
+	VCPU_STAT(exit_external_request),
+	VCPU_STAT(exit_io_request),
+	VCPU_STAT(exit_external_interrupt),
+	VCPU_STAT(exit_stop_request),
+	VCPU_STAT(exit_validity),
+	VCPU_STAT(exit_instruction),
+	VCPU_STAT(exit_pei),
+	VCPU_STAT(halt_no_poll_steal),
+	VCPU_STAT(instruction_lctl),
+	VCPU_STAT(instruction_lctlg),
+	VCPU_STAT(instruction_stctl),
+	VCPU_STAT(instruction_stctg),
+	VCPU_STAT(exit_program_interruption),
+	VCPU_STAT(exit_instr_and_program),
+	VCPU_STAT(exit_operation_exception),
+	VCPU_STAT(deliver_ckc),
+	VCPU_STAT(deliver_cputm),
+	VCPU_STAT(deliver_external_call),
+	VCPU_STAT(deliver_emergency_signal),
+	VCPU_STAT(deliver_service_signal),
+	VCPU_STAT(deliver_virtio),
+	VCPU_STAT(deliver_stop_signal),
+	VCPU_STAT(deliver_prefix_signal),
+	VCPU_STAT(deliver_restart_signal),
+	VCPU_STAT(deliver_program),
+	VCPU_STAT(deliver_io),
+	VCPU_STAT(deliver_machine_check),
+	VCPU_STAT(exit_wait_state),
+	VCPU_STAT(inject_ckc),
+	VCPU_STAT(inject_cputm),
+	VCPU_STAT(inject_external_call),
+	VCPU_STAT(inject_emergency_signal),
+	VCPU_STAT(inject_mchk),
+	VCPU_STAT(inject_pfault_init),
+	VCPU_STAT(inject_program),
+	VCPU_STAT(inject_restart),
+	VCPU_STAT(inject_set_prefix),
+	VCPU_STAT(inject_stop_signal),
+	VCPU_STAT(instruction_epsw),
+	VCPU_STAT(instruction_gs),
+	VCPU_STAT(instruction_io_other),
+	VCPU_STAT(instruction_lpsw),
+	VCPU_STAT(instruction_lpswe),
+	VCPU_STAT(instruction_lpswey),
+	VCPU_STAT(instruction_pfmf),
+	VCPU_STAT(instruction_ptff),
+	VCPU_STAT(instruction_sck),
+	VCPU_STAT(instruction_sckpf),
+	VCPU_STAT(instruction_stidp),
+	VCPU_STAT(instruction_spx),
+	VCPU_STAT(instruction_stpx),
+	VCPU_STAT(instruction_stap),
+	VCPU_STAT(instruction_iske),
+	VCPU_STAT(instruction_ri),
+	VCPU_STAT(instruction_rrbe),
+	VCPU_STAT(instruction_sske),
+	VCPU_STAT(instruction_ipte_interlock),
+	VCPU_STAT(instruction_stsi),
+	VCPU_STAT(instruction_stfl),
+	VCPU_STAT(instruction_tb),
+	VCPU_STAT(instruction_tpi),
+	VCPU_STAT(instruction_tprot),
+	VCPU_STAT(instruction_tsch),
+	VCPU_STAT(instruction_sie),
+	VCPU_STAT(instruction_essa),
+	VCPU_STAT(instruction_sthyi),
+	VCPU_STAT(instruction_sigp_sense),
+	VCPU_STAT(instruction_sigp_sense_running),
+	VCPU_STAT(instruction_sigp_external_call),
+	VCPU_STAT(instruction_sigp_emergency),
+	VCPU_STAT(instruction_sigp_cond_emergency),
+	VCPU_STAT(instruction_sigp_start),
+	VCPU_STAT(instruction_sigp_stop),
+	VCPU_STAT(instruction_sigp_stop_store_status),
+	VCPU_STAT(instruction_sigp_store_status),
+	VCPU_STAT(instruction_sigp_store_adtl_status),
+	VCPU_STAT(instruction_sigp_arch),
+	VCPU_STAT(instruction_sigp_prefix),
+	VCPU_STAT(instruction_sigp_restart),
+	VCPU_STAT(instruction_sigp_init_cpu_reset),
+	VCPU_STAT(instruction_sigp_cpu_reset),
+	VCPU_STAT(instruction_sigp_unknown),
+	VCPU_STAT(instruction_diagnose_10),
+	VCPU_STAT(instruction_diagnose_44),
+	VCPU_STAT(instruction_diagnose_9c),
+	VCPU_STAT(diag_9c_ignored),
+	VCPU_STAT(diag_9c_forward),
+	VCPU_STAT(instruction_diagnose_258),
+	VCPU_STAT(instruction_diagnose_308),
+	VCPU_STAT(instruction_diagnose_500),
+	VCPU_STAT(instruction_diagnose_other),
+	VCPU_STAT(pfault_sync),
+};
+
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h b/tool=
s/testing/selftests/kvm/include/x86/kvm_util_arch.h
index 972bb1c4ab4c..f9c4aedddbd0 100644
--- a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
@@ -48,4 +48,56 @@ do {											\
 	}										\
 } while (0)
=20
+enum kvm_x86_stats {
+	VM_STAT(mmu_shadow_zapped),
+	VM_STAT(mmu_pte_write),
+	VM_STAT(mmu_pde_zapped),
+	VM_STAT(mmu_flooded),
+	VM_STAT(mmu_recycled),
+	VM_STAT(mmu_cache_miss),
+	VM_STAT(mmu_unsync),
+	VM_STAT(pages_4k),
+	VM_STAT(pages_2m),
+	VM_STAT(pages_1g),
+	VM_STAT(pages),
+	VM_STAT(nx_lpage_splits),
+	VM_STAT(max_mmu_page_hash_collisions),
+	VM_STAT(max_mmu_rmap_size),
+
+	VCPU_STAT(pf_taken),
+	VCPU_STAT(pf_fixed),
+	VCPU_STAT(pf_emulate),
+	VCPU_STAT(pf_spurious),
+	VCPU_STAT(pf_fast),
+	VCPU_STAT(pf_mmio_spte_created),
+	VCPU_STAT(pf_guest),
+	VCPU_STAT(tlb_flush),
+	VCPU_STAT(invlpg),
+	VCPU_STAT(exits),
+	VCPU_STAT(io_exits),
+	VCPU_STAT(mmio_exits),
+	VCPU_STAT(signal_exits),
+	VCPU_STAT(irq_window_exits),
+	VCPU_STAT(nmi_window_exits),
+	VCPU_STAT(l1d_flush),
+	VCPU_STAT(halt_exits),
+	VCPU_STAT(request_irq_exits),
+	VCPU_STAT(irq_exits),
+	VCPU_STAT(host_state_reload),
+	VCPU_STAT(fpu_reload),
+	VCPU_STAT(insn_emulation),
+	VCPU_STAT(insn_emulation_fail),
+	VCPU_STAT(hypercalls),
+	VCPU_STAT(irq_injections),
+	VCPU_STAT(nmi_injections),
+	VCPU_STAT(req_event),
+	VCPU_STAT(nested_run),
+	VCPU_STAT(directed_yield_attempted),
+	VCPU_STAT(directed_yield_successful),
+	VCPU_STAT(preemption_reported),
+	VCPU_STAT(preemption_other),
+	VCPU_STAT(guest_mode),
+	VCPU_STAT(notify_window_exits),
+};
+
 #endif  // SELFTEST_KVM_UTIL_ARCH_H
--=20
2.47.1.613.gc27f4b7a9f-goog


