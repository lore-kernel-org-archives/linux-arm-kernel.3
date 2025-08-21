Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB69CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icfTHb8SQC6RmkA9MWOb7kih1+f1PvZwwwoiEq7I/xQ=; b=bjLYi2kdTgVeCMeusPkkakikbw
	tAgCBicoCCDZX1lvwzS2K3q8WyETDHku20aQ+427ZG9j+ZKlNieFAKXqUWjBH9f0EgUBV9T5/5NCB
	U9PzchPywS0o4cjrmwCgNUbaDI0/yeVuDha++OOQVapy3hk0rBbfNCOjYtXcHAxPuWZpAFu3ZZ70N
	vSo5gn8bPHwUALfMVJH8GtDSwl7wtZnpXGyHSQlnglTpj4F2P6dXk24znCr4UMyWhVoj2nwPhcDwp
	ZQ5WewZR/eMtvCVwqnKjGhqPSitNcrmgPa4cPJKIXWvjfEhne/aDegy4K6wdskwZzjbhE4nC1u2Qe
	HEUyfv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI5Z-00000001L3t-2FY1;
	Fri, 22 Aug 2025 03:05:13 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCPE-00000000beg-46rY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:01:11 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-24456ebed7bso17221795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810068; x=1756414868; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=icfTHb8SQC6RmkA9MWOb7kih1+f1PvZwwwoiEq7I/xQ=;
        b=SSVk122HncIAblx18Vca++hUxykb/UrpfQ0a7S6CskoTrRkmn+WnB+oPUieXVLMquQ
         pGSVZWdHa61jzeoH5Yz9+wulNMfr6Ul7COixI/xkdS+CrL49TUyl9vL+6Cd/Fp4/KDDL
         fqREnl4JVsCQwQga2LSeW8OZShi4X+0DV6k1sY2+1TQecAGa15aVPVm7Nw1eCOKwp0sZ
         V0XNFq1H7ZyiDY/sMOhm/kE/8SDAFM5uzwwH8suX96pdv5FZhFBcvZ3cNq4AjEl1g1kQ
         RyucOfZ88qnPkUlfzKknp3FERD1qB8I2ai/L6JsCEwi3WW92QZbRfPikaVGVX3J+d13I
         j2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810068; x=1756414868;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icfTHb8SQC6RmkA9MWOb7kih1+f1PvZwwwoiEq7I/xQ=;
        b=rruR9JxYqUpHlst6y5KXqbxDPCLXOiYfm7HavLjVjtyYmPl1B27ztT/n+g8vzrp7xh
         QJsxyC7lYoCrPr0RgDZjssun93tVRoIe4UqZ+/5xzCrWPsqHOFH5XppJmaId+PAIXb0Y
         IlqQfV0CIvg39BhMD5TvY+FA1eeHURYHcGjvLNzzZ4w4gef++VNOAp8wNAGcMBxGJKsh
         iy8S9JU1kl6HryQ2CsNGn1MSx/1BqeiD26DR7D8IpgUQER66+bnqigNXB0lT5QWa8OgB
         Xgxxydwa+5Olq/7+m113sT56zW+MYIPSt3ByxT1Mt1UqlnrCOInp7pdsveTT5IPEzhfD
         uBeA==
X-Gm-Message-State: AOJu0YzAPgh6h7Q3c9iTzQ5kEWfDAu6VSDvBYkJdwV+SWbfVzf7d0ceR
	Lh8ZhLhnPwylMoskbbmOr4YrSL6UZsdJD15Neh9g3QIBRBRzZOwuVGXNIBM3i9TQqhZJ9CmHor3
	35V3o9w==
X-Google-Smtp-Source: AGHT+IGG1PqwX+83Kz6lqMiL38vZquJagXjtigRLo1tbtN6yx1WhHPa1mZrTLmDFk+AuwMqOxdw4+SZNGP8=
X-Received: from pjx7.prod.google.com ([2002:a17:90b:5687:b0:311:ef56:7694])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a68:b0:233:d3e7:6fd6
 with SMTP id d9443c01a7336-2460248450emr47706545ad.19.1755810068184; Thu, 21
 Aug 2025 14:01:08 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:39 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-14-seanjc@google.com>
Subject: [RFC PATCH 13/16] KVM: arm64: Stash "mmu_seq" in "struct kvm_page_fault"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140109_020336_9F1F44A5 
X-CRM114-Status: GOOD (  13.84  )
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

Track the MMU notifier sequence count snapshot in "struct kvm_page_fault"
in anticipation of moving the mmap_lock-protected code to a separate
helper.  Attaching mmu_seq to the fault could also prove useful in the
future, e.g. for additional refactorings.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 1 +
 arch/arm64/kvm/mmu.c              | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 4d131be08d8d..6a99f7fa065d 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -430,6 +430,7 @@ struct kvm_page_fault {
 	unsigned long hva;
 	kvm_pfn_t pfn;
 	struct page *page;
+	unsigned long mmu_seq;
 
 	struct {
 		vm_flags_t vm_flags;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index aa6ee72bef51..575a4f9f2583 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1471,7 +1471,6 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	int ret = 0;
 	bool writable, force_pte = false;
 	bool s2_force_noncacheable = false;
-	unsigned long mmu_seq;
 	struct kvm *kvm = vcpu->kvm;
 	struct vm_area_struct *vma;
 	void *memcache;
@@ -1612,7 +1611,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
 	 * with the smp_wmb() in kvm_mmu_invalidate_end().
 	 */
-	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
+	fault->mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
 	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn,
@@ -1691,7 +1690,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 
 	kvm_fault_lock(kvm);
 	pgt = vcpu->arch.hw_mmu->pgt;
-	if (mmu_invalidate_retry(kvm, mmu_seq)) {
+	if (mmu_invalidate_retry(kvm, fault->mmu_seq)) {
 		ret = -EAGAIN;
 		goto out_unlock;
 	}
-- 
2.51.0.261.g7ce5a0a67e-goog


