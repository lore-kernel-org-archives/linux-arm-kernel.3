Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD46CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=; b=IWFdQXRGFnHiLmeTY8JrPJQOVD
	tuFLDUAwXjYsS1mU8CH1A83rR54ElFpAXbRge9c3X9HNThyIWbhjDrUeX4R6xOzdZCiqSuft6+Bep
	RfsoRWUgTxk6Jx4OcGu8NwzWzG93/dvX5KtHHUlageao4xKwtDryDn/Q/XbezdLAcETgI59QGRvIa
	jJDx6c0DpZ2F4K5OLBQrVhfocrTX2/Jin1vTcEDJ7NLzmVdE06+isyUuNBJ6o70poSW8AhB8DJFCB
	kW62IcFXmCa2HC34YT5dy+CWPkW6CfoRC8InqvHfX/09+z3fTcEMoXJX83O0eex68/N6whS66fl67
	GLOkXPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcVA-00000004H40-21SN;
	Tue, 29 Sep 2026 18:24:28 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcV8-00000004H35-0iPv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 18:24:27 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-4887f6cf16bso2850383f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 11:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706263; cv=none;
        d=google.com; s=arc-20260327;
        b=RctFUfNtxBp7EKtsEHJPBl+gCTTgVNXmjf047M5Yx/FCJDdZII9iVzI5cQTBmfAasU
         XTjIG1YgF0xTXZ7f360ZcjOTctysEZZsHoGHtVTF4ZIbp2H2ysfwzVTGutblXXZaurQR
         1iRdqu+fO0sRq1kaIIKiZ6+dsAJhhUlDcz0hsbR0crP77A79cvMlSwi+QgvBxyekd52+
         YXELlH1sYK+h64BJvza99UdtJn5DdkusxpnA67WD2p2sy7X1M+9rb3vsfaH+oZKdQSxc
         yjNfjf4kQ7rAhWKP00AL2l+6SRob5GeDOE0P1KX+5fzEhqBOM5PffV2XVthQPzBVeQh+
         tnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        fh=iNo/Xs6HJOrdNFaTcI1nBKGLnj/AESPH5A65FmZPCr4=;
        b=dlZWCs74yZzouZhnuWYUXekg7orhG9Ijv+zvKJRMVY1ibtpM+3jtzJp+N8GpkHi8Wi
         BQK8MbruObHT77ANlLvB2dzJY33JgaVmi5YG5ZAjr4Sbw/9PyL36obipMD4AQBA2Yjl1
         cGb+/3BBcMyDjQzi06sWLtSE7XumIWmraPUg9pB2lEDsrLPHUgNKz8x7JzNHulm3SKb2
         me/uDzTrQQMLiTxwhIJAcoZw0pucTWa5MT6XVbs0tIzuBXf46sngmfiteVo+VF1Uwo3c
         xFkvjQ0FNmgSG6j+mHYTb3wGQUwspfTPC6wI7xfSLUOc4snGg8Xa/SD9576aEIdbhsej
         wK/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790706263; x=1791311063; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=Ma/Y5eT5sZDlHzVr2E1w7xUlwJ3Te0/PpzxqqxLY7DVJzxz1YZlsHPeWbe6950NHwd
         Hc9S4fkUogyH9XZMZpahz7Yt2vKWiws/bF+ejdaZNYn/BzT4wW9yllqXHGfPYZWX4yoZ
         Rhg7zkir7a/U3aYnSNFJ7ZI+WC6NcVVXd5Y2d1fknS77yV+BABY4lqPJxU7MpSz7oDo5
         1hEmYftLPfM6kPNGIZUWgsy4r9Zj7pvxelpUP8q0yMKZPYPWYmBc2iN2VY6w7oXMqHHC
         5hWN3GycQiErRd31HiO1VJ6Bt8Kaw6FlSqsd93HJSswkE8PzEuVjpC0gFN+PSVYfCq7/
         OaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706263; x=1791311063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5iqo8UY2L5mZlXboZ0sxIpBdYrZWI1CLq6z3i5raKI=;
        b=Lznpi4SaUr0nswWaCfxZJxxr/JvWBg+nSRlx3HQ9gctb45UOGAMuQyvdrlLXZRx38o
         7NPajP+ILYzKMTEIVqwwGhcjhkdTmSaMO7ZpQn+O7nI5BO8iaybdJ2x+DT3PZNmFF5Od
         x908/pr9TPkUDFHXvNkT8c0u8SAPWQtxbMGGF6aC+Gr4slx4NP/lUj/chc+je2/VhaGB
         WETbRoast7XE95sUmXVruYhQmB+ObITt6uN+MiLovIkUoLBLaPgWYHpK3+PU7r5YOUMn
         iHpCNTxCJITYd2g+ZMOmzPz4uJFmOiWW21VrKhEeGqUzacaVswkTdJhW+o8qT+e5bf95
         MvGg==
X-Forwarded-Encrypted: i=1; AKwUvBzind/tTvXmwYHWRr1QjK3V5oib7kIyQ234OIXAKlcpzqo4BciPCQXrsdp7ew8IRZQgkT5u9lEiXJZ2LjykcoYt@lists.infradead.org
X-Gm-Message-State: AFq9FYJvMz8diz0EPHd6PfGKKDMKI01LGlvjXm2kI902GNAIx7QlqiAt
	X/dtFzG3oNYONcWXOE3eEwHdVAhNJcbszG9T0zH53PYEr/d73cAYuzfM64gtnWCGnLUTzLvfFWM
	u5q3GxbmHT01X7dZTEyjJcuuogtDzdFelSqNVTQyA
X-Gm-Gg: AYBFou1i57LJVkRI0HzH1SRGOg9DTsutCxYS0J7EMjWTTc5Bndjp1IHoNchoZ9sl9wd
	Mtrs1817Cig/EWbLgS6idPjLaUCERdBrNHtsylNWmihN5NFY0fuYzGF2Wkslznwp98xAqF9YOSl
	2pMWQ+jsOh1plkyxSdu/xQmW4xm/51I/6X7D20X850zTHY6hBmvchqHEBkfYzu+qsHWgDctxlGc
	fcc2I3ml+rEYODvX/6K8g+AIAUVkGW1BnNUizxFICl8sDfixNZsq9Er2IGFJiJw0E2M/rGBI3H3
	1iOdfrwFb+UqJLabc2+qluaVBnalKKEuy1+G4HlVQapZLVwBasxwl30Ehbs8R0n42LN37Y7f47W
	r4eFlVmwO8u1mqoOBEuNspEEgVlYIgnYxq158R0/k/Buc1Hj/FA+xaFEdGOkjozyQc+k=
X-Received: by 2002:a05:6000:2381:b0:48a:fba3:d5b6 with SMTP id
 ffacd0b85a97d-48afe7ab8dbmr265943f8f.56.1790706262469; Tue, 29 Sep 2026
 11:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
 <CAKwvOdnxKVpn=nAFaqP+9PTx4PqgHsUVWv6e60Pcr29W_eZrpQ@mail.gmail.com>
 <CAKwvOdmNZL3eFvV3v77GXDzL+XLgz+BT9TA=my0yTnbsHqVeSg@mail.gmail.com>
 <areYMjNcaqe86ds4@zx2c4.com> <9d1c338b-368f-4ea2-a12e-c28d49adff5e@kernel.org>
 <are6s5e6On3hpD3M@zx2c4.com>
In-Reply-To: <are6s5e6On3hpD3M@zx2c4.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Sep 2026 11:24:11 -0700
X-Gm-Features: AclHuK_OlHRHmRVZkjU6Ad7ygjuA5O41_jDQwI5Gzaif3nG5KjlJX6HrrO4nUUw
Message-ID: <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Nathan Chancellor <nathan@kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_112426_237876_DB3770AB 
X-CRM114-Status: GOOD (  19.82  )
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

On Sat, Sep 26, 2026 at 5:29=E2=80=AFAM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> On Sat, Sep 26, 2026 at 12:55:34PM +0200, Christophe Leroy (CS GROUP) wro=
te:
> > Hi Jason,
> >
> > Le 26/09/2026 =C3=A0 12:02, Jason A. Donenfeld a =C3=A9crit :
> > > Apparently not on RISCV, which is what prompted this patch in the fir=
st
> > > place. So I suspect Nathan's v2 here is the way to go.
> >
> >
> > Don't you have -fno-builtin on RISCV like we have on powerpc ?
>
> I think Nick mentioned this led to other problems and didn't exactly
> solve the problem.

Sorry, been very busy.  Getting blasted from a fire hose of AI
generated patches to review...

arch/arm64/kvm/hyp/nvhe/Makefile has this pattern for exactly the same
problem I suspect.  Maybe that's the right tool in the toolbox?

```
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makef=
ile
index 8dbf2532a573..27fa72d8fb86 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -27,7 +27,7 @@ asflags-y +=3D -DVDSO_CFI=3D1
 endif

 # Files to link into the vdso
-obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o
+obj-vdso =3D $(patsubst %, %.o, $(vdso-syms)) note.o ../../lib/memset.o

 ifdef CONFIG_VDSO_GETRANDOM
 obj-vdso +=3D vgetrandom-chacha.o
```
Fixes `make -skj"$(nproc)" ARCH=3Driscv LLVM=3D1 mrproper allmodconfig
vdso_prepare` for me, as per
https://github.com/ClangBuiltLinux/linux/issues/2183
(Nathan, don't forget to link to that in the commit message)
I'm surprised I didn't need -fno-semantic-interposition (or one of the
related flags... -fvisibility=3Dhidden)

If we want to get better, (if performance matters here and we want to
trade source+build system complexity for absolute code perf) I would
start with that, then worry about clawing back performance via things
like:
- __builtin_memset_inline
- -finline-stringops=3Dmemset
- -ffunction-sections+-Wl,--gc-sections to dead code eliminate the out
of line copy of memset, though IIRC there's potential for wasted space
due to alignment requirements (maybe the out of line copy of memset is
smaller...idk)
--=20
Thanks,
~Nick Desaulniers

