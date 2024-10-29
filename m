Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFBDD74941
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 21:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfD1DetZzLaBym84XosC3+P3GN+QnX7QF0+o66GGJ4Y=; b=ONxFIhgPHrfhhh5tU3s9q2PXr6
	OoPXR4fe6Il8AVgoYPEA43tGcKDEweOqmOBuijnshuFq3uePen3Cuj335aOmHs9B8xVlnXKxXSlZ9
	EBwkVa84k1qEGy8yhbfBE2GQny5lqLrpPM25tFvlJ1SE2opGWfhdchve/IGEZjWsq1mFqpeaNATOc
	vn/vQXmCVCsBE/O0HW91rl6gKrXYkNMnsJ/fgGduBTR1SEX7QvqdF8QDO31z2mFY+lORPddq3o2BV
	zaK73Cewxmj26aY0yPncLnUPEZQuTg5eBDlaLmLvTg9sL9usAr4itY9j5O7hOLciejFeIbabIbcl2
	6+5mcfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tVL-0000000Fv54-1JF2;
	Tue, 29 Oct 2024 21:11:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tNk-0000000FuR8-1NfL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 21:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730235842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TfD1DetZzLaBym84XosC3+P3GN+QnX7QF0+o66GGJ4Y=;
	b=GRDHRXawJ6tFX0X21VKDW1mOWYD9OK2AtTfs8B1R/AGDONauSOZ4mZXDw0HT1LiwxuWRE4
	KJOVJz931BCWmZxu7m70AgrITO023WnCoR//wD1XTqRSWm298Z73tRSimwjnbranEgdZRz
	+vN2mfXpZT00cGbmjkS8AkszI8pGVLI=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-RqPBHrHDOhKUgQXNjQJnRA-1; Tue, 29 Oct 2024 17:04:00 -0400
X-MC-Unique: RqPBHrHDOhKUgQXNjQJnRA-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-28c65d3a0e9so286396fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 14:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730235839; x=1730840639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfD1DetZzLaBym84XosC3+P3GN+QnX7QF0+o66GGJ4Y=;
        b=TFqR0DJ4D0A5OW2OhSu+Pg90Ui9DuIiwQfmjjAVYXn/X6A4WWT6mL/MIVzhVFgCYkf
         9VH3cCr5RQizezkGl5I/CJotbnWF9+jUpRVhFO4qKbb1mTMcWspwMOoTHPOV5LVLymsc
         JmK2uwgvghqRmg1763e6D7dNnrudB+fO6/RVFT7AwjDsdhCCKaCrTWiXH/p+arqEXLYT
         E6LSCYQHeLdbAPb5C8JuoJUJiv03Gx69L3kmNYQg08N7laAO+EG6oDRXx9w7d8e16frO
         wd5ELPRq1Ubm7Zm6ZS/ZsMBEwiwe5xORaRdOvsQG+iCE+9fNLy6f6/abddf7gekaaq4R
         upXA==
X-Forwarded-Encrypted: i=1; AJvYcCU5jRaDD/hy4F1V9nHdx5UBv8QgM726deMWkjx8fJs3NGUAujSYFTOkUzEjfi0EASPHe1x/yAlYmtxEk07QAEqr@lists.infradead.org
X-Gm-Message-State: AOJu0YwbYeESzid+Co+j1MPVVNdZfKr8bRRloGPlDwxgIq3ZC1JDEyIB
	qbKktSh3jWeyl1U1rREb6pvgEgSc2MJaL4gxyZRqWg5KDMFCD8VsHTZk8ZqPOMRcdUoKUci/lXV
	sflnojl8u/yGM166Upt8YUuvGnxSjvrLyb5yf5SaUpvkOqgEIGtUMATzw6CV6Q1dOEkBeP6Wf5K
	ZKEtsYKPDl6Lp2ZEITBqtkPW/+0RFRuwugiVZZKlcB7j0nTTA=
X-Received: by 2002:a05:6870:170e:b0:254:b337:eeb5 with SMTP id 586e51a60fabf-291046e55e9mr2141490fac.18.1730235839604;
        Tue, 29 Oct 2024 14:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0FaW9744QqAdp6tEpgnXEx1lws0uvXXj2TggY33DwbU5PmIv1EIXwfn9y+mGEbsu/hkZQkYALRP7zpxZl5Xc=
X-Received: by 2002:a05:6870:170e:b0:254:b337:eeb5 with SMTP id
 586e51a60fabf-291046e55e9mr2141481fac.18.1730235839304; Tue, 29 Oct 2024
 14:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com> <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
 <ZyELRjoDLmHeVvSR@kernel.org>
In-Reply-To: <ZyELRjoDLmHeVvSR@kernel.org>
From: Jan Stancek <jstancek@redhat.com>
Date: Tue, 29 Oct 2024 22:03:31 +0100
Message-ID: <CAASaF6x8cMJUTYpm0dedkh9boXgVaL9WvxaG-r+aHY+6QOpw6Q@mail.gmail.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
To: Mike Rapoport <rppt@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Jonathan.Cameron@huawei.com, 
	dan.j.williams@intel.com, David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_140404_475695_617ACE19 
X-CRM114-Status: GOOD (  26.57  )
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

On Tue, Oct 29, 2024 at 5:24=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Tue, Oct 29, 2024 at 04:43:39PM +0100, Jan Stancek wrote:
> > On Tue, Oct 29, 2024 at 4:07=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> > >
> > > +tegra mailing list and maintainers
> > >
> > > On 29 Oct 2024, at 8:47, Jan Stancek wrote:
> > >
> > > > Hi,
> > > >
> > > > I'm seeing a regression on Nvidia IGX system, which no longer boots=
.
> > > >
> > > > bisect points at commit 767507654c22 ("arch_numa: switch over to nu=
ma_memblks").
> > > > It hangs very early, with 4k or 64k pages, with no kernel messages =
printed:
> > > >
> > > > EFI stub: Booting Linux Kernel...
> > > > EFI stub: Using DTB from configuration table
> > > > EFI stub: Exiting boot services...
> > > > <hangs here>
> > > >
> > >
> > > Is it possible to have earlycon output? It is hard to debug without a=
ny
> > > information except kernel fails to boot.
> >
> > I know it was a long shot, so far I haven't had luck getting it to work=
.
>
> Does it boot with numa=3Doff and numa=3Dfake?

No, it doesn't.

>
> In the log from successful boot it seems there is no NUMA information in
> the device tree, can you send the device tree as well please?

https://people.redhat.com/jstancek/aarch64_numa_boot/device_tree

Regards,
Jan




>
> > > Since the previous commit boots and I assume both kernels are compile=
d
> > > with the same gcc toolchain, this should not be caused by the binuils
> > > bug in 2.42[1]. Is your binutils version 2.42?
> >
> > Yes, both are compiled locally, with binutils 2.41
> >
> > >
> > > Thanks.
> > >
> > >
> > > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D31924
> > >
> > > > Here's a log from successful boot with previous commit:
> > > > https://people.redhat.com/jstancek/aarch64_numa_boot/console-log-go=
od.txt
> > > > and config: https://people.redhat.com/jstancek/aarch64_numa_boot/co=
nfig
> > > >
> > > > # lscpu
> > > > Architecture:             aarch64
> > > >   CPU op-mode(s):         32-bit, 64-bit
> > > >   Byte Order:             Little Endian
> > > > CPU(s):                   12
> > > >   On-line CPU(s) list:    0-11
> > > > Vendor ID:                ARM
> > > >   BIOS Vendor ID:         NVIDIA
> > > >   Model name:             Cortex-A78AE
> > > >     BIOS Model name:      Not Specified Not Specified CPU @ 0.0GHz
> > > >     BIOS CPU family:      257
> > > >     Model:                1
> > > >     Thread(s) per core:   1
> > > >     Core(s) per cluster:  12
> > > >     Socket(s):            1
> > > >     Cluster(s):           1
> > > >     Stepping:             r0p1
> > > >     CPU(s) scaling MHz:   100%
> > > >     CPU max MHz:          1971.2000
> > > >     CPU min MHz:          115.2000
> > > >     BogoMIPS:             62.50
> > > >     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc3=
2
> > > > atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcp=
c
> > > > flagm paca pacg
> > > > Caches (sum of all):
> > > >   L1d:                    768 KiB (12 instances)
> > > >   L1i:                    768 KiB (12 instances)
> > > >   L2:                     3 MiB (12 instances)
> > > >   L3:                     6 MiB (3 instances)
> > > > NUMA:
> > > >   NUMA node(s):           1
> > > >   NUMA node0 CPU(s):      0-11
> > > > Vulnerabilities:
> > > >   Gather data sampling:   Not affected
> > > >   Itlb multihit:          Not affected
> > > >   L1tf:                   Not affected
> > > >   Mds:                    Not affected
> > > >   Meltdown:               Not affected
> > > >   Mmio stale data:        Not affected
> > > >   Reg file data sampling: Not affected
> > > >   Retbleed:               Not affected
> > > >   Spec rstack overflow:   Not affected
> > > >   Spec store bypass:      Mitigation; Speculative Store Bypass
> > > > disabled via prctl
> > > >   Spectre v1:             Mitigation; __user pointer sanitization
> > > >   Spectre v2:             Mitigation; CSV2, BHB
> > > >   Srbds:                  Not affected
> > > >   Tsx async abort:        Not affected
> > > >
> > > > Regards,
> > > > Jan
> > >
> > >
> > > Best Regards,
> > > Yan, Zi
> > >
> >
>
> --
> Sincerely yours,
> Mike.
>


