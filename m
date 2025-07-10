Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69295C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pEA1uNTqPvv6+XR/zuY/aMB8/9LJc6Rsl4Iqenx7gQ=; b=RGgbDnxEnsbsz2GxOa0Rv21Acj
	Ql3ePiLrWtMxW+rTk4c9pdXflX/tATAZctwCgwQOwQXZX+LNR7pyMojgqVNMEHUy/E6jiGJNDJH4w
	3CJWhK+byPnX40z603qC+hffGWrxtjxeJSKfzwnhX1kR/dOsmjoVRHIpG+sGEKBUxY2SGMZ9Bq9J+
	WTE7CwsOXQubDisb2Kai9NT2y1hnf8EzrvKCJCllOnVhs44a7WMLz6n25VS9VsInSbRHY5GF94ihg
	Y2ua6XT2fTqVdiBmr2Al9B8QVETliCEvAe/Mlgwv/BGaU+KtZyEnTmUWSRv45p6aBcIqSFh2YcDZj
	gDrnuGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrKl-0000000Bvm5-3Ku3;
	Thu, 10 Jul 2025 13:29:07 +0000
Received: from [2001:8b0:10b:1236:d4b0:a112:9c86:6a4b] (helo=casper.infradead.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZox7-0000000BY3Q-3Uf9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Jul 2025 10:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7pEA1uNTqPvv6+XR/zuY/aMB8/9LJc6Rsl4Iqenx7gQ=; b=Q53Dg/bFa0IOiKKDOS+53JMqLd
	rWu6gVsz2DbYQS7/ZS4GsN7sNLBcFe5gtoDTA70AVg1E6+YN+gLVdwXFrHrG7RJBHNdiLIHL2Hqig
	eJ+2QJCO3siJAdamLStruKmbDre9sLI7jMYWnF5BCA5rSs1oL0ob/BF6Fe8Z63IeS5ED3rgQepKHw
	Rp9hPkGAAcNYMOaycRM3nSDZknPNn/2oJ9rQv0kHpzKQaU4FkLsK9SaAIbtD4844S1AGIiqdNQ/1B
	I/5ta9es7JbfQwyn1KjbLHwNTOA5vk9C05tctaYwRZOGHrIASCwI7FNGr7RW4hxkUIp3aRH6mBZtm
	iTMs9ePg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZowy-00000008aeW-27gb;
	Thu, 10 Jul 2025 10:56:24 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0B932300125; Thu, 10 Jul 2025 12:56:23 +0200 (CEST)
Date: Thu, 10 Jul 2025 12:56:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: dan.j.williams@intel.com
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
	linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, gregkh@linuxfoundation.org,
	Will Deacon <will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
	Yushan Wang <wangyushan12@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2 0/8] Cache coherency management subsystem
Message-ID: <20250710105622.GA542000@noisy.programming.kicks-ass.net>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
 <20250625085204.GC1613200@noisy.programming.kicks-ass.net>
 <FB7122A4-BF5E-4C05-805A-2EE3240286A1@zytor.com>
 <20250625093152.GZ1613376@noisy.programming.kicks-ass.net>
 <686f4e20c57cd_1d3d100b7@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <686f4e20c57cd_1d3d100b7@dwillia2-xfh.jf.intel.com.notmuch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_035633_872316_90FADA5E 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, Jul 09, 2025 at 10:22:40PM -0700, dan.j.williams@intel.com wrote:

> "Regular?", no. Something is wrong if you are doing this regularly. In
> current CXL systems the expectation is to suffer a WBINVD event once per
> server provisioning event.

Ok, so how about we strictly track this once, and when it happens more
than this once, we error out hard?

> Now, there is a nascent capability called "Dynamic Capacity Devices"
> (DCD) where the CXL configuration is able to change at runtime with
> multiple hosts sharing a pool of memory. Each time the physical memory
> capacity changes, cache management is needed.
> 
> For DCD, I think the negative effects of WBINVD are a *useful* stick to
> move device vendors to stop relying on software to solve this problem.
> They can implement an existing CXL protocol where the device tells CPUs
> and other CXL.cache agents to invalidate the physical address ranges
> that the device owns.
> 
> In other words, if WBINVD makes DCD inviable that is a useful outcome
> because it motivates unburdening Linux long term with this problem.

Per the above, I suggest we not support this feature *AT*ALL* until an
alternative to WBINVD is provided.

> In the near term though, current CXL platforms that do not support
> device-initiated-invalidate still need coarse cache management for that
> original infrequent provisioning events. Folks that want to go further
> and attempt frequent DCD events with WBINVD get to keep all the pieces.

I would strongly prefer those pieces to include WARNs and or worse.

