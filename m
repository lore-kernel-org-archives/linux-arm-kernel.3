Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215C3D30CFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFL3Ab0hoeKdAkXw+EXhrpvZ7ps8U7iR9VnnL8zsKgI=; b=F8imto2Bps2Bpq0zp5lMhN8woZ
	fMQuIOvCaUNnxQxP5gYJot3B2763FNe1HURqDmpqlNxOiylyA8CUQi9S6inRyIWmLb61/oX+i8Xlx
	O3nfyRefE1HhMNV1n/c34lHC2JL2e/1axVrLeaOYWMjl0F+BwxfJeq9mwkTTLJ71VfcUHPN0G8qxS
	dOupsnKX5dsTH79lh6HCdxf66sDco+t8UjN74jhB8e3w7oDKLqTiya5pBHkV3S7ETz/EvBG9ivNnh
	ZA11Qm7KCWBrZQB+4AtgicGD3+yv6Iu1h6AEpYkSTFrjmGX1CxosaSm9RV/bc8CpFWR1bpzCDiTC6
	U5MGqe/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Mb-00000009r6O-0vp2;
	Wed, 14 Jan 2026 16:04:53 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3MZ-00000009r5q-2NSl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:04:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42fb2314f52so6864f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768406690; x=1769011490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFL3Ab0hoeKdAkXw+EXhrpvZ7ps8U7iR9VnnL8zsKgI=;
        b=e0JMFOjbh5d3c1riiAQ4Hs03kg7sh6oOJgAtGu+FA6F/qRLgCJxALFKnpFPz1bndK2
         /QfHqTvV4OPWXxIkztprBEWKoc2CtXTqq0V7m7jL5HCXam0aTCO9mgCTFeKJQ+Gp+YnZ
         f4KnBmZcbHqKpFI5Rx0rmO8oEd7IyDkmDIaMxZRce8H1z2EYxbAYk9g42HGggYc00JC4
         YUuZlAtmVk8mWzAi580YgNVA7fpArShksAWRikKcGpX6SLsFyfDuoXB8abORfnz6lAm9
         9BfTM+t9iInUuFRtErtS98YdP7aokc3Pu6hpaox96Ut81FlVt6O7TY0rXJBXdLLoo1jD
         ay6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406690; x=1769011490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DFL3Ab0hoeKdAkXw+EXhrpvZ7ps8U7iR9VnnL8zsKgI=;
        b=SUTvs0luRxORBvRwEl/anQoXhhFNtHcaBmtMTGwy8VzHldow+VJ5/cznJgEABu4tiA
         cEAadltA9Px+k7qvg+PqIPqvRXRs9zb11MkugqmMu3bkWCyQcnsPirdmYimJKif7Hliu
         0YaXy6JYFHVYS1w3AerXd6s51ANS91qKz6u4ZPpJ/XdS7ghXmUVRzGqk/EtmeAOODzH9
         603+RYYRGTYy8wBJH7J/YJR0LZb1/aA/EDDXzF+i16+eVYfS5g9KQySgQrBk5/dMthUa
         4OXYisCwZzUM39GlNspZLRe0m6kGD8XmEiXo3D73CI2G2KFco6XqnF7BNu4TYXhJfy4i
         EY8A==
X-Forwarded-Encrypted: i=1; AJvYcCUlmfVC9XDL8Asg3hBLGqj6/0xCp3vcKnhFRp+6YXQMYAgI5DBtSYeprQpcQwW/eLpq0pqYdaFj0ml6mRrWLsAC@lists.infradead.org
X-Gm-Message-State: AOJu0YxFJfCxjljQypp2V+KTpooZrItK4XUWpeE9n/ttc96iXLT3dLaq
	xOVq23oP0YLikzDA8RU2zHg8H7tshByx53qsxP9Vj/greZxE6+s8bXYO55finB03wHDipHqKk8C
	FRJObbyCJgCiDhgkfUZUU4iIgcGe1m90=
X-Gm-Gg: AY/fxX6GlSCbqmE9f3xuYGnjCx/nlHn3t3l9EC8yVut6bgegdJZoKY9/Nfe1FFu5yP5
	uemzNbFKvIcDTjsx7QiZgJPXMqR/9696OmHI8fNUI5g24RMnW4rOhn3clcamJ2HavH9b8HqV75q
	ayUCXhFNoUTrBtCNAgHc0K5KyLs1StSCgq15vK5Cmdy1Ho9pVZtAqx7C5XjHm4XNFKVoscHpcxv
	d/v5I4QbM/C2Yhg3swPinR0X3BaQ9vbAvwGGWXG+SYDrwMCL2RI3jC20IZ2dMrbEuAbIZuu9rkS
	ny43qLIHJdfTbNg8VleohfC56rOg
X-Received: by 2002:a05:6000:2409:b0:432:84f9:9802 with SMTP id
 ffacd0b85a97d-4342c5483a3mr3996169f8f.49.1768406689407; Wed, 14 Jan 2026
 08:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20260102150032.53106-1-leon.hwang@linux.dev> <CAADnVQJugf_t37MJbmvhrgPXmC700kJ25Q2NVGkDBc7dZdMTEQ@mail.gmail.com>
 <aWd9z8GVYO12YsaH@krava>
In-Reply-To: <aWd9z8GVYO12YsaH@krava>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 14 Jan 2026 08:04:38 -0800
X-Gm-Features: AZwV_QhBzgwavE9dCvsyPnD3846iYc1-CBAq5_FLY28uDU4ys3fEyjL92GFBT_8
Message-ID: <CAADnVQLxo1uPbutGNKrv=f=bSVkzxOfSof0ea8n7VvqsaU+S3w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 0/4] bpf: tailcall: Eliminate max_entries and
 bpf_func access at runtime
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Leon Hwang <leon.hwang@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_080451_626422_6F9984FC 
X-CRM114-Status: GOOD (  26.51  )
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

On Wed, Jan 14, 2026 at 3:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Fri, Jan 02, 2026 at 04:10:01PM -0800, Alexei Starovoitov wrote:
> > On Fri, Jan 2, 2026 at 7:01=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev=
> wrote:
> > >
> > > This patch series optimizes BPF tail calls on x86_64 and arm64 by
> > > eliminating runtime memory accesses for max_entries and 'prog->bpf_fu=
nc'
> > > when the prog array map is known at verification time.
> > >
> > > Currently, every tail call requires:
> > >   1. Loading max_entries from the prog array map
> > >   2. Dereferencing 'prog->bpf_func' to get the target address
> > >
> > > This series introduces a mechanism to precompute and cache the tail c=
all
> > > target addresses (bpf_func + prologue_offset) in the prog array itsel=
f:
> > >   array->ptrs[max_entries + index] =3D prog->bpf_func + prologue_offs=
et
> > >
> > > When a program is added to or removed from the prog array, the cached
> > > target is atomically updated via xchg().
> > >
> > > The verifier now encodes additional information in the tail call
> > > instruction's imm field:
> > >   - bits 0-7:   map index in used_maps[]
> > >   - bits 8-15:  dynamic array flag (1 if map pointer is poisoned)
> > >   - bits 16-31: poke table index + 1 for direct tail calls
> > >
> > > For static tail calls (map known at verification time):
> > >   - max_entries is embedded as an immediate in the comparison instruc=
tion
> > >   - The cached target from array->ptrs[max_entries + index] is used
> > >     directly, avoiding the 'prog->bpf_func' dereference
> > >
> > > For dynamic tail calls (map pointer poisoned):
> > >   - Fall back to runtime lookup of max_entries and prog->bpf_func
> > >
> > > This reduces cache misses and improves tail call performance for the
> > > common case where the prog array is statically known.
> >
> > Sorry, I don't like this. tail_calls are complex enough and
> > I'd rather let them be as-is and deprecate their usage altogether
> > instead of trying to optimize them in certain conditions.
> > We have indirect jumps now. The next step is indirect calls.
> > When it lands there will be no need to use tail_calls.
> > Consider tail_calls to be legacy. No reason to improve them.
>
> hi,
> I'd like to make tail calls available in sleepable programs. I still
> need to check if there's technical reason we don't have that, but seeing
> this answer I wonder you'd be against that anyway ?

tail_calls are not allowed in sleepable progs?
I don't remember such a limitation.
What prevents it?
prog_type needs to match, so all sleepable progs should be fine.
The mix and match is problematic due to rcu vs srcu life times.

> fyi I briefly discussed that with Andrii indicating that it might not
> be worth the effort at this stage.

depending on complexity of course.

