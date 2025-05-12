Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBA7C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xnVwIhyFMDSpqGYomF9umDJEPijHMRiwe074qnkHTk=; b=JcHZ7W7/UNS9H9ycab6k6uGHHm
	5zPvNBxAVusQPVlCSBbrFxsUBUHmD3IQSadf19T4DfeAT4/2vCdQPGiUxLA6063cl8nNCoo4oT090
	t86/kWz0sXag/pyuqCHE6waetpo/a0ZcuadVQAw6JeqwL9g2T94/UPftpfIS4y4TJIUVf4y3pz97P
	wsQzjlb94xdIwtH2Usr+xh5UgOhw7fK0INrzrfN/rERJHo8mquyWD5tzNKPDR4h+x8QSJTezCG1+i
	q3vsTtFd1peS33YVRJ2uzLlXM3H2dkCt116GyRjpCo8kyz8dztKvmqXvGcFeFoOub76HziD7l9KDA
	95uLMUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVUO-00000009x1q-0SQT;
	Mon, 12 May 2025 15:54:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVAw-00000009sq5-18Dv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:34:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C3F214BF;
	Mon, 12 May 2025 08:34:28 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBEEE3F63F;
	Mon, 12 May 2025 08:34:37 -0700 (PDT)
Date: Mon, 12 May 2025 16:34:35 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>, Will Deacon <will@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Message-ID: <20250512-straight-dexterous-oxpecker-fabbc8@sudeepholla>
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_083442_357771_2188E764 
X-CRM114-Status: GOOD (  25.07  )
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

On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
> On 5/10/25 03:04, Sudeep Holla wrote:
> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
> >> Cache geometry is exposed through the Cache Size ID register. There is
> >> one register for each cache, and they are selected through the Cache
> >> Size Selection register. If FEAT_CCIDX is implemented, the layout of
> >> CCSIDR changes to allow a larger number of sets and ways.
> >> 
> > 
> > Please refer
> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
> > 
> 
> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
> | in conjunction with set/way cache maintenance and are not guaranteed to
> | represent the actual microarchitectural features of a design.
> | 
> | The architecture explicitly states:
> | 
> | | You cannot make any inference about the actual sizes of caches based
> | | on these parameters.
> 
> However, on many cores (A53, A72, and surely others that I haven't
> checked) these *do* expose the actual microarchitectural features of the
> design. Maybe a whitelist would be suitable.
> 
> | Furthermore, CCSIDR_EL1.{WT,WB,RA,WA} have been removed retrospectively
> | from ARMv8 and are now considered to be UNKNOWN.
> | 
> | Since the kernel doesn't make use of set/way cache maintenance and it is
> | not possible for userspace to execute these instructions, we have no
> | need for the CCSIDR information in the kernel.
> 
> Actually, these parameters are directly visible (and useful) to
> userspace in the form of the cache size. Rather than make userspace
> perform benchmarks, we can expose this information in a standard way.

Yes that is already present, which is DT or ACPI.

> There is of course [id]cache-size, but these properties are absent more
> often than not:
> 
> $ git grep arm,cortex- 'arch/arm64/**.dtsi' | wc -l
> 1248
> $ git grep d-cache-size 'arch/arm64/**.dtsi' | wc -l
> 320
>

Just to be clear, I am fine with exposing to the userspace, but just
not reading those registers as stated in the commit message I shared
earlier.

Why can't it be done via DT/ACPI ?

-- 
Regards,
Sudeep

