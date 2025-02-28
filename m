Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85714C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRMnVBqxbNr0g4BbhZbbaQ06EF+wmwJkU+0Xf25VfM4=; b=n49IVyXKnH9B7+PxXjO/5/MUe6
	Z9Yp3OeptZsszU5PShcYNlxMOjCrqQb17Q2IE16EPMEU08GxUiomZvAwCQ/L8NiYHxKu43V7yH1Nh
	V8iu7c0QRCWfIZ2nfMOHl9hJGZrIZGR3W1m0LdnNUb7Xh7oKFTulFDPljxW+eMTLPl9Pzejg4E0eH
	NU36jQ09D4fbT2/4440AtGlYshV0r0JDMQvrqg93NRn0zGIfZ9H5oBwk+4F92CR5HH9aO8H3BA31q
	rqX6hmq52QL1pCFtQeeOkW06xm60wA4F5Fh2DhV96xl4hjOAq1Nez9pjcjFElvSY8pzp26wuxI7JN
	6qkSxO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tny4B-0000000Ag2w-3cXs;
	Fri, 28 Feb 2025 10:58:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxZO-0000000Aaa1-0iTM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 10:26:15 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4399a5afc95so8258445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 02:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740738372; x=1741343172; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yRMnVBqxbNr0g4BbhZbbaQ06EF+wmwJkU+0Xf25VfM4=;
        b=geaK+W9x0fvHSLC4e0mNhMTY1Y/xsecYirAHcJM3MPoQlPqjJW2dof9HuITPxdzEdy
         PzEa7JadWHI8qmgUpxm6ahl5Q5/WLq0dLKH9zT4kFC0k98p/0K6Qr79MFh3k196kWlYq
         tl6jTnfjpxWhKrVEC+Pnm8yp/Mv/psG2Cixd/75C9ERg3lCryWPA9daTaZByOpC2N62f
         f/221H78M/pNhkl1dk+hx4xDfT78I9sbi9n3JwtfX6wrPNlfa+HCrgl8NTddaK4hn/9y
         br9CxqPWxNqfUSkUjLDjxgEQX+5kB0mwcYM16hA5Sl9bTfSROpINkj/ZAsHVLBMbekVo
         HzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740738372; x=1741343172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRMnVBqxbNr0g4BbhZbbaQ06EF+wmwJkU+0Xf25VfM4=;
        b=F1O3rUdl3cYRRDau9unCNbLv7ITHwbZHbzD76LuIwcF0cMRyJc+WB4cL5/LXxoBjWX
         28QCpkGHxrqMkSyf9qt2MZVFfATW2AfJemnPwYyyEU5ZlKq9xD2owoP1kIXOBGgDRDFv
         Mm0zGst9eHRU1C8BPBaspniZdIgH0jLGVW42/V1mK7zxg71v0kXjyW7TkITi8nfdQJkd
         8oW7L+OYMvq9uwNwmkDc4lY3YTod9VtDF8jNG1g4llIy5ANcoE4ke7Ei09fnqVin9T0B
         ZOW7EcHCXl2GlMuCA5eDjHVqDFmSPHupmxKfVF5zpDu1NkdGN32SAQhMi5eGkBUMaFiN
         Z+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWfGbBd8DDvsIms6KoRlJpCQmzz+DQmBcJgWLU9e8cHzEXWR0kZlf/iuhuaDQeEu1PvBpoDznYeSV5poML1B3w@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/OWthp8q6efAwouMF3qL2dtPoLMqe1QPDwz560YUfUxiBdJf5
	nvcPJTnnEaGuDoBxyKjwtozQnAP3ZdYyRZ+37PSSH4dgsQW1vewZ29R8JgVVhkXQ2F/AYqtT5OO
	GwfMxmw2pepIB2Q/dXg==
X-Google-Smtp-Source: AGHT+IH0fwtXCTDeJhT/l/khwHsuYplMhcSCRFECxM5q7EjwmroI+BdQCjojPmRxAfbH2kPDmDbv1a422TO5a1h/
X-Received: from wmqe15.prod.google.com ([2002:a05:600c:4e4f:b0:439:9fd1:8341])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1387:b0:439:91dd:cfa3 with SMTP id 5b1f17b1804b1-43ba6760305mr20891625e9.29.1740738372225;
 Fri, 28 Feb 2025 02:26:12 -0800 (PST)
Date: Fri, 28 Feb 2025 10:25:29 +0000
In-Reply-To: <20250228102530.1229089-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250228102530.1229089-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250228102530.1229089-14-vdonnefort@google.com>
Subject: [PATCH 8/9] KVM: arm64: Stage-2 huge mappings for np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_022614_210358_DFA2D649 
X-CRM114-Status: UNSURE (   9.68  )
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

Now np-guests hypercalls with range are supported, we can let the
hypervisor to install block mappings whenever the Stage-1 allows it,
that is when backed by either Hugetlbfs or THPs. The size of those block
mappings is limited to PMD_SIZE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 25944d3f8203..271893eff021 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -167,7 +167,7 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
-	return true;
+	return false;
 }
 
 static void *guest_s2_zalloc_pages_exact(size_t size)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1f55b0c7b11d..3143f3b52c93 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1525,7 +1525,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1535,7 +1535,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
+		if (is_protected_kvm_enabled() ||
+		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 9c9833f27fe3..b40bcdb1814d 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -342,7 +342,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.48.1.711.g2feabab25a-goog


