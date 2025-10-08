Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2288ACAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wmLD0z7TTnPR9XvYGkCWmhX+K+BenlBYSASZKFMhffQ=; b=0xIsHe/ciW2KSQCyqUAMebxc86
	s52LIQRFdRHe4yxzbR5nLCW7CUL8g1ZMfVKCx2ojEyt4SvPwlueNyt2Z9CZFfJFldtzWSqmB/8z/6
	thfa/lLcu/v4vpvKKcwr0y5BciP1Qq6d279SXR9eyIHQ6ozRxm0wKF0FDhTPrMtLCgtJCsjkBbkQ4
	GdGSZlIUk8wrd3PLm7LA4r5nJn0p7UDNCAjXpxBVOzhTfhr/0nJVkYbzRq8aAtBkkkhQ2Cfpki03D
	1vXBc4MFLcayyheGsCDI7juLChl6kDz7jXd6+OuHwJ9X0+JYVEUWKPaXHUbCNpZGeIjDuratyUo/K
	1L9Vy80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNN-00000004BGW-4AMk;
	Wed, 08 Oct 2025 15:46:49 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNL-00000004BF5-2H93
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:48 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3fba0d9eb87so46978f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938405; x=1760543205; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wmLD0z7TTnPR9XvYGkCWmhX+K+BenlBYSASZKFMhffQ=;
        b=fqvEnv6cKYdR4qKrmwlQLjMENuNfW9VlKHEmhqKzQ+CPHJ9MF/JbMrWt3edGgRar+L
         PHraS76AHgNNrr+tp2GrCAD83uwgYj2RG+/d+frTu8iSYFbOkMhfAuPmPPs+Mzmw6wLt
         GET10P6XEpTyWzq3LdyjKf1z7B+mtq097mDzn1YYO1rkPr58bM/7xnguMf2u0LSDMecn
         SoAGDWLE40Gtt35aDjirVxZeYMyc9kRq65lP9tXuu3IU6B/Xk8nKoDqUCOxcg8Rxvc7K
         ZX4GUUZ3lCj0xmpbh0cgEf4kokm2KOPLFJfNYQ7U4yPZHHiwTtcPI1Xz1/j2BPPoqdgX
         foHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938405; x=1760543205;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmLD0z7TTnPR9XvYGkCWmhX+K+BenlBYSASZKFMhffQ=;
        b=R1/URe7kBFjgRZXbaWaBfVDXChv1OCWqD+N1zgHZvG4OA++ZVS7jPmf39YeZlrRgfy
         OTTnkjg9/u2+nxhGRMQYFQ8whkCzGH+K//SrP+NhXTJpxaTKqWU3E0qxKKxYFzw5Kzrk
         ixxA7WGX5mmtz8cT5m96B/DRe0StKl33iOqZqnSjh6tVc7taNayMmkqTo3nnMdj5ZzYf
         Kc8LC0hZVAcZaTkUrVOpqZQLWJcAeN33A0zOa+JYqKYYwycy03umapMOxxVFHaaHT6Pq
         IZfPOrFbP4jyyX6zLS7CaND1kbtdgZLfgKLpvsdlX/f9Zyoizqs6G0HesUB9tbU8mn+8
         jfYw==
X-Gm-Message-State: AOJu0YzOZKWhAFWE+pHxjJrtWVc7nBXJNfHJ+/jl/4I0nkZv1BdEcV/a
	NIiVlRoljAxaI3tABz3XrjV5Lq7qXde4v3z3Sbwa98SnRD2DCM757zGzbAhU0qICK/F3gW9mfB4
	9BOTqKx2TMdzYmKtZGqNyimD74qSAcSkqVboWVTllVyFZY/3Dlvc/fNbutBs8GgynqExnjkLwJ2
	FmCnxDV2GX9zlZHnXk75fimIzmKPnW6fOcRQto6MYNil+u
X-Google-Smtp-Source: AGHT+IEt8nUcjBjxcOiz44sFz9PXJ/AXhgR8lEUeC1XvfiF6QMnIgBcNlVH+mEjJkP1BeJHVT50cUdMM
X-Received: from wmvw6.prod.google.com ([2002:a05:600d:42c6:b0:46f:aa50:d703])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1a8b:b0:425:8bd1:fbb4
 with SMTP id ffacd0b85a97d-4266e7df95cmr2665651f8f.50.1759938404873; Wed, 08
 Oct 2025 08:46:44 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:34 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5474; i=ardb@kernel.org;
 h=from:subject; bh=LjOVrXxuH78jPv7wKv3YJ7SsGzEQCTxGhw6lFU8BtRY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu7zCPe21jfOED3k1nLNQCJywP8dNuDXL8HLf/FnGI
 spG+406SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESktBkZLp6++6JM65F7daoV
 s/Sn1sm5D8VK260PhC88PEfm6ox38xn+8HRwbb3GsW5TfZm/sb5G+evvX+fF3DE/s7fjdpKtw04 9JgA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-23-ardb+git@google.com>
Subject: [PATCH v3 00/21] arm64: Move kernel mode FPSIMD buffer to the stack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084647_613720_D45F7379 
X-CRM114-Status: GOOD (  19.36  )
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

Move the buffer for preserving/restoring the kernel mode FPSIMD state on a
context switch out of struct thread_struct, and onto the stack, so that
the memory cost is not imposed needlessly on all tasks in the system.

Changes since v2:
- Fix generic kernel mode FPU api instead of removing it.

- Rebase onto v6.18-rc0 and fix the fallout

- Prefer WARN() over BUG() in kernel_neon_begin/end

- Avoid unnecessary cmpxchg() calls

- When invoked in softirq context, use the caller provided buffer rather
  than the one stored in the task struct - this permits callers from
  task context (including users of the generic kernel mode FPU api) to
  pass NULL as the buffer when running with preemption disabled.

- Add acks from Kees and Eric; Mark's was dropped along with the patch
  in question.

- Fix new occurrence of kernel_neon_begin/end in Mellanox driver.

Changes since v1:
- Add a patch reverting the arm64 support for the generic
  kernel_fpu_begin()/end() API, which is problematic on arm64.

- Introduce a new 'ksimd' scoped guard that encapsulates the calls the
  kernel_neon_begin() and kernel_neon_end() at a higher level of
  abstraction. This makes it straight-forward to plumb in the stack
  buffer without complicating the callers.

- Move all kernel mode NEON users on arm64 (and some on ARM) over to the
  new API.

- Add Mark's ack to patches #6 - #8

Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>

Ard Biesheuvel (21):
  crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
  crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
  crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
  arm64/simd: Add scoped guard API for kernel mode SIMD
  ARM/simd: Add scoped guard API for kernel mode SIMD
  crypto: aegis128-neon - Move to more abstract 'ksimd' guard API
  raid6: Move to more abstract 'ksimd' guard API
  lib/crc: Switch ARM and arm64 to 'ksimd' scoped guard API
  lib/crypto: Switch ARM and arm64 to 'ksimd' scoped guard API
  crypto/arm64: aes-ccm - Switch to 'ksimd' scoped guard API
  crypto/arm64: aes-blk - Switch to 'ksimd' scoped guard API
  crypto/arm64: aes-gcm - Switch to 'ksimd' scoped guard API
  crypto/arm64: nhpoly1305 - Switch to 'ksimd' scoped guard API
  crypto/arm64: polyval - Switch to 'ksimd' scoped guard API
  crypto/arm64: sha3 - Switch to 'ksimd' scoped guard API
  crypto/arm64: sm3 - Switch to 'ksimd' scoped guard API
  crypto/arm64: sm4 - Switch to 'ksimd' scoped guard API
  arm64/xorblocks:  Switch to 'ksimd' scoped guard API
  net/mlx5: Switch to more abstract scoped ksimd guard API on arm64
  arm64/fpu: Enforce task-context only for generic kernel mode FPU
  arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack

 arch/arm/include/asm/simd.h                  |   7 +
 arch/arm64/crypto/aes-ce-ccm-glue.c          | 116 +++++------
 arch/arm64/crypto/aes-ce-glue.c              |  87 ++++----
 arch/arm64/crypto/aes-glue.c                 | 139 ++++++-------
 arch/arm64/crypto/aes-neonbs-glue.c          | 150 +++++++-------
 arch/arm64/crypto/ghash-ce-glue.c            |  27 ++-
 arch/arm64/crypto/nhpoly1305-neon-glue.c     |   5 +-
 arch/arm64/crypto/polyval-ce-glue.c          |  12 +-
 arch/arm64/crypto/sha3-ce-glue.c             |  10 +-
 arch/arm64/crypto/sm3-ce-glue.c              |  15 +-
 arch/arm64/crypto/sm3-neon-glue.c            |  16 +-
 arch/arm64/crypto/sm4-ce-ccm-glue.c          |  49 ++---
 arch/arm64/crypto/sm4-ce-cipher-glue.c       |  10 +-
 arch/arm64/crypto/sm4-ce-gcm-glue.c          |  62 ++----
 arch/arm64/crypto/sm4-ce-glue.c              | 214 +++++++++-----------
 arch/arm64/crypto/sm4-neon-glue.c            |  25 +--
 arch/arm64/include/asm/fpu.h                 |  16 +-
 arch/arm64/include/asm/neon.h                |   4 +-
 arch/arm64/include/asm/processor.h           |   2 +-
 arch/arm64/include/asm/simd.h                |  10 +
 arch/arm64/include/asm/xor.h                 |  22 +-
 arch/arm64/kernel/fpsimd.c                   |  44 ++--
 crypto/aegis128-neon.c                       |  33 ++-
 drivers/net/ethernet/mellanox/mlx5/core/wc.c |  19 +-
 lib/crc/arm/crc-t10dif.h                     |  16 +-
 lib/crc/arm/crc32.h                          |  11 +-
 lib/crc/arm64/crc-t10dif.h                   |  16 +-
 lib/crc/arm64/crc32.h                        |  16 +-
 lib/crypto/arm/chacha.h                      |   6 +-
 lib/crypto/arm/poly1305.h                    |   6 +-
 lib/crypto/arm/sha1.h                        |  13 +-
 lib/crypto/arm/sha256.h                      |  12 +-
 lib/crypto/arm/sha512.h                      |   6 +-
 lib/crypto/arm64/chacha.h                    |  11 +-
 lib/crypto/arm64/poly1305.h                  |   6 +-
 lib/crypto/arm64/sha1.h                      |   7 +-
 lib/crypto/arm64/sha256.h                    |  19 +-
 lib/crypto/arm64/sha512.h                    |   8 +-
 lib/raid6/neon.c                             |  17 +-
 lib/raid6/recov_neon.c                       |  15 +-
 40 files changed, 587 insertions(+), 692 deletions(-)


base-commit: 0d97f2067c166eb495771fede9f7b73999c67f66
-- 
2.51.0.710.ga91ca5db03-goog


