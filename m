Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3637CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxAG2wevlF9hvSfOpG1gi4gKf2kHDvkSjadttXruPpE=; b=yUSG363rWdaAsFse1Qpu1c01OA
	I7EtmDqcdjtA1Xp7KRDJts+K7OLrSIpJzsVqmYTPXdtEEmEA9ec66nIaw7b0iXt56AvI/PMbdFVfu
	qcwylZBefO9smol6CEtXXSbNC5sj65coZZfWcCWuaexUDR1S1B7TQHdG80DzUAINLV+NhrZBZxq/C
	rjy4UDtgbqdggvjNfTIMmgOMq5Og+Wjb8XR65YT4ZgdkfGgoCed86zsFl4CvxfOtwA9dzTJP4V4Oa
	DE4bY3qV3gR8iYfPaIgpcDdvy+QEmpiIpuVL9wgvRAw5lJR7xGDNsSt+H5JQcF37Uik8AjuJ5h3bw
	ADGQbxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorFG-0000000F5hs-0gNc;
	Wed, 20 Aug 2025 22:25:26 +0000
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomrD-0000000Eaag-3xcU;
	Wed, 20 Aug 2025 17:44:20 +0000
Message-ID: <a68bf620-14b5-4500-8cb9-26a7b28af058@infradead.org>
Date: Wed, 20 Aug 2025 10:44:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] lib: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, james.morse@arm.com,
 linux-cxl@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>, "H . Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Yicong Yang <yangyicong@huawei.com>, linuxarm@huawei.com,
 Yushan Wang <wangyushan12@huawei.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 Andy Lutomirski <luto@kernel.org>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
 <20250820102950.175065-4-Jonathan.Cameron@huawei.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250820102950.175065-4-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 8/20/25 3:29 AM, Jonathan Cameron wrote:
> +struct cache_coherency_device *
> +_cache_coherency_device_alloc(const struct coherency_ops *ops, size_t size);
> +/**
> + * cache_coherency_device_alloc - Allocate a cache coherency device
> + * @ops: Cache maintenance operations
> + * @drv_struct: structure that contains the struct cache_coherency_device
> + * @member: Name of the struct cache_coherency_device member in @drv_struct.
> + *
> + * This allocates and initializes the cache_coherency_device embedded in the
> + * drv_struct. Upon success the pointer must be freed via
> + * cache_coherency_device_free().
> + *
> + * Returns a 'drv_struct \*' on success, NULL on error.

Preferably:

 * Returns: a &drv_struct * on success, %NULL on error.


> + */
> +#define cache_coherency_device_alloc(ops, drv_struct, member)	    \
> +	({								    \
> +		static_assert(__same_type(struct cache_coherency_device,    \
> +					  ((drv_struct *)NULL)->member));   \
> +		static_assert(offsetof(drv_struct, member) == 0);	    \
> +		(drv_struct *)_cache_coherency_device_alloc(ops,	    \
> +			sizeof(drv_struct));				    \
> +	})
> +void cache_coherency_device_free(struct cache_coherency_device *ccd);
> +
> +#endif

-- 
~Randy


