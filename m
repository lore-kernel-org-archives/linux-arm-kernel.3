Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA28C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClqVsyhHVXssI19LM8BmoHGnur2pPGV5ynfKYamMpMc=; b=OCBe/fGEZ37FgWSnAOBJq5KQZ7
	2fZ/4Kf++31dxHfuSr5Ma4IV3JV2TkLCPs6y+gKzv0pFL5RJDXat4OUHx3F4lj+sqbiKSJm+0khOA
	l9MhQ8aQbQzCOfQ7Z1yiw5V+/5jC4mupnIyeUrwviLkOL1d20mc93/jgRf/Me4vky3l73yhqNmTel
	YckXAcndFZqoEkxkxt1lbVvsSSJGIExYJad6AnwK8AtzXYZrWGA8Y5ea7aXM4Pr52mg4v6Su6lhRG
	Rcfur1/6rf/14eA0i8hRJ/WAqlIttl6mCTAxbhr3q/B9rpIiNBK1t8+3jJaS7hhXu83zigN0dj8oF
	edteX7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RwZ-0000000CkZd-26Q9;
	Tue, 01 Sep 2026 17:06:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RwX-0000000CkYi-1wl2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:06:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 637CE1756;
	Tue,  1 Sep 2026 10:06:36 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B23E23F7D8;
	Tue,  1 Sep 2026 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788282400; bh=Lpma1BsFTfB984TFon8DGswojmIW60uY158QAd/sNt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSMmqxbv72Ix7wOT4SWzA7e04uqe1FtpdK7e0FSRluLERMDVrnKJhTJkC/6YIV2xD
	 ClC+CklAMN76P/n5SZHCtHD2TRJgL/hfa/FD+LvdVafPhgJoKcrru1PKsj63AS1R8G
	 u/TEJfg2nG5O4Gvkm41u52/PsMdgYOlBnXMlV+mY=
Date: Tue, 1 Sep 2026 18:06:37 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Leach <mike.leach@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Michiel van Tol <michiel.vantol@arm.com>,
	Dev Jain <dev.jain@arm.com>, David Hildenbrand <david@kernel.org>,
	Yabin Cui <yabinc@google.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 2/2] perf: arm_spe: Prefer large AUX mappings
Message-ID: <20260901170637.GS8904@e132581.arm.com>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
 <annp-BdTviQoH6vy@willie-the-truck>
 <20260810174159.GC15499@e132581.arm.com>
 <8c8f6c2a-8fc2-4181-87fa-e64101dfce6f@linaro.org>
 <20260811101742.GE15499@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811101742.GE15499@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_100641_593933_A4067622 
X-CRM114-Status: GOOD (  28.30  )
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

Hi Will, Yabin,

On Tue, Aug 11, 2026 at 11:17:42AM +0100, Leo Yan wrote:

> > > The question is how "allocating contiguous AUX pages unnecessarily
> > > exacerbates memory fragmentation." The relevant information I could find
> > > is [1]:
> > > 
> > >   "On Android, we collect ETM data periodically on internal user devices
> > >    for AutoFDO optimization (for both userspace libraries and the
> > >    kernel). Allocating a large chunk of contiguous AUX pages (4M for each
> > >    CPU) periodically is almost unbearable. The kernel may need to kill
> > >    many processes to fulfill the request. It affects user experience even
> > >    after using PMU."

> > This sounds like it could be an attribute to perf_event_open. We can do
> > PREFER_LARGE by default for performance and fewer discontinuities, but on
> > Android or small systems users can enable an option to revert back to single
> > pages.

> > Or can this bit be determined at allocation time: "The kernel may need to
> > kill many processes to fulfill the request"? If this memory pressure exists
> > on allocation then do it one way, if not do it the other way.
> 
> Be careful with "The kernel may need to kill many processes ...".
> 
> The AUX allocator uses:
> 
>   #define PERF_AUX_GFP    (GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY) 
> 
> Documentation/core-api/memory-allocation.rst says that __GFP_NORETRY
> causes the allocator to "fail early rather than cause disruptive
> reclaim" and that "the OOM killer is not invoked".
> 
> Therefore, it is unlikely to me that AUX allocation itself would cause
> the kernel OOM killer to kill processes in order to satisfy the request.
> 
> I am a bit suspect the original observation was related to Android's
> lmkd [1], where allocating the AUX buffers increased overall memory
> pressure and indirectly caused processes to be killed. If so, I think it
> is important to understand what actually triggered those kills.

I'd like to follow up on this, as I am not sure how we should proceed
without more information about the original process-kill issue.

If the original process-kill killer issue can be handled on the Android
side (e.g., configure lmkd), we could consider preferring large AUX
mappings by default. Otherwise, we may need to add an perf_event_open()
attribute as James suggested, but that would add complexity to both the
kernel and tools.

Could you share what actually triggered the process kills? That would
help us decide which direction to take.

Thanks,
Leo

