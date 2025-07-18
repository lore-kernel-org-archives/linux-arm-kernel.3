Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49546C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mD+HVqN3WPJLojBzYXQzuQgwE2qXKv+6zoEogWdZmKs=; b=u8bcilrt8WSTbOkb5wqkkasZ40
	sQs7nsijbRtsVpP8pKDQ9UNIn+4B83BQ8HjRTuXHCuJQes0ZNJXB9lo7ss8MCneSz1wlpYmldhmHb
	ygjcaEZNACyu1ZWrfpZkxEmFP5C+QC8CGFGJCd8hMUY3TAmLPz/K98twFwcSMhs7dJT+kXE/xC+KV
	nKiGAgtsV3umSCVZbbfPyGvwijbZ5a/hxKm/JWEjAxSoigIoBUUoAPz6UmyTVU2gqhCxJp0/eJhDJ
	fuwMUSpmHP9szntsuEm4bnX94l5tcnhNq2Rj1tEzO2xaXRLcjSn2XN+EerkSfrkP7CRF9ms/iTNX0
	e0CDQslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctgn-0000000DYRx-1zY8;
	Fri, 18 Jul 2025 22:36:25 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucteK-0000000DYB7-33or
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:33:54 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74913385dd8so3496427b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 15:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752878031; x=1753482831; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mD+HVqN3WPJLojBzYXQzuQgwE2qXKv+6zoEogWdZmKs=;
        b=sedI72Yyi3P7RgHJjRsl1o454c6gISAgXqcMOxi8NJHtJQgml8WcpsAf78Dx0D2SbT
         1hijP453SfAWgBO8uILdFXe9XzWvMu492oktSbE8p9UCHmPflSqenfXIMQ4sIA3eTAD9
         g8CzXQX+lh8kcnsx5R3XuXtlJM3mN7g5ZGld0OQs1C9yQHYI962JPCGEu81qoeMN+Wpl
         8xKmvC5YbeBTXIo0bHGRMmW77Lf8AJ9E1yn9/h/hehRcECy+P/Oi20H83T1EPxuoRIDt
         vJmgcE6gXHNvZnVXJp4tYi4cUlT0ES0RSp9ol3/l0xSKkCTNiYU4Wk7f0aXtYJBscaVm
         0dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752878031; x=1753482831;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mD+HVqN3WPJLojBzYXQzuQgwE2qXKv+6zoEogWdZmKs=;
        b=BTMXMo11mfTnLBRG8AuUfIpLfDm1umiZJJ4nmCA0Jp35GZQII1jUfp/ZKHGMZF1vda
         uHSxHaKgWlJppWEagG6QAn7Bf2nNIGOgNkFqrf5gPy9oXrrx8YYq42eMU3ZJVDhs1OU0
         ABZBObQFUxwms5bu5gKHfnOQNkxX1dA6W9Em5QwZy9MtYkN/K/l5gcpvdt5y3h0hdgV3
         Lgvriwi58Cox9C5CZhVOxwqb0YdxnTlKvNC1ENEGeNeCAaCcTic1sOumf4QFWTzFan9p
         G03XbPPDpPULbsTR+DepmKPBAYI/mtPu6L6HyVM2zwBAZuUUnn4afJnAFPekkoaNEw9h
         N2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVglJvwhV8Hbak0w+5uNGlPBsQbaOIirvuCXZiYPRDnSHO5wHimWODpOAFGSmHas1t9nr9NFtuuSa9zGrLjlJuW@lists.infradead.org
X-Gm-Message-State: AOJu0YzmqXSlLToWGiIR08hS/CCZafWD1rpAiZYblnxaLddp6eW+6Obt
	EnmDgwffJCvjm/uJRtDXDpx/UngFpBddlBu+i8ROnowZShG44vL6eWltc0VEPHDycu4WnkaSn1K
	kU4rj26z/N8GQC3Ow24si/lJO/D+KKw==
X-Google-Smtp-Source: AGHT+IF76ZDCYrFCXNd39CP+g3cbr5cmPiGoyqrtsyE1XyymU0tC7E1N3q1xzAmrH00ZwIvhlGH4+Q5SK9tcWWLFN7c=
X-Received: from pfll21.prod.google.com ([2002:a05:6a00:1595:b0:749:937:54c8])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a11:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-7572427c40amr16482133b3a.14.1752878031332;
 Fri, 18 Jul 2025 15:33:51 -0700 (PDT)
Date: Fri, 18 Jul 2025 22:33:46 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363; i=samitolvanen@google.com;
 h=from:subject; bh=Zkabl1n/hoOFs8GvSG+qj0P539pNqpMrXSATdXERG+M=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBlVp09yb99yReHUEnnh9XXLP+yOFPoX9ZFl7fVN93Oas
 25w/+C40lHKwiDGxSArpsjS8nX11t3fnVJffS6SgJnDygQyhIGLUwAmkjuL4Tdbvx/Lqtf85UsW
 m7ad2MB27gB7QyinO+/h5U/rVs+cn5vH8L+u5VH6sawg+3u2QVetYneeCzyt/3pKcGWHfNDyz+o MfUwA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250718223345.1075521-5-samitolvanen@google.com>
Subject: [PATCH bpf-next v11 0/3] Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_153352_775869_BC86FC88 
X-CRM114-Status: GOOD (  14.13  )
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
v11:
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
 arch/arm64/net/bpf_jit_comp.c | 22 +++++++++++++--
 arch/riscv/include/asm/cfi.h  | 16 -----------
 arch/riscv/kernel/cfi.c       | 53 -----------------------------------
 arch/x86/include/asm/cfi.h    | 10 ++-----
 arch/x86/kernel/alternative.c | 37 ------------------------
 include/linux/cfi.h           | 47 +++++++++++++++++++++++++------
 include/linux/cfi_types.h     | 23 +++++++++++++++
 kernel/cfi.c                  | 15 ++++++++++
 9 files changed, 105 insertions(+), 125 deletions(-)
 create mode 100644 arch/arm64/include/asm/cfi.h


base-commit: 0ee30d937c147fc14c4b49535181d437cd2fde7a
-- 
2.50.0.727.gbf7dc18ff4-goog


