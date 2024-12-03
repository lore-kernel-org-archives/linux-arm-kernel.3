Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE14E69E9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7tOYZxQzwS2lgtsj/R92cF0vRMD/ffbTmBJ2Qyy7h8=; b=d2+H2HwHScMYX4KAkq7jlMBcoj
	EN0CgDcZjv+XNmqI7X214Q0jJYjn1RcoHQ4LiepTD+ADIYULSu+5YgmMXLdGWkLkXAs8tvMsINmyU
	+lvaNfZ+mWRDlgarKRIJaUIRfYe90BaVJeNDnj3aZi1ImaXzgT48HhbcFH5C+yRlcQNwC5y6KWbM+
	UdOB4Gs1oJi9SsBi1ItWGqVnHBXFV83LNGZWY/osPS1VIuIovSujIKjjvIp/gn5viSeeJfK5s/QEn
	+PHZlaaCbzLzUQkqr9fGHOx/Qj3cZ8Zsezf59B62R0vLlxjNjluBr8ClY2pANufdvSFD5jg2b2BlD
	TeL1y25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQNd-000000097F2-2Jo6;
	Tue, 03 Dec 2024 10:43:45 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQHt-000000095b9-40vu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:51 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d0d186962fso2045806a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222268; x=1733827068; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7tOYZxQzwS2lgtsj/R92cF0vRMD/ffbTmBJ2Qyy7h8=;
        b=xHcY1jD+FW0VxMlfMq4/iFN4XOjqlcjpHaUBBqBDDMBmyLD7PA0nYCCLhrWDKtMf1u
         UBd9J7Tb6avmAwPAMUBUxltbiY1Rqm7olFGJVQND3/3vVhHntF+3CvgkBQaDt1Xj4gEJ
         EGmmHYUI58NmBFRQNWY8BanhybugEsNjLXdW8GKf4UIHUeQbOV1/2jLtVbjsFkwJaBqc
         Taz1HtA9G/rgI/ThjZ03+MM6zbegj2JtM1LhywRi3b0nsJg7hc2a+I5zUhf9vDafNRbV
         0c16xEIDgQToJ3YmHWcHI0RreRPZx4T+oFY6Sk6cuxw7wbGV/lacOD1/vBYSWNd31h1j
         3j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222268; x=1733827068;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m7tOYZxQzwS2lgtsj/R92cF0vRMD/ffbTmBJ2Qyy7h8=;
        b=ErmVy0u4aKXTZKk1CPhgSN9/F3lyJ6o+zYCIYCVdyWweEdYylJZSeA0PjAZjnRyaop
         9tUWDcI/atMxAV8xJWc3fn/GAP+jO21MnuuQ6vUfNLAq9MW76mn0Jylj9974M2ciU71s
         Ohhnj1bv8H2Eh9yWi+rt2fjfaBFMb6OK+nja22LlvUYrX3aztheGUCLzd0KzMaNLuO2l
         ip1ybt07isvzCkSNnJs4LK7luCkFfsT7gJRmaUpcT0YukLfR4YyzdfLyHnvc9aKrm/lU
         cfi+zBlH3AROyfgzSPq0XBfUbnPYRvfKcJbNnhG+vnZcJuUAs5pHFeCJk22iHuSuB/Fz
         FRzw==
X-Forwarded-Encrypted: i=1; AJvYcCVbNFAeoG5MIi23mg7nKE1C8qgipIzLn+r516Sjfuo11ZgBEGiF5HpVrjNAcM9uJKbPD3w6ShrpeRFvxUmVca65@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm+LcxRjBmzUKjNpYSww44i11dlS3mujK4lbiId1bdP1yoo+JE
	kIgvLGZccsueMscRg6YGDsgwmdMUSdVHcVOMeyHqlAHf7xYhwR26Sobr7tFuD5NX0DlSoBl4Wup
	KBvNYNA==
X-Google-Smtp-Source: AGHT+IE3xpes1v/Uc0j4pgJbHyJYCsHa1apqosK00O3zWfydKbAfCY5SFFSiIVSJTroNQjdKlzcHSaGmBrZh
X-Received: from edrt5.prod.google.com ([2002:aa7:d4c5:0:b0:5cf:cc2d:7de4])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:40d3:b0:5d0:c8f4:d1d5
 with SMTP id 4fb4d7f45d1cf-5d10cb553f0mr1671471a12.12.1733222268055; Tue, 03
 Dec 2024 02:37:48 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:22 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-6-qperret@google.com>
Subject: [PATCH v2 05/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
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
X-CRM114-CacheID: sfid-20241203_023750_001609_8AF399AB 
X-CRM114-Status: GOOD (  15.73  )
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
2.47.0.338.g60cca15819-goog


