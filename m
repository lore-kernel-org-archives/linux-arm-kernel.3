Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8288F0183A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrYglMPFnkSqWiX5InhsukY4+nR7R4qhDkeT1Y7YXwI=; b=XNGDBUDL10qZMx2goaBv1KIG32
	DjjRNjUJv9k0J/XbnKXipFJefIFXTZHdA8Q3piMiXmUfY0uqxUsy0GeEUQkn6nmEM0iYRkCr9gDvD
	Nap7Cq9OP1+mXX/wraRvr2/L0RIlzbgDMTt3rosIEo1Sv/dJZIJrr3hKt7aqbCYpY1kK0wuiDtF36
	gHqJqWjOCvc8vFqyAwCea0qIdTQuVpb69ES0b1v0rLo/1VwCAm3isWIkfedr+IIVVG+TLx/+MkXfX
	cYRd42/RNL1oWp828L5cK4fihBhF21oF18ubkqSA0BRArZhSZMze2qxx3c9OScO9Hh3SCzXjAVqLQ
	6ZCpAXdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlf-00000003qTX-3cDw;
	Fri, 06 Mar 2026 14:03:03 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlV-00000003qGh-2qRL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:55 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6613f3c484aso2023930a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805771; x=1773410571; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrYglMPFnkSqWiX5InhsukY4+nR7R4qhDkeT1Y7YXwI=;
        b=oWqdq7zTeDB4DMNSQU0UNb9xNi+izBuMLQEmsx2Mgnp3min8A0MiDxVgRxGVyGhikW
         rYtglgR5+T69su12E34orSyjTfIde8pm2+tSgB0TwkNBhWgSqIPqLZxVe6edLGkfk2Mf
         6or+5dbWWKnAjIyKiK6658PlncwLIiJF0UdBmFS0L12MW2o3T94+W9cZl5fMhO6IBUYN
         eWtgts/vMD0U9VMhXBgdE7LIWQICfLWUXUY6cG8BJYP5uPl0XsbPmkeSt/Iv6jBdlS6E
         P2rrLMg48YHovnkS6wx2Qy1vB9WLNWIy9GSabDN7/bCnwaxO84o+nhdkYaoNccfG7ukm
         jdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805771; x=1773410571;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrYglMPFnkSqWiX5InhsukY4+nR7R4qhDkeT1Y7YXwI=;
        b=YceVwijVibIpuUZLqZNsYqafAa61ytH0TSja59EXoU77wv/X1hc0h/ctSPgv/b4oT1
         Ye2BuC+yPj7d2LRh/AH85K7vSm/BEKkiE4/tVf+rShjZTLu+eAOYhDhYJVZyUJkI0kRQ
         B9yjoc2O8GezVljRx7SgMxDfFeLGmdZHPETp7HaeKCpbl5IB5yX73BK0jnpoh++kVeK5
         qgeEamJLoP8LsnI+OLij+55P166xO5frIhOLT+CBtUsmjtUib0wWZcDZL98TpF2vO67C
         WmtsaeSmHOLmhksiqPiKZ9QQGN++t5CMwkoSlRsHb0ISAz+XrPifUoLBLEx8PN+JWKgh
         0LzA==
X-Forwarded-Encrypted: i=1; AJvYcCXqH1+58zCRX9xo0xMR/+7rYQw9HNwJWurTj6AsR0Ze/iG/esR0oWPYfyJsrr584eP0gDFa0iFdwqkl91iwmeAf@lists.infradead.org
X-Gm-Message-State: AOJu0YyYbWzWn4B144O9qRYSKfaGWcfQCTcA6mZ2OEV3mXwz6YhY+jLC
	sbPlwjPpbkKIH/R8VdTEVfI5AWRv9FNSwQe3qg9oR5ECLUPLRVP3ty077U6TaQegPGJsqy4BPJz
	7pA==
X-Received: from edrc1.prod.google.com ([2002:aa7:d601:0:b0:660:cb32:1c97])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:354f:b0:660:d9c1:1919
 with SMTP id 4fb4d7f45d1cf-6619d51ea6cmr1251752a12.18.1772805770063; Fri, 06
 Mar 2026 06:02:50 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:32 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-14-tabba@google.com>
Subject: [PATCH v1 13/13] KVM: arm64: Clean up control flow in kvm_s2_fault_map()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060253_766587_C46F3E98 
X-CRM114-Status: GOOD (  14.89  )
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

Clean up the KVM MMU lock retry loop by pre-assigning the error code.
Add clear braces to the THP adjustment integration for readability, and
safely unnest the transparent hugepage logic branches.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index cc6b35efcee5..5542a50dc8a6 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1897,10 +1897,9 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 
 	kvm_fault_lock(kvm);
 	pgt = fault->vcpu->arch.hw_mmu->pgt;
-	if (mmu_invalidate_retry(kvm, fault->mmu_seq)) {
-		ret = -EAGAIN;
+	ret = -EAGAIN;
+	if (mmu_invalidate_retry(kvm, fault->mmu_seq))
 		goto out_unlock;
-	}
 
 	/*
 	 * If we are not forced to use fault->page mapping, check if we are
@@ -1908,16 +1907,17 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 	 */
 	if (fault->vma_pagesize == PAGE_SIZE &&
 	    !(fault->force_pte || fault->s2_force_noncacheable)) {
-		if (fault->fault_is_perm && fault->fault_granule > PAGE_SIZE)
+		if (fault->fault_is_perm && fault->fault_granule > PAGE_SIZE) {
 			fault->vma_pagesize = fault->fault_granule;
-		else
+		} else {
 			fault->vma_pagesize = transparent_hugepage_adjust(kvm, fault->memslot,
 									  fault->hva, &fault->pfn,
 									  &fault->fault_ipa);
 
-		if (fault->vma_pagesize < 0) {
-			ret = fault->vma_pagesize;
-			goto out_unlock;
+			if (fault->vma_pagesize < 0) {
+				ret = fault->vma_pagesize;
+				goto out_unlock;
+			}
 		}
 	}
 
@@ -1951,7 +1951,9 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 	if (fault->writable && !ret)
 		mark_page_dirty_in_slot(kvm, fault->memslot, fault->gfn);
 
-	return ret != -EAGAIN ? ret : 0;
+	if (ret != -EAGAIN)
+		return ret;
+	return 0;
 }
 
 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
-- 
2.53.0.473.g4a7958ca14-goog


