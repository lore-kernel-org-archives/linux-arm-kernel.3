Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14055C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nY53fsjf1Gqi90zwwkjs/Ss31wicoUxN0lBzPVMQZ48=; b=hzJsYIUS1N9TWbvmdmDYcBDLjl
	J/zXgVnOfBZLF8V41ZtYGpWyAmqhuxwOH/EzaMjAI87FZ9FHrTXfrMZOnl+fuzkGTVZ39x0/cyfPF
	p8MQYKeTR6fQd6EooX9Vqv3GrFgLT0smZVHm0W0JjAKMlnGp9p2iZKymGmonnqUBup1LbsWmi1iyc
	OaFQLpDhkkLKnHFH0QNz8XLuTyOEEIH/5yKsuSOAI7qcIwFt1OsLBJvPM3S9PS4aTmXeDZrJBFkz7
	sZbpUlpvCYVsj75TFC02iY6VfR9NRPIRbhMYOPsHWE02IjyZduspITeP9v+Hf7pzrYA0hG4KSTnFn
	tciDO2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq97b-0000000Ak0m-3c1R;
	Thu, 06 Mar 2025 11:10:35 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8yH-0000000AiXj-3KDs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:00:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43943bd1409so3466875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741258856; x=1741863656; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nY53fsjf1Gqi90zwwkjs/Ss31wicoUxN0lBzPVMQZ48=;
        b=aETTQGvAdW6LY6UoJ/Fl+cOfXb3yBOcCniC6KIsWiCNfwxdwcxUlsLFdPpxLp1jrzy
         4j3IpIPks+czwgAciokvVfG6drxbuUj76gBentRYEtozxfpetiwhrXXUxJ1FmKQpGbSa
         tS+goc9chk/LVid4GhZm7a7gfOJfjVleQ1TtSLIGC3vE8DMOYxc90gvqswAAajKNnL4R
         0Ei9Y95DfVdOzLfzYAWGfn5/L6tBz7G5HCTNuG/dEu/ijSJoF7MsqFSUIXPLnTODxfqd
         cqElAYkWgf8eLfexobtqockDbY2WT6b1YXf3cSTPaE9kATM2l5VxYdH7SvDo9BQDVGkt
         CSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258856; x=1741863656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nY53fsjf1Gqi90zwwkjs/Ss31wicoUxN0lBzPVMQZ48=;
        b=o9jiVvrJh3HEg2EKR0FgGZ2gz6axlGfxXV5GmYD6HoMmx9W/vKwCyVXNZ/u8REiqEO
         bPtzj52lxtPZuyQzLdfn+k2oGOs/sHHGWptwiDuntarv8+S+V/xjB6lr0o7LglmFK0YK
         Kojld3doGbsFwSo6xzYivCRC0uyhXuikj2i4O1U4QXeOhU8ayYnwSkJ9/i0H2p546MLb
         Xqqg5JOxqHqVWmBquS26oZyIlGfZyZjExjG2nFWR2fv7R9/H5dqtJBlmEsx0Et7ZZrgE
         ifUv6aJzZs/7NAyTAm3gTyQUUoLfKnG/obm4cY0eT8m0hFESf2cdLgI6kIkKteyTDM9m
         YK8A==
X-Forwarded-Encrypted: i=1; AJvYcCVSXtX6j8US3g0ziTRQthWjetmaMT0OR9SGQx3oddU506G5sfU3EzdVc4rlAbMkJYy4eH1CaQeimTlRPLElwf5n@lists.infradead.org
X-Gm-Message-State: AOJu0YyRjoyv1o2AIxRyAIIZJGJCCEG7lo1s31gZzB8cHZgxgbIXeXqB
	GVi5WAkir3M1R8zyxNbtSigNaVb2sbIBS0eioJu3QzWvM8lxwWNcyqY/C1NoI514uYI9MEiksZm
	py8iVrBBY78ywaZD0xA==
X-Google-Smtp-Source: AGHT+IGmQeadGZM6t/fuvRDJiBZnTtGUTvo721CNjh1/3loduEsrkWUlmN6OyAD3MtikSnlm82gvqe/Rikhd5Zkg
X-Received: from wmbbh11.prod.google.com ([2002:a05:600c:3d0b:b0:43b:c0cf:b8e2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:59ae:0:b0:391:2995:5ef2 with SMTP id ffacd0b85a97d-3912995602cmr2172678f8f.37.1741258856189;
 Thu, 06 Mar 2025 03:00:56 -0800 (PST)
Date: Thu,  6 Mar 2025 11:00:34 +0000
In-Reply-To: <20250306110038.3733649-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250306110038.3733649-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306110038.3733649-6-vdonnefort@google.com>
Subject: [PATCH v2 5/9] KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030057_865671_0E34B07E 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
index e113ece1b759..61bf26a911e6 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1124,17 +1124,21 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
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


