Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC4DCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N31ilv74oly5MwZpmaMuwEenXmb62MTdPxYq3RqSmIA=; b=wo91prW5jgDSjSBg4m+DtaNDno
	yRLVBpWAxOUq+dDk8PewcHNUlHAnCgkArWpmElIxWYgPXi5GH9exMvW3qmdSGVmRChVcX6+GkAo95
	xRfD0aFXlTDGbvajXvQVFiTjeL0U/Ys1qhlSuHBm5DSAg1sOr0Dlvz6dQKcqVQgogk8GI/pG4fmkf
	yxRhzQ6lEULnB4Z0wJV/NXRKN23F1e8pScOB6Xk/Gk3dbsIT6jqrUEtGv8sYZxCKMD2Z7pzwPxxcw
	x0QEqQTz6OE+gseIIkZK55JOuIp926J1tOXeINOG9yvtyX0qt+bUfQoOgJe8DrLSmI2+6Gaw3fjYy
	tY0VcGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TX8-00000003qkJ-16fS;
	Wed, 08 Oct 2025 12:44:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6TX5-00000003qik-3h6O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 12:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9053548A6A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Oct 2025 12:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BD8C4CEFF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Oct 2025 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759927479;
	bh=N31ilv74oly5MwZpmaMuwEenXmb62MTdPxYq3RqSmIA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aqQieQZR3vwxlStqo6iOnZZELag0xnqfCqNBsbDX3546Y4eKN3ZTJ1grDd7Gp2MKt
	 LuRzdtmFmH5PCT6bSeA3wb3Yhyu/LZ1CUlZmGxT9tlAFPhtehcNOx+LeyBY54+UV8g
	 zRYRGt2eTGJNopitgAcobC87SgArwTUUtVdrfd10dPmT1XMOaUabpFmXyp0dTdahUH
	 M/WStRHaNOHBHXO2R/m1VRe4LBLMElhSSAO+J0Y2NQFuuJaRByy+j7qZdcXy2gMHuc
	 F0/nGHKc+HnovDn3Gi3VervfYb9rN6yd6xvuH7Wfr3k3Qy6qaV0e8YqR86LY6Its9N
	 //Dc23NlkmS/w==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-579363a4602so8247434e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 05:44:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/c1IX/bvLc+HS9wmFGm1ztF85flQjCY8+Jnp3+UqisEcxTfg/nVmR5IqLRKhBXpY7l+w5MO/50baafGqvt3bX@lists.infradead.org
X-Gm-Message-State: AOJu0Yye2DpAKxDyQkCC5LA7JgR/scII8c12SfyYmB9Zo7oQ9UE5p5+N
	6eYZlBj9eotQjsIsyJpA8BetVIw6s1Xb9hB79GN41bMuLDH/DDjByd+71CstiNLy2c9krqxg8TZ
	JZeg/bQ7aa9hBgqH7elFB0KV9uHFuiMo=
X-Google-Smtp-Source: AGHT+IFb/9iVZyCeacRA4eV5KNX9g58E3Jlitn31uEFl4qngdAtE1ZMjpaLTq+Y+xAVeNotQ9Yk5di84F5oEAA9lL/Y=
X-Received: by 2002:a05:6512:138e:b0:579:f4b3:bd2d with SMTP id
 2adb3069b0e04-5906de92179mr905583e87.57.1759927477667; Wed, 08 Oct 2025
 05:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com> <20251001210201.838686-23-ardb+git@google.com>
 <94214ee4-3eec-4151-a5a7-9d5e030fbca3@sirena.org.uk>
In-Reply-To: <94214ee4-3eec-4151-a5a7-9d5e030fbca3@sirena.org.uk>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 8 Oct 2025 05:44:25 -0700
X-Gmail-Original-Message-ID: <CAMj1kXEfw4RnY4wg6JBz01Hoa7r2amdJnj-eD-Kt0D+r6kAEtA@mail.gmail.com>
X-Gm-Features: AS18NWAvgP-PCFNPrGtZ5EtJZD86tidAj6ogMQQ_6DyA-DVZJAXzTHykQTP7Ti8
Message-ID: <CAMj1kXEfw4RnY4wg6JBz01Hoa7r2amdJnj-eD-Kt0D+r6kAEtA@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] arm64: Revert support for generic kernel mode FPU
To: Mark Brown <broonie@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Kees Cook <keescook@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Eric Biggers <ebiggers@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_054439_956080_5A33EDB3 
X-CRM114-Status: GOOD (  18.75  )
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

On Thu, 2 Oct 2025 at 09:23, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Oct 01, 2025 at 11:02:03PM +0200, Ard Biesheuvel wrote:
>
> > However, dropping that flag allows the compiler to use FPU and SIMD
> > registers in other ways too, and for this reason, arm64 only permits
> > doing so in strictly controlled contexts, i.e., isolated compilation
> > units that get called from inside a kernel_neon_begin() and
> > kernel_neon_end() pair.
>
> > The users of the generic kernel mode FPU API lack such strict checks,
> > and this may result in userland FP/SIMD state to get corrupted, given
> > that touching FP/SIMD registers outside of a kernel_neon_begin/end pair
> > does not fault, but silently operates on the userland state without
> > preserving it.
>
> Oh dear, that's nasty - I didn't see the patch when it was going in:
>

Actually, there is a check, it just wasn't wired up correctly by the
amdgpu driver, due to the fact that it wraps kernel_fpu_begin()/end()
calls into its own API, which are therefore always made from a
compilation unit where it is supported.

The trick is to #include <linux/fpu.h> into the definition of their
own wrapper API, so that using /that/ from FP/SIMD code also triggers
a build error.

So I'll drop this patch.

