Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5297C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgveFXz0aPZb86sTyapTaqRebr2jiJ1fiLR3Fd+pKjw=; b=X5iWueEq1syAyoBpKpUW7lw8Q2
	i0CoFk22Vf61pG+wVckipfHhnzSyOHdfRzGJq5JiQQQOBl0TGOW4OAIXHtgohNH6ZWyg9Gx5sTVs1
	zLRZz6n86V8k62fUGEI0FzFAU6lmpy+ErvDzDfeTu6HlFmJfuSgNqh5yTt+mNnnHyDZtEEjUuFDwv
	A3cCRxrzZBLxVikEr+PYrlBhn1iDj3p4WQFTK4Nn00UkBzZ0OY/X8NwBGyrMVq+cL4CK9DWL1zw1s
	TIWEydESjvJut58R1m66aSXz5q32vwk08lNjVsDc3ZBn5iDqmszj9dM54R8LSRFQBTt47FmutFGeb
	GpdqaqFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjYK-0000000Dpih-26H7;
	Tue, 11 Aug 2026 10:17:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjYH-0000000DpiD-3rUY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 10:17:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8B1D14BF;
	Tue, 11 Aug 2026 03:17:40 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 573883F86F;
	Tue, 11 Aug 2026 03:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786443464; bh=ZE7nm7ffD93BfMT8HVYKCGTJj/+7QxUldSFCAd+HgnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GfDmzwVp6hox1IdOhr4CkTgrII9BC/aPtQ+CsaNYGnwMUuTn2WmZFcM8dT9zU5apC
	 VJ4nZ0tn1xd/tYEk+msKedPgBfBoKTFFPf94b+45LR+aZd5IemiOBPqcaHUrOdmUVn
	 rV0BJ0lhyNLymFjbsKMoALJn3c9gAK95MLqJNC8M=
Date: Tue, 11 Aug 2026 11:17:42 +0100
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
Message-ID: <20260811101742.GE15499@e132581.arm.com>
References: <20260810-perf_aux_trace_large_granule-v1-0-03306c9339e3@arm.com>
 <20260810-perf_aux_trace_large_granule-v1-2-03306c9339e3@arm.com>
 <annp-BdTviQoH6vy@willie-the-truck>
 <20260810174159.GC15499@e132581.arm.com>
 <8c8f6c2a-8fc2-4181-87fa-e64101dfce6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c8f6c2a-8fc2-4181-87fa-e64101dfce6f@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_031746_003882_B689EE73 
X-CRM114-Status: GOOD (  19.85  )
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

On Tue, Aug 11, 2026 at 10:02:44AM +0100, James Clark wrote:

[...]

> > The question is how "allocating contiguous AUX pages unnecessarily
> > exacerbates memory fragmentation." The relevant information I could find
> > is [1]:
> > 
> >   "On Android, we collect ETM data periodically on internal user devices
> >    for AutoFDO optimization (for both userspace libraries and the
> >    kernel). Allocating a large chunk of contiguous AUX pages (4M for each
> >    CPU) periodically is almost unbearable. The kernel may need to kill
> >    many processes to fulfill the request. It affects user experience even
> >    after using PMU."
> > 
> 
> This sounds like it could be an attribute to perf_event_open. We can do
> PREFER_LARGE by default for performance and fewer discontinuities, but on
> Android or small systems users can enable an option to revert back to single
> pages.
> 
> Or can this bit be determined at allocation time: "The kernel may need to
> kill many processes to fulfill the request"? If this memory pressure exists
> on allocation then do it one way, if not do it the other way.

Be careful with "The kernel may need to kill many processes ...".

The AUX allocator uses:

  #define PERF_AUX_GFP    (GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY) 

Documentation/core-api/memory-allocation.rst says that __GFP_NORETRY
causes the allocator to "fail early rather than cause disruptive
reclaim" and that "the OOM killer is not invoked".

Therefore, it is unlikely to me that AUX allocation itself would cause
the kernel OOM killer to kill processes in order to satisfy the request.

I am a bit suspect the original observation was related to Android's
lmkd [1], where allocating the AUX buffers increased overall memory
pressure and indirectly caused processes to be killed. If so, I think it
is important to understand what actually triggered those kills.

Thanks,
Leo

[1] https://source.android.com/docs/core/perf/lmkd?hl=en&utm_source=chatgpt.com

