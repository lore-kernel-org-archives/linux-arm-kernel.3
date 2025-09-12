Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A709CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 04:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGX7J/jKCIRxuzwYYMNljiiMuyPK0My3lGhvhzbqAok=; b=hPWK9w7eOBR4wqjxEJKV6JtiZm
	x8c0C9I/WfHuMFLQ4nChiuZ7W/TLQpBtXXUgqv1wHwSbxVrOlHnU+kgOLG+tXgrQz/JjD7KKM428k
	pGtYIY4e8foAqfD20vbRxjRjXMzpVXpTYmoPRGGWln/ltq5owabAJMRI90kAfbfSpAtzoNjFBGuQo
	umsQ4XXsDN33GgYTu1w8V6C1A9C0msBbjBdlvE4REXu1hEBKVFf787bAG03HxRyRVAsJuHRmJiYI3
	i2992pzo+R5tXIQjUu0q9okO8mWVhLA1glXNCGbNaFyzdtWjKteDY6agSS2+Ceaw9+BNDfIedN5Ie
	TtWlA2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwvMP-00000006yZS-2UJ6;
	Fri, 12 Sep 2025 04:26:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwvMK-00000006yYy-2s7I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 04:26:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F129416A3;
	Thu, 11 Sep 2025 21:25:54 -0700 (PDT)
Received: from [10.163.41.251] (unknown [10.163.41.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A6393F66E;
	Thu, 11 Sep 2025 21:26:00 -0700 (PDT)
Message-ID: <3f2137d5-5bfc-44e7-9269-3069e44eda31@arm.com>
Date: Fri, 12 Sep 2025 09:55:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Use scope-based resource management in
 arm_trbe_alloc_buffer()
To: Markus Elfring <Markus.Elfring@web.de>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Leo Yan <leo.yan@arm.com>,
 Tamas Zsoldos <tamas.zsoldos@arm.com>
References: <3663eb06-6a98-461b-8fcb-6891165d107f@web.de>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <3663eb06-6a98-461b-8fcb-6891165d107f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_212604_803472_2EE30D13 
X-CRM114-Status: GOOD (  22.09  )
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

On 09/09/25 5:58 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 9 Sep 2025 14:20:06 +0200
> 
> Scope-based resource management became supported for some
> programming interfaces by contributions of Peter Zijlstra on 2023-05-26.
> See also the commit 54da6a0924311c7cf5015533991e44fb8eb12773 ("locking:

			^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

SHA ID here just needs first 12 digits not the entire string.
> Introduce __cleanup() based infrastructure").
> 
> * Thus use the attribute “__free(kfree)”.
> 
> * Reduce the scopes for the local variables “buf” and “pglist”.

What is that required ?
> 
> * Omit four kfree() calls accordingly.

Right.

The commit message should be re-written with little more
context from arm_trbe_alloc_buffer(), after describing
the new scope-based resource management.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 21 ++++++++------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8f9bbef71f23..1b0d58bf8613 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -733,8 +733,6 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>  				   struct perf_event *event, void **pages,
>  				   int nr_pages, bool snapshot)
>  {
> -	struct trbe_buf *buf;
> -	struct page **pglist;
>  	int i;
>  
>  	/*
> @@ -746,32 +744,29 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
>  	if (nr_pages < 2)
>  		return NULL;
>  
> -	buf = kzalloc_node(sizeof(*buf), GFP_KERNEL, trbe_alloc_node(event));
> +	struct trbe_buf *buf __free(kfree) = kzalloc_node(sizeof(*buf),
> +							  GFP_KERNEL,
> +							  trbe_alloc_node(event));
>  	if (!buf)
>  		return NULL;
>  
> -	pglist = kcalloc(nr_pages, sizeof(*pglist), GFP_KERNEL);
> -	if (!pglist) {
> -		kfree(buf);
> +	struct page **pglist __free(kfree) = kcalloc(nr_pages, sizeof(*pglist), GFP_KERNEL);
> +	if (!pglist)
>  		return NULL;
> -	}
>  
>  	for (i = 0; i < nr_pages; i++)
>  		pglist[i] = virt_to_page(pages[i]);
>  
>  	buf->trbe_base = (unsigned long)vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
> -	if (!buf->trbe_base) {
> -		kfree(pglist);
> -		kfree(buf);
> +	if (!buf->trbe_base)
>  		return NULL;
> -	}
> +
>  	buf->trbe_limit = buf->trbe_base + nr_pages * PAGE_SIZE;
>  	buf->trbe_write = buf->trbe_base;
>  	buf->snapshot = snapshot;
>  	buf->nr_pages = nr_pages;
>  	buf->pages = pages;
> -	kfree(pglist);
> -	return buf;
> +	return_ptr(buf);
>  }
>  
>  static void arm_trbe_free_buffer(void *config)

Seems like a good idea though. But please keep the local variable
declaration in the current place which is bit cleaner and reduces
code churn as well.

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 7a226316c48f..7babba1a9afb 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -733,8 +733,8 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
                                   struct perf_event *event, void **pages,
                                   int nr_pages, bool snapshot)
 {
-       struct trbe_buf *buf;
-       struct page **pglist;
+       struct trbe_buf *buf __free(kfree);
+       struct page **pglist __free(kfree);
        int i;

        /*
@@ -751,27 +751,22 @@ static void *arm_trbe_alloc_buffer(struct coresight_device *csdev,
                return NULL;

        pglist = kcalloc(nr_pages, sizeof(*pglist), GFP_KERNEL);
-       if (!pglist) {
-               kfree(buf);
+       if (!pglist)
                return NULL;
-       }

        for (i = 0; i < nr_pages; i++)
                pglist[i] = virt_to_page(pages[i]);

        buf->trbe_base = (unsigned long)vmap(pglist, nr_pages, VM_MAP, PAGE_KERNEL);
-       if (!buf->trbe_base) {
-               kfree(pglist);
-               kfree(buf);
+       if (!buf->trbe_base)
                return NULL;
-       }
+
        buf->trbe_limit = buf->trbe_base + nr_pages * PAGE_SIZE;
        buf->trbe_write = buf->trbe_base;
        buf->snapshot = snapshot;
        buf->nr_pages = nr_pages;
        buf->pages = pages;
-       kfree(pglist);
-       return buf;
+       return_ptr(buf);
 }

 static void arm_trbe_free_buffer(void *config)

