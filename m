Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7961CFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeB2s/TMGphof+D0QG47UlxNIiB+La++tp7fDFhGihQ=; b=BJAapI311n5X2u1HXupomBR+dL
	cjaVYwIp8RTuKuo697niSvhyxbbhQV1xRUCDF5t/yOmNDfBE/TE9d69gy3Kvi57Qp/xzU3vJ1HxEa
	JbT2kS+YGYYR/a9zAbmlAYb3Z8b/PcBTKQAK8ub+UVSRjz5YUxf+XKjrpc8EWlETgZqUE5gOH5+MY
	JDpxiZ1tq1uRuykFq2ZUKNWQgjAED74EV/m/EVP1JJbhbzZgD0W6lNj7rOKR9yZEAwFNvprBH1pDb
	+iXcrW5ZAWyZef58wMxplHlcfv7F7aKhy/Zu6Xc9Il/m+1I4oHtVmXxJoeD34uitHwtrlPdsmUf0y
	DqS7nkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfi9-00000001Awv-3uZl;
	Tue, 28 Apr 2026 10:30:37 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhr-00000001Aj0-1jxR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:20 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-441243ba35fso6324791f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372217; x=1777977017; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WeB2s/TMGphof+D0QG47UlxNIiB+La++tp7fDFhGihQ=;
        b=T7o23Cd6Z3H0+frXZT90O1AmrqHFttTSND2ywG/V1ajHIySgEW61ymp+lVmYfCYCRx
         eZEXT/e8RqXOdcXqaLxqn29+sNLM0cCpdmVSG75Z4nfPxYwmuGj7qIfOWhb7i2ATn7y1
         et6FVpMZwz8rDqXUpP/IL0BlsDR5nmYRQ4tOtA2Lw5pwrsfv/scThZl5xaRPe/9DQLUA
         /+2ZgQxXN/lN5pJsU4xj99XD5+6vF4ToPpMvGqongaAgVJf/5/Q5Zlh2sLRyxCkD2kMu
         j8aGEQPcvcCEDI+84pAQdHtV8GUp2jyYtzEuq3qkX7KzJZ/uTcBVGmPOgYzz9lGU5zi3
         ceYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372217; x=1777977017;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeB2s/TMGphof+D0QG47UlxNIiB+La++tp7fDFhGihQ=;
        b=L9sYi6beRWgUt+51PCoWSUyTizTjeV/gPGu50+95ZypwH3+GdRs1S4lJfmj7Egfss9
         +8Umx0ehKxnnCvcVm7ttA13EaqrrJnFg+u2p9E9+3Tqh0XWiVWcNMNUAcH0jkI1FXv1C
         lMRIqZ3D4J3FqmV9+pB36W4X/g/pBG8MIZPUPfEDRSMGcNDunD+GswHLD8wKBuaeOgis
         GKrIzNw55GmEK0js3yolxXlF3tZFVudkmlaND4HjhSTpGqc7RHu6LDUfyh6/Mr1S95QP
         albPBDgsXtGq/A5ZkAodCQW3Dz/TkSaiPpWlF/qmgr/1tx9qh2gCZZa1h6dHaGol9f9A
         a2FQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BDcgqTx7UWURJ1IFLva/A5ze27sTl+08vxZO+ovrZFnWFx3Fz8+z4KkOW0G+j0TfQiHDFGAZO8igcsX8SxODV@lists.infradead.org
X-Gm-Message-State: AOJu0YwLvvWo2+dy6RZe/kRuGqQXygcVn/oJfqB5CxZTj8141EfsXZs5
	Aj5QxQwH9wt7z0L9dXpco8HMc2u7wmJUCsioWa+FRdmcNlxW0zq1pa6bf5h8PBY31akzg15Jb+5
	CrA==
X-Received: from wrdf9.prod.google.com ([2002:a5d:58e9:0:b0:43f:e626:ada7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1865:b0:43d:6e0:9458
 with SMTP id ffacd0b85a97d-4464aa09351mr4498102f8f.39.1777372217076; Tue, 28
 Apr 2026 03:30:17 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:07 +0100
In-Reply-To: <20260428103008.696141-1-tabba@google.com>
Mime-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-8-tabba@google.com>
Subject: [PATCH 7/8] KVM: arm64: Propagate stage-2 map failure on guest->host share
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_033019_471486_55E89639 
X-CRM114-Status: GOOD (  16.93  )
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

__pkvm_guest_share_host() updates the guest stage-2 PTE for a
guest-OWNED page to PKVM_PAGE_SHARED_OWNED via
kvm_pgtable_stage2_map() and then transitions the host vmemmap and
stage-2 PTE to PKVM_PAGE_SHARED_BORROWED. The map's return value was
wrapped in WARN_ON() and otherwise discarded.

At EL2 in nVHE/pKVM, WARN_ON() is not warn-and-continue: it expands
to a BRK that enters the invalid-host-el2 vector and branches to
hyp_panic(), declared __noreturn.

__pkvm_guest_share_host() calls get_valid_guest_pte() before the
map, which verifies that a valid last-level (PAGE_SIZE) leaf PTE
already exists for the IPA. Because the leaf and all intermediate
tables are in place, the subsequent kvm_pgtable_stage2_map()
replacing it cannot fail via -ENOMEM: no block to split, no new
tables to install. The failure path is not currently reachable.

Nevertheless, WARN_ON() on any fallible call is the wrong pattern at
EL2: if the get_valid_guest_pte() precondition were ever relaxed, or
the walker gained a new failure mode, the WARN_ON would convert a
recoverable error into a fatal hyp panic. Capture the return value
and propagate it. The unmap() is kept as a defensive guard for the
currently unreachable failure path; no host-side unwinding is needed
since the host vmemmap and stage-2 update is the next step and is
correctly skipped on error.

Fixes: 03313efed5e2 ("KVM: arm64: Implement the MEM_SHARE hypercall for protected VMs")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index b8c57a95e9bf..6fb546af699f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -979,10 +979,23 @@ int __pkvm_guest_share_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 	if (__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE))
 		goto unlock;
 
-	ret = 0;
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
-				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
-				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+	ret = kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+				     pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_SHARED_OWNED),
+				     &vcpu->vcpu.arch.pkvm_memcache, 0);
+	if (ret) {
+		/*
+		 * Stage-2 map can fail mid-walk (e.g. -ENOMEM from the
+		 * memcache), leaving partial leaf entries in the guest
+		 * stage-2 transitioned to PKVM_PAGE_SHARED_OWNED. Tear
+		 * them down so the host does not see a partially-shared
+		 * mapping it has not yet acknowledged via the host
+		 * stage-2 update below. No host bookkeeping needs
+		 * unwinding here: the only mutation prior to the failed
+		 * map is the (now-discarded) guest stage-2 update itself.
+		 */
+		kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
+		goto unlock;
+	}
 	WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
 unlock:
 	guest_unlock_component(vm);
-- 
2.54.0.545.g6539524ca2-goog


