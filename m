Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1C9C83000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0X9odSBquWZgGrWGhDzkeU3VtuQN/OVuUzzgJaBZJo=; b=WHyFf9GIRURB3uxhKztnTN0pdk
	KeXeDyQtnkPcgpc1VbDzuoYdMIEKNCrbyhfePwnXQkRs3F7yKWyUO6kuY882dDiqSpfGIYQ7AEfL4
	3Nyb2/IKaEAfhYxJ2z1TmGkJDuybPoUtKYMyxtVK1MoWP7q9sFh9K6rZbeVrPbJNxFsMXl/NMwdeu
	qfX1q/v2UHqDVOK+J2zJGRpzlXqLnOc552chJt09ElmazkmG2PHCHL0hubXNkDd6z0JKVltNv2/VS
	4bNuUdR3jJBB+YP9qcQNQFit9xW/2AYJpLhOyQKccxUu0Fwcn6JGnrPVHZzp8QS1AL5D5SlOAIl0A
	KxW4VTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkgw-0000000BNw5-12VZ;
	Thu, 26 Jun 2025 11:22:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjKk-0000000BDS2-2CTy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Jun 2025 09:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=n0X9odSBquWZgGrWGhDzkeU3VtuQN/OVuUzzgJaBZJo=; b=kDzPsuixG/6ZJhprj/T6lOSU/9
	p3fJut1cuPuLV8DD1jKJeJgFiA/PKIIlbtTurgKib55dod6/joeZpWtxs/PDmnr8OVbsHV18GVu7G
	GvhRbAf5TzY9lVqdwAuyWgx8Pm9pTEUbyaXpj3Ymm1BbdJKKiImLTK2BDA3Ug2smgx/VuRKtDNEi7
	U1pFemrA0gT3yoTU1882cjv9xYF77Vu64OtV4RPv0OjUCnbCpHkfyEEu3jNKudVLkdJIOjL8Ej3WT
	O9BcAFSdZJ5QEdO77KaQ+SQwczuJgBvkBb7hFN85Yp9DVBPKc7Jx/bDI4LxFrBZhCp/2rzLefZjWO
	LeTVCSQQ==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjKh-000000064fj-3009
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:55:53 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bSYvB2ts6z6M508;
	Thu, 26 Jun 2025 17:54:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 610D61402EC;
	Thu, 26 Jun 2025 17:55:33 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 26 Jun
 2025 11:55:32 +0200
Date: Thu, 26 Jun 2025 10:55:30 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Peter Zijlstra <peterz@infradead.org>, <linuxarm@huawei.com>
CC: "H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas
	<catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Davidlohr Bueso
	<dave@stgolabs.net>, Yicong Yang <yangyicong@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
Message-ID: <20250626105530.000010be@huawei.com>
In-Reply-To: <20250625180343.000020de@huawei.com>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
	<20250625085204.GC1613200@noisy.programming.kicks-ass.net>
	<FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com>
	<20250625093152.GZ1613376@noisy.programming.kicks-ass.net>
	<20250625180343.000020de@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_105551_861925_504B7505 
X-CRM114-Status: GOOD (  39.74  )
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

On Wed, 25 Jun 2025 18:03:43 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Wed, 25 Jun 2025 11:31:52 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Wed, Jun 25, 2025 at 02:12:39AM -0700, H. Peter Anvin wrote:  
> > > On June 25, 2025 1:52:04 AM PDT, Peter Zijlstra <peterz@infradead.org> wrote:    
> > > >On Tue, Jun 24, 2025 at 04:47:56PM +0100, Jonathan Cameron wrote:
> > > >    
> > > >> On x86 there is the much loved WBINVD instruction that causes a write back
> > > >> and invalidate of all caches in the system. It is expensive but it is    
> > > >
> > > >Expensive is not the only problem. It actively interferes with things
> > > >like Cache-Allocation-Technology (RDT-CAT for the intel folks). Doing
> > > >WBINVD utterly destroys the cache subsystem for everybody on the
> > > >machine.
> > > >    
> > > >> necessary in a few corner cases.     
> > > >
> > > >Don't we have things like CLFLUSH/CLFLUSHOPT/CLWB exactly so that we can
> > > >avoid doing dumb things like WBINVD ?!?
> > > >    
> > > >> These are cases where the contents of
> > > >> Physical Memory may change without any writes from the host. Whilst there
> > > >> are a few reasons this might happen, the one I care about here is when
> > > >> we are adding or removing mappings on CXL. So typically going from
> > > >> there being actual memory at a host Physical Address to nothing there
> > > >> (reads as zero, writes dropped) or visa-versa.     
> > > >    
> > > >> The
> > > >> thing that makes it very hard to handle with CPU flushes is that the
> > > >> instructions are normally VA based and not guaranteed to reach beyond
> > > >> the Point of Coherence or similar. You might be able to (ab)use
> > > >> various flush operations intended to ensure persistence memory but
> > > >> in general they don't work either.    
> > > >
> > > >Urgh so this. Dan, Dave, are we getting new instructions to deal with
> > > >this? I'm really not keen on having WBINVD in active use.
> > > >    
> > > 
> > > WBINVD is the nuclear weapon to use when you have lost all notion of
> > > where the problematic data can be, and amounts to a full reset of the
> > > cache system. 
> > > 
> > > WBINVD can block interrupts for many *milliseconds*, system wide, and
> > > so is really only useful for once-per-boot type events, like MTRR
> > > initialization.    
> > 
> > Right this... But that CXL thing sounds like that's semi 'regular' to
> > the point that providing some infrastructure around it makes sense. This
> > should not be.  
> 
> I'm fully on board with the WBINVD issues (and hope for something new for
> the X86 world). However, this particular infrastructure (for those systems
> that can do so) is about pushing the problem and information to where it
> can be handled in a lot less disruptive fashion. It can take 'a while' but
> we are flushing only cache entries in the requested PA range. Other than
> some potential excess snoop traffic if the coherency tracking isn't precise,
> there should be limited affect on the rest of the system.
> 
> So, for the systems I particularly care about, the CXL case isn't that bad.
> 
> Just for giggles, if you want some horror stories the (dropped) ARM PSCI
> spec provides for approaches that require synchronization of calls across
> all CPUs.
> 
> "CPU Rendezvous" in the attributes of CLEAN_INV_MEMREGION requires all
> CPUs to make a call within an impdef (discoverable) timeout.
> https://developer.arm.com/documentation/den0022/falp1/?lang=en
> 
> I gather no one actually needs that on 'real' systems - that is systems
> where we actually need to do these flushes! The ACPI 'RFC' doesn't support
> that delight.

Seems I introduced some confusion.  Let me try summarizing:

1. x86 has a potential feature gap. From a CXL ecosystem point of view I'd
   like to see that gap closed. (Inappropriate for me to make any proposals
   on how to do it on that architecture).

2. This patch set has nothing to do with x86 (beyond modifying a function
   signature). The hardware it is targeting avoids many of the issues around
   WBINVD. The solution is not specific to ARM64, though the implementation
   I care about is on an ARM64 implementation.

Right now, on x86 we have a functionally correct solution, this patch set
adds infrastructure and 2 implementations to provide similar for other
architectures.

Jonathan

