Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447D0C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vP/jid/lwTMuSUYEVvS3TKkMNboILXns6WgZgd7cJYQ=; b=2XKYQOMe2Q0RbyBlzb4dI6rnpL
	atkJ3JcyF1yYaAfb4TH0Ia8c1ZKP+cN0mUr4BcDLa5R2oYaJt4brAqB8aOCgy34LWCDKTArQhLHt/
	bLOO7zX6XVLI8oiP0SMDQkMMsQsI7flz0lTkS+SdhJbIb8VMesilaxvLfw3cVb22jgSk3jzs18FY4
	AwT3Ro5dpKmYBrI8pkemimL0paVpZZFb+q9AcJSuKA1l1JFEQFDGZTXXEuYmAn25THqMGwO6n4x9K
	Dea48mrnayEuXWZ9YLvRPcXjZfgmN5DFIxtYrRBKCsD/50GiyoYecabEWYS6S2Wz7ER21Rxs4fsG7
	gMNsnAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl76-00000005yBk-2IUM;
	Tue, 15 Jul 2025 19:14:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhmM-00000005czu-1xhP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:41:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso41784595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752594073; x=1753198873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP/jid/lwTMuSUYEVvS3TKkMNboILXns6WgZgd7cJYQ=;
        b=Jle+vOahzeBvjF/wNEPJ+TjkkksIImTJoqdbf52+vMEIZOI0Uzyb0r2GqM973IpYW0
         2QOphqihn6+wDRM/U4dCFzOtAqCe7YUlReKBqYOnRE+mJ9U7/coMUYC+jIVGn1ThN6Kr
         +LWCRE6SBFaNEQEDiVWSxUnrf2zfx5/5xZHKFeaTDp3nmeYyBBbzdFgy21p62b4ON+hs
         MRJpjdgMtYmEivbhy3/9bKweAvHyT9FWOqjwON31sgv+nPNNRhp2feAKTKsK/MizpyPa
         NiHux6T4/V2DDtgnVo3ogFb9YBGBQwmOqUCuIBJRJ504ByG74oPdaBegtIl5c53EbXXx
         L7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752594073; x=1753198873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP/jid/lwTMuSUYEVvS3TKkMNboILXns6WgZgd7cJYQ=;
        b=qhZdIpueozsITFO+dqmkuAdaP06FoUfbzOSkR1j2KlFE2Z/TZYxmUckTQ+g5z5X5Hf
         nlZKbgkoctn+0kkYOU2oJIuxvO6aCPJSaWlnjn/OjfbiO3Itm2McWGqi1Ewu/LsXv2DS
         8UGvFOHtna9HAPROJoAj0EzoPPCILw+3M2Vzc0eQOJ5K21WT/9tFGTI8GJkNtlkS6H4+
         rq7yATrC5Y6B2N0zQtPbQmuk2UgUSUy6lDbElMRNiO5LDTl3ko69QSLEf2sNz+sBEbMD
         5Xy46mbpcWzVMCVfAPMs2WFLeA1SvemMwjP+498s35YB5ZoLYsspP3/Qv6zAdYGXlfp3
         VqCg==
X-Forwarded-Encrypted: i=1; AJvYcCWUfTxHmgmjhrLulI+AbMySRiCUsT654SXL0zfsIXh7TMgxthWqsQTW4SfiNbdjFl7nsonoBTbOYO79uY8t+HY+@lists.infradead.org
X-Gm-Message-State: AOJu0YxDlqK2pP3cGDtttAq13X7aCzXBg1ogIruUh+NpE/I6j76/vyOW
	P8i35/BisW9qXeHfQWE9JhPpUcZt59bYawTuzS9Nu3KB5oUDNlURinovrZf16mztPsAnmrAyL1X
	slG6PwwQs4dX+/Dc39PKE+mnEvCbrBHWYmwpj
X-Gm-Gg: ASbGncvJH94Y37O5KUAwNHza4nZ5Olzld25V2HMFmmLhnnypR/gZ0d7Z9SM6ZQUC6GB
	+qSo4Wt94QBY9KKLm23qWC96ZHJ/GA8al1qujUI/GeUoxhOhGdTtLj3aOghElgqWK5ySqg2by80
	k9tx+mhNbBoiyfn/s6qCZAGD4Aa/xo26c8prl/qB8XsGJtLAqaNqFN58GR/uDJG7nLD42vb7Jif
	C1pxUjY6gnErzymdiGL5tE=
X-Google-Smtp-Source: AGHT+IHUe55CPlfoXQFNA46EX3tD2L+zAmA4ABcayvzkZKklLjj2akBlQVEyroKE2ImpxzjeHZRCNGen3/yjsDKdInE=
X-Received: by 2002:adf:edd0:0:b0:3a5:2cb5:6429 with SMTP id
 ffacd0b85a97d-3b5f18d96camr13102332f8f.43.1752594072711; Tue, 15 Jul 2025
 08:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-arm64_relax_jit_comp-v1-0-3850fe189092@bootlin.com>
 <20250709-arm64_relax_jit_comp-v1-1-3850fe189092@bootlin.com>
 <aHZYcY_9JtK8so3C@willie-the-truck> <DBCONB7XHN7E.2UQMMG6RICMFY@bootlin.com> <aHZmOVpcoyTvGY1u@willie-the-truck>
In-Reply-To: <aHZmOVpcoyTvGY1u@willie-the-truck>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 15 Jul 2025 08:40:59 -0700
X-Gm-Features: Ac12FXzvpz_ddy7GAzzzXQfSfZjOu2uIdytRA66-cTwOPYu3QFq5bNb__jBKM6M
Message-ID: <CAADnVQK=x7p6zjvNbv0iqOfE73DM3j0nGSGrFX+pVExLMkJb=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] bpf, arm64: remove structs on stack constraint
To: Will Deacon <will@kernel.org>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, ebpf@linuxfoundation.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_084114_509544_44EA4B9F 
X-CRM114-Status: GOOD (  38.30  )
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

On Tue, Jul 15, 2025 at 7:31=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jul 15, 2025 at 04:02:25PM +0200, Alexis Lothor=C3=A9 wrote:
> > On Tue Jul 15, 2025 at 3:32 PM CEST, Will Deacon wrote:
> > > On Wed, Jul 09, 2025 at 10:36:55AM +0200, Alexis Lothor=C3=A9 (eBPF F=
oundation) wrote:
> > >> While introducing support for 9+ arguments for tracing programs on
> > >> ARM64, commit 9014cf56f13d ("bpf, arm64: Support up to 12 function
> > >> arguments") has also introduced a constraint preventing BPF trampoli=
nes
> > >> from being generated if the target function consumes a struct argume=
nt
> > >> passed on stack, because of uncertainties around the exact struct
> > >> location: if the struct has been marked as packed or with a custom
> > >> alignment, this info is not reflected in BTF data, and so generated
> > >> tracing trampolines could read the target function arguments at wron=
g
> > >> offsets.
> > >>
> > >> This issue is not specific to ARM64: there has been an attempt (see =
[1])
> > >> to bring the same constraint to other architectures JIT compilers. B=
ut
> > >> discussions following this attempt led to the move of this constrain=
t
> > >> out of the kernel (see [2]): instead of preventing the kernel from
> > >> generating trampolines for those functions consuming structs on stac=
k,
> > >> it is simpler to just make sure that those functions with uncertain
> > >> struct arguments location are not encoded in BTF information, and so
> > >> that one can not even attempt to attach a tracing program to such
> > >> function. The task is then deferred to pahole (see [3]).
> > >>
> > >> Now that the constraint is handled by pahole, remove it from the arm=
64
> > >> JIT compiler to keep it simple.
> > >>
> > >> [1] https://lore.kernel.org/bpf/20250613-deny_trampoline_structs_on_=
stack-v1-0-5be9211768c3@bootlin.com/
> > >> [2] https://lore.kernel.org/bpf/CAADnVQ+sj9XhscN9PdmTzjVa7Eif21noAUH=
3y1K6x5bWcL-5pg@mail.gmail.com/
> > >> [3] https://lore.kernel.org/bpf/20250707-btf_skip_structs_on_stack-v=
3-0-29569e086c12@bootlin.com/
> > >>
> > >> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore=
@bootlin.com>
> > >> ---
> > >>  arch/arm64/net/bpf_jit_comp.c | 5 -----
> > >>  1 file changed, 5 deletions(-)
> > >
> > > This is a question born more out of ignorance that insight, but how d=
o
> > > we ensure that the version of pahole being used is sufficiently
> > > up-to-date that the in-kernel check is not required?
> >
> > Based on earlier discussions, I am not convinced it is worth maintainin=
g
> > the check depending on the pahole version used in BTF. Other architectu=
res
> > exposing a JIT compiler don't have the in-kernel check and so are alrea=
dy
> > exposed to this very specific case, but discussions around my attempt t=
o
> > enforce the check on other JIT comp showed that the rarity of this case=
 do
> > not justify protecting it on kernel side (see [1]).
>
> I can understand why doing this in pahole rather than in each individual
> JIT is preferable, but I don't think there's any harm leaving the
> existing two line check in arm64 as long as older versions of pahole
> might be used, is there? I wouldn't say that removing it really
> simplifies the JIT compiler when you consider the rest of the
> implementation.
>
> Of course, once the kernel requires a version of pahole recent enough
> to contain [3], we should drop the check in the JIT compiler as the
> one in pahole looks like it's more selective about the functions it
> rejects.

I frankly don't see the point in adding and maintaining such checks
and code in the kernel for hypothetical cases that are not present
in the kernel and highly unlikely ever be.
The arm64 jit check was added out of abundance of caution.
There was way too much "caution".

