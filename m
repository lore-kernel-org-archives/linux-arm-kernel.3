Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CA3D3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6M+TUCunGgZRp0HQ274P454YeO/pMlL0Ud7LaETHp4=; b=N3Uy7ttvTsvd+s4ZfmjPZPrK00
	ZRRuNqQsI/H7Ype+sjz5hm6Et1EIvtIQYL+agjVGivd018YU4qeQKM1qfpAOztwvB0R9NCF2pcP4d
	QdXCb+imBVsn8OVGMjoAPhs+jB2MbdgbDUDFnSVF6ZLbHw3RYqoIyb8hCgul6ygiBmQ9jcYcEm+1w
	EpLEqFlzUSniPlio+YhzLdBmoD5ophQ6kgFBPA147bJ4BEvUZaiJv4amU2RrRLDh6ZxD/Mvmka/c8
	4Cf5ZUtHwzf2sXvKi4zJ1VZmifQE97Nit681pqvljjrt2fFs1y3w4awaDpBTAPZAiZYJt9BMFLUMc
	eszeLmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg25-0000000AJ06-48Ka;
	Sat, 06 Dec 2025 00:20:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0e-0000000AG5p-1KCB
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M6M+TUCunGgZRp0HQ274P454YeO/pMlL0Ud7LaETHp4=; b=qO0Uo37VB3n0ewIFjtMjDq2e8B
	kDHWj5Fl/srTpDY7gTmNaY0nB8FcRSJkMpHfjxvsqVPynSbOkd62F5FSbHyr+9hKl4XNU7LIX5Gte
	jIAezlswyLkRJdU29VxDkFQIYEJmLvfKXyfGsBHMzxU9ze9C6xq4+oK97z7rOQeeNWBZRwrG4PKfO
	7DIx47hcjeAnp6CDsyOGUZKKhieLBNTWOduRGfv91IL6bO73JPouP7iB8XyaDcsqqJ4H7YB7h8YfO
	8DZvDjvMYes2iYFuCj6tZgj+ivdBYENcKdNo5koj04UwW/2g3HTQ+TojFQVMxtM/hDLM09p4fmZ2a
	ozVmxOZw==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0W-00000006SfO-2QUr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:45 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34740cc80d5so5032135a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980317; x=1765585117; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M6M+TUCunGgZRp0HQ274P454YeO/pMlL0Ud7LaETHp4=;
        b=ZBSe/5LCREdvCDKRIN8svXlY6Q9g3KodFylx9klFvH8jrFczacEhUAJt0F/BnDCKXU
         +rBS1WZEcjqbqvyzJKdf5vAnWxxOWlKmki/RvIoHscg4Dn0UjD/ntjDUY2XxCVmPI25b
         c3dYvbRPzgKon9aumIyCmm8fhAFF2AGYv/D3d6EJEL0VThv/Qu6ff7OndWHNh9j30aDn
         3kdRVTv4GL2ZECsUKa3Oxs40Wnn+t8U7tr2gB8JoaKspSNaXLIS5mHP2EbTdN9BbSeeI
         pNmIFGf80BzpD4u+XiwR62TgpmJ0vjv2SVS6/AYK6Tj993pKW4CedxNn+MWJt3AhWuxA
         qEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980317; x=1765585117;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M6M+TUCunGgZRp0HQ274P454YeO/pMlL0Ud7LaETHp4=;
        b=vSwyKSAeXQebLh65u416OBhE5lXQrr64w1FmE7n758Zlny9vQQLn7iWcWX2rAJe35i
         krpHWOe7+H0DNXYdfX81QMtUBWIn+0Q/oetDVhoK9HLeKVxiMhGoY01vyCAgn/5c1PxX
         BjDscxUqcO6jRPM4KciuDJrrpxVKXzLrKsn1Xf0LutVWRQ3LlT377AVxgXycEnlIMm++
         Jjz8dFl20c7TcjxEKTS5quyW+NOaV32pflys73ZEn+ZltODZktB0XTFRFZ+uutyViXU7
         WUE0m6t0VT+nQzsj032n1bVX1LRD3Z3Ae8/Qu9+W1fpgUkBSoo/02cj+xsyXXT/52xxL
         ZrRQ==
X-Gm-Message-State: AOJu0YxjnL2uK13BCJNwsrLIEjZ4bSBbEDgeqE4UFJMkoHYsJhTUVkMb
	ARunsR23WIeKFkCsZy44eGAR7Gih8V5t0evQgxdhx0ZCNK5xBSJ0z3uuOYIXjXyRT9i4cBVsoF+
	DwjS2fA==
X-Google-Smtp-Source: AGHT+IH4rM0hrWDLcj1m7KmQfI0LQhMNTOrUf9WMiZFUwgaE9DsfO2YaBs29AIBYl4bKM4D6uGtnUb5M7G0=
X-Received: from pjbsb13.prod.google.com ([2002:a17:90b:50cd:b0:340:c0e9:24b6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c89:b0:343:6611:f21
 with SMTP id 98e67ed59e1d1-349a24e3b08mr610435a91.1.1764980317071; Fri, 05
 Dec 2025 16:18:37 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:11 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-36-seanjc@google.com>
Subject: [PATCH v6 35/44] KVM: VMX: Drop intermediate "guest" field from msr_autostore
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_001840_672405_1C2EF2AE 
X-CRM114-Status: GOOD (  14.20  )
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

Drop the intermediate "guest" field from vcpu_vmx.msr_autostore as the
value saved on VM-Exit isn't guaranteed to be the guest's value, it's
purely whatever is in hardware at the time of VM-Exit.  E.g. KVM's only
use of the store list at the momemnt is to snapshot TSC at VM-Exit, and
the value saved is always the raw TSC even if TSC-offseting and/or
TSC-scaling is enabled for the guest.

And unlike msr_autoload, there is no need differentiate between "on-entry"
and "on-exit".

No functional change intended.

Cc: Jim Mattson <jmattson@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 10 +++++-----
 arch/x86/kvm/vmx/vmx.c    |  2 +-
 arch/x86/kvm/vmx/vmx.h    |  4 +---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 729cc1f05ac8..486789dac515 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -1076,11 +1076,11 @@ static bool nested_vmx_get_vmexit_msr_value(struct kvm_vcpu *vcpu,
 	 * VM-exit in L0, use the more accurate value.
 	 */
 	if (msr_index == MSR_IA32_TSC) {
-		int i = vmx_find_loadstore_msr_slot(&vmx->msr_autostore.guest,
+		int i = vmx_find_loadstore_msr_slot(&vmx->msr_autostore,
 						    MSR_IA32_TSC);
 
 		if (i >= 0) {
-			u64 val = vmx->msr_autostore.guest.val[i].value;
+			u64 val = vmx->msr_autostore.val[i].value;
 
 			*data = kvm_read_l1_tsc(vcpu, val);
 			return true;
@@ -1167,7 +1167,7 @@ static void prepare_vmx_msr_autostore_list(struct kvm_vcpu *vcpu,
 					   u32 msr_index)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	struct vmx_msrs *autostore = &vmx->msr_autostore.guest;
+	struct vmx_msrs *autostore = &vmx->msr_autostore;
 	bool in_vmcs12_store_list;
 	int msr_autostore_slot;
 	bool in_autostore_list;
@@ -2366,7 +2366,7 @@ static void prepare_vmcs02_constant_state(struct vcpu_vmx *vmx)
 	 * addresses are constant (for vmcs02), the counts can change based
 	 * on L2's behavior, e.g. switching to/from long mode.
 	 */
-	vmcs_write64(VM_EXIT_MSR_STORE_ADDR, __pa(vmx->msr_autostore.guest.val));
+	vmcs_write64(VM_EXIT_MSR_STORE_ADDR, __pa(vmx->msr_autostore.val));
 	vmcs_write64(VM_EXIT_MSR_LOAD_ADDR, __pa(vmx->msr_autoload.host.val));
 	vmcs_write64(VM_ENTRY_MSR_LOAD_ADDR, __pa(vmx->msr_autoload.guest.val));
 
@@ -2704,7 +2704,7 @@ static void prepare_vmcs02_rare(struct vcpu_vmx *vmx, struct vmcs12 *vmcs12)
 	 */
 	prepare_vmx_msr_autostore_list(&vmx->vcpu, MSR_IA32_TSC);
 
-	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.guest.nr);
+	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
 	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
 	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 62ba2a2b9e98..23c92c41fd83 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6567,7 +6567,7 @@ void dump_vmcs(struct kvm_vcpu *vcpu)
 	if (vmcs_read32(VM_ENTRY_MSR_LOAD_COUNT) > 0)
 		vmx_dump_msrs("guest autoload", &vmx->msr_autoload.guest);
 	if (vmcs_read32(VM_EXIT_MSR_STORE_COUNT) > 0)
-		vmx_dump_msrs("guest autostore", &vmx->msr_autostore.guest);
+		vmx_dump_msrs("autostore", &vmx->msr_autostore);
 
 	if (vmentry_ctl & VM_ENTRY_LOAD_CET_STATE)
 		pr_err("S_CET = 0x%016lx, SSP = 0x%016lx, SSP TABLE = 0x%016lx\n",
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index d7a96c84371f..4ce653d729ca 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -245,9 +245,7 @@ struct vcpu_vmx {
 		struct vmx_msrs host;
 	} msr_autoload;
 
-	struct msr_autostore {
-		struct vmx_msrs guest;
-	} msr_autostore;
+	struct vmx_msrs msr_autostore;
 
 	struct {
 		int vm86_active;
-- 
2.52.0.223.gf5cc29aaa4-goog


