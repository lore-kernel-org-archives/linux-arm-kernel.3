Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B36F3D603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYt11iHcXkGrRLsndy/okjWcC0n40t6TqkA1jNRd/ok=; b=CkNY3cKJVLy3dWPu1YPu76n0Q9
	zsTwO0yNrMmTIHcNl7hHnC3jzQGbCPvAJG6ztNXVrV18D1iRR581fC8W9WkANz7U2U/mQ+Poj4l67
	qlWjM1skbjDl3KjIE315ELe9ssMRIKaDXrMCnS74hdqLQphQDbEl07J6LsTj7qodbgnCsqC7QdasM
	KgXqRw4WbIUw6eOryc4WbRXCWoE3wqeWUUkhKO3oGj/IUA5qLXF3IqQ7G/2S6/hgXcHtF8Dtw5vaP
	+Qgo19D/SGUV7z4fTTia3uI1ieE1hUuAMtNcjYEJTqcRQKvEuYraqD5QBr89q2ebsbGpQ6x3h0sS4
	NM6jG2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6plb-00000009wO3-0Q1j;
	Sun, 29 Mar 2026 13:01:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6plY-00000009wNi-3WXO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 13:01:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-482f454be5bso42854235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 06:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774789279; cv=none;
        d=google.com; s=arc-20240605;
        b=VsMQ2uG4z/zBmZuJdOH5VsmbwC+OlRcVjveu3ruwfSFSJE6umnV4v67TZDj3nHkaU+
         6fOrAmw/yieopw9HFK6gelJUaZGx5p7bvdPE7esgEyAusgtpv9touK80XeFZpT/dn+Bk
         /PUcTy0TQxDIMGgvUTB8F+djwhTXZfWOA7qnYf4pVoPG/RRMeSN2bE18NJ96a0maQr0i
         Mx6SQru4Ho+bQVPvJs8QLKx2mhjbB/XsxLmysae1+D0XA97FJY+3BjLz5l7LaLq9yzSn
         ZLChGxh8Rx+Q1U/G/IoMAJFi7THckU4hAxHBYMb4VSA4klbnMdik8MXdM81jc01xJpR+
         w1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PYt11iHcXkGrRLsndy/okjWcC0n40t6TqkA1jNRd/ok=;
        fh=f6kERvvVp4R7HhkTmF6F8mCGiwYulaw1977t6KkhJqo=;
        b=BZlF4KZonmaD4Igt8HHo4mZkX6Z4es7I9AK/l+nZscT3UYtg7osV0xl8Kf0yaU2USf
         /BPlJyQdHCyShBw1peRo9VpVlnQU6c/fIYrX00tOf+fR089zgYyqoW3J4fJQAMf/+/7k
         PbrIPW6S6qyRC5f0Kt1t4fSEoGzJuwQStMoCqtEyaMshvXydSd2l4x9AUGoydkksKRGk
         zMsJV/CZKOYYMC8W3RMpYb3ngSi9S6hYJgs6ykyYLGHWCOJZnbshsiDhEK81crlwSYeA
         Had2QZVeRDbJVCVxe8q54xlo7Wb90vTs39moTnBkWtEqytqTy4MDpozHsqo93vpfW0Wx
         PYKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774789279; x=1775394079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYt11iHcXkGrRLsndy/okjWcC0n40t6TqkA1jNRd/ok=;
        b=fRbJ8vYEcYHO1u++WY0Og1pWzefxilZiHsV0M9wZyYrDTQr8v6hxiTAtfEC9xm2m7g
         BA46EW5x8XcJ2mWHa/xHM9c21bbgUvBcJPn4Oi+qnr063MklVeGf+BDaEfmI/eedI55S
         JC/1u+/StE3er16peTin7AFbda2ZIieQBjUsb4v8nKNzdfcgj2UZvkMOYf9JCIjtPV85
         eg2Mu38EP6I3vNXyd4T+COCH8VEkqinwunLawZ1US5J+PQTd0NQtUV4Ma+A+Ql3ehsYy
         OMfEkMJdoaBFPk851g5BmZj9rYz34fzH8EZlUOhzsdUUtjANyzviI8vkYaBqBOCylsbd
         BBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774789279; x=1775394079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PYt11iHcXkGrRLsndy/okjWcC0n40t6TqkA1jNRd/ok=;
        b=JA3jYEdwVVOaRgna6o0DHmkB+lkkjGr+VLgYOA0MV6b63npv90sTf4FX5eCMCdTJ2Z
         6R94/mAFhU8bZHJr2mtn81Q3ZxQ1Hngp45MRbE8gKLljzzi5+8IMjhAEkBNV+DBW3iDN
         nGNydtmWGJsPdaffHtJbZ2iYYUKgvgPX4PinxYUauhRgZlJqwEvjhROn65EqWHxxRnP4
         bygQmkOSwKqDD+FHwYZpS8TFQfmllFP79OvSL04CAwBxYg8Jue1mEc30kebjF6lWuLnd
         zlRssPgpT9mFHJ/viDJM3so/tY57R2UFi5zqnAnKBn8pNrAgBcStzoJ7S/K+N1WKMFhg
         OBWw==
X-Forwarded-Encrypted: i=1; AJvYcCWpJvN0oFT+5/ErX/XM/heR4w09P5kqeYWwTRPcZ8INhSuG/2VV66z+hPsWc97zzN5A9INN9V8MGQmotryPXry9@lists.infradead.org
X-Gm-Message-State: AOJu0YyAWoZcpl9/BfYB/03q1IFklH+URTHz/jKqQZ2pKW66pKtkoF4f
	2kLncOXUsLPk3gnxw3vr0djphIaM7NgZi/sut8UXvdlLnXjnK+MkckUtAEMcZUOcyVR4oNWX3X5
	5ndyJ0pZVb729UKKaBYRzgh/mVPJ/euI=
X-Gm-Gg: ATEYQzw0SKQ8yEENARkbOcJWIIhFqss2PsGdb8tu0tczEb8FsQWj4qN9UEzl2j3OdmI
	blCT1YSRX5nKIgJnvJf/cIB9GsgNQIjlIbZVT6D2bNJyc6v87IyGYs+/Tf8rDG1ZsGotCnc0ZHp
	FS2VKWIjmbugouSeBjyRj6Km1sAcDqWnNidOx3cTTyucA5FPk/rmnyuyBd/Eno7CbMQ11mOwvo8
	2k6Qj0Y5hyHy4OnnxoHlOv30KRrcQlGUqqktIla8HkJGf9cc8VobV/6J9BJ2oijMlnT3EQw/Ifx
	BK9DAw==
X-Received: by 2002:a05:600c:4e0b:b0:485:fbd2:f72 with SMTP id
 5b1f17b1804b1-487290a9254mr131656115e9.1.1774789278170; Sun, 29 Mar 2026
 06:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260318150245.3080719-1-demyansh@gmail.com> <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com>
 <acJhCCPfVxjFUZ5R@J2N7QTR9R3>
In-Reply-To: <acJhCCPfVxjFUZ5R@J2N7QTR9R3>
From: Demian Shulhan <demyansh@gmail.com>
Date: Sun, 29 Mar 2026 16:01:06 +0300
X-Gm-Features: AQROBzBUejgPmLAZaZaQu5zoL579N1XUI9bVH7hZhwLf8KiFtHltcoB24yvK3I0
Message-ID: <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for
 syndrome generation
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Song Liu <song@kernel.org>, 
	Yu Kuai <yukuai@fnnas.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, broonie@kernel.org, 
	linux-arm-kernel@lists.infradead.org, robin.murphy@arm.com, 
	Li Nan <linan122@huawei.com>, linux-raid@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_060121_139998_CB0BCAD3 
X-CRM114-Status: GOOD (  44.65  )
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

Hi all,

Thanks for the feedback and for clarifying the current limitations of
the kernel-mode SIMD API regarding SVE context preservation. I
completely understand why this patch cannot be merged in its current
state until the fundamental SVE infrastructure is in place.However, I
want to address the comment about the marginal 0.3% speedup on the
8-disk benchmark. While the pure memory bandwidth on a small array is
indeed bottlenecked, it doesn't reveal the whole picture. I extracted
the SVE and NEON implementations into a user-space benchmark to
measure the actual hardware efficiency using perf stat, running on the
same AWS Graviton3 (Neoverse-V1) instance.The results show a massive
difference in CPU efficiency. For the same 8-disk workload, the svex4
implementation requires about 35% fewer instructions and 46% fewer CPU
cycles compared to neonx4 (7.58 billion instructions vs 11.62
billion). This translates directly into significant energy savings and
reduced pressure on the CPU frontend, which would leave more compute
resources available for network and NVMe queues during an array
rebuild.

Furthermore, as Christoph suggested, I tested scalability on wider
arrays since the default kernel benchmark is hardcoded to 8 disks,
which doesn't give the unrolled SVE loop enough data to shine. On a
16-disk array, svex4 hits 15.1 GB/s compared to 8.0 GB/s for neonx4.
On a 24-disk array, while neonx4 chokes and drops to 7.8 GB/s, svex4
maintains a stable 15.0 GB/s =E2=80=94 effectively doubling the throughput.=
I
agree this patch should be put on hold for now. My intention is to
leave these numbers here as evidence that implementing SVE context
preservation in the kernel (the "good use case") is highly justifiable
from both a power-efficiency and a wide-array throughput perspective
for modern ARM64 hardware.

Thanks again for your time and time and review!

---------------------------------------------------
User space test results:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    RAID6 SVE Benchmark Results (AWS Graviton3)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Instance Details:
Linux ip-172-31-87-234 6.8.0-1047-aws #50~22.04.1-Ubuntu SMP Thu Feb
19 20:49:25 UTC 2026 aarch64 aarch64 aarch64 GNU/Linux
--------------------------------------------------

[Test 1: Energy Efficiency / Instruction Count (8 disks)]
Running baseline (neonx4)...
algo=3Dneonx4 ndisks=3D8 iterations=3D1000000 time=3D2.681s MB/s=3D8741.36

Running SVE (svex1)...

 Performance counter stats for './raid6_bench neonx4 8 1000000':

       11626717224      instructions                     #    1.67
insn per cycle
        6946699489      cycles
         257013219      L1-dcache-load-misses

       2.681213149 seconds time elapsed

       2.676771000 seconds user
       0.002000000 seconds sys


algo=3Dsvex1 ndisks=3D8 iterations=3D1000000 time=3D1.688s MB/s=3D13885.23

 Performance counter stats for './raid6_bench svex1 8 1000000':

       10527277490
Running SVE unrolled x4 (svex4)...
     instructions                     #    2.40  insn per cycle
        4379539835      cycles
         175695656      L1-dcache-load-misses

       1.688852006 seconds time elapsed

       1.687298000 seconds user
       0.000999000 seconds sys


algo=3Dsvex4 ndisks=3D8 iterations=3D1000000 time=3D1.445s MB/s=3D16215.04

 Performance counter stats for './raid6_bench svex4 8 1000000':

        7587813392      instructions
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[Test 2: Scalability on Wide RAID Arrays (MB/s)]
--- 16 Disks ---
 #    2.02  insn per cycle
        3748486131      cycles
         213816184      L1-dcache-load-misses

       1.446032415 seconds time elapsed

       1.442412000 seconds user
       0.002996000 seconds sys


algo=3Dneonx4 ndisks=3D16 iterations=3D1000000 time=3D6.783s MB/s=3D8062.33
algo=3Dsvex1 ndisks=3D16 iterations=3D1000000 time=3D4.912s MB/s=3D11132.90
algo=3Dsvex4 ndisks=3D16 iterations=3D1000000 time=3D3.601s MB/s=3D15188.85

--- 24 Disks ---
algo=3Dneonx4 ndisks=3D24 iterations=3D1000000 time=3D11.011s MB/s=3D7805.0=
2
algo=3Dsvex1 ndisks=3D24 iterations=3D1000000 time=3D8.843s MB/s=3D9718.26
algo=3Dsvex4 ndisks=3D24 iterations=3D1000000 time=3D5.719s MB/s=3D15026.92

Extra tests:
--- 48 Disks ---
algo=3Dneonx4 ndisks=3D48 iterations=3D500000 time=3D11.826s MB/s=3D7597.25
algo=3Dsvex4 ndisks=3D48 iterations=3D500000 time=3D5.808s MB/s=3D15468.10
--- 96 Disks ---
algo=3Dneonx4 ndisks=3D96 iterations=3D200000 time=3D9.783s MB/s=3D7507.01
algo=3Dsvex4 ndisks=3D96 iterations=3D200000 time=3D4.701s MB/s=3D15621.17
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

=D0=B2=D1=82, 24 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:05 Mark=
 Rutland <mark.rutland@arm.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Mar 24, 2026 at 09:00:16AM +0100, Ard Biesheuvel wrote:
> > On Wed, 18 Mar 2026, at 16:02, Demian Shulhan wrote:
> > > Implement Scalable Vector Extension (SVE) optimized routines for RAID=
6
> > > syndrome generation and recovery on ARM64.
> > >
> > > The SVE instruction set allows for variable vector lengths (from 128 =
to
> > > 2048 bits), scaling automatically with the hardware capabilities. Thi=
s
> > > implementation handles arbitrary SVE vector lengths using the `cntb`
> > > instruction to determine the runtime vector length.
> > >
> > > The implementation introduces `svex1`, `svex2`, and `svex4` algorithm=
s.
> > > The `svex4` algorithm utilizes loop unrolling by 4 blocks per iterati=
on
> > > and manual software pipelining (interleaving memory loads with XORs)
> > > to minimize instruction dependency stalls and maximize CPU pipeline
> > > utilization and memory bandwidth.
> > >
> > > Performance was tested on an AWS Graviton3 (Neoverse-V1) instance whi=
ch
> > > features 256-bit SVE vector length. The `svex4` implementation outper=
forms
> > > the existing 128-bit `neonx4` baseline for syndrome generation:
> > >
> > > raid6: svex4    gen() 19688 MB/s
> > ...
> > > raid6: neonx4   gen() 19612 MB/s
> >
> > You're being very generous characterising a 0.3% speedup as 'outperform=
s'
> >
> > But the real problem here is that the kernel-mode SIMD API only
> > supports NEON and not SVE, and preserves/restores only the 128-bit
> > view on the NEON/SVE register file. So any context switch or softirq
> > that uses kernel-mode SIMD too, and your SVE register values will get
> > truncated.
>
> Just to be a bit more explicit, since only the NEON register file is
> saved:
>
> * The vector registers will be truncated to 128-bit across
>   preemption or softirq.
>
> * The predicates won't be saved/restored and will change arbitrarily
>   across preemption.
>
> * The VL won't be saved/restored, and might change arbitrarily across
>   preemption.
>
> * The VL to use hasn't been programmed, so performance might vary
>   arbitrarily even in the absence of preemption.
>
> ... so this isn't even safe on machines with (only) a 128-bit VL, and
> there are big open design questions for the infrastructure we'd need.
>
> > Once we encounter a good use case for SVE in the kernel, we might
> > reconsider this, but as it stands, this patch should not be applied.
>
> I agree.
>
> Christoph, please do not pick this or any other in-kernel SVE patches.
> They cannot function correctly without additional infrastructure.
>
> Demian, for patches that use NEON/SVE/SME/etc, please Cc LAKML
> (linux-arm-kernel@lists.infradead.org), so that folk familiar with ARM
> see the patches.
>
> Mark
>
> > (leaving the reply untrimmed for the benefit of the cc'ees I added)
> >
> > > raid6: neonx2   gen() 16248 MB/s
> > > raid6: neonx1   gen() 13591 MB/s
> > > raid6: using algorithm svex4 gen() 19688 MB/s
> > > raid6: .... xor() 11212 MB/s, rmw enabled
> > > raid6: using neon recovery algorithm
> > >
> > > Note that for the recovery path (`xor_syndrome`), NEON may still be
> > > selected dynamically by the algorithm benchmark, as the recovery
> > > workload is heavily memory-bound.
> > >
> > > Signed-off-by: Demian Shulhan <demyansh@gmail.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202603181940.cFwYmYoi-lkp@intel=
.com/
> > > ---
> > >  include/linux/raid/pq.h |   3 +
> > >  lib/raid6/Makefile      |   5 +
> > >  lib/raid6/algos.c       |   5 +
> > >  lib/raid6/sve.c         | 675 ++++++++++++++++++++++++++++++++++++++=
++
> > >  4 files changed, 688 insertions(+)
> > >  create mode 100644 lib/raid6/sve.c
> > >
> > > diff --git a/include/linux/raid/pq.h b/include/linux/raid/pq.h
> > > index 2467b3be15c9..787cc57aea9d 100644
> > > --- a/include/linux/raid/pq.h
> > > +++ b/include/linux/raid/pq.h
> > > @@ -140,6 +140,9 @@ extern const struct raid6_calls raid6_neonx1;
> > >  extern const struct raid6_calls raid6_neonx2;
> > >  extern const struct raid6_calls raid6_neonx4;
> > >  extern const struct raid6_calls raid6_neonx8;
> > > +extern const struct raid6_calls raid6_svex1;
> > > +extern const struct raid6_calls raid6_svex2;
> > > +extern const struct raid6_calls raid6_svex4;
> > >
> > >  /* Algorithm list */
> > >  extern const struct raid6_calls * const raid6_algos[];
> > > diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> > > index 5be0a4e60ab1..6cdaa6f206fb 100644
> > > --- a/lib/raid6/Makefile
> > > +++ b/lib/raid6/Makefile
> > > @@ -8,6 +8,7 @@ raid6_pq-$(CONFIG_X86) +=3D recov_ssse3.o recov_avx2.=
o
> > > mmx.o sse1.o sse2.o avx2.o
> > >  raid6_pq-$(CONFIG_ALTIVEC) +=3D altivec1.o altivec2.o altivec4.o
> > > altivec8.o \
> > >                                vpermxor1.o vpermxor2.o vpermxor4.o
> > > vpermxor8.o
> > >  raid6_pq-$(CONFIG_KERNEL_MODE_NEON) +=3D neon.o neon1.o neon2.o neon=
4.o
> > > neon8.o recov_neon.o recov_neon_inner.o
> > > +raid6_pq-$(CONFIG_ARM64_SVE) +=3D sve.o
> > >  raid6_pq-$(CONFIG_S390) +=3D s390vx8.o recov_s390xc.o
> > >  raid6_pq-$(CONFIG_LOONGARCH) +=3D loongarch_simd.o recov_loongarch_s=
imd.o
> > >  raid6_pq-$(CONFIG_RISCV_ISA_V) +=3D rvv.o recov_rvv.o
> > > @@ -67,6 +68,10 @@ CFLAGS_REMOVE_neon2.o +=3D $(CC_FLAGS_NO_FPU)
> > >  CFLAGS_REMOVE_neon4.o +=3D $(CC_FLAGS_NO_FPU)
> > >  CFLAGS_REMOVE_neon8.o +=3D $(CC_FLAGS_NO_FPU)
> > >  CFLAGS_REMOVE_recov_neon_inner.o +=3D $(CC_FLAGS_NO_FPU)
> > > +
> > > +CFLAGS_sve.o +=3D $(CC_FLAGS_FPU)
> > > +CFLAGS_REMOVE_sve.o +=3D $(CC_FLAGS_NO_FPU)
> > > +
> > >  targets +=3D neon1.c neon2.c neon4.c neon8.c
> > >  $(obj)/neon%.c: $(src)/neon.uc $(src)/unroll.awk FORCE
> > >     $(call if_changed,unroll)
> > > diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
> > > index 799e0e5eac26..0ae73c3a4be3 100644
> > > --- a/lib/raid6/algos.c
> > > +++ b/lib/raid6/algos.c
> > > @@ -66,6 +66,11 @@ const struct raid6_calls * const raid6_algos[] =3D=
 {
> > >     &raid6_neonx2,
> > >     &raid6_neonx1,
> > >  #endif
> > > +#ifdef CONFIG_ARM64_SVE
> > > +   &raid6_svex4,
> > > +   &raid6_svex2,
> > > +   &raid6_svex1,
> > > +#endif
> > >  #ifdef CONFIG_LOONGARCH
> > >  #ifdef CONFIG_CPU_HAS_LASX
> > >     &raid6_lasx,
> > > diff --git a/lib/raid6/sve.c b/lib/raid6/sve.c
> > > new file mode 100644
> > > index 000000000000..d52937f806d4
> > > --- /dev/null
> > > +++ b/lib/raid6/sve.c
> > > @@ -0,0 +1,675 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * RAID-6 syndrome calculation using ARM SVE instructions
> > > + */
> > > +
> > > +#include <linux/raid/pq.h>
> > > +
> > > +#ifdef __KERNEL__
> > > +#include <asm/simd.h>
> > > +#include <linux/cpufeature.h>
> > > +#else
> > > +#define scoped_ksimd()
> > > +#define system_supports_sve() (1)
> > > +#endif
> > > +
> > > +static void raid6_sve1_gen_syndrome_real(int disks, unsigned long
> > > bytes, void **ptrs)
> > > +{
> > > +   u8 **dptr =3D (u8 **)ptrs;
> > > +   u8 *p, *q;
> > > +   long z0 =3D disks - 3;
> > > +
> > > +   p =3D dptr[z0 + 1];
> > > +   q =3D dptr[z0 + 2];
> > > +
> > > +   asm volatile(
> > > +           ".arch armv8.2-a+sve\n"
> > > +           "ptrue p0.b\n"
> > > +           "cntb x3\n"
> > > +           "mov w4, #0x1d\n"
> > > +           "dup z4.b, w4\n"
> > > +           "mov x5, #0\n"
> > > +
> > > +           "0:\n"
> > > +           "ldr x6, [%[dptr], %[z0], lsl #3]\n"
> > > +           "ld1b z0.b, p0/z, [x6, x5]\n"
> > > +           "mov z1.d, z0.d\n"
> > > +
> > > +           "mov w7, %w[z0]\n"
> > > +           "sub w7, w7, #1\n"
> > > +
> > > +           "1:\n"
> > > +           "cmp w7, #0\n"
> > > +           "blt 2f\n"
> > > +
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +
> > > +           "sxtw x8, w7\n"
> > > +           "ldr x6, [%[dptr], x8, lsl #3]\n"
> > > +           "ld1b z2.b, p0/z, [x6, x5]\n"
> > > +
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +           "eor z0.d, z0.d, z2.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 1b\n"
> > > +           "2:\n"
> > > +
> > > +           "st1b z0.b, p0, [%[p], x5]\n"
> > > +           "st1b z1.b, p0, [%[q], x5]\n"
> > > +
> > > +           "add x5, x5, x3\n"
> > > +           "cmp x5, %[bytes]\n"
> > > +           "blt 0b\n"
> > > +           :
> > > +           : [dptr] "r" (dptr), [z0] "r" (z0), [bytes] "r" (bytes),
> > > +             [p] "r" (p), [q] "r" (q)
> > > +           : "memory", "p0", "x3", "x4", "x5", "x6", "x7", "x8",
> > > +             "z0", "z1", "z2", "z3", "z4"
> > > +   );
> > > +}
> > > +
> > > +static void raid6_sve1_xor_syndrome_real(int disks, int start, int
> > > stop,
> > > +                                    unsigned long bytes, void **ptrs=
)
> > > +{
> > > +   u8 **dptr =3D (u8 **)ptrs;
> > > +   u8 *p, *q;
> > > +   long z0 =3D stop;
> > > +
> > > +   p =3D dptr[disks - 2];
> > > +   q =3D dptr[disks - 1];
> > > +
> > > +   asm volatile(
> > > +           ".arch armv8.2-a+sve\n"
> > > +           "ptrue p0.b\n"
> > > +           "cntb x3\n"
> > > +           "mov w4, #0x1d\n"
> > > +           "dup z4.b, w4\n"
> > > +           "mov x5, #0\n"
> > > +
> > > +           "0:\n"
> > > +           "ldr x6, [%[dptr], %[z0], lsl #3]\n"
> > > +           "ld1b z1.b, p0/z, [x6, x5]\n"
> > > +           "ld1b z0.b, p0/z, [%[p], x5]\n"
> > > +           "eor z0.d, z0.d, z1.d\n"
> > > +
> > > +           "mov w7, %w[z0]\n"
> > > +           "sub w7, w7, #1\n"
> > > +
> > > +           "1:\n"
> > > +           "cmp w7, %w[start]\n"
> > > +           "blt 2f\n"
> > > +
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +
> > > +           "sxtw x8, w7\n"
> > > +           "ldr x6, [%[dptr], x8, lsl #3]\n"
> > > +           "ld1b z2.b, p0/z, [x6, x5]\n"
> > > +
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +           "eor z0.d, z0.d, z2.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 1b\n"
> > > +           "2:\n"
> > > +
> > > +           "mov w7, %w[start]\n"
> > > +           "sub w7, w7, #1\n"
> > > +           "3:\n"
> > > +           "cmp w7, #0\n"
> > > +           "blt 4f\n"
> > > +
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 3b\n"
> > > +           "4:\n"
> > > +
> > > +           "ld1b z2.b, p0/z, [%[q], x5]\n"
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +
> > > +           "st1b z0.b, p0, [%[p], x5]\n"
> > > +           "st1b z1.b, p0, [%[q], x5]\n"
> > > +
> > > +           "add x5, x5, x3\n"
> > > +           "cmp x5, %[bytes]\n"
> > > +           "blt 0b\n"
> > > +           :
> > > +           : [dptr] "r" (dptr), [z0] "r" (z0), [bytes] "r" (bytes),
> > > +             [p] "r" (p), [q] "r" (q), [start] "r" (start)
> > > +           : "memory", "p0", "x3", "x4", "x5", "x6", "x7", "x8",
> > > +             "z0", "z1", "z2", "z3", "z4"
> > > +   );
> > > +}
> > > +
> > > +static void raid6_sve2_gen_syndrome_real(int disks, unsigned long
> > > bytes, void **ptrs)
> > > +{
> > > +   u8 **dptr =3D (u8 **)ptrs;
> > > +   u8 *p, *q;
> > > +   long z0 =3D disks - 3;
> > > +
> > > +   p =3D dptr[z0 + 1];
> > > +   q =3D dptr[z0 + 2];
> > > +
> > > +   asm volatile(
> > > +           ".arch armv8.2-a+sve\n"
> > > +           "ptrue p0.b\n"
> > > +           "cntb x3\n"
> > > +           "mov w4, #0x1d\n"
> > > +           "dup z4.b, w4\n"
> > > +           "mov x5, #0\n"
> > > +
> > > +           "0:\n"
> > > +           "ldr x6, [%[dptr], %[z0], lsl #3]\n"
> > > +           "ld1b z0.b, p0/z, [x6, x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z5.b, p0/z, [x6, x8]\n"
> > > +           "mov z1.d, z0.d\n"
> > > +           "mov z6.d, z5.d\n"
> > > +
> > > +           "mov w7, %w[z0]\n"
> > > +           "sub w7, w7, #1\n"
> > > +
> > > +           "1:\n"
> > > +           "cmp w7, #0\n"
> > > +           "blt 2f\n"
> > > +
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +
> > > +           "mov z8.d, z6.d\n"
> > > +           "asr z8.b, p0/m, z8.b, #7\n"
> > > +           "lsl z6.b, p0/m, z6.b, #1\n"
> > > +           "and z8.d, z8.d, z4.d\n"
> > > +           "eor z6.d, z6.d, z8.d\n"
> > > +
> > > +           "sxtw x8, w7\n"
> > > +           "ldr x6, [%[dptr], x8, lsl #3]\n"
> > > +           "ld1b z2.b, p0/z, [x6, x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z7.b, p0/z, [x6, x8]\n"
> > > +
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +           "eor z0.d, z0.d, z2.d\n"
> > > +
> > > +           "eor z6.d, z6.d, z7.d\n"
> > > +           "eor z5.d, z5.d, z7.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 1b\n"
> > > +           "2:\n"
> > > +
> > > +           "st1b z0.b, p0, [%[p], x5]\n"
> > > +           "st1b z1.b, p0, [%[q], x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "st1b z5.b, p0, [%[p], x8]\n"
> > > +           "st1b z6.b, p0, [%[q], x8]\n"
> > > +
> > > +           "add x5, x5, x3\n"
> > > +           "add x5, x5, x3\n"
> > > +           "cmp x5, %[bytes]\n"
> > > +           "blt 0b\n"
> > > +           :
> > > +           : [dptr] "r" (dptr), [z0] "r" (z0), [bytes] "r" (bytes),
> > > +             [p] "r" (p), [q] "r" (q)
> > > +           : "memory", "p0", "x3", "x4", "x5", "x6", "x7", "x8",
> > > +             "z0", "z1", "z2", "z3", "z4",
> > > +             "z5", "z6", "z7", "z8"
> > > +   );
> > > +}
> > > +
> > > +static void raid6_sve2_xor_syndrome_real(int disks, int start, int
> > > stop,
> > > +                                    unsigned long bytes, void **ptrs=
)
> > > +{
> > > +   u8 **dptr =3D (u8 **)ptrs;
> > > +   u8 *p, *q;
> > > +   long z0 =3D stop;
> > > +
> > > +   p =3D dptr[disks - 2];
> > > +   q =3D dptr[disks - 1];
> > > +
> > > +   asm volatile(
> > > +           ".arch armv8.2-a+sve\n"
> > > +           "ptrue p0.b\n"
> > > +           "cntb x3\n"
> > > +           "mov w4, #0x1d\n"
> > > +           "dup z4.b, w4\n"
> > > +           "mov x5, #0\n"
> > > +
> > > +           "0:\n"
> > > +           "ldr x6, [%[dptr], %[z0], lsl #3]\n"
> > > +           "ld1b z1.b, p0/z, [x6, x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z6.b, p0/z, [x6, x8]\n"
> > > +
> > > +           "ld1b z0.b, p0/z, [%[p], x5]\n"
> > > +           "ld1b z5.b, p0/z, [%[p], x8]\n"
> > > +
> > > +           "eor z0.d, z0.d, z1.d\n"
> > > +           "eor z5.d, z5.d, z6.d\n"
> > > +
> > > +           "mov w7, %w[z0]\n"
> > > +           "sub w7, w7, #1\n"
> > > +
> > > +           "1:\n"
> > > +           "cmp w7, %w[start]\n"
> > > +           "blt 2f\n"
> > > +
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +
> > > +           "mov z8.d, z6.d\n"
> > > +           "asr z8.b, p0/m, z8.b, #7\n"
> > > +           "lsl z6.b, p0/m, z6.b, #1\n"
> > > +           "and z8.d, z8.d, z4.d\n"
> > > +           "eor z6.d, z6.d, z8.d\n"
> > > +
> > > +           "sxtw x8, w7\n"
> > > +           "ldr x6, [%[dptr], x8, lsl #3]\n"
> > > +           "ld1b z2.b, p0/z, [x6, x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z7.b, p0/z, [x6, x8]\n"
> > > +
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +           "eor z0.d, z0.d, z2.d\n"
> > > +
> > > +           "eor z6.d, z6.d, z7.d\n"
> > > +           "eor z5.d, z5.d, z7.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 1b\n"
> > > +           "2:\n"
> > > +
> > > +           "mov w7, %w[start]\n"
> > > +           "sub w7, w7, #1\n"
> > > +           "3:\n"
> > > +           "cmp w7, #0\n"
> > > +           "blt 4f\n"
> > > +
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +
> > > +           "mov z8.d, z6.d\n"
> > > +           "asr z8.b, p0/m, z8.b, #7\n"
> > > +           "lsl z6.b, p0/m, z6.b, #1\n"
> > > +           "and z8.d, z8.d, z4.d\n"
> > > +           "eor z6.d, z6.d, z8.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 3b\n"
> > > +           "4:\n"
> > > +
> > > +           "ld1b z2.b, p0/z, [%[q], x5]\n"
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +           "st1b z0.b, p0, [%[p], x5]\n"
> > > +           "st1b z1.b, p0, [%[q], x5]\n"
> > > +
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z7.b, p0/z, [%[q], x8]\n"
> > > +           "eor z6.d, z6.d, z7.d\n"
> > > +           "st1b z5.b, p0, [%[p], x8]\n"
> > > +           "st1b z6.b, p0, [%[q], x8]\n"
> > > +
> > > +           "add x5, x5, x3\n"
> > > +           "add x5, x5, x3\n"
> > > +           "cmp x5, %[bytes]\n"
> > > +           "blt 0b\n"
> > > +           :
> > > +           : [dptr] "r" (dptr), [z0] "r" (z0), [bytes] "r" (bytes),
> > > +             [p] "r" (p), [q] "r" (q), [start] "r" (start)
> > > +           : "memory", "p0", "x3", "x4", "x5", "x6", "x7", "x8",
> > > +             "z0", "z1", "z2", "z3", "z4",
> > > +             "z5", "z6", "z7", "z8"
> > > +   );
> > > +}
> > > +
> > > +static void raid6_sve4_gen_syndrome_real(int disks, unsigned long
> > > bytes, void **ptrs)
> > > +{
> > > +   u8 **dptr =3D (u8 **)ptrs;
> > > +   u8 *p, *q;
> > > +   long z0 =3D disks - 3;
> > > +
> > > +   p =3D dptr[z0 + 1];
> > > +   q =3D dptr[z0 + 2];
> > > +
> > > +   asm volatile(
> > > +           ".arch armv8.2-a+sve\n"
> > > +           "ptrue p0.b\n"
> > > +           "cntb x3\n"
> > > +           "mov w4, #0x1d\n"
> > > +           "dup z4.b, w4\n"
> > > +           "mov x5, #0\n"
> > > +
> > > +           "0:\n"
> > > +           "ldr x6, [%[dptr], %[z0], lsl #3]\n"
> > > +           "ld1b z0.b, p0/z, [x6, x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z5.b, p0/z, [x6, x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z10.b, p0/z, [x6, x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z15.b, p0/z, [x6, x8]\n"
> > > +
> > > +           "mov z1.d, z0.d\n"
> > > +           "mov z6.d, z5.d\n"
> > > +           "mov z11.d, z10.d\n"
> > > +           "mov z16.d, z15.d\n"
> > > +
> > > +           "mov w7, %w[z0]\n"
> > > +           "sub w7, w7, #1\n"
> > > +
> > > +           "1:\n"
> > > +           "cmp w7, #0\n"
> > > +           "blt 2f\n"
> > > +
> > > +           // software pipelining: load data early
> > > +           "sxtw x8, w7\n"
> > > +           "ldr x6, [%[dptr], x8, lsl #3]\n"
> > > +           "ld1b z2.b, p0/z, [x6, x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z7.b, p0/z, [x6, x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z12.b, p0/z, [x6, x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z17.b, p0/z, [x6, x8]\n"
> > > +
> > > +           // math block 1
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +           "eor z0.d, z0.d, z2.d\n"
> > > +
> > > +           // math block 2
> > > +           "mov z8.d, z6.d\n"
> > > +           "asr z8.b, p0/m, z8.b, #7\n"
> > > +           "lsl z6.b, p0/m, z6.b, #1\n"
> > > +           "and z8.d, z8.d, z4.d\n"
> > > +           "eor z6.d, z6.d, z8.d\n"
> > > +           "eor z6.d, z6.d, z7.d\n"
> > > +           "eor z5.d, z5.d, z7.d\n"
> > > +
> > > +           // math block 3
> > > +           "mov z13.d, z11.d\n"
> > > +           "asr z13.b, p0/m, z13.b, #7\n"
> > > +           "lsl z11.b, p0/m, z11.b, #1\n"
> > > +           "and z13.d, z13.d, z4.d\n"
> > > +           "eor z11.d, z11.d, z13.d\n"
> > > +           "eor z11.d, z11.d, z12.d\n"
> > > +           "eor z10.d, z10.d, z12.d\n"
> > > +
> > > +           // math block 4
> > > +           "mov z18.d, z16.d\n"
> > > +           "asr z18.b, p0/m, z18.b, #7\n"
> > > +           "lsl z16.b, p0/m, z16.b, #1\n"
> > > +           "and z18.d, z18.d, z4.d\n"
> > > +           "eor z16.d, z16.d, z18.d\n"
> > > +           "eor z16.d, z16.d, z17.d\n"
> > > +           "eor z15.d, z15.d, z17.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 1b\n"
> > > +           "2:\n"
> > > +
> > > +           "st1b z0.b, p0, [%[p], x5]\n"
> > > +           "st1b z1.b, p0, [%[q], x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "st1b z5.b, p0, [%[p], x8]\n"
> > > +           "st1b z6.b, p0, [%[q], x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "st1b z10.b, p0, [%[p], x8]\n"
> > > +           "st1b z11.b, p0, [%[q], x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "st1b z15.b, p0, [%[p], x8]\n"
> > > +           "st1b z16.b, p0, [%[q], x8]\n"
> > > +
> > > +           "add x8, x3, x3\n"
> > > +           "add x5, x5, x8, lsl #1\n"
> > > +           "cmp x5, %[bytes]\n"
> > > +           "blt 0b\n"
> > > +           :
> > > +           : [dptr] "r" (dptr), [z0] "r" (z0), [bytes] "r" (bytes),
> > > +             [p] "r" (p), [q] "r" (q)
> > > +           : "memory", "p0", "x3", "x4", "x5", "x6", "x7", "x8",
> > > +             "z0", "z1", "z2", "z3", "z4",
> > > +             "z5", "z6", "z7", "z8",
> > > +             "z10", "z11", "z12", "z13",
> > > +             "z15", "z16", "z17", "z18"
> > > +   );
> > > +}
> > > +
> > > +static void raid6_sve4_xor_syndrome_real(int disks, int start, int
> > > stop,
> > > +                                    unsigned long bytes, void **ptrs=
)
> > > +{
> > > +   u8 **dptr =3D (u8 **)ptrs;
> > > +   u8 *p, *q;
> > > +   long z0 =3D stop;
> > > +
> > > +   p =3D dptr[disks - 2];
> > > +   q =3D dptr[disks - 1];
> > > +
> > > +   asm volatile(
> > > +           ".arch armv8.2-a+sve\n"
> > > +           "ptrue p0.b\n"
> > > +           "cntb x3\n"
> > > +           "mov w4, #0x1d\n"
> > > +           "dup z4.b, w4\n"
> > > +           "mov x5, #0\n"
> > > +
> > > +           "0:\n"
> > > +           "ldr x6, [%[dptr], %[z0], lsl #3]\n"
> > > +           "ld1b z1.b, p0/z, [x6, x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z6.b, p0/z, [x6, x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z11.b, p0/z, [x6, x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z16.b, p0/z, [x6, x8]\n"
> > > +
> > > +           "ld1b z0.b, p0/z, [%[p], x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z5.b, p0/z, [%[p], x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z10.b, p0/z, [%[p], x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z15.b, p0/z, [%[p], x8]\n"
> > > +
> > > +           "eor z0.d, z0.d, z1.d\n"
> > > +           "eor z5.d, z5.d, z6.d\n"
> > > +           "eor z10.d, z10.d, z11.d\n"
> > > +           "eor z15.d, z15.d, z16.d\n"
> > > +
> > > +           "mov w7, %w[z0]\n"
> > > +           "sub w7, w7, #1\n"
> > > +
> > > +           "1:\n"
> > > +           "cmp w7, %w[start]\n"
> > > +           "blt 2f\n"
> > > +
> > > +           // software pipelining: load data early
> > > +           "sxtw x8, w7\n"
> > > +           "ldr x6, [%[dptr], x8, lsl #3]\n"
> > > +           "ld1b z2.b, p0/z, [x6, x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z7.b, p0/z, [x6, x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z12.b, p0/z, [x6, x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z17.b, p0/z, [x6, x8]\n"
> > > +
> > > +           // math block 1
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +           "eor z0.d, z0.d, z2.d\n"
> > > +
> > > +           // math block 2
> > > +           "mov z8.d, z6.d\n"
> > > +           "asr z8.b, p0/m, z8.b, #7\n"
> > > +           "lsl z6.b, p0/m, z6.b, #1\n"
> > > +           "and z8.d, z8.d, z4.d\n"
> > > +           "eor z6.d, z6.d, z8.d\n"
> > > +           "eor z6.d, z6.d, z7.d\n"
> > > +           "eor z5.d, z5.d, z7.d\n"
> > > +
> > > +           // math block 3
> > > +           "mov z13.d, z11.d\n"
> > > +           "asr z13.b, p0/m, z13.b, #7\n"
> > > +           "lsl z11.b, p0/m, z11.b, #1\n"
> > > +           "and z13.d, z13.d, z4.d\n"
> > > +           "eor z11.d, z11.d, z13.d\n"
> > > +           "eor z11.d, z11.d, z12.d\n"
> > > +           "eor z10.d, z10.d, z12.d\n"
> > > +
> > > +           // math block 4
> > > +           "mov z18.d, z16.d\n"
> > > +           "asr z18.b, p0/m, z18.b, #7\n"
> > > +           "lsl z16.b, p0/m, z16.b, #1\n"
> > > +           "and z18.d, z18.d, z4.d\n"
> > > +           "eor z16.d, z16.d, z18.d\n"
> > > +           "eor z16.d, z16.d, z17.d\n"
> > > +           "eor z15.d, z15.d, z17.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 1b\n"
> > > +           "2:\n"
> > > +
> > > +           "mov w7, %w[start]\n"
> > > +           "sub w7, w7, #1\n"
> > > +           "3:\n"
> > > +           "cmp w7, #0\n"
> > > +           "blt 4f\n"
> > > +
> > > +           // math block 1
> > > +           "mov z3.d, z1.d\n"
> > > +           "asr z3.b, p0/m, z3.b, #7\n"
> > > +           "lsl z1.b, p0/m, z1.b, #1\n"
> > > +           "and z3.d, z3.d, z4.d\n"
> > > +           "eor z1.d, z1.d, z3.d\n"
> > > +
> > > +           // math block 2
> > > +           "mov z8.d, z6.d\n"
> > > +           "asr z8.b, p0/m, z8.b, #7\n"
> > > +           "lsl z6.b, p0/m, z6.b, #1\n"
> > > +           "and z8.d, z8.d, z4.d\n"
> > > +           "eor z6.d, z6.d, z8.d\n"
> > > +
> > > +           // math block 3
> > > +           "mov z13.d, z11.d\n"
> > > +           "asr z13.b, p0/m, z13.b, #7\n"
> > > +           "lsl z11.b, p0/m, z11.b, #1\n"
> > > +           "and z13.d, z13.d, z4.d\n"
> > > +           "eor z11.d, z11.d, z13.d\n"
> > > +
> > > +           // math block 4
> > > +           "mov z18.d, z16.d\n"
> > > +           "asr z18.b, p0/m, z18.b, #7\n"
> > > +           "lsl z16.b, p0/m, z16.b, #1\n"
> > > +           "and z18.d, z18.d, z4.d\n"
> > > +           "eor z16.d, z16.d, z18.d\n"
> > > +
> > > +           "sub w7, w7, #1\n"
> > > +           "b 3b\n"
> > > +           "4:\n"
> > > +
> > > +           // Load q and XOR
> > > +           "ld1b z2.b, p0/z, [%[q], x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "ld1b z7.b, p0/z, [%[q], x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z12.b, p0/z, [%[q], x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "ld1b z17.b, p0/z, [%[q], x8]\n"
> > > +
> > > +           "eor z1.d, z1.d, z2.d\n"
> > > +           "eor z6.d, z6.d, z7.d\n"
> > > +           "eor z11.d, z11.d, z12.d\n"
> > > +           "eor z16.d, z16.d, z17.d\n"
> > > +
> > > +           // Store results
> > > +           "st1b z0.b, p0, [%[p], x5]\n"
> > > +           "st1b z1.b, p0, [%[q], x5]\n"
> > > +           "add x8, x5, x3\n"
> > > +           "st1b z5.b, p0, [%[p], x8]\n"
> > > +           "st1b z6.b, p0, [%[q], x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "st1b z10.b, p0, [%[p], x8]\n"
> > > +           "st1b z11.b, p0, [%[q], x8]\n"
> > > +           "add x8, x8, x3\n"
> > > +           "st1b z15.b, p0, [%[p], x8]\n"
> > > +           "st1b z16.b, p0, [%[q], x8]\n"
> > > +
> > > +           "add x8, x3, x3\n"
> > > +           "add x5, x5, x8, lsl #1\n"
> > > +           "cmp x5, %[bytes]\n"
> > > +           "blt 0b\n"
> > > +           :
> > > +           : [dptr] "r" (dptr), [z0] "r" (z0), [bytes] "r" (bytes),
> > > +             [p] "r" (p), [q] "r" (q), [start] "r" (start)
> > > +           : "memory", "p0", "x3", "x4", "x5", "x6", "x7", "x8",
> > > +             "z0", "z1", "z2", "z3", "z4",
> > > +             "z5", "z6", "z7", "z8",
> > > +             "z10", "z11", "z12", "z13",
> > > +             "z15", "z16", "z17", "z18"
> > > +   );
> > > +}
> > > +
> > > +#define RAID6_SVE_WRAPPER(_n)                                       =
       \
> > > +   static void raid6_sve ## _n ## _gen_syndrome(int disks,         \
> > > +                                   size_t bytes, void **ptrs)      \
> > > +   {                                                               \
> > > +           scoped_ksimd()                                          \
> > > +           raid6_sve ## _n ## _gen_syndrome_real(disks,            \
> > > +                                   (unsigned long)bytes, ptrs);    \
> > > +   }                                                               \
> > > +   static void raid6_sve ## _n ## _xor_syndrome(int disks,         \
> > > +                                   int start, int stop,            \
> > > +                                   size_t bytes, void **ptrs)      \
> > > +   {                                                               \
> > > +           scoped_ksimd()                                          \
> > > +           raid6_sve ## _n ## _xor_syndrome_real(disks,            \
> > > +                           start, stop, (unsigned long)bytes, ptrs);=
\
> > > +   }                                                               \
> > > +   struct raid6_calls const raid6_svex ## _n =3D {                  =
 \
> > > +           raid6_sve ## _n ## _gen_syndrome,                       \
> > > +           raid6_sve ## _n ## _xor_syndrome,                       \
> > > +           raid6_have_sve,                                         \
> > > +           "svex" #_n,                                             \
> > > +           0                                                       \
> > > +   }
> > > +
> > > +static int raid6_have_sve(void)
> > > +{
> > > +   return system_supports_sve();
> > > +}
> > > +
> > > +RAID6_SVE_WRAPPER(1);
> > > +RAID6_SVE_WRAPPER(2);
> > > +RAID6_SVE_WRAPPER(4);
> > > --
> > > 2.43.0

