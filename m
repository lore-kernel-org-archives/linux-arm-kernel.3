Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3478FA3750
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AGEQXVff4Cjra/LEG8aFJKzdBMi+jbn5H5NG2dDiwk=; b=ogLiJ2QhIU5tK1RBHQ2WyzR+dT
	HTzZZOQpxHfldt+7VyoDngfJ8hyfs2IB32+arF7RtUbiLbQenyoDIjSRHAF893F8GCxBFMp6SE7d6
	5SqyrNiN4xoQElvy1/d8aPfRhiPJpSaB7gHOdHv0nbmp+d5/QWVOqjjFLNQnmGU6MgAcxjksljT6H
	OqzZDNG7o6Obs5vGHq3E9V76jrBXybokDTNhodnRyZV2GSRKOtsnzpe//kQwRw3fosoQ9CnPObtkd
	8OUugvkIzOnNt9ewA6oM3f1yZlvxBT0P8b6zG6nTYDqVaPiYrjMIgv9a2pV1P+i3RSqJ0LTpDPjPD
	c63asqHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0tu-00000009M60-3Puf;
	Sat, 03 Jan 2026 12:38:34 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0ts-00000009M5a-3kJt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 12:38:34 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-37bbb36c990so5650111fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 04:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767443911; x=1768048711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AGEQXVff4Cjra/LEG8aFJKzdBMi+jbn5H5NG2dDiwk=;
        b=laRzB5ViPpPMcBJl266ATxRxmhlauYDYvq+UImEU3zMcTzkOekRI1FUGqOymXfhNtN
         PPp0AOcQ2qm7zHFri9m/WBM5/2//9e4FcydMJUqV9+tavMezlGp7IRKJmT8r5C76H2dy
         7ChxhSEJKJ1/qezZRbqfsR44qUQS2xHnft/89IovN6CLoLxdZubLfybytYxZDYwQBlLt
         MTL90cL+AqiIXbsygCaAy1LNCFouz83JQs8iaO6OKIeg5PDLVHPIWeM+Ipr725+IzElh
         cwiW9mhhWZs/VYv4lgdkcZWbYRe3P+XvXDbzFKLTYuVNklOKJLGEPpVrN8MAn/t5ZkLO
         m6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767443911; x=1768048711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AGEQXVff4Cjra/LEG8aFJKzdBMi+jbn5H5NG2dDiwk=;
        b=g4JbPQwNOgeOij8G5yIwbfX/SOIUk99FvDM8xYvDeFBKwnXuO+x/DmBp5GDyDBBVfr
         N2woTEyeZwLCgJooXJKgppikaxRfee3akSu38puFk+l+ZHpKaJUYPUGrfD8uFObbJ+DH
         EOL/adhIM9scPXYBoovtmGMTNLJOe8wKtDB5iZAn0ORf0HopH7QZ45fvza56IOfoCT+0
         /tZ0GsZkL1NN7eOn7xS76f+tniH/b6CNX3aO463rak+wOu97ccZiAeuA+sjYcSM670vP
         p5sHyLT1dg8D1WTYQy6ocwKukVSwA9lczc94UGAgnkLVIWL8sxpbwCXbJjRw2KojS10N
         el4A==
X-Forwarded-Encrypted: i=1; AJvYcCXJIHjD4ORZJNBWsALuFiKh4sXkIql1d8nJACV7KkmSa6uhoDUizRRYjEdogNodxWmR2tGjLgkkOXbTFfCV+wbU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7+LhkBnyr7sPIkxVBCXGSLXyd6RjwoM8dVD48NrbP/EeZg9x5
	sYkV/XMKVitkEwvdHAB0CrO9x02KaDNcJWFuYhD8hjVsa4XVKjwPRaUy
X-Gm-Gg: AY/fxX6kZMHt88hSOjmZJ1jH+4cvehgUkH12z9NnpJCckRwguL2lIEZoUiqmqLgf4P3
	SUYVN1zRXFrh/jdTKTU3e67ZjrJKfKnf+54GGAvDfUK1+pak6Qc8Kvx0TJGZ9Fkz1/NkC8iCSxq
	NJzeZ+YH9O9ulLXRA0XAhqy9DThecFQvmlZ7Erqm/PPv3zatvp78ckbxU55vsHqckV5PX3d8TNt
	nQfDkf4XwfFwQGJEs3RE8QKUpMgT6eS2loxX7y9ckMATRMb96P/coQ0ZbN02QdkGGips4ErsbHd
	Sl9KZBvzkx5kXVusQyjndji86K3+/0h7BLE5Lcj1IoWkNWCM16AbqFnXrENJGRlYZLUtT+XPvdX
	3xVylm8xfpi4TIMkmg2v94ojDowt9Z9QkRdetc8hB1QESKuzs0SwSptjE3bieXSBOg07gz7RJ0Q
	0fNrM6Gj+f5hhoYdoieizMkkoW4jUgkzS9EMo5lEkoEQIyH4Exjs1h
X-Google-Smtp-Source: AGHT+IGuPwj5c90N/yOSzvW/fHyvSi9BbZ6Md54mttsoAORSkjxjxsJYQaWeJvjkrO56uLXSAEKKNQ==
X-Received: by 2002:a05:600c:198a:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d6c803ca7mr16959765e9.14.1767437190097;
        Sat, 03 Jan 2026 02:46:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c0c148bsm13448405e9.18.2026.01.03.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 02:46:29 -0800 (PST)
Date: Sat, 3 Jan 2026 10:46:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Message-ID: <20260103104627.2f385d20@pumpkin>
In-Reply-To: <719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-3-ryan.roberts@arm.com>
	<CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
	<719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_043832_992434_E3F329F0 
X-CRM114-Status: GOOD (  30.64  )
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

On Fri, 2 Jan 2026 14:09:26 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 02/01/2026 13:39, Jason A. Donenfeld wrote:
> > Hi Ryan,
> >=20
> > On Fri, Jan 2, 2026 at 2:12=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.c=
om> wrote: =20
> >> context. Given the function is just a handful of operations and doesn'=
t =20
> >=20
> > How many? What's this looking like in terms of assembly?  =20
>=20
> 25 instructions on arm64:
>=20
> 0000000000000000 <prandom_u32_state>:
>    0:	29401403 	ldp	w3, w5, [x0]
>    4:	aa0003e1 	mov	x1, x0
>    8:	29410002 	ldp	w2, w0, [x0, #8]
>    c:	531e74a4 	lsl	w4, w5, #2
>   10:	530e3468 	lsl	w8, w3, #18
>   14:	4a0400a5 	eor	w5, w5, w4
>   18:	4a031863 	eor	w3, w3, w3, lsl #6
>   1c:	53196047 	lsl	w7, w2, #7
>   20:	53134806 	lsl	w6, w0, #13
>   24:	4a023442 	eor	w2, w2, w2, lsl #13
>   28:	4a000c00 	eor	w0, w0, w0, lsl #3
>   2c:	121b6884 	and	w4, w4, #0xffffffe0
>   30:	120d3108 	and	w8, w8, #0xfff80000
>   34:	121550e7 	and	w7, w7, #0xfffff800
>   38:	120c2cc6 	and	w6, w6, #0xfff00000
>   3c:	2a456c85 	orr	w5, w4, w5, lsr #27
>   40:	2a433504 	orr	w4, w8, w3, lsr #13
>   44:	2a4254e3 	orr	w3, w7, w2, lsr #21
>   48:	2a4030c2 	orr	w2, w6, w0, lsr #12
>   4c:	4a020066 	eor	w6, w3, w2
>   50:	4a050080 	eor	w0, w4, w5
>   54:	4a0000c0 	eor	w0, w6, w0
>   58:	29001424 	stp	w4, w5, [x1]
>   5c:	29010823 	stp	w3, w2, [x1, #8]
>   60:	d65f03c0 	ret

That is gcc, clang seems to generate something horrid (from godbolt).
I'm not sure what it has tried to do (and maybe it can't in kernel)
but it clearly doesn't help!
.LCPI0_0:
        .word   18
        .word   2
        .word   7
        .word   13
.LCPI0_1:
        .word   6
        .word   2
        .word   13
        .word   3
.LCPI0_2:
        .word   4294443008
        .word   4294967264
        .word   4294965248
        .word   4293918720
.LCPI0_3:
        .word   4294967283
        .word   4294967269
        .word   4294967275
        .word   4294967284
prandom_u32_state:
        adrp    x9, .LCPI0_1
        ldr     q0, [x0]
        adrp    x10, .LCPI0_3
        ldr     q1, [x9, :lo12:.LCPI0_1]
        adrp    x9, .LCPI0_0
        ldr     q3, [x10, :lo12:.LCPI0_3]
        ldr     q2, [x9, :lo12:.LCPI0_0]
        adrp    x9, .LCPI0_2
        mov     x8, x0
        ushl    v1.4s, v0.4s, v1.4s
        ushl    v2.4s, v0.4s, v2.4s
        eor     v0.16b, v1.16b, v0.16b
        ldr     q1, [x9, :lo12:.LCPI0_2]
        and     v1.16b, v2.16b, v1.16b
        ushl    v0.4s, v0.4s, v3.4s
        orr     v0.16b, v0.16b, v1.16b
        ext     v1.16b, v0.16b, v0.16b, #8
        str     q0, [x8]
        eor     v1.8b, v0.8b, v1.8b
        fmov    x9, d1
        lsr     x10, x9, #32
        eor     w0, w9, w10
        ret

The x86 versions are a little longer (arm's barrel shifter helps a lot).

>=20
> > It'd also be
> > nice to have some brief analysis of other call sites to have
> > confirmation this isn't blowing up other users. =20
>=20
> I compiled defconfig before and after this patch on arm64 and compared th=
e text
> sizes:
>=20
> $ ./scripts/bloat-o-meter -t vmlinux.before vmlinux.after
> add/remove: 3/4 grow/shrink: 4/1 up/down: 836/-128 (708)
> Function                                     old     new   delta
> prandom_seed_full_state                      364     932    +568
> pick_next_task_fair                         1940    2036     +96
> bpf_user_rnd_u32                             104     196     +92
> prandom_bytes_state                          204     260     +56
> e843419@0f2b_00012d69_e34                      -       8      +8
> e843419@0db7_00010ec3_23ec                     -       8      +8
> e843419@02cb_00003767_25c                      -       8      +8
> bpf_prog_select_runtime                      448     444      -4
> e843419@0aa3_0000cfd1_1580                     8       -      -8
> e843419@0aa2_0000cfba_147c                     8       -      -8
> e843419@075f_00008d8c_184                      8       -      -8
> prandom_u32_state                            100       -    -100
> Total: Before=3D19078072, After=3D19078780, chg +0.00%
>=20
> So 708 bytes more after inlining.

Doesn't look like there are many calls.

> The main cost is prandom_seed_full_state(),
> which calls prandom_u32_state() 10 times (via prandom_warmup()). I expect=
 we
> could turn that into a loop to reduce ~450 bytes overall.

That would always have helped the code size.
And I suspect the other costs of that code make unrolling the loop pointles=
s.

>=20
> I'm not really sure if 708 is good or bad...
>=20
> >  =20
> >> +static __always_inline u32 prandom_u32_state(struct rnd_state *state)=
 =20
> >=20
> > Why not just normal `inline`? Is gcc disagreeing with the inlinability
> > of this function? =20
>=20
> Given this needs to be called from a noinstr function, I didn't want to g=
ive the
> compiler the opportunity to decide not to inline it, since in that case, =
some
> instrumentation might end up being applied to the function body which wou=
ld blow
> up when called in the noinstr context.
>=20
> I think the other 2 options are to keep prandom_u32_state() in the c file=
 but
> mark it noinstr or rearrange all the users so that thay don't call it unt=
il
> instrumentation is allowable. The latter is something I was trying to avo=
id.
>=20
> There is some previous discussion of this at [1].
>=20
> [1] https://lore.kernel.org/all/aS65LFUfdgRPKv1l@J2N7QTR9R3/
>=20
> Perhaps keeping prandom_u32_state() in the c file and making it noinstr i=
s the
> best compromise?

Or define prandom_u32_state_inline() as always_inline and have the
real function:
u32 prandom_u32_state(struct rnd_state *state)
{
	return prandom_u32_state_inline(state);
}

So that the callers can pick the inline version if it really matters.

	David

>=20
> Thanks,
> Ryan
>=20
> >=20
> > Jason =20
>=20
>=20


