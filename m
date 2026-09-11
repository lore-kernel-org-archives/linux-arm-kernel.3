Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4C2C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LydG6lpG7KGsYwDk/rwkNtgM8Oe883d29LLncn9eFg=; b=OrUOtB6HvQiZhi2JrVjR1z8AFE
	T2c5NA7T04/lBbZ7OO1QEbwx04fL0Kd6PRBCVqC3VsEzRNAI1/tQQ8BNc4iFWSzq+0FcyCRBc0tvq
	5+B07KsmXTT2vE1lKkP6uTUf1KKz2aoykueccocojGEFNaLScSDa+7jj5ztkEddiUxFUar//2iIb9
	oWDDH0/hjJ0GfMujM8D9NK+SLmAtAFZX5AWhOi4T8ZrfViMssVpxnh5BNVQOQ8W3gake/KD+bXfqM
	CbFIMikbGHsKCLw2tyicsjoTiPY9L2XiX4nhneWKegVDxlepFshkG1cUGKT3sfOlNZw5x2TAdIwqk
	h6xPPiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fM-0000000GoGt-3bAR;
	Fri, 11 Sep 2026 13:51:44 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51er-0000000Gnpv-3JIv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:14 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-482f763db88so428970f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134671; x=1789739471; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+LydG6lpG7KGsYwDk/rwkNtgM8Oe883d29LLncn9eFg=;
        b=mqrWwldC6lnVjK5NZIH4T5AdCGqaSo5gIg4ZJDyUOXc9nsIUbMdL8e3cPiNGrIb4fE
         TKsa13ozK+bVU6dl7pNlwQQjTIqNElKG8HSweR7qk5q2SRJ+yQPIOvy0H9fql11riT2k
         zQi1ctE5322Djb3QKda0rFdiMutWKuur64Eo4kY8otL2a2jP67JwZakIGK3/blJbQu+5
         SnNvzGWAnBq4C7J1+oiK/7trBOguUS3I0+qnBx04JFROQ6lj0df/Ya/I9Hd8KB+arrja
         IDlTHznXY2D/JqCJHDZpoQhswK8Gg0wTUeea7ZIqG8TAW6fzhsxCD8SZqSyKQGRCu5Tx
         kbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134671; x=1789739471;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LydG6lpG7KGsYwDk/rwkNtgM8Oe883d29LLncn9eFg=;
        b=Zas1i1FiTBWDKhC53CUVAoaV7PORyDayQDbEqQMaq7+3sgoLjzQIdaj1XOnReSheYs
         FJdXXYEI82XErVB4aja5HgFlxFvIUbVpMbqwKAx0drk4XXdaL3fqpjtGVR6Cav9ZWVpw
         MBfp8UDYIfzJ5BKfaMdgI6zL0+SCA+qP7a29fRoC61guy52/kPe/DG80T+nD/1B7gPx3
         e2vbvJA2UA+o2FumRM0zu+uc0TmvXQazH0NtwC7UxhggZ/8AX+avqx2lvtxikrt+kDVb
         POBo5oSGIvQStZbb+NOBHH+i37CM8/r5wVvEXDQ/JC4nGr1EHHbmcJ9SNiZzuxI5NN2g
         vgqg==
X-Forwarded-Encrypted: i=1; AKwUvBxPvr8K5jo8gZnjEvo0rabaY1KSkZ5nOoSULmBpfanUgZisOdwFKL+63k6V5YJr4Y1PWnsthnTdpWgfjDQZT0y4@lists.infradead.org
X-Gm-Message-State: AFuF++l36o8tFB6zfaXThfsMFoJBm6YUXPkcQY86pYG6ll6GQHw+nuDi
	Fiz9Q1n2fEKg0NxgHoOjqQUHmLfIucIMOFRofJAJU9sxHc8fHgBJmrqwt+r6PsJUuLVrInYA83t
	CGrzHZPPvkSK38zL+YNeM8g==
X-Received: from wmpl24.prod.google.com ([2002:a05:600c:898:b0:49d:2641:2abf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e0e:b0:49d:7f5:4cdd with SMTP id 5b1f17b1804b1-49e619d4d30mr54210355e9.27.1789134671360;
 Fri, 11 Sep 2026 06:51:11 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:39 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-9-vdonnefort@google.com>
Subject: [PATCH v2 08/22] KVM: arm64: Add a range to hyp_poison_page()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065113_843709_6B206DF7 
X-CRM114-Status: GOOD (  14.54  )
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

In preparation for supporting stage-2 huge mappings for protected VMs,
add a nr_pages argument to the memory poisoning mechanism. Use the
existing __apply_guest_page() helper which speeds up the process by
using a PMD_SIZE fixmap when possible.

Also, rename the function to hyp_poison_range() to reflect the new
capability.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 58ea0fa62226..642096b2e711 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1276,11 +1276,9 @@ static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *s
 	return 0;
 }
 
-static void hyp_poison_page(phys_addr_t phys)
+static void __hyp_poison_page(void *addr, size_t size)
 {
-	void *addr = hyp_fixmap_map(phys);
-
-	memset(addr, 0, PAGE_SIZE);
+	memset(addr, 0, size);
 	/*
 	 * Prefer kvm_flush_dcache_to_poc() over __clean_dcache_guest_page()
 	 * here as the latter may elide the CMO under the assumption that FWB
@@ -1288,8 +1286,12 @@ static void hyp_poison_page(phys_addr_t phys)
 	 * host stage-2 and would otherwise lead to a malicious host potentially
 	 * being able to read the contents of newly reclaimed guest pages.
 	 */
-	kvm_flush_dcache_to_poc(addr, PAGE_SIZE);
-	hyp_fixmap_unmap();
+	kvm_flush_dcache_to_poc(addr, size);
+}
+
+static void hyp_poison_range(phys_addr_t phys, u64 size)
+{
+	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
 }
 
 static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
@@ -1361,7 +1363,7 @@ int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys)
 	if (ret)
 		goto unlock_guest;
 
-	hyp_poison_page(phys);
+	hyp_poison_range(phys, PAGE_SIZE);
 	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HOST));
 unlock_guest:
 	guest_unlock_component(vm);
@@ -1389,7 +1391,7 @@ int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 	switch (guest_get_page_state(pte, ipa)) {
 	case PKVM_PAGE_OWNED:
 		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_NOPAGE));
-		hyp_poison_page(phys);
+		hyp_poison_range(phys, PAGE_SIZE);
 		break;
 	case PKVM_PAGE_SHARED_OWNED:
 		WARN_ON(__host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_BORROWED));
-- 
2.55.0.1007.g17ff1f9808-goog


