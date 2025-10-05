Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7024DCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Oct 2025 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4l6vhbogFPEjUgpCA044wWo47xDgLECZtxyI9zsq8E=; b=HfDrnrzJEddLfZ9mXxQ4IWg7Fs
	AqFxs2o8gPk7As4zr42dXbFXYCDbSmOT7wWDTAmp8K4cN56YTE0rorxELcFUGLh+VBGQQm75QrBjo
	6IUPYanumu7BqfkXl5OBBOzSPccWQgy5g3k9fy/+Vsn2vyd1dyZqr0lvC4ssaLyChXudRXfMW2GJq
	JJwAEuYwldqfVxw0DqGLSiG5zfPhTDbFojLQD5xMNAvXaeoMb+YY/2XzfAuIEZ3yo1xOv8VyiKrTX
	FEHpoMq50pZ/Nxqr+bb5EZbzvw3+BWxklo4He81EwdUFDUTH4nAsFrK2ED8n0oIcMh4mX3CSX+u52
	AHflEKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Q8e-0000000FXRM-0L5l;
	Sun, 05 Oct 2025 14:55:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Q8d-0000000FXQf-0A1C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Oct 2025 14:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2408B6029A
	for <linux-arm-kernel@lists.infradead.org>; Sun,  5 Oct 2025 14:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FEBC4CEFE
	for <linux-arm-kernel@lists.infradead.org>; Sun,  5 Oct 2025 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759676101;
	bh=ZYk6FsRH/jslXCq9/JcYnqOpDmX7r2GE6f0FlyCufN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b1BvxJgGYWtcwBRRq327um1fnP0lBeCEz7UGPXdPP2f5skpT0SDfvUuRJohTfYNpx
	 xKCbOhSVwXMx49vtfIH+mazpkNHhxtyl8gvj3egwkjIthhhTUtRxOvbk6c2HC8X+Ae
	 hNi5HJCT/QbpBeem7Nl/3TLnq5CSGQSeUEnf+7lUXQX6dZc6Hr0A4OuqeZchnRBS4C
	 tkXR85iGX10PsDkS60FvCD/wMpv0UQ3LpHnSQGBjoAOPrmd42cttLUr4FfEKSOBWbH
	 qk0ZUgYTitIbOAHSnud2gcpiXlLZPs8/hrkzR/Hf+WLicLN30EljzRHgJf+3KNLETZ
	 ASogja45v2Qow==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-36a6a39752bso41697641fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 07:55:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjUglfTnJh+L2OLIPfAt9UFZzXFb1XHmCrUMm6xOgz8Vl+lMabISSnhzDGj9tuDhOEnCimNwh2bpRxTT81JQbJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6XGlLUw37kXMM7AU23Dza/hPrH+v4JizRDc5RZesQd9xJpXTq
	AlKhcrY9yT0L2cIJgweyaOdoy+usbRw7MFp0EcJl8iis5Pg8JtHPbkseR54ND6SA1MYrY9IO4vU
	ukww8hEWHqS7ce8HFzi/4L/hsVF4oeqE=
X-Google-Smtp-Source: AGHT+IEWPLhimWsF9enpUuiQN4vp9kszXmdsUSVze7V2BuBpO3kLXs30fu/IjwtJEP8PxidGp4iNP3GkdNE0i5UM0aQ=
X-Received: by 2002:a05:651c:19a6:b0:372:921b:4b83 with SMTP id
 38308e7fff4ca-374c37eb675mr27154721fa.20.1759676100148; Sun, 05 Oct 2025
 07:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20251001210201.838686-22-ardb+git@google.com> <20251001210201.838686-42-ardb+git@google.com>
 <20251003201818.GA24598@quark>
In-Reply-To: <20251003201818.GA24598@quark>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 5 Oct 2025 16:54:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEMZO8RLiqxHFkVqy-xe_e7D3JGTTdObRP=93B98PFR9g@mail.gmail.com>
X-Gm-Features: AS18NWBDyP2sRFU_7qLcyZdPGkaKIOB0fx5JmAkiVfN9-rbRf3z-I5vTQBCXLIE
Message-ID: <CAMj1kXEMZO8RLiqxHFkVqy-xe_e7D3JGTTdObRP=93B98PFR9g@mail.gmail.com>
Subject: Re: [PATCH v2 20/20] arm64/fpsimd: Allocate kernel mode FP/SIMD
 buffers on the stack
To: Eric Biggers <ebiggers@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	herbert@gondor.apana.org.au, linux@armlinux.org.uk, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Kees Cook <keescook@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 3 Oct 2025 at 22:18, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Oct 01, 2025 at 11:02:22PM +0200, Ard Biesheuvel wrote:
> > diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> > index 4f8d677b73ee..93bca4d454d7 100644
> > --- a/arch/arm64/include/asm/processor.h
> > +++ b/arch/arm64/include/asm/processor.h
> > @@ -172,7 +172,7 @@ struct thread_struct {
> >       unsigned long           fault_code;     /* ESR_EL1 value */
> >       struct debug_info       debug;          /* debugging */
> >
> > -     struct user_fpsimd_state        kernel_fpsimd_state;
> > +     struct user_fpsimd_state        *kernel_fpsimd_state;
>
> Is TIF_KERNEL_FPSTATE redundant with kernel_fpsimd_state != NULL?

Not entirely.

The generic kernel_fpu_begin/end API that the amdgpu driver uses
cannot straight-forwardly use a stack buffer, given how the API is
implemented. Since this code already disables preemption when using
the FPU, and should not assume being able to use kernel mode FP in
softirq context, I think we'll end up doing something like the
following for arm64

void kernel_fpu_begin(void)
{
  preempt_disable();
  local_bh_disable();
  kernel_neon_begin(NULL);
}

etc, as it never actually needs this buffer to begin with.

Technically, setting TIF_KERNEL_FPSTATE is not necessary when no
scheduling or softirq interruptions may be expected, but I still think
it is better to keep these separate.

> > +void kernel_neon_begin(struct user_fpsimd_state *s)
> >  {
> >       if (WARN_ON(!system_supports_fpsimd()))
> >               return;
> > @@ -1866,8 +1869,16 @@ void kernel_neon_begin(void)
> >                * mode in task context. So in this case, setting the flag here
> >                * is always appropriate.
> >                */
> > -             if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq())
> > +             if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq()) {
> > +                     /*
> > +                      * Record the caller provided buffer as the kernel mode
> > +                      * FP/SIMD buffer for this task, so that the state can
> > +                      * be preserved and restored on a context switch.
> > +                      */
> > +                     if (cmpxchg(&current->thread.kernel_fpsimd_state, NULL, s))
> > +                             BUG();
>
> Does this really need to be a cmpxchg, vs. a regular load and store?
> It's just operating on current.
>

It does not need to be atomic, no. I moved this around a bit while I
was working on it, but in its current form, we can just BUG/WARN on
the old value being wrong, and set the new one using an ordinary store
(in both cases).

