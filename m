Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29564CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oQpDktMuJeHzAycycK0zHXfq1NrEyk0DRgWt786hC0g=; b=X7r41SXjoClQ71Uj4oGwk2urVS
	hROLN7ipTO5AFAVq7z5Yg7TZUFr0w2JTM8Pob/CYAc7j1SxxsIVCMNE68hFE6cY21go68dNauF3Vh
	o4pY38y360GlimtStmz3yOjS43pI0XPd4q5663wjmNujl3gWa6uxiPN/bYLACJUutAa3c3gj5RIna
	Y2XH7XKDHrMibSA2Bu6+Pa7eUALpfii0XTLQxZ0zM3UJG2Z4T4qEd4Ii5nLYbxU/KJcL0RWMCxukN
	ZtYZPHvjYr3PyLt5QBIcZSXDNINokvwbIWuPjGIbD8U194qxpuS+xu3iAfzoLGLQZu5tL+zf2m1vE
	XscVnzQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBf-0000000FUaT-1is6;
	Wed, 03 Jun 2026 16:11:23 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoBc-0000000FUZi-3xV3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 16:11:22 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4601daf4c65so1196799f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 09:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780503078; x=1781107878; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQpDktMuJeHzAycycK0zHXfq1NrEyk0DRgWt786hC0g=;
        b=tdgMOIfxi8MEShIO+mm8Y6jO8jW/cpF8rYDHxkfnvuWIbPauoZZlqaaqSLgV7vfFiT
         /do2vn5WpUOMrNCNXTY200JGhfosnoWAbee5apoEB1PwhNS6Bu6bA2rJhoNg7x9DL+5M
         0EwGkkcCZevA+Poi1i85scVJ2lF9tG/4UJyy0OD2NQWHl2llY9wT7BrwPdQZSFJwP/9V
         JN6pJW29JbakpFSTlBkw/yRI5SgCF0IDQ8f2zkmVYvbwQwIvUjHWb0VW5amaBsJ4SP7G
         8GDubE3HWvs9TiqyORG9jklD1xnnWh+eTDvHaAaEswrYFOCEz6NWrnl1znYwwxJcjoH/
         Ua5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780503078; x=1781107878;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQpDktMuJeHzAycycK0zHXfq1NrEyk0DRgWt786hC0g=;
        b=B5VcqlcKOtNN35IC7x7vcPjbYGA3+Ys5R7X8HQiGjISV7k5URqAE9dSt9ockC0pwM9
         tnySOo3m5fmEkdQcOpgqxG5EbZ+ZJEDNR03hfZKQn/HOWQL5RXbTefq4o0TKIm3BVHVL
         hIkFIh3o+SPc9D4ErWWqwaaIWXgt8qLIrbl1ZHpgbTOl0QXGuyGtE9TAxxpupF547SqR
         FRsCzKR+m1FVjfeEWBoztBpxxfPzF5DT5D78D3T7tqfEFhlOYWPKGqgZkhumG+fNZ1jn
         ZGzlPzOuatZLP/Bc+/qKJszhm1k6BFMx8/tI5OeBPQekyvHe0FnYbEII353q8Y+fgHYv
         J5/w==
X-Gm-Message-State: AOJu0YwCBzWnL5GLZBSx6VsMRrgqtlPRLnBE9QPIlTV74IPcxaRKHOlW
	4kksGdC76+TdnCb3cEbXsfAufdCSxYaf2BvUXGIzIS7pxBgEUR2HkyXJhFkvZ9j94UuWxZOepPW
	M5BGNXPyNc9RP6LweARuTA1y0chRnBzcMVebd5jIf+nm4fmFJDvJHiX277JqFZEFrbEHRA1ukSW
	5Ief1LymBd/iTU5sQ2XvVSQbigjl3UNwQsKZVuIwxyvf/W
X-Received: from wmth11.prod.google.com ([2002:a05:600c:8b6b:b0:490:b475:af3a])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:859b:b0:490:b55c:cec3
 with SMTP id 5b1f17b1804b1-490b5e95fccmr54840825e9.12.1780503078163; Wed, 03
 Jun 2026 09:11:18 -0700 (PDT)
Date: Wed,  3 Jun 2026 18:09:50 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=ardb@kernel.org;
 h=from:subject; bh=JOcaecGImIfdl5TWZ/0jC1KNpNDZd0MmitdNR6ldmsg=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIUsh8NyctsUn3/xq+v33lMqeoyzPjyhuniKiu/Osa1iI8
 qeIe38/dJSyMIhxMciKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJ1D5g+B+X4fA4mbFVROF2
 i8Jxs5PT1u4MDU+szNkb3mM109H5ZhLDP8Obm3e/5bKZIKsrJst//8mXjWLPDvL95F5ss9+zS+G IIwcA
X-Mailer: git-send-email 2.54.0.1013.g208068f2d8-goog
Message-ID: <20260603160949.3372482-6-ardb+git@google.com>
Subject: [PATCH 0/4] fixes for data/bss linear alias unmap series
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	maz@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091120_988249_FBBEBC00 
X-CRM114-Status: GOOD (  10.47  )
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

Fixes for the data/bss linear alias unmap series:

- Fix KASAN related issue reported by Mark, by moving all KASAN page
  tables out of BSS [on arm64], not just the ones defined under
  arch/arm64

- Fix two issues spotted by Sashiko

- Fix the CKI reported WARN() splat on BBML2_NOABORT systems that try to
  split block mappings too early.

Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Mark Brown <broonie@kernel.org>

Ard Biesheuvel (4):
  arm64: Move generic KASAN page tables out of BSS too
  arm64: Avoid double evaluation of __ptep_get()
  arm64: mte: Disregard the zero page explicitly for manipulating tags
  arm64: mm: Defer remap of linear alias of data/bss

 arch/arm64/include/asm/linkage.h |  2 ++
 arch/arm64/include/asm/mmu.h     |  2 --
 arch/arm64/include/asm/mte.h     |  5 +++++
 arch/arm64/include/asm/pgtable.h |  4 ----
 arch/arm64/kernel/vmlinux.lds.S  |  8 ++++----
 arch/arm64/mm/fixmap.c           |  6 +++---
 arch/arm64/mm/kasan_init.c       |  2 +-
 arch/arm64/mm/mmu.c              | 20 +++++++++++++-------
 include/linux/linkage.h          |  4 ++++
 mm/kasan/init.c                  | 10 +++++-----
 10 files changed, 37 insertions(+), 26 deletions(-)


base-commit: 63e0b6a5b6934d6a919d1c65ea185303200a1874
-- 
2.54.0.1013.g208068f2d8-goog


