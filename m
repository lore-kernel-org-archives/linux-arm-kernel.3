Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0DBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 00:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TejvodaYmBPMcebcEQjSEKnmOuBSBKtSthLIMV0TmZs=; b=jF0r6StXBDBN1X8puIUUUsBrSR
	rxgKwfOeTUYqZcmYPJsgoPGnRR0RGSk/2D4mNoGvjjkOufcRELFW6vQbu/tUE2Lx+xuvEU6hfvFgx
	fLijYY/81ixG3+OHDI119m9nxLHEsQX5giKndwNm48dIC7C3B18cSAKIf+oOx3rLi6MTOPhaysQU5
	myIfLIbSOjVhmJFW6t1fA7+2mwrFmTJ9jA2f7CTV7ndg0HhURUP/53LZmbaKPIGYXRp7ZtIwrHAFv
	AV8/fcgKcvCHckwre6JANb3w3HSgRB9yw7x5RlUXJbJHQTedXv684XxAchBpKfWZD10AiBPc00U72
	lw5ZIyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaS8-0000000AKrd-0Uqj;
	Thu, 26 Jun 2025 00:26:56 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaEI-0000000AJir-04qi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 00:12:39 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso287069a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 17:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750896757; x=1751501557; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TejvodaYmBPMcebcEQjSEKnmOuBSBKtSthLIMV0TmZs=;
        b=bog+GyrbOddu5Uk2+m4c2vS1U8u69LeqlAVNsCXsRp4lNtusxyptp9ifFKXgIx99x0
         B4mapuj+YfrDiw0RvihzN0r8/ujbg2QrnVKxeqN9Et/36b+LSLyqDveCq6CGPMIKECj/
         V6LC08kth7NdQFzmOPYV3AfMEbCDT1pomGMogsIdaDAQ3SLnAlgRnx5RjZGJ6it91nC1
         pLs5rc1oSZpsv63ID/4M2feHM6ZERecIXNNGfuo+bXpbif90KyJWW6v2ow/5iqdSpWwL
         K6gyfD7XMPLg+5iKusMOdiQMkwHm6H8WyR1neeHmCSOYEjaZYuYKR/66RLZZE1SvuCRd
         dxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896757; x=1751501557;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TejvodaYmBPMcebcEQjSEKnmOuBSBKtSthLIMV0TmZs=;
        b=nQHGZsHmmbmKHHR8s2zFiudpTbAJ9mavsNdKl8EMT5D5zIXpgdfWGJMzmm9mrB1uYu
         KhxE+xrVxD93PCczSleP39lRFVWirZWWhImj8Nbsye/wGSLEGQ/x9zaSKQ76hED2685x
         FVabTcuh+CXs9OQNJKOSZ8w20rNHNcZE6kiaWu3S4Xc4REEbK9lQWuhPnZSfwK+HA1ie
         wNgzZol93Qgo2Cu24FYyFKhsE99glWkmwFw6GctzdAHFQ/LWrJWj/qLX6FwXZhzjlC/5
         r7aXMgiSnxlPnKePBH623F88LpyZE8xOzf1tdr3I/L3ktIbUsrMUrPEtbquZKl/51Jod
         aACw==
X-Forwarded-Encrypted: i=1; AJvYcCW3nO5y4I2PaUcM9JiOzndx7Dm1El+LDwwvSwsolyXAE0mzMkHuvfSfNo02rQ3zn2H4yFe+1yMmI3GpecqhDrgF@lists.infradead.org
X-Gm-Message-State: AOJu0YxXdoBOGiqKloribmQRo9+ilLu/r/dIg+C3cLReB1/jlEOC84P0
	66v4MkYtgMY+JFk6xEW9LUNLJMEU16mpAjUbpirQzAllcZKfDBN8jGSui2LKFumTkskHnh9bzPL
	mL6BB3g==
X-Google-Smtp-Source: AGHT+IG+NlZ+68CsdHzgcIfwCRnU1b472g9YpYS5EpkOr0QdzQPPYC4WRVn9r71YvhtQ94AlekS4VDTCDtU=
X-Received: from pjbqo12.prod.google.com ([2002:a17:90b:3dcc:b0:311:f699:df0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f90:b0:311:ea13:2e61
 with SMTP id 98e67ed59e1d1-315f26c1b74mr6093342a91.34.1750896757146; Wed, 25
 Jun 2025 17:12:37 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:12:25 -0700
In-Reply-To: <20250626001225.744268-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250626001225.744268-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626001225.744268-6-seanjc@google.com>
Subject: [PATCH v5 5/5] KVM: selftests: Convert arch_timer tests to common
 helpers to pin task
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_171238_086160_E60412AE 
X-CRM114-Status: GOOD (  11.12  )
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

Convert the arch timer tests to use __pin_task_to_cpu() and
pin_self_to_cpu().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arch_timer.c      |  7 +-----
 .../kvm/arm64/arch_timer_edge_cases.c         | 23 ++-----------------
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/arch_timer.c b/tools/testing/selftests/kvm/arch_timer.c
index acb2cb596332..cf8fb67104f1 100644
--- a/tools/testing/selftests/kvm/arch_timer.c
+++ b/tools/testing/selftests/kvm/arch_timer.c
@@ -98,16 +98,11 @@ static uint32_t test_get_pcpu(void)
 static int test_migrate_vcpu(unsigned int vcpu_idx)
 {
 	int ret;
-	cpu_set_t cpuset;
 	uint32_t new_pcpu = test_get_pcpu();
 
-	CPU_ZERO(&cpuset);
-	CPU_SET(new_pcpu, &cpuset);
-
 	pr_debug("Migrating vCPU: %u to pCPU: %u\n", vcpu_idx, new_pcpu);
 
-	ret = pthread_setaffinity_np(pt_vcpu_run[vcpu_idx],
-				     sizeof(cpuset), &cpuset);
+	ret = __pin_task_to_cpu(pt_vcpu_run[vcpu_idx], new_pcpu);
 
 	/* Allow the error where the vCPU thread is already finished */
 	TEST_ASSERT(ret == 0 || ret == ESRCH,
diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index 4e71740a098b..ce74d069cb7b 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -862,25 +862,6 @@ static uint32_t next_pcpu(void)
 	return next;
 }
 
-static void migrate_self(uint32_t new_pcpu)
-{
-	int ret;
-	cpu_set_t cpuset;
-	pthread_t thread;
-
-	thread = pthread_self();
-
-	CPU_ZERO(&cpuset);
-	CPU_SET(new_pcpu, &cpuset);
-
-	pr_debug("Migrating from %u to %u\n", sched_getcpu(), new_pcpu);
-
-	ret = pthread_setaffinity_np(thread, sizeof(cpuset), &cpuset);
-
-	TEST_ASSERT(ret == 0, "Failed to migrate to pCPU: %u; ret: %d\n",
-		    new_pcpu, ret);
-}
-
 static void kvm_set_cntxct(struct kvm_vcpu *vcpu, uint64_t cnt,
 			   enum arch_timer timer)
 {
@@ -907,7 +888,7 @@ static void handle_sync(struct kvm_vcpu *vcpu, struct ucall *uc)
 		sched_yield();
 		break;
 	case USERSPACE_MIGRATE_SELF:
-		migrate_self(next_pcpu());
+		pin_self_to_cpu(next_pcpu());
 		break;
 	default:
 		break;
@@ -919,7 +900,7 @@ static void test_run(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	struct ucall uc;
 
 	/* Start on CPU 0 */
-	migrate_self(0);
+	pin_self_to_cpu(0);
 
 	while (true) {
 		vcpu_run(vcpu);
-- 
2.50.0.727.gbf7dc18ff4-goog


