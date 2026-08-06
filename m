Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E1CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:Mime-Version:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=shGHIfLMy0zOulR4PSpJjZWPNrTU67gcyn62KwrDxcg=; b=wVB2Rsk+2jlgvoUm7KyVZlGbv+
	SCTQOPRiCDKB0Qxt+4ihX4VBjvOqvDpuTcTVnizkLncYJ0Mwdt6B7QrYlBirDZXiwLVpsjDmPlD53
	mTHXKE6Qm/SL2gRry9iWODxpBonH5LlwiPAGUJE+ieRLzxs8PycoN3PYos0glySbyuswGZyMNR803
	SK0SQZdlXpaOgxAleAsvbD4Rg4tJp9p03hUQzML7gGWXskgUSmogSPYkHCH45+zAQv8cq2CJJeDcf
	spFO+G7UzxlGVtTr0H22PHqaX7UfLscf0nmoE6QYkrYBjRDwTX1uxNjeC8e8XqbszM374sStnCbF3
	pvPJX5rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5v1-00000006kbn-2Y6c;
	Thu, 06 Aug 2026 21:46:27 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5uy-00000006kbF-3Fpg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:46:25 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so3637052a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 14:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786052783; x=1786657583; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=shGHIfLMy0zOulR4PSpJjZWPNrTU67gcyn62KwrDxcg=;
        b=WD935fEaat1R4KVloHaST3NKqg4pjPCLStI/ymUzpV44pWgegSY5ANAFBbg8yAlgBN
         v8TlduL5npcZOR/7ybL1Be9eu2usua6NnurdD8+STnsYWZla0k1mQNBPRBRYIjGvUbd2
         nEkfoAScsT2YIf7xxcnPtoLTBp3tEGbuxfU6Z5vVMAP+5iNxU715x0TVzwO5GBshi/cQ
         Zte0yKUXppIMRv/6YJ7h8yE5EPDs3uR/du3m/G1NuGW7LlyMWjJnKyzxGWf5wHW4ock6
         6jKoporMkk4LKGHtqNHAyZGGNm9o6MNciEDIV3LZThxLGlQUsyVW4tsAc4tGdGRSzkup
         BwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786052783; x=1786657583;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=shGHIfLMy0zOulR4PSpJjZWPNrTU67gcyn62KwrDxcg=;
        b=Y9LwNW0N6ND8z6fJ6JGk+L4nWe8z2Tduj1/h/VL2+WK1p+ghoFfjSAMeIZGaszm0P2
         Sp21UpqBigKfHbaAhFNOOj37HNAd01WmwHAjbikBJyxnJ9Ysz2uiiveLgC7mZ3mO59xP
         mIPnL0ai/r1je2u4ldD705o2LFn3PlwM8U/BG7D4LoUcLgnTTYk3CE4eJbCzXhc1tWUc
         qQKtQeLzhPKRKEWfmSj6Lxq8gYhS237DG1nnUGeQcN0EjgmHYXqNr5Au4NkkEYtw78vR
         JvgrNLE8iTsMqbEqnLp/nGQBsTcff71jrU5xC7s8YmOj95cNgcSDVfupz70keqyb5xzu
         Pdbg==
X-Forwarded-Encrypted: i=1; AHgh+RprVzi3miMKKeT1/gOPK8CSMqIFUVdgZu4u2GKTlYxmU01jCOX6xN4IXZ0upf8yiiEF7pEBegxN5X8bSdDi+b1h@lists.infradead.org
X-Gm-Message-State: AOJu0YwtMsRs73kRZsLQ0kwQBO0WAvifkD732q0ZlMlv/xx+WsKCwNZs
	L24BzgYYhN9ngsGyMSovlG3pSM9YjR1k27SpFdEQBwa4duw50v7vVFiBgTGZ94ztHQZFXtSWDqi
	PUDP5jA==
X-Received: from pjup19.prod.google.com ([2002:a17:90a:d313:b0:38d:efe5:1502])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc9:b0:38e:740f:9764
 with SMTP id 98e67ed59e1d1-3903c5f6477mr18528170a91.18.1786052782928; Thu, 06
 Aug 2026 14:46:22 -0700 (PDT)
Date: Thu,  6 Aug 2026 14:46:18 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806214618.82180-1-seanjc@google.com>
Subject: [PATCH] KVM: Never clear KVM_REQ_VM_DEAD from a vCPU's requests
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_144624_817834_5C002B6C 
X-CRM114-Status: GOOD (  15.89  )
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

This was previously posted as part of a series to add an ioctl to allow
userspace to terminate a TDX VM.  I'm posting it separately because it fixes
a very real flaw, although the flaw is probably benign in practice?  I don't
want to find out though, i.e. I don't want to wait to get this merged.

This came back on my radar when fixing a bug in x86's pre-fault code, and
looking at that code made it pretty clear that clearing KVM_REQ_VM_DEAD could
make a bad situation worse.

 arch/arm64/kvm/arm.c     | 2 +-
 arch/x86/kvm/mmu/mmu.c   | 2 +-
 arch/x86/kvm/vmx/tdx.c   | 2 +-
 arch/x86/kvm/x86.c       | 2 +-
 include/linux/kvm_host.h | 9 +++++++--
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..a56ead423897 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1108,7 +1108,7 @@ static int kvm_vcpu_suspend(struct kvm_vcpu *vcpu)
 static int check_vcpu_requests(struct kvm_vcpu *vcpu)
 {
 	if (kvm_request_pending(vcpu)) {
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
 			return -EIO;
 
 		if (kvm_check_request(KVM_REQ_SLEEP, vcpu))
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c519e8e8d646..ec34caa06b6a 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5033,7 +5033,7 @@ static int kvm_tdp_page_prefault(struct kvm_vcpu *vcpu, gpa_t gpa,
 		if (signal_pending(current))
 			return -EINTR;
 
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
 			return -EIO;
 
 		cond_resched();
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b272c20586a7..6c842e9191a5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1995,7 +1995,7 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
 		if (kvm_vcpu_has_events(vcpu) || signal_pending(current))
 			break;
 
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu)) {
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu)) {
 			ret = -EIO;
 			break;
 		}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d94b59140c45..0af4b4a95c2d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8060,7 +8060,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 	bool req_immediate_exit = false;
 
 	if (kvm_request_pending(vcpu)) {
-		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu)) {
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu)) {
 			r = -EIO;
 			goto out;
 		}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 03bfc92864b6..cf7fe835c4ad 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2324,13 +2324,18 @@ static inline bool kvm_test_request(int req, struct kvm_vcpu *vcpu)
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
 

base-commit: a806d364ef288a6443a1337820ea8410a7ccc6b3
-- 
2.55.0.679.g6767b8d81c-goog


