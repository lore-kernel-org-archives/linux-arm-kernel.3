Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967ECC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03czVGrjzN1/CisGS8a1WUUMDWMM4durwiM3BHZwY4M=; b=bO11VPfuvvvoncWPFJp4qEawnd
	V0IlXLPU5R6R5dohuuzor26P1jqw6+SRrGzBuVntFrgw7LGzxCtVxKyhHvp+s1qLbqh7DQTzMv4gm
	aArESnh5mZWE6h6eJ+ELmGQ8IXKV1PzgCOjg+dZWx3J8RvDrm3cTB5I7Zrqs9XC3BSTJCG2RrRY3n
	3P47sKa3LR/gfUSapEO0kbqJ2goF2yct2qM3pNkRVR7onUEwltXzU4h5w0Etu/zuFieBMjmbkE9Zx
	Un0Hq92mu+KUJSaz5PAOr7RK7a9bY4FVTPfJcDmIfKXWJtR4fev93QFnVCA+gNtOCM5osXBjXD8+O
	9aEvfOBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUX3C-00000009ugl-2dYZ;
	Wed, 25 Jun 2025 20:48:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTXP-00000009Pxo-2xJH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 17:03:57 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bS7Pk1vB4z6K9B9;
	Thu, 26 Jun 2025 01:01:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 7DA671402EC;
	Thu, 26 Jun 2025 01:03:47 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Jun
 2025 19:03:46 +0200
Date: Wed, 25 Jun 2025 18:03:43 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: "H. Peter Anvin" <hpa@zytor.com>, Catalin Marinas
	<catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Davidlohr Bueso
	<dave@stgolabs.net>, Yicong Yang <yangyicong@huawei.com>,
	<linuxarm@huawei.com>, Yushan Wang <wangyushan12@huawei.com>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	<x86@kernel.org>, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
Message-ID: <20250625180343.000020de@huawei.com>
In-Reply-To: <20250625093152.GZ1613376@noisy.programming.kicks-ass.net>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
	<20250625085204.GC1613200@noisy.programming.kicks-ass.net>
	<FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com>
	<20250625093152.GZ1613376@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_100356_017291_2B8D0A53 
X-CRM114-Status: GOOD (  30.41  )
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

On Wed, 25 Jun 2025 11:31:52 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Wed, Jun 25, 2025 at 02:12:39AM -0700, H. Peter Anvin wrote:
> > On June 25, 2025 1:52:04 AM PDT, Peter Zijlstra <peterz@infradead.org> wrote:  
> > >On Tue, Jun 24, 2025 at 04:47:56PM +0100, Jonathan Cameron wrote:
> > >  
> > >> On x86 there is the much loved WBINVD instruction that causes a write back
> > >> and invalidate of all caches in the system. It is expensive but it is  
> > >
> > >Expensive is not the only problem. It actively interferes with things
> > >like Cache-Allocation-Technology (RDT-CAT for the intel folks). Doing
> > >WBINVD utterly destroys the cache subsystem for everybody on the
> > >machine.
> > >  
> > >> necessary in a few corner cases.   
> > >
> > >Don't we have things like CLFLUSH/CLFLUSHOPT/CLWB exactly so that we can
> > >avoid doing dumb things like WBINVD ?!?
> > >  
> > >> These are cases where the contents of
> > >> Physical Memory may change without any writes from the host. Whilst there
> > >> are a few reasons this might happen, the one I care about here is when
> > >> we are adding or removing mappings on CXL. So typically going from
> > >> there being actual memory at a host Physical Address to nothing there
> > >> (reads as zero, writes dropped) or visa-versa.   
> > >  
> > >> The
> > >> thing that makes it very hard to handle with CPU flushes is that the
> > >> instructions are normally VA based and not guaranteed to reach beyond
> > >> the Point of Coherence or similar. You might be able to (ab)use
> > >> various flush operations intended to ensure persistence memory but
> > >> in general they don't work either.  
> > >
> > >Urgh so this. Dan, Dave, are we getting new instructions to deal with
> > >this? I'm really not keen on having WBINVD in active use.
> > >  
> > 
> > WBINVD is the nuclear weapon to use when you have lost all notion of
> > where the problematic data can be, and amounts to a full reset of the
> > cache system. 
> > 
> > WBINVD can block interrupts for many *milliseconds*, system wide, and
> > so is really only useful for once-per-boot type events, like MTRR
> > initialization.  
> 
> Right this... But that CXL thing sounds like that's semi 'regular' to
> the point that providing some infrastructure around it makes sense. This
> should not be.

I'm fully on board with the WBINVD issues (and hope for something new for
the X86 world). However, this particular infrastructure (for those systems
that can do so) is about pushing the problem and information to where it
can be handled in a lot less disruptive fashion. It can take 'a while' but
we are flushing only cache entries in the requested PA range. Other than
some potential excess snoop traffic if the coherency tracking isn't precise,
there should be limited affect on the rest of the system.

So, for the systems I particularly care about, the CXL case isn't that bad.

Just for giggles, if you want some horror stories the (dropped) ARM PSCI
spec provides for approaches that require synchronization of calls across
all CPUs.

"CPU Rendezvous" in the attributes of CLEAN_INV_MEMREGION requires all
CPUs to make a call within an impdef (discoverable) timeout.
https://developer.arm.com/documentation/den0022/falp1/?lang=en

I gather no one actually needs that on 'real' systems - that is systems
where we actually need to do these flushes! The ACPI 'RFC' doesn't support
that delight.

Jonathan


