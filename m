Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A53CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uKGOUFxfm1HzVMYmImdbb1ivQXFLwB51pAfmHueMSY=; b=vLy6MzndirzmETfoPIGKUd7kzc
	mVzWK74CRgpMoefgYddhzfEgHhKHmgu5w3cfmJ+PpCO+Q8YPgKAzHdPqtw8IUvHXz0drkHsjtoU52
	s51wLTcjn6UNfcXn9QjAqCWZWESS/LemlW32Ghj7fXPmKmCknOUifUQF4UqAKAfW2L9+ru+SqF9yO
	S6Eznzf/U5KMdUaFKscnyA12N6VCFy8TOKnd7UdB5v3CzJgyzjKaTXxcMDbQpj7bODEhPy8/m1HOQ
	rinzeA3lz05DGaarXfxXmUpVg6PRkkoGSynJ90ug89AicV04kCO4A/wJ2QHuwY4TUm/85vIc17RwN
	r766jFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwdG-0000000ABCW-24H7;
	Mon, 03 Nov 2025 15:38:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwdE-0000000ABBr-0xkQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D986B439C2;
	Mon,  3 Nov 2025 15:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4ACC113D0;
	Mon,  3 Nov 2025 15:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762184287;
	bh=1CDUYOsWVIa1CRQEq15QH6kbgshp4nDJDCB9TrYkUp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cX2+0VA/Ows4CvgbN3MImYhWPsU6aHq8caEHnyvEwOsbBnTELIxzQL1SE5Bn+wQDg
	 tuBnhESqJVix3PzSlErs9y+UMJNReBhf7Vre6V78TB+oAQg2+vZ/rNiA6DLoVNqYVG
	 H8d+MdnI+UMf4qPYo+sZvPS3V/dakDCr+L0I/kAS8wEy9EbqYgEHcHTxQjMa78nmId
	 Tf3ZcR8OQp0wnm7RApDjW2I/rZvlqg9uBpBJ5i70/itshlrD5xQQcg2dM5b9O6V/T8
	 hLhGjaHDg0wRidX1sk1A7D64kJkV9EE5wAkXfOZ8Sl1AMOIsPyVH+lhPXv+tETT6fD
	 J2e3E1KaibQ5g==
Message-ID: <e5fee14a-4569-49c8-9f42-844839e51e85@kernel.org>
Date: Mon, 3 Nov 2025 16:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: mm: Don't sleep in split_kernel_leaf_mapping()
 when in atomic context
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, yang@os.amperecomputing.com, ardb@kernel.org,
 dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <groeck@google.com>
References: <20251103125738.3073566-1-ryan.roberts@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251103125738.3073566-1-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_073808_294922_3376BA29 
X-CRM114-Status: GOOD (  14.50  )
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


>   }
> 
> +static inline bool force_pte_mapping(void)
> +{
> +	bool bbml2 = system_capabilities_finalized() ?
> +		system_supports_bbml2_noabort() : cpu_supports_bbml2_noabort();

You are only moving this function. Still, there is some room for improvement I want to point out :)

bbml2 could be a const (or a helper function like bbml2_supported).

> +
> +	return (!bbml2 && (rodata_full || arm64_kfence_can_set_direct_map() ||
> +			   is_realm_world())) ||
> +		debug_pagealloc_enabled();


I suspect this could be made a bit easier to read.

	if (debug_pagealloc_enabled())
		return true;
	if (bbml2)
		return false;
	return rodata_full || arm64_kfence_can_set_direct_map() || is_realm_world();


> +}
> +
>   static DEFINE_MUTEX(pgtable_split_lock);
> 
>   int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
> @@ -723,6 +733,16 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>   	if (!system_supports_bbml2_noabort())
>   		return 0;
> 
> +	/*
> +	 * If the region is within a pte-mapped area, there is no need to try to
> +	 * split. Additionally, CONFIG_DEBUG_PAGEALLOC and CONFIG_KFENCE may
> +	 * change permissions from softirq context so for those cases (which are
> +	 * always pte-mapped), we must not go any further because taking the
> +	 * mutex below may sleep.
> +	 */
> +	if (force_pte_mapping() || is_kfence_address((void *)start))
> +		return 0;
> +

We're effectively performing two system_supports_bbml2_noabort() checks, similarly in
arch_kfence_init_pool().

I wonder if there is a clean way to avoid that.

I'm not super up-to-date on that code. Nothing else jumped at me.

-- 
Cheers

David


