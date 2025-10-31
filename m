Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D90ACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yzBOLuJn6BQxaulymyldStp9yC5OaaLNLjYTbunY6ik=; b=2WYe6uPYvh27vyyEgl1Uhpp9BL
	kYUzfV3PXVmaL6x2Gxiw8K4xYdkDOIQOIDLDa7k9QlvPrlaSNwzab2sxVw+04YYl+wG8O8udNpuhu
	VJwc5QZ9sHz8TcvzDbRggeDwJfwnvwdwcZjUZbZ6WP+Jo8qhCm1l4wcYLFQ16Z3bjat4+y7vJMigL
	RANmWOuWiOY+26zQv+S83Gmime4YaMPQ0Gq194UB5TdmDR2ytNctsHSGJm2azjpzo6gNQFYbHuOae
	dGyh6GV910eYO4JBNg8i3to2sv08ZKRwzP7rrnYa2Ws46JVUiSeciH8GWkWNOFpInLw7eLEDd4vww
	8K2IgJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXu-00000005v5c-2d8y;
	Fri, 31 Oct 2025 10:39:50 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmXs-00000005v4c-1ixG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:39:49 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4773a7dc957so1016145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 03:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761907186; x=1762511986; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yzBOLuJn6BQxaulymyldStp9yC5OaaLNLjYTbunY6ik=;
        b=wrg3M4fM5F3Upllp9uyGma+XjX0JZBAMkwK8jf5dpJUkDlGljHMHi3K3lYQ0CUZHP/
         7jCCNObeUyNuPFXIo3MRLwMOa24KhDofB7vwCKtErWn4TiskPr/cn1byn9k7HQd5X4LD
         4bhM8GvPcGeKbubJgBdqDsd8SR0yDhV62tNwI2fI7NgiC/3TTM33iGZ574sm/9QmfPsz
         RUFxmJo7qrnxgbMw7kMDnMoihagHs8+7kARQEUutpMJEGTJCvcild8gXxok6Rz3Nkx8K
         03u0284qUncbCiJ9/0GWmgDku8i+9AZkI1CPqvGxxGRbfKnU2DL7EiO/ED6xE0RyiJOv
         bWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761907186; x=1762511986;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzBOLuJn6BQxaulymyldStp9yC5OaaLNLjYTbunY6ik=;
        b=ekkN8wFg2igzfHUPiZfHoRGKGzB70SX2RO8BsATO/8Og8Tpd1Jf04nSwypXfk9CZcU
         O/oMo8w92uXJRLAGSYF3vOcNaicqD6eA5HsdgGoQGLf5PKvlfOXvBIzNRTU2a8yLdHQ3
         CKbAsljYpPojL9dGE+KZsAGveo3I7flEDpVYUmZM+gsDqh/3BlYNof6WQ6oUNGAxD73D
         7vcMuF5FfMWN/S3kf18vO6XFj7CqfFdPgOR+bNTsLAkYqF4yZQ25Zunzl/u1eeWfQ8i7
         5ZYAzByfcrJLKKqK61HOmUK4jUcltRBdKpG8K6F8MERpgCGlGoSmsCks3riUCWRZaa31
         Sbnw==
X-Gm-Message-State: AOJu0Yx/c07JViy4ezWIjmz7idIN8z5iQQWubsGuBMYteEumAHEPPMW5
	Z0EOpcrNvSy8AFHIhKqMhlNOiuRADMCMOuGA5EKYQ4YyVDSvIetVbAV/bfwZHFFXYWUkY/Zi3uk
	cmkai1N1l+o5/GTNOCZ1L5ph4hIrLLC//71UEmQf4rH9ullftBaVuHmNz8QGqiG8tmWh4yrcmek
	TpAlFO1YSFiX42Ndd2K7Q6r3du5XoNcGZzK4Yl1PyF+myT
X-Google-Smtp-Source: AGHT+IEPzdVQqUUHRRWzP9kzCZyXrVG4IDJoADHNKyCPnLrN1PGH+kuRK8mJROWWYdSTrzbg98eHOvxJ
X-Received: from wmcn12.prod.google.com ([2002:a05:600c:c0cc:b0:46e:1e57:dbd6])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:4393:b0:46e:32a5:bd8d
 with SMTP id 5b1f17b1804b1-477331db3ccmr11927495e9.3.1761907186270; Fri, 31
 Oct 2025 03:39:46 -0700 (PDT)
Date: Fri, 31 Oct 2025 11:38:59 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5730; i=ardb@kernel.org;
 h=from:subject; bh=Dd7Wm4yRuQHGoh0lyZXaxS2rHbwexlml5vUqKlsLUbM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNl4uGfJ9grF/D/T1imIL7BYP+HMxMdt+v7aAoe+XpSR
 FrUbb5zRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhInwkjw8yd7Ks0r+y8eMeo
 OUTl9ew8g5/NUuELxY9p/fvIM/1SWj/DP22+hbv/6neaz99ksFyjx87xYZHHfGPzP5le+9feMND 4zQYA
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251031103858.529530-23-ardb+git@google.com>
Subject: [PATCH v4 00/21] arm64: Move kernel mode FPSIMD buffer to the stack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_033948_477915_CF0702BE 
X-CRM114-Status: GOOD (  19.54  )
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

Changes since v3:
- Fix sloppy editing errors in ARM CRC code.

- Add more comments about the state argument to kernel_neon_begin/end
  and the associated field in thread_struct

- Fix bug in generic kernel mode FPU change

- Add Rbs from Eric

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
 arch/arm64/include/asm/processor.h           |   7 +-
 arch/arm64/include/asm/simd.h                |  10 +
 arch/arm64/include/asm/xor.h                 |  22 +-
 arch/arm64/kernel/fpsimd.c                   |  53 +++--
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
 lib/crypto/arm/sha512.h                      |   5 +-
 lib/crypto/arm64/chacha.h                    |  11 +-
 lib/crypto/arm64/poly1305.h                  |   6 +-
 lib/crypto/arm64/sha1.h                      |   7 +-
 lib/crypto/arm64/sha256.h                    |  19 +-
 lib/crypto/arm64/sha512.h                    |   8 +-
 lib/raid6/neon.c                             |  17 +-
 lib/raid6/recov_neon.c                       |  15 +-
 40 files changed, 601 insertions(+), 691 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.51.1.930.gacf6e81ea2-goog


