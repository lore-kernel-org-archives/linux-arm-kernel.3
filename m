Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E89D462AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Egn5fEpckGR7euiSFSUPlqzHLdxGGw1Hgc2j7hHRnkA=; b=DZVDmbLHywMM2jH/A6ogpTXvyX
	rwcFuAc16TnUQetmBeZyDQMfNkPNzAhx/lJKX7WxarUKm2VjAwq83ZRcDl2aQ7VKhZeUA9mlS9Jdw
	le6hL0y+pAfzUdW63NiMwDlCWVpMZn1OQsnzgYWcL0y6I7ZWdEZTUBcpT6FVl8a+hObhapMl6sGQR
	4g9iN9t2j471Nas6A4pgnTIR9M1WYOQnapXdTp/IahCtL8YAgtWWhblJuuaAuxB6qeVzptO6I7MTw
	ggF+yeHO7Ja2DI827D4PYlgeukF8J90D1i99j6+bScS5DMB9V0BT0I0YdqU504i6f6rdXFtZXUPDH
	KN3orGiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBEIj-00000007751-0HkK;
	Wed, 13 Nov 2024 14:24:57 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBEGu-000000076Vd-2A1c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 14:23:05 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a9a2068f348so30371466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731507782; x=1732112582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Egn5fEpckGR7euiSFSUPlqzHLdxGGw1Hgc2j7hHRnkA=;
        b=exoA2pTYojho0QG/ycMch8ni/DxhcnKl1pJrGBjg4uYxXJiZUJpIvF+steT13edZVm
         3WR/K+fVSVvVxrOzw99jMtRpGIE0jp68YSG6NT3pX66r/fHyaOAYSohRrD2QW2ZjWpdA
         v/EvoJavC0sA+dZ+1OpK2yB7k1N02cHkEYzQItHNowf4bcijVMWnf5trUpy8yFVavM2Y
         8dTVHTKCVKRiXWOj/9e2zn6cmJYKu9hxIJqdE4XYaD/jpvNNCZBwYAhuwHCy8eErvQk9
         0SzaAnNTyw5QWcr3MtiOqSPVAX8V7e/5mX9klmIDv0rCooN9Q6iOCImwdtmdYfDZzuV4
         8NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731507782; x=1732112582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Egn5fEpckGR7euiSFSUPlqzHLdxGGw1Hgc2j7hHRnkA=;
        b=kZ8T/oSV/F001fpCGc3Q6Z3rCogCzTb9jBcE8FPth+1rwe5c9yJcjWpQ8IXyNPT85b
         HRWOlVDmW3CKijlk3x1Zft5k9pchRLUaCp0q7bwuE754trMS3R/TH62pnW0VLJaSrWPo
         tA1ev8/zVDkZlDwfUvpxx/goP/Z+vcsiD/qEs4v0rFnh1suZtnA7s7KN4lMomLpBiG97
         po4DkSpFG711juxoo4sk7x3sJ9ckeqRqIyVfAoBV4+7Tl7mlsmS/LxBEVQF25iOJg3e6
         Y3PrgdxV5M/Ts8PSs1R2w4Jd/n4fkpkImSJBlDyWtkmTmMBSwIaiasJC7rREm6fmCgn1
         skRA==
X-Forwarded-Encrypted: i=1; AJvYcCURgx+5U+bAVj+1+Pt1N6rJGquC6L2+vGqb9qmed9oEtLoCc/qVLEeHZgDwjUKaBAOhV5Cc/AXyELlyQU/O2hC0@lists.infradead.org
X-Gm-Message-State: AOJu0YxoCyw7BxinNEV6a+ScjZ37/xFwsd4KWY+mpzzpPoFA2Fq7HaiP
	PjN2AlxUfpfrSvD5UjudPtyQdQ9hnuZnqfDATrOa+TqyzLU5HYRrXtJ/oL7UdeQ=
X-Google-Smtp-Source: AGHT+IE7qbFVHpgXUGHmdtQQ68GGSvuT61CnUcYwM27PSmisc3v4hDGM+TCD1/jQDY5GkVFC7sCumA==
X-Received: by 2002:a17:906:794d:b0:a9a:a55:1e6 with SMTP id a640c23a62f3a-a9eefe9bae8mr803687466b.3.1731507782300;
        Wed, 13 Nov 2024 06:23:02 -0800 (PST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa1dda672easm240519366b.40.2024.11.13.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 06:23:02 -0800 (PST)
Date: Wed, 13 Nov 2024 15:22:59 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, David Hildenbrand <david@redhat.com>,
 Greg Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>,
 Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>,
 Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Message-ID: <20241113152259.57983855@mordecai.tesarici.cz>
In-Reply-To: <ed43da27-30bf-4f9d-a952-3d1fe80c5302@arm.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
	<20241017142752.17f2c816@mordecai.tesarici.cz>
	<aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
	<20241111131442.51738a30@mordecai.tesarici.cz>
	<046ce0ae-b4d5-4dbd-ad9d-eb8de1bba1b8@arm.com>
	<20241112104544.574dd733@mordecai.tesarici.cz>
	<5a041e51-a43b-4878-ab68-4757d3141889@arm.com>
	<20241112115039.41993e4b@mordecai.tesarici.cz>
	<20241113134038.5843ab73@mordecai.tesarici.cz>
	<ed43da27-30bf-4f9d-a952-3d1fe80c5302@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_062304_598073_63856A1E 
X-CRM114-Status: GOOD (  29.77  )
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

On Wed, 13 Nov 2024 12:56:24 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 13/11/2024 12:40, Petr Tesarik wrote:
> > On Tue, 12 Nov 2024 11:50:39 +0100
> > Petr Tesarik <ptesarik@suse.com> wrote:
> >   
> >> On Tue, 12 Nov 2024 10:19:34 +0000
> >> Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>  
> >>> On 12/11/2024 09:45, Petr Tesarik wrote:    
> >>>> On Mon, 11 Nov 2024 12:25:35 +0000
> >>>> Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>>       
> >>>>> Hi Petr,
> >>>>>
> >>>>> On 11/11/2024 12:14, Petr Tesarik wrote:      
> >>>>>> Hi Ryan,
> >>>>>>
> >>>>>> On Thu, 17 Oct 2024 13:32:43 +0100
> >>>>>> Ryan Roberts <ryan.roberts@arm.com> wrote:      
> >>>>> [...]      
> >>>>>> Third, a few micro-benchmarks saw a significant regression.
> >>>>>>
> >>>>>> Most notably, getenv and getenvT2 tests from libMicro were 18% and 20%
> >>>>>> slower with variable page size. I don't know why, but I'm looking into
> >>>>>> it. The system() library call was also about 18% slower, but that might
> >>>>>> be related.        
> >>>>>
> >>>>> OK, ouch. I think there are some things we can try to optimize the
> >>>>> implementation further. But I'll wait for your analysis before digging myself.      
> >>>>
> >>>> This turned out to be a false positive. The way this microbenchmark was
> >>>> invoked did not get enough samples, so it was mostly dependent on
> >>>> whether caches were hot or cold, and the timing on this specific system
> >>>> with the specific sequence of bencnmarks in the suite happens to favour
> >>>> my baseline kernel.
> >>>>
> >>>> After increasing the batch count, I'm getting pretty much the same
> >>>> performance for 6.11 vanilla and patched kernels:
> >>>>
> >>>>                         prc thr   usecs/call      samples   errors cnt/samp 
> >>>> getenv (baseline)         1   1      0.14975           99        0   100000 
> >>>> getenv (patched)          1   1      0.14981           92        0   100000       
> >>>
> >>> Oh that's good news! Does this account for all 3 of the above tests (getenv,
> >>> getenvT2 and system())?    
> >>
> >> It does for getenvT2 (a variant of the test with 2 threads), but not
> >> for system. Thanks for asking, I forgot about that one.
> >>
> >> I'm getting substantial difference there (+29% on average over 100 runs):
> >>
> >>                         prc thr   usecs/call      samples   errors cnt/samp  command
> >> system (baseline)         1   1   6937.18016          102        0      100     A=$$
> >> system (patched)          1   1   8959.48032          102        0      100     A=$$
> >>
> >> So, yeah, this should in fact be my priority #1.  
> > 
> > Further testing reveals the workload is bimodal, that is to say the
> > distribution of results has two peaks. The first peak around 3.2 ms
> > covers 30% runs, the second peak around 15.7 ms covers 11%. Two per
> > cent are faster than the fast peak, 5% are slower than slow peak, the
> > rest is distributed almost evenly between them.  
> 
> FWIW, One source of bimodality I've seen on Ampere systems with 2 NUMA nodes is
> placement of the kernel image vs placement of the running thread. If they are
> remote from eachother, you'll see a slowdown. I've hacked this source away in
> the past by effectively using only a single NUMA node (with the help of
> 'maxcpus' and 'mem' kernel cmdline options).

This system has only one NUMA node. But your comment leads in the right
direction. CPU placement does play a role here.

I can consistently get the fast results if I pin the benchmark process
to a single CPU core, or more generally to a CPU set which shares the
L2 cache (as found on eMAG). But the scheduler only considers LLC,
which (with CONFIG_SCHED_CLUSTER=y) follows the complex affinity of the
SLC.

Long story short, without explicit affinity, the scheduler may place a
forked child onto a CPU with a cold L2 cache, which harms short-lived
processes (like the ones created by this benchmark).

Now it all makes sense and it is totally unrelated to dynamic page size
selection. :-)

Petr T

