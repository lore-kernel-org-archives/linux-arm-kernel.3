Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92312E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnyqaZ8bkneS66rZ1875GCL2aMJhWuuPA67Qw5yFQqw=; b=TUOf51NUrd1tYoN1ftut+9felD
	l87D9hx2+JJOwGk8XUmtJU3dsyAY19Nc6I4w73T2OiNNOVyQw7fDfOO8M0hWDTooTyEFaIRVimi9F
	va3LO5HtkOt1c+olYHJzexiUTI+5E089pxtVVXGpLZzMopc1/l3QGZh7oKlKdjEzI3m5fNc1BZp9F
	SW+mZaUmCjBYmPJaH5JyylbQoAvcFpxLJNSdN/MNGCkV0fODH49r6HTZ4q3ze61jrKdQNaXCwzB2F
	6Eg8Wh4D2sLbwEQX1uZkjdZpop20zo5t3/OtvS/NIPNFCNpE3w+wiidX7qcAuFsWRMkcIyYokouzo
	AWTlUteg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT6W-0000000032N-1nvE;
	Mon, 23 Feb 2026 10:23:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT6T-0000000030Y-1cn2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:23:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B3C6339;
	Mon, 23 Feb 2026 02:23:40 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 285BC3F59E;
	Mon, 23 Feb 2026 02:23:46 -0800 (PST)
Date: Mon, 23 Feb 2026 10:23:43 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Junhao He <hejunhao3@h-partners.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michiel van Tol <michiel.vantol@arm.com>
Subject: Re: [PATCH] coresight: tmc: Fix overflow when calculating is bigger
 than 2GiB
Message-ID: <20260223102343.GK136967@e132581.arm.com>
References: <20260217-arm_coresight_fix_big_buffer_size-v1-1-774e893d8e3f@arm.com>
 <666e2c55-a1aa-4960-a084-50921ec7f696@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <666e2c55-a1aa-4960-a084-50921ec7f696@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_022349_647315_8832E6E1 
X-CRM114-Status: GOOD (  18.87  )
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

On Mon, Feb 23, 2026 at 09:50:41AM +0000, Suzuki K Poulose wrote:

[...]

> > --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> > @@ -154,7 +154,7 @@ tmc_pages_get_offset(struct tmc_pages *tmc_pages, dma_addr_t addr)
> >   	for (i = 0; i < tmc_pages->nr_pages; i++) {
> >   		page_start = tmc_pages->daddrs[i];
> >   		if (addr >= page_start && addr < (page_start + PAGE_SIZE))
> > -			return i * PAGE_SIZE + (addr - page_start);
> > +			return (long)i * PAGE_SIZE + (addr - page_start);
> >   	}
> >   	return -EINVAL;
> > @@ -1381,7 +1381,7 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
> >   	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
> >   	/* Use the minimum limit if the required size is smaller */
> > -	size = nr_pages << PAGE_SHIFT;
> > +	size = (ssize_t)nr_pages << PAGE_SHIFT;
> >   	size = max_t(ssize_t, size, TMC_ETR_PERF_MIN_BUF_SIZE);
> >   	/*
> > 
> 
> Thanks for the fix. Could we not fix the declaration of the variables
> instead ?  (Also add a comment to make sure people don't revert it back )

I thought a bit the variable declaration when worked on the patch, but
it is tricky.

"nr_pages" is passed down from the perf core layer as an int type.  In
CoreSight, the value is passed down through several functions using the
same type, and it does not seem necessary to change the type in every
function in the call path.

We could silently use wider type for the "nr_pages" argument or the
index variable "i".  As you said, we need comments to remind future
changing.  This might be more error-prone than using an explicit
cast at the point of calculation ?

Thanks,
Leo

