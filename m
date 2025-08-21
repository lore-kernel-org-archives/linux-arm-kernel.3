Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0608CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8p7YeBTxxS/VBPTvK9WSiN+wfsnNOjaE+88NekfQ6+E=; b=ryJ4xJuBneg0XMnzLVZrYmFC27
	qWQMFH7LwueYskKS8EGu5dRMrmndHEcWeGZfaCWCwJvm/nXLsqKfCoBSORr9sobyFhdPEmB6s9c0k
	OFySDExwg2TgQuvQJRN4plDSwmek/wsAEUL5PsxmANLrEL8ysR5K/PwCVQygoeyuEzW7+cTUX21yD
	VC4gPjIhXnYBTt/wDjR0EowVduVhQC0Yuw1gTN240Qxhn6pegjqwI2LkDrKDDOlvBwPfrTUTvNoFM
	CGeYJ6sCUV52ZLk2p2PLBBqFIIiLqszRwUPGMehui2/hc62Q9IqtwbG5dUgK+bOdkGLXq03859YFa
	6SBRCeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHcv-00000001I4m-0d6E;
	Fri, 22 Aug 2025 02:35:37 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCOw-00000000bT6-0aMf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:00:51 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-76e2e614c60so1259777b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810049; x=1756414849; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8p7YeBTxxS/VBPTvK9WSiN+wfsnNOjaE+88NekfQ6+E=;
        b=cymnJjXjPjoDRjjsi+qxyZIUUSTs4E8SR3fprZ5fB+L//RWH2wSAxNtDEBFxoQ17kw
         teGyfQi3YNilXPHJxee/Y2zYVLq/6qupUeRioXLYSx9HUhoBRWAMsQSpvex/X1fBpJxq
         s98ZCDf/cOCnI4hlUwwQ6sM9WaX3pYnSqOkYbvzieNCjIeYahXQvuugmVV2MOyj78veM
         2v8J5lAJyF5rUG9S2sWfcBbMq4g7fSJIzQ5pmK/1WgnlA+Uiip+f6lSqozxju9RjqEzN
         StU+nS8Iq3esNiJB7Py4YjoqsqJP6SXQCnqu5pe9qGEce0jOW5AJDkNNnR8fUzHvVGLr
         +BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810049; x=1756414849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p7YeBTxxS/VBPTvK9WSiN+wfsnNOjaE+88NekfQ6+E=;
        b=I97Kftdo8SY+ZKA3/VA5IDGbjIDucGiffxcBYHSKgyzcn7TCkeW87ii2bS4hvhbYOo
         N4CdmozOQR92b544gUAUzBmWN6h8e4NPHbdRo0oSa3ceE7NHUys/TDfIHNQJb/h/DHje
         8r2Zb/0wGK4LolY0XKpYevT10RaDyxJ8AKB31JtWWwkDjSir4gFn3g1qN2NQVW2tNuZh
         yXS6gjbWkXqDtYoeBneC2Bf+zMtO07EADqlgh4DrAB8P5iWvaWPlQXibE4UI3giftGBf
         1zb0mAP2WRVVLGrhvgWXxxxls2G3DfuTgJ8YAwuMZRBe1GjYAYrWfittH16C5JwjS2lT
         JVmA==
X-Gm-Message-State: AOJu0YxjvL8NWpV3eFKDA6FWRVjjZLhO75shLle45yd1nur3Di98MN9o
	HyZUjWtyIvhkDhNNz3IPdzgW0mCQNJm4Y1jUF07ikAweNh2YlfnQYoO6fIeWFHPx1oZq7sIle3T
	SWjQZpQ==
X-Google-Smtp-Source: AGHT+IGt2jvAqXlXksEez/FBRFt8Sle4R/dEKQftz/3BlDA59KSR9+VVS2FqW+adpYm0FOfYkSzrZkam6NE=
X-Received: from pfbbq19.prod.google.com ([2002:a05:6a00:e13:b0:76c:2dcd:fdde])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a8e:b0:76c:1eae:fd30
 with SMTP id d2e1a72fcca58-7702fa02d0fmr1050269b3a.12.1755810049097; Thu, 21
 Aug 2025 14:00:49 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:28 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-3-seanjc@google.com>
Subject: [RFC PATCH 02/16] KVM: arm64: Get iabt status on-demand
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140050_177076_74126D7B 
X-CRM114-Status: GOOD (  14.13  )
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

Query if an abort was due to instruction execution only when necessary
in anticipation of factoring out the SRCU-protected portion of abort
handling to a separate helper.  The happy path doesn't need to check for
IAB, and eliminating the local variable will avoid having to pass a
large pile of booleans to the inner helper.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index dc3aa58e2ea5..1e3ac283c519 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1830,7 +1830,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
 	struct kvm_memory_slot *memslot;
 	unsigned long hva;
-	bool is_iabt, write_fault, writable;
+	bool write_fault, writable;
 	gfn_t gfn;
 	int ret, idx;
 
@@ -1856,8 +1856,6 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	if (KVM_BUG_ON(ipa == INVALID_GPA, vcpu->kvm))
 		return -EFAULT;
 
-	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
-
 	if (esr_fsc_is_translation_fault(esr)) {
 		/* Beyond sanitised PARange (which is the IPA limit) */
 		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
@@ -1869,7 +1867,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		if (fault_ipa >= BIT_ULL(VTCR_EL2_IPA(vcpu->arch.hw_mmu->vtcr))) {
 			fault_ipa |= kvm_vcpu_get_hfar(vcpu) & GENMASK(11, 0);
 
-			return kvm_inject_sea(vcpu, is_iabt, fault_ipa);
+			return kvm_inject_sea(vcpu, kvm_vcpu_trap_is_iabt(vcpu),
+					      fault_ipa);
 		}
 	}
 
@@ -1931,7 +1930,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		 * anything about this (there's no syndrome for a start), so
 		 * re-inject the abort back into the guest.
 		 */
-		if (is_iabt) {
+		if (kvm_vcpu_trap_is_iabt(vcpu)) {
 			ret = -ENOEXEC;
 			goto out;
 		}
-- 
2.51.0.261.g7ce5a0a67e-goog


