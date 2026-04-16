Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695BCF8D755
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwtiaVNwpk1mGr4uhGnta3V8KmyM12FpBeR731AKa1U=; b=1gFY+chi4M+MLLg3EenRi7LWjK
	cjdAThym812/2zB1yrclEX3lagoDYXd6b+f76FizCyKYgv3liI3FyVVBHg/+xQZ+LRZ6mvRiFSE5t
	gs8PX5mICxo0Ga5kQ50FP2D1mZL/Q9XoseueNGCj1/sLe+uiV9dimwMb+T0oIje05Fmw8DpHaJgH6
	rFwT0oWjNMMkej5itPD1HVvG8rIIDQDdO3aAErAvAMJHpJOpRFUzNkD4ROegezPQdLZzCL6aIbhP3
	hFkkqIBRy8ev2zB1ZoDNtrYKT87EmzVfHK6NqYec/esTf/27x8ZUHJuZ+YAK7BGnsWS7LuooJwEVd
	H0kczbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOCM-00000002aLY-1o2j;
	Thu, 16 Apr 2026 15:00:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOCF-00000002aID-2nFS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:00:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3270848f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 07:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776351598; cv=none;
        d=google.com; s=arc-20240605;
        b=BHfXoubnMnTkXE14StV+AoDWYzaNtVecyHXeGN5T619ReGF3uT8fa34xpjhEiq1kT6
         uzzQcORNBEt55yRjRHX1TwDAKxJHw2PkadPMGULGYfUH1/OG4arT7xW6ZWBtcJ0bSfKN
         PQ2EkY2GSF44I6ACH28epAz3Y2fHw+SFsVZDSCr98cSTQUTyV5rPyh0e8eNh31EBqffP
         cMw54Aq+1FFP9iLVSysWxxYg/C99straEV420sdb8cHXsHoJt3T0Dz5hHQF5FwnPEax9
         3YzwbZrCUhJaSDq5FIpDYq2x8fKX0qJgFSqmvlIYaekh2IMS8TJtDuNcZrApzqgxBAhY
         tQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YwtiaVNwpk1mGr4uhGnta3V8KmyM12FpBeR731AKa1U=;
        fh=t3Bv5IlqBAGim4eYizjDzerqGaSjGI8bK9WblGMAc2k=;
        b=LfoPmxQ5ZNa6RxvkbQ8eSh7RVuUWCuzrZNETM9W+ZDeVb8yCsvAU+6mKicdoi2dXNN
         jAHPXDmnx6/JV1WbtHY4CycfRCx1+O1gsc0x7/AjYpYVi9rC/H/CynFupeZ1lVtANAdO
         GhAy3+yc2uioxNAMxAdOFGaDutGemNvcfwDbW9EFZuMwFaCamVKfgixzORBFTtmcrnSI
         DZJKozsyy1AsJx3NbDyBRkLI8lVUv3BWjGEOorZnrPCjE1tIkcZNMDBUyCQSpNlOnn71
         URUp4KmGTtghrBopE8RzLXCbUSYQ0h1hTR9Iewz36JQrCEXYQ2qErgPvCDyjoF1fFXhs
         YtPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776351598; x=1776956398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwtiaVNwpk1mGr4uhGnta3V8KmyM12FpBeR731AKa1U=;
        b=Iz8lwoKdLNHKNm+0W0wNRaK4QzmH0e0++oFxP5fiEVprKZF0eEu6wllgkJ7+dRwVc4
         mbQW+D6TEPWf52jLav7HxHThRd3B2K+4gkhS9ttzVWmOyfcpxO74cHNB1sijISuANJoU
         fAjjBstv2udPfpmYKDqqcitT+PrzBTI1AEp2HyNzwd6j3kro6jMcWylIHaMkjhtucxFX
         rKK5E2/v754A0/CdqeEiANRtm0jjVSWmav9hhDsJ/bhxoTsX4NSoLh+BteA3ETYGi2E5
         i0QindIPaa0vStSUUdowbKgiwRu38LucOVJWSxs7GHGvjOnS/MQBU9uv6xCRQajU/LB/
         KQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776351598; x=1776956398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YwtiaVNwpk1mGr4uhGnta3V8KmyM12FpBeR731AKa1U=;
        b=h9fw52CUvrO4ukctN7v4yzUvr4+OK62h5k2Ue7WxhQg/o4xZZC8vtq6+PMcjG6I4mS
         juQxK0qDcUrDlTCpmFDsV9jHAezIfq53iHUZ7mY5CulPBnm6qq6yUnH8j6M+j0Sg568a
         3rSvUQKtaE5aBDghOZGEcfJt47Bxow+Wshw4gHwkoR1UQZievedd+mlw6sun8RTyLxLQ
         vooYyhqvl5PZtXzARecx5Hx+XLvmedBS5WYmUhaXqRyE+J0XtVBAt6jjtTFS6gl+d1R2
         +m+RKRxdrxQVCd6i876sGD+kiZjUrUHzIV+xixOy/rDn8DyE4bfmK1Xf6kq3ZXnHOfOX
         GJMA==
X-Forwarded-Encrypted: i=1; AFNElJ88SKlmM/+q/sCDrEYdcSvt6HTQDljrpx/kU1ExQSC3lcsUFpfOZ9+77/nWeB9LoEfdpYWDc6bD07KFeO+EALLF@lists.infradead.org
X-Gm-Message-State: AOJu0YwLxnEPUYC9MSH+d0odGOjzdMm0jXziNEEgiKaCEPxzmTEFQAgX
	PMaEFRuHH93tKzUpZFXA8TGoaMxpN/LYNdOrQM5AgXsX637dhfW+Xar8KcnWl2aZhr4XgH6m8Vr
	q1VkFsQ0N4ISW2uDGzlFPsDFiLxqijIk=
X-Gm-Gg: AeBDietnmtpfcJCHLDvUehOglRrJfiDoLayWEWqhQPZMnyAYri1J2mAkh67WV+Js05F
	2oexRclSOL+aK0kxjzZaau0nvi8TE+B+wptC9bRfzmOnxrAGj4De2/eLstKHtVsoxZ1flwgnrOh
	YMfpRr/9iXAIq76xCrUlc+5rnQCte1MxuJjnAdUGCrzZjRrdxv4JYW0Tp4sgB/ovZNpNdiqe4o4
	xvaI/WMiZFzhO+19ySLKTfuYUnENYbL04r81fDj3HdCZmBImLy/+E8RJAFPKzEnxGrkDPwWdubV
	jBzXbIs=
X-Received: by 2002:a5d:5304:0:b0:43d:7783:c67e with SMTP id
 ffacd0b85a97d-43d7783c7f7mr17786998f8f.36.1776351597405; Thu, 16 Apr 2026
 07:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260318150245.3080719-1-demyansh@gmail.com> <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com>
 <acJhCCPfVxjFUZ5R@J2N7QTR9R3> <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
 <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com> <20260331063659.GA2061@lst.de>
 <CAOLeWCtnZz=kHGk4C2f9Mbfi3tEBE100iCkMBhcG47dmR9eDWw@mail.gmail.com>
 <CAOLeWCtxPk7q_bVvrcKaipSKr+_=57Auobcj0cFRvXxXMdH58g@mail.gmail.com> <5158e4e0-3275-4c29-a8fc-2dfabc13a69d@app.fastmail.com>
In-Reply-To: <5158e4e0-3275-4c29-a8fc-2dfabc13a69d@app.fastmail.com>
From: Demian Shulhan <demyansh@gmail.com>
Date: Thu, 16 Apr 2026 17:59:44 +0300
X-Gm-Features: AQROBzDLy0IwEiyidCbsFQDNqZsyt5uOErIxdzrMPPdDqO5qPcJrPEd_3UcAqSQ
Message-ID: <CAOLeWCtf2rZyPeJH-LuZ2A+c7mC9M2r-Ya0VjyOJFpun3TFMnw@mail.gmail.com>
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Mark Rutland <mark.rutland@arm.com>, Song Liu <song@kernel.org>, 
	Yu Kuai <yukuai@fnnas.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, 
	Li Nan <linan122@huawei.com>, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_075959_760162_570F4DD4 
X-CRM114-Status: GOOD (  39.20  )
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

Hi Ard!

> So what exactly did you fix in your test case?

I just added the missing memset. You're right, "aliasing" was the
wrong term for PIP.

> This is the result where all data buffer pointers point to the same
> memory, right? I.e., the zero page? So this is an unrealistic use
> case that we can disregard.

Yes, that's right. It was a flaw in my previous test setup.

> Sorry but your result that SVE is 2x faster does not remain fully intact,
> right? Given that the speedup is now 5.5%?
> Should we just disregard the above results (and explanations) and focus
> on the stuff below?

Yes, it's better to focus on the data from SnapRAID. It was made on
larger blocks and a wider range of disks, providing more realistic
metrics.

> OK, so the takeaway here is that SVE is only worth the hassle if the vect=
or
> length is at least 256 bits. This is not entirely surprising, but given t=
hat
> Graviton4 went back to 128 bit vectors from 256, I wonder what the future
> expectation is here.

I agree. The results from the SnapRAID tests are not as impressive as
I hoped, and the fact that Neoverse-V2 went back to 128-bit is a red
flag. It suggests that wide SVE registers might not be a priority in
future architecture versions.

> These results seem very relevant - perhaps Christoph can give some guidan=
ce
> on how we might use these to improve the built-in benchmarks to be more
> accurate.

This is the most important part of this report, I think. SVE looks
good only like my first idea on paper but in the real scenario it
brings more problems than benefits.

I=E2=80=99m happy to drop the SVE implementation for now and instead focus =
on
modernizing the built-in benchmarks to ensure the kernel chooses the
best available NEON path for actual storage workloads.

If you give me the green flag for it, I can start working on improving
these built-in tests.

Best regards,
Demian


=D1=87=D1=82, 16 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:4=
0 Ard Biesheuvel <ardb@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Demian,
>
> On Thu, 16 Apr 2026, at 14:40, Demian Shulhan wrote:
> > Hi all,
> >
> > Sorry for the delay. The tests became more complex than I initially
> > thought, so I needed to gather more data and properly validate the
> > results across different hardware configurations.
> >
> > Firstly, I want to clarify the results from my March 29 tests. I found
> > a flaw in my initial custom benchmark. The massive 2x throughput gap on
> > 24 disks wasn't solely due to SVE's superiority, but rather a severe L1
> > D-Cache thrashing issue that disproportionately penalized NEON.
> >
> > My custom test lacked memset() initialization, causing all data buffers
> > to map to the Linux Zero Page (Virtually Indexed, Physically Tagged
> > cache aliasing).
>
> D-caches always behave as PIPT on arm64. This is complex stuff, so please
> don't present conjecture as fact.
>
> > Furthermore, even with memset(), allocating contiguous
> > page-aligned buffers can causes severe Cache Address Sharing (a known
> > issue that Andrea Mazzoleni solved in SnapRAID 13 years ago using
> > RAID_MALLOC_DISPLACEMENT).
> >
> > Because SVE (svex4) uses 256-bit registers on Neoverse-V1, it performs
> > exactly half the number of memory load instructions compared to 128-bit
> > NEON. This dramatically reduced the L1 cache alias thrashing, allowing
> > SVE to survive the memory bottleneck while NEON choked:
> >
>
> You are drawing some conclusions here without disclosing the actual
> information that you based this on. D-caches are non-aliasing on arm64.
>
> So what exactly did you fix in your test case?
>
> > Custom test without memset (4kb block):
> >  | algo=3Dneonx4 ndisks=3D24 iterations=3D1M time=3D11.014s MB/s=3D7802=
.57
> >  | algo=3Dsvex4  ndisks=3D24 iterations=3D1M time=3D5.719s  MB/s=3D1502=
6.92
> >
>
> This is the result where all data buffer pointers point to the same
> memory, right? I.e., the zero page? So this is an unrealistic use
> case that we can disregard.
>
> > Custom test with memset (4kb block):
> >  | algo=3Dneonx4 ndisks=3D24 iterations=3D1M time=3D6.165s  MB/s=3D1393=
9.08
> >  | algo=3Dsvex4  ndisks=3D24 iterations=3D1M time=3D5.839s  MB/s=3D1471=
8.23
> >
> > Even with the corrected memory setup, the throughput gap narrowed, but
> > the fundamental CPU-efficiency result remained fully intact.
> >
>
> Sorry but your result that SVE is 2x faster does not remain fully intact,
> right? Given that the speedup is now 5.5%?
>
> Should we just disregard the above results (and explanations) and focus
> on the stuff below?
>
> > To completely isolate these variables and provide accurate real-world
> > data, the following test campaigns were done based on the SnapRAID
> > project (https://github.com/amadvance/snapraid) using its
> > perf_bench.c tool with proper memory displacement and a 256 KiB block
> > size.
> >
> > Test configurations:
> > - c7g.medium (AWS Graviton3, 1 vCPU): Neoverse-V1, 256-bit SVE
> > - c7g.xlarge (AWS Graviton3, 4 vCPUs): Neoverse-V1, 256-bit SVE
> > - c8g.xlarge (AWS Graviton4, 4 vCPUs): Neoverse-V2, 128-bit SVE
> >
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Section 1: SnapRAID Validation on Graviton3 / Neoverse-V1
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> ...
> >
> > 1.3 Main Graviton3 Conclusions
> >  - On 256-bit SVE hardware, svex4 consistently retires about ~34% fewer
> >    instructions and ~10-15% fewer CPU cycles than neonx4.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Section 2: SnapRAID Validation on Graviton4 / Neoverse-V2
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> ...
> >
> > 2.3 Main Graviton4 Conclusions
> >  - On Neoverse-V2, SVE vector length is 128-bit (same as NEON).
> >  - Without the 256-bit width, NEON outperforms SVE.
> >  - svex4 retires ~32% MORE instructions here and is consistently slower=
.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Section 3: Validation on c7g.medium (1 vCPU)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> ...
> > 3.3 Main c7g.medium Conclusions
> >  - The instruction count reduction (~34%) perfectly matches the 4-vCPU
> >    instance.
> >  - The single vCPU is heavily memory-bandwidth constrained (cycle count=
s
> >    are much higher waiting for RAM).
> >
>
> OK, so the takeaway here is that SVE is only worth the hassle if the vect=
or
> length is at least 256 bits. This is not entirely surprising, but given t=
hat
> Graviton4 went back to 128 bit vectors from 256, I wonder what the future
> expectation is here.
>
> But having these numbers is definitely a good first step. Now we need to
> quantify the overhead associated with having kernel mode SVE state that
> needs to be preserved/restored.
>
> However, 10%-15% speedup that can only be achieved on SVE implementations
> with 256 bit vectors or more may not be that enticing in the end. (The
> fact that you are retiring 34% instructions less does not really matter
> here unless there is some meaningful SMT-like sharing of functional units
> going on in the meantime, which seems unlikely on a CPU that is maxed out
> on the data side)
>
>
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Section 4: The Pitfalls of the Current Kernel Benchmark
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
>
> These results seem very relevant - perhaps Christoph can give some guidan=
ce
> on how we might use these to improve the built-in benchmarks to be more
> accurate.
>
>
> Thanks,
>

