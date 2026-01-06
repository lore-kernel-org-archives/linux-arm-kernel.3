Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A417C47BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWAfw8yq+s9cE6S8gitEzWpZURZyId6sqJW9pySZvio=; b=iLO8FDxk/IYQ2ItaNqGDOk2SYN
	9IQgMpZf71DRXBpTYd/q9oDsrsJrT1mHQmyxckgRGXBd3LYMiLv1ZZiQ7aCIuFxFqqfL26QBUsx/5
	+yOw4jCWrxHGIdElxUItjGVTzxhVGmJcE+XALEUaTzqpS3nObMKtlB5FY/olMF0M3l19UymUcXrLy
	B+Wth3BpJ+JhNnPtFTssKxXwK2qLewKNrCYy4+wIFhi1JaJauMo9uTndLiaVXg/jZqfs3BGzkHngc
	H1CcnNRpvegIzcB/Xl76ctz01RbMDbEEJh1QxPFzRWc4t6+1hcZO/L7QFEpOfh8aVTODQ2mavieyK
	6XB3Sp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Ir-0000000Ci6f-1hql;
	Tue, 06 Jan 2026 09:24:37 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Il-0000000Chz3-1Rwj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:24:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4792bd2c290so7747475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767691469; x=1768296269; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QWAfw8yq+s9cE6S8gitEzWpZURZyId6sqJW9pySZvio=;
        b=G9MvtG2HMIXZOklGyFOqmhq2P5bYqhcSrhMcqxrF3SOCCoRoj1X5524c50Px1r4DMy
         wUOmMddwfqWnQnuQoWVsDRjL2rBVyfqTZ20YwOZ8c9nV/i4GT+iG63Gf2Ly0LMcv4ECg
         izt5c4J2moyh7mmGvjVxZCMF01LrQIZ+L0um/uELpqW5Hp9kDkLYgLLZdmVM2izh8tLA
         SFj2Tb4RpZcdVznuOkpoe2dnvRQnV6JguQFaXSkjhPS6kB1B+JFV2l9z+3aEfKDZwyDK
         DbXS1aDAuR26hHYIsLmD29Bgk0N+hUvNZOonVLTPNql8eGSZGIeL8FLESVhXhb3qVP5X
         zvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691469; x=1768296269;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWAfw8yq+s9cE6S8gitEzWpZURZyId6sqJW9pySZvio=;
        b=KLp+Shw3Kc1WfyZxHJHa6KxJYjKQ8rg1mPuIBeHOD2HvqZ2GxwaTUSZ01gOJQokfvL
         ZewQ1coU6NSAjF42VRl6q5HS9FOrgU7apsKtjJ/1+yL2dGO6C6An01P0cez+Jh+ffEL+
         ywXlNlQ6YcWL8d4psm0WM5S4MpOiP/tB//t2mmrgAZ8PLMGP9b6qsO5o2YvZHbJO9zDq
         9o70CqwAUQfLYzMaFZPtSx+LQdfV7OarX+6ry5EIgp9ul9XlsJTNrRMToHXqx+mZMnE+
         QQbKFPoVQS1Iyjc15gip8E6aJLsHrmVqNhjB0Y6E42FECo7f+qO3RqczoiTiaPH6Xr2/
         HZlg==
X-Forwarded-Encrypted: i=1; AJvYcCV232MzJ5PRKuCKgxPaxaNpLvHFxV/rgdIIP8U8BA4rypm0CTbnY/HrADcF4kDAanaRI5bHx2bT8IQi1hTnUEiM@lists.infradead.org
X-Gm-Message-State: AOJu0YyacR8iGgB0wNFI/MfRZeN3agtxzTNBaYWLKrCoGSj8H+TRdE8n
	GapEJLMUbFCCiSWmnoZydM3EXTK8BmEsoi+djZGCYFVX06co4h8jL5SEmoiy/3Q1BVOD3hW73dD
	8eg==
X-Google-Smtp-Source: AGHT+IGZ6zPBR0nFFmX4Tnz3UVY5AHveG185k93WRJRP+p2A5F0uEf6W3hst4bbUZ2pAc94raYUDWeGeZQ==
X-Received: from wmxb6-n2.prod.google.com ([2002:a05:600d:8446:20b0:47a:9289:c5d8])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46c4:b0:47d:403e:90c9
 with SMTP id 5b1f17b1804b1-47d7f07031emr25675035e9.11.1767691469448; Tue, 06
 Jan 2026 01:24:29 -0800 (PST)
Date: Tue,  6 Jan 2026 09:24:23 +0000
In-Reply-To: <20260106092425.1529428-1-tabba@google.com>
Mime-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106092425.1529428-4-tabba@google.com>
Subject: [PATCH v3 3/5] KVM: riscv: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012431_390709_04C61707 
X-CRM114-Status: GOOD (  12.58  )
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

Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V 64-bit")
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 2eac7d4b59e9..d5e8747b5e69 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -28,7 +28,7 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
 
 static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
 {
-	return (v + vm->page_size) & ~(vm->page_size - 1);
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
 }
 
 static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
-- 
2.52.0.351.gbe84eed79e-goog


