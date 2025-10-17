Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2493FCCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGJSKqxu0aNpKU4CMPi7Ju9DUaCLFSD0JC8SLGhbfdI=; b=nr5+V90YE5pmGNLEv+feitPzEW
	DuUtaFkwNVW04QJh/KIx9RTEwLuMyOpXXjtC+u38PfR38BjYczLGiEs5F8EcoOU+AFlM90EBk3e28
	AejDj7c3NzPVaHjt46nsfLN6LADvwD602+AqkbStWxwOuQ0b6T2WTU6Mu3jXt7RuEjx40IXcQdNSY
	Jk3neqbP1mJDKOfwnNWjHLo88gGux89uj64x5hV91TsaDepvrCUqUqhGO198Ns/GQFHp2Wf662tqY
	BlcOBDm2r2b+IDJAH355sVeW9OjXT+YjJpW8OA+M2H+a+6FvXZtXGNW0kMslFa+eRppDzKfNjXyLE
	T4hcR+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQy-00000006FwK-2Yee;
	Fri, 17 Oct 2025 00:35:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPt-00000006DwN-0quw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yGJSKqxu0aNpKU4CMPi7Ju9DUaCLFSD0JC8SLGhbfdI=; b=GNeSDPu1Z7AqXbaUNuotDa6olI
	0MV5F8TKbNI5AjerzlvUbLp/RTCZscBplkKncjAsIYDPXEjTGRSWIP/vtVkIkz8U9lz9kYHbpmrX5
	P6HKtEeDnwvlOUSsXH4EEJ3gC/qqWsd0kBBDfPPNSnybIXJPkvsEiFCbEE7BOgOLANq47ckKKHsR8
	d9T2hzUzToCNMAgkgp5sx0YobCBq5L4go9ilQ7AMVWWoWmSwhQnG4EZcZeCfIChnzNplA0/WECTUD
	N20cMTFWxljRcToHc+/5hWb3dwWT55mclOidrRM4w6+i7RB6dtI3gfpcONeV8vLAmklnrIH0k84Z/
	xWY66rww==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPH-000000078Hk-2YFk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:46 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so2861487a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661193; x=1761265993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yGJSKqxu0aNpKU4CMPi7Ju9DUaCLFSD0JC8SLGhbfdI=;
        b=niCMdgNckrzv6Yt9a1bYBhNll9dbGKnz74QZyf+gxCiY1gQ79d45BFzIhklyW3tF2N
         KDnF0IIyVYzkCUxU2hWbQ8FbQuTKUDT2Wmrj1xT+AlqCTGrEyokO8VyULM4lg63aG/b+
         o745WolT1UJSYeg2vIkhQkake79ZK9hXD3smgY4Ds38LHcCNbfX6jq1ZIDDcoET4GUPY
         Hl2pYXxA7E8YsUh3suEFsAfB3ABfzUyz128tFMbCIIYyP6rEfZKjqiXCMxQR/BzJ/Cu8
         N0dh7EQhRTlChxYAZbcDd/ILZSauPA24BTJP1lYM/9sXLB17XL2tfphcFP3F4mksyTTo
         5qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661193; x=1761265993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGJSKqxu0aNpKU4CMPi7Ju9DUaCLFSD0JC8SLGhbfdI=;
        b=o3kuw2OArZnMzJSnH7AtXXSIAEMnn+MMkBFPFDzeXWw6SfdYjQe1lOCeiinzfjr4sT
         smC2SZ27zDEk2J5nMZSl8q4LqSu2+JCqmFfLQ2nGBmgID9nKX+B0nEeCVeMIcVKPOJ6T
         tj51AMoOyo+1DW9XJdEMg2lnDOUj7SdVJaP/1oD5grRc6ePvW7LWAggzzmGm49bvg0tc
         jExhUM93gazuUmQN9dWL8FcnhymsDbnYpzzikYP2W3F8FR1wxrYUTo3eMn+Ct2jxdrUw
         AEK41uJygBXlWmdD+BAPVdLvMTcLQyQPgUnyyLQputlMigelr76pbpaQPeIUpgO04ZOK
         hUdg==
X-Gm-Message-State: AOJu0YyX2IyatIpwJv5mUtjMGgQZWjLagLLt8SgpxLz4X8PTVrkcUZl2
	pr07hLUpV/ofnlvNivbE6/yyazStT/2dLEvLL3eIlcqMw11D6ROH8xlIMUtbxKH2YE8BWVd13Aq
	WHOQp0g==
X-Google-Smtp-Source: AGHT+IHjaZ2dKb3gnqjzbrezKxoV9F/Lq4sC9R35D07gH2vTOnVl3FqHgnrEtTPEkkZOYMNEYP5euQorQsk=
X-Received: from pjtu8.prod.google.com ([2002:a17:90a:c888:b0:32b:58d1:a610])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c05:b0:339:ec9c:b275
 with SMTP id 98e67ed59e1d1-33bcf84e181mr2234528a91.6.1760661192796; Thu, 16
 Oct 2025 17:33:12 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:32 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-15-seanjc@google.com>
Subject: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
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
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013344_953115_2A93D403 
X-CRM114-Status: GOOD (  19.52  )
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

WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
measurement should fail if and only if there is a KVM bug, or if the S-EPT
mapping is invalid, and it should be impossible for the S-EPT mappings to
be removed between kvm_tdp_mmu_map_private_pfn() and tdh_mr_extend().

Holding slots_lock prevents zaps due to memslot updates,
filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
and all usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT
entries that can be used for the initial image.  The call from sev.c is
obviously mutually exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT
so same goes for kvm_noncoherent_dma_assignment_start_or_stop, and while
__kvm_set_or_clear_apicv_inhibit() can likely be tripped while building the
image, the APIC page has its own non-guest_memfd memslot and so can't be
used for the initial image, which means that too is mutually exclusive.

Opportunistically switch to "goto" to jump around the measurement code,
partly to make it clear that KVM needs to bail entirely if extending the
measurement fails, partly in anticipation of reworking how and when
TDH_MEM_PAGE_ADD is done.

Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c37591730cc5..f4bab75d3ffb 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3151,14 +3151,22 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 
 	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
 
-	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
-		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-			err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry,
-					    &level_state);
-			if (err) {
-				ret = -EIO;
-				break;
-			}
+	if (!(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
+		goto out;
+
+	/*
+	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
+	 * between mapping the pfn and now, but slots_lock prevents memslot
+	 * updates, filemap_invalidate_lock() prevents guest_memfd updates,
+	 * mmu_notifier events can't reach S-EPT entries, and KVM's internal
+	 * zapping flows are mutually exclusive with S-EPT mappings.
+	 */
+	for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
+		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
+		if (KVM_BUG_ON(err, kvm)) {
+			pr_tdx_error_2(TDH_MR_EXTEND, err, entry, level_state);
+			ret = -EIO;
+			goto out;
 		}
 	}
 
-- 
2.51.0.858.gf9c4a03a3a-goog


