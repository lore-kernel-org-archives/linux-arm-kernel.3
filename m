Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7436DC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYU32RrZwSVxBTFJfFZ/zcmulUROASDhu21QhFFvtpI=; b=xGtCkxuVpVyRi5I6vX07a0Y2Uo
	nLWzePt6jFUYRRyOtEtqLjTswgeBZzHrk8MlAwhNQhn6yLd5YWgaY1vF6ktUNzSYVOwdkDScP1R7b
	2ciQreAMnO+l0oU2vDB2BGtLCimRBM0FiehYx8a45bckIyy3f/q4YZzT3FZT8jCRbKsRcAq82rScE
	PhnbaooMHxeI/DO5AKCPglvfYRU3OhKDeR88IfTfnEKIWGXOOYYSyNspSHMhJyVPQaRaC+wfy8jIr
	+Onctuben9c8XZ2XzwCEtdUn0lESI0SdOpY1tL45YG0vO03Pqvgz0PChR2eKv3CSl7KzgzOfUHao6
	1w8cqRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55Ua-0000000ADuL-0lZr;
	Wed, 16 Apr 2025 16:20:04 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54fK-0000000A4V7-1G81
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:27:07 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ac3dca41591so620225966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817224; x=1745422024; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYU32RrZwSVxBTFJfFZ/zcmulUROASDhu21QhFFvtpI=;
        b=2JoYKOOC3Ty8+o4gxrB+VHna1bOvuXqBxrQo30yWLx3z3a8ghQ8EapiTjUYvTGzyHp
         fAOqkTxpTzc+c8CUOtH//fbJZCYT7TA9a2KineCx7PHP4lEF/VtkeXXp3wCodbsGBIKo
         jNSWQgGWI44a4DkgtRGIvbuikomdfO7BvgPmz5K75yNTS/l0zO65WYMTUfo4OMo7D5QU
         OFKucFN2c5/U7dYEMYk2hY5KAp0Lp2T0f06aWwL19ly2AOemQiD/LN8eg13Kt7JUM/nr
         Okc07IauTfWATNebcpP3NEV5D1d156ScEuSGeZ4py+iztxPltaH7mTtyV85GoGB7D0OG
         tDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817224; x=1745422024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYU32RrZwSVxBTFJfFZ/zcmulUROASDhu21QhFFvtpI=;
        b=LJa7OqiCMNEl2lab6lEOzHlhOBaOIuAKuwgqTmokw3BDxI/fUZRqtUzd4YICaE+8dS
         JFL8Zx5eG8ZfHn7eSJwWQnvHiFqP6a08z0g13IiYhc4k/xJauhsswRsqkCPCQjDULG/v
         C6SI1uO4jS7/s29LiPoRpd3AeUk2/jZZJQMiVnGd/W0fh9V9zM50Md47i+qz7tlEGaxR
         heem+EJh100ZqmAl1AzHZ25nRFaQt8LZwSqUlhYDKiN6XcUdkT6eHbmqIXcQncbmDr/9
         jpgyTzZ2lD9hNhhHyL0JdaUPf0ocA8J2aU3pk1z6pF/1PKkOsKceKu971KhPph9L95xN
         Yv+g==
X-Forwarded-Encrypted: i=1; AJvYcCXcaIS2oKVHWq4MfMLAtA2FEEL3EP7Q50i0jiFiAPHCWKs7I+O/LrrgNCI8D2bv/cn74hpcC7kYV9xeKRvhvydw@lists.infradead.org
X-Gm-Message-State: AOJu0YwPl62/jt5baCqX/zbLfEKLqXcycw1OSQ7E0QOUniQUVb/qdFRv
	f0MnjClgzw/Ee+aSlcTJQ7yX2DWg8q6b1tKDz2LwOfHRMF2chukIiT5zRLeyoKaClXHl8YnX64u
	DZ+3nrQ==
X-Google-Smtp-Source: AGHT+IFx/wZB15eiIdBs2Eh1Wi5DlZDuOgycITN7QmUrR/0Pho2JFdCK7PrHfR8mLm6W9F5WKdLs/Vk8CDxe
X-Received: from edyc19.prod.google.com ([2002:aa7:df13:0:b0:5ec:dada:a73e])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:478a:b0:ac7:cfe0:3014
 with SMTP id a640c23a62f3a-acb4296492fmr220940266b.25.1744817224502; Wed, 16
 Apr 2025 08:27:04 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:46 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-7-qperret@google.com>
Subject: [PATCH v2 6/7] KVM: arm64: Defer EL2 stage-1 mapping on share
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_082706_348553_C235F749 
X-CRM114-Status: GOOD (  12.13  )
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

We currently blindly map into EL2 stage-1 *any* page passed to the
__pkvm_host_share_hyp() HVC. This is less than ideal from a security
perspective as it makes exploitation of potential hypervisor gadgets
easier than it should be. But interestingly, pKVM should never need to
access SHARED_BORROWED pages that it hasn't previously pinned, so there
is no need to map the page before that.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 25ff84c053c1..91b757e3fb4c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -693,7 +693,6 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
 int __pkvm_host_share_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	void *virt = __hyp_va(phys);
 	u64 size = PAGE_SIZE;
 	int ret;
 
@@ -710,7 +709,6 @@ int __pkvm_host_share_hyp(u64 pfn)
 	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
-	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
 
 unlock:
@@ -742,7 +740,6 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
-	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
 
 unlock:
@@ -818,6 +815,7 @@ int hyp_pin_shared_mem(void *from, void *to)
 	u64 end = PAGE_ALIGN((u64)to);
 	u64 phys = __hyp_pa(start);
 	u64 size = end - start;
+	struct hyp_page *p;
 	int ret;
 
 	host_lock_component();
@@ -831,8 +829,14 @@ int hyp_pin_shared_mem(void *from, void *to)
 	if (ret)
 		goto unlock;
 
-	for (cur = start; cur < end; cur += PAGE_SIZE)
-		hyp_page_ref_inc(hyp_virt_to_page(cur));
+	for (cur = start; cur < end; cur += PAGE_SIZE) {
+		p = hyp_virt_to_page(cur);
+		hyp_page_ref_inc(p);
+		if (p->refcount == 1)
+			WARN_ON(pkvm_create_mappings_locked((void *)cur,
+							    (void *)cur + PAGE_SIZE,
+							    PAGE_HYP));
+	}
 
 unlock:
 	hyp_unlock_component();
@@ -845,12 +849,17 @@ void hyp_unpin_shared_mem(void *from, void *to)
 {
 	u64 cur, start = ALIGN_DOWN((u64)from, PAGE_SIZE);
 	u64 end = PAGE_ALIGN((u64)to);
+	struct hyp_page *p;
 
 	host_lock_component();
 	hyp_lock_component();
 
-	for (cur = start; cur < end; cur += PAGE_SIZE)
-		hyp_page_ref_dec(hyp_virt_to_page(cur));
+	for (cur = start; cur < end; cur += PAGE_SIZE) {
+		p = hyp_virt_to_page(cur);
+		if (p->refcount == 1)
+			WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, cur, PAGE_SIZE) != PAGE_SIZE);
+		hyp_page_ref_dec(p);
+	}
 
 	hyp_unlock_component();
 	host_unlock_component();
-- 
2.49.0.604.gff1f9ca942-goog


