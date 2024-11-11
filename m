Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8030ED2E9C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNBukOu1EEBXLUk3gBsuXsZGxSJ700KmVv9Tr4tlKX4=; b=W/o6TCpOu5eqr84K7r+ygz3Y7V
	W2cvwiUw1GzKDbMlOPZ/jQIg4LTFqZ/iuAkwtq2lEC1BFWjHXijrZLL/jeRjm5PQ1tqee0aJtM9kx
	N3Eb3ek7Fa/S5yVQihdfXB/4c5KKO4V6R85tTQMLnDPI8PNNDTY7N89Nt9PSOetzLqArenQklOMtI
	1JlIltPiOxDO56G6v6ifYj4k5to6ueJp6ac8D/P9uMg3lPUZ91koGsSrymtwmKHiJepe8fwRjbJw1
	99sV9XFchmBinYNs07Stk7TJmo34CHJVanoLRZphNE1ZY0Dy9h4QrmE2DASYtUPT1X841ucDkhQiT
	YP9y1lww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPvf-0000000GpZm-0AGb;
	Mon, 11 Nov 2024 08:37:47 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPtt-0000000GpMt-0sUt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 08:35:58 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30d7b4205eso6481834276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 00:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731314155; x=1731918955; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gNBukOu1EEBXLUk3gBsuXsZGxSJ700KmVv9Tr4tlKX4=;
        b=h5mjAdG3pTillhccTDxSk0X3KqyLvHDT0YekvQhkG9m8X0YwjWBgbeignW2n/Vv+F/
         ZOg+l/pANJdsTBp7un1lWZrtZ2c7fEhLQhTt08Ooc7YJqLAx3i81zvxVO24/4VjSFvHc
         gUhOlFrJESBlpc9xr5uw8xMxBhqVyz3td/atWiDJ1I5qtqH7qh5frVEoOzAoC4jLTLm+
         JSPmd4ZI06sWygPcYK9LyObbVTofeXwucl5S1Jnue7in7jDChO7g+XW8pzeDcs+Oxs67
         ITs4YmOw8Ap0W5DPevAu84Pw1kzI2e5sV2kgLui+0/yZGbX/E61kOpqJa1CY/a4iDsG7
         8uTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731314155; x=1731918955;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNBukOu1EEBXLUk3gBsuXsZGxSJ700KmVv9Tr4tlKX4=;
        b=wlbZjYtISx0qHd4BvXihdNZ/0xZbJTstuIJvrL3mmxpox5L7dwJEfBtw3BG2uVFyji
         +YLLpxFS9fZRP6s8CxGLbFXbjXK8NpoS1qWNQoSYOqbrcFB9WQgMhKDFUatp0v2xTy93
         74gV/T3bE+grG2Xn/9t8zNHHPvg/VVwoPGSXN/5f/Yb1d4L9Mu4eX/Puk5Fu1Y1Wv8oH
         AvLG2WCLiTjlhG0viV1kTvH2SdaaCTp31gXiLotVUnvWLII7g1oEOgDIEzZ9r3096uN9
         FgmtjHWNgm/+eokMZpofr8PAh5dZ7YrwRNwc4SbDvhtWbVkCuY952Sm1pMgNKsyb3cKk
         UBRQ==
X-Gm-Message-State: AOJu0YyZBW+g7CSTm4XgIK0RW0ydb5/HsbbaEM+d9u+t7UIjKQZ8UOgJ
	luftmUQ9+DUMu549JReUGUwylWRv7E9qteib9QfkNoot18H2mESho33SQZjp9GtS6dJlVckgflL
	51kRp3TnElE6GiQy1lPdi+GM3sHuZ+UGwpI4XfKQdHh7+4htHcrIofkkCabDySUrMCZiI6Dw4OG
	iGtQG3nnlbgeDbmzNiqiw2nGRKzS+ns2gNQX3JVnl2
X-Google-Smtp-Source: AGHT+IHq8Eb4ZNPHtFKtDM1xvzlSnEABgakwSFAoY5JAdTzeDwBcK+FbLvSXoGjSBrBemU7zxUcds5oG
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a25:b78d:0:b0:e2b:d099:1a7c with SMTP id
 3f1490d57ef6-e337f85aa3amr10416276.3.1731314154317; Mon, 11 Nov 2024 00:35:54
 -0800 (PST)
Date: Mon, 11 Nov 2024 09:35:44 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528; i=ardb@kernel.org;
 h=from:subject; bh=F+GhEc2F9iqtM3ch27znMP5zogV03DfIdcXzAAaXKY8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JId3w4IPsW0wRqyd1i6oknovQSpSfe4l7zUpJndqcFgWe9
 nn7di3uKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOZf47hf9gp72nf16hr1Tfe
 kp4XqOloxRXweNbipSfn/qu/LsDfbsnIsNrjas8MbjefPkN97W+TYzfd8TqwyDDeQpKR+8Qyr5s nuAE=
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241111083544.1845845-8-ardb+git@google.com>
Subject: [PATCH 0/6] arm64: Clean up and simplify PA space size handling
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_003557_277763_CAEA7B1B 
X-CRM114-Status: GOOD (  14.08  )
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

This series addresses a number of buglets related to how we handle the
size of the physical address space when building LPA2 capable kernels:

- reject 52-bit physical addressess in the mapping routines when LPA2 is
  configured but not available at runtime
- ensure that TCR.IPS is not set to 52-bits if LPA2 is not supported
- ensure that TCR_EL2.PS and DS match the host, regardless of whether
  LPA2 is available at stage 2
- don't rely on kvm_get_parange() and invalid physical addresses as
  control flags in the pKVM page donation APIs

Finally, the configurable 48-bit physical address space limit is dropped
entirely, as it doesn't buy us a lot now that all the PARange and {I}PS
handling is done at runtime.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Kees Cook <keescook@chromium.org>

Ard Biesheuvel (6):
  arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
  arm64/mm: Override PARange for !LPA2 and use it consistently
  arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
  arm64/kvm: Avoid invalid physical addresses to signal owner updates
  arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0 sw PAN
  arm64/mm: Drop configurable 48-bit physical address space limit

 arch/arm64/Kconfig                     | 37 ++------------------
 arch/arm64/include/asm/assembler.h     | 14 +++-----
 arch/arm64/include/asm/cpufeature.h    |  3 +-
 arch/arm64/include/asm/kvm_pgtable.h   |  3 +-
 arch/arm64/include/asm/pgtable-hwdef.h | 12 +------
 arch/arm64/include/asm/pgtable-prot.h  |  7 ++++
 arch/arm64/include/asm/pgtable.h       | 11 +-----
 arch/arm64/include/asm/sparsemem.h     |  4 ++-
 arch/arm64/include/asm/sysreg.h        |  6 ----
 arch/arm64/kernel/cpufeature.c         |  2 +-
 arch/arm64/kernel/pi/idreg-override.c  |  9 +++++
 arch/arm64/kernel/pi/map_kernel.c      |  6 ++++
 arch/arm64/kvm/arm.c                   |  8 ++---
 arch/arm64/kvm/hyp/pgtable.c           | 37 ++++++++------------
 arch/arm64/mm/init.c                   |  2 +-
 arch/arm64/mm/pgd.c                    |  9 ++---
 arch/arm64/mm/proc.S                   |  2 --
 scripts/gdb/linux/constants.py.in      |  1 -
 tools/arch/arm64/include/asm/sysreg.h  |  6 ----
 19 files changed, 62 insertions(+), 117 deletions(-)

-- 
2.47.0.277.g8800431eea-goog


