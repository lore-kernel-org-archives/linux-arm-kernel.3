Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1314CCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oimI3tmTeudUzVEIRzgp5TsbqR86loAKNzvaAFIXh5A=; b=ZtV/VtuC7ZkeNlpyPL+tWG7/AA
	awDotmf1lJ3VNimNQ6FG0BIL+mI/VNW1sjAeWJ+isBa2QOzfrQKV5XhurabhERx+xUuUqEbj7jWTJ
	ZX2D1srZP1ifx8PDHamVeRu0FB9IK12Kamwqb+tTz2ZDSNvNJpPjnL1lHQF7h3HZYw37dvj+M9hgg
	mZZFYrScqP9VLgMOPrAOY6D0HA8HXhQmTASydP+JGkMwBZ6IcawsvnT9RYSHezhIQq0ZrQvwq9rA6
	uWSA3FhbU0V5MLa6w4DRGCLezOLBNJHLeyo3aAUeD9UJxdKeTpl+6vq5ctXnfAZQKTjRKIlv/UEAa
	zToVxvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBl-0000000FUeO-0BUR;
	Wed, 03 Jun 2026 16:11:29 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBh-0000000FUay-3Irp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 16:11:27 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490a767b782so29861805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780503083; x=1781107883; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oimI3tmTeudUzVEIRzgp5TsbqR86loAKNzvaAFIXh5A=;
        b=U8+rJGuIINgziSs5UOI/cUBZl2ddc8NO7ZR3hp5BNmqIJkUD9XvZoxw/1P11BHHUBw
         +7J2hBBJIgr6ZbhEIh4Ta64S5IZwfIOh3/l5w6SKe9GmJdHDvCChkMduPxYuhMKU4Ds7
         V0CH+1VrB3H/eqxWzln07L4gYGWPVzJAZwv89sqUlIdQBKiplJk8I5ziuFWR2DbQa9CV
         q1GoPlCZwVJYUqoVJSZonRPbVPFqPWfNu4bmR0SSTO1sgeq+1tN+ueo0RQ0GRHCuAsQ8
         hI2M62PmLucgykVqaETCt8cwFUMT5fYE7EsSMyV67M+0nTo3UXp9QB1NsMutwGspX5mB
         4JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503083; x=1781107883;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oimI3tmTeudUzVEIRzgp5TsbqR86loAKNzvaAFIXh5A=;
        b=SewEot0YaaYui7F1EEWAc/0iY9zFqvM2pmZvbDzm1sGYeHbQxvogbgYxfnhhhRSFHL
         G2DUjFKPnHXLTwKxSPR9hXpuEw/YB0y0dHitVKlMOq5a1dJd3GYFcWLGk0mp/ZlaUYBr
         6YZCl9mL3N9uGLR78x/VYzy0Yt07bgJviqLGNT7zjO80lu2CM5HBwAIPMfRhyiXnzScG
         XkAhroWpBElerGbGMKKLg62/YSHdZLVmuLy5vzaF0tvoqRSYXBz+YDfDQkrNpPmRn+ml
         jchq+AQO9Dz6l43nwi82qjVSbC1OMnQQMCEIoxZOwYBZNNjOQX92IkwPk/lLnFmcqhWS
         uOgA==
X-Gm-Message-State: AOJu0YzAWJGyIOrwGOQ1fiynpyLHuQcCIkeBAgun5sdWnSW/qQFQnFCN
	uII5REvPU1vAsWvTPkBKQ5dfwg0cNehGKxdDTft2/H1MuREN3hZgoI4mfzfgR14MFjjUCiyVMov
	auLFuCwNqNldjbEx2W0Fd8+4qXSMws89HVFbvFs8rtkCxBE4OOUEZI6Z9nxRrnktri4k2Ni9TIa
	Cpr6aoW3qxVWA2gtTJMmWcVCCk7hyPIOqOuV7H1bkshUJ8
X-Received: from wmpy16.prod.google.com ([2002:a05:600c:3410:b0:490:ac8b:3a74])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b09:b0:490:b475:af32
 with SMTP id 5b1f17b1804b1-490b5e5da1amr70363605e9.23.1780503083096; Wed, 03
 Jun 2026 09:11:23 -0700 (PDT)
Date: Wed,  3 Jun 2026 18:09:54 +0200
In-Reply-To: <20260603160949.3372482-6-ardb+git@google.com>
Mime-Version: 1.0
References: <20260603160949.3372482-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2090; i=ardb@kernel.org;
 h=from:subject; bh=kKVLW1q4ohISCLzJXLX0SgEDWExD4Na9wQ8ubZPYl8I=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUsh8Mofu9i66rN/dCOM8tobT3uXTsizYVojeUT/yoE4j
 ainrLIdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJ7XzP8M/gj2uC0dkLiVZeP
 rrlLLOYbiD5v1l/KN+3Svtr9jP+vvmdkWCXPzaSt1VYk1WmqKr5xw5Tnq5nE3OJeKPcssJr9jzG AAwA=
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260603160949.3372482-10-ardb+git@google.com>
Subject: [PATCH 4/4] arm64: mm: Defer remap of linear alias of data/bss
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	maz@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091125_880085_F6FF2426 
X-CRM114-Status: GOOD (  14.70  )
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
2.54.0.1013.g208068f2d8-goog


