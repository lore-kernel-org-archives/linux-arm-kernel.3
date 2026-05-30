Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA85ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=; b=ruR02HsaAn1kvBHvgaON51ic/z
	EHsnQBmDSkKuVA8mi6oyzaEfEvFiy6MkQSsrl80uI17BhSQzDAzN6uUg4aiwpSWaLYUIP0QbH7sHt
	brjJG7s6FWQpQynI6dR0rIrhguCCEeSESpKobtLkjEebhzBYm/XqQJwJcaNqeNEzz1Rq88j5ryvMl
	nI93bEHDMa/qE4qKAGM3JAEUc4HynxRdGs0uFwoaM/yCDvLwNIrb6gvElJVL6xfGCasvjE7zVFDON
	ZY/Pv9jvfv7/y9LJdAgehGZs+kmudTp6PMFp/i/j1nmMMU2OPSQbKx/ASMkFWW81mitsxzSd5hBy8
	3CYDLGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTEJh-00000008WUq-2fKC;
	Sat, 30 May 2026 07:41:09 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTEJe-00000008WUT-37cd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 07:41:08 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1363f6f7535so329632c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 00:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780126866; cv=none;
        d=google.com; s=arc-20240605;
        b=F0ejRpvPkQK1h43ypccPmd7hL67AE+tFdLFzBg6ZVUIC9tkopCNwUYT6JsMQtGTeOa
         P2ZLpUgZmRmZDd2eVcm/0xJUbbjK8zXf9ikXr8uqGpPSSLkGZnNFfwaXhIJzPcFy0vYq
         dAo9zvw3JmUa010EiNs/JEz35pnGcQylPgJ3jRqLs8mlfzLRagX5VeUJHxchkXgqI2J5
         HUGj00oCVn4xrsZtrcCP1Pr8eQC+D1TkBHgYuMkpXUCB2uKoIpRe4W7UO5yiB2GWTJmO
         xjZ77zgNfHyAfFXBBFyz449owViPGaN/EW960APgzJ/wzm9segNWwojO3vldBW4jaCjH
         DyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        fh=lraVNVeUcV0cbpDs/wa3nZpi41o02UC75k0558l6ZfY=;
        b=JmI9dVCR9ocDrOnvO1lGi/R3FUWpUHU644IQPieR4j+DG63z52SsIGwrUNq6ULHIRs
         h5moDL29xfDjbvmYSaeIiRHEQ5gYbaEvUYOqcbC37el8G98rRK1IdjqbmV/4zo43gPJu
         VltP53f7pPc8ywJxXwi2xBtYBz7RnFIfSbug4hV0shOi+Sy2mONlpQnEaC4G0obErGTH
         OEhMhq+QTVcufxVEHpD/rVy4EgGdxNjyOZkNcpBKBsGYJfhoeBJRWvQUg+38uHh3Jfok
         YaEJirJMT1AV1vYkwutUfWpgYyZViUqdjl0sVDWrqoMgBhmDkwYomlZYfeC06CCWTAYT
         eEvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780126866; x=1780731666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        b=nimx3XI79JWrJoM6vBUQhU6G+f1FacGQ1WrmWxUaNL1JQKEcRi1spfg65Dc7D4hQGC
         YGoyjlQurCxFnepMma1R/iiXQicHcHR0ljizqG9oXhoCxvNWAwXZLjALs57obsHDciX+
         E7NXglhWefezYmWSW+lIe9zaorCNYdC+NtffHEbpZ/PCV5lEqR1QRtH2oq0NC1YS9dUS
         2rK7udQklpEU0JfnaAqH7SehAojaeCFMFL573tRG5k6TORIB5FJg4Mzp57MHu5CzF/F1
         D6rrTU7uTqK0QU1Mn2IbbYZ5COcWr2O60tb823t7DcP+XLif6jJf2SLVP4E7QBDLCdT4
         hi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780126866; x=1780731666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qpr9VE3elbZ+vLOG6raofIn6zipcaovFd851fDkQwe4=;
        b=Z0kcEduRSWHhofFm8l4/cd7yKL8i16y9BhUdIg401E7vWJkGIHuwg4sUJeGKTaa/hM
         Yxn4zhZ0ruI8Hw35vB/OAXDKGltBGXKP9vNIVX0K0hSunLScryk2JTxc5IBI++TOGkKd
         rJLcAsHiY5DQ4xlDw39022guIb71NncCT0hvHmN9TqW7gn9EoHjaZgTD+4nEvktknr2u
         hoHkapG9R8hmpe9p1/Hg2R2697pYZ+y9Xs23QMmV+5TosOKojnD8hitEtAmcuUJuL01Z
         7H+RASmvojroNtzF4DI9VYfn1FZbjYU6sggBoZTr6+yfNRpo/XQ4y03s7uu2X403Q3mm
         BMhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8g8J4sq+IIsh296oltkYkGslO6wDdggtZYsNoP9NzuWHpFprwhobEmrY5tBKxRaH3oH7SwJGq+QOM6mdiPE26p@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz0v2nOmh1BdnWVD2HhMvSi2CnQ9+qYE5gjwkcGf2n6ZQha6px
	k4bTacCp3UKQCrEBCUN2WdPh93c6AP18kZNO5236fu/CVfY2ZPitJp5jNWDwpHO2QKgs4dO1+EF
	AEv6mngeZHfb6Jl5g5wvln6xRWPkV/4Y=
X-Gm-Gg: Acq92OH0qQT8so9YXvVPzIyZLjjuqBtTvu91kPaFPYf3dnhy1J3j6ZT9ohVOsVWyWOC
	39jxDwOle+HUMetYiBCceMe1KrU1EOvJpKjPCsEb3yiyRm5vDdp7dDibw6VcRQO6AAY8V1kVJu3
	42vmywcaJt0Y+4tosr4QM21ZcFaEx4QsStEatVd3H46N0hpxmukxipmuAs/ezOV4EEmBqVo5W02
	EDFRT7JUHeH1t9PFDl3g8DM3/i8dKH/EzF4FIuRkykGRszbMvTtG93MopD7wyX+FASfHdkXfU+r
	5AUGML9uyJ+XVMJZ7iMUi+CEKgDS2hmxoKBeG1lnZsVG7zgI17lMatjhppsWlyQcsr1qUOdoR5e
	WZLt5hki9FktnG11peUnhNzXL+5UgikSznw==
X-Received: by 2002:a05:693c:2c86:b0:304:3c33:7afd with SMTP id
 5a478bee46e88-304fa4a75dbmr712153eec.1.1780126865429; Sat, 30 May 2026
 00:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 30 May 2026 09:40:51 +0200
X-Gm-Features: AVHnY4LYzc72_leHtuASvRnfI_XBQ5P_tmJIekDaxm-OGvsoitOo6icCZq7qopI
Message-ID: <CANiq72ny89rMb9y1ysfbBjm=LVhO=51sRd6Ocpy-UOwFj=61vQ@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_004107_045315_A15ED216 
X-CRM114-Status: GOOD (  17.72  )
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

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Due to a rustc bug [1] the -Cforce-unwind-tables=3Dy flag only emits the
> uwtable annotation for functions, but not for the module. This means
> that compiler-generated functions such as 'asan.module_ctor' do not
> receive the uwtable annotation.
>
> When CONFIG_UNWIND_PATCH_PAC_INTO_SCS is enabled, this leads to boot
> failures because the dwarf information emitted for the kasan
> constructors is wrong, which causes the SCS boot patching code to
> patch the constructor in an illegal manner. Specifically, the paciasp
> instruction is patched, but the autiasp instruction is not. This
> mismatch leads to a crash when the constructor is called during boot.
>
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         BUG: KASAN: global-out-of-bounds in do_basic_setup+0x4c/0x90
>         Read of size 8 at addr ffffffe3cc7eb488 by task swapper/0/1
>
> Specifically the faulting instruction is the (*fn)() to invoke the
> constructor in do_ctors() of the init/main.c file.
>
> Once the fix lands in rustc, this flag can be made conditional on the
> rustc version. Note that passing the flag on a rustc with the fix
> present has no effect.
>
> Fixes: d077242d68a3 ("rust: support for shadow call stack sanitizer")
> Cc: stable@kernel.org
> Link: https://github.com/rust-lang/rust/pull/156980 [1]
> Reported-by: Bo Ye <bo.ye@mediatek.com>
> Debugged-by: Isaac Manjarres <isaacmanjarres@google.com>
> Debugged-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Isaac Manjarres <isaacmanjarres@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks everyone!

    [ The fix [1] has landed for Rust 1.98.0 (expected release on
      2026-08-20).

      Thus add a version check as discussed.

        - Miguel ]

    [ Adjusted link and comment. - Miguel ]

Cheers,
Miguel

