Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26871C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktkS4XskSt/ldoD432h3UVfIavH2avWaXTLdCBUmGII=; b=UTCrZrRYV9EAH/3gA5gp224B/F
	qaPV5U6NI9iwtZi77VBSSR7xpFeGdDvwg5tS8/s7QmUc81M8XCQ07PkAYcNPiYpzqTtpPG9CSE28e
	Xi4Ochga5a8bS9OTcmn2r0LhmfhN1q/ekiZ+7fi7cV6J4cfEePZJKJdhblVQGbUtAFyCxDpDBfpSy
	raXAuKwYwzqhOV1oQQHDdxrCONSfKjloiK2wk/Y8YRhjs9RpFBBtFN5qSA+NV6oJmMDoW6dtbq7GC
	vaZWblq6lU9PpFWlLxPb8zXDr2dbPb7MdQ3XOQQtHHJlvRgRieVYHHAXJ0IjUkxub88GxAZSM8KIu
	cKTFyb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtoC-00000000Izj-3NTT;
	Tue, 29 Jul 2025 23:32:36 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEg-00000000Dqs-407l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:56 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2c37558eccso4164431a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829754; x=1754434554; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ktkS4XskSt/ldoD432h3UVfIavH2avWaXTLdCBUmGII=;
        b=iySlrhW16m14nCcLqPnRmXYR4JZ/D6Xk3N16geSDwnJ+yULnfXudWwBty879sCoxwV
         TzpnCLSpDQrVWDyHqr1diT+U4ve/jz3xZXfIDfCO+zKkkPTiXx4JJpOp9mxOpnYqp0px
         JCg3TTJh50La3oGqIajXXSOGQzqZIR5zpgC6MDJknBqr+hNmLCN+H7GBW4O6LslCXtK8
         llNg1N1e/zU24cCPXmCvMuP/0LqO4Mqf43EvpEqFuBuLjVWPVnEW2Y3uoiaJXUhpZhR5
         /okb+H5wjv0WFlBMotI5NGghGv4hDsn6eS1XWP/uA2B4T3Lh74+nQ7+tPappMzFdtLUV
         PvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829754; x=1754434554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktkS4XskSt/ldoD432h3UVfIavH2avWaXTLdCBUmGII=;
        b=Tn7dGlKUv9iuHAQjAly3dvPGPPBaDeCVmEaFP6zX4s6JTijkmbOO4HrXC3sTKvNXhP
         1YN4ouvIDwrqibQEWrfqNZGFGu2C5U0MZoG89n9v5ae+iiG86SDHtCXmSRMGmhRNGNYn
         laqrU/SkzpVYD9W9jwC7iw/zrTRKyYOpYeRDIncGLFk46jwiqEeg9dV+3CQPJ29rGEN5
         RdeS9aY9KAgj/3Y1NHRBsdEr+i+JNMd+R3c++qFHkBIuEAbBNyikCw2x7a6/Fo8Y2vAf
         9K19DwaAo3+asBSwkMM47lEuOwqFZWaJAgx6eZce9T0G63KDSfP3DUlno5gMGFD6A+4P
         IuTg==
X-Forwarded-Encrypted: i=1; AJvYcCUZISXB8GC/dV8B/pwyxQNwAcbS6VK/GijRxcpEcEuACbjbQ1FSwOTBEQfttL6m4MapQ1EXgIeG32JxsxQGh1tL@lists.infradead.org
X-Gm-Message-State: AOJu0YzFA+N+wfv4nXWr8vWhSZakEAI4AFfXJm5HpAU4aPV+Z7QbOFDE
	801QsXRIqJ5703dTbs8E4WOKcL77WFyZLia0xV3GOFdzmg8kPlwa6MMUv3c+Xvz7a/AiS/s8Caz
	vuVti1g==
X-Google-Smtp-Source: AGHT+IF1LeGDZhIWjFUGooq7VUSMoBrDEWnqlrxEZEjVnkOZOM3/aPj5utdyv/03YLi7nQKPITTKBEyZftA=
X-Received: from pgbdp2.prod.google.com ([2002:a05:6a02:f02:b0:b3f:2e87:230b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3c90:b0:232:93c2:8851
 with SMTP id adf61e73a8af0-23dc0d5e0b5mr1613137637.18.1753829753942; Tue, 29
 Jul 2025 15:55:53 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:44 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-14-seanjc@google.com>
Subject: [PATCH v17 13/24] KVM: x86/mmu: Hoist guest_memfd max level/order
 helpers "up" in mmu.c
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155555_001689_8F7F0CA1 
X-CRM114-Status: GOOD (  10.39  )
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

Move kvm_max_level_for_order() and kvm_max_private_mapping_level() up in
mmu.c so that they can be used by __kvm_mmu_max_mapping_level().

Opportunistically drop the "inline" from kvm_max_level_for_order().

No functional change intended.

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 72 +++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b735611e8fcd..20dd9f64156e 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3285,6 +3285,42 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	return level;
 }
 
+static u8 kvm_max_level_for_order(int order)
+{
+	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
+
+	KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
+			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
+			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
+
+	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
+		return PG_LEVEL_1G;
+
+	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
+		return PG_LEVEL_2M;
+
+	return PG_LEVEL_4K;
+}
+
+static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
+					u8 max_level, int gmem_order)
+{
+	u8 req_max_level;
+
+	if (max_level == PG_LEVEL_4K)
+		return PG_LEVEL_4K;
+
+	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
+	if (max_level == PG_LEVEL_4K)
+		return PG_LEVEL_4K;
+
+	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
+	if (req_max_level)
+		max_level = min(max_level, req_max_level);
+
+	return max_level;
+}
+
 static int __kvm_mmu_max_mapping_level(struct kvm *kvm,
 				       const struct kvm_memory_slot *slot,
 				       gfn_t gfn, int max_level, bool is_private)
@@ -4503,42 +4539,6 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
 		vcpu->stat.pf_fixed++;
 }
 
-static inline u8 kvm_max_level_for_order(int order)
-{
-	BUILD_BUG_ON(KVM_MAX_HUGEPAGE_LEVEL > PG_LEVEL_1G);
-
-	KVM_MMU_WARN_ON(order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G) &&
-			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M) &&
-			order != KVM_HPAGE_GFN_SHIFT(PG_LEVEL_4K));
-
-	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_1G))
-		return PG_LEVEL_1G;
-
-	if (order >= KVM_HPAGE_GFN_SHIFT(PG_LEVEL_2M))
-		return PG_LEVEL_2M;
-
-	return PG_LEVEL_4K;
-}
-
-static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
-					u8 max_level, int gmem_order)
-{
-	u8 req_max_level;
-
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
-
-	max_level = min(kvm_max_level_for_order(gmem_order), max_level);
-	if (max_level == PG_LEVEL_4K)
-		return PG_LEVEL_4K;
-
-	req_max_level = kvm_x86_call(gmem_max_mapping_level)(kvm, pfn);
-	if (req_max_level)
-		max_level = min(max_level, req_max_level);
-
-	return max_level;
-}
-
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-- 
2.50.1.552.g942d659e1b-goog


