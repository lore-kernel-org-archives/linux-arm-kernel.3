Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9F6C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlJmE/hpdOfZk3CZGx5TFaewFZhDv405qpef//wPVu8=; b=g37WRxn9lkxPamuuW9AxW02Lgh
	t/LlUtwiCaRS7vEew2dPy49atIlLo2N12dy3mT+qNHLIkw4j2U8e5U3eyBn5P8O4OaMAW57kKlnTi
	juFv/CuNXfVgt8blCq82Zv6goOQZe0WG2cxYh1LUyKXkFX8e4Di8hxgDNBOGWd1X/nhksNI6TDZr0
	03KjN+oV6vP3pv0KaI4Bmn/CT9F6+4dGZWMaVK/RQ3WEn6JioonWyLzuNJKnqPOz+imIrNIqDhiVS
	LOYJkS1kAM/HIYTVQumUck8kTPy4SaHCfBtAL5vwDoYFhMvgWLL0sJd9UQ3akjyJGu9ExfvzSWfuX
	CSkRhZ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZJ-00000009AMI-0aXi;
	Wed, 02 Jul 2025 17:48:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0wg-000000094KN-3KV6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 17:08:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2668422C7;
	Wed,  2 Jul 2025 10:08:15 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89BD63F66E;
	Wed,  2 Jul 2025 10:08:29 -0700 (PDT)
Date: Wed, 2 Jul 2025 18:08:27 +0100
From: Leo Yan <leo.yan@arm.com>
To: Junhao He <hejunhao3@huawei.com>
Cc: suzuki.poulose@arm.com, james.clark@arm.com, anshuman.khandual@arm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, yangyicong@huawei.com,
	prime.zeng@hisilicon.com
Subject: Re: [PATCH v2 3/3] coresight: tmc: Decouple the perf buffer
 allocation from sysfs mode
Message-ID: <20250702170827.GB1039028@e132581.arm.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
 <20250620075412.952934-4-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620075412.952934-4-hejunhao3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_100830_872884_1B306EC1 
X-CRM114-Status: GOOD (  18.74  )
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

On Fri, Jun 20, 2025 at 03:54:12PM +0800, Junhao He wrote:

[..]

> @@ -1341,33 +1339,24 @@ alloc_etr_buf(struct tmc_drvdata *drvdata, struct perf_event *event,
>  	unsigned long size;
>  
>  	node = (event->cpu == -1) ? NUMA_NO_NODE : cpu_to_node(event->cpu);
> -	/*
> -	 * Try to match the perf ring buffer size if it is larger
> -	 * than the size requested via sysfs.
> -	 */
> -	if ((nr_pages << PAGE_SHIFT) > drvdata->size) {
> -		etr_buf = tmc_alloc_etr_buf(drvdata, ((ssize_t)nr_pages << PAGE_SHIFT),
> -					    0, node, NULL);
> -		if (!IS_ERR(etr_buf))
> -			goto done;
> -	}
> +
> +	/* Use the minimum limit if the required size is smaller */
> +	size = (unsigned long)nr_pages << PAGE_SHIFT;

Please change the size's type to ssize_t, then:

        size = nr_pages << PAGE_SHIFT;

> +	if (size < TMC_ETR_PERF_MIN_BUF_SIZE)
> +		size = TMC_ETR_PERF_MIN_BUF_SIZE;

size = min_t(ssize_t, size, TMC_ETR_PERF_MIN_BUF_SIZE);
>  
>  	/*
> -	 * Else switch to configured size for this ETR
> -	 * and scale down until we hit the minimum limit.
> +	 * Try to allocate the required size for this ETR, if failed scale
> +	 * down until we hit the minimum limit.
>  	 */
> -	size = drvdata->size;
>  	do {
>  		etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
>  		if (!IS_ERR(etr_buf))
> -			goto done;
> +			return etr_buf;
>  		size /= 2;
>  	} while (size >= TMC_ETR_PERF_MIN_BUF_SIZE);

Do we really need to scale down buffer size for failure cases?

I would like a straightforward code:

        etr_buf = tmc_alloc_etr_buf(drvdata, size, 0, node, NULL);
        if (IS_ERR_OR_NULL(etr_buf))
                return etr_buf;

Just a side topic, we know tmc_alloc_etr_buf() should not return NULL
pointer. For a sanity check, the callers (alloc_etr_buf(),
tmc_etr_get_sysfs_buffer(), etc) should valid a buffer pointer with
IS_ERR_OR_NULL() rather than IS_ERR(). This can be a separate patch.

Thanks,
Leo

>  	return ERR_PTR(-ENOMEM);
> -
> -done:
> -	return etr_buf;
>  }
>  
>  static struct etr_buf *
> -- 
> 2.33.0
> 

