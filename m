Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F94C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PKUKgD1kM1UgZR3NN9w1SlMSCpamSKsnNPGiLjMQjvc=; b=1XP0aqtBAWUyimQTJDxpc58LBO
	jYsiCnuH528RmZAOLicpkpmzwEjwAklNtfwQL/55N4M9p9mXKt6XF1Nxf4IF3Acna9VsUMAqJ9Pxm
	sgCS0he3RXdlmMOt+yI00dkmdgoG3pIHTyTeuL5mt4rhrMKAVnYKAXXfxwQkKD34JIrotofjIjin1
	fbCD3TrnWFAls6WLT8Poi5aU+bLT1Z0+tnTbXFbAOvBIutpxKXPkP9UQBjzjNxDxg5G9DjOvzi/Pe
	Nb0KAsMdkxK2fVoSVCg5bCPf83tF/168juULRchVc7LxFwlXhud1FL5c4SVfk79L4oyAqcf5WMuKR
	ZnlZjVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1j4f-0000000HFeV-3gLE;
	Mon, 07 Apr 2025 09:47:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iyu-0000000HEDj-1vVw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 599595C597D;
	Mon,  7 Apr 2025 09:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E958C4CEE9;
	Mon,  7 Apr 2025 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744018887;
	bh=cqFVpiMLss0+HxdO2CYbfXC6D/iBdTbrM+nK40NDFG4=;
	h=From:To:Cc:Subject:Date:From;
	b=Wrj4Vs/n9PxnaHaHHtmEMpxeE23Qy8lrGk4d3zss3LW8jHzTSZsCiMr6hJc+p+j2Q
	 GLNRtgJ0DhH9Ww1/PA/9J6uJBBcnzFcj6K5cV5Cp38K5imMNe/kpNGqRgBOObcXY6B
	 jCrY2CWl7pQpC0ZbkKeeGND8TRvCKFEHqAWWYYOsOeT41hYnu9plJ0xQrLnMSSRh2e
	 92ncte/rG/1MsHNVe/aYtRao0MZpmsripKQ+Azt+o8HyTKGCBOcFvevIeSoM5X/DK9
	 cQ62sFa4cxfq36tnxUuHI5WxLJFetXTDNXMILyQhF2YOG1+ZISRCKc3Dk1Fqg077xa
	 gK1fLhXrhHfdg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Date: Mon,  7 Apr 2025 11:41:12 +0200
Message-Id: <20250407094116.1339199-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_024128_606633_366F236B 
X-CRM114-Status: GOOD (  14.84  )
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

From: Arnd Bergmann <arnd@arndb.de>

x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
actually go through all  version checks and make this is the minimum
for all architectures.

Most of the actual resulting changes are actually for raising the
binutils version, which eliminates version checks on x86 and arm64.

Arnd Bergmann (4):
  kbuild: require gcc-8 and binutils-2.30
  raid6: skip avx512 checks
  x86: remove checks for binutils-2.30 and earlier
  arm64: drop binutils version checks

Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-raid@vger.kernel.org
Cc: x86@kernel.org

 Documentation/admin-guide/README.rst          |  2 +-
 Documentation/kbuild/makefiles.rst            |  4 +-
 Documentation/process/changes.rst             |  4 +-
 .../translations/it_IT/process/changes.rst    |  4 +-
 .../translations/zh_CN/admin-guide/README.rst |  2 +-
 arch/arm64/Kconfig                            | 37 +--------------
 arch/arm64/Makefile                           | 21 +--------
 arch/arm64/include/asm/rwonce.h               |  4 --
 arch/arm64/kvm/Kconfig                        |  1 -
 arch/arm64/lib/xor-neon.c                     |  2 +-
 arch/um/Makefile                              |  4 +-
 arch/x86/Kconfig.assembler                    | 29 ------------
 arch/x86/crypto/Kconfig                       |  2 +-
 arch/x86/crypto/Makefile                      | 12 +++--
 arch/x86/crypto/aes-ctr-avx-x86_64.S          |  2 -
 arch/x86/crypto/aes-xts-avx-x86_64.S          |  2 -
 arch/x86/crypto/aesni-intel_glue.c            | 21 +--------
 arch/x86/crypto/aria-aesni-avx-asm_64.S       | 10 -----
 arch/x86/crypto/aria-aesni-avx2-asm_64.S      | 10 +----
 arch/x86/crypto/aria_aesni_avx2_glue.c        |  4 +-
 arch/x86/crypto/aria_aesni_avx_glue.c         |  4 +-
 arch/x86/crypto/blake2s-core.S                |  4 --
 arch/x86/crypto/blake2s-glue.c                |  6 +--
 arch/x86/crypto/chacha_glue.c                 |  6 +--
 arch/x86/crypto/poly1305-x86_64-cryptogams.pl |  8 ----
 arch/x86/crypto/poly1305_glue.c               |  4 +-
 arch/x86/crypto/sha1_ssse3_glue.c             | 10 -----
 arch/x86/crypto/sha256_ssse3_glue.c           | 10 -----
 include/linux/unroll.h                        |  4 +-
 kernel/gcov/gcc_4_7.c                         |  4 --
 lib/raid6/algos.c                             |  6 ---
 lib/raid6/avx512.c                            |  4 --
 lib/raid6/recov_avx512.c                      |  6 ---
 lib/raid6/test/Makefile                       |  3 --
 lib/test_fortify/Makefile                     |  5 +--
 scripts/Makefile.compiler                     |  2 +-
 scripts/gcc-plugins/gcc-common.h              | 45 -------------------
 scripts/min-tool-version.sh                   |  6 +--
 38 files changed, 36 insertions(+), 278 deletions(-)

-- 
2.39.5


