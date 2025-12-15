Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB8D5B85A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=; b=JtPzP6yNiegLQhid3Zaeq1YFvu
	saYA/tsxfW1pgzHfPhht1hlg+A0xilDWlJnI9DMrMzcJRac6N13Gq5mVG8Sht6tTMYODQE+HYj4Z1
	LzYrVE2j/1NLXVeMIWXOVrOeAKYnpxOigAWLU3Vca1Jgw46d9ld4afX5VSqqMFoJZKUJlfcfWc29U
	hsIJBGDStfW1+Bbekbt+CUAzwx0Am996bsIsJhMot5YfulB2ishy+t479tzGLFoNLRxTjAZWER0eZ
	4Vvj3MFHkeCMJZ008GPlpaOTUucWoVY7fx7HadzYihhnkADytpRQK5RPankIxZdOL9ETgHIjOTw2v
	db2nGh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBno-000000041eR-2xWz;
	Mon, 15 Dec 2025 16:52:04 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnj-000000041Yp-3eUM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 16:52:00 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so19312755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 08:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817518; x=1766422318; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=;
        b=n7YEmDg6fjtB2narkqmMNCQe/Q+sYw+dVzibCXIYfolinF5dcwVBrdNJ4HVgSfgyYO
         080rkYCHU6eaLVd0gVHLhJF64Hso3rxka9bz3WT87700jt9rDT2bKptY0DBhjoHBI3I5
         xSKI+WMsK741Q3Hr21Pz+6igz/o3m0803s4nXVsL9Fng3mSQzrDnthqlPirfPbvPkmM/
         lpESg7ZmVgLg67+Ah3v6gXY4YXmWWDcUgjByJiB5qIrhATr0oyZNhJn492ISp1eQpxCD
         eEM1KjWXCp7vNU3KgM9WXsj5vQ4paq2QBW9ipCIkxQpw89dkbQdgKtnmC6gxkSY9ckdc
         QIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817518; x=1766422318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=;
        b=ZtE4itcHqFBP16WG8+udofXnA1/yGeog+CfPT6VF2HBYU5kw+ACeN7B1UWC4Dewf6E
         xRljaWjt4cMoKYXhJAb/Zk5DZm6ONY9JAKJ6WuQz1ADOW54bUrxMca8dDnK/hhT6eJP3
         LlYdt7DE+21kuPNoj1It5+7ElS92XZMrNQifCv2QbY9WwgWQrSC+UedyElfpwLBzwfSB
         7vTYo03JDQMFHqCJ9fUdEUp+JlVkQbE46HDRuvxeMtwTTKUr6r8XVv+wJo3jN52b1Si7
         HIHwrjXLzuZp+w79HOMZ1Dh0G+AQxRO0qSmXc30zWvBossE5xmujttm9zBY1dRTf/b+v
         /FTg==
X-Forwarded-Encrypted: i=1; AJvYcCXE4/49ROnzScyl6zGmEHvVvameVJqu4v19k7xCWHatY025pFBhvJbxwdLlKED5rrsvA5dQYOVhuWkKbCJGu4xM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3EW0qsqMUNYvz1OFIMzyMynqubRS0/hTIzr0utjKNXPV4QSGJ
	9k8avT0gUBtAVBzP3U5WBJTDBoF+ZveMn3QToT/2f8sjBmqVMgnb2Nfx4vQlWn7+oCtkb/mXKj3
	m4w==
X-Google-Smtp-Source: AGHT+IHUB40lOCD80Q5A00V1WQKvc1RxNXM54i1GatM+tLTBSJUgVajSxluMfJ5vbUhuhTOMyPxhV+F0hQ==
X-Received: from wmpo35.prod.google.com ([2002:a05:600c:33a3:b0:477:14b1:69d7])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a012:b0:479:3a88:de5e
 with SMTP id 5b1f17b1804b1-47a8f92029emr95871135e9.37.1765817518200; Mon, 15
 Dec 2025 08:51:58 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:52 +0000
In-Reply-To: <20251215165155.3451819-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215165155.3451819-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-3-tabba@google.com>
Subject: [PATCH v2 2/5] KVM: arm64: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085159_908575_C5930A27 
X-CRM114-Status: GOOD (  12.80  )
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
2.52.0.239.gd5f0c6e74e-goog


