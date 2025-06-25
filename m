Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA02C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46IGkncAnF1FVMbibmfrXck0mFyRWTUpklQbc5wHC5A=; b=elb5s2p5+9GoRWcat+F9br+I8J
	0fmPvI6X7MkwFivvOqpahwXiolviDPe9sDL6Lw7ILkC2JxS/rZhR4C/MDAJkoq2NNW9++UMv7D+6b
	vBSlIOXzv/Bq3cWfgpQ/8AA7zrWN06+ded9iRsfhsde2FqtYWKHbhHsis7CRzmN4eAJzJJ8Z5k6oo
	O77VZoUy6lUuaLSWR1hjDKVJJhr/XlFvOOWkrdO3UqwLEr5lwah8LEKFSKfvnVxvM8y0TgcegaEyg
	GnKcvLa5cT87Ih9xXOuzUBGEN2iSH99gxPqWGAymsYXVfTk9Phc6Nmf9mu8Jt15TddvkYYhjn9v3b
	rmlK5VJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWBr-00000009n59-2sKl;
	Wed, 25 Jun 2025 19:53:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPfq-00000008hxD-2ELD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 12:56:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 308C4A52561;
	Wed, 25 Jun 2025 12:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A8EC4CEEA;
	Wed, 25 Jun 2025 12:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750856180;
	bh=Dz5Oh6ZQApBF4VZkqH2TbMEO+1URjB0qZPeXpOaSAyM=;
	h=From:To:Cc:Subject:Date:From;
	b=qWE2qnaB6AEFnYieEk5vJ+/s0gLddEoVYyPp9W6NmjrIKr/i1PiqNv/EhEdoyy/kq
	 8GHpQsDUspx3bxFYvs5Hk3AlqEFmRV6g7FqmBpGHqA1oYVdn66vnxrDWDFD9H8ER+O
	 HmndyumTt2kdePikwRvQOBbItSTHZzDLvSENDTgy3n5qL0J4X+V3wCfJV8OSx9iB3a
	 ZT+zlhoIWBfCUOzV7MdCVR+vhAxxVO+ppng7Od5zaIIUlB/IrdXLHAO25qok0mgZBN
	 UspZvgH1d67IYcnY1RxxXEBHknoQvebrYG3CgG9nKvSx9vBlL3OhO7dH00GpZ5zJeg
	 zAH+oRAaoFtBw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: fix unnecessary rebuilding when CONFIG_DEBUG_EFI=y
Date: Wed, 25 Jun 2025 21:55:20 +0900
Message-ID: <20250625125555.2504734-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_055622_702168_34B43FA2 
X-CRM114-Status: GOOD (  15.53  )
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

When CONFIG_DEBUG_EFI is enabled, some objects are needlessly rebuilt.

[Steps to reproduce]

  Enable CONFIG_DEBUG_EFI and run 'make' twice in a clean source tree.
  On the second run, arch/arm64/kernel/head.o is rebuilt even though
  no files have changed.

  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- clean
  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
     [ snip ]
  $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
    CALL    scripts/checksyscalls.sh
    AS      arch/arm64/kernel/head.o
    AR      arch/arm64/kernel/built-in.a
    AR      arch/arm64/built-in.a
    AR      built-in.a
     [ snip ]

The issue is caused by the use of the $(realpath ...) function.

At the time arch/arm64/kernel/Makefile is parsed on the first run,
$(objtree)/vmlinux does not exist. As a result,
$(realpath $(objtree)/vmlinux) expands to an empty string.

On the second run of Make, $(objtree)/vmlinux already exists, so
$(realpath $(objtree)/vmlinux) expands to the absolute path of vmlinux.
However, this change in the command line causes arch/arm64/kernel/head.o
to be rebuilt.

To address this issue, use $(abspath ...) instead, which does not require
the file to exist. While $(abspath ...) does not resolve symlinks, this
should be fine from a debugging perspective.

The GNU Make manual [1] clearly explains the difference between the two:

  $(realpath names...)
    For each file name in names return the canonical absolute name.
    A canonical name does not contain any . or .. components, nor any
    repeated path separators (/) or symlinks. In case of a failure the
    empty string is returned. Consult the realpath(3) documentation for
    a list of possible failure causes.

  $(abspath namees...)
    For each file name in names return an absolute name that does not
    contain any . or .. components, nor any repeated path separators (/).
    Note that, in contrast to realpath function, abspath does not resolve
    symlinks and does not require the file names to refer to an existing
    file or directory. Use the wildcard function to test for existence.

The same problem exists in drivers/firmware/efi/libstub/Makefile.zboot.
On the first run of Make, $(obj)/vmlinuz.efi.elf does not exist when the
Makefile is parsed, so -DZBOOT_EFI_PATH is set to an empty string.
Replace $(realpath ...) with $(abspath ...) there as well.

[1]: https://www.gnu.org/software/make/manual/make.html#File-Name-Functions

Fixes: 757b435aaabe ("efi: arm64: Add vmlinux debug link to the Image binary")
Fixes: a050910972bb ("efi/libstub: implement generic EFI zboot")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/kernel/Makefile                  | 2 +-
 drivers/firmware/efi/libstub/Makefile.zboot | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 2920b0a51403..a2604c33f35c 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -81,7 +81,7 @@ obj-y					+= head.o
 always-$(KBUILD_BUILTIN)		+= vmlinux.lds
 
 ifeq ($(CONFIG_DEBUG_EFI),y)
-AFLAGS_head.o += -DVMLINUX_PATH="\"$(realpath $(objtree)/vmlinux)\""
+AFLAGS_head.o += -DVMLINUX_PATH="\"$(abspath vmlinux)\""
 endif
 
 # for cleaning
diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
index 92e3c73502ba..832deee36e48 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -36,7 +36,7 @@ aflags-zboot-header-$(EFI_ZBOOT_FORWARD_CFI) := \
 		-DPE_DLL_CHAR_EX=IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT
 
 AFLAGS_zboot-header.o += -DMACHINE_TYPE=IMAGE_FILE_MACHINE_$(EFI_ZBOOT_MACH_TYPE) \
-			 -DZBOOT_EFI_PATH="\"$(realpath $(obj)/vmlinuz.efi.elf)\"" \
+			 -DZBOOT_EFI_PATH="\"$(abspath $(obj)/vmlinuz.efi.elf)\"" \
 			 -DZBOOT_SIZE_LEN=$(zboot-size-len-y) \
 			 -DCOMP_TYPE="\"$(comp-type-y)\"" \
 			 $(aflags-zboot-header-y)
-- 
2.43.0


