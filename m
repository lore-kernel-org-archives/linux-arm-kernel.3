Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B89CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKP9uXI6qWAaveg3m0zWTr+bblTUrTmCUP2EvmJDHvk=; b=ZNGxOAAST9sRZ+EUssISCp7kug
	ysNAJDDpL6KglknsglZPcbNGKrFi4Pd3TbzYxf4K/EAaXKqRU+NYYlbHrQwrqRQPZSUX4/LqWrTwR
	Wh42fnQnYOvrFi9cxaHYXVrDw/xdOz5K2Nqm4DvqR310oisb8LULlJ3kshNMkavoCaSc+eci8EeJe
	GtS4tzx9qD4UxUBlA9ZOp+/k881w49JEIGEUmTemzzg8W5pHELr3o5RFcKHAaQmNueuqvvhHGHLKU
	0lVhAoMLRkNGwgqRE4h9HOnnFM99juDqfVzihQFWCmveGiCEXjgjGS8W7W+TajCn+45rZ+4/NaTxl
	kGXufMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux10O-00000008aZt-2WFC;
	Fri, 12 Sep 2025 10:27:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux10M-00000008aYx-1nO9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:27:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5713416A3;
	Fri, 12 Sep 2025 03:27:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 380603F66E;
	Fri, 12 Sep 2025 03:27:45 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:27:43 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>
Subject: Re: [PATCH] coresight: trbe: Use scope-based resource management in
 arm_trbe_alloc_buffer()
Message-ID: <20250912102743.GG12516@e132581.arm.com>
References: <3663eb06-6a98-461b-8fcb-6891165d107f@web.de>
 <3f2137d5-5bfc-44e7-9269-3069e44eda31@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f2137d5-5bfc-44e7-9269-3069e44eda31@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_032746_508336_8FD11E30 
X-CRM114-Status: GOOD (  17.57  )
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

On Fri, Sep 12, 2025 at 09:55:57AM +0530, Anshuman Khandual wrote:

[...]

> Seems like a good idea though. But please keep the local variable
> declaration in the current place which is bit cleaner and reduces
> code churn as well.

Though include/linux/cleanup.h suggests to "always define and assign
variables in one statement" to avoid potential interdependency problem
with lock, this is not concerned in arm_trbe_alloc_buffer().

So I bias to Anshuman's suggestion of declaring variables at the top
of the function, as this is the style widely used in the kernel.

> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 7a226316c48f..7babba1a9afb 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -733,8 +733,8 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>                                    struct perf_event *event, void **pages,
>                                    int nr_pages, bool snapshot)
>  {
> -       struct trbe_buf *buf;
> -       struct page **pglist;
> +       struct trbe_buf *buf __free(kfree);

    struct trbe_buf *buf __free(kfree) = NULL;

> +       struct page **pglist __free(kfree);

    struct page **pglist __free(kfree) = NULL;

>         int i;
> 
>         /*
> @@ -751,27 +751,22 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>                 return NULL;
> 
>         pglist = kcalloc(nr_pages, sizeof(*pglist), GFP_KERNEL);
> -       if (!pglist) {
> -               kfree(buf);
> +       if (!pglist)
>                 return NULL;
> -       }
> 
>         for (i = 0; i < nr_pages; i++)
>                 pglist[i] = virt_to_page(pages[i]);
> 
>         buf->trbe_base = (unsigned long)vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
> -       if (!buf->trbe_base) {
> -               kfree(pglist);
> -               kfree(buf);
> +       if (!buf->trbe_base)
>                 return NULL;
> -       }
> +
>         buf->trbe_limit = buf->trbe_base + nr_pages * PAGE_SIZE;
>         buf->trbe_write = buf->trbe_base;
>         buf->snapshot = snapshot;
>         buf->nr_pages = nr_pages;
>         buf->pages = pages;
> -       kfree(pglist);
> -       return buf;
> +       return_ptr(buf);
>  }
> 
>  static void arm_trbe_free_buffer(void *config)

