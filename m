Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82646C47BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BHQuplAEgEU3wnDUhoItFqsIohZcJhUp7mBGwtJYNU=; b=F75hZsluskg6Fq15sBChZE+MHr
	LWpv1tEzhev5k05JwD2uRL0pXrb20QkAZPvAGMPvpZmlbMW2tzKCrs9KTeq0snH//o82t+HvBQltY
	wDAA9OmvqYia1948vw0XJO4bwzZyeVQlSNf7laix/e9WBYD4bJbetCxggRE0vXXUrEK4ynX2+DKHk
	QxCwx1Ev5kEE4DWKKmwvbZKpDeXva/HAwYN4q++6wDgozP1LAxlamEXcla0zdPPv/oQEqNZXbomaI
	/n9wDzED0ym4CvfoJiCkQJRQ2ZmEVb9J+hFeP2SeBvCfkBZWQBUGZrgkl1cksYzzfwUs/NJqYYNuh
	QhaI32ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Iq-0000000Ci5R-0U5r;
	Tue, 06 Jan 2026 09:24:36 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3Ik-0000000Chyg-2YRd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 09:24:31 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43101a351c7so539588f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 01:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767691468; x=1768296268; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BHQuplAEgEU3wnDUhoItFqsIohZcJhUp7mBGwtJYNU=;
        b=pYJIsq1I6DsMAnO2ORHKIA4MEwR9uNz6OAKj/3aTDn669O9nHuRekzE+70V75agywG
         OpJFb2/KP3gIF4A6d5zohZyvRMSLNBuKRq0+pOAxiJawNTIViDmGjrVcWQX+26t1w0n9
         GM8Z4KW6MzKFOJ5nJjHO1e7OEnjULMe7l7FncLowluJFp7YPzcEE1Zhol5E69111Kafp
         RRP8rZgEpiPOKtrelnOELdfuGiLjYQe8eDWz0OG/9imnXw+QDrpKbccFeY+Sg4GQmZDJ
         npHXsQzXOKqCeSNPFbwP0utVdPgERiHhxnUHXJrTsdQOwZjKpxSAkKMed+zV5dJaGUxD
         aDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691468; x=1768296268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BHQuplAEgEU3wnDUhoItFqsIohZcJhUp7mBGwtJYNU=;
        b=ZQMF9EYxMCNSZ0kMWBIQOJNV6Lp7Dfdl8UOkMtZ5zHbGAvzLiqboX4J/dkhPDKkAd6
         HIb3nQ9iqlfZ7BNR31hvi+GceHcTDpul+DVFjpC6W3xQ7ZtGVmWCZxLTuam6JbqXsE02
         OAHY0YGrCKRva7yZ6XZZ6R1uNoeHx4pDmSlqM26EyUfbycMyEMTtHqNFDM86YoFqEeVA
         xyVo2NZbKJ3suZmbWsu7HuyFSvdEbWqQ8/SKPqg+0AqJZlR503Btc9uike6JbL6PtmXk
         HiuIL/bSmlS/5jwyHqMa3/Anf+X953Lx3ulREWDb6j3wu5VyJVQSJJrKAIjlp8by8Bxk
         K3CA==
X-Forwarded-Encrypted: i=1; AJvYcCWrSK1H7gw8aPfFRKvSiDc8mRTqAAoF8BQ/vYzVDRXYtkCGEDB5+Y8jTlrx+J5oGGobjrIlcFwf4nOzCkXcjsX8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1W4qhaFWAERrgeD3fFp3wQnKClNYukB+lyqvxeF92k3vY3pr3
	Lyqmtqmp6BKvygjgBjLepU9N95OxMaP0wxT5X0LiyZ1g/xE76Jik5CpVwVOCq7Yo+VN4x80pVc5
	LVw==
X-Google-Smtp-Source: AGHT+IEg8lPbC98Q9JebA2jYPeK+hKxfS04QHQm5CsFqWbT7d+JjvRp5WM7FCPdf80Bu6YTWW9INVq/0XA==
X-Received: from wmbju16.prod.google.com ([2002:a05:600c:56d0:b0:477:9945:466d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b27:b0:475:da1a:5418
 with SMTP id 5b1f17b1804b1-47d7f062feamr25842635e9.1.1767691468308; Tue, 06
 Jan 2026 01:24:28 -0800 (PST)
Date: Tue,  6 Jan 2026 09:24:22 +0000
In-Reply-To: <20260106092425.1529428-1-tabba@google.com>
Mime-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20260106092425.1529428-3-tabba@google.com>
Subject: [PATCH v3 2/5] KVM: arm64: selftests: Fix incorrect rounding in page_align()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012430_645025_394FB9C7 
X-CRM114-Status: GOOD (  12.88  )
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
2.52.0.351.gbe84eed79e-goog


