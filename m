Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53729D6D251
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 01:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyP1JUxR4wRqvaLFIbbuwXgM3uy7FspWl6pSel31SGs=; b=smPeogDjtHNO6jMFfOU7hDa7Nr
	3qarYnunMeXV2Pb7k2561Rtv3Em41sgIuFhY5VMou/FhR1e5n2vDtsT+s3Oc6EfrVrTr77yALybsJ
	577YoRTZoZ5+tXgj3Eq0hEcny44gE2XyEDUCZ2DbMuye4+Is2rXlAbsW/pJ05VTGVB29ZM/BsLqOa
	uB+BcL5C8HHSMn22iTJG6fNJGtUAQ3h29YaxqibuaBKpn6ZFQlRd3zd7IPxHXm+k02ROiujpFvm8P
	0+t4vpp1x9K+tZcEhv1trsRMoL3cVmkbXFlLVuxWXRkEt469VdrBBU/n4HpVlubKVKeDUweXKBrrv
	bBQQJgEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSvi-0000000EOEw-2YFq;
	Thu, 28 Nov 2024 01:02:50 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSp7-0000000ELs3-3I5I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:02 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-71d64300526so170666a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755360; x=1733360160; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JyP1JUxR4wRqvaLFIbbuwXgM3uy7FspWl6pSel31SGs=;
        b=vBX1O/Ro4vkaoAdfcOeIC5HMhMY/TBzEAc5TapUOqUi4lURcqWQxdx/dt3ELDdEof1
         K3Q1TJXNJMO/AqrfsY/S1hR/68wdwppsVeQwzzl9tZexQ5VamLCS2JudZDbvd+2LdgaI
         H6odHrcKb0aN+9lYZ9yePA7tX/i+c7dXvaU0vPKWC+l/XeVOVkqFoAmXUZzOJNdoap/d
         rd494LmTobFWu4erRA1//nybSjZIEuVU+720y2PlXIVZguWdzH4NOdaGaMNM/xXUHq5Q
         OFXumDGxwjPTaR933zGZB+VY0vv0Q1qeWq2MdHYxKRxZUhaQtElk5pV6PbWGhECJ45dI
         mFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755360; x=1733360160;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyP1JUxR4wRqvaLFIbbuwXgM3uy7FspWl6pSel31SGs=;
        b=Z/dmeB0Ljcd63pi7prHxSkOvE79nk+KuHEisn3/8UmZgP/0/vAfYeFdNYMzB2NC5Gs
         hmEC2b/aF4KbQ6ylaOZIEWXSvqirpdBbhlqvzFXLRKZxZO0xP5YYfgWvd4fxgVmFbDDs
         i+O0Mx9VDv/yKS9VhqEU8FV4fGvBCnAb7KDiIa/IjdqPhoqxFN0ZQRpH+dSBt1rsGlLy
         gHrdZhlXid+x34nTkVDTu9w/NvJLT3Jr1fopVKBhUQM/EHxgup5j0EVmJsKI7q31w5n5
         hvBpoRo8ixLeNHCQiXS4UOBMGhhF7SO7q8Yo1sAuQspNKnRVPI4PrYuHaQwQGPQ6WoLI
         g0BQ==
X-Gm-Message-State: AOJu0YwhGk/kMan/l2JvmjIcp6ULv3yrSu0i4FFY/IKkhJ6W+O4bceO6
	61s0KV/UfuD/khRikMNqAJfhOHGhn1Ui5kz2mJrvFYUecJtV82LMPHRghKQ4xZa7QPcf83sdKQE
	l3Q==
X-Google-Smtp-Source: AGHT+IH8OsD6EvK6kpKey4op5FA84HiW/8R3R+eIuJX0ly9wWTrNA0B30UgLwfP51sElrM78pAke6fhK31g=
X-Received: from pgah20.prod.google.com ([2002:a05:6a02:4e94:b0:7fc:1fef:7deb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:6c14:b0:717:fdb4:c207
 with SMTP id 46e09a7af769-71d65d00ddamr5604090a34.26.1732755360453; Wed, 27
 Nov 2024 16:56:00 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:37 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-7-seanjc@google.com>
Subject: [PATCH v4 06/16] KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165601_822930_68001725 
X-CRM114-Status: GOOD (  10.83  )
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

Try to get/set SREGS in mmu_stress_test only when running on x86, as the
ioctls are supported only by x86 and PPC, and the latter doesn't yet
support KVM selftests.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 0b9678858b6d..847da23ec1b1 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -59,10 +59,10 @@ static void run_vcpu(struct kvm_vcpu *vcpu)
 
 static void *vcpu_worker(void *data)
 {
+	struct kvm_sregs __maybe_unused sregs;
 	struct vcpu_info *info = data;
 	struct kvm_vcpu *vcpu = info->vcpu;
 	struct kvm_vm *vm = vcpu->vm;
-	struct kvm_sregs sregs;
 
 	vcpu_args_set(vcpu, 3, info->start_gpa, info->end_gpa, vm->page_size);
 
@@ -70,12 +70,12 @@ static void *vcpu_worker(void *data)
 
 	run_vcpu(vcpu);
 	rendezvous_with_boss();
+#ifdef __x86_64__
 	vcpu_sregs_get(vcpu, &sregs);
-#ifdef __x86_64__
 	/* Toggle CR0.WP to trigger a MMU context reset. */
 	sregs.cr0 ^= X86_CR0_WP;
-#endif
 	vcpu_sregs_set(vcpu, &sregs);
+#endif
 	rendezvous_with_boss();
 
 	run_vcpu(vcpu);
-- 
2.47.0.338.g60cca15819-goog


