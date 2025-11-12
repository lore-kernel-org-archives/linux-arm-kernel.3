Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F86CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2WoyvLfsQmPtdm4nkn/hiTGuICHM6lk3vnIcezdy2Oo=; b=s+vyUmYj+bBQEJpBBkWtowKT1E
	iFPV5K5U7Q1BaqJogYdcp0XbLwffIiUrVe7nuQnMln01WmX0hVNqFdtdvb2nvJwAxBKE6UUjP/M27
	CsHatJ3HT/7YbdMrs5jD3VYwq6vLQ9zIk/kFS/5gPpVKjiQcf1UtmYzs/zPam3hDB2MJ8FMXaDN+u
	TLUstlv/pjcbdOM1X6yb9RZR60u7IVSycBuqv5zaezdWXLFVGlZO3eWrypF+w4tfIhzgZsYMEpjs+
	gFUHmsvicFuhU97ZzJQVaVoGhbODYTaL0usjF05M14q2RAEflgs7jGwT1MtbNW16t+mGZqbu9lTZb
	A+OivUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7DH-00000008TCs-3Ebf;
	Wed, 12 Nov 2025 09:32:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7DE-00000008TC3-2xRm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 09:32:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so4679965e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 01:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762939942; x=1763544742; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2WoyvLfsQmPtdm4nkn/hiTGuICHM6lk3vnIcezdy2Oo=;
        b=xCCq2L9T+DgsEm1IqNuZPrLUCradoB2WU2ygX2S22EMVowCcUUJoDneon8N8wqASES
         xbuxyT04KHWdWXHK1TDrE+M1wnJ2e5I3KPfJkFMo2k1EPKVMbRymaPC1kqMj9HlQtJZX
         uM5ELPTtWGfe0pMnKZxQwO4sez0YbWIs5ZzqFQTVwo3Z9ynK1UeJDbCvUd53ynPjW8B+
         lrt2RkVhLie0DfTdOGb2+dDm6Q6awgbc4w+7o0WW4m4PR7Ejju2Qf+dPhYkSCHcWK8tD
         xa8fzYM9IGHI+4jIGr3vsPex43wsCltqmdFes1zTf2h8p3LB1Wku6Fh2mxk8jFA/95E8
         i3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939942; x=1763544742;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WoyvLfsQmPtdm4nkn/hiTGuICHM6lk3vnIcezdy2Oo=;
        b=wsEPOKrLSLuncZsjEA9LC1WOfxsHZ7aLYIzbKK+5ccfsSeGf2S424Yj9CXeA9SghTs
         kUxaASeZIvjcFk8AG9UQq2kUwGD1dfTMt4c4wLcUOgPZU0syLKb+HCiv88lX7/L/nDT7
         zIw8h1mpFuTeqj6KT/mA+msi3znwlNkHDsT2RlFRSan5AnEPK3kR0FTva/vXSfTywFTA
         gMURWI9G18RF9AgpbUD2LSopsjNF/Liv/tjppAfR0nWW0omfXfmXy9CTKb2AfJJqpy0b
         TFeglmn+N5FjwzTuAxsUVHZDtgPqaP/sEiqP2E+Q1hNT2e9F2jkE9p+tp7vhEy2NrIi7
         S8CA==
X-Gm-Message-State: AOJu0YzBpuPoM62K4VRtuRVIyu5rLXRHQmIEKW8AGF5awFVIq7EkAO67
	BhHbrZuaWyOvY8LLxSSec90lC7NTrV2tCtBzwJGAH5CGGaPcEDC4Z2BCto6Vy6NfAqL00haNSx5
	BqhKiyIUIzaHa6kzCF4lYNYczKBitoeRlL9aVuBTUWizoQcnPizWNyUx7gbth6lo7XqVJpTw7TP
	AoAlVdQwEThVetFVHywnf8TaZo4aWdSnJOpW9n3kWFn0jI
X-Google-Smtp-Source: AGHT+IH30r/s666xdrLYfepHwYnrd1V312B8VeNygFIReMzeJ12+spYn+kBflzwPtaz1tZHaTElmrDY8
X-Received: from wmpr17.prod.google.com ([2002:a05:600c:3211:b0:475:dc85:436d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6305:b0:477:79cf:89d4
 with SMTP id 5b1f17b1804b1-477870a6581mr17873025e9.31.1762939942483; Wed, 12
 Nov 2025 01:32:22 -0800 (PST)
Date: Wed, 12 Nov 2025 10:32:13 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6086; i=ardb@kernel.org;
 h=from:subject; bh=YwmxQKsUOFQYWar95FUZN5F26qwSCCGHb0kG0kCqz9E=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVMkRPYJV0U+B1Piyw3iJTw5yvsYLgdsmHeVc2Hsh+ieP
 /wpDzM6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESEMhj+x+/ju3zokHP/gRZN
 w/5Q7bmlov9XcL4UVZ5jc7rtVfYLJ0aGhy/WHFdk4eK4pib89kOg+Mv9Z19INia91TGtjLO4xBT NCAA=
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112093212.2392848-2-ardb+git@google.com>
Subject: [GIT PULL] libcrypto/arm64: Move kernel mode FP/SIMD buffer to the stack
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_013224_771460_506C5963 
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

From: Ard Biesheuvel <ardb@kernel.org>

Hi Eric,

(cc Catalin)

I have prepared a branch for libcrypto-next containing all the arm64 FP/SIMD
changes that are needed to move the kernel mode FP/SIMD buffers to the stack.

I have created two stable tags [a] and [b] in my tree at [0], containing the
changes as sent to and reviewed on the list, reordered to accommodate the task
of merging this into libcrypto-next in a bisectable manner.

  [a] scoped-ksimd-for-arm-arm64
  [b] arm64-fpsimd-on-stack-for-v6.19
  
On top of [a], two additional lib/crypto patches have been applied to update
code that has already been queued up in libcrypto-next, moving it to the new
scoped ksimd API as well. This is better than hiding the changes in a merge
commit. The merge still resulted in a conflict on the old versions of the files
that were moved, but this is resolved by simply deleting them.

Please pull. Or alternatively, if you prefer, recreate the following sequence
directly on top of libcrypto-next (and resolve the conflict)

      Merge tag 'ardb/scoped-ksimd-for-arm-arm64'
      lib/crypto: arm/blake2b: Move to scoped ksimd API
      lib/crypto: arm64: Move remaining algorithms to scoped ksimd API
      Merge tag 'arm64-fpsimd-on-stack-for-v6.19' into arm64-fpsimd-on-stack-for-libcrypto

The following changes since commit f101371e1972df3d897bf2326eda3c28aca2e58c:

  Merge remote-tracking branch 'ebiggers/libcrypto-aes-gcm' into libcrypto-next (2025-11-11 11:08:57 -0800)

are available in the Git repository at:

  [0] git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-fpsimd-on-stack-for-libcrypto

for you to fetch changes up to 82ef0a6ac77cc0eaca1b5c2fc3436b18cda6ef83:

  Merge tag 'arm64-fpsimd-on-stack-for-v6.19' into arm64-fpsimd-on-stack-for-libcrypto (2025-11-12 10:08:20 +0100)

----------------------------------------------------------------
Ard Biesheuvel (25):
      arm64/simd: Add scoped guard API for kernel mode SIMD
      ARM/simd: Add scoped guard API for kernel mode SIMD
[a]   lib/crypto: Switch ARM and arm64 to 'ksimd' scoped guard API
      lib/crc: Switch ARM and arm64 to 'ksimd' scoped guard API
      crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
      crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
      crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
      crypto: aegis128-neon - Move to more abstract 'ksimd' guard API
      raid6: Move to more abstract 'ksimd' guard API
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
[b]   arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack
      Merge tag 'ardb/scoped-ksimd-for-arm-arm64'
      lib/crypto: arm/blake2b: Move to scoped ksimd API
      lib/crypto: arm64: Move remaining algorithms to scoped ksimd API
      Merge tag 'arm64-fpsimd-on-stack-for-v6.19' into arm64-fpsimd-on-stack-for-libcrypto

 arch/arm/include/asm/simd.h                  |   7 +
 arch/arm64/crypto/aes-ce-ccm-glue.c          | 116 +++++++--------
 arch/arm64/crypto/aes-ce-glue.c              |  87 ++++++-----
 arch/arm64/crypto/aes-glue.c                 | 139 ++++++++---------
 arch/arm64/crypto/aes-neonbs-glue.c          | 150 +++++++++----------
 arch/arm64/crypto/ghash-ce-glue.c            |  27 ++--
 arch/arm64/crypto/nhpoly1305-neon-glue.c     |   5 +-
 arch/arm64/crypto/sm3-ce-glue.c              |  15 +-
 arch/arm64/crypto/sm3-neon-glue.c            |  16 +-
 arch/arm64/crypto/sm4-ce-ccm-glue.c          |  49 ++----
 arch/arm64/crypto/sm4-ce-cipher-glue.c       |  10 +-
 arch/arm64/crypto/sm4-ce-gcm-glue.c          |  62 +++-----
 arch/arm64/crypto/sm4-ce-glue.c              | 214 ++++++++++++---------------
 arch/arm64/crypto/sm4-neon-glue.c            |  25 +---
 arch/arm64/include/asm/fpu.h                 |  16 +-
 arch/arm64/include/asm/neon.h                |   4 +-
 arch/arm64/include/asm/processor.h           |   7 +-
 arch/arm64/include/asm/simd.h                |  10 ++
 arch/arm64/include/asm/xor.h                 |  22 ++-
 arch/arm64/kernel/fpsimd.c                   |  54 +++++--
 crypto/aegis128-neon.c                       |  33 ++---
 drivers/net/ethernet/mellanox/mlx5/core/wc.c |  19 +--
 lib/crc/arm/crc-t10dif.h                     |  19 +--
 lib/crc/arm/crc32.h                          |  11 +-
 lib/crc/arm64/crc-t10dif.h                   |  19 +--
 lib/crc/arm64/crc32.h                        |  16 +-
 lib/crypto/arm/blake2b.h                     |   5 +-
 lib/crypto/arm/chacha.h                      |  11 +-
 lib/crypto/arm/curve25519.h                  |   5 +-
 lib/crypto/arm/poly1305.h                    |   6 +-
 lib/crypto/arm/sha1.h                        |  13 +-
 lib/crypto/arm/sha256.h                      |  12 +-
 lib/crypto/arm/sha512.h                      |   5 +-
 lib/crypto/arm64/chacha.h                    |  11 +-
 lib/crypto/arm64/poly1305.h                  |   6 +-
 lib/crypto/arm64/polyval.h                   |  23 ++-
 lib/crypto/arm64/sha1.h                      |   7 +-
 lib/crypto/arm64/sha256.h                    |  19 +--
 lib/crypto/arm64/sha3.h                      |  13 +-
 lib/crypto/arm64/sha512.h                    |   8 +-
 lib/raid6/neon.c                             |  17 +--
 lib/raid6/recov_neon.c                       |  15 +-
 42 files changed, 616 insertions(+), 712 deletions(-)

