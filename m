Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270E9C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3CnYIC1jW8Yb7MVQSsYlSkO9EcP0G/PW7oItTF3TCFk=; b=tozn7f5YsQuRu87ab71TcVqnRe
	fxiOoyoo1ar9R0bWwB4q76weVRRHQ6APZEdrZivUm3D+cNWQYgH2JfjKGV/tEhr4FSt5LCiyxCVYN
	WHH9Ft9/e2wvgruwfSFx2E/M/Hn9zf4VktNTOQVDGFq8UoCv/dkQ0vydvltqKwyorVx40uBRRJtwV
	CYpQHYz1rbV5+JhPVPav5qJ1PDi+qVQW0Lfkw0dITSx18r4hHHxrfG4uaGsJwfufXO+Pa5n+D4jaD
	k5wXuvJZ+g6wj+ZVcyiIUUlyqECR47pqb9syhuO1GCx3dJaG3N6irv4KxWkKJRxvOjnTNDanmBOP+
	pd0hwcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIC-0000000BKwD-3n3R;
	Thu, 13 Feb 2025 14:34:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZln-0000000BEps-2WQs;
	Thu, 13 Feb 2025 14:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3CnYIC1jW8Yb7MVQSsYlSkO9EcP0G/PW7oItTF3TCFk=; b=mULDg43HVeoC1L5Opi0u7d1M4i
	HaK5W/0ZZEp2RbzYhdys3PlBY3803b1fgI/x/XzeJwFqz85rCpcaPm3rSEOZSgl2MsHI1z5L9E5EX
	mczoOEURwUToRFArVZRpUY/geZKeHmE71A42vhbBkXyPGNlG63iksU9mY0LeCoXyYajxbXpiBxwmO
	46mQmc8MeuIYXEyeVm3tqvTZ/s+Tpq93gxSRl5LpPtyF4mfkCoO2p6SzZwQLCWcMm2E47jy3pdZbL
	kQWCi1RvSHmgktNA6Qncfq+FW23QKdIxYNLuQcZnvAVHDtktS6BxOOuV5V0UkavQ6jr9YkeknQY+j
	h+mGV6hA==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZlk-000000010uC-1Vc4;
	Thu, 13 Feb 2025 14:00:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21f7f03d856so15744615ad.1;
        Thu, 13 Feb 2025 06:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455241; x=1740060041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CnYIC1jW8Yb7MVQSsYlSkO9EcP0G/PW7oItTF3TCFk=;
        b=VgDxrv7aRm36B3WIe5zVmA/WBz4m+i1fKVZbzuCUlgLvu3TD1GuBHpUcqfIk+a9I8Q
         QymRILGfvwqNSIZHxoex+kGKmMIG/bW6DsyiPcps2R2WeiLn+gEQyXiqKQ/ge1qRmWhD
         jF2ppVA7Ookq+nzDefOCU2aVet7aE2W/VY+nu+tFeY/3x+rkM+qK5DQeQzl6NsdlJyc/
         pu9iaA5DLGN1elzx+YvJbxKmFK7VqneIIHz1L2DVRhTqpEPCJscVFg71D0hs8iv57ZXN
         faNFs+0RaESNWwP1GksnjmiC89yW9xTXqN0W/PWxmdVXUk/bIBWvUZ8JzzBS/O5N1JVx
         lZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455241; x=1740060041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CnYIC1jW8Yb7MVQSsYlSkO9EcP0G/PW7oItTF3TCFk=;
        b=KiN2LTe728z2lzOmmm5D2hsK7S1hLyIsmFMQmOJf9DA4952qYcpoTbd4guzDrGRIyb
         EeiY05Ho2iqaKY3M4i5rZubtfezdM/bDA125iYymCDKsRQCNoOkUUTOKzdubaH/bkaa+
         /y7/f2gKpci+OtOhexwnLSyjstf/EEgHFEk8vhRbwwzrdMnJc6CdTlT0+Pr/2R72KWSK
         JITRPizw58iykC+2GWSCCSDbSioQ5W4ySEGyVFLGcItpcM+8jsxP8749h8X5gYImG0kG
         1Ps4a3HIqZZmntjsLN3tyB+xVeB/MYbLjzleFslfEQQ+e+beKCDpDjTg5T78V8DNZuQs
         kU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkjV7d3lvT4A9cFkXxG9tZx5J4yR/wy5XodOKL6x7+j/zlJazDQPTYec0gPbyEd/VDFJQHCMoc8Zs/fQo=@lists.infradead.org, AJvYcCW6CP7qYUyZkmFHJuoKIMheSaV4DKmxirR+2GJ+FNZxB63he2hcCFJQdhC4EAMic7Aop/3dIhXDAykhwUsS94Qp@lists.infradead.org
X-Gm-Message-State: AOJu0YwJtm2eOciFjcDWhPr8ohKijoWIXDZyqzh23GIu/tz8MEiSHtQY
	Inh+jf8JngkG5C+ByIePsGagreSC9GPAyJvJz8alAsyytL/2SLZC
X-Gm-Gg: ASbGncsDDlw1qlwnKIHbo79cmfuGfu68g2DCA4MDTO+z7dJ89e6Y4u74r4Cw+FVt58q
	K427hcgHCGa8Ci75d+1R3NuWGPG5XLVfBDwPDmTSWACy4Pq/mIIOwM7uk74x5ZwImCmZnLsm3WV
	/HIX83m393VC1mR32bjSdpB6ya04jbBJwNeDvZfAkr6c/0h3hjAw78w91kdpAyTN8qfO0oUR5QS
	RE67tGJtdgaZ0BjpxKVUaJXv7k4IbrJok6UcsuKQ+XaJy1T8b+Vn08eKr4pmwBH3IjpkWWJ7O6c
	LOOSuXLQoTo0P73ePQLI+yWv0SIYJtD6FLgf8qgoHsZTaLtoz5KnMghwHGSUhomChgI=
X-Google-Smtp-Source: AGHT+IFiybmklIR6sXPe5dOMXPko9nq/OxURSSt8JQfw095Ue+kPgwqj+3k15eW2uamc5z4ID2izMg==
X-Received: by 2002:a17:902:e850:b0:21f:78f:c178 with SMTP id d9443c01a7336-220d1ec1f7bmr52326585ad.3.1739455240643;
        Thu, 13 Feb 2025 06:00:40 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:00:40 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v3 0/5] rust: Add bug/warn abstractions
Date: Thu, 13 Feb 2025 22:57:54 +0900
Message-ID: <20250213135759.190006-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_140044_521899_9AE38CF7 
X-CRM114-Status: GOOD (  15.63  )
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

This patchset adds warn_on and warn_on_once macros with the bug/warn
abstraction.

Wrapping C's BUG/WARN macros does not work well for x86, RISC-V,
ARM64, and LoongArch. Rust code needs to directly execute the same
assembly code used on the C side. To avoid duplicating the assembly
code, this approach mirrors what the static branch code does: it
generates the assembly code for Rust using the C preprocessor at
compile time.

The 1st to 4th patches export the BUG/WARN assembly code for Rust on
each architecture, with no functional changes on the C side. The
changes for x86 and RISC-V are straightforward. However, the ARM64 and
LoongArch assembly code are designed differently; they are used by
both C inline assembly and assembly code. As a result, sharing this
code with Rust is complicated.

The last patch adds the bug abstraction with warn_on and warn_on_once
implementations.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch.

The assembly code can be used for both BUG and WARN, but currently
only supports warn_on and warn_on_once. I will work on the remaining
functionality after this abstraction is merged.

v3:
- rebased on rust-next
- use ANNOTATE_REACHABLE macro (replaced ASM_REACHABLE)
- added Acked-by tag to the x86 change
v2: https://lore.kernel.org/linux-arm-kernel/20241218062009.2402650-1-fujita.tomonori@gmail.com/
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/linux-arm-kernel/20241210001802.228725-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (5):
  x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing
    with Rust
  rust: Add warn_on and warn_on_once

 arch/arm64/include/asm/asm-bug.h              |  33 +++++-
 arch/loongarch/include/asm/bug.h              |  35 +++++-
 arch/riscv/include/asm/bug.h                  |  37 ++++---
 arch/x86/include/asm/bug.h                    |  56 +++++-----
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 235 insertions(+), 51 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
-- 
2.43.0


