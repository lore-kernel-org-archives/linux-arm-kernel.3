Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB83C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amoIqPhEvcMfohT8d6riZ1SvCH8PzpVcEGymcrQ4XHc=; b=f5WGwlCoJhQtptqU76vDJht6o3
	AmX2RBfio4+ujy9EmQ0EhQfCKA7TYkHU0NHVYA4eH2lvSw81mZrqHcux7QUwDZGXs3OUWV7NnJ+bi
	BDPKwPUWW3/42j1JbfZV8JGweh+hm4r34hM/ZhorB2tBul0hJ/eXY3tJwvUHzxovoZ2y88bu4WHau
	jrPX1zDmPsxbJqQCPeLwlZwfTJs+PEwyBljsT6uhU9dq4+6cqXIxCojPFDGO4uq8qg4gmEgNz5b+e
	zT+9FjS52suKL5heyjm5g+Ae2F7psy+2EHce+e9Lv3UnvtgaojLDEwPVO2GFis8YhwKCwdwpy1EYh
	4pXTxDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibEY-0000000BYXe-1gNC;
	Thu, 13 Feb 2025 15:34:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tibD6-0000000BYF8-2qMZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DDC15C555B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 15:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A522CC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739460783;
	bh=t8QMv5hVTQ+R0IqU8p9CIOvH1ExAEP3a6Vf8v5IaDu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zu0rm2RYHRQAFLzKn4r1HNUMm8YFtDy2MYYtFUpabmqvXs66874sy8GDK5fdm9ZHY
	 w5QC+it44v0XhZy8u8SLZWzM+Uo8+2eibnrdhjONcomdz+gkA8LKnLBcvxYEa3awEK
	 4waS3GORPbRaeRFxe5NCxvQ6EoBVx5VNLpueKTNBqvdUV4k8fp5uUc1dCq0vmuQ03H
	 QuGWQedP5GwbmxOZI29HQuY93RVX6y37ArJWxIhnXpzsKFhWpzXmyLol1k+UYuNb0k
	 Ggp6cSPIzMlGEwTKeAOmsHe+NmdczDjA7zD9K3RavX3gAEnscHDnItccaRUyQHOAJp
	 yCkILzAzWDACg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543cc81ddebso1113705e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 07:33:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzqYYAT835VdzraylkM8oz7JPYs3TQ1BPI6DIGtatjxONLePq/cveRruVmNF2AAK8HOYRd/q05RNNDOezDV1zs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2lSLgSge3gPcP6ONFwjy7p4P1Blf/JZbcd3LQXPCjqWfN4TAp
	kL4m3rYdU9XxaYQ6j5VFJ9TUTv7NkwFwQ+hCiOIdonXjuyV/TkPmnehuk09WscqxyxMHnMupJ8z
	mi4lfGeh3/0YVGlWbLMfbmsC6uLU=
X-Google-Smtp-Source: AGHT+IFn/vzxAa1gLojO/0597IUwEJuHjE+ZMbhdN6Wkn18KpSJ16vMq38P8PaQcagI5saZOuyRj6jrZinDRQOOBjFs=
X-Received: by 2002:a05:6512:1111:b0:545:6cf:6f3e with SMTP id
 2adb3069b0e04-5451dde81aemr1356458e87.49.1739460781858; Thu, 13 Feb 2025
 07:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org>
In-Reply-To: <20250210163732.281786-1-ojeda@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Feb 2025 16:32:50 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHgjwHkLsJkM3H2pjEPXDvD80V+XhH_Gsjv8N4Cf6Bvkw@mail.gmail.com>
X-Gm-Features: AWEUYZmhbBgIMQcrZGkDUPbbIKzS9-BDPJ0yLZaCMkeMRCLb0heF4J8bVRc0_r0
Message-ID: <CAMj1kXHgjwHkLsJkM3H2pjEPXDvD80V+XhH_Gsjv8N4Cf6Bvkw@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ralf Jung <post@ralfj.de>, 
	Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_073304_802336_AB49CD19 
X-CRM114-Status: GOOD (  15.85  )
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

On Mon, 10 Feb 2025 at 17:38, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
> [1] about disabling neon in the aarch64 hardfloat target:
>
>     warning: target feature `neon` cannot be toggled with
>              `-Ctarget-feature`: unsound on hard-float targets
>              because it changes float ABI
>       |
>       = note: this was previously accepted by the compiler but
>               is being phased out; it will become a hard error
>               in a future release!
>       = note: for more information, see issue #116344
>               <https://github.com/rust-lang/rust/issues/116344>
>
> Thus, instead, use the softfloat target instead.
>

We have to carefully make the distinction here between codegen and ABI.

The arm64 C code in the kernel is built with -mgeneral-regs-only
because FP/SIMD registers are not preserved/restored like GPRs, and so
they must be used only in carefully controlled circumstances, i.e., in
assembler code called under kernel_neon_begin()/kernel_neon_end()
[modulo some exceptions related to NEON intrinsics]

This does not impact the ABI, which remains hard-float [this was the
only arm64 calling convention that existed until about a year ago].
Any function that takes or returns floats or doubles (or NEON
intrinsic types) is simply rejected by the compiler.

Changing this to softfloat for Rust modifies this calling convention,
i.e., it will result in floats and doubles being accepted as function
parameters and return values, but there is no code in the kernel that
actually supports/implements that. Also, it should be clarified
whether using a softfloat ABI permits the compiler to use FP/SIMD
registers in codegen. We might still need -Ctarget-feature="-neon"
here afaict.

Ideally, we'd have a target/target-feature combo that makes this more
explicit: no FP/SIMD codegen at all, without affecting the ABI,
therefore making float/double types in function prototypes illegal.
AIUI, this change does something different.

