Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B85CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mh7/i7zcB22S2CzefD890RUAPYawXfWFtiDRY7l6NUg=; b=kjIZt/uYBPGV2TvanNFw+WIJoo
	PFCfDWbb5xIEY7FQ9emvdmEDTN+BXLUj/GlN8IFgeDoq5Y5cDXCLKoMslnBIuYHV32YL6tRgTR8T1
	qYVDDNmyF0i99Sl/jYQ3iXMD0n6gTpqjWrifWHRWZhR+FDCm/+q2tRDXGJ6GqaZAr9yZzw7nbAUas
	3Ayw5v+S5pmcwWRFG8s5YxW70+tOcnvPB0ZM74H5VHARB78bP8vDQmG+n4CqDx9qB0gDst4fsArrQ
	4MjKLPSrB7Dj/Ure7Z1aj/nIEAT5Ga2tF3rHQCnced7c/k3ROT3Qrpa4NV2vWy/uEVoXsx8WoDZEq
	N96GAQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zQ-00000008ysZ-1myt;
	Wed, 01 Oct 2025 21:03:56 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v43zN-00000008yrl-3NAL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 21:03:55 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e36686ca1so7980065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 14:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759352631; x=1759957431; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mh7/i7zcB22S2CzefD890RUAPYawXfWFtiDRY7l6NUg=;
        b=RF2y7Sjv6uaOtmiiQVYFmcoXZLOlhaRJwKAJ1fq3BBg+knbczn70/EcMXm4GUwcrUA
         uw8swEkAFGqCloIE4IwsFN6rGJNtq6xTokDVFbBZqT1DGyQgrN2M4r3ILFiFmfD1DEKX
         3cJ71tSUJofYFGfT4MaPtMULwirMPXWxNYIqLgJbSmPZvbnjU/rkOsu6prlnOrmdO5kn
         sBWX6YfvGhDvT1buGQep311k9Zs+tlX8tlXTl1JU00k081o2QUiqqa2Tfk5PJQhWqsF5
         pIAyaDFM5/D8SYkYMTnkSkBiP7KZ7g8pz/yDpL9Y2G5TvPzBtZeqNSVMCJq1h0fpHrg3
         S3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759352631; x=1759957431;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mh7/i7zcB22S2CzefD890RUAPYawXfWFtiDRY7l6NUg=;
        b=BSbV0w5GsUXZfFBoiPXjdQVdIlmmfmgnKDGHYL7tYH09he49KtqC77U29ELIOLDW7p
         FQk3SEcZ/yBm6ftZatXNAHscu7bvlCQpETyaK0O3kE68DFPZ8NHTsizGR6FzJ3b4ST3c
         828UIWqne2zGEAMa+iYhdpBaanrcSPcdbQHm4Iu36KGpS6pAhXakTY9qpkWKVqUpJtoF
         bphwoim6KOJaMswVm/qkkPMYmYBz6Lo3rJqX7MsYOB1dSFlxaXQVT18w72pHvrq30ckK
         EMNXal5m6oAw0yrmjE4OHGeIm1dAfZm8B6MYUs7L0RE70lT4o5lalWMK707WoaGNGw4j
         bqAw==
X-Gm-Message-State: AOJu0YwcE6yINWeu7lkyhmjKj5zyw8f8Imhxg7G+Pfl0FV8HokCzPCDb
	k4CsHsjIg3fznE4yGKDhuabkO3NFxMnAsM2v9QWjl7EoQCsQtaZj4b/sfez7d5FSB4006y6JNQH
	y/CbkQ4hsqiP8GFacLoSiwtJtHXa+STT3Q4/T/SLBDTI2UC7RIr37dF/bgitFR/zxSTSmOg6jeA
	uYyqHRgnbY/jjZugcnajuP1056Lq6hpKZXyNHQlBlPvQka
X-Google-Smtp-Source: AGHT+IFBMS8hi1wkfsj481SIim8P9Op+nN93AzKtiaxeNmzJcEHjTwqfw2LjqxqLf09sJn85QILeZVIL
X-Received: from wmbgz3.prod.google.com ([2002:a05:600c:8883:b0:45f:29fc:83d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d0:b0:45b:88d6:8ddb
 with SMTP id 5b1f17b1804b1-46e612e6d66mr40444975e9.37.1759352631471; Wed, 01
 Oct 2025 14:03:51 -0700 (PDT)
Date: Wed,  1 Oct 2025 23:02:02 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4715; i=ardb@kernel.org;
 h=from:subject; bh=WkWvbQEHwdkhBMEajkwjYNbG84VXFWD0ftiu/zUgP00=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIePutNN86w1dFLNusO+d3vjJZto6tcz77XHJSgbZi7vPF
 9T4XfXqKGVhEONikBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABOp0mRkuMP+8OxjWU19Oxsj
 vlz9lsr2f77lR+3Ed37avIt90eHHbAz/Ey7OWZT5rnHJwYgbyiznuZcEtsyRjqm/9H1DkvG0wHt ruQE=
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001210201.838686-22-ardb+git@google.com>
Subject: [PATCH v2 00/20] arm64: Move kernel mode FPSIMD buffer to the stack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_140353_872230_1A8BD855 
X-CRM114-Status: GOOD (  18.58  )
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

Ard Biesheuvel (20):
  arm64: Revert support for generic kernel mode FPU
  arm64/simd: Add scoped guard API for kernel mode SIMD
  ARM/simd: Add scoped guard API for kernel mode SIMD
  crypto: aegis128-neon - Move to more abstract 'ksimd' guard API
  raid6: Move to more abstract 'ksimd' guard API
  crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
  crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
  crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
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
  arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack

 arch/arm/include/asm/simd.h              |   7 +
 arch/arm64/Kconfig                       |   1 -
 arch/arm64/Makefile                      |   9 +-
 arch/arm64/crypto/aes-ce-ccm-glue.c      | 116 +++++------
 arch/arm64/crypto/aes-ce-glue.c          |  87 ++++----
 arch/arm64/crypto/aes-glue.c             | 139 ++++++-------
 arch/arm64/crypto/aes-neonbs-glue.c      | 150 +++++++-------
 arch/arm64/crypto/ghash-ce-glue.c        |  27 ++-
 arch/arm64/crypto/nhpoly1305-neon-glue.c |   5 +-
 arch/arm64/crypto/polyval-ce-glue.c      |  12 +-
 arch/arm64/crypto/sha3-ce-glue.c         |  10 +-
 arch/arm64/crypto/sm3-ce-glue.c          |  15 +-
 arch/arm64/crypto/sm3-neon-glue.c        |  16 +-
 arch/arm64/crypto/sm4-ce-ccm-glue.c      |  55 +++--
 arch/arm64/crypto/sm4-ce-cipher-glue.c   |  10 +-
 arch/arm64/crypto/sm4-ce-gcm-glue.c      |  65 +++---
 arch/arm64/crypto/sm4-ce-glue.c          | 214 +++++++++-----------
 arch/arm64/crypto/sm4-neon-glue.c        |  25 +--
 arch/arm64/include/asm/fpu.h             |  15 --
 arch/arm64/include/asm/neon.h            |   4 +-
 arch/arm64/include/asm/processor.h       |   2 +-
 arch/arm64/include/asm/simd.h            |  10 +
 arch/arm64/include/asm/xor.h             |  22 +-
 arch/arm64/kernel/fpsimd.c               |  34 +++-
 arch/arm64/lib/Makefile                  |   6 +-
 crypto/aegis128-neon.c                   |  33 ++-
 lib/crc/arm/crc-t10dif.h                 |  16 +-
 lib/crc/arm/crc32.h                      |  11 +-
 lib/crc/arm64/crc-t10dif.h               |  16 +-
 lib/crc/arm64/crc32.h                    |  16 +-
 lib/crypto/arm/chacha-glue.c             |   6 +-
 lib/crypto/arm/poly1305-glue.c           |   6 +-
 lib/crypto/arm/sha1.h                    |  13 +-
 lib/crypto/arm/sha256.h                  |  14 +-
 lib/crypto/arm/sha512.h                  |   6 +-
 lib/crypto/arm64/chacha-neon-glue.c      |  11 +-
 lib/crypto/arm64/poly1305-glue.c         |   6 +-
 lib/crypto/arm64/sha1.h                  |   7 +-
 lib/crypto/arm64/sha256.h                |  15 +-
 lib/crypto/arm64/sha512.h                |   8 +-
 lib/raid6/Makefile                       |  33 ++-
 lib/raid6/neon.c                         |  17 +-
 lib/raid6/recov_neon.c                   |  15 +-
 43 files changed, 597 insertions(+), 708 deletions(-)
 delete mode 100644 arch/arm64/include/asm/fpu.h

-- 
2.51.0.618.g983fd99d29-goog


