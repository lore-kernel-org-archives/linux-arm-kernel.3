Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FF7CD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn2prO5o05wItrpzO+IXrwTtuowQn2HpWBal1Vxejcc=; b=m5mPexcrDllY2T4rj7D2QrbAbE
	2b+QVXNbq9z2HjqkRwQ+KB5dPvSAEkpqt+yf3x+3PfwYZxj2JmUvdKgNAcD9TEy/ql2kskoGEILMs
	7ay+Q7crx5HLFMy7x2Q8z3sfCHXnMLrdyShJlr5FcievnSmE0sQI+LcGCaGhDvJEribuTxfyftNHM
	epR1RJ+FY0gx4UWPFH5i0tJfyT4NjZ/Jq2z9qKspHqK5VbcmOMfrIYSnO5cSnnUW7t0cM50hpQww9
	Hk9StT18CzYf29nPpDpX4ch/9M/T0zScdrKxRyPc6J5f5dRqG/mdgqX5MROYrYPhBwRlgFFE6Fw9a
	7xiQD6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kD-0000000Gy2w-3Sai;
	Thu, 04 Jun 2026 15:12:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kC-0000000Gy1X-1mMs
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 15:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vn2prO5o05wItrpzO+IXrwTtuowQn2HpWBal1Vxejcc=; b=mf0ujENRs5bgQyS3WevheODGun
	Z5cAajkZ6cyK1PB7O6XYxgTpSmq54vig09IFyhFgj9MREF/Y9HX9KMAuM1mIQ0TJQAc7BxufkEjz2
	b7OeOpialEhOXjsX817XztXJ68yzcIZQ7T/SMmIpFcf9zvDNXl1HveaPX3gDG/yHKN567TLBPqOK4
	nTZOvTa4RH9IZhsYc8QnsutOdZFAVC6W4atD5oplvZVKgh1budDDHMEHBhyW9MHASS+JnegHgqG9T
	mifGR6sum+F4CSdg60fyquOp+nolE/m0TTROCgsnpXxXNgI1D9d2ENX+bbcQEGTmK93R/RCZ4HT54
	LiCbQ+sQ==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9k9-0000000EUcT-2oEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:27 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-46010bc0f1eso525336f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780585943; x=1781190743; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vn2prO5o05wItrpzO+IXrwTtuowQn2HpWBal1Vxejcc=;
        b=U4IcAHNf3EEoscMEjaDgbciC/u2HmiuENO/MpOpM6bQXYNp88sFIXE+SnKUgRV3Yrg
         iNNaxiW6pSKGQBke6IrlNQY57AQvhEMJcj1S2tbYLSiYrlQ8Gaax3kbHvmxo5qNF0qaP
         XV23185/ey5Dy3wcxaOmFTjI5wIF7rRsJdD6BE/og+VhUt9/rp3p9/Ym8P8Yl6z/0XMH
         0Qs/zGXDBH7aRYi7jh3Ejn9TqrL9j0+Dke3SGQGdOudis4gc+aBWVS3eY56CGX5J1IAo
         m0qR5PTk0I/UhiPo4vb4Licp+FCgT116WSuwiqvPYjObF+e3Dhe5CTyQNSzzzV2zqppP
         487w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585943; x=1781190743;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vn2prO5o05wItrpzO+IXrwTtuowQn2HpWBal1Vxejcc=;
        b=Hf8vpq5GiogrMWJ5aGgN7GGcO0k+7anDd1oV2aHLqCmuKmIdINbGlhRPrtJnq3gQlm
         sgX45fOTItS+9SUUefZVNHKZARW5kAxU8/FBSBTmlqTcQV2E86RMLYnxytCyxMUcoQPp
         RUk6YuzCp3kGLIUP5Z3syoBZ50kj3RtGfv+zrNT9oaWfJT57wjrL7ljB/AZRkhgh/JWV
         s5g19CBXTBc+wpzKHaQxtYprCF8j2T0YJ6PrU6WI2PlqXLC+4yxp34Yenr8fZC8F2GR1
         EMtvY3Sn8nwW5bvCLra1ISCsk/bfkfdoz/F8Xv5SijlNW2/U4BXk9LNlBOuzqaGMztHP
         Dz4Q==
X-Gm-Message-State: AOJu0Yy2elOk6h1qkBRsVEURvnobj5y8sHsOzscmSqAGsWqLzLCt6ph5
	cVMeRDSo8p5seu6JMKa0KcEudi5g7VYVC5EKQqeT0wLMq+oQm27XSIZWuTobZIfF9VbgeVRxnss
	Fwnfq1hlD0m2jyvWhMu0rokC1IG1AfNGteR8GG29eDpp17oiv8l3A3Pwesu7nb5+LaG7TOdjkll
	v9YmoOpYs9HSJ77LYRSUG1Cjmu2NcT7f+B7ePQLVGH0H+q
X-Received: from wmd16.prod.google.com ([2002:a05:600c:6050:b0:490:b32e:ef70])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1f96:b0:490:53d3:47a9
 with SMTP id 5b1f17b1804b1-490b5e7962dmr132211665e9.3.1780585942997; Thu, 04
 Jun 2026 08:12:22 -0700 (PDT)
Date: Thu,  4 Jun 2026 17:11:57 +0200
In-Reply-To: <20260604151151.150377-7-ardb+git@google.com>
Mime-Version: 1.0
References: <20260604151151.150377-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=ardb@kernel.org;
 h=from:subject; bh=kV5OmQpXjgFAS7tCAScTDlrNCgx2UTozsq6mIJLDLaw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUtx6oHaU/ozd+7jFmBSUJq87skO7VmvdH5vr4uzO/6a/
 /8qmZMZHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiN04w/M+bulX5sH7iIYlv
 m9auPOww+5Ogbav4KsNWhoy7ydPPZ7cx/DMNen1ptYP/+hXK7y+dj7zCqlgRIvO9IfjDscc8ne8 UWhgB
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260604151151.150377-12-ardb+git@google.com>
Subject: [PATCH v2 5/5] arm64: mm: Defer remap of linear alias of data/bss
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_161225_857193_6C2FCE1E 
X-CRM114-Status: GOOD (  15.00  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Marking the linear alias of data/bss invalid involves calling
set_memory_valid(), which calls split_kernel_leaf_mapping() under the
hood.

On BBML2_NOABORT capable systems, this may result in the need to
allocate page tables at a time when the generic memory allocation APIs
are not yet available, resulting in a splat like

   WARNING: arch/arm64/mm/mmu.c:821 at split_kernel_leaf_mapping+0x15c/0x170, CPU#0: swapper/0
   Modules linked in:
   CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.1.0-rc6 #1 PREEMPT(undef)
   pstate: a04000c9 (NzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
   pc : split_kernel_leaf_mapping+0x15c/0x170
   lr : update_range_prot+0x40/0x128
   sp : ffffc99ad3863c80
   ...
   Call trace:
    split_kernel_leaf_mapping+0x15c/0x170 (P)
    update_range_prot+0x40/0x128
    set_memory_valid+0x94/0xe0
    mark_linear_data_alias_valid+0x54/0x68
    map_mem+0x1fc/0x240
    paging_init+0x48/0x210
    setup_arch+0x274/0x338
    start_kernel+0x98/0x538
    __primary_switched+0x88/0x98

as reported by CKI automated testing.

So defer the boot-time call to mark_linear_data_alias_valid() to a later
time when page allocations can be made normally.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/mm/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d68e691c093a..3134f1c1097c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1095,6 +1095,9 @@ void __init mark_linear_text_alias_ro(void)
 			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
 
+	/* Map the kernel data/bss as invalid in the linear map */
+	mark_linear_data_alias_valid(false);
+
 	/*
 	 * Register a PM notifier to remap the linear alias of data/bss as
 	 * valid read-only before hibernation. This is needed because the
@@ -1237,9 +1240,6 @@ static void __init map_mem(void)
 		__map_memblock(start, end, pgprot_tagged(PAGE_KERNEL),
 			       flags);
 	}
-
-	/* Map the kernel data/bss as invalid in the linear map */
-	mark_linear_data_alias_valid(false);
 }
 
 void mark_rodata_ro(void)
-- 
2.54.0.1032.g2f8565e1d1-goog


