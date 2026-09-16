Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C586C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PK71Qn8g7UIlyUkCx3zYUQkT2Jhe2lxV5dAxPmYCTXw=; b=g6ZW3GEObwFnVqJisiXxY0Dhg5
	YBhWTdJSNrU4LoHxntpgMurpkEcjc9ZP8p6uTHm2st+mcs/KGsrNGZBmR+X/zT+Jkj8tsUjaVk/cy
	v9sZG1scmWROaUrML0h/OT8sQdHAv0/QsIeBWrvlzGL9ZgQfOrDN8FVvId58qa4JuvtsSLmtHXkVf
	B4kPqIOmbl3nHVywiqrmovYwszmScAPvoe/mosrqYsUShgPYEB4mFoOlf/c/05iiRngrnR5imkBv0
	oSHPoVzyARUw8Pl0RPvehjPGlCvGOCy2yuifIPgN61YmcQrwBK9bQGxrXiUxDq76HYM4WwTJIaqal
	O52SXTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qM9-00000009NK8-405j;
	Wed, 16 Sep 2026 14:11:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qM1-00000009NIW-47Z0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 14:11:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA55152B;
	Wed, 16 Sep 2026 07:11:12 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A822C3F7B4;
	Wed, 16 Sep 2026 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789567876; bh=rOa03SY4j4JIWvwmr/q0JqYln1LWacblLJDVI8/iMoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C825ldyoMd5ehAjteADceZMDfD9FBr9cC5efR2nMf9zLkWdgbKPQkBUnnGOwtPMRJ
	 Jbgluge032MtFb/nyCjqy6oZ98X3jyv4Hdbs/QYxujOstbrI/14KwKzgXN+q0ob5OJ
	 ZBcWbpauChw+zIJemq4UuCCc0GFKDZ5NsmiDQOgo=
Date: Wed, 16 Sep 2026 15:11:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: NoNine <chenmin83@gmail.com>, suzuki.poulose@arm.com,
	mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Min Chen <min.chen@siengine.com>
Subject: Re: [PATCH 1/1] coresight: tmc-etr: Sync the trace buffer for the
 device
Message-ID: <20260916141113.GI200420@e132581.arm.com>
References: <20260915130503.645953-1-min.chen@siengine.com>
 <20260915130503.645953-2-min.chen@siengine.com>
 <b803b63c-8278-4159-9305-f71ed001bdc7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b803b63c-8278-4159-9305-f71ed001bdc7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_071118_102722_B604CEEA 
X-CRM114-Status: GOOD (  21.95  )
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

On Wed, Sep 16, 2026 at 11:04:20AM +0800, Jie Gan wrote:

[...]

> > From: Min Chen <min.chen@siengine.com>
> > 
> > The flat ETR buffer comes from dma_alloc_noncoherent(), which zeroes it
> > with CPU stores.  The DMA API requires the caller to sync the buffer for
> > the device before the device writes into it, but the TMC driver only
> > ever syncs for the CPU afterwards.  On a non-coherent sink the zero fill
> > is therefore still dirty in cache when the ETR starts writing, and its
> > write-back lands on top of the trace data.

Good catch! I'm curious how you observed the dirty cache lines
overwriting trace data in DDR and causing corruption.

> Agree, without the sync, the dirty data may overwrites the trace data.

> > Add a sync_for_device() buffer operation and call it from
> > __tmc_etr_enable_hw() just before the TMC is enabled.

I don't think __tmc_etr_enable_hw() is the best place for the sync, as
it can be called frequently when an event is enabled, e.g. when a task
is scheduled in or migrated between CPUs. We should be able to sync
once after dma_alloc_noncoherent() instead.

The issue is not limited to buffer init. The driver also injects barrier
packets into the bounce buffer, which can race with the sink. Even
worse, the barrier packet write may collide with trace data when they
share a cache line.

I think we should consider writing barrier packets directly into the
AUX buffer. This would avoid stale cache data from barrier packet writes
and simplify the flow without additional sync operations.

Would you mind if I pick up this patch (keeping you as the author) and
add a second patch to address the barrier packet issue? That part may
need some several rounds refactoring so can have better shape, I think
it would be easier to consolidate the fixes on my side.

Thanks,
Leo

P.s. Please CC me on future CoreSight patches. If you're using the
mainline ./scripts/get_maintainer.pl, it should add me automatically.
I didn't receive this patch directly, which is why I'm replying to
Jie's email (also thanks Jie's review).

