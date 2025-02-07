Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0D6C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UvshL8nXVJdd7vp4+YSGo25p1rD7pCcETOL1e0fbZQ=; b=2yRpUwpYa7YQsT2393TFNowuBC
	WRxiLl/VRv14Ra1EZtzFm90scwai7PP3b1tlSkLXQ3N5gjX0kmbTVFNuuH/qXDH3f++0SZKrRz5u6
	XqEz+p8pUXQxx9zxKaj6bLzyEMnnpLr7XAXKcep4ZIHPATnMi7xJ7/89xHiimlkIZ1ezZjLRd3apK
	n4bNSUSxD7k27PIqZxo9vBd1NW76Swx/jZPXfWlvy00W+u8hMkEr2deIHu795fPwZX8NxdUSiLss9
	CLVCICLchG+NLkwVwvi+H/y4QG2kDc9vpvt398HMx7EVzAQHJzxmdthf4HendMPahGESPLeerip1a
	ThzV78vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRtl-0000000ARZf-2Iol;
	Fri, 07 Feb 2025 17:12:13 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRcI-0000000AN5U-1LZy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:54:12 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f3e2b4eceso38396325ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738947249; x=1739552049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UvshL8nXVJdd7vp4+YSGo25p1rD7pCcETOL1e0fbZQ=;
        b=1FF10y2QbHjyjxXYr/oUQvbcJB00UKeMLeEt5hfWNytD+ojYL1gulndrOTk7XKzebx
         7Gu01+5XEkGY50ioyUyhF+NLV8iXJXiIR1qnU/Ad/emRU1EsfwJHL8qDOBYNyvfFg2IP
         Zbp4YCyEiaSbUkPzDJvRwBO7r6Pkb0+RXOGg5eWWO9KdaB5jC4sqqnIwqngTbqEOAxMp
         lvDsrGZYh0L0MqJux1cNkQ08jcMcXmvtXv4iPdFKszL/1cc6mwR2nMbAEr3QjIDZUBHb
         26FMb/RjPF+RONF0jW/ewo0k0mrAv477jbhxPVdAIPdmmYynrQ1vFSDXxjT40p/rAA7x
         84Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947249; x=1739552049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UvshL8nXVJdd7vp4+YSGo25p1rD7pCcETOL1e0fbZQ=;
        b=qqYjUR1I4/Xq1c9CLasnyAs7Hma1YUaUgQ+cnaslTakfLGEGhhQwlv/Bnet37oTgG9
         jvcCsrPjY6PR05z51mXbDPQPIBopYsYqRAsTWN0OkkTPy+izLV29o2+Jky7P9iSMOZNJ
         MkgxGPSw9STaT8pxow/rT1Al28VilNebpJJzCBZlBLFiULMoQ8Ad7qj76BD9Ur+cnw+n
         85EWzYyGPWNX0likzSyGQlFhy6wM6C5AcTQ1LyDbjEpPBnEF8zuitpX3Eiwlt0/zXveY
         y8ryje4nBQV4GPNCYskXjoDFWnEjoKCP0v5i+ZoRX3IS1/jAtaZc3roh1hH+A6q0NgN0
         bkDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTHOoMFW8/XtcwtOqTJOE0Jjz6YfeFFEl/pYjQhaJlkIn572eu6rTEhQDav6oDtRQDwQ0G/fReA/MNjQDBuleg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwg3a2AVcR6vwri6f41e2DFBOHtfRjjnV5PZaDtPWfF6xb1mv2
	/t+0l3wPN4+U0qHsO4wjSwoI53ahRMLQf6ubE6c/qtnpgxkqAsJAhuK8+YAPR+BT9zFKTvZlPIL
	TowWMUWNvsN456KpC9HPyKDet0JeIixqssx0SsA==
X-Gm-Gg: ASbGncuZRBo/vnnwd4HifJUo1OUMCxm5VzzVYE9EgLtzJTRgPhY4Tk5Rgg8TkRcMJVQ
	G9vt8Sxp5+/Cdgd6IBzHYHbzSte7M5aPoL5mP7ueEtjCpvrizPz5LxKJRhMuPLZr0rINiClDGfQ
	==
X-Google-Smtp-Source: AGHT+IGcOreyYzVTdgMb0QBe7xfS8Hq4n/vBf0b22MVHxkWExD11jxox3l4GddXf+HqClKoe976BaxK99Tn7Vq/+DBg=
X-Received: by 2002:a05:6a21:3399:b0:1e0:d4f4:5b39 with SMTP id
 adf61e73a8af0-1ee03a9b0afmr7073525637.24.1738947249048; Fri, 07 Feb 2025
 08:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-11-835cfa88e3b1@rivosinc.com> <20250206105100.GA2971@willie-the-truck>
In-Reply-To: <20250206105100.GA2971@willie-the-truck>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 7 Feb 2025 08:53:59 -0800
X-Gm-Features: AWEUYZl2-SoqDPQ6r-GdOfUPJBX1qdNjRlIcNpQpRwZeLOQULWh9MTRajFVfra0
Message-ID: <CAHBxVyEtxoRHLO791r6uFzHnX0vAcpeWMOcS+0tbVN+p6Oh2tQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/21] RISC-V: perf: Restructure the SBI PMU code
To: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_085410_377793_50E03FB7 
X-CRM114-Status: GOOD (  21.76  )
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

On Thu, Feb 6, 2025 at 2:51=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Feb 05, 2025 at 11:23:16PM -0800, Atish Patra wrote:
> > With Ssccfg/Smcdeleg, we no longer need SBI PMU extension to program/
> > access hpmcounter/events. However, we do need it for firmware counters.
> > Rename the driver and its related code to represent generic name
> > that will handle both sbi and ISA mechanism for hpmcounter related
> > operations. Take this opportunity to update the Kconfig names to
> > match the new driver name closely.
> >
> > No functional change intended.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  MAINTAINERS                                       |   4 +-
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h             |   4 +-
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h             |   2 +-
> >  arch/riscv/kvm/Makefile                           |   4 +-
> >  arch/riscv/kvm/vcpu_sbi.c                         |   2 +-
> >  drivers/perf/Kconfig                              |  16 +-
> >  drivers/perf/Makefile                             |   4 +-
> >  drivers/perf/{riscv_pmu.c =3D> riscv_pmu_common.c}  |   0
> >  drivers/perf/{riscv_pmu_sbi.c =3D> riscv_pmu_dev.c} | 214 ++++++++++++=
+---------
>
> This seems... gratuitous? It feels like renaming the file could be a pain
> for managing backports and renaming the driver might cause some headaches
> in userspace.
>
> What do you gain from such an invasive change?
>

The current upstream driver was developed only for SBI PMU[1] due to
lack of any ISA extension support that allows PMU programming from the
kernel.
Thus, the name of the file and the functions reflect those assumptions.

IMO, it would be confusing to use a driver named sbi that also uses
the new ISA extensions that allows direct PMU programming from the
kernel.
This patch allows the internal functions and structure to clearly
identify two ways of PMU programming.
There are more PMU related ISA extensions planned in the future as
well. Thus, I felt it would be best to do these changes now rather
than later.
I understand that managing the backport would be a pain as a result
but I didn't quite understand the concern about the userspace
headances.
Can you please clarify that ?

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-pmu.=
adoc


> Will

