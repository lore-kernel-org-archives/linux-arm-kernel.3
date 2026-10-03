Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70D7CA5FEF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 17:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GGSdJzmN2dqwo1b/5Kfo2bKbnsN93Ci8hxqW9b45lI=; b=PVPTCrqv7rnM0ca7Z1t4oIucIb
	ymjCtLaPFJRmn5pfbfJkYGkrEp2/SZe5UUPGDFUtznKAFpdYY+pRCEqPGo3X5oR5tuk6eNfGwDEza
	MOkFhts1+fefAhdwgZ56ufPmxcgSKGP2eH5LaCkgcFMXVCKZTy5GmgTbS8PoK2tv4drlqcclnWi34
	PRQvJs5OAciqI72mdMTJbz8O4qbuKCmxeGXQaGzVhJch2xDdqeY8hyfR77uxa0Z3qr3EkoJBAVPVs
	C8VBd3yt6KbKe/O5INrQgkvMMN7Qdt4H6P4LSJlXRqK9/2z5F4tFyS1owTXa/NHIhAlDaBDUvnD/q
	35MCvzmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3Cs-0000000Dp9O-3TH8;
	Sat, 03 Oct 2026 17:07:30 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3Cq-0000000Dp8i-17A9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 17:07:29 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so4285635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791047246; x=1791652046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3GGSdJzmN2dqwo1b/5Kfo2bKbnsN93Ci8hxqW9b45lI=;
        b=iMt5RhGV6PQVuSNP1Io62lEuc8WzODSeyrkDYI6iI3TM8n6IpRypOHzBPQv7wN+qSr
         gfgao1WVcNZUTFL522VoXH6uh9RGRO78WedbP7OBjBYc/kkqbPCrQpARlkRaQCJbAwVx
         WaDi7kj7NgEJScpBGK3Zdt8nIcnwfYfdMjYcSY/mgursp+uVztRIVsj0ER7OP97lbNH8
         xaHp6OSSM0iEn9XdGWE6Jzdo2IPDMfeiV0SYdog8/qY+ZuTI+DTA1zy+56NVwJ6lrpCa
         nzuN3V+3QZN2wMr+gW5GPwGDmvf+zbAPj6jiya92HfeOpid7sSpN82LAp0wuCqTQ1ucR
         N3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791047246; x=1791652046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GGSdJzmN2dqwo1b/5Kfo2bKbnsN93Ci8hxqW9b45lI=;
        b=zKv3/cg3tQ1te67eGssQwV3+UEQFcPxGuHgTVkB/XQYDlsnGMFQQrzE5O+HLdDOR8y
         5RwVmncbadWRsVYnNUXTBpXYK5myJLyJ7Ltm8ILiHtHXPf8r20WPH7bcJA4iHnP7OwC3
         pEZsASV+tQ+pHSRpncxHOztQXN7APLnVkVcK9xRsb68ltro9x7LY/wKbwjcvqUIu/vpD
         dt018MdDSICD5z32JfjRQGzSqhOTRDYp5LLdxIkzuGo/3tMsr5dmW/s8UKp6TAOoQRiL
         WZXAU/TFSjjnt1MT24phQZjMKO0w9SbMqViFmLKsOjx2dFiQmRvfkvLwwUGTeM4ysKGE
         yMnA==
X-Forwarded-Encrypted: i=1; AKwUvBy3BT7tCsQchTQAP+HbYRQis8+Vd4oYPbzgJnXstM54E/VwheDeU1DD2C+vEDrh5lI770rUoYsvSoIGJU8lxCza@lists.infradead.org
X-Gm-Message-State: AFuF++lxeFU82jtKCkZqjOYCVAkkdkniO3YZikxsPiinsiSTTYwgr+Rd
	cLT7RmVGZBk49AvvVFyt/kqHRGX0bbhSUJxZawX+WbOu7qMZ7fWWFR5u
X-Gm-Gg: AYBFou0jU8sozhex1eCccb8m587/N9lDA/NWTJx+czxXO9XsCSln5DxC6GVVqRVMNan
	9upXTbPqFFhbzEit+FuBRCy+xRf0bP1YHe3eKNWi26CvFalIrZbI0LOGP2Lyl2EYyInE/bKBVW5
	b/38AroXFtRXIrkVNWcNC62kRSzGqNcS0+5JOhIQ8i+xfk50JywtWjgEAldrEBFGqmKbQh2nDM1
	2E8nJaioUinNVDGAf3gRJet9O7cS6mJwBwtNMSOrogGLRlA7yr7xkJVQ8q4DFBgSPj7aQegQKf+
	cnutOGRlxb9DCg1B/bUE4sIOxT048Gd00XhdXgGapx1Lc+BZGL93pE6U2pUbJglvV8cKdzlJOkv
	So2I0iFvblbIT3PJy+klnX2M2K2uJKqZSK9RJddOpWcgAAFzWFqW4iQ7CH6ew4W794lUvDUgub+
	Hb1o88k4lmXpQKLKHc3omhIaBCG70q4C7CwOPborocxVgloXWufY+sDWxoRIMIIi+BlkkICX8W8
	x1AuPyp84QSLUT5LMizPNJBpdaNglO4dF8Fo6d2qg2KaCJoxShOjIf6Hf93jEvsRoeDz0pddfq8
	hHTeEWzz/77Xf3bzShFNuP+oi11+WZU9icqSf9phWZhRDuEbaqGO48pYA2eEtYTEHI/g2TBqnx3
	q
X-Received: by 2002:a05:600c:138b:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4a02759b46fmr107744155e9.19.1791047245976;
        Sat, 03 Oct 2026 10:07:25 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380faaeesm12742668f8f.18.2026.10.03.10.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:07:25 -0700 (PDT)
Date: Sat, 3 Oct 2026 19:07:22 +0200
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
Message-ID: <asEzZ1wOQ_MbgEsk@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33197b82-3eff-4c87-b370-c677ca31a02a@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_100728_350073_2F22D853 
X-CRM114-Status: GOOD (  30.67  )
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

On Sat, Oct 03, 2026 at 12:45:07PM +0100, Arnd Bergmann wrote:

Hi Arnd,

> > Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
> > lowest architecture and stay excluded. CPU_32v5 also covers the ARMv5T
> > ARM1020. C code is already built with -march=armv5te there, so Rust
> > matches.
> 
> None of this makes sense to me: The target should not control
> the instruction set, that is what the -march= flag is needed for.
> Does that not get passed for Rust?

No. arch/arm/Makefile only passes --target=arm-unknown-linux-gnueabi,
no CPU or feature flags. That target has "+v6" built in, so Rust code
in an ARMv7 kernel is built as ARMv6 today.

I tried the generic target with CPU flags (libcore for versatile on
v7.3-rc1, rustc 1.99.0, CPU arch from the build attributes of core.o):

  --target=arm-unknown-linux-gnueabi
      ARMv6, uses uxtb/uxth/sxth/rev
  --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s
      still ARMv6
  --target=arm-unknown-linux-gnueabi -Ctarget-cpu=arm926ej-s
  -Ctarget-feature=-v6
      ARMv5TE, but every rustc call warns
      "unstable feature specified for `-Ctarget-feature`: `v6`"
  --target=armv5te-unknown-linux-gnueabi
      ARMv5TE
  --target=armv4t-unknown-linux-gnueabi
      ARMv4T, no clz, no blx

So -Ctarget-cpu can add features but does not remove the +v6. The
generic target also declares 64-bit atomics, armv5te and armv4t only
32 bit. Below ARMv6 I only see the separate targets.

> 
> If an ARMv7 kernel includes ARMv6 instructions, that is broken
> on ARMv8 CPUs that are lacking the CP15 barriers and swp style
> atomics, so that needs to be fixed.

The Rust objects from the generic target have no swp and no CP15
access. The atomics go through the C helpers.

Building the Rust code of ARMv7 kernels as ARMv7 would be a separate
change. I can look at that after this series.

> 
> I don't see what part of rust would depend on ARMv5 instructions,
> it should just work on ARMv4T as well, though ARMv4 may be
> trickier because missing bx instructions etc.

Agreed. !CPU_32v4T only came from the armv5te target, which emits clz
and blx. With the armv4t target it can go. ARMv4 has no rustc target.

> 
> > ==============================================
> > -``arm``        Maintained        ARMv7 Little Endian only.
> > +``arm``        Maintained        ARMv5TE and ARMv7, Little Endian only.
> 
> Here you exclude ARMv6K and ARMv8-A-aarch32...
> [..] 
> but here you allow it, so I think one of them should change,
> 

Right. A v6K+v7 kernel has CPU_32v7 and gets HAVE_RUST already, a
v6K-only kernel does not. No technical reason. I have a patch for
v6K-only that I held back until I have a Pi 1, but I guess QEMU
suffices.

> This looks wrong, the choice between armv5 and armv7 should work
> the same way as the choice between armv6 and armv7/v8, if I read
> the rustc docs correctly, this should be using the target-cpu=
> argument on the generic arm-unknown-linux-gnueabi target.

There is no choice between ARMv6 and ARMv7 today. Both get the generic
target without flags and so ARMv6 code. And target-cpu= on the generic
target does not get below ARMv6, see the table above. That is why I
used a separate target for ARMv5.

For a v2 of this I would

- pick the rustc target next to the -march lines: armv4t for
  CPU_32v4T, armv5te for CPU_32v5, the generic one from ARMv6K upwards
- select HAVE_RUST for everything except CPU_32v4 and plain CPU_V6
- make arch-support.rst say the same

I have this running in QEMU on v7.3-rc1 with
- sx1 (OMAP310, ARM925T, ARMv4T), omap1_defconfig
- versatilepb (ARM926EJ-S), versatile_defconfig
- raspi0 (ARM1176), bcm2835_defconfig without ARCH_MULTI_V7

Would that be ok for you?

Thanks
Karl

