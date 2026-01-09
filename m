Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D36BD232EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqG3laPI6vEHEXOM9R+vgmhZHRmAA+/4qmyfh5dJ4MI=; b=sspZVuebTBJa7EELIz1UTD4cAK
	DJH4fxyOKb6jY/Y9bigg55Z1i8og+SBvlv4YtKBdbcD1Ci9m7mUza+lSzuUmjnbRGC9p3KMH3QdVm
	PeZGd3e0llUDnqrBQu8bA8jb0UYtIaduVJrAdABQgAItE9XQhKqc/PcI+xfYNj0XWmMdCuLJHA5nf
	IsOb1rM2vbvHl5eZYpDm0QNCGGW8J61tMXaHq4TscDWfKHBClKwRnRU51oo/E4dWtvrX1ux4d0GNN
	DLZsexq8cc0Nz3d4CrlMzMpQulj5gEZBmRlK8BppVrnzKqT0PJKb+mh10diK4MF4lQGsC19zEQ/7v
	OFhBCWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lM-00000001seG-3efm;
	Fri, 09 Jan 2026 08:22:28 +0000
Received: from mail-lf1-x14a.google.com ([2a00:1450:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lI-00000001sWR-1Ekc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:25 +0000
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-59b78adfc09so1421339e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946942; x=1768551742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NqG3laPI6vEHEXOM9R+vgmhZHRmAA+/4qmyfh5dJ4MI=;
        b=Gmsv/1Ez4/jhF2ucD3AC6YjtdM4BMv8BAGUYAnZgqfXhCsiatEgi6PmNnpFBIfkovW
         S9UmYqERKCYQ/XKyZ2RRYQXXkhJiK45jRAnWwPAETt8r/w05gm6YcNXnfrzPxYh510zU
         s1jq2/hhGFG0t+HfMtCmpYgA6YNdrisUg9d50cR/RQQ3YLyI1JGpvnwcplROri5e3QgY
         P1It0FEIOQogNxqtD/xApBIXWN9/yCnVFkkLYNte9qOmxT2Je5AaB3X5T0mHsT9PMH4W
         jhiQJ2FEMNhD/eZfPTchQM4SrRQaUN+e1IfSuQLWXRiDf4Cs890OFPcIi2DT4fc0ZA5j
         CWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946942; x=1768551742;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqG3laPI6vEHEXOM9R+vgmhZHRmAA+/4qmyfh5dJ4MI=;
        b=X3SEEzUPCqlYWcQB2d+JfSs9MLhYhBUShQyxaeTiKnQtPFSIGISsgadXq3HjV0c5WJ
         zmCNEDMzlsUBXr/eufce7wZEKejdexGjFgrOb4vfCFe9TIktrlorTKDHAWtybSvkWlgS
         LozJp1To39uDVxsmvTGWEkwWMHejxa5riavF9Wc1rgIKjED8BjAuRCaw6ucJhi2GQL1n
         BcJJvSqR4bWerR3T7gf0qDxg3me+VSEEEjhTa0DwsUd41dK7nmnWQmvkhUXfFBvxUwzj
         kA2CaE14X+PkJ0UwHxKpQ5bCnArRqZPAPzt5ShZiTzjkSp3Ie7PuHBEdZ8oME09yfPPq
         XqBg==
X-Forwarded-Encrypted: i=1; AJvYcCWSMTy/nTcC+FOIAf34kfdJxweWGnJPWDjyVl64Me4c3mpgcWu2tuyrldcZK8A5KXNtuxuACt6sv4lLn2ZlB5dM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb0FKdNW6/CTk4Xd/bgSJp2+maNOEJq1mm43UiTnEdDwLTLtW0
	W/6E2wx0htuHHy4p43fG+ZEQyvaGBpKyZPfuimuZOPG5qMlHsZsDV73rrGnFIzSRuq27gVZYLEr
	guw==
X-Google-Smtp-Source: AGHT+IEPiBQu8APfXNA3IWNbMpdOagfDDvRFnwb8uKkQFHMSY7VPVHw12O3QIkHoI1cD4SsInszAzyQFrA==
X-Received: from ljdv18.prod.google.com ([2002:a05:651c:4212:b0:37f:dca2:6c99])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:3c8d:b0:595:81ce:ff83
 with SMTP id 2adb3069b0e04-59b6f03a0b4mr2586927e87.25.1767946941603; Fri, 09
 Jan 2026 00:22:21 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:15 +0000
In-Reply-To: <20260109082218.3236580-1-tabba@google.com>
Mime-Version: 1.0
References: <20260109082218.3236580-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-3-tabba@google.com>
Subject: [PATCH v4 2/5] KVM: arm64: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, 
	seanjc@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002224_344678_97AC1E26 
X-CRM114-Status: GOOD (  12.44  )
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

The implementation of `page_align()` in `processor.c` calculates
alignment incorrectly for values that are already aligned. Specifically,
`(v + vm->page_size) & ~(vm->page_size - 1)` aligns to the *next* page
boundary even if `v` is already page-aligned, potentially wasting a page
of memory.

Fix the calculation to use standard alignment logic: `(v + vm->page_size
- 1) & ~(vm->page_size - 1)`.

Fixes: 7a6629ef746d ("kvm: selftests: add virt mem support for aarch64")
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/lib/arm64/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 5b379da8cb90..607a4e462984 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -23,7 +23,7 @@ static vm_vaddr_t exception_handlers;
 
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
-	return (v + vm->page_size) & ~(vm->page_size - 1);
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
 }
 
 static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
-- 
2.52.0.457.g6b5491de43-goog


