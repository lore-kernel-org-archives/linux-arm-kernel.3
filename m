Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB27C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nK97iU3U8P3+PseGfflZpbVtPQJIWPB5aDB6ZsfbPi4=; b=PbfLMxFQ7VxnGQkIHe2axAfNLz
	qxi4H52d+Pcfoe6+TIQ4CpymKCmYWMr6HhsT7AoAXcg0CchCIWnkQB7OAgJWJVfHdjR25/DgTg+0G
	gQjj+qCatnmAPri2knadHrH5hnUf8BbUWktKpIa52X/0oEofEqIIkUGZprnphRbkwkZeAWwWa3VLD
	n+kvOboO/hiI2G/YSCfs1LOZe2/p1eQ4iOaitwWNCYytZpQbGgy1rvBd/cxHHXBMERs+F6WuV2/TQ
	AcXOkJii/WBWH6Y9fNTMeyNNAVRxv7T/hv3bws6Yb6vnNduk0LJQS4ZLt2T5QuoAAoAVJCJKCxegV
	z03AROIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqCH-0000000HaCb-47Ro;
	Tue, 29 Jul 2025 19:41:13 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugq57-0000000HYvY-47Ek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:33:51 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b38d8ee46a5so189026a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 12:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753817629; x=1754422429; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nK97iU3U8P3+PseGfflZpbVtPQJIWPB5aDB6ZsfbPi4=;
        b=IZ7+uVylNXQNTWRdjZbf/HjQD6xaj4wgoq7fDIZUBUYdw3Ef1R8X+I0TdOFgipMQz3
         HU3dR6UPEaNLzaPSAjp5Uv10AUjFgJoQ1F+EnJ1fO1mQT32ufHrbfMFR6Yu6RTM5Xijm
         kWHBo4LJ3qs9UZeA/o6vu0xwMqHOVBXiVS9DkNQdhrjXKN8w+qDz06F8TRq1cdPIzKpv
         lWy5eoBg+qaq8GxZcTVva+ERHloHcMp+K63MVGlsF4dogXjhXHxVorT8fleaAbzkT8iV
         FEMk8RTtp96v0aGZghGB0a2WaNny1BWLlZxaQm0hLQi5IMVgtwHAyTOWQ4y+H50LL2+h
         pO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753817629; x=1754422429;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nK97iU3U8P3+PseGfflZpbVtPQJIWPB5aDB6ZsfbPi4=;
        b=orgBAx+8GWEN0VtxV6/89HVgn0JRSNBRRtlQM2XQAgUaQylG2uCHkLxXVjz+Mu0Zoz
         vo0DdcUwtO7tvOuo9b1zE75QoEZmfRgn8rVzxSTZ7OZvPHaesAaNNopEMZuOVVWf92nt
         3PVIp9nsWpnyMKfMHbWzVocXZ2DUhFu8wFCMe/kR4s8uJGwXGx45qcV5vZxKAIBFbJB5
         +i5B7O2wzOitHV9wWY6OcpjQNVoxXsTB7OWKmNuPr1e11aorV7lARfQdS4772i5oCZKj
         DBO0SIlVxpe8+UD8b6HFvhJiTmuZC7CoKT1nvA8QXl1gI+iW5Vvjc6IRaQzKRQrxtmBp
         xXnw==
X-Gm-Message-State: AOJu0Yyjoq89dcf2Hiw+2TAmjAi10zxjpvoyDJwIb3hoXqCLkNAYSC2P
	PYnNM7ScCNkYnxvxdAf5ybkCDk9c0wkkplnzlkqFU8rpUuAsPIWKIwmmGLthClSktpaFmBxthRK
	xuZVeqg==
X-Google-Smtp-Source: AGHT+IH4QbqgK/rjqLq7feIazM0nAtyNNAHCeByH/06YNfkwg9k7lbaoNX81vVU/L2yD55+9XIqmw/waN38=
X-Received: from pgac7.prod.google.com ([2002:a05:6a02:2947:b0:b36:36f4:9862])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:914f:b0:23d:659c:aadd
 with SMTP id adf61e73a8af0-23dadeb68c0mr7268679637.22.1753817628625; Tue, 29
 Jul 2025 12:33:48 -0700 (PDT)
Date: Tue, 29 Jul 2025 12:33:36 -0700
In-Reply-To: <20250729193341.621487-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729193341.621487-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193341.621487-2-seanjc@google.com>
Subject: [PATCH 1/5] KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_123350_019523_7082A3DB 
X-CRM114-Status: GOOD (  14.70  )
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

Use kvm_test_request() instead of kvm_check_request() when querying
KVM_REQ_VM_DEAD, i.e. don't clear KVM_REQ_VM_DEAD, as the entire purpose
of KVM_REQ_VM_DEAD is to prevent the vCPU from enterring the guest ever
again, even if userspace insists on redoing KVM_RUN.

Ensuring KVM_REQ_VM_DEAD is never cleared will allow relaxing KVM's rule
that ioctls can't be invoked on dead VMs, to only disallow ioctls if the
VM is bugged, i.e. if KVM hit a KVM_BUG_ON().

Opportunistically add compile-time assertions to guard against clearing
KVM_REQ_VM_DEAD through the standard APIs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c     | 2 +-
 arch/x86/kvm/mmu/mmu.c   | 2 +-
 arch/x86/kvm/vmx/tdx.c   | 2 +-
 arch/x86/kvm/x86.c       | 2 +-
 include/linux/kvm_host.h | 9 +++++++--
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f946926716b0..2fdc48c0fc4d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1013,7 +1013,7 @@ static int kvm_vcpu_suspend(struct kvm_vcpu *vcpu)
 static int check_vcpu_requests(struct kvm_vcpu *vcpu)
 {
 	if (kvm_request_pending(vcpu)) {
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
 			return -EIO;
 
 		if (kvm_check_request(KVM_REQ_SLEEP, vcpu))
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6e838cb6c9e1..d09bd236a92d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4915,7 +4915,7 @@ int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level
 		if (signal_pending(current))
 			return -EINTR;
 
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
 			return -EIO;
 
 		cond_resched();
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 66744f5768c8..3e0d4edee849 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2010,7 +2010,7 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
 		if (kvm_vcpu_has_events(vcpu) || signal_pending(current))
 			break;
 
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu)) {
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu)) {
 			ret = -EIO;
 			break;
 		}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a1c49bc681c4..1700df68f12a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10649,7 +10649,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	bool req_immediate_exit = false;
 
 	if (kvm_request_pending(vcpu)) {
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu)) {
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu)) {
 			r = -EIO;
 			goto out;
 		}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..627054d27222 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2261,13 +2261,18 @@ static inline bool kvm_test_request(int req, struct kvm_vcpu *vcpu)
 	return test_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->requests);
 }
 
-static inline void kvm_clear_request(int req, struct kvm_vcpu *vcpu)
+static __always_inline void kvm_clear_request(int req, struct kvm_vcpu *vcpu)
 {
+	BUILD_BUG_ON(req == KVM_REQ_VM_DEAD);
+
 	clear_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->requests);
 }
 
-static inline bool kvm_check_request(int req, struct kvm_vcpu *vcpu)
+static __always_inline bool kvm_check_request(int req, struct kvm_vcpu *vcpu)
 {
+	/* Once a VM is dead, it needs to stay dead. */
+	BUILD_BUG_ON(req == KVM_REQ_VM_DEAD);
+
 	if (kvm_test_request(req, vcpu)) {
 		kvm_clear_request(req, vcpu);
 
-- 
2.50.1.552.g942d659e1b-goog


