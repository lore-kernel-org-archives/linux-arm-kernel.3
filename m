Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B015E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 01:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d9N3KJHkNXRjOZutdW8pQt5lh1Ed4rA4mypMg2qOMY=; b=3TqriHGmgfQL1M
	jUHZzO0VnD1bMdX1e7F0aVT8BRvbYsJSS7TueBExyDxGdAzFhl2WA+OUQLyjlF+paCGUnHPtpx2bY
	LUpPFNrrOpvvr+U2p9Abx3spGTzfaoOSaTgu6zcUYaRcasjMIsDX9h1l/Shw/0nhRpB8UtWHLKcl4
	xgypg9nwouZochQZutmZcV8IHnaRlLnCRGz4FznRrbfintS40RX72dAHZmCLNY7+FHVG2uh0tV+4Q
	2r4VKEN0HOdLxcKU6/hEoh8kf1SdYKy24FDrysGsFcCHtDBoDVkK5eimYIEbm1f2foHsB9SFxd3aM
	i3KmjVjtgNa/xNzgyNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPuL-0000000HSQv-1v40;
	Sat, 11 Jan 2025 01:03:21 +0000
Received: from mail-pj1-f73.google.com ([209.85.216.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiW-0000000HQPy-1i77
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:09 +0000
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9864e006so7408536a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 16:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556667; x=1737161467; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+d9N3KJHkNXRjOZutdW8pQt5lh1Ed4rA4mypMg2qOMY=;
        b=TR2iwZhiAWn/PH9yeBtsW/n5EKQ8APl6+5qhvYRvz4aE1ylygZ7/6CjS/kyEXnWKfe
         m+7EV939FtV3SBMe7pChImBpKf742Is0zRC7h/RJkm3iwlFMkOFvwN7ymzb2friQThsT
         N5G5IIav4plWELFzMGYFdz4wzadSXEa69I1vq70kXf7ro6cxqFTQTRZFhp2dPmMIHetl
         wFEl6r+wyirgPfwwcyid2/n39SSa+FMzvgy5e8hzdwsUg/n0iDLVINLNuB/rgyH7hR8h
         afxRHBV+Eo9SjAPdlJnvkYgD8D/54YtYkCy2F0stCvfLnUryYLcuJlx7ZRbK4IPHTn8q
         b2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556667; x=1737161467;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+d9N3KJHkNXRjOZutdW8pQt5lh1Ed4rA4mypMg2qOMY=;
        b=fJMg4WRAfY7H2wiBghpq1kkZCKeD7c7nyYQslicPNJfbSLD4hfBTuosmHhEFlmvEG0
         8v9RNypcZdwjXPeJay9Ap9rqtmKm/B1OFdZYOAuU1TqWaCQvml3DOIZcaWKromI+Q+kw
         NL2ULtNSL/I3xABBR2n9dJHDNOZzMEwohcbS7vny+7TzLa8P9vAExT2ctwWsql1PDVeS
         xwap39BIE9jOO8I93BqRrQWur/n/4HyX5jquI7I0FEu/ka00EA0OWCOIuIuBDdQLb6ny
         TzOeZx/11owtcqiZrUjYuaUF07wRn1IEmIg2wRrCtxly4WQjSPRaFMJ2T8jjS/9ChveF
         At2Q==
X-Gm-Message-State: AOJu0YysSgRjB7s6Q+M+jvJ3wLzMPMS1b4fgfjxmGu/VrrATKDIXgaud
	zyazq3OfeL9A1kC7/CT3ENxujuUasUnPvFCmPWHZhZM9B4dgC3/tJ0uiYmn7xJDZcgWptO/ZqS8
	2KQ==
X-Google-Smtp-Source: AGHT+IG4ZDxN55fz763KYhU4ygCt6fNKcRVhx7HviNi6kdOkpJz+b/vIZA/QjwyAghwU09pB3HIzfMoXqiw=
X-Received: from pjbee12.prod.google.com ([2002:a17:90a:fc4c:b0:2e5:5ffc:1c36])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b8f:b0:2ef:2d9f:8e58
 with SMTP id 98e67ed59e1d1-2f5490dbe3fmr16185263a91.34.1736556667051; Fri, 10
 Jan 2025 16:51:07 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:49 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-10-seanjc@google.com>
Subject: [PATCH v2 9/9] KVM: selftests: Add compile-time assertions to guard
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
X-CRM114-CacheID: sfid-20250110_165108_451396_3EBA28D4 
X-CRM114-Status: GOOD (  15.28  )
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
index 373912464fb4..de2dfbb07071 100644
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


