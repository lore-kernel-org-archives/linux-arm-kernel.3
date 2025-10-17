Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D8DCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufVneY39YrbdCfRZpp0jVK1n9RSn66wnVA9SJtGGBdY=; b=DRcwxbBcJeYxij1I6FxEf/2CoX
	ixcmKkmGZ+Wdz9IrMajdQ2g8YslnUPAuXI08A66FIqxWDTvaSfNnqCL3crjLn87IcCPmX2DZ3adWC
	Dkv/7TPVHA77S02xC7Xe4dl5lL/9lFoAMckPX9W1+dkZHJWJoxberZrqFJ7joP2gsFn9zsV3K5qSv
	M/VOSRKc6W1KmtfjGFzrx/HSgyyCSK6hQW68PQ4a6qpTBLl7wuNprsy/MvTJvf3Knu5afntmOaIs9
	vqz0pYPrzWM4rCmORxC/SPvUTsJDWxk+kzRZsxh0f3Aoco4n1qblAZ5a0IBL4ooVTaTogZOipcGeN
	KdbVkDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YOy-00000006Cgw-3fGt;
	Fri, 17 Oct 2025 00:33:00 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YOs-00000006CXm-2M9F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:32:55 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1155864a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661174; x=1761265974; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ufVneY39YrbdCfRZpp0jVK1n9RSn66wnVA9SJtGGBdY=;
        b=4oa6caSMum2WHT2zMG3xhhyI3dNcRr8cDPoC20Ij26eNiFw28CZibjrprKTlm6MKe5
         POttPdnydUnKx5yqKvgRAZdQGxc2DcC6isz+c75l9gHqGxKHqWxzO2oS6qmcrJzgqOvK
         p+blFmKjfF157bQ/sqZkxQf61/3CoqikYQxe6AWy9yjd4DuO/eqvR1zvD9Gt2dIG93mV
         NzBgf5IXDwCi9IsHNYJTNxwk12CUBeY/jW5svIUe2ZgUzzbcUQJJzBcmlNfg2RXRjj9O
         LiJ0haW04bt3YRqyGI7Ji7e5el68eSOi9qfn87Y4XInxgMA1HlOKArcGrDiZC9BFclm/
         E5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661174; x=1761265974;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufVneY39YrbdCfRZpp0jVK1n9RSn66wnVA9SJtGGBdY=;
        b=oXT8Cf6kpanDBbe3yAbCOxxbofnmzKeF8tXuvgp8YmFD04XC2AwRUAGXdmAFdKzMAS
         M0oH1C13DJoQC8PnIYNnvoMSCNV5E/rEvL5TIEVx4Mx70ZKACbcstUyNXCfb6cBuTG4m
         +BlVKNkp/3SVq/h5tMSWmYbiyUEbXBeimCgCQJMYkhViXzmuxQS75QqyJePE2LWUCfVM
         9WcXHTVmsSZA0n6fzt+elQcJ6CkR5mPdi6HxTivbfiijZ5v7bPMjn8YGNBjBNgU2tb3O
         ua/EZqO2y4G/4jrbKcYVxFpgpj7FX5hnmOwBVj5UYDDosa123WzxQWjqMzF3sUG6ibjJ
         g33A==
X-Gm-Message-State: AOJu0Yx0oojL+I2yBD419h70k48HsaVn1VjrjSW1WHDX3FEV98azLyW2
	zKZWoCQTZooIPVrciU3VAeP4XZVtMbJr8oGAUwQf6mu+/ftg6KtG0FZQ5BGKzcxjzYKhGNFx3QC
	aQsGIAA==
X-Google-Smtp-Source: AGHT+IGBsD40M1TCHpceHuTvrzQu31EsWCpow7sShvAnQiEKP0H9VSo9B6k/+Ftt8wsphMd8FgX3xhZLFrA=
X-Received: from pjop7.prod.google.com ([2002:a17:90a:9307:b0:33b:aa58:175c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fd0:b0:32d:601d:f718
 with SMTP id 98e67ed59e1d1-33bcf8f9c16mr1675095a91.31.1760661173675; Thu, 16
 Oct 2025 17:32:53 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:21 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-4-seanjc@google.com>
Subject: [PATCH v3 03/25] KVM: TDX: Drop PROVE_MMU=y sanity check on
 to-be-populated mappings
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
X-CRM114-CacheID: sfid-20251016_173254_638654_5653DF5B 
X-CRM114-Status: GOOD (  20.77  )
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

Drop TDX's sanity check that a mirror EPT mapping isn't zapped between
creating said mapping and doing TDH.MEM.PAGE.ADD, as the check is
simultaneously superfluous and incomplete.  Per commit 2608f1057601
("KVM: x86/tdp_mmu: Add a helper function to walk down the TDP MMU"), the
justification for introducing kvm_tdp_mmu_gpa_is_mapped() was to check
that the target gfn was pre-populated, with a link that points to this
snippet:

 : > One small question:
 : >
 : > What if the memory region passed to KVM_TDX_INIT_MEM_REGION hasn't been pre-
 : > populated?  If we want to make KVM_TDX_INIT_MEM_REGION work with these regions,
 : > then we still need to do the real map.  Or we can make KVM_TDX_INIT_MEM_REGION
 : > return error when it finds the region hasn't been pre-populated?
 :
 : Return an error.  I don't love the idea of bleeding so many TDX details into
 : userspace, but I'm pretty sure that ship sailed a long, long time ago.

But that justification makes little sense for the final code, as the check
on nr_premapped after TDH.MEM.PAGE.ADD will detect and return an error if
KVM attempted to zap a S-EPT entry (tdx_sept_zap_private_spte() will fail
on TDH.MEM.RANGE.BLOCK due lack of a valid S-EPT entry).  And as evidenced
by the "is mapped?" code being guarded with CONFIG_KVM_PROVE_MMU=y, KVM is
NOT relying on the check for general correctness.

The sanity check is also incomplete in the sense that mmu_lock is dropped
between the check and TDH.MEM.PAGE.ADD, i.e. will only detect KVM bugs that
zap SPTEs in a very specific window (note, this also applies to the check
on nr_premapped).

Removing the sanity check will allow removing kvm_tdp_mmu_gpa_is_mapped(),
which has no business being exposed to vendor code, and more importantly
will pave the way for eliminating the "pre-map" approach entirely in favor
of doing TDH.MEM.PAGE.ADD under mmu_lock.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 326db9b9c567..4c3014befe9f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3181,20 +3181,6 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (ret < 0)
 		goto out;
 
-	/*
-	 * The private mem cannot be zapped after kvm_tdp_map_page()
-	 * because all paths are covered by slots_lock and the
-	 * filemap invalidate lock.  Check that they are indeed enough.
-	 */
-	if (IS_ENABLED(CONFIG_KVM_PROVE_MMU)) {
-		scoped_guard(read_lock, &kvm->mmu_lock) {
-			if (KVM_BUG_ON(!kvm_tdp_mmu_gpa_is_mapped(vcpu, gpa), kvm)) {
-				ret = -EIO;
-				goto out;
-			}
-		}
-	}
-
 	ret = 0;
 	err = tdh_mem_page_add(&kvm_tdx->td, gpa, pfn_to_page(pfn),
 			       src_page, &entry, &level_state);
-- 
2.51.0.858.gf9c4a03a3a-goog


