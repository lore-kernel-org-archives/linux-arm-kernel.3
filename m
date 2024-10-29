Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B68CD3A67B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqW3jaG/bt4ycnq/0fpYN97zEHChSP+Wv6VyTR7B5Y0=; b=HReCA9kLeSiaWcIBv61zEDlSEy
	5GcsDNg0rONxavcai8ahdLQM1L/uV1HcHl/5h6nzvBDflPSrp5+aWucyldBE9IlRYkJQlRA/YzZ4q
	YhrhpsoS33LA5mEJcD7TJNHKMFfHfs/6a5K6qHW1tWL7kZOlnYUkn3nRtwynCUocZgsrqhKAcGyXR
	KjbLrRDVLra/EGwLPPjQOsp1Kmq/E3uNJfFiE34Bs7ba7D96brMngnYX3fQyWzZKFOwRITV+ZRiuJ
	2cpPS139O7iDIYklOysX5YMEyiwqpEzMfO+17W/evltYVnlipfv02qIpPKtzkXtPfqnKBiRZVF+04
	e7OyR2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDu-0000000FWpV-33H9;
	Tue, 29 Oct 2024 18:45:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5p12-0000000F6mf-0cpI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4442A42E7B;
	Tue, 29 Oct 2024 16:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB128C4CECD;
	Tue, 29 Oct 2024 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730219058;
	bh=NOaPvxkToVhU79onE/sW9k0JS2iIC2jJuOMIw51wRx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s9/1Oxfn14anXZ89hpcXZKgHXYYEUz+zOs6G3JukRct4h9UUAAeHvuqCn2wcU6xQO
	 /p9IMc4V4mxQFujNSk6RKXn81xudvQDuyQn6u8V2TY/G4ecSFJUACMAUqrPotEmLGi
	 vhHrURVNY6XRelm/0OaJMAuC5TdJgeZiiMBNWdM6TKEezYODxnh0c4k0n4jvJOyred
	 /YK6+zhm8BjAYC8ZkZqWcG2p2p5nWHt18sxfI0330+OuAIiNPAbRQ5MU+adiQ0wnY0
	 935VVRbOXo6IbMnVXXmjJTe8AS7StekkfYConmC3zBoEDTXa9IXaGaoNIGjUxAZHTB
	 vAn0KPxx9ElRA==
Date: Tue, 29 Oct 2024 18:20:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jan Stancek <jstancek@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Jonathan.Cameron@huawei.com, dan.j.williams@intel.com,
	David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
Message-ID: <ZyELRjoDLmHeVvSR@kernel.org>
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
 <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
 <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAASaF6z7PtNFs1YwohT6N+AXdKx0+h87wiimx18Pod1vDfaBYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_092420_346019_F35BD17E 
X-CRM114-Status: GOOD (  24.52  )
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

On Tue, Oct 29, 2024 at 04:43:39PM +0100, Jan Stancek wrote:
> On Tue, Oct 29, 2024 at 4:07 PM Zi Yan <ziy@nvidia.com> wrote:
> >
> > +tegra mailing list and maintainers
> >
> > On 29 Oct 2024, at 8:47, Jan Stancek wrote:
> >
> > > Hi,
> > >
> > > I'm seeing a regression on Nvidia IGX system, which no longer boots.
> > >
> > > bisect points at commit 767507654c22 ("arch_numa: switch over to numa_memblks").
> > > It hangs very early, with 4k or 64k pages, with no kernel messages printed:
> > >
> > > EFI stub: Booting Linux Kernel...
> > > EFI stub: Using DTB from configuration table
> > > EFI stub: Exiting boot services...
> > > <hangs here>
> > >
> >
> > Is it possible to have earlycon output? It is hard to debug without any
> > information except kernel fails to boot.
> 
> I know it was a long shot, so far I haven't had luck getting it to work.

Does it boot with numa=off and numa=fake?

In the log from successful boot it seems there is no NUMA information in
the device tree, can you send the device tree as well please?

> > Since the previous commit boots and I assume both kernels are compiled
> > with the same gcc toolchain, this should not be caused by the binuils
> > bug in 2.42[1]. Is your binutils version 2.42?
> 
> Yes, both are compiled locally, with binutils 2.41
> 
> >
> > Thanks.
> >
> >
> > [1] https://sourceware.org/bugzilla/show_bug.cgi?id=31924
> >
> > > Here's a log from successful boot with previous commit:
> > > https://people.redhat.com/jstancek/aarch64_numa_boot/console-log-good.txt
> > > and config: https://people.redhat.com/jstancek/aarch64_numa_boot/config
> > >
> > > # lscpu
> > > Architecture:             aarch64
> > >   CPU op-mode(s):         32-bit, 64-bit
> > >   Byte Order:             Little Endian
> > > CPU(s):                   12
> > >   On-line CPU(s) list:    0-11
> > > Vendor ID:                ARM
> > >   BIOS Vendor ID:         NVIDIA
> > >   Model name:             Cortex-A78AE
> > >     BIOS Model name:      Not Specified Not Specified CPU @ 0.0GHz
> > >     BIOS CPU family:      257
> > >     Model:                1
> > >     Thread(s) per core:   1
> > >     Core(s) per cluster:  12
> > >     Socket(s):            1
> > >     Cluster(s):           1
> > >     Stepping:             r0p1
> > >     CPU(s) scaling MHz:   100%
> > >     CPU max MHz:          1971.2000
> > >     CPU min MHz:          115.2000
> > >     BogoMIPS:             62.50
> > >     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32
> > > atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcpc
> > > flagm paca pacg
> > > Caches (sum of all):
> > >   L1d:                    768 KiB (12 instances)
> > >   L1i:                    768 KiB (12 instances)
> > >   L2:                     3 MiB (12 instances)
> > >   L3:                     6 MiB (3 instances)
> > > NUMA:
> > >   NUMA node(s):           1
> > >   NUMA node0 CPU(s):      0-11
> > > Vulnerabilities:
> > >   Gather data sampling:   Not affected
> > >   Itlb multihit:          Not affected
> > >   L1tf:                   Not affected
> > >   Mds:                    Not affected
> > >   Meltdown:               Not affected
> > >   Mmio stale data:        Not affected
> > >   Reg file data sampling: Not affected
> > >   Retbleed:               Not affected
> > >   Spec rstack overflow:   Not affected
> > >   Spec store bypass:      Mitigation; Speculative Store Bypass
> > > disabled via prctl
> > >   Spectre v1:             Mitigation; __user pointer sanitization
> > >   Spectre v2:             Mitigation; CSV2, BHB
> > >   Srbds:                  Not affected
> > >   Tsx async abort:        Not affected
> > >
> > > Regards,
> > > Jan
> >
> >
> > Best Regards,
> > Yan, Zi
> >
> 

-- 
Sincerely yours,
Mike.

