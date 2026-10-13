Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DC4CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fjey8+ePw07beGDxIotk+YQHKQUDDDkCGlBqCSvi89Y=; b=gIMxnyKOorzyeicSRn8cYF6dvj
	Ocwhkk4oj2EY7er8XXfpRRSv0Ain43aYHDkv0p/BclScMpTHQVyvzFJF7lKuS6Pq/IQGm0/XVSn1D
	snnalYFM26liY8XC4/XiioukgxLl0cxg1X8r+pSTf4GmFaJaMt4ogOJGn95Ep2poOD17PxZNCTfh3
	IAZ3tF7A3eUMHz5d9+86Kg5Ir8jS53O7e06cdrz83fjF6d2E/PlqY3cXEltC8488aKh3Za0HYJ2RJ
	/xDAnIqPuD+nSMojJvbuucn+Ia2nJpPwXjpTa/abK5uZOGXhUw0nTolwIh6lUw+KjHT+PFJOCxV99
	7k0oiuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjAB-0000000E0NV-2X4b;
	Tue, 13 Oct 2026 20:31:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjA8-0000000E0N0-34F3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:31:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so20918255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923510; x=1792528310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjey8+ePw07beGDxIotk+YQHKQUDDDkCGlBqCSvi89Y=;
        b=qqGEfoYm+PQ7nbR55op4q/JKZTuAUuskjRxvXWWTl+0VUvBV4csX93DzwOFe2+Bkoo
         A04wlDS+wjJiThPbwjb3S68sm41BTDM2GQP06S/cKaGbg3k+ydTL8TAYmYGl0QNhCc7K
         sACOKMHuxHqn44OwxNCG24vMMKEaWBkOvRweOsWYV0EGXikN29oTNHneL8T4yhl8yGrf
         WyIP0EKZZTOcR4eM7BB6Y3pcpf1H4gHixh8ioB4EsO3riLKjQZY80xJU1dyipn2GpH+L
         lUikL+sDTIcUu18AEq/7UwyT7Vw/mB5sRsqdW4eoLdatR4ZfUKsucWa9PzXYW4lOIHmV
         0VJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923510; x=1792528310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjey8+ePw07beGDxIotk+YQHKQUDDDkCGlBqCSvi89Y=;
        b=bp9+t3OrgU0TpQRHOozok/H01kpT8VgrqyrgYh9w+vr8nOhgSC8r+CLZTbYhNi6QkM
         d5sC8cIG6FH2lwz792vfuhvTLLjwdqSw1lyyAcQi+HgU/8j/pexwD8D/QH3MlIytlbBu
         0HeTyhrjb7MBqyMFZ3ydA3GvSSm+r0d3kptGGhLKSVVmQhVjYufUS2yxCMD39wT001/l
         FQ1vmJnpEtNMdR2+Zb/+i0x3SKUJaIKKaOaqUGB/4DP7rju05S+tpkJxdux5Nsjk6I8Q
         9NG1N5Hv7hNTshu67h0DdCdK7jGAVep6L9pY6DkNxZsha5Y/5yCicYV4nzZx0R34yVqb
         BvGw==
X-Forwarded-Encrypted: i=1; AKwUvBwbGC41hfw678aYb3uPjg2Q08rkRT8r+euZs8d2V2WZnpKWD3gSGpFSp4EmihZWnmOz3FjMD9TE7Henise1sQM9@lists.infradead.org
X-Gm-Message-State: AFq9FYKvVgyTkHENCQ36s6yJZxxnAWHUNPYW6A2YQkj6OJe+QGVViLda
	X3TelIOJdmWN9dBHfvLl5kdlMovWwQyoLZzptxqZE8mDOfEUOCQiTPuD
X-Gm-Gg: AYBFou1ljH92V0C220PPdy0/dka2bh09NmFn9U0IshsRJJcfrSiT6GGiwmv3PyeXcMd
	DFGLmz7NhrtRi6x3ahrET3cWJJwVDqma7jGnXHAZSv3r77qT4JV6U9VHuuk2ZyrTaKx+AEbpfR9
	8IbyZY7eh6O1Qt8R9ANQQ18/ieWb/rgfLVjc9S5gqEvdnWlsHyRxbRHx13CfvD5/K4Gi8oSLpXC
	70Fi8NKtz1NaXgzyDDB1xYMY6jNnPZZRE/y+w9oRInJhDHk0hKspglHGB2iCjoEz5c3tAXMgjdu
	v2sdfWdH0jUf+BsMZWKsoyNSi5JCPHDuRpww5InHPFEyCRY9HI83faMdmfegf1mqxJXjkTfXu4G
	VsN9EYb7bUTekddAWAOFOox6zEG/N0YBOHWJitI2hy1rT/Z6hmMQ7HpTD5uL5+70ItgDOVaf3fh
	fUB5VPLi2+9dRS0/wkKH/YrHV06oQvvhJiwyHI8kj4RPu1++kzVV7r/zWpb6AouJc1E+DPtUfku
	5cOkiVLSbaAcmUCT/au8k70Po9KhgwJjRjh4Vxy1pu1DBvZE6igukS3iEyOQrjKNMf9iS+GjS/d
	+RA3fTs6LptCCFJ1IArVEBCc/FE+xEUvz5nTBz6zMseyIzgdD8gaHcD/NunpeF3WiG3qdkJkDkg
	jyM7W/Q==
X-Received: by 2002:a05:600c:674a:b0:49f:f0bd:1e40 with SMTP id 5b1f17b1804b1-4a18e4afe9cmr246871355e9.23.1791923509703;
        Tue, 13 Oct 2026 13:31:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] ARM: rust: Enable Rust for ARMv4T/v5TE/v6K and change ARMv7 codegen
Date: Tue, 13 Oct 2026 22:31:34 +0200
Message-Id: <20261013203140.31741-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_133152_809594_88167E56 
X-CRM114-Status: GOOD (  21.77  )
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

Rust on 32-bit ARM is limited to kernels that contain an ARMv7 CPU.
This series extends it to ARMv6K-only, ARMv5TE and ARMv4T kernels,
and gives ARMv7 kernels their own Rust target.
Based on v7.3-rc1.

Linus Walleij asked for older ARM cores during review of the ARMv7
support [1]. Christian Schrefl's earlier ARMv5 attempt [2] hit atomic
and ABI problems. The kernel crate now uses C atomic helpers, and the
*-linux-gnueabi targets used here keep the Linux EABI.

Patch 1 fixes a Rust build failure with gcc 8.1.0 and
CC_OPTIMIZE_FOR_SIZE on ARMv7, without the rest of this series. It can
be merged separately and is tagged for stable.

Patches 4 and 5 depend on patch 2 for 16-bit xchg() on pre-ARMv6 CPUs.
Patch 6 switches ARMv7 kernels to the ARMv7 Rust target and can be left
out. Combined ARMv6K and ARMv7 kernels keep the generic ARMv6 target.

Arnd suggested -Ctarget-cpu with arm-unknown-linux-gnueabi. Its explicit
+v6 remains in effect with -Ctarget-cpu=arm926ej-s, so libcore contains
ARMv6 instructions. Disabling +v6 produces ARMv5TE code but warns about
an unstable target feature. The ARMv4T and ARMv5TE targets also declare
32-bit atomics rather than 64-bit. The series selects the target next
to -march.

ARMv4 without Thumb, ARMv7-M and plain ARMv6 (ARM1136r0) stay excluded.

The Rust samples, Rust KUnit suites and doctests passed in the following
ARM-mode kernels on v7.3-rc1.

QEMU:

- ARMv4T: sx1 (OMAP310, ARM925T), omap1_defconfig, 360 doctests.
  CPU_DCACHE_WRITETHROUGH was disabled because QEMU does not implement
  the CP15 register it writes.
- ARMv5TE: versatilepb (ARM926EJ-S), versatile_defconfig, 355 doctests.
- ARMv6K: raspi0 (ARM1176), bcm2835_defconfig without ARCH_MULTI_V7,
  368 doctests.
- ARMv7: virt (Cortex-A15), 371 doctests. With clang 22.1.8, Rust
  modules also loaded, including the PCI and DMA samples on pci-testdev.

The ARMv4T, ARMv5TE and ARMv6K QEMU runs used these toolchains:

- clang 22.1.8, rustc 1.99.0, bindgen 0.73.2
- gcc 15.2.0, rustc 1.98.0, bindgen 0.72.1
- minimum LLVM 17.0.1, rustc 1.85.0, bindgen 0.71.1
- minimum gcc 8.1.0, binutils 2.30, rustc 1.85.0, bindgen 0.71.1

ARMv7 virt also passed with both minimum toolchains. No additional
toolchain requirement was found.

Hardware:

- Microchip SAM9X75 Curiosity (ARM926EJ-S), clang 22.1.8, 356 doctests.
  Tested with an ARMv5-only config and with at91_dt_defconfig, which is
  built for ARMv4T. Rust sample modules loaded and unloaded.
- Raspberry Pi 1 Model B+ Rev 1.2 (ARM1176JZF-S), bcm2835_defconfig
  without ARCH_MULTI_V7, clang 22.1.8, 368 doctests. Ten Rust modules
  loaded and unloaded. Misc ioctls, configfs, scoped debugfs and rnull
  I/O checks passed. The always-disabled KUnit selftest was skipped.
  No warnings or oopses in the test kernel.
- Raspberry Pi 400 (Cortex-A72), 32-bit LPAE kernel, 371 doctests.
  Both ARMv6 and ARMv7 Rust targets were tested with clang 22.1.8 and
  with gcc 8.1.0 at CC_OPTIMIZE_FOR_SIZE. With the ARMv7 target and both
  compilers, Rust sample modules loaded and unloaded. rnull read and
  write tests passed, and Rust cpufreq-dt switched between 600 MHz and
  1.8 GHz.

The optional panic QR renderer was disabled for the GCC build with the
ARMv7 Rust target. With rustc 1.85.0 and size optimization, its object
references __aeabi_uldivmod, which the ARM kernel does not provide.
An unpatched v7.3-rc1 QR object has the same reference.

Built-in Rust code ran on Thumb-2 kernels on the Pi 400 and in QEMU,
with both ARMv6 and ARMv7 Rust targets. Tested Rust modules failed with
"unsupported interworking call (ARM -> Thumb)", also on unpatched
v7.3-rc1. One open question is whether HAVE_RUST should exclude
THUMB2_KERNEL && MODULES or leave module loading to a follow-up.

I plan to submit the enablement patches through Russell's patch system
unless the ARM and Rust maintainers agree on another route.

Changes in v3:
- Shorten patch 1's commit message as requested by Gary and collect
  Gary's and Bradley's Reviewed-by tags. No code changes.
- Tighten the commit messages for patches 3-6. No code changes.
- Add Raspberry Pi 1 Model B+ hardware results for the full series.

Changes in v2:
- Select the rustc target next to -march and explain why -Ctarget-cpu
  on the generic target is not enough (Arnd).
- Add ARMv4T and ARMv6K-only support (Arnd).
- Add optional patch 6 for the ARMv7 Rust target (Arnd).
- Keep ARMv7-M and plain ARMv6 excluded (Arnd, Bradley).
- Test Thumb-2 kernels and document the Rust module failure (Arnd).
- Test gcc and the minimum tool versions (Miguel).
- Add patch 1 for the build failure found with gcc 8.1.0.
- Patch 2: unchanged code, collected Arnd's Acked-by and Reviewed-by
  tags from Linus Walleij and Bradley Morgan, and explained the plain
  ARMv6 exclusion (Arnd).
- Update the atomic-helper architecture lists and architecture table.

v2: https://lore.kernel.org/rust-for-linux/20261008053746.49631-1-kmehltretter@gmail.com/

v1: https://lore.kernel.org/rust-for-linux/20261003093827.77857-1-kmehltretter@gmail.com/

[1] https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
[2] https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/

Karl Mehltretter (6):
  ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
  ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
  ARM: rust: Enable Rust support for ARMv6K-only kernels
  ARM: rust: Enable Rust support for ARMv5TE
  ARM: rust: Enable Rust support for ARMv4T
  ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels

 Documentation/rust/arch-support.rst |  8 ++++----
 arch/arm/Kconfig                    |  8 +++++++-
 arch/arm/Makefile                   | 10 +++++++++-
 arch/arm/include/asm/cmpxchg.h      | 26 +++++++++++++++++---------
 rust/helpers/atomic_ext.c           |  4 ++--
 5 files changed, 39 insertions(+), 17 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.39.5 (Apple Git-154)


