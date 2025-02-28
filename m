Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C659C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBFHvME4v7wAoT7habVFSIRXDLX0Fgacd+7YWwIrSSE=; b=tqXsH5ZriA169lgxoKcDLo9Ity
	46DPgJXB0lc9qJj9bwvpWU6P75aH33IQq4/xUtuId/20l+2LgZcBiBn4vTdlBCFwDJ9Yjr7MdxCkE
	fzQxWPtz4+FZlrdpvQ47pAWcXMR/P1VJyigG5V7ZgwIj868tqxMcNRbW2376ztmxUoWA+6w5SVO6K
	0bwJLJAdrE5rxQVXPeWz6dElDxPTQu72eVPrDI6FJeLRInDpBRB/l/bu24W0OilrRFc/NE2/QL4Jf
	fPuArRCYY/WqeNikM2sZZG8HGHKUrYF6zwxbLXGO5F9aeFhounmsJg7kkRIv3tV5gLFbfoGGO/8yc
	SjJIycuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxwW-0000000AeZE-22dy;
	Fri, 28 Feb 2025 10:50:08 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxZE-0000000AaWr-2UpM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:26:05 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-390ddb917abso955670f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740738362; x=1741343162; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBFHvME4v7wAoT7habVFSIRXDLX0Fgacd+7YWwIrSSE=;
        b=cUa0xnIzdZrdQho7Zol2dy+NS5aDNwmW2t3pWqSfCAaxk3Yn9iSZSrDz+uuOo6HL73
         MD2FDVE+yDyyhLK85oUgvOZSQCN6Osy7RbF8po8DwXTs4acnXn1KmJk3p3ub8f8rSFOJ
         kl2d6xrg9FYNXT6bUPoaf1vonTVqbiaAQwvd5BTqNPntWE3n5W+6CGLf8il/o9q+vhXy
         Z6VvrQaVWNsgj5o3ol2c46s6rOhUDpyK7+kIAeXcqST0PEGhuPJCxraHgQmC6TIMSZ60
         chBq0IhKliNpTshFi+mEK6Xqgxsp/35Yg+FpogB+EhMQ2a3h+JYRSjWRJSwAcPSgMyhd
         z8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738362; x=1741343162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBFHvME4v7wAoT7habVFSIRXDLX0Fgacd+7YWwIrSSE=;
        b=EIwTgSiFcHJ9FlMgxRgoIk93EF1SnyfjpL0HAmtPbL5Xcl68rSQ/QE7ttDXkrWaAjW
         U/k4f6xlN+JLwH1iOI5VJyZ9WSCQQw5Fw10JILjZvFG/Rukdii+rkbi8oVfQRz3U1Svj
         rVafWpLc5DAOuXK9mIKmWiFvhR9SR11bq+iEroaZxYMrXwRpRBCd2k5PGAy5x7xdZlh5
         5PQY6j1rtJTZcdYpsHXPQKT/Mr1N4lZR3XuoFkrWbD2TDZOD5SEEMrdCr7Bno9TZibfc
         B1nB+7Qc9Spl9S7uovOxB2+CFyaIHC1wcpeWJkzshsVMXMpoXSwZneZvYkm0T6CIVmL1
         AHHA==
X-Forwarded-Encrypted: i=1; AJvYcCWS4v+aloZyv3YOf5Q0dgNDTTMp2wO82ErBoHnl4mOBZQ5J8FeQbNl7jorWi1CytGFuu8JeI3ohvydAuEt45Xb9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx74ghjTTLyWsEP1pKF9/cUk20Nu/pMPhDaNl5FyAXuHuP+xdB1
	YIO4jAauGsTN7PoocibbtEGCoh2TE+sPAcwORHaVBwezFpVwiBwy23qoxEPih3hG8lZbI/zhIJ2
	ETXjVOhGqLx/N8TZPaQ==
X-Google-Smtp-Source: AGHT+IEwHls1BLgdvt5KFxyshaKSutUV2RLW38Q+fbEdSBaFOyihQeFxU0qCKw+zxyowZaUN4jkoWQg3AuWNfSEu
X-Received: from wrbce9.prod.google.com ([2002:a5d:5e09:0:b0:390:e493:b594])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8d:b0:38d:d0ca:fbd5 with SMTP id ffacd0b85a97d-390ec9bbc4cmr2282409f8f.22.1740738362092;
 Fri, 28 Feb 2025 02:26:02 -0800 (PST)
Date: Fri, 28 Feb 2025 10:25:24 +0000
In-Reply-To: <20250228102530.1229089-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250228102530.1229089-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228102530.1229089-9-vdonnefort@google.com>
Subject: [PATCH 5/9] KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022604_631302_967AD6FF 
X-CRM114-Status: GOOD (  10.32  )
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

In preparation for supporting stage-2 huge mappings for np-guest. Add a
nr_pages argument to the __pkvm_host_test_clear_young_guest hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index ad6131033114..0c88c92fc3a2 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -43,8 +43,8 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
-int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
 int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm);
 int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index e13771a67827..a6353aacc36c 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -335,7 +335,8 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
-	DECLARE_REG(bool, mkold, host_ctxt, 3);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
+	DECLARE_REG(bool, mkold, host_ctxt, 4);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -346,7 +347,7 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
+	ret = __pkvm_host_test_clear_young_guest(gfn, nr_pages, mkold, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) = ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index c273b9c46e11..25944d3f8203 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1110,17 +1110,21 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 	return ret;
 }
 
-int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm)
 {
-	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 size, ipa = hyp_pfn_to_phys(gfn);
 	int ret;
 
 	if (pkvm_hyp_vm_is_protected(vm))
 		return -EPERM;
 
-	assert_host_shared_guest(vm, ipa, PAGE_SIZE);
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
+	assert_host_shared_guest(vm, ipa, size);
 	guest_lock_component(vm);
-	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, size, mkold);
 	guest_unlock_component(vm);
 
 	return ret;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 3ea92bb79e8c..2eb1cc30124e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -434,7 +434,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   mkold);
+					   1, mkold);
 
 	return young;
 }
-- 
2.48.1.711.g2feabab25a-goog


