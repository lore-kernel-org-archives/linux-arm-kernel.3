Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9906C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmWjPE7D3mF+0RXhrRJoYzPbnQ2jl43nEJ1OVAPJTsw=; b=TPrRqavwWcgSZG/SgFznOgeyxI
	F/kutRHvVlgXQU49MVUHDd9kMSPqEQB+7qbmE8HWjATV0KK4FibD1tr1muucmHu0ihnVCTCwMrc4e
	gL5u71NPzZuVPmt4s0uEhpsBmpk8Jf4qz1BIsl5R+sXsYTjHzxBfB4la359dsUVr8sZbgrtEv+k8P
	IoYH4HXuApeFhYuUG6LFI5Q3Sd4o0cjzdqk4FXQnT2m/7j+n2E47FaeSVEKNGsidbSg+YqD/wjhIX
	opuK44RH2wUiKbRIcNnx4AGnaOiY7rLKU7fU0KWGbWx0BrR/jsq0K2nTrAFe6BqpS59s6NDLKAF/U
	/ie+rIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqGx-0000000Bke7-3kcF;
	Thu, 10 Jul 2025 12:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZozz-0000000BYXk-3ZQS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 10:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VmWjPE7D3mF+0RXhrRJoYzPbnQ2jl43nEJ1OVAPJTsw=; b=QSvH7+i+KZyp2mLIqa9KeKnzA4
	mJZ92k/0ULwFm/FdAzd4OQ3kGLbT0N5z9IOFdfb9jDjc/Tyi/6I1b24P4ErNTGMH4peSvitmNgLv/
	iAcAM5G4NdfT21r/fGCTBE9Zn8z6C8lHYGQhaXZbBJ7vlSb/IJ+cf6ARfwEf1uL1jCFvyrF+7aI1W
	1ASrbFUkb+lhPEF7+h8H7rRYkJLimKy+6euvBLC0qPcpwCx/8TeuPGM07wua5kn/6thpPpJN5nHM9
	5OhgqFrBqPla0VazZTb5egiyT7OJPMta1+Ywk0ly/YJ4Dk7Gn0aFiM0VeCLzD3opdK5OLJSTwPou5
	iYhkkGMw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZozk-00000009067-2kW4;
	Thu, 10 Jul 2025 10:59:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6A644300125; Thu, 10 Jul 2025 12:59:13 +0200 (CEST)
Date: Thu, 10 Jul 2025 12:59:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: dan.j.williams@intel.com
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, linuxarm@huawei.com,
	"H. Peter Anvin" <hpa@zytor.com>,
	Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, gregkh@linuxfoundation.org,
	Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Yicong Yang <yangyicong@huawei.com>,
	Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
Message-ID: <20250710105913.GB542000@noisy.programming.kicks-ass.net>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
 <20250625085204.GC1613200@noisy.programming.kicks-ass.net>
 <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com>
 <20250625093152.GZ1613376@noisy.programming.kicks-ass.net>
 <20250625180343.000020de@huawei.com>
 <20250626105530.000010be@huawei.com>
 <686f506020726_1d3d10069@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <686f506020726_1d3d10069@dwillia2-xfh.jf.intel.com.notmuch>
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

On Wed, Jul 09, 2025 at 10:32:16PM -0700, dan.j.williams@intel.com wrote:

> Theoretically there could be a threshold at which a CLFLUSHOPT loop is a
> better option, but I would rather it be the case* that software CXL
> cache management is stop-gap for early generation CXL platforms.

So isn't the problem that CLFLUSH and friends take a linear address
rather than a physical address? I suppose we can use our 1:1 mapping in
this case, is all of CXL in the 1:1 map?

