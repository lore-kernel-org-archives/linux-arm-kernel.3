Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAEFEE01F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 23:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykxeCu2rd9E7NdPIA3m898BLFxasNeM9KWtJ/FC5NbY=; b=CTxJUxWZQDGlIUvdmklzIMxLT6
	7B11JwxEDlVJjoW2axVuP4o9fay+VDoTn928TQm766Sb5szzYEBgSuQN0HiMSJz/ZHhe1EbmNp3Cd
	CCHo56NAPB3qj93yp3hFO+YJDWQ7KQUA4yXG4k9gtUNPnVb0hkxnCjSuiLOk+JsM3CIvqpng2x2FN
	krupXEt03PQZVxE89/A4X2svzWgltK4fwheqG55xvs3WbOE5Soa5UowcH4D40g5wt43N6kZlnGK6x
	1QvXqHtbK3T59mdKyRi3HnpLR2BGN5ddH2GJoBTiBZP5HitQp+c9YWRj0pcnGib5/63ZqzG6iA8do
	a0nFbyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vailM-00000005PXc-347P;
	Tue, 30 Dec 2025 23:04:24 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijV-00000005N9E-3e4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:31 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so23431737a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Dec 2025 15:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135749; x=1767740549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ykxeCu2rd9E7NdPIA3m898BLFxasNeM9KWtJ/FC5NbY=;
        b=MA8sYW3ZERQ4eU1czifRj1Or8TEVM70yXn+Z1Nk8B11nw1iiNkerNoktUn8qhjUH4w
         bnplvt6g2KfekEit2JoL1SVfnJN7vo+8jodVGu/lSPkLe7AOMZwYzTGEVHc+GCwDFGjK
         J6Jh/Ep/FxZNh+JqBPvGc62MXUNWT0i41vbYeAs4CUswrW/hWllNJxVWIqH38BFmU+JL
         CZasWIbHPM/InP+bFASr+Bg+vd5T7GnwZyOV7ovHIh6XM9zcFIWx7nc/ryF4zadNv7VF
         /ebrlepJmpMzKaEOaAKVyu9bgNug2pErBdzXi9lKdOyLqX7n31WvastvhW8KUX07CJtz
         T7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135749; x=1767740549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykxeCu2rd9E7NdPIA3m898BLFxasNeM9KWtJ/FC5NbY=;
        b=Wdhpz+eSK5NtuDSsngG+4ZD1FpxuPCH6qVFjE8WruEZXyyLltfWpWxb82iCznKaDmz
         Mw0aEYlHQRwAPdNRXIfWNDMr+nm9FQ+Nre70g/lnRmhoU1F8NqDjRFsvTVTssA0sJisz
         3LiqqKI7fNEU6OYMpRWHOGzdcXEkHeZpaIIu/8NokQSZUPf/o7EN1JF/QerH3z5ZQtw2
         9Pi2BZ+uvkiLZ9nkhNHi2UFWpywTVsNkC5G42ap3znL7wymTG921xZMoin1qbHygAI99
         w/NzDu06EhGS3Z459raqBXxBoYQqAqcTkObL0PVp9SR8ikZri24QtkuTQO+5FqwRTFEA
         x/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Xzbd/EZTDNQf28r26ZUDMOMqP1YcZDjQ10sIVAsWtkdvjB+nDc788j6DG2ub2wSYwUkg8Mn3mWmI1NNpo3ft@lists.infradead.org
X-Gm-Message-State: AOJu0YwC81feGVBy4IClYtg+qz/Ys/oGNo1tozt7Qvp9skyRauaMlNB3
	tA1JbPFqAUPbuCPZiVv/kORERbvuoXIHoZ1izILwioZvFEIK1cRbVM3dT8iXvKBcAmYxFXZIILs
	1f1ZIIg==
X-Google-Smtp-Source: AGHT+IEpuChkB0izCaZM7wAnBEmg/NFDOHvlk8mvLyNibHqxg0YqGOIPaICPmBipc+pvYA8R48I/lk77pf0=
X-Received: from pjbqe11.prod.google.com ([2002:a17:90b:4f8b:b0:34a:9e02:ffa0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc6:b0:340:d1a1:af8e
 with SMTP id 98e67ed59e1d1-34e921e60d9mr30599932a91.37.1767135748870; Tue, 30
 Dec 2025 15:02:28 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:49 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-21-seanjc@google.com>
Subject: [PATCH v4 20/21] KVM: selftests: Rename vm_get_page_table_entry() to vm_get_pte()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150229_945203_B901A1D6 
X-CRM114-Status: GOOD (  11.57  )
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

Shorten the API to get a PTE as the "PTE" acronym is ubiquitous, and the
"page table entry" makes it unnecessarily difficult to quickly understand
what callers are doing.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h           | 2 +-
 tools/testing/selftests/kvm/lib/x86/processor.c               | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c            | 2 +-
 .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c     | 4 +---
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 7b7d962244d6..ab29b1c7ed2d 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1357,7 +1357,7 @@ static inline bool kvm_is_ignore_msrs(void)
 	return get_kvm_param_bool("ignore_msrs");
 }
 
-uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr);
+uint64_t *vm_get_pte(struct kvm_vm *vm, uint64_t vaddr);
 
 uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, uint64_t a1, uint64_t a2,
 		       uint64_t a3);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 5a3385d48902..ab869a98bbdc 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -390,7 +390,7 @@ static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm,
 	return virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
 }
 
-uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr)
+uint64_t *vm_get_pte(struct kvm_vm *vm, uint64_t vaddr)
 {
 	int level = PG_LEVEL_4K;
 
diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
index a3b7ce155981..c542cc4762b1 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
@@ -619,7 +619,7 @@ int main(int argc, char *argv[])
 	 */
 	gva = vm_vaddr_unused_gap(vm, NTEST_PAGES * PAGE_SIZE, KVM_UTIL_MIN_VADDR);
 	for (i = 0; i < NTEST_PAGES; i++) {
-		pte = vm_get_page_table_entry(vm, data->test_pages + i * PAGE_SIZE);
+		pte = vm_get_pte(vm, data->test_pages + i * PAGE_SIZE);
 		gpa = addr_hva2gpa(vm, pte);
 		virt_pg_map(vm, gva + PAGE_SIZE * i, gpa & PAGE_MASK);
 		data->test_pages_pte[i] = gva + (gpa & ~PAGE_MASK);
diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index fabeeaddfb3a..0e8aec568010 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -47,7 +47,6 @@ int main(int argc, char *argv[])
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
-	uint64_t *pte;
 	uint64_t *hva;
 	uint64_t gpa;
 	int rc;
@@ -73,8 +72,7 @@ int main(int argc, char *argv[])
 	hva = addr_gpa2hva(vm, MEM_REGION_GPA);
 	memset(hva, 0, PAGE_SIZE);
 
-	pte = vm_get_page_table_entry(vm, MEM_REGION_GVA);
-	*pte |= BIT_ULL(MAXPHYADDR);
+	*vm_get_pte(vm, MEM_REGION_GVA) |= BIT_ULL(MAXPHYADDR);
 
 	vcpu_run(vcpu);
 
-- 
2.52.0.351.gbe84eed79e-goog


