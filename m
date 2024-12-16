Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141E7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMBJ8qv477+/KhCtyqixNk1hTPuipFTJvx4sNjSPhX0=; b=XKjdfiDHkGY+k9/qFNYNVRhkGD
	ofZXNhearkbBXLNwL4LNyhJmFY3ToidkusuLbz6LykRvhtFH3o1kucm5XffTkz/2JViSSooAkgNwY
	yFHgjdOHH9iE11HpkdyzlfBusCOkJRyixHeeE2WcCRVDJw3sUTUzag8H3BZMQtIwQjBky8mJsTc8a
	6cDUz7bcwx2ijFuHH1xJE333VjpNvZ2vzxdBPFSkqeFmtcsmugqtpBQWHrNB4ACW5qEk0edDMKlPK
	2fGJS8IZGryErbpbr8y5XnGn7BYHqqrRlMDSZImBFnV0KePjarDk6k5921tWPlZiTlUeyrFmAN3UZ
	boHa2kcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFTu-0000000AtXD-0sgx;
	Mon, 16 Dec 2024 18:06:10 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMH-0000000Aqut-2gMR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:18 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d3fe991854so4648267a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371896; x=1734976696; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMBJ8qv477+/KhCtyqixNk1hTPuipFTJvx4sNjSPhX0=;
        b=ZlOcVreo3nYiu1cOi7lAPKVi86ADHEbX6m+CGmA/NQYfGqHZVZBVNOYUlIZNLN82KJ
         qaBSfyTPLn7Uq3S04OLmYVMq0bZUypD9bQKJyEXZgq1faQfUwU8x0fx9Leynxf3TK6Zc
         x+wjqU3gWdvMZ+PfUC/7CZE8JGmusbFErvAkM0hOdJs8Mz/MNXj01yAATgiuI/LleF5u
         mfK5t71nSVu/20bCO4jWtDtsA22xbqNHA7gf/ZO4nc4Ju4HCJSt35ro9UJz14WXBMdD/
         ELqqZpfj5lALiuu775yK6f6a1uTRBnn+BpMFfhEkB0lOum5+kWUCmGWmCmIgp/mW1+3B
         ZBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371896; x=1734976696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMBJ8qv477+/KhCtyqixNk1hTPuipFTJvx4sNjSPhX0=;
        b=DJGgOI+ULgVgvfnkVIURhj+dRM/SiFVFmkoM4LyERyDq5nYxROd6up/yvhR4L+bJWW
         +K0D7krglE2aibSpjhMe6cBr+aQQjRpdaVWafv+sMFIx6W/JhK+FCrk9KN3orDXIK8xJ
         7ZO2rgMbHbEQXB/9Mq4AHUNP2cfSAZFiTzeYzijV1KCPMIvhsQW0ZPAEWPCRTvqewLFr
         0zDNWT7phiUo7stSGxi3uIxi6sjww9vVya0ndKbBTbLlshbAPPBistsfdsTpLNaAchuF
         ZSaujd0nW9i8nTPFDIsM+KijVtTtuNTG7O+lc83IZAVi4jXHNMbZkZdjKZmZr3VZOi6b
         WfiA==
X-Forwarded-Encrypted: i=1; AJvYcCXhs0ekUCU18xw6jQP6VbbD6nkCCmAupQqMXfGchaxpn+4eRBxz44F1apweU5Mm4ZRjl4b8EPXaSaJg6jmI4dWM@lists.infradead.org
X-Gm-Message-State: AOJu0YySi7GexeIxdbyFoJaf2S6g1VqZgY7avok+QoJEREDsQYyoyy5X
	wXyMVL8eAj/xpumN53iYYTTuUk09D5CGk+rO8Q37r6SdJjF8ZDxWj05ZJKibDP41VcjOp6F3MOZ
	pS1Szcw==
X-Google-Smtp-Source: AGHT+IG78GpSrIyP8EQZsymolUELoZAfYkZfqZ5uAr74kYA6Of93xC43jJPtt/eSfM7J/zSOVAI94LqFwgRU
X-Received: from edber15.prod.google.com ([2002:a05:6402:448f:b0:5d6:3c96:bb82])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2695:b0:5cf:e71c:ff88
 with SMTP id 4fb4d7f45d1cf-5d7d4053910mr586302a12.4.1734371895963; Mon, 16
 Dec 2024 09:58:15 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:50 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-6-qperret@google.com>
Subject: [PATCH v3 05/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095817_680496_9C4CDF9E 
X-CRM114-Status: GOOD (  15.21  )
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

kvm_pgtable_stage2_mkyoung currently assumes that it is being called
from a 'shared' walker, which will not be true once called from pKVM.
To allow for the re-use of that function, make the walk flags one of
its parameters.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 7 +++----
 arch/arm64/kvm/mmu.c                 | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index aab04097b505..38b7ec1c8614 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -669,13 +669,15 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size);
  * kvm_pgtable_stage2_mkyoung() - Set the access flag in a page-table entry.
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address to identify the page-table entry.
+ * @flags:	Flags to control the page-table walk (ex. a shared walk)
  *
  * The offset of @addr within a page is ignored.
  *
  * If there is a valid, leaf page-table entry used to translate @addr, then
  * set the access flag in that entry.
  */
-void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr);
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
+				enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_test_clear_young() - Test and optionally clear the access
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 40bd55966540..0470aedb4bf4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1245,14 +1245,13 @@ int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 					NULL, NULL, 0);
 }
 
-void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr)
+void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
+				enum kvm_pgtable_walk_flags flags)
 {
 	int ret;
 
 	ret = stage2_update_leaf_attrs(pgt, addr, 1, KVM_PTE_LEAF_ATTR_LO_S2_AF, 0,
-				       NULL, NULL,
-				       KVM_PGTABLE_WALK_HANDLE_FAULT |
-				       KVM_PGTABLE_WALK_SHARED);
+				       NULL, NULL, flags);
 	if (!ret)
 		dsb(ishst);
 }
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c9d46ad57e52..a2339b76c826 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1718,13 +1718,14 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 {
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
 	struct kvm_s2_mmu *mmu;
 
 	trace_kvm_access_fault(fault_ipa);
 
 	read_lock(&vcpu->kvm->mmu_lock);
 	mmu = vcpu->arch.hw_mmu;
-	kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa);
+	kvm_pgtable_stage2_mkyoung(mmu->pgt, fault_ipa, flags);
 	read_unlock(&vcpu->kvm->mmu_lock);
 }
 
-- 
2.47.1.613.gc27f4b7a9f-goog


