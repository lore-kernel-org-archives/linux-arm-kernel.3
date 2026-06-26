Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE3CC43638
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht+2H0jf5K8WYzsVOZrAc6DiqyjXLSwmmI/Hl439zCU=; b=U5Ymxk6oqvzJF5SpcJGTarqBrR
	WpCdLJ58eGjTA2BG5Y/ed0+ZovNfxjAKfqO62V/E1EOV1C0Wjl6vwLEOIRwd6fd3OENre0YK/is35
	fOht4+DBVzpbIfEYvuS8l3T+8s++7ezPNSCRyY7BkjIraVLH6GN5QGiMxB9j/g7s1z6Hli71z15K4
	UYOZUQMNakjLunKh8WTbGJp4haK487sfoZlM8fBLV4jh6GFGiFYO5o1X3JAyZTwFySYqDQqkRb6lh
	eerbo+qyukJSL1C1owSMYc9bpwBX//CYaH5I0TssfgMf96NhTzm4qYfrGD+3L4iRx4uQWU6i9g7Ts
	16mKVsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdEDC-0000000BuIT-1bAC;
	Fri, 26 Jun 2026 21:35:46 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdED9-0000000BuG9-2B5a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 21:35:44 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-37fb9d7b524so97386a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782509742; x=1783114542; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ht+2H0jf5K8WYzsVOZrAc6DiqyjXLSwmmI/Hl439zCU=;
        b=QDjxCRWolWEs58qR3NAPSiD87GCZh8k69nX+ED8Y8Bmke63uzHKijm1Xj43iJkHO41
         xoI8ZvPn61ZR5MWl8YSV5mEOsvYjHi09FKVCsl2LhK78cqV7Gu/0edML9tsbZ5qb+gB9
         +2+LKHtN8HZiVRGvvzAVC2FU4CNt5XHDIuNv6W29gXTCnmwCNlLL68osOTCmHbemFNA7
         QZ/Nak7dT06eYmun7MIAJH9djZ2vi0nBfC1Cap7A0EgOOMVGfxAbMweJYvB/ZmBq7xfT
         ZANCisyD4eXXs8O1PECmhoWJXLUp6rU1jA0mRU9wuS8fDKGFB4thKx1488XwhQJS5uVa
         kzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782509742; x=1783114542;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ht+2H0jf5K8WYzsVOZrAc6DiqyjXLSwmmI/Hl439zCU=;
        b=gfRwF8JiDsHEWNPJ2x/qblsIVxNr3oNsHeQn8NZnDXUHxWi3lgxdGIsOqy3xsnfmVc
         5k9gThOtLva7l/ADjpebrHvh1ZBG/1P1i3g2p2RwEVfHOxTOkPlUpiCUiRBb7PJjtwxA
         zabuR9mleQVpSgEOaJK9WQX4bkT0i+uX0cyNyr6cKL34E3GnpHzKEUyW7T0QlqaMHR3a
         GYxrR0huVUb+fvJZku8OemFvVQKtEqKmlrav/pRHYgUl26drFtExliI2HCqBtESUDIqF
         8nhQJQ2pgH3GsPBUF2UsUaR/iQO/FHcZLkjkx/W8t3RXc8gg1VHEHnBYKlLUia2ugHKL
         ErHQ==
X-Forwarded-Encrypted: i=1; AHgh+RovQvCtAZdkCY7B4swpz1g6g1bBl5dbYTpcCJ2Cpe81V7HTrG5/ai9hgE9NKkfLovM2wJSGliYO396b9yfsA6Y/@lists.infradead.org
X-Gm-Message-State: AOJu0YykgpCx4YOo1PkvBDodS7Yticsu6lDmOkT5JBfRqzwMHVfEXz3P
	Zp8R79tHIK7Hce1sSVO0fBIjU/y6zzJGlejaZsLaJ0slhvcW0fORVxsRspudQx1WkgUcnxw6KTe
	+b4OX2Q==
X-Received: from pjzp14.prod.google.com ([2002:a17:90b:10e:b0:37d:a52a:ff00])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acd:b0:36b:93f7:a903
 with SMTP id 98e67ed59e1d1-37dfa25a0d4mr8609950a91.18.1782509741562; Fri, 26
 Jun 2026 14:35:41 -0700 (PDT)
Date: Fri, 26 Jun 2026 14:35:17 -0700
In-Reply-To: <20260626213534.3866178-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260626213534.3866178-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260626213534.3866178-5-seanjc@google.com>
Subject: [PATCH v8 04/20] KVM: selftests: Initialize the default/global pRNG
 during kvm_selftest_init()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_143543_565862_A28144D2 
X-CRM114-Status: GOOD (  10.82  )
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

Initialize the default kvm_rng during selftest initialization so that the
pRNG can be used by tests before creating a VM.  As pointed out by Sashiko,
failure to actually initialize the generate makes it decidedly not random.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/kvm_util.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 875030c22d07..1016865d3f7a 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -24,6 +24,13 @@ u32 kvm_random_seed;
 struct kvm_random_state kvm_rng;
 static u32 last_kvm_seed;
 
+static void kvm_seed_rng(u32 seed)
+{
+	kvm_random_seed = last_kvm_seed = seed;
+	pr_info("Random seed: 0x%x\n", kvm_random_seed);
+	kvm_rng = new_kvm_random_state(kvm_random_seed);
+}
+
 static size_t vcpu_mmap_sz(void);
 
 int __open_path_or_exit(const char *path, int flags, const char *enoent_help)
@@ -515,11 +522,9 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	slot0 = memslot2region(vm, 0);
 	ucall_init(vm, slot0->region.guest_phys_addr + slot0->region.memory_size);
 
-	if (kvm_random_seed != last_kvm_seed) {
-		pr_info("Random seed: 0x%x\n", kvm_random_seed);
-		last_kvm_seed = kvm_random_seed;
-	}
-	kvm_rng = new_kvm_random_state(kvm_random_seed);
+	if (kvm_random_seed != last_kvm_seed)
+		kvm_seed_rng(kvm_random_seed);
+
 	sync_global_to_guest(vm, kvm_rng);
 
 	kvm_arch_vm_post_create(vm, nr_runnable_vcpus);
@@ -2279,8 +2284,7 @@ void __attribute((constructor)) kvm_selftest_init(void)
 	sigaction(SIGILL, &sig_sa, NULL);
 	sigaction(SIGFPE, &sig_sa, NULL);
 
-	kvm_random_seed = last_kvm_seed = random();
-	pr_info("Random seed: 0x%x\n", kvm_random_seed);
+	kvm_seed_rng(random());
 
 	kvm_selftest_arch_init();
 }
-- 
2.55.0.rc0.799.gd6f94ed593-goog


