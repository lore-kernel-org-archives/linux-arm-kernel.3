Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F008CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 01:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDQCK2/EquRg/k7XYFN0Oigmy4lwGMoivZWG2vYqpbY=; b=j4P/4V98XPGVWgP/fbE8X0dGgo
	OGbgN9xP81MvG06nJk9TlTtTn9ooweED9vdNsW2kjgKAfaKmpK7w8gvTAdeBKy8OK/dLqejHVQXXO
	/RhGfZvhmvz9WAhG6H7FwCgpxharQGMG4aS9QhUksKqG9w/+YmgilfxS5CZ9yFmWt6Q2JDyXmpdLC
	xUfMycjynm0prGcSG2UrCVqV+ErhWXuiTIXbOP8H9Fo/vVRkCAVYevhbXwWz8/VqpxtRQyVe50bfn
	T2tsRc4Y+W2hUxvXpErcR4yFgpXIbsRdmMpNK1Yyj0f2nZ2YgPfPnN4Qq25Bmw2tvdij5i+xirw7J
	EqUKO3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uheZ7-00000004mJJ-07ua;
	Fri, 01 Aug 2025 01:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdLx-00000004i73-2xUu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Aug 2025 00:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=aDQCK2/EquRg/k7XYFN0Oigmy4lwGMoivZWG2vYqpbY=; b=qLjwGHe9qRDvQWZw/oaxMAo/ON
	Sp0q45E7686LSy/lTW/iQigxZ9+D+tluFuJu5h9tpnDLmViP415uzlzgjhYKNVJjX2aCT/4yWYmiw
	RicbjsKSWi/fcAdbmg/Lg0pcb/KVjWYnGuGiulACtfCIRVbllCRhv95W4vVVuYlgyP4f+yPezhnYi
	nkIwTvHA1cV/Xete9Qmd+nBxW2fppbpBfE/uiWOfaHJl6GvkQXnXNRsNh7pxWboaQ1rKchXKEZFzc
	wl5ztHSOb4NqfBBtUeXCxJVoUQB/a2ZBD21s9RhpTDceFMfqBd5V6PnYbtDX7RzaZAhCLabHygKfj
	eVsJJLyA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhdLm-0000000DBDM-06nr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 00:10:25 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so1516096a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 17:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754007009; x=1754611809; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aDQCK2/EquRg/k7XYFN0Oigmy4lwGMoivZWG2vYqpbY=;
        b=0jGc6Blw5i9MpwDB9BxaUVLkiH89KVXNZB6sRV/EPbBrVETfa7+jndiXXYIDEOZIw4
         cXXakJKw6VmFHSsS7NjHeNuZ1+HmPE/hHqB3KIeP5EFRLrhhHJpLVQVhX0YtPCCy/y+5
         qrGqyiOui9704znWojmTR1JXo2v8Ng+YD6HEHYXWvIcV07hlK9J3aaZrs1IkSZ6AYEkc
         Jcd49aeCVQSeqzDIxc73as4nAxxsHsquB5mPBRRsrZnaCOkLJSVm1ycLrGWkQF9Ep42V
         W3jzfgripLxVMDHx5vGotliZqrZohWUCmpOu3Q6ErPACExzaoMHW8+6o4Zj4YEl6alRO
         QLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754007009; x=1754611809;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDQCK2/EquRg/k7XYFN0Oigmy4lwGMoivZWG2vYqpbY=;
        b=BK0YN8NMpYKC8Q0Tt/7l4tpk9tHrAqIjV3omkodmwtLTQ4qMCaAZlb2O3nloJbfZ4f
         1QW+nZvCRDnz1p3jiS6Lb1whStVzVxcgU5vv7DdiJPF8L8MkDnknkfkiu2PltcJA+36w
         2cG/ChLltVmffc0f7d4b1ENL/sr5XgodHu6K8oRLKMkWdOy7X2C/m32J4AaTNAIJoVer
         rPHy7vRQ2C9yQbDey2uUsV2YFaDVdt2IBvkOnCRQqSdBYF97W38v+HcP4Lfi6LKLj59F
         d6n6DseZbI+mmeEt/jr5Gd/6QgyeMllkq/sOkNmZEPsZysCO0PubfAvl/75LT7OEzH6y
         KbQg==
X-Forwarded-Encrypted: i=1; AJvYcCWbzS1acCeNq9ppeWaFqh8YB+S+R5FzWe4K4/o2XCylnOkIE/xCc9DMjcUWi5c9U1AIYidXRAhN6keOQSuTTYId@lists.infradead.org
X-Gm-Message-State: AOJu0YxwL7YVkuVpI70rvwBKa4NQfrmh5DrrJCEbLC5FnEH9MLKvKajn
	zDH10vBo7YvT8Npg7hhjuAmmuYE2JQ6grLg1vin1IwzGN7xy3wqkBQj7rlmj8yeJsdpmXidOksU
	w2XCnUkgpXmF408OyxHRy/HVQpVDEDw==
X-Google-Smtp-Source: AGHT+IHZZ7EEAh9HKj83dC9nIQhBmQgVN1LOsyaTmp6Z0Vt/ThwRwYQj0yd0sOx+f1j3SKHolQSEJSvbzgkV8bXIpdk=
X-Received: from pjbqx4.prod.google.com ([2002:a17:90b:3e44:b0:31f:1dad:d0a4])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2cc6:b0:311:d670:a0e9 with SMTP id 98e67ed59e1d1-31f5de34fedmr12380677a91.21.1754007009400;
 Thu, 31 Jul 2025 17:10:09 -0700 (PDT)
Date: Fri,  1 Aug 2025 00:10:05 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2809; i=samitolvanen@google.com;
 h=from:subject; bh=006CAAC+mAF/qo0GrHQSZ5TaiLtT/c9suFkKvoupvmE=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBk9rHcMgw+bOMbyRG2ad4t1jcwJdSs1bRPrHRcUWWJkV
 xyXN1zSUcrCIMbFICumyNLydfXW3d+dUl99LpKAmcPKBDKEgYtTACbymZ/hf2L8Nre7TY3Zyrbn
 JPwThYoPrQhrqL/m9fXv0tu7D5tyVDH8lS0T4/r8mnlxx7K9m5R/ecyIWLK99JHOS9+/hW53uLw COQA=
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801001004.1859976-5-samitolvanen@google.com>
Subject: [PATCH bpf-next v14 0/3] Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_011019_768874_072BEDA3 
X-CRM114-Status: GOOD (  15.06  )
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

Hi folks,

These patches add KCFI types to arm64 BPF JIT output. Puranjay and
Maxwell have been working on this for some time now, but I haven't
seen any progress since June 2024, so I decided to pick up the latest
version[1] posted by Maxwell and fix the few remaining issues I
noticed. I confirmed that with these patches applied, I no longer see
CFI failures in jitted code when running BPF self-tests on arm64.

[1] https://lore.kernel.org/linux-arm-kernel/ptrugmna4xb5o5lo4xislf4rlz7avdmd4pfho5fjwtjj7v422u@iqrwfrbwuxrq/

Sami

---
v14:
- Rebased to fix a merge conflict.

v13: https://lore.kernel.org/bpf/20250722205357.3347626-5-samitolvanen@google.com/
- Added emit_u32_data to fix type hashes on big-endian systems based
  on Xu's suggestion.

v12: https://lore.kernel.org/bpf/20250721202015.3530876-5-samitolvanen@google.com/
- Fixed sparse warnings and 32-bit ARM build errors.

v11: https://lore.kernel.org/bpf/20250718223345.1075521-5-samitolvanen@google.com/
- Moved cfi_get_func_hash to a static inline with an ifdef guard.
- Picked by Will's Acked-by tags.

v10: https://lore.kernel.org/bpf/20250715225733.3921432-5-samitolvanen@google.com/
- Rebased to bpf-next/master again.
- Added a patch to moved duplicate type hash variables and helper
  functions to common CFI code.

v9: https://lore.kernel.org/bpf/20250505223437.3722164-4-samitolvanen@google.com/
- Rebased to bpf-next/master to fix merge x86 merge conflicts.
- Fixed checkpatch warnings about Co-developed-by tags and including
  <asm/cfi.h>.
- Picked up Tested-by tags.

v8: https://lore.kernel.org/bpf/20250310222942.1988975-4-samitolvanen@google.com/
- Changed DEFINE_CFI_TYPE to use .4byte to match __CFI_TYPE.
- Changed cfi_get_func_hash() to again use get_kernel_nofault().
- Fixed a panic in bpf_jit_free() by resetting prog->bpf_func before
  calling bpf_jit_binary_pack_hdr().

---
Mark Rutland (1):
  cfi: add C CFI type macro

Puranjay Mohan (1):
  arm64/cfi,bpf: Support kCFI + BPF on arm64

Sami Tolvanen (1):
  cfi: Move BPF CFI types and helpers to generic code

 arch/arm64/include/asm/cfi.h  |  7 +++++
 arch/arm64/net/bpf_jit_comp.c | 30 ++++++++++++++++++--
 arch/riscv/include/asm/cfi.h  | 16 -----------
 arch/riscv/kernel/cfi.c       | 53 -----------------------------------
 arch/x86/include/asm/cfi.h    | 10 ++-----
 arch/x86/kernel/alternative.c | 37 ------------------------
 include/linux/cfi.h           | 47 +++++++++++++++++++++++++------
 include/linux/cfi_types.h     | 23 +++++++++++++++
 kernel/cfi.c                  | 15 ++++++++++
 9 files changed, 113 insertions(+), 125 deletions(-)
 create mode 100644 arch/arm64/include/asm/cfi.h


base-commit: e8d780dcd957d80725ad5dd00bab53b856429bc0
-- 
2.50.1.565.gc32cd1483b-goog


