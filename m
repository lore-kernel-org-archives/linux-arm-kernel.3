Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3D4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0DZj43Z67Ng4V8dccak1Ym5loj+qmLakJ+LCALP9kg=; b=uKnMESCRc7BYH+U46HNVorbKOg
	60tIRuWn3OxNl1kAA/KFXikPgQpInZIsiUMnHXi8HqyjR7cSJQ/kZ5c9K8M+6j0TjU4T8NTS+mqOw
	4n8BTgZlIphxizIV+V/0akFhhcVYvdrmW96Oa2XAMDHCSSLEWDSbFBSKsLE0PQBGDqZf+Dzo4zDIR
	bXhNnGNi2AFAIK3JQEJFrTGGQX3AB+E6OqlQxc4HQ+T4WCh+8nhV6rl3f01s+JJpoAN5LOoGgcilX
	EpNp1UuqQciIPIA6lSBDdRpg4UL8REFj+Td2AKZefJJSt6jI+cbJu3vxph3mMkpFy+sjeFD6BaR76
	8brIy8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1v-00000004ncp-37Zu;
	Thu, 30 Oct 2025 20:13:56 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzJ-00000004kXQ-27yx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:11:15 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33dadf7c5beso1398968a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855068; x=1762459868; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=g0DZj43Z67Ng4V8dccak1Ym5loj+qmLakJ+LCALP9kg=;
        b=nip8grCKemtUhz5jL3YSTKznAGx6ZWp4v9kpXLt9d8tGgxugyLyPwq4ZjELYDk70Bc
         WMnYx4nCeplnayJ5uh1aDphNlwiQ1NeZzz6W83Y5jJzPbSJ9ZAtpP0cDTIbXIkNzO51x
         wYVxjw9wjwz+RGPPodUYsGdj/36bMk2PNuLTbpTQMnOQo/e31mFQGYCit1yYw/bT3Alo
         lZsONqkod5pMGt4dcWwkXOW4O/4d8GayulHwhD7BkrwxT04T0zbPX+0Y+DKivmhSxheB
         m4jAxcG77tf9sMrgx8GSPUd5orAUyKYeOVKxlVowyRvmqQDmCKj+2M1Fh9gwotI8EPe/
         tZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855068; x=1762459868;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0DZj43Z67Ng4V8dccak1Ym5loj+qmLakJ+LCALP9kg=;
        b=FYFHmeNgIuc89bYwAbmM7ZMtzSxKDjcQNbJ6F/B/9E0EEsWL7QsoPBTLmCwyWluygW
         TOn1S2yXhNux52sf3D2WyBZ4x47POw6o2UDN+A51YbO1aerE3sEw+kExWfsj5AKxAJ5R
         okVy/fAPa2VV6W3wIv2pLDbGMhTCtZjjxHb26s72zUXj2YMbxcC0ICr/pw15fQTipON4
         +B5Ft3QJ1iX5bvGk0AJUHeqzexq0w4SHjWAYQCmu0x6MNNEG/dHBoKijGsEh6olfuCkz
         xNVvdH97jjdvWz8jvX93/9Gxag5snp3IRrMx9SmsbFbVHfGYIhBnuMKWDSQCWTEB88+r
         xNuA==
X-Gm-Message-State: AOJu0Yyrok4H4vi1RJzO0f+jqQwHZpataCAn/X4Jaz6ExHRZrUIve16I
	q77UO3p+CGyG9u2du1D4KW4mJGDXUGAGIYIysHSz0ibBxqPLkGfksCjpscS1XWDat67xdh1/zOX
	JpSXO5g==
X-Google-Smtp-Source: AGHT+IHFPEZaejYJvfIle9tc1ZXyDJfCQsJh2BXbTmXv+Mn/KvdDlX4yHPVD4nKwk0+goI6XnN1tnx5wN9U=
X-Received: from pjbgp21.prod.google.com ([2002:a17:90a:df15:b0:33b:51fe:1a7b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c12:b0:32e:7340:a7f7
 with SMTP id 98e67ed59e1d1-34082fc8525mr1267842a91.2.1761855067459; Thu, 30
 Oct 2025 13:11:07 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:51 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-29-seanjc@google.com>
Subject: [PATCH v4 28/28] KVM: TDX: Fix list_add corruption during vcpu_load()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_131113_888496_3724942B 
X-CRM114-Status: GOOD (  16.93  )
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

From: Yan Zhao <yan.y.zhao@intel.com>

During vCPU creation, a vCPU may be destroyed immediately after
kvm_arch_vcpu_create() (e.g., due to vCPU id confiliction). However, the
vcpu_load() inside kvm_arch_vcpu_create() may have associate the vCPU to
pCPU via "list_add(&tdx->cpu_list, &per_cpu(associated_tdvcpus, cpu))"
before invoking tdx_vcpu_free().

Though there's no need to invoke tdh_vp_flush() on the vCPU, failing to
dissociate the vCPU from pCPU (i.e., "list_del(&to_tdx(vcpu)->cpu_list)")
will cause list corruption of the per-pCPU list associated_tdvcpus.

Then, a later list_add() during vcpu_load() would detect list corruption
and print calltrace as shown below.

Dissociate a vCPU from its associated pCPU in tdx_vcpu_free() for the vCPUs
destroyed immediately after creation which must be in
VCPU_TD_STATE_UNINITIALIZED state.

kernel BUG at lib/list_debug.c:29!
Oops: invalid opcode: 0000 [#2] SMP NOPTI
RIP: 0010:__list_add_valid_or_report+0x82/0xd0

Call Trace:
 <TASK>
 tdx_vcpu_load+0xa8/0x120
 vt_vcpu_load+0x25/0x30
 kvm_arch_vcpu_load+0x81/0x300
 vcpu_load+0x55/0x90
 kvm_arch_vcpu_create+0x24f/0x330
 kvm_vm_ioctl_create_vcpu+0x1b1/0x53
 kvm_vm_ioctl+0xc2/0xa60
  __x64_sys_ioctl+0x9a/0xf0
 x64_sys_call+0x10ee/0x20d0
 do_syscall_64+0xc3/0x470
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 43 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 762f2896547f..db7ac7955ca1 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -843,19 +843,52 @@ void tdx_vcpu_put(struct kvm_vcpu *vcpu)
 	tdx_prepare_switch_to_host(vcpu);
 }
 
+/*
+ * Life cycles for a TD and a vCPU:
+ * 1. KVM_CREATE_VM ioctl.
+ *    TD state is TD_STATE_UNINITIALIZED.
+ *    hkid is not assigned at this stage.
+ * 2. KVM_TDX_INIT_VM ioctl.
+ *    TD transitions to TD_STATE_INITIALIZED.
+ *    hkid is assigned after this stage.
+ * 3. KVM_CREATE_VCPU ioctl. (only when TD is TD_STATE_INITIALIZED).
+ *    3.1 tdx_vcpu_create() transitions vCPU state to VCPU_TD_STATE_UNINITIALIZED.
+ *    3.2 vcpu_load() and vcpu_put() in kvm_arch_vcpu_create().
+ *    3.3 (conditional) if any error encountered after kvm_arch_vcpu_create()
+ *        kvm_arch_vcpu_destroy() --> tdx_vcpu_free().
+ * 4. KVM_TDX_INIT_VCPU ioctl.
+ *    tdx_vcpu_init() transitions vCPU state to VCPU_TD_STATE_INITIALIZED.
+ *    vCPU control structures are allocated at this stage.
+ * 5. kvm_destroy_vm().
+ *    5.1 tdx_mmu_release_hkid(): (1) tdh_vp_flush(), disassociates all vCPUs.
+ *                                (2) puts hkid to !assigned state.
+ *    5.2 kvm_destroy_vcpus() --> tdx_vcpu_free():
+ *        transitions vCPU to VCPU_TD_STATE_UNINITIALIZED state.
+ *    5.3 tdx_vm_destroy()
+ *        transitions TD to TD_STATE_UNINITIALIZED state.
+ *
+ * tdx_vcpu_free() can be invoked only at 3.3 or 5.2.
+ * - If at 3.3, hkid is still assigned, but the vCPU must be in
+ *   VCPU_TD_STATE_UNINITIALIZED state.
+ * - if at 5.2, hkid must be !assigned and all vCPUs must be in
+ *   VCPU_TD_STATE_INITIALIZED state and have been dissociated.
+ */
 void tdx_vcpu_free(struct kvm_vcpu *vcpu)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 	int i;
 
+	if (vcpu->cpu != -1) {
+		KVM_BUG_ON(tdx->state == VCPU_TD_STATE_INITIALIZED, vcpu->kvm);
+		tdx_flush_vp_on_cpu(vcpu);
+		return;
+	}
+
 	/*
 	 * It is not possible to reclaim pages while hkid is assigned. It might
-	 * be assigned if:
-	 * 1. the TD VM is being destroyed but freeing hkid failed, in which
-	 * case the pages are leaked
-	 * 2. TD VCPU creation failed and this on the error path, in which case
-	 * there is nothing to do anyway
+	 * be assigned if the TD VM is being destroyed but freeing hkid failed,
+	 * in which case the pages are leaked.
 	 */
 	if (is_hkid_assigned(kvm_tdx))
 		return;
-- 
2.51.1.930.gacf6e81ea2-goog


