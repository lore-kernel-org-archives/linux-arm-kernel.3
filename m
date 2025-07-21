Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC66C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5URmPbI+yXwjAFPr5JsI+gON/lvzeGrovPf0DF9nF0k=; b=Ali2EPgiBjFHsQJq7QNblHKjhp
	lS4fCZFgjGCRR2PnaL3fhKKQ3kN4BP/JPEZz66Bel4Fi7O0sTZIx8YMVcgc49h3IRzvupqeqqh6ps
	ss0/UAF5c9xY1Zx0pJ3aGttfyXyZdrmHqioAMVGlPl3IGQMzk07taQclkc6neLv2zc7R0OmslRVRb
	TP4PwE9xILNIf3DmYuZXnjfNp7OnhonlnXDL3rjIeNIF7Vy7s7suO96/ZbFkFQZ5ZOOdes6Gl0nM1
	l4CwxNAIBP7jehZWGmdRUm1Kp1VLrmnA681ksCztTBvCrK7AtSunC7Y1Tz3A4zdPg2N21mD7kt9BZ
	YMwczw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxOI-00000000fCv-06ki;
	Mon, 21 Jul 2025 20:45:42 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwzq-00000000bsQ-01fC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 20:20:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7492da755a1so3543622b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 13:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753129224; x=1753734024; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5URmPbI+yXwjAFPr5JsI+gON/lvzeGrovPf0DF9nF0k=;
        b=RLJd20CtgFREz9LoGq51O+02hHVPGhsrGUloh0yPPdAIUM9Or8NGBsu24vBoA3AQj7
         fkQWDGO2ZXSx2LLr/3JbWZ15rrgePRx1rGQ1QJCS3SG/bNaJzzULz6HtbtFQAazvCeYX
         zueiP2l3mclmQspmekwDUfldt6CyeKod0nERSyrU4Iodf9GlPiSbIfn/O9X5n/ItMbgf
         IamYoCotmLVBa2WvgvAsUod2nSBi0EhHy0HWLv09X1CgyWdoj/sB6zW1KLhxsGOuWdmD
         0bhrDoEnlZFYPfVThFpeubBoc0IEnbhMPQ6rkf8UfaOJSk3bxXj3r7goK/7054PcvTP4
         ljEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753129224; x=1753734024;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5URmPbI+yXwjAFPr5JsI+gON/lvzeGrovPf0DF9nF0k=;
        b=jK+0K/vUz9IqJWWz9aVrb0T15svuBbyhVMftjSq8PUcEvmyZTNG6LcEqTGQItHdlb5
         jG4k7TBqjJQhWQ4YSG+NFWBfb0NiAXkpAhVYXy8mABNxR62M3qDevS4KkjmW+4U8DmDf
         1+2yBiIavU18h8ktmMTy7LjueUYeWnq0ZYBaHqAKS76GIrherjA50zwncJ1tU1HENpeR
         +sASoROkEzta6jcuuk+ly4r+NRtlJxi+0S8RH9uj+fjt+8phmpNcmYMzNmgo1ZBwV55D
         dSqYX8S1zZ43v7qIZV3gpM2B3RTPQr5OaJh07BPZ+YSTlxXlViyMy9TszTTSdcGJwQG2
         kw5w==
X-Forwarded-Encrypted: i=1; AJvYcCVO/rs2nghquIllBr/uukg7UZS938VVtcS1TNX7E5w2MvjZ6fg+EntiE5ESjaGhFoRxBmR0gBS39nDyn3FJ4xLC@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4gQAjrLG+p5NQRuDe9l82THMx6/Z6aOC4McyTDDdx3J39g/63
	sLRDCdAZEiccPgOFLJVUX7y+qvzB/l86BnNlJOTxdFCfp7BK+dNcm7DXUfO4V4sLpF0bokmx1Iy
	mH+fdF2CD6lUzCb3CMqu2gShXATgggw==
X-Google-Smtp-Source: AGHT+IEYmVmBICKXXFbKLwFcHwvPfE4Z/rxChV+mTLlOehLzanW0f8Wk0LDYggKhH+apLrDCa8KwXOPPUeDARk0kl8E=
X-Received: from pfbhd13.prod.google.com ([2002:a05:6a00:658d:b0:748:f98a:d97b])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10cb:b0:748:ffaf:9b53 with SMTP id d2e1a72fcca58-757242790admr26793970b3a.16.1753129224376;
 Mon, 21 Jul 2025 13:20:24 -0700 (PDT)
Date: Mon, 21 Jul 2025 20:20:16 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503; i=samitolvanen@google.com;
 h=from:subject; bh=nmRM+/K9lsvx+cfQiTy2X6pWzToLBg2bXj292tXDDLI=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDBl1C/4LJ+fozz7Y9+jWl0v/HguWn86WDNBsXOxpabT6T
 VRaooVPRykLgxgXg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZhIrxnD/8K0KX5p9vtz90qH
 3ivkFLTYGHz20v9nXTLyzVNYliwKvszIsFFn0tGn0nwLt2ok5kxdneSvpB3ZUxMWdmzJ419qTl0 fGAE=
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250721202015.3530876-5-samitolvanen@google.com>
Subject: [PATCH bpf-next v12 0/3] Support kCFI + BPF on arm64
From: Sami Tolvanen <samitolvanen@google.com>
To: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Maxwell Bland <mbland@motorola.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_132026_063360_A14CB753 
X-CRM114-Status: GOOD (  14.23  )
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
v12:
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


base-commit: 42be23e8f2dcb100cb9944b2b54b6bf41aff943d
-- 
2.50.0.727.gbf7dc18ff4-goog


