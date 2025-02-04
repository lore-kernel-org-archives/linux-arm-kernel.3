Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C78C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMHiHPDNCUJ48N5qcuZlI6iRMY6kpg7JJf8A3gbeaKQ=; b=gvEOsYNFgeXoIyCihCkYt4hjuR
	I7+Zp0GRlve00J2RRcHPChHJac6/s71DDCisj6/x0kPtZOTjbS7+W1tBrN/Vlx+1LfQTgtlnbpdAC
	kaFZYmsa0JOA5G80dykhEwe9V0JMEXOkQK37qE6pgauo9WLLG0w+jZvXbBqW2nk4ZOrQzhH+2b9LX
	Gz0lcJ4tftn5ORzJVs0HFWUUcJ/3ZvQ9BKLI2EtqzdDydjK1wa4/0R26w7lOpJnNHlXk2sCxRRFVd
	N+U6dnc2zCvFTqT/fOOrRtJRQhxocULF98yhrvicSbG1QjnELX8GypV5/GO3WjXnST4xAHI3U4QpN
	actxvGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCYJ-0000000HNQW-0jP2;
	Tue, 04 Feb 2025 06:36:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCWv-0000000HNDJ-3M3Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 06:35:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so6716731a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 22:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738650928; x=1739255728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMHiHPDNCUJ48N5qcuZlI6iRMY6kpg7JJf8A3gbeaKQ=;
        b=TKjkdgzjxs/RHi6ymx6QP13o8xA4c3+ueMsC1WaCgroMb1w4zTUWR3rgajq4tYdiQE
         D6Ss+GnsePAYB7PqeVEQdCkBn+Cdm/snwnxK4f4YGsScaQXCd+bKMVvFQrfJJa9el442
         v9EhGwdkt3/F6v+HVd0Ls0+TubA+fywgH7RTiZtxA96po4gDiWuPAnvtJmgY/9o+l2Y9
         fUPdThTzudwk5OiMTUfCb0aM9bAydyWDDTGOz1KDB1iDih1S1SwtDJ82pOEvbM/QtiQU
         Ybsp4oIalBcyf72LosDkWQ7JDmWR7JzQ+0ezkM4HGlCyx4goCkOAr9l9eueZ4tvPZH6f
         mXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738650928; x=1739255728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMHiHPDNCUJ48N5qcuZlI6iRMY6kpg7JJf8A3gbeaKQ=;
        b=CRyflQaJ3LAFumuiMR1n2MaxmZWawCy6oDNbfUZ9K/CxguMQnh863Eh5RlQPk92iLJ
         CYlRg/aI3cog5gACJd/F2G05OwHnBY505pvVr7ERs+7a2HAfXhjAgAssycOqSLaHXnX1
         SjPi/Y/ji2ag6BrKw/wXH3hx1VX7phG8QYniptjoTo1XiE4McmwCbtHuOln27EO/e7HG
         Peek8ul74A5z7YLHWdzbvuy66yY9v3xWA7LLz656X/SH4kNcy9Ozfi3y1Oq60me0MtI4
         ssNnU9MTcJX9EbMJH7pFdrD9iELqEBjJROzjOpigi8p+k5zqjz+fQ6zjIV7Cb+++fMcD
         GXTg==
X-Forwarded-Encrypted: i=1; AJvYcCWO9icXoOvsFXeLVcDTq5Xr2/3L3B9r4e8JoQfST8+j41LUmFwu6l/pKCfO+Q2/H2adlVY6isTqatX1YpEDyjXZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzgXZUN/vUqk43qqRMw71GC86ksJyp0rmmXYngIRMrsNL+OAyCy
	BFO2fbqIHF0RkaOgUOWdgjLrNyXc06E+dhmDhUe6V1C70KdhFSh9LCNfF9wsLZmxi0SZNqXWVDc
	zp9cCjxMQF3c/YNbiRP91i4NMKpDzsTTei2KrpA==
X-Gm-Gg: ASbGncvWmTvc93Gu4MiFIGgkumEnXf+7rp9X8B35yjTWyK2wdeR05K6KGmzxRB1gvfh
	dulSpCWBAt6SuFgvVZVlJ+/rieUqSJbQ8HM4XBfrKK8euO13uFEjj0FB2hPEYNXq7eSRz/c6FOZ
	Y=
X-Google-Smtp-Source: AGHT+IFG/yEpW4K/pBHBk3/3BqLXGkFedpykl/V/VPy5N/H80JyAnUu1lUWvkGlaAAzc1oYTPiZqDlNAWdxjP6mgSAs=
X-Received: by 2002:a05:6a00:2d8e:b0:725:cfa3:bc76 with SMTP id
 d2e1a72fcca58-72fd0bce05cmr36986225b3a.4.1738650928448; Mon, 03 Feb 2025
 22:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
 <20250127-counter_delegation-v3-9-64894d7e16d5@rivosinc.com> <20250128-jubilance-mosaic-e3a81199aec8@spud>
In-Reply-To: <20250128-jubilance-mosaic-e3a81199aec8@spud>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 3 Feb 2025 22:35:18 -0800
X-Gm-Features: AWEUYZmuaq61PKoOBoJPiVshD43YM3UyPResBSMNdOEGC5qC9mJGFE-MKtc9ZW4
Message-ID: <CAHBxVyFVYwQ=aiB+RBrQNMQiu4K4uzPgyz8Tn=dUjeN8KKd=sw@mail.gmail.com>
Subject: Re: [PATCH v3 09/21] RISC-V: Add Smcntrpmf extension parsing
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_223530_101794_939119D0 
X-CRM114-Status: GOOD (  18.59  )
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

On Tue, Jan 28, 2025 at 10:11=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Jan 27, 2025 at 08:59:50PM -0800, Atish Patra wrote:
> > Smcntrpmf extension allows M-mode to enable privilege mode filtering
> > for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
> > only available only in Ssccfg only Smcntrpmf is present.
> >
> > That's why, kernel needs to detect presence of Smcntrpmf extension and
> > enable privilege mode filtering for cycle/instret counters.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h | 1 +
> >  arch/riscv/kernel/cpufeature.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index 2f5ef1dee7ac..42b34e2f80e8 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -104,6 +104,7 @@
> >  #define RISCV_ISA_EXT_SMCSRIND               95
> >  #define RISCV_ISA_EXT_SSCCFG            96
> >  #define RISCV_ISA_EXT_SMCDELEG          97
> > +#define RISCV_ISA_EXT_SMCNTRPMF         98
> >
> >  #define RISCV_ISA_EXT_XLINUXENVCFG   127
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index b584aa2d5bc3..ec068c9130e5 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -394,6 +394,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >       __RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
> >       __RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinux=
envcfg_exts),
> >       __RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
> > +     __RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
> >       __RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
>
> Isn't the order here wrong?
>  * 3. Standard supervisor-level extensions (starting with 'S') must be li=
sted
>  *    after standard unprivileged extensions.  If multiple supervisor-lev=
el
>  *    extensions are listed, they must be ordered alphabetically.

Yeah. Fixed it. Thanks for catching.

