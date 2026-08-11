Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE27C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hvUoliD+aRM44Z5N7vriFmsAIJjxCRXSO0RSQInAnNs=; b=xO7SLfiHYaBZTX9VnjS2e2zQgy
	emDPR3NKmoChKg7fj1L+EI2AnA6es1KVBcd5jO6T6fiWcQxTugfg3wZ8CkcM8GEaiKDiHlcfsvin/
	P6bbEE3GyB0cb+8GEyXh3aiIYg7yhgHCCemnuhTnXnTaEt+U3m2X1y9+sx+RP6Ka3V02wouongaak
	kF3WPv2U/qUfnOasgKs8zznTlN7e9IG15jK/E05Gbj4V5NWC7pPn49BJc1rmalefrI1vDvv5YCwss
	AqEUfCQzlE4ujdpZwnxZtolwrJulQA5VHZP1IHVCBkFsPyjFxhDNp8QmDvHcgPV3n+dEYWrrOpuBd
	kPpX7rMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn30-0000000E9Jr-0LJT;
	Tue, 11 Aug 2026 14:01:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn2y-0000000E9Jk-4AU1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:01:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 392A4600AD;
	Tue, 11 Aug 2026 14:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF641F000E9;
	Tue, 11 Aug 2026 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456899;
	bh=hvUoliD+aRM44Z5N7vriFmsAIJjxCRXSO0RSQInAnNs=;
	h=From:To:Cc:Subject:Date;
	b=lu6ernN7Mg4w3v7/OpMmDS7SzMPV9osdnuN2MJ+tt9z09jW76Za18B8bJTtffjpTf
	 ErwqzvL6VvNFJcxHQ4lO5nZLWtQ3loO6vjnYatG2xc+qwUyQKsGvCJ2epDYK7ueoFH
	 eeLu7Uc0FOknAgvfVs7ESYBxAZnjKrg8haA+ylfaY0U2wglAJCPQrEvvDPSMWhZbF9
	 p01mkZA5pZC+JrDz6cogsRxjKD4RSQ4LRwk3pYlNgQ3yvAOvlpNXU98/bbCmLuDDa/
	 ZIjwG4XPX9xWpnBHhCZIIFS3qZWNShXwNdb2lyC+hp7GqNTLny7lIsBsQWi++7cIQM
	 X7yX3l15rYFDw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 00/12] arm64: Remove unused big-endian support
Date: Tue, 11 Aug 2026 15:01:19 +0100
Message-ID: <20260811140132.22778-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Big-endian support on arm64 (CONFIG_CPU_BIG_ENDIAN) has depended on
BROKEN since 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend
on BROKEN") and has already seen some clean-up patches removing some of
the unused support code (e.g. 5276ea17a23c ("lib/crc: arm64: Assume a
little-endian kernel")).

Finish the job, and remove the remaining big-endian support code from
arm64. Note that the SETEND emulation for 32-bit tasks remains and so
some of the mixed-endian EL0 helpers are retained.

I've broken this down into fairly coarse chunks, as it seemed a lot
easier to manage than one giant patch (even with the Kconfig being
effectively disabled already) and not all of it is just mindless
deletion. Despite that, I'm anticipating the whole thing going via the
arm64 tree.

Will

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au> 
Cc: Marc Zyngier <maz@kernel.org>

--->8

Will Deacon (12):
  selftests/arm64: Remove big-endian support
  arm64: bpf: Remove big-endian support from the JIT compiler
  arm64: crypto: Assume a little-endian kernel
  arm64: lib: Assume a little-endian kernel in custom library routines
  arm64: lib: Assume a little-endian kernel in optimised string routines
  arm64: assembler: Remove endianness helper macros
  arm64: vdso32: Always build compat vDSO object as little-endian
  KVM: arm64: Remove support for a big-endian hypervisor object
  arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
  arm64: Remove all usage of __AARCH64EB__
  arm64: image: Remove endianness handling for generating image header
  arm64: Kbuild: Remove vestigial big-endian support

 arch/arm64/Kconfig                           | 35 +-------
 arch/arm64/Makefile                          | 12 +--
 arch/arm64/crypto/aes-ce-ccm-core.S          |  4 +-
 arch/arm64/crypto/aes-neonbs-core.S          |  4 +-
 arch/arm64/crypto/ghash-ce-core.S            |  6 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S       |  4 +-
 arch/arm64/include/asm/assembler.h           | 42 ---------
 arch/arm64/include/asm/compat.h              | 14 ---
 arch/arm64/include/asm/elf.h                 | 12 ---
 arch/arm64/include/asm/processor.h           |  2 -
 arch/arm64/include/asm/ptrace.h              |  6 --
 arch/arm64/include/asm/sysreg.h              | 50 +++--------
 arch/arm64/include/asm/thread_info.h         |  5 --
 arch/arm64/include/asm/word-at-a-time.h      |  6 --
 arch/arm64/include/uapi/asm/byteorder.h      |  4 -
 arch/arm64/kernel/fpsimd.c                   | 21 +----
 arch/arm64/kernel/head.S                     |  7 +-
 arch/arm64/kernel/image.h                    | 38 +-------
 arch/arm64/kernel/kexec_image.c              |  5 +-
 arch/arm64/kernel/kgdb.c                     |  3 -
 arch/arm64/kernel/ptrace.c                   |  8 +-
 arch/arm64/kernel/signal32.c                 | 13 ---
 arch/arm64/kernel/sys32.c                    |  5 --
 arch/arm64/kernel/vdso32/Makefile            |  4 -
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h   |  4 -
 arch/arm64/kvm/hyp/nvhe/gen-hyprel.c         | 16 ----
 arch/arm64/lib/csum.c                        | 17 ----
 arch/arm64/lib/memchr.S                      |  2 +-
 arch/arm64/lib/memcmp.S                      |  2 -
 arch/arm64/lib/strcmp.S                      | 34 +------
 arch/arm64/lib/strlen.S                      | 26 ------
 arch/arm64/lib/strncmp.S                     | 93 ++------------------
 arch/arm64/lib/strnlen.S                     | 16 +---
 arch/arm64/mm/extable.c                      |  5 --
 arch/arm64/net/bpf_jit_comp.c                | 11 ---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 19 +---
 tools/testing/selftests/rseq/rseq-arm64.h    |  5 --
 37 files changed, 50 insertions(+), 510 deletions(-)

-- 
2.55.0.679.g6767b8d81c-goog


