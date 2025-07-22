Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E63C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 20:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8x/kzgTk+8DzGIKGmGa1JqKZrjt1XWtPjZQyfMfNiGI=; b=tJCGI2NYKGRFmeSLHgl9RTbmOx
	QqegBpvAwSoYU0dOiJDg+WjTLC5NT5xCskSVjrN7lG8I5gVCWjbl/IMON4D6yonTPV3pNg7Og0Vz7
	VPsydnRiBBX8qiqP1xkClGgJ0+sb3XukmYuewWq8r5p5T2vSEpNo7twom/1B+VDM+XOhCFqquxhW9
	q9mGaZWJCZT1aGxKoI4DPqF2llLmwwWYGK/Nfa9E+JwzHZ1Q893cQp747QiDSGa26K41JQ6KjeWeA
	DWVltuMBb6JKWAVHfdNlcr53x3lhIdMoOwibDfYlWzWYfjsjwcvALmpNXXmMMPtp6au7dOOQyNZyG
	jTiE3+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueK2l-00000003TEK-04Ld;
	Tue, 22 Jul 2025 20:56:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueJzv-00000003Sxt-1w8q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 20:54:04 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so8177237a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753217642; x=1753822442; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8x/kzgTk+8DzGIKGmGa1JqKZrjt1XWtPjZQyfMfNiGI=;
        b=YhE7bYMBM27NhlTp/rWzVv3KtzAXwVywZwWQMfGsxJGjhSx6BEBgWdlgBJ/wURM5PF
         T4J7Kd05FIDpSRRe1apsnpF+XRCjk3Gbq2O0wqq829bAEnaO+AQ4xhvNdw42kMXg5cmP
         fVgB7EclRxqHdNOBirsE/nXqAVH5n4cdzq08pbP10moPPnQzFjOo1zTNHB8pobI26+zM
         C8kOt/KFw6J4IRqZZBYqNjTLtB5CyiWka1Jd94jS6rtA2jgxM9qB7H/hlZh3WLOHSPjv
         B6V+1NU+v9YNXu5vfu03i9xgMHBhvCh5VakUEzBVbhOm4jmY6bTT5mvJWEWNbpBhwyC/
         FU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753217642; x=1753822442;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8x/kzgTk+8DzGIKGmGa1JqKZrjt1XWtPjZQyfMfNiGI=;
        b=SCcDPYLO2yzGyyeADGdA2IjEmbHnbg2SwXrR/TkSmUfJMpiNhI2UBHFKwmgFrDKkXe
         5bdNJkqF99tCc/vN9dhQBdJoFtxG46fl7BsSzQH22V4smoBICTvGWQJtQ2XbEei3PyGq
         oleU9JEPmEuMCoR265vxzxKZLCNcO99h1MLZHobw0V8sP6jg1Np6MaYAkxSoUW93Zb79
         4FZ/jwQxcOk8G666Jy5kt8Cxkcl+/wtMtJrGxx6IDSKZAVWitzZF7alJPuI0GOAHp+N8
         cm/1JZU/p0XSGyIy9l1VhMyRBM5q5rhbijpjlAsuF5WxWGdNBVaQsXvde5sBhW2F6z6s
         91/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxu2L+fI5bLkh9abZ2KccVBOpiSoTaFJaVpVEMW+RhTWuWrrq2+XP/1h4x89a3FosZBnr/u9+ctSEiskgij9y1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2U5OxfvNEcC3wJcDHb+Dpm77xjEfVpyNtxJdSb2SSU+YLP6/+
	ELDQzgY6LeAmt+anJWdOvl7UVCX0EmdOyhcaufUyvMM9mAjR6IXAlN3fdF/uo8hqDhg+sFFFTy3
	dYkjdjPFarbEcMaryYSzyoM4GHmWD+A==
X-Google-Smtp-Source: AGHT+IEA36zCZ86cFQkBE3kDoLnAXUEBieGHJbD5cffQVjI9tw969NMMDrNV/SY31uUNJthT7fLe3QbpMCrOneU2NZ4=
X-Received: from pjbrs12.prod.google.com ([2002:a17:90b:2b8c:b0:312:187d:382d])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:184d:b0:313:1769:eb49 with SMTP id 98e67ed59e1d1-31e50735c36mr1026969a91.8.1753217642378;
 Tue, 22 Jul 2025 13:54:02 -0700 (PDT)
Date: Tue, 22 Jul 2025 20:53:58 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687; i=samitolvanen@google.com;
 h=from:subject; bh=5Dvr+mkJ4k7PSevkjl+IB77Y7u0FpfL30Sag474FKDI=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBn1v1JvsRQVPPt5ouBge/yx0q7yQ30cnW7503807qxXm
 iN7R6aho5SFQYyLQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEwkrJXhn/6Fx6lsFyZc1umc
 NF/BVTWh592nJ5+3ObZK7QzzMJ7O1cfIcN04pPLhBQ/jxFkzjKuCLOXO38/YoO74ws/mjEVimsN BLgA=
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250722205357.3347626-5-samitolvanen@google.com>
Subject: [PATCH bpf-next v13 0/3] Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_135403_511574_846ED004 
X-CRM114-Status: GOOD (  14.86  )
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
v13:
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


base-commit: 95993dc3039e29dabb9a50d074145d4cb757b08b
-- 
2.50.0.727.gbf7dc18ff4-goog


