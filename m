Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDEBFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYUkAwnLJFRq1L2KWhPMCbl0fLNqeKRbzrqZSKodisQ=; b=YU5yv8FZHXk1W4Xv0hXMFjO02O
	6sLBjmso1M6hoz5uH+cKIIt/8wtAhok5vKpYJ4nmb8jvwzpsf1MtzsF0RozVJtamNdN5NVTYlez+i
	egdihQd49HRti7waqNiEuo9++NxDcoIBNlTr1Ah7ZGduJB+GONCqZb+DCFIj0vXu8+PoVwMeiYV/a
	8QMFwHu+FmyniVZxIyIwQu5hfgLybA4qLfg56aU3KKjMynfmIkWMGPhEVwJQUP13o7IaREbKPlPUA
	8tV5RAEUSVfQHfDZNK7lRV0yKP/+i3i4hZr4rFro9A1jILOpVpA6quPtZE6xHfcywhE5Fvdi6/kW7
	ZH5F4FDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhs-00000001AlZ-19iu;
	Tue, 28 Apr 2026 10:30:20 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHfhp-00000001AhL-0v0y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:30:18 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso125257595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777372215; x=1777977015; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYUkAwnLJFRq1L2KWhPMCbl0fLNqeKRbzrqZSKodisQ=;
        b=JFCL8/s0lUE8oh1aSzNSgCJlyyy7wmvGvm85fvbQ6YVxEbmu/hE7ie+0KvtX5e6W9x
         w801SUPYc52W+XmgLFXMP9YKhx+ZHL6DLA7N+7AvSUZPCLF8XP0sDuGV/NnC3uq791Hy
         v9VOetQ1oCqlwwcLZXOexxQXgguGb5i+Yl3gOKWstALXEuFXQi9NE1OQ1uEtjDCa1BJI
         5N7o1E7zBF2kylG2F9cZ0V4TJ2Pl/3tpHr3u1uHlO2xSJVU9CysrDe9pK0M5XWfdGOFr
         /b5cOTbaBtNHuYlfuKyXVVcXh11sKFm8GzLa9ki8y8Zhcx0HtzM7zKUnJgOPCTpTsoVG
         IpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777372215; x=1777977015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYUkAwnLJFRq1L2KWhPMCbl0fLNqeKRbzrqZSKodisQ=;
        b=GObajJKZVrYTZKBqkEq4qqr/f0cwu4C9wRh/IayRWPM5AmWC+3iILwxMyPIB0185FD
         nMjM3wyw5egFfntei2OkdczpP8uuI4k5zEsuG/daZXUz9osoAwvXraryzjJm8fuPBI30
         wQpngEUhfh5UZOSpRkiPxl0PkdE7S1Y+Sblkybdb34V/iU/hDud4Ev0Dtx/vA4adgUpz
         YmREdbE4eHLuhGUuA6Pa9BxQr4meaetg7pchKQLW9OQNDHv94EIv9V6iYj0rT6MlA7IF
         WThVijJb6zvJihBDNDU43J3h3rDH9x+Uv164VY76FELBQJAqcT9vlOAh6lF4pvUD+lUU
         TZBw==
X-Forwarded-Encrypted: i=1; AFNElJ+U4hqzXwKZnFjv2/Npe6G5RVBu1Br6yFUUZ+S2abrwYEQvirGbadg9AaDxMkidaS0Bqztzw5y4jm8FX5QcJXku@lists.infradead.org
X-Gm-Message-State: AOJu0YzxF/j+h+lmDBOCKwXsI5UQjJhTBCpdT+mcECulY3e6rSqizrUu
	gh9VGwo1Wg/jogAqvzGm6S8EGvjBzAM0Frus8g/PmQXjrQmIj1z39QwmyatZzPChLeTUDPU2gUu
	51w==
X-Received: from wrou16.prod.google.com ([2002:adf:ed50:0:b0:445:adc5:751d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b15:b0:489:1f3e:5f6f
 with SMTP id 5b1f17b1804b1-48a77ae5502mr42869535e9.12.1777372215150; Tue, 28
 Apr 2026 03:30:15 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:30:05 +0100
In-Reply-To: <20260428103008.696141-1-tabba@google.com>
Mime-Version: 1.0
References: <20260428103008.696141-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428103008.696141-6-tabba@google.com>
Subject: [PATCH 5/8] KVM: arm64: Propagate stage-2 map failure on host->guest share
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_033017_275442_76AB4CDD 
X-CRM114-Status: GOOD (  16.87  )
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

__pkvm_host_share_guest() mutates the host vmemmap for every page in
the range (sets PKVM_PAGE_SHARED_OWNED and increments
host_share_guest_count) and then calls kvm_pgtable_stage2_map() to
install the guest stage-2 mapping. The stage-2 map's return value was
wrapped in WARN_ON() and otherwise discarded.

At EL2 in nVHE/pKVM, WARN_ON() is not warn-and-continue: it expands
to a BRK that enters the invalid-host-el2 vector and branches to
hyp_panic(), declared __noreturn. WARN_ON of a reachable failure at
EL2 is a panic primitive, not a debug aid.

kvm_pgtable_stage2_map() can fail in reachable ways: the stage-2
walker requests fresh pages from the caller's memcache and returns
-ENOMEM when the memcache is exhausted mid-walk. The host controls
the vcpu memcache via the topup interface, so an under-provisioned
share request converts a recoverable error into a fatal hyp panic.

Capture the stage-2 map return value and propagate it. The walker
may have installed leaf entries for some pages in the IPA range
before failing, so unmap the range to clear any partial mappings;
otherwise the guest would retain stage-2 access to pages the host is
about to reclaim. Then roll back the host vmemmap mutations from the
forward pass: the forward pass increments the count by 1 on every
page, and the only forward state transition is OWNED -> SHARED_OWNED
(the count 0 -> 1 transition). The reverse pass decrements the count
and, if it drops back to zero, restores PKVM_PAGE_OWNED. Pages
already SHARED_OWNED with other sharers (count > 1 after the forward
pass) only need the count decremented.

Fixes: d0bd3e6570ae ("KVM: arm64: Introduce __pkvm_host_share_guest()")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 30 ++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 28a471d1927c..7044913a0758 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1458,9 +1458,33 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 		page->host_share_guest_count++;
 	}
 
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
-				       pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
-				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+	ret = kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
+				     pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
+				     &vcpu->vcpu.arch.pkvm_memcache, 0);
+	if (ret) {
+		/*
+		 * Stage-2 map can fail mid-walk (e.g. -ENOMEM from the
+		 * memcache), leaving partial leaf entries installed in the
+		 * guest stage-2. Tear them down before rolling back host
+		 * bookkeeping; otherwise the guest would retain access to
+		 * pages the host is about to reclaim as PKVM_PAGE_OWNED.
+		 */
+		kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size);
+
+		/*
+		 * Roll back the host vmemmap mutations applied above. A page
+		 * whose host_share_guest_count is now 1 was PKVM_PAGE_OWNED
+		 * before this call (count 0->1, state OWNED->SHARED_OWNED);
+		 * undo both. A page with count > 1 was already
+		 * PKVM_PAGE_SHARED_OWNED with other sharers; only the count
+		 * needs to be decremented.
+		 */
+		for_each_hyp_page(page, phys, size) {
+			page->host_share_guest_count--;
+			if (!page->host_share_guest_count)
+				set_host_state(page, PKVM_PAGE_OWNED);
+		}
+	}
 
 unlock:
 	guest_unlock_component(vm);
-- 
2.54.0.545.g6539524ca2-goog


