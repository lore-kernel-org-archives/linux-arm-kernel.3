Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09586C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51MXSIz01v2zZUYglT8WCA+VxWNWBxG8GinukyiOxuM=; b=BhOp4nZJKCtMGqiQU1TvlXSv/x
	HhOs5NvgWB55FG5los3nZ2/0Ba6W8kheviu+qcgiZHj4zlr4JK9cph9JdZZiqUVLPQtqCxfjO1qaz
	vujDfGYH8uWIDcLHoPX0Ddj46529Sp4+7+FIHTJaeEabXtWHLxa5M80ocboDcPONE22ztDpHHtbYS
	MQ/qzUUfQJ17Syw1Cmzg1qNSx75g+o4SWYCvQ4GMOKlLBS6edawpvnihWpztyFQVDlf6DEp/AnhEg
	Di7ZPN0Cem0Uie3zfcozONY0CwxiMHsd+rS0BnFd+tuWpmF/ZSGNHrhUvbWD6P6IQaLaZEMY1GeMj
	6CPsaawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNpa-00000008Ofi-2UmL;
	Wed, 25 Jun 2025 10:58:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMU6-000000088Z9-16Qe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 09:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=51MXSIz01v2zZUYglT8WCA+VxWNWBxG8GinukyiOxuM=; b=T0hKL8t6mooi63qc6S+et8AjEC
	NVwOjCyKJ0NVeoGkxhfxlkPSOEAwqvdXxiNgnbDwJcu527SaM1mxQWC/cKtInWKKMKBvmZpCmV2EA
	eAUPbUBIq1el0HbcRgXOzWAFWBzG8vI9Mzv9p70J/3QX1dfYCIT+6sPBPTEarR3OOXBuazAbLLQFy
	xDBGoQ/8cJO91/xRVEMwE5PZCMfGvIkC8yKJoLjx4Ml8zhQfEQ8SV4LMlS7voq7Xcs8iUG8+wrEP0
	qJ0amzUljiPfMKhQGnEVcPhAbjynpeywC4kz46mj82jGmUDPssxzsKj3oXfYGWCn4oTEj0ccQHFyj
	97KGRIwg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMTy-00000005joy-1YGc;
	Wed, 25 Jun 2025 09:31:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C64AD308983; Wed, 25 Jun 2025 11:31:52 +0200 (CEST)
Date: Wed, 25 Jun 2025 11:31:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, gregkh@linuxfoundation.org,
	Will Deacon <will@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
	Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
Message-ID: <20250625093152.GZ1613376@noisy.programming.kicks-ass.net>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
 <20250625085204.GC1613200@noisy.programming.kicks-ass.net>
 <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com>
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

On Wed, Jun 25, 2025 at 02:12:39AM -0700, H. Peter Anvin wrote:
> On June 25, 2025 1:52:04 AM PDT, Peter Zijlstra <peterz@infradead.org> wrote:
> >On Tue, Jun 24, 2025 at 04:47:56PM +0100, Jonathan Cameron wrote:
> >
> >> On x86 there is the much loved WBINVD instruction that causes a write back
> >> and invalidate of all caches in the system. It is expensive but it is
> >
> >Expensive is not the only problem. It actively interferes with things
> >like Cache-Allocation-Technology (RDT-CAT for the intel folks). Doing
> >WBINVD utterly destroys the cache subsystem for everybody on the
> >machine.
> >
> >> necessary in a few corner cases. 
> >
> >Don't we have things like CLFLUSH/CLFLUSHOPT/CLWB exactly so that we can
> >avoid doing dumb things like WBINVD ?!?
> >
> >> These are cases where the contents of
> >> Physical Memory may change without any writes from the host. Whilst there
> >> are a few reasons this might happen, the one I care about here is when
> >> we are adding or removing mappings on CXL. So typically going from
> >> there being actual memory at a host Physical Address to nothing there
> >> (reads as zero, writes dropped) or visa-versa. 
> >
> >> The
> >> thing that makes it very hard to handle with CPU flushes is that the
> >> instructions are normally VA based and not guaranteed to reach beyond
> >> the Point of Coherence or similar. You might be able to (ab)use
> >> various flush operations intended to ensure persistence memory but
> >> in general they don't work either.
> >
> >Urgh so this. Dan, Dave, are we getting new instructions to deal with
> >this? I'm really not keen on having WBINVD in active use.
> >
> 
> WBINVD is the nuclear weapon to use when you have lost all notion of
> where the problematic data can be, and amounts to a full reset of the
> cache system. 
> 
> WBINVD can block interrupts for many *milliseconds*, system wide, and
> so is really only useful for once-per-boot type events, like MTRR
> initialization.

Right this... But that CXL thing sounds like that's semi 'regular' to
the point that providing some infrastructure around it makes sense. This
should not be.

