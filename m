Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79035C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nOMcPPI5c1jXJRM+8g52gTtzt6JEQOhHcXYY3HpyA0=; b=Di9cZKcn/uR9dtyqpqQ/g/0S+9
	O9Fy6llNzT3Oxg0zC4YfK+R4LeEl6SjPaWg/RvpkEyfkd6ZygaAmc2pa0pN0IgGRatZAFflkqkCj+
	LN5xX/fWb2UZYEaYJE8HxgQ+STpOVRVKYK8zEQ5yAvPeVsQt9YKQND98G8YqzrZBhilsmdJGGH4S0
	FVdsnUKg/A6m8khg9vmgw31v18xJX9PPClec/NLZcQMjOqfVV1hTywQZh60g272Bov8tCLtprkgMW
	o2nV3nHodXQWgFupMguePYGOQ9Yq2sU7Oh9hebXi54qIMGrRJ5pzLBd6mt53sZWeF3/e8Vm2+95oy
	ZCBgjR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRTE-00000005mP4-2jkA;
	Thu, 27 Feb 2025 00:09:44 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRQg-00000005lsu-1uHV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:07:09 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so637435a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 16:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740614825; x=1741219625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nOMcPPI5c1jXJRM+8g52gTtzt6JEQOhHcXYY3HpyA0=;
        b=uEhE73mOsvk4M+Je3v4cfP3eqNr8mNIsXoQqowaX5b78cpnV3mZccpdt9Cu6JS36UG
         cARBl0TFw6Is5NmpcwOAN73F6uOjOkbUvA976LOlC9In932pDDIb1XvzuqHWheDFT1GG
         fbWPzXmJIsIZ7RIWgEVw7LMRecZmGjCxsbddwhVtP/bzyn3YSyUVswi1GNSslqarlUqe
         QbHEXxFMaxnIlyJFiw/zf+Y4ch3YjUSZOYUzMxKZCouVLkl+CWq90gJjqFxAirOIBUi5
         /W/rES7hvU1GLJhuitxbMZ3dEIlgaOcQMPA5yk4MeAGZxSLkcaACG3fIsCPJeiZ6xymi
         h2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740614825; x=1741219625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nOMcPPI5c1jXJRM+8g52gTtzt6JEQOhHcXYY3HpyA0=;
        b=bMgnMe6dBteqBWsBPhpBVQiQxB9cdJHD8mk6/4uNwftut0ij3XNz9ilyeLRINxEAsN
         V4pkGU9Vjt5he3fCzRleR8sMR3klWbxSE2GkoAgPglxFspahiZTTHskkvs/bYVJapds2
         9hsEuttSy6on2z0IvpKxPEkD8RRaSz9KSGqYHE7ghpOZL+Twq4EE5Ji0iTn4F1kIPsII
         rdONLr0IGyT69ue2zycn++FtTUv8Rg+fkMB8XFDvkU5qwMKHuW3F8QuYiU2tsGGnIAoG
         3gEhYoLQyY19lEauxqGb+4M1MLsl33goG0p8qYZlVYx/1V2+BARxJGOFvg2nOupPD2VB
         VMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUVygJlUnv52Z4aNL9f1nNNKZt8iT7TUfn6bvpnAf/Ff2qPQYLaUO+xgByqbjGMFEClQl8WGj4rWUd/A1T4MkK@lists.infradead.org
X-Gm-Message-State: AOJu0YwkYHf8XB8xuRL9PKNdXF9rEU13+CLVXLi1VLCzVV49Hrkgbrp4
	PaTvXJXnxKhyWtKwqe3kmY+U2taB6PURjPOOm1G2+gPtmj0EcW8hsre/crBAzz8UF3FnBGIbRu+
	pePuODZiXyLNzbM985LNxl21v74cMTnc2ElJ0YQ==
X-Gm-Gg: ASbGncsn1G/0cp2rA/UVM1foIIUeU23alRm3amtKd9ZzB7dd9NI0qxWt0QtEIF+Tfnu
	mQJMUxx/OAzjGFcSGsPiZMKB9U/ba6pA/q2VF0VQwsI/9dO6prolsvdzhLViPwL/Gxu+68/Cnxm
	bZGdhx7A==
X-Google-Smtp-Source: AGHT+IFU1bq8mMWQr/nfAv06hNruBT5LhpE0t240NRVcR7JAq7ma1dPyg4mvl61oVDhks/31ToFVQUQ4SS/zaz0yHCw=
X-Received: by 2002:a17:90b:5446:b0:2ee:c04a:4276 with SMTP id
 98e67ed59e1d1-2fe7e2fad73mr7598919a91.5.1740614825599; Wed, 26 Feb 2025
 16:07:05 -0800 (PST)
MIME-Version: 1.0
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-9-835cfa88e3b1@rivosinc.com> <d03581a9-495d-47df-99f2-96065b06ee8f@rivosinc.com>
In-Reply-To: <d03581a9-495d-47df-99f2-96065b06ee8f@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 16:06:54 -0800
X-Gm-Features: AQ5f1Jor6j_JB-qT3VHcFUngBC7pDF2lQ8l_4vLXmUWI5FABCG8w44W6HyNkHE4
Message-ID: <CAHBxVyFxX78+zf3NFvRZ8sE6PV83gkQ0ibHMTPY7kr8HNr8naQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/21] RISC-V: Add Ssccfg ISA extension definition and parsing
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_160706_501346_FE3FB981 
X-CRM114-Status: GOOD (  22.64  )
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

On Fri, Feb 7, 2025 at 12:13=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
>
>
> On 06/02/2025 08:23, Atish Patra wrote:
> > Ssccfg (=E2=80=98Ss=E2=80=99 for Privileged architecture and Supervisor=
-level
> > extension, =E2=80=98ccfg=E2=80=99 for Counter Configuration) provides a=
ccess to
> > delegated counters and new supervisor-level state.
> >
> > This patch just enables the definitions and enable parsing.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 2 ++
> >  arch/riscv/kernel/cpufeature.c | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index b4eddcb57842..fa5e01bcb990 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -103,6 +103,8 @@
> >  #define RISCV_ISA_EXT_SSCSRIND               94
> >  #define RISCV_ISA_EXT_SMCSRIND               95
> >  #define RISCV_ISA_EXT_SMCNTRPMF         96
> > +#define RISCV_ISA_EXT_SSCCFG            97
> > +#define RISCV_ISA_EXT_SMCDELEG          98
> >
> >  #define RISCV_ISA_EXT_XLINUXENVCFG   127
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 8f225c9c3055..3cb208d4913e 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -390,12 +390,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =
=3D {
> >       __RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
> >       __RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
> >       __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> > +     __RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
>
> Hi Atish,
>
> based on your dt-binding commit, if smcdeleg depends on Sscsrind, Zihpm,
> Zicntr, then you could add a validation callback here:
>

Sure.

> static int riscv_smcdeleg_validate(const struct riscv_isa_ext_data
> *data, const unsigned long *isa_bitmap)
> {
>         if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSC=
SRIND) &&
>             __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZIH=
PM) &&
>             __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZIC=
NTR))
>                 return 0;
>
>         return -EPROBE_DEFER;
> }
>
> __RISCV_ISA_EXT_DATA_VALIDATE(smcdeleg, RISCV_ISA_EXT_SMCDELEG,
> riscv_smcdeleg_validate),
>
> >       __RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
> >       __RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
> >       __RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
> >       __RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinux=
envcfg_exts),
> >       __RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> >       __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> > +     __RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),
>
> Ditto for this one with Smcdeleg, Sscsrind, Zihpm, Zicntr, Sscofpmf,
> Smcntrpmf.
>

Smcdeleg is dependent on Sscofpmf/Smcntrpmf only for some of the registers.
For example, Sscofpmf dependancy is only for sireg2 (hpmevent3h-hpmevent31h=
)
while Smcntrpmf is only for cyclecfg/instretcfg[1].

So we can't include those for validation but I will include other
extensions which are always required.

[1] https://github.com/riscvarchive/riscv-smcdeleg-ssccfg/blob/main/body.ad=
oc
> Thanks,
>
> Cl=C3=A9ment
>
> >       __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> >       __RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
> >       __RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinux=
envcfg_exts),
> >
>

