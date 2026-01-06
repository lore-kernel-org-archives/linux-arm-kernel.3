Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47083CE9D5C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfYfd1PzaMaipLKoSbmZze99juo76um6Ea96kj/deqg=; b=P1RqKGe2yA1VLlyZ2EkeVlsVmI
	lVoEgCklGYjE/W3ci1OT/NooNfplxok7qQ2kbm+bAe32++xdyjzE3cXqy3tZU+ogQ7dE7p42HPL9J
	3i/3ckV1D91xtc8bUzdvLs/UFmAHVaE85LnDAHyGpJyfIGLfpO3eMhNST72gPqNbiF6y4yCWdvaWq
	wV30+YBKJy0fzqT6mkhg/P37wtIXJ0QD7MnmY5Ji7y7KEAovJxwuoCVP5XxJwjQDxg9mz/7bs9wJX
	dPxoO16+XAOiZd4J+EGxVC2xuzAVLHrX7+FNj8C3SEcXUj+DqlXY4clhmZ1hS8H5I9Ywgoic+LdIi
	ngG1kxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wH-0000000DP2U-3Jao;
	Tue, 06 Jan 2026 15:25:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wG-0000000DP2L-3naK;
	Tue, 06 Jan 2026 15:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WfYfd1PzaMaipLKoSbmZze99juo76um6Ea96kj/deqg=; b=QEdpsuNl7ia0un9wF36SttoObu
	nxQEI5WIklTjmDfhrXDmpkPWlxy8UkL6Iqr3LpMakwafmglnFlnXsR5VXVC58V/ZHYkv6AMaKolqx
	/cVr5UJwW1UKZEMlstf6VqpxSWes3tMyHVBIc7W0cJpBdY7idKsO/hNVuRMW8C2V6W76GEHI2hfis
	9LOA40VS74ERDGDEfcydRZnoxE/Xdw8aWQhtCvTN5o2OjkX/+pXncxFEUdmVzLQxJFtvjWUBMr1AT
	do7k2fi00jp3bllKENz1pIemqqzAvW+cZB4IfzbmjRFj6rGMZHixTPqAj4H63R0U2vBEtx8//4DEg
	K94AiDUw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8wE-00000009xZY-3ZDj;
	Tue, 06 Jan 2026 15:25:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5D63E30056B; Tue, 06 Jan 2026 16:25:38 +0100 (CET)
Date: Tue, 6 Jan 2026 16:25:38 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Keke Ming <ming.jvle@gmail.com>, mhiramat@kernel.org,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	tsbogend@alpha.franken.de, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/5] uprobes: transition from kmap_atomic to
 kmap_local_page
Message-ID: <20260106152538.GA3707891@noisy.programming.kicks-ass.net>
References: <20260103084243.195125-1-ming.jvle@gmail.com>
 <aVj146EunyaOQzxO@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVj146EunyaOQzxO@redhat.com>
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

On Sat, Jan 03, 2026 at 11:56:35AM +0100, Oleg Nesterov wrote:
> On 01/03, Keke Ming wrote:
> >
> > Keke Ming (5):
> >   riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
> >   uprobes: use kmap_local_page() for temporary page mappings
> >
> >  arch/arm/probes/uprobes/core.c     |  4 ++--
> >  arch/arm64/kernel/probes/uprobes.c |  4 ++--
> >  arch/mips/kernel/uprobes.c         |  4 ++--
> >  arch/riscv/kernel/probes/uprobes.c |  4 ++--
> >  kernel/events/uprobes.c            | 12 ++++++------
> >  5 files changed, 14 insertions(+), 14 deletions(-)
> 
> Thanks,
> 
> Acked-by: Oleg Nesterov <oleg@redhat.com>

Let me go stick them in tip/perf/core

