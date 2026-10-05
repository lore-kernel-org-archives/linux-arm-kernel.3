Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABCECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 04:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znHr15ngoIrnyD0Loh8A8gjvgvi//2QapaxdSU8F3XU=; b=gdIkUubwKTa7pHkPUeQyvdOLfe
	ArKumFl80NrBDD8DD8az7QM/S7NoFpmb+9/mC5dtiBxIYm4oz/3DDtq9er3Zo46Lb9tdYdY4M31pQ
	sK/LdWYnkM8yjF5tdbLn99AJnp00xbwYzC6O70nZDL+Qd+qqBUgH6PxWajuoHZt6wKc9uhxaJDAZS
	NEEF5rIXGYROoENG6CaADpkN0LoiCG5j9jTY6M2cYZVt4NC6pMEDb8wJWap7cZgyTPzgJ2f6Y+2fs
	PbaNk67AtxKoVEz4qBcBZIoasW8ijMGMn1CxZCJ5zK06ibkTmKheMRQnQ6O8TUZt86mz9LNJXMfCE
	u8AnP7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDaBN-0000000Fecn-281d;
	Mon, 05 Oct 2026 04:20:09 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDaBL-0000000Fec0-0x6Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 04:20:08 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-4a0977b9c20so18137315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 21:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791174005; x=1791778805; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=znHr15ngoIrnyD0Loh8A8gjvgvi//2QapaxdSU8F3XU=;
        b=Ct4LU4+TISPPUDjgDu+HPk4OqBRE0ADgMqCpAEr+8VMIsv3vMFD1UGGFMFYN0XSfmQ
         o32WHLp9jhnvO+JZZ61kjOCDK8+WegOf/S4pN0IaW3HTBPjsLFL+U9y7IBvtPcjmc0q3
         3QMOg9GP4oWBbC4Gj/chOHBX34GyrXYiATd+JoA0WcKiWZDKD87kobUYzsHTRQMaqKIH
         5l8M0JEQ0VI4n622A1HqAZN5mOA0IFWc9fcYkWGu1SXydIN/etAZ8/2pMQpW9kIeTLhL
         m2Ra3VhDPvtpu7UcyWl0isy67YOrKsJjrokv1BRTCuOrZZxilsyiZolVldSvqp8qNM4I
         E5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791174005; x=1791778805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znHr15ngoIrnyD0Loh8A8gjvgvi//2QapaxdSU8F3XU=;
        b=uUIrGz1ICuIKoREXKU517EzgEUe24Rb1nH1H9w2SLlpYuTZANYWA/pDbwIVW8PipOf
         lMXzDZI1YwDerrV9sG/YHkOvYyDHIeDX0J7cszDMo9mnZFsfVrQqTTngrHfV4v6MbdjH
         SSnMJxKjmVG+7og7kBcN2vBAyR7wiyG8wcm0yuqyI0qNxpGt4NrU2QmVFVr4y+FLyTVW
         2GIWYYpx+Glzwa7Hs+d/INIxM0p5f3kKGzKs2kGbHkUYIP3pzi4af/UUgp5dZkt1V/sY
         4HrocnkNDAu2jhlmOn+2AU7XjVwmTk+5ZcAYpoRToSqRjewMTD5bW+9iPJW0tIQJiDJs
         fSEw==
X-Forwarded-Encrypted: i=1; AKwUvBxGfGZC46rdQsG62To3fyIClLMMutb7TH5FDQgl3v6JJ/SjXZg7oLcVn2isdgh2ucb8SbCNdXwbWOFyPoFIZ1Jn@lists.infradead.org
X-Gm-Message-State: AFuF++mKdr2vri5RdDs0KMWHVo7+cmikehdnf0QTeoAPkqnKq6wsX0lg
	/htVs5Yaz31D8SPlUBzTdxn4nn4DR3iToL7luFMfXVQ+0yYjUFl8ky+n
X-Gm-Gg: AYBFou27a7ADNa+s/X39AJFNwa4RxKdRbUmXvuix85QpmMZYhHE6BpHJt1q1H6yaW1t
	zCp02eDgxdwEmP0yMugG5/kSnFUyCcHKNgcLsG98shqga5pJ7mZbMrejoFc3E7YXJYZomc1lVjs
	jFaU3KCM7rr1JtxrzN00LLFM7oFOvnKOm5db1HJunNmXlxMNgKSmS27Du3oFojoOAr5X2LBDgmZ
	GPDIqR2OWhUYHnaF6dnk3QFloYmlkx3EuMb7jRsDTpVudr/0yNW56qmhCwY4z4ZFa/es5W1r4s7
	kHgR5GsSH3F67AprID+YqucHJCHadGbSt9kgpXFtqh/wqygrKWZ2zJJZr8xPfkLoAiwiOfoiSvF
	NkyXI+iSzY+fwt8bPjf7fB11KO29YzliR7dSXObFuAt981x4S+oxjHZIgrQ7piorfVo/bsKO0Ow
	Avw3tj3peCau8tbVvc1eBZBA7qfDMjd7OUxBhe1aIBrwN57F0Cs9y67dOtsB5BN5LDXb4am5Qh0
	CNWuvCqkXvsDQZaot4erdQ+dEniP3tpgJN4tChbraN/abnuppyr+1LtJfTzbdDcmuFxPYiRLIVK
	aV18nSoZmmGS5GCdUBhgbo+JKxz8ijkF6OL45J6YyimtK/MjCTR0EO8qTXEBZOhgpA==
X-Received: by 2002:a05:600c:3e06:b0:4a1:6ad5:257d with SMTP id 5b1f17b1804b1-4a16d3d5c54mr77517745e9.29.1791174005080;
        Sun, 04 Oct 2026 21:20:05 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-b305-2001-39fa-3d24-821a-4eae.310.pool.telefonica.de. [2a02:3100:b305:2001:39fa:3d24:821a:4eae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm355769085e9.8.2026.10.04.21.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:20:04 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:20:01 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Linus Walleij <linusw@kernel.org>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Bradley Morgan <brads@mainlining.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Message-ID: <asMj2D6_Zx4ZIfrw@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>
 <asEzZ1wOQ_MbgEsk@gmail.com>
 <3436fcef-a052-4261-afb5-677b0bbf28c2@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3436fcef-a052-4261-afb5-677b0bbf28c2@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_212007_319989_D9AC0BF5 
X-CRM114-Status: GOOD (  22.59  )
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

On Sat, Oct 03, 2026 at 10:54:28PM +0100, Arnd Bergmann wrote:
> How do you build ARMv7-A rust code in user space? If the default is
> ARMv6, doesn't that rule out things like thumb2, vfpv3 and sensible
> (inlined) atomics?

With another target, armv7-unknown-linux-gnueabi (soft-float ABI, no
NEON). The kernel never used it. It fits the same scheme

  rust-target-$(CONFIG_CPU_32v7)   :=armv7-unknown-linux-gnueabi
  rust-target-$(CONFIG_CPU_32v6)   :=arm-unknown-linux-gnueabi

A v6K+v7 kernel stays ARMv6 like its C code. My planned v2 has this as
last patch. It changes the Rust code of all ARMv7-only kernels from
ARMv6 to ARMv7.

> In the kernel, we don't normally allow neon code, but it sounds like
> we may need to make rust depend on !CONFIG_THUMB2_KERNEL, as that
> may be problematic when linking with v6 code.

You are right, for modules. Built-in Rust code works on a Thumb-2
kernel (Pi 400 and QEMU). Rust modules do not load

  rust_minimal: section 8 reloc 24 sym 'rust_helper_krealloc_node_align': unsupported interworking call (ARM -> Thumb)

Same on v7.3-rc1. rustc has no Thumb-2 target with the soft-float ABI.
!THUMB2_KERNEL would also remove the built-in case, so v2 leaves it
alone.

I have a first module loader patch instead. bl to a Thumb function
becomes blx, other branches go through a PLT veneer. Rust modules then
load on a Thumb-2 kernel in QEMU. I would send it separately after more
testing. Or do you prefer !(THUMB2_KERNEL && MODULES) for now?

> >   --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s
> 
> Ok, so I guess this is more like -mtune= in clang and gcc?

More like -mcpu. 
It adds features but does not override the +v6 of the target.

> Maybe this should be "+v7-a" instead of "-v6" to allow allow the
> compiler to use all ARMv7-A features instead? It would be surprising
> if they added 32-bit Arm support to Rust without a way to target what
> is in almost every single chip and Linux distro today.

rustc does not know +v7-a. +v7 works but warns about an unstable
feature. The separate target avoids that.

On the CP15 barriers. With the generic target a fence(SeqCst) from
core::sync::atomic becomes

  mcr p15, #0, r0, c7, c10, #5

and with the armv7 target dmb ish. No kernel Rust code does that today,
the Rust objects I looked at have no CP15 access and no swp. But
nothing prevents it.

> I would leave out CPU_V7M as well, it's not worth trying to

It is left out already. HAVE_RUST needs CPU_32v6K, CPU_32v5 or
CPU_32v4T.

Thanks
Karl

