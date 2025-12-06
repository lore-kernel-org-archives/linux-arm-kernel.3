Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D64D3ABC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OfoQfKEgZFjrirIuizJ077/M4GdZrVaenba/hcoG9w=; b=ccDBlfgdrGWxwOoojr8aegEvuk
	bPLSdcDV98aE3OUFIbHHC+qzzPTEEuFPyW4sBkpBQp9aWH8mIc7MBomAsoKiZ+nIrcVaeBCsjcqNQ
	0pkR+/uEeY3XJSIeXCxR6zGW7lMobIk+DZzkMPJxzCsPMfm/FeS64QMz/40afLT2kkjzTcbyIxr18
	BLkLqR9AvPpZ/cEFFsAJqkEJZyAORhOqiO0bua7TgfPM9GTltpw4B8/rWwcVfYvZvaHihcxv7L+dr
	jw/rpBByCNxbrA3kTKiElEH0gUxhHgWj3iEvwESxzjlnlAGC5wvXDWieH0ofi+14s2+bjSZ0e6Vku
	4xSGJlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1t-0000000AIXt-1kqj;
	Sat, 06 Dec 2025 00:20:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0T-0000000AFmm-27Ik
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4OfoQfKEgZFjrirIuizJ077/M4GdZrVaenba/hcoG9w=; b=QqvkRz7EItQWvvEP3l3AAcfWSG
	2uQRAfpmdS+INCqyahYidcphJSLjAs068uzyUesO9fX69bHBouPAaBxzPAeT7n46Ba2oYsTGNPWel
	zOKxqeBQjmuB90taa3YvjwlWasO91dvuB3egJ/yREkz7vWaWXeFcDbuxHPf+otZU1EqUXEzcUfD0J
	tk2CavJtxR0vNxsg9+teEiebVxR0iuzjfgqOtH0wOZw3iw9GCg6XNyidpFZQRkjPOWN6155JzLzE8
	aQBhy2k3cu+W9+8N7Rq6y8cCnFra1rQXOlnadihBN/TMpXccDh5YeF5uQb7n4e7MkYlMapiyrVXqT
	b5iP1hlQ==;
Received: from mail-pj1-f74.google.com ([209.85.216.74])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0O-00000006Sa6-2O20
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:35 +0000
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-34992a92fa0so1248624a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980308; x=1765585108; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4OfoQfKEgZFjrirIuizJ077/M4GdZrVaenba/hcoG9w=;
        b=UdNqR/eLoRDD2hGDGew92kdgRTo7rrpkrSWT2dm77x0uoZJeFVuPZ/KndhLkMU135G
         umyK7OLphH6mUQ/nq49rjKYCROObYwFmw/pO2qrBF2VnQcNmiz6osyiRnJcBXpbGhyeq
         ZHLH1dax5zi/weRyaGbmdCenJ3vCIIWf5NyC5eEd0L5xkeLcEwlGgrYN3FlRy2zHWzBi
         8MZFj9GpwIM6QCB4MnngY/a70WRLX5DYPdhz/GPrOW7TNodJlxXF/PCrOq2dMsFNZgS4
         QoSymd4G+i/R6Dfkh8ZvfwCE7OKBuo4rNODShF3JAPqYDTgTUhmFi3V3BiiDvhozEc1/
         xpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980308; x=1765585108;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OfoQfKEgZFjrirIuizJ077/M4GdZrVaenba/hcoG9w=;
        b=G5Ktk5YL95aKysXBS83RWqY7u3bUnmxwVBeZweah6mnYujyZX3bVwqvGgCobFMSY4w
         X9HzXIsC22Bct9bv/VPMcabNcNZm+QcxKBTRvAogczRFaC+X0HYw/1MNkp94mlXuKgsO
         O0PxbIZ5kxxpgZRmZwXnxUphe96si6AKdWffQ+uZ+m54t2I6jciBhxiCQC7quwFhfTHT
         GXwirXQhdMJ91WN7vxz8QqiAttRZDlslPuNdOuH4PqmWP9T0/yN11JCzQ2Ua1eUqC9DA
         7yl+/pcTSazD/5bobF866ULzzeXRJmJQgUvGYBoWgJZZ5Gk/XilRqo+taubjCRE4gjMi
         tkdw==
X-Gm-Message-State: AOJu0YxjwnYzlCSxkelDzGxkJajj6qMq6Q6chiYtiUN/vekHQyhjXhmr
	q2T2kwrHK9ZypYxhHLSNUM0nOrmw4el18uyDYy4xPM6leA7RNyRd/2bcJBGsFQz/8Fof1vVFkgK
	UgYdeNg==
X-Google-Smtp-Source: AGHT+IHbD7B9YeGH7Tmr7JOXchgVNBxwJK8eblPXJXnk4Y9Y/l53ndcM8z2+XQN6T6Xmq93leyEKMn8mhtA=
X-Received: from pjbcc9.prod.google.com ([2002:a17:90a:f109:b0:340:3e18:b5c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ec7:b0:32e:528c:60ee
 with SMTP id 98e67ed59e1d1-349a25b9531mr659960a91.24.1764980308336; Fri, 05
 Dec 2025 16:18:28 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:07 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-32-seanjc@google.com>
Subject: [PATCH v6 31/44] KVM: nVMX: Disable PMU MSR interception as
 appropriate while running L2
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
X-CRM114-CacheID: sfid-20251206_001832_636575_4292658E 
X-CRM114-Status: GOOD (  13.71  )
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

From: Mingwei Zhang <mizhang@google.com>

Merge KVM's PMU MSR interception bitmaps with those of L1, i.e. merge the
bitmaps of vmcs01 and vmcs12, e.g. so that KVM doesn't interpose on MSR
accesses unnecessarily if L1 exposes a mediated PMU (or equivalent) to L2.

Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
[sean: rewrite changelog and comment, omit MSRs that are always intercepted]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index b56ed2b1ac67..729cc1f05ac8 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -630,6 +630,34 @@ static inline void nested_vmx_set_intercept_for_msr(struct vcpu_vmx *vmx,
 #define nested_vmx_merge_msr_bitmaps_rw(msr) \
 	nested_vmx_merge_msr_bitmaps(msr, MSR_TYPE_RW)
 
+static void nested_vmx_merge_pmu_msr_bitmaps(struct kvm_vcpu *vcpu,
+					     unsigned long *msr_bitmap_l1,
+					     unsigned long *msr_bitmap_l0)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	int i;
+
+	/*
+	 * Skip the merges if the vCPU doesn't have a mediated PMU MSR, i.e. if
+	 * none of the MSRs can possibly be passed through to L1.
+	 */
+	if (!kvm_vcpu_has_mediated_pmu(vcpu))
+		return;
+
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
+		nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_PERFCTR0 + i);
+		nested_vmx_merge_msr_bitmaps_rw(MSR_IA32_PMC0 + i);
+	}
+
+	for (i = 0; i < pmu->nr_arch_fixed_counters; i++)
+		nested_vmx_merge_msr_bitmaps_rw(MSR_CORE_PERF_FIXED_CTR0 + i);
+
+	nested_vmx_merge_msr_bitmaps_rw(MSR_CORE_PERF_GLOBAL_CTRL);
+	nested_vmx_merge_msr_bitmaps_read(MSR_CORE_PERF_GLOBAL_STATUS);
+	nested_vmx_merge_msr_bitmaps_write(MSR_CORE_PERF_GLOBAL_OVF_CTRL);
+}
+
 /*
  * Merge L0's and L1's MSR bitmap, return false to indicate that
  * we do not use the hardware.
@@ -745,6 +773,8 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_PL3_SSP, MSR_TYPE_RW);
 
+	nested_vmx_merge_pmu_msr_bitmaps(vcpu, msr_bitmap_l1, msr_bitmap_l0);
+
 	kvm_vcpu_unmap(vcpu, &map);
 
 	vmx->nested.force_msr_bitmap_recalc = false;
-- 
2.52.0.223.gf5cc29aaa4-goog


