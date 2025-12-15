Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8512D5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=; b=Wqxk2Dxrrcrn41W2Okkjmz+f45
	cyliiGUI4gx8Y/6S34iIPH/Sq5u4vwDedS5QxwvMOlJWUPYXmGaf3xZgempnTBkwSJT3OAZZqELoI
	yHbuQbYLzwSXUZgImI8j6iqmCEOQjY6UeaYiU4gEWLOE7t+fRzKTaUyqf57Kf7awJi+6bZczHkhXW
	m7JAUmT/cmE/M2W7E4894AE6KoCpTkrTY06IDoAPFla/A1cuTlrliqvsXU4EZxcGTr3P9dSxAVZJ2
	6cCg2pI43oP99LLaZA6Py47qF7GOa+moidm8yoskn/Fh9dU9woFic9qTteHYiabpnJ32jJXS5OhdY
	wK6KMnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlb-00000003uxi-1fJ4;
	Mon, 15 Dec 2025 15:45:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAlW-00000003utL-1RDl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:45:40 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so35359005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765813536; x=1766418336; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=;
        b=g+b53FxPsF+mak6E7kIan86wwEn4B5Vm1doMt+C1lS2fbcrTjITn1JI57qV9XwKtgo
         aUxarlFzEDIzeFOGY1mYaQ4ZGzxKU/QboT36QTQDyAsv9bdE1n7JnZqxepHtgspmr/rr
         bLXVTgr8VVKVd+sKKuR9l/T7qQnVDrXye7+RCH6IYdlh3+qiaSLK1vG7tSskGtuTnbEc
         tHzaHTsXSXyM6cHvWoih2g5rLb3/6jXoAQfvR5oPrq6HG4O8PDxdZuIccajLdv5FyKdq
         MNMYgokswc274BD0MOaoMPGYYvGLZhWntNjY//TNCtFg1sguIuJ7MZeAoGiD/rfnV9PQ
         C0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813536; x=1766418336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA7YNO0BIUCF/IaZgjS1+s+NSnXmnEjkXZMNklvVQWE=;
        b=rxfty7lxXfWX53SnRcFNlplakmSEpLOpz+f8/4KoXxk0vp9xcQZNHiOX/gKmp6A6Pc
         dpzYHFJdYNBrkuO2LloSWCbyqDPnv8lSV3wrzvtffGOhu0IiCKVfrCf4F5gkRR4Tpj1t
         ZCZ4qXphWTVPwhYhNbHDlLWB/mBe8EXefaRXc/WjVXH9ocgTcNlU4AioWWP4EjCsPYNv
         pK5beyScQxybErzA6L4f741tf7DJEXsI0hdegz8N84TtfqDVOYYkLHtGWZ71Z1MO/Q/e
         1SDyUzVh1/QrWrXLuabiy/Nvw92IegllJonZFyt0PuPqppRgwQNZCcLOHkrfOhSYSOqV
         538w==
X-Forwarded-Encrypted: i=1; AJvYcCXSLTxSjBctRIcdEf23gWrSvG8yllZ4uIa1nfU1sIi7AK50JGN7gLV7midnWgUVs1SfjAN3l26wuY1CQyDsuizl@lists.infradead.org
X-Gm-Message-State: AOJu0YyTpqpdo21QybWAQ2N2RyfiJHmir1dfv14seQRv8ZtVE8gSzxSm
	Arm/s+oOBY8Qzf2iTrDZmoQg+g5M8s75udSZotdszsWDuexAnP6bv9DJIFs84E+Xck6rG++LT3L
	ruw==
X-Google-Smtp-Source: AGHT+IFZI8Oqy0Dwzs46zw2EO/H/+bEzdIN7TuLx6hQsyK4rZ5XHMbC88iQvLEXX9k4sZAwUCKBSJ88lKA==
X-Received: from wmjl2.prod.google.com ([2002:a7b:c342:0:b0:477:1022:3342])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f89:b0:477:7a95:b971
 with SMTP id 5b1f17b1804b1-47a8f90c5b0mr122369655e9.31.1765813536024; Mon, 15
 Dec 2025 07:45:36 -0800 (PST)
Date: Mon, 15 Dec 2025 15:45:30 +0000
In-Reply-To: <20251215154533.3154405-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215154533.3154405-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215154533.3154405-3-tabba@google.com>
Subject: [PATCH v1 2/5] KVM: arm64: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_074538_384348_8885968D 
X-CRM114-Status: GOOD (  12.87  )
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


