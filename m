Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361C5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eluzqqf3VmMNWgnnw6mwWFDCXsND3S4l7FpeN+tcY8=; b=lA7ZJGPWULzZcvPDVU1vC4W1xf
	1cDrTz4oxLsq49RoP5KAynCPibiJ/3sqLNpRkbRwszyVT/Rrr18ONIyZ707zz9TT2q7Nye/bd5MWx
	IlM9W8aP11nZFXhaSAf2vudVLEI6FLgc0g5WTuJFDkU6BPAg/LGawX+ACej6ONdaLzmQgmpYiUIys
	tRC1lByt06QLV+XvvRYu69fCm10ED7IHgWgGE3KikovXKZDTKvIEZvC8WWvNn8NLG0cgOKnP3QdH/
	xoYjWkDBJum2J/ifXOOXNjbeStbW34LU4tHh6uZfe2trb8DG193GTXQUszyTUAkRQDVvEUR+6dvqo
	LcpDxSaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnROW-00000005lYy-08ll;
	Thu, 27 Feb 2025 00:04:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRMx-00000005lGu-3Zeb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 00:03:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-222e8d07dc6so7408415ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 16:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740614595; x=1741219395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eluzqqf3VmMNWgnnw6mwWFDCXsND3S4l7FpeN+tcY8=;
        b=l+/o9p+2lIxGWg8TK7pDvTQRuXdvjVpFiE6Ffdf8If4EWA77DbfMZOVbC3Xmzpy1P+
         ThK8MebCj8O5M2lbzuD5JWyQDyYW22gUNsIN+5gOrTZ+v2uQd31aO3LHwDMLKY9htRV8
         trrYnMIbEj0dfajpsqIpo7XNM3yR4WGEePcld0KPPwwxBQxBueCgrCl236fASJ9Nak4A
         nyC9PHnM5YVtfTBUACqHa1ZyWHO5bTZ6CLUTY3kHCYw7lQRTCAjWcrh/5/1tTVyz91NS
         a9u4LfrarcM/Oqu4+yWVKhiYf+lfvW+biss35eY8i0Op/zc4vmptlaibV67VO9RIoHYD
         +Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740614595; x=1741219395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eluzqqf3VmMNWgnnw6mwWFDCXsND3S4l7FpeN+tcY8=;
        b=Dfk7xoy4AGVZ/knccylbmklOJbVTnu8Qf8vcMuyrNxlUmsN6bidiSqZLAFGQyeseDA
         1R9efZ+PVlfiHV4ngoJi6RlA7FgIP4HBVMoLgTaH4QISWTUZ1HDDTaYWo5VxQs/f8c8m
         /roXi6qWq+/p6FBkdou4kEX/QpVYk7/U7ZuV2B7oDdnBeSkK2MvlC6cNUZgzxB20rN2X
         fwnVeWJYebRu0PcIrTncJvckQZv7czss1/vxgxmLViHJBYyGwVf9MPfMqGUSmJN6MxIn
         HJ3yrFe+Flk2F3pqeBDrYQsHjqUjyAFn3+u+2TEubz+X301zYRcx+AQUVhPPCQo02V+S
         Ngtw==
X-Forwarded-Encrypted: i=1; AJvYcCUdAC9GR9tuWfStTUJj03cGHE9CP2kTktV+rh8P4Knmdc4ueEwB6osqvqTX8qlC7L8rpjjcbH8f/DbDmiTdO6lf@lists.infradead.org
X-Gm-Message-State: AOJu0YyMLl4ASGBQ5OfYvYw0aDF3NMImTUg9wAz/qZVS0hCEeRqOu6YR
	pKCIoiZm/5gu/YxCy3gXzrUj9DUm/tpnDGARku0IRZX5U/sozboRCOmFcKcZNn+eIJcKWvf0bkW
	SGa9YBQzwrJdK5vsVmHNhSgDb3n8Why6GM8/Evg==
X-Gm-Gg: ASbGncvuLoD0yzXou66bZxcE8hvXBOQ2k58tIxPa7pr71S9kRw01U/BUM+ZyBF4Fm2u
	OB+XW+RfXrjIcFRy3lQbEidTFI1w8YafnfhX7SRPztuMFyTHKqZXWxVsDGvtgFoKHHKj0jI0j2o
	kaXIThiw==
X-Google-Smtp-Source: AGHT+IFrt1HFaZ54tMfJQXNhrvI9R+jOmDy/nuxxOKVXc1hJS2IXrvPo+lbSmj1tQY9y14Kf7mMsIhJxPaxk/aVTs/c=
X-Received: by 2002:a17:903:289:b0:21f:3823:482b with SMTP id
 d9443c01a7336-2234b08fc3amr20812385ad.25.1740614594829; Wed, 26 Feb 2025
 16:03:14 -0800 (PST)
MIME-Version: 1.0
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-8-835cfa88e3b1@rivosinc.com> <bcb10a3a-162b-4a8c-a479-38f4168cea9a@rivosinc.com>
In-Reply-To: <bcb10a3a-162b-4a8c-a479-38f4168cea9a@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 16:03:04 -0800
X-Gm-Features: AQ5f1Jpty0qq-pYufASOZ8Op-YJ_VW5jRuImaN1P7f7dzUah8vHjK9-7awdIFLs
Message-ID: <CAHBxVyHZ+iw9dC=4xzbW-UdEELdpr-E=FtExGOMnPzUKSRwFvg@mail.gmail.com>
Subject: Re: [PATCH v4 08/21] RISC-V: Add Sscfg extension CSR definition
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
X-CRM114-CacheID: sfid-20250226_160316_077922_A6CFC61B 
X-CRM114-Status: GOOD (  19.61  )
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

On Fri, Feb 7, 2025 at 1:30=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@rivo=
sinc.com> wrote:
>
>
>
> On 06/02/2025 08:23, Atish Patra wrote:
> > From: Kaiwen Xue <kaiwenx@rivosinc.com>
> >
> > This adds the scountinhibit CSR definition and S-mode accessible hpmeve=
nt
> > bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/s=
top
> > counters directly from S-mode without invoking SBI calls to M-mode. It =
is
> > also used to figure out the counters delegated to S-mode by the M-mode =
as
> > well.
> >
> > Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.=
h
> > index 2ad2d492e6b4..42b7f4f7ec0f 100644
> > --- a/arch/riscv/include/asm/csr.h
> > +++ b/arch/riscv/include/asm/csr.h
> > @@ -224,6 +224,31 @@
> >  #define SMSTATEEN0_HSENVCFG          (_ULL(1) << SMSTATEEN0_HSENVCFG_S=
HIFT)
> >  #define SMSTATEEN0_SSTATEEN0_SHIFT   63
> >  #define SMSTATEEN0_SSTATEEN0         (_ULL(1) << SMSTATEEN0_SSTATEEN0_=
SHIFT)
> > +/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg *=
/
> > +#ifdef CONFIG_64BIT
> > +#define HPMEVENT_OF                  (_UL(1) << 63)
> > +#define HPMEVENT_MINH                        (_UL(1) << 62)
> > +#define HPMEVENT_SINH                        (_UL(1) << 61)
> > +#define HPMEVENT_UINH                        (_UL(1) << 60)
> > +#define HPMEVENT_VSINH                       (_UL(1) << 59)
> > +#define HPMEVENT_VUINH                       (_UL(1) << 58)
> > +#else
> > +#define HPMEVENTH_OF                 (_ULL(1) << 31)
> > +#define HPMEVENTH_MINH                       (_ULL(1) << 30)
> > +#define HPMEVENTH_SINH                       (_ULL(1) << 29)
> > +#define HPMEVENTH_UINH                       (_ULL(1) << 28)
> > +#define HPMEVENTH_VSINH                      (_ULL(1) << 27)
> > +#define HPMEVENTH_VUINH                      (_ULL(1) << 26)
>
> Hi Atish,
>
> Could you use BIT_UL/BIT_ULL() ? With that fixed,
>

Done.

> Reviewed-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
>

Thanks!

> Thanks,
>
> Cl=C3=A9ment
>
> > +
> > +#define HPMEVENT_OF                  (HPMEVENTH_OF << 32)
> > +#define HPMEVENT_MINH                        (HPMEVENTH_MINH << 32)
> > +#define HPMEVENT_SINH                        (HPMEVENTH_SINH << 32)
> > +#define HPMEVENT_UINH                        (HPMEVENTH_UINH << 32)
> > +#define HPMEVENT_VSINH                       (HPMEVENTH_VSINH << 32)
> > +#define HPMEVENT_VUINH                       (HPMEVENTH_VUINH << 32)
> > +#endif
> > +
> > +#define SISELECT_SSCCFG_BASE         0x40
> >
> >  /* mseccfg bits */
> >  #define MSECCFG_PMM                  ENVCFG_PMM
> > @@ -305,6 +330,7 @@
> >  #define CSR_SCOUNTEREN               0x106
> >  #define CSR_SENVCFG          0x10a
> >  #define CSR_SSTATEEN0                0x10c
> > +#define CSR_SCOUNTINHIBIT    0x120
> >  #define CSR_SSCRATCH         0x140
> >  #define CSR_SEPC             0x141
> >  #define CSR_SCAUSE           0x142
> >
>

