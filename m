Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2021FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 23:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=; b=2OQfnrm8Ih/lW02gxt31i3hSKl
	9pwumYVp5zDbX2LrShlVIL3HgKJ7jRkHyNBvO/IqCl7ElyfilByOHsoLsun5LmDsneHZTawyaGeDg
	A2M4XGixF2BQG4rCG7Vkh7SjTQL60m54SRdCsl2DYGsuXMgXWt5hyxGx3xj3Ero1/jFrneGVBe/Ey
	w0StDWiLkMn2MJn241WRMZ03hZ5mvNvSvIPEqTo9CvVtUD3/0CQbXEmrNKTxLRxegJzG+/Un5UyMw
	7DuqEH1t9Uu8hxKW3fLOp2GyqaGa01LC+2ZM/5VBiIhrpm/Z3xrr4kLcu+UY+Pomlm9H7hzKASc9/
	5zwjTmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPxS-0000000Dthp-0fje;
	Fri, 24 Apr 2026 23:29:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPxP-0000000DthQ-2JjJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 23:29:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43d64313c39so6492952f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 16:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777073348; cv=none;
        d=google.com; s=arc-20240605;
        b=DH919EPWOzxMUF6r7SMpRxqf+/UCaIlRJ1t6e0U5l61vGe0fs88sHOS6FXqRHKeiAO
         mT2c92w56OYFIXn669UtFSt5sx9A7rXO2WG+NMtRBMVH2sGWrz31QbmCjv6euoOPTupn
         jt7wBYyUs59dXPuHuvOXwUuABFoAclU5go8AFYSDbJQnaRG3dCzXDkrver2RFL7XaNnd
         gmTTFkeweaXA0z8a1HGWUHBu1ZLIYeraPYug8kpWLn72IwqSjYwribEnIfpAURc/j9ac
         Q4BASR9Zt7B5p5h+5OYrLXdY1Uq1yCIHDPYi9E5AQetgv9DZXrDgquTJFjep0pF4RvRL
         mgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
        fh=RMyH6DauzIwKyAKuycUozWd7H+38P2dWZoifDcSAd0c=;
        b=aJrdpQrnMOl8uQ06yfTpH63/TjrC7uHPVEkpHeTv4Cy96sM+7cjr3rnasnVuJOgRsP
         IlQGR3uVRJo1SIr2/dksh8kDlzVgcyrznuzBUdik5dvmPG6FXesEY1qMKO3U0SG/bZvm
         PfI6Os0qZ5g79nEsajBszVGoLcAUInOHbuR3xZCwbChreryh3+Tz0YKjVlh6Od9q/qHi
         TzRiF/oy557YOFGasQSFWpNqpwPLK9TSL6k0LHc4hkBBgNCfcpGOg3iruLGRTkf8gWSp
         LpxXj68/taamek2pkJs0js9b3t9ZbP9HxscvwS6TIdyjMtewE/mMlSm7QBXr+yzFuwVX
         uhUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777073348; x=1777678148; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
        b=n1llKQBF4+bSRI3bO3zCsN3E6FkSQcF8D68KebkOzcNsWQv5Wh1ExbNwPb3MBeR6jM
         Khzogiz/NzNtGpGYUG246FE1S7OQQI0idgqK7V4/0OG/7rIHq6ocImzTomNeF4pYS9sv
         zMX7VzeK+JO2QBTbaEaTxgrYsopcRIJFLjpDN1nic8uDk8NmcyOMUAavyPzfqyiP+vtD
         sEtiJ8WOwBUOUEjji+QSQjvZ8eXa7znRlGw3i4puoJY2UBRyGXMDBxoSXHLI34DkWCrA
         /q4O6Wu0PyuNAQSIFN5T/CCrURbxG4P7UYVfq38dPVUwhSQC3nWCcvUGEx8h680qJirY
         zueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777073348; x=1777678148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahCy8rxOvixjX2FA5ApDynwuvYGvOS/2mqLtTRZIyI4=;
        b=HaE2m68Bvyeeh5wvTb/V0Y/mnJsvoSnMux7S1ileg/2Dp5qMzuAnG7O+iELOXr2TL+
         DpqjL62IdPoxjKj7GfKPTHwNrYPBl55z37EZUNjMEn/Q6RNOlvGrHizBD/wHBp1G9ldb
         BcaQVB7uEbri2ngCdNX3wNIAn5XDkIEVzNDred0J8Uq2WQ10A/gwoZIJNTv9RaQnPRsD
         KTdNlsUy7FyTj5VgIVmWLjISO3M/iG/ajfNeynLghzky5Uzp+eW8KjL9fwEk8mjwHass
         X/4019x7oNGywDUii3hGk7/M3SkFJn19HcQ1DZ+QWD0qgVC7hhbiYMWrkSqTj15tZkhe
         K8yQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AjyyIyWOCaFR9Nd0YBi9aOFgbZz3P2r+h+KeGrcoNJvGSrCbCLNAXm3cz9ABHhh6W9Bd2FpHjdrvGySVf0AeN@lists.infradead.org
X-Gm-Message-State: AOJu0YyPyzR2YJdH3aPmRGiQbJyt/a2c5FnzceXbrri5pLf/1o+jzAAc
	E7xI/ze/PtXVhSR9Ag4ICgOovhp/qTnbtWTBrd4QlPPApW3UkzRfI+OmGG3XnBMC13Ps3m6BiIf
	qc9K6JfdSR8gTmN1vkFhZ8ZJIaM2G1gA=
X-Gm-Gg: AeBDieubswoARj4AdXtraRpKQ/iBGpt0F6NwpO6LsAGxgrgRUVxCGMI3MahFgAs3Lk6
	EcYN+1Sj3B5konMywbtgfJeaPI7XITSzdNLmvDaVLoFw41jfv1H0wkwQv+uEg1Z7q98uEg9VitL
	TYgmcOMX3j3WDA4BWue1ELgqRu9CLovowVgZWLuvkv/biATby5S6nnTqnQZ0mVGqPOemUyaDXoI
	faj1IMtHWC4OpUpKGzQAFn2zCZ7LgoZBCtXGu9YIAUHCPS4LHAq0ixfn9yezL45KyyuyIz/dGWp
	2B8i+8Bs3PsP4cv48LxkoWSip9dpV7yoA8sYKNG8gbG+k3XSp+V83SLWjH78kN7szwhIaZgmxuH
	dgHRgMT6algU+3vlTTc1fZmTB+einI04aVb3x
X-Received: by 2002:a05:6000:2c0b:b0:439:beb9:5a96 with SMTP id
 ffacd0b85a97d-43fe3dfbff5mr53034945f8f.31.1777073348360; Fri, 24 Apr 2026
 16:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
In-Reply-To: <71fb19ff-6dde-43f4-a0e9-5c8cf2ba4ed4@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 24 Apr 2026 16:28:56 -0700
X-Gm-Features: AQROBzB_ndIthouIQciueRLu_dMM7bcPcCRP_ecesud5fA9xG1Ica2sIBP2K-bI
Message-ID: <CAADnVQ+ytaX5oq_1TjKC66dnjd1-yh3yjmPrP-kEg5wEvX643g@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/8] bpf: add support for KASAN checks in
 JITed programs
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	ebpf@linuxfoundation.org, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_162911_678183_BD8A14E9 
X-CRM114-Status: GOOD (  33.47  )
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

On Fri, Apr 24, 2026 at 4:10=E2=80=AFPM Ihor Solodrai <ihor.solodrai@linux.=
dev> wrote:
>
> I wonder if it's feasible to implement KASAN support on the verifier
> side in post-verification fixups. AI slop for illustration:
>
>   ;; Original (1 BPF insn):
>   dst =3D *(u64 *)(src + off)           ; BPF_LDX | BPF_MEM | BPF_DW
>
>   ;; Rewrite (~7 BPF insns):
>   r_tmp1 =3D src                         ; BPF_MOV64_REG
>   r_tmp1 +=3D off                        ; BPF_ALU64 | BPF_ADD | K   (ful=
l address)
>   r_tmp2 =3D r_tmp1                      ; copy
>   r_tmp2 >>=3D 3                         ; KASAN_SHADOW_SCALE_SHIFT
>   r_tmp2 +=3D KASAN_SHADOW_OFFSET        ; shadow address
>   r_tmp3 =3D *(u8 *)(r_tmp2 + 0)         ; BPF_LDX | BPF_B   (load shadow=
 byte)
>   if r_tmp3 !=3D 0 goto +2               ; BPF_JNE | PC+2
>   dst =3D *(u64 *)(src + off)            ; original access (fast path)
>   goto +1                              ; skip slowpath
>   call __asan_report_load8             ; BPF kfunc
>   dst =3D *(u64 *)(src + off)            ; retry the access after report =
(non-fatal)
>
> A sort of inline kasan directly in BPF.
>
> There are plenty of issues with it: instruction limit, exposing asan
> API as kfuncs, etc. On the flip side we get cross-arch support out of
> the box with no or mininal JIT changes.
>
> Honestly I'm not excited about this approach, but curious if anyone
> thought about this, or maybe it was already discussed?

We discussed this.
It won't work because we don't have that many temp registers for once
and second it has to preserve all (both callee and caller saved regs).
This is arch specific.

Second, we do not want other archs. This feature is x86-64 only.
It's being added to find _verifier_ bugs. To do that one arch is enough.

>
> > - not all memory accessing BPF instructions are being instrumented:
> >   - it focuses on STX/LDX instructions
> >   - it discards instructions accessing BPF program stack (already
> >     monitored by page guards)
> >   - it discards possibly faulting instructions, like BPF_PROBE_MEM or
> >     BPF_PROBE_ATOMIC insns
> >
> > The series is marked and sent as RFC:
> > - to allow collecting feedback early and make sure that it goes into th=
e
> >   right direction
> > - because it depends on Xu's work to pass data between the verifier and
> >   JIT compilers. This work is not merged yet, see [2]. I have been
> >   tracking the various revisions he sent on the ML and based my local
> >   branch on his work
> > - because tests brought by this series currently can't run on BPF CI:
> >   they expect kasan multishot to be enabled, otherwise the first test
> >   will make all other kasan-related tests fail.
>
> AFAICT this can be trivially fixed on BPF CI side, we just need to set
> kasan_multi_shot for the VMs running the tests. I will do that, your
> next revision doesn't have to be and RFC.

+1

> > - because some cases like atomic loads/stores are not instrumented yet
> >   (and are still making me scratch my head)
> > - because it will hopefully provide a good basis to discuss the topic a=
t
> >   LSFMMBPF (see [3])
>
> Apparently, KASAN reporting routine takes a lock [1]:
>
>    __asan_load()
>      -> check_region_inline()
>         -> kasan_report()
>            -> start_report()
>              -> raw_spin_lock_irqsave(&report_lock, *flags);
>
> BPF programs can run in NMI context, and so it appears to be possible
> to get an unflagged (because of lockdep_off() in start_report)
> deadlock, if an NMI fires on a CPU already holding report_lock.
> Although I guess you'd need two KASAN bugs to happen
> simultaneously for that to occur?... A rare event, I would hope.
>
> It could be addressed with either in_nmi() check at runtime, or
> forbidding kasan for NMI-runnable BPF program types.

We don't need that. If this bpf KASAN finds a bug, it means that
it found a verifier bug. All things are out of the window.
kasan_report() splat can just as well be the last thing that users will see=
.

