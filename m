Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BBEC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 23:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=; b=SJZiHI6d9PEmABLuqDpacuOnvB
	hWK+hSoJqUQKswgdRY1kM5tTOJdsJwUfXwy8v759h97nMyikeaDWsdQwx+y5eVszwHTsVlm6/mcQV
	yiR4vGK91BMHIBVZiI6+MAczOgvOgfHrgLFnbchpOrIqM7o5yL436DoPqZhLybkgN5s+Kgf4PrMuU
	YfaB0Kb5ECqlt6mbLU4ylHAE6mVMIs63kWK/WZCcXPCbcr7sqzPV3HUOv+RUQC2+fyJqaOv0/eHqr
	GPLjExvpRa0UCUXcqAb16g5MsFHbaHu9u3j2E40FCqU6G6mO08nPtg07dUEZMEyAGVWDKs0cOKvmZ
	KPIyJWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44wl-0000000AR2g-2Jcy;
	Tue, 08 Sep 2026 23:09:47 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44wi-0000000AR1V-2qor
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 23:09:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso51495945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908982; x=1789513782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=;
        b=BsFY6RjcNuBAwIOLfOqoWMj4MhRhEXsxt85M897iDgKpZCvNHmkNW9AYAaesmzg0+2
         E+Gqeo4ureUqO2ZSNTa8Pc0fMRd5Zkxbqbuu2dqaNn8lUTY2nL67ZcUJMHdS7PgXw9Ac
         o4xqP5x3JrEkX3+8lf8IUIVh26MU8mBITEm0VAZBtl2acZsUu9oD93kUNuriaLVjIXaT
         PlFEt2+wSh9mCi08XY247MNpD5c4/qMuVM2tVm5PJrpak627V+a8dmECHtzr1rhZ1aNi
         TMrjofqeP/k1/QJgepbo8/hT3CIOrJ9t+N3zeo3AB5UGLzaEkFIF900/ZcUE3SI0Rgi9
         NFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908982; x=1789513782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=;
        b=TeFTGDKkkIZtKfDwc9yjPimPLQcKsGj/gCcwYWj2od7liNl49Nny8HVrtotnu0HKyX
         lG7Y8jn3Ologesnr0SIfcMoWHUYw3Ff0N04TsdtJaJl5Cd4MdU1jA0fhtlacdr1Ve2oU
         ry5mvemvRt9AGNzrTNfHfTcQJMRMkjlucMtg3WSu8PFgy0GSIpspYJu5KINnO+4gsNoE
         P7y+FjF7da3CxhoESuxf31NFK/epGGKbNFY79oBXuru5/j6mp6yR4vkHTKaVVCnsGkkq
         eAZzCtQnuTE6lwz7ATIGkFQlP0VubxvcZpagMYdxybXX/xHihvJchZHDNsLthFKwa/cJ
         5z0w==
X-Forwarded-Encrypted: i=1; AKwUvBxvlbFXYRaVw1Xv5Wih7QD5PtCW5CU2aazNjaBOdQlBLF34V2D5tkp7ElrDoH3ITtY4lP/dwKk4CrS3F+08vzaR@lists.infradead.org
X-Gm-Message-State: AFuF++nuHzDaQArbKkqrTdQ+vcE2gKzYWD89jB9x785mYKJ4rY/LMd9V
	KMZyRgfZ/fnmb9tr0DlHLDgrJzDGT3uW7GEhSK3i+GCKITmQJU4XEPkg
X-Gm-Gg: AYBFou2kvoLjMwSYKfpw5ENgQLOcmh+HjtxoHf3AWZGaJAj44lVreSF/thDoMhty5jX
	6UYoHJkiIKe9jBJHKSEI2gl/OFA59FP20ZSJX3nfUcubxvjRj30SqO6ptbx7vROy8NYWSH8aHei
	jgv1x8FzBRcnTfAzGtLsh7uHXy8MLs4jt+KBbUvgelj8ltLfnWHaLBKbh5Y+41jskkom8woY3nC
	S9xRuNeH+bjZg9FLNyYK2jYgr0j+fiMp9pK4o13pGF4MnFtDOIPvsMNrF3j5rH/fwKPm0+GEA2O
	DWbXcl5nMOZTzA+SP9eTxrSlkQfRJcC7s/mAh3Ug74CnBFkvnw/ZG1IjMZ2QJN4EVqXf0sapPGF
	wM7ICGDpUDdNtf9Qw1joBe+K4OFF9pyHgYKXAwJobT9vDlOpj03lTHpSW0/FQpVgWtexFQPBRAc
	F2kP2tHiIWR12NNQ6SB8SFxMCwgasaQIX5DYDWD+TyZ+acGehZHsvUNMyIhkzU2qLNTLy38MChL
	D8NhrVl/H7qk9lYvwwWtagDwsjZ1C3y4MTsIG9iempqgMrK5mvvxN6wKISXdHzrDbWDAf3WE0/R
	qL5MhT+ce6u5of9sjKB1HlcBfw==
X-Received: by 2002:a05:600c:348a:b0:49c:fa20:cc03 with SMTP id 5b1f17b1804b1-49cfa20ccedmr254595975e9.26.1788908982187;
        Tue, 08 Sep 2026 16:09:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm385530905e9.3.2026.09.08.16.09.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 16:09:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nicolas Pitre <nico@fluxnic.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-modules@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] module: reject out-of-range relocation target indices
Date: Wed,  9 Sep 2026 01:08:15 +0200
Message-Id: <20260908230815.78409-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_160944_814750_9A4737EB 
X-CRM114-Status: GOOD (  18.11  )
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

apply_relocations() skips relocation sections whose sh_info target index
is outside the section table. ARM, ARM64, LoongArch, PA-RISC and RISC-V
use sh_info earlier in module_frob_arch_sections(), before this check.

ARM, ARM64, LoongArch and RISC-V use the unchecked index to read
sh_flags outside the section header table. PA-RISC uses it to index an
e_shnum-sized heap array for a read and an update. QEMU reproduced
page-fault Oopses on ARM, ARM64, LoongArch and RISC-V, and a Data TLB
miss on the PA-RISC array read.

Validate sh_info for SHT_REL and SHT_RELA sections in
elf_validity_cache_sechdrs(). Reject the module with ENOEXEC before
architecture code can use the index.

Fixes: c298be74492b ("parisc: fix module loading failure of large kernel modules")
Fixes: 7d485f647c1f ("ARM: 8220/1: allow modules outside of bl range")
Fixes: fd045f6cd98e ("arm64: add support for module PLTs")
Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
Fixes: fcdfe9d22bed ("LoongArch: Add ELF and module support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

A custom harness for upstream Frama-C 33.0 (Arsenic) Eva found the
ARM32 instance in a source-identical ARM module_frob_arch_sections()
slice. Eva reported the out-of-range section-table pointer and sh_flags
access.

The analysis and ARM32 A/B test ran at Linux b9b3e33b70b7 ("Merge tag
'trace-v7.2-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"). The
PA-RISC, ARM64, RISC-V, LoongArch and x86_64 A/B tests ran at the
declared base commit, 28924df2a08f. arch/arm/kernel/module-plts.c and
the touched loop in kernel/module/main.c are identical between the two
commits.

Each A/B test changed only a relocation section's sh_info to
0x10000000. The same configurations and modules were used before and
after the change. All controls loaded before and after the change. The
fixed kernels rejected the malformed modules with ENOEXEC.

Original-kernel results with QEMU 10.2.1 TCG:

- ARM32, virt/Cortex-A15, GCC 15.2.0, multi_v7_defconfig plus
  VMSPLIT_2G: page fault at module_frob_arch_sections()+0x160.
- ARM64, virt/Cortex-A57, GCC 15.2.0, defconfig: page fault at
  module_frob_arch_sections()+0x110.
- PA-RISC, B160L, hppa-linux-gcc 8.1.0, binutils 2.30,
  generic-32bit_defconfig: Data TLB miss at
  module_frob_arch_sections()+0x11c on the stub_entries read for a
  counted R_PARISC_PCREL17F relocation.
- RISC-V, virt, GCC 15.2.0, defconfig plus RELOCATABLE with
  MODULE_SECTIONS enabled: page fault at
  module_frob_arch_sections()+0xe4.
- LoongArch, virt/LA464, LLVM 21.1.8, loongson64_defconfig: page fault
  at module_frob_arch_sections()+0x1b8.

On x86_64, which has no vulnerable early sh_info access, the original
kernel loaded both modules. The fixed kernel loaded the control and
rejected the malformed module with ENOEXEC. The test used pc/qemu64,
x86_64_defconfig and GCC 15.2.0.
---
 kernel/module/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d0e1e0bd2ad0..30c7a05488bc 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1933,6 +1933,7 @@ static int elf_validity_ehdr(const struct load_info *info)
  * * Section array fits in the user provided data
  * * Section index 0 is NULL
  * * Section contents are inbounds
+ * * Relocation section target indices are inbounds
  *
  * Then updates @info with a &load_info->sechdrs pointer if valid.
  *
@@ -1983,6 +1984,12 @@ static int elf_validity_cache_sechdrs(struct load_info *info)
 	/* Validate contents are inbounds */
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &sechdrs[i];
+		if ((shdr->sh_type == SHT_REL || shdr->sh_type == SHT_RELA) &&
+		    shdr->sh_info >= info->hdr->e_shnum) {
+			pr_err("Invalid ELF relocation section target index %u\n",
+			       shdr->sh_info);
+			return -ENOEXEC;
+		}
 		switch (shdr->sh_type) {
 		case SHT_NULL:
 		case SHT_NOBITS:

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.53.0

