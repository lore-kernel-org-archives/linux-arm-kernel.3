Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667EFCA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 05:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=; b=akMV+FPGOZDKNlTp+1NRXKS0rg
	66W8V+4CF+BmGcecr1xIQ88oFz9XqrFbuunZWMV+k9NxRTZOr/HpIpQjtVEURn+UVKCos/2aAwfNJ
	WlhWfdvh+ibTg0PohkB18iMtpOSEh+KOyUV9MmjVZ8XGKT0KHoXzWtheEd8TXXsvyX8LwempiB31G
	jF3G3zraCjRiotvRrHUwXvl5l9SiwdTSQD23Z07HEw/geuQiEWMnquOAb6REyt4kB0U2pKrYpXZ5p
	Htjw4QhVpWHjwwqt0HVXpuV94jt5jAcBol8lPqzfzcXFfj8ZCsBECBEta9DZK9EMzP9LWnh6vuAcN
	S5Q5pZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpY-00000003YbU-1A7d;
	Thu, 08 Oct 2026 05:38:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEgpU-00000003YXT-39ZX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 05:38:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso24535385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 22:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437887; x=1792042687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=;
        b=FiAbh9abCoNIKmF2heyPKWtI24yp9NsSnLDtCVUhXEH3wKaXpMKRS3MuheNKqeuxVx
         e0lg7BluU9p/NA540KPVmguAIwg1vqOJeL5UwGZWpov07ePrHMVhCfzkj8x6fueNjXF+
         BY05wxcS4xRXEOZ+QhoO+SglQ417z8fsn1nGEGp85D4WYcT4vNCZqHNqVF9vfFttaDB6
         1DR20CpzTJtGEGARuCiHYRkHxu9IGHFYZU/t+CJbGdvM3Mv4rk39o4d0+N7E+AqYrBaX
         pTkRuCRhrrVUmsV7r6YoU/Y632+gTriEaTF5PXJNf0WfzYsNZeEcupFEMQQAB+5jGKKY
         NQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437887; x=1792042687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MtBoeOQA/ziEGpOBjK5f/vKkxIKhAQnTnwERrUlvuXc=;
        b=rAdhLXcGSexyPvnncPj6CTmaz6hVJGP4NWiDOuTBGEOQ5jdc6CIwVXC/KUO+rstTA2
         qFff+u0tepStbhi20GsXOY+AxQ71bScQlREszTKAq372lcsJenjYjxBJhEY3Dx3qhGCF
         X3wF3fnj8TaT/jCylNkEexxP0eg0mEmkNtjYVG3srwmHkAoH7AN23kwCeepuKXEMWmOJ
         BJkjzKsijS0wlwJ+97qOrbVdy+TrdS4rEn1mCxR6I+ZoU2oqqLa4X49jJcKY8yN1xRx6
         gbwfVQyGzIJ0vEMA4Moo87jcBAZWFfP3dCcO+WdosnadZuE12H6M2POr/xbsQn44BFSL
         y3VQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO/BUVwXi7kP6IXu6HKNQcPy2zCdT/tUBmVpv8SifVN0Xn1nhz/OOta8X7jOt0n62t1Yc/YSfGcNkWmpuvE4YA@lists.infradead.org
X-Gm-Message-State: AFuF++kgQXWB/I31fdBxC8Xuv77qf9HidACXgX/zr1sthBVYKTOAVSDN
	UowWd8Bn/Y8AgBKqPWXpzQQpy6K+glzly03JgZkri34730Fb84f3cE3/
X-Gm-Gg: AYBFou3jzu4dVKDzyEZMrXYavccyvJYqwUYx6PblzPsQ8wHNHdRiTHzCzpDUEm/LGGs
	HKHz9I7AAsog/mW0l3Wq6l0/wjQNVn//E22ahyNnWOokUYiLQnx/Ut72HemGzLcpB5OZYInpbqA
	4n5bgpdaiU/bC4g2o0t93aQIPCN4hk1V4TalN4A26N9GsIfZ3WHBa4gPCeoxPz/fonkfa8tCKMe
	NCZD+XVrKcdN5iq7XtbDdb709iwY8B7LEo5oUua3cXAzs1TjGJN/Bg2YE9Lb35nnc22jb6SBVKN
	FtN8yeUlALRvxeV8Y1ozWX3sx/knnXwdguuP+RtWSxZGVV8WgF8NPqaQvrefvzxdGssUlZIRPyG
	MBxlmp5a81XoQf5E6M8fQTGBAhxmH2LyH/Yw4sKN8GFS8t089ISacM76wXJU7kqp6u72JbyALsL
	p5JsiiLQKEo4RyZuBEhp8aE04csXpo99F6aVSiDGHGokC5owCNOGBQ3jaAqB2hKZx5EZ5GKHLEL
	PlpBsjyFt6kprEQ87hT/g5Z/FwPiAY0WTc6TlixVcYENLeSx7sAPFsSsyeV3g/Znf0xBbAF1a6m
	mUYnhtZ7913m45of14kAaVa8jBPJQGjcIaNxj7ARx6TCEKZmT4JlFZXu5rC3vUZy5bnQ0RQ6MPW
	aEfzF8UY=
X-Received: by 2002:a05:600c:8b6e:b0:4a1:714d:eed with SMTP id 5b1f17b1804b1-4a180649453mr74925515e9.14.1791437886819;
        Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:06 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] ARM: rust: Build Rust code for ARMv7 on ARMv7 kernels
Date: Thu,  8 Oct 2026 07:37:46 +0200
Message-Id: <20261008053746.49631-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_223808_837411_B49B7AE6 
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

The arm-unknown-linux-gnueabi target builds ARMv6 code. An ARMv7 kernel
gets that as well, because no CPU flags are passed to rustc. Its Rust
code cannot use movw/movt or any other ARMv7 instruction.

Use rustc's armv7-unknown-linux-gnueabi target when the kernel is built
with -march=armv7-a. It is ARMv7-A with the soft-float EABI and NEON
disabled. Unlike the generic target, it does not set +strict-align.
This allows unaligned word and halfword accesses, matching C code on
MMU-enabled ARMv7 kernels. A kernel that also contains an ARMv6K CPU
is built with -march=armv6k and keeps the generic target.

This builds the Rust code for the same architecture level as the C
code. In the tested Raspberry Pi 400 configuration, Rust text grows
by 1.9 %. Six small benchmarks range from 10 % shorter to 5 % longer
runtimes.

The generic target would turn a full memory barrier from
core::sync::atomic into the deprecated CP15 operation. The armv7 target
emits dmb. No kernel Rust code uses these atomics today, so this is not
a fix.

Tested on a Raspberry Pi 400 (Cortex-A72, LPAE) with clang 22.1.8 and
in QEMU virt (Cortex-A15) with the minimum tool versions. Rust modules
load with the movw/movt relocations.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a72843890241..28eb8484ff82 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,9 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
-# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
-# the +v6 of the generic target, so older CPUs need their own target.
+# The rustc target fixes the instruction set, so pick it like -march above.
+# The generic target builds ARMv6 code. -Ctarget-cpu cannot remove its +v6.
 rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v7)		:=armv7-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v6)		:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
-- 
2.39.5 (Apple Git-154)


