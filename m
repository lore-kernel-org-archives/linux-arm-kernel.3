Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74B9C83000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuB6DJokf+kOHeXrbarpBOCXQ2R6TXTfr6dB5Ad6/3o=; b=v1xxBQCNS/XxlsMpZyP8Fieqjo
	CyH5vjoYm3W7mXBsghFMfhBqpJg1jckZEr4icn70FGitoLHS+RW58hy6RxRnFZfQeJawfSucwwQFy
	uwP6kVMJevtIyj8dFCrxPHgah/xWJSI699eCGHgfGD6zI1bP8zPfNt7Vtld6aD5jhFxUUzWhQg03e
	qWudTK59yU8G62UM3xFk+Jig0oAOoVoB/MWHJYsqBwWpd7EiEmt00Uy1H75EXLi+jSMAsDALADIEJ
	/k9J1abiMrGq18P9YSea2iTlSioFil8fORCCzU3tc3J1Bw1l6L4bX+8nwiRC0raWtFB1D2ULH8WHd
	K0wz+onA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOvo-00000008a3e-3nIw;
	Wed, 25 Jun 2025 12:08:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULrU-0000000826t-3gAT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 08:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kuB6DJokf+kOHeXrbarpBOCXQ2R6TXTfr6dB5Ad6/3o=; b=qdhhzZ/loUJj4/x5n1ZsfY53Nz
	Fntzcq+G7Y/WZyznoGpiZ7N4mKDED4CDh/WdAgmi3O+iNUt7rgLHT3tHo5gFYzOj9lYVZpAm+ZnrP
	G05fPGu8gkCAHZvkBTPR4I0oA+PUFsXB3oApC0I2V0hRhpNPY/5aMfB5xm29ewdmMfBHjM4tJbnLw
	QxfeCT0jEuuQkqMrvyWdmXRe5fVFGCMyj45ECw6qFjSmQaMeCSy45iIgODWENrFchbf8SeEcFryJY
	JJw69p01O0rNbx5o/QkCzhrKPISMe+xwHd1X/oTD9eXtsti2Bp90yL3XCAYmh7O5IOyLtZ1+D0yLZ
	oBU97CHw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULrR-00000008vs3-11Ci;
	Wed, 25 Jun 2025 08:52:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C97B3308983; Wed, 25 Jun 2025 10:52:04 +0200 (CEST)
Date: Wed, 25 Jun 2025 10:52:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
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
	x86@kernel.org, H Peter Anvin <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
Message-ID: <20250625085204.GC1613200@noisy.programming.kicks-ass.net>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
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

On Tue, Jun 24, 2025 at 04:47:56PM +0100, Jonathan Cameron wrote:

> On x86 there is the much loved WBINVD instruction that causes a write back
> and invalidate of all caches in the system. It is expensive but it is

Expensive is not the only problem. It actively interferes with things
like Cache-Allocation-Technology (RDT-CAT for the intel folks). Doing
WBINVD utterly destroys the cache subsystem for everybody on the
machine.

> necessary in a few corner cases. 

Don't we have things like CLFLUSH/CLFLUSHOPT/CLWB exactly so that we can
avoid doing dumb things like WBINVD ?!?

> These are cases where the contents of
> Physical Memory may change without any writes from the host. Whilst there
> are a few reasons this might happen, the one I care about here is when
> we are adding or removing mappings on CXL. So typically going from
> there being actual memory at a host Physical Address to nothing there
> (reads as zero, writes dropped) or visa-versa. 

> The
> thing that makes it very hard to handle with CPU flushes is that the
> instructions are normally VA based and not guaranteed to reach beyond
> the Point of Coherence or similar. You might be able to (ab)use
> various flush operations intended to ensure persistence memory but
> in general they don't work either.

Urgh so this. Dan, Dave, are we getting new instructions to deal with
this? I'm really not keen on having WBINVD in active use.


