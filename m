Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442E5CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qBznc6a6QijXfnCauAhH2VOH6sZkPkccOFwVOda7dk=; b=A5PoySvNt+GQn2EGN4Nq6oJGf5
	ao4UzBAGPVRTjFSsKk50DFnBF3GIYq17jptS/vqJ8dlkXAzM1+Ircwc/7DSCsAMrd9Np7aTJOVhNE
	OYQ+YCYLH1PmpeOkHaMHp6e7r66ENCkK5+H1gwHAw0wdneQ60+bK73e9vCc8tURnT/Qr5uZ5VV8gf
	tzrL3ow8gHE4uHfl1RiTMjfJAWKoyKAcYCHuMT4Bc021VdvhFTSl1Gas5Zp7VZtD3qgJRrFk/npWn
	v/Oqw0NiM3xxX9/ffZUwHg+zuLNpqAOMsu9k3UVvjil6yh+DVRKg2YWmQ//JnNBSKZTbLs84BkkVF
	QlFqT3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzgs-00000007pKv-2a1R;
	Fri, 29 May 2026 16:04:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzgq-00000007pKf-3NkB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:04:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 090A2605D0;
	Fri, 29 May 2026 16:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A66B1F00893;
	Fri, 29 May 2026 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780070643;
	bh=6qBznc6a6QijXfnCauAhH2VOH6sZkPkccOFwVOda7dk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=miEqoNZCCSiqX+JEe8R6+K7Vfpu5DKBqGvRMRkTalRRH2j5FP9V15L5ufngSIDKVy
	 FeyeB0NCkxK6keQExR4ubeZ9acE/H9hPG58NrPZz8gNcJtoVcXXjAU+iY/RLs9dh7w
	 CYRA7SVdTKErbv3Pv+3sQP+piQ69+/f3oe6QgaEAx6sXbLT37YxoeC8Bp3I91XfWUF
	 JFj+wAlGOaqsWFSyGOcPD9q1pmtGQR4BPTfsQVhtaXDBfTu1HkIo5VJY8IWa8Bt5P3
	 sSWq4bzhkETIpxvIfX75j4b0obwXmnXUx6WTNAb7uCcIiAPRLnt+E8Kt6NtOgvpimI
	 xwsIAwjtWITCg==
Date: Fri, 29 May 2026 17:03:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, xueshuai@linux.alibaba.com, saket.dumbre@intel.com,
 mchehab@kernel.org, dave@stgolabs.net, djbw@kernel.org, bp@alien8.de,
 tony.luck@intel.com, guohanjun@huawei.com, lenb@kernel.org,
 skhan@linuxfoundation.org, vishal.l.verma@intel.com, rafael@kernel.org,
 corbet@lwn.net, ira.weiny@intel.com, dave.jiang@intel.com,
 krzk+dt@kernel.org, robh@kernel.org, catalin.marinas@arm.com,
 alison.schofield@intel.com, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 04/10] ACPI: APEI: GHES: move estatus cache helpers
Message-ID: <20260529170348.0560da0e@jic23-huawei>
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-4-2e0500d42642@arm.com>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
	<20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-4-2e0500d42642@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 29 May 2026 10:50:44 +0100
Ahmed Tiba <ahmed.tiba@arm.com> wrote:

> Relocate the estatus cache allocation and lookup helpers from ghes.c into
> ghes_cper.c. This code move keeps the logic intact while making the cache
> implementation available to forthcoming users.
> 
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>

A couple of minor things inline.

With the two I've called out tidied up
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
> index 8080e0f76dac..0a117f478afb 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -13,10 +13,14 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/genalloc.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/math64.h>
>  #include <linux/mm.h>
>  #include <linux/ratelimit.h>
> +#include <linux/rcupdate.h>
> +#include <linux/sched/clock.h>
>  #include <linux/slab.h>

> +static void ghes_estatus_cache_rcu_free(struct rcu_head *head)
> +{
> +	struct ghes_estatus_cache *cache;
> +	u32 len;
> +
> +	cache = container_of(head, struct ghes_estatus_cache, rcu);
> +	len = cper_estatus_len(GHES_ESTATUS_FROM_CACHE(cache));
> +	len = GHES_ESTATUS_CACHE_LEN(len);
> +	gen_pool_free(ghes_estatus_pool, (unsigned long)cache, len);
> +	atomic_dec(&ghes_estatus_cache_alloced);
> +}
> +
> +void
> +ghes_estatus_cache_add(struct acpi_hest_generic *generic,
> +		       struct acpi_hest_generic_status *estatus)

void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
			    struct acpi_hest_generic_status *estatus)

is under 80 chars (and how you have it in the header!)

(RB assumes you fix this - or argue against perhaps because of a change in
 a future patch)

> +{
> +	unsigned long long now, duration, period, max_period = 0;
> +	struct ghes_estatus_cache *cache, *new_cache;
> +	struct ghes_estatus_cache __rcu *victim;
> +	int i, slot = -1, count;
> +
> +	new_cache = ghes_estatus_cache_alloc(generic, estatus);
> +	if (!new_cache)
> +		return;
> +
> +	rcu_read_lock();
> +	now = sched_clock();
> +	for (i = 0; i < GHES_ESTATUS_CACHES_SIZE; i++) {
> +		cache = rcu_dereference(ghes_estatus_caches[i]);
> +		if (cache == NULL) {
> +			slot = i;
> +			break;
> +		}
> +		duration = now - cache->time_in;
> +		if (duration >= GHES_ESTATUS_IN_CACHE_MAX_NSEC) {
> +			slot = i;
> +			break;
> +		}
> +		count = atomic_read(&cache->count);
> +		period = duration;
> +		do_div(period, (count + 1));
> +		if (period > max_period) {
> +			max_period = period;
> +			slot = i;
> +		}
> +	}
> +	rcu_read_unlock();
> +
> +	if (slot != -1) {
If you even end up doing tidy up of this code, would be nicer to flip
the logic here and do an early return.
	if (slot == -1)
		return;
Then the rest is much less indented.

No need to do that in this series though as nothing 'wrong' with the
current code as such.

> +		/*
> +		 * Use release semantics to ensure that ghes_estatus_cached()
> +		 * running on another CPU will see the updated cache fields if
> +		 * it can see the new value of the pointer.
> +		 */
> +		victim = xchg_release(&ghes_estatus_caches[slot],
> +				      RCU_INITIALIZER(new_cache));
> +
> +		/*
> +		 * At this point, victim may point to a cached item different
> +		 * from the one based on which we selected the slot. Instead of
> +		 * going to the loop again to pick another slot, let's just
> +		 * drop the other item anyway: this may cause a false cache
> +		 * miss later on, but that won't cause any problems.
> +		 */
> +		if (victim)
> +			call_rcu(&unrcu_pointer(victim)->rcu,
> +				 ghes_estatus_cache_rcu_free);
> +	}
> +}
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index 6b7632cfaf66..1b5dbeca9bb6 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -16,6 +16,7 @@
>  #ifndef ACPI_APEI_GHES_CPER_H
>  #define ACPI_APEI_GHES_CPER_H
>  
> +#include <linux/atomic.h>

Why?  Nothing in in the types used in what is added to the header needs
it - maybe I'm suffering Friday syndrome. Seems like it belongs in another
patch or in a c file rather than the header.
(RB assumes this fixed or argued against)


>  #include <linux/workqueue.h>
>  
>  #include <acpi/ghes.h>
> @@ -54,6 +55,8 @@
>  	((struct acpi_hest_generic_data *)                              \
>  	((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
>  
> +extern struct gen_pool *ghes_estatus_pool;
> +
>  static inline bool is_hest_type_generic_v2(struct ghes *ghes)
>  {
>  	return ghes->generic->header.type == ACPI_HEST_TYPE_GENERIC_ERROR_V2;
> @@ -98,5 +101,8 @@ int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
>  			u64 buf_paddr, enum fixed_addresses fixmap_idx,
>  			size_t buf_len);
>  #endif
> +int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
> +void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
> +			    struct acpi_hest_generic_status *estatus);
>  
>  #endif /* ACPI_APEI_GHES_CPER_H */
> 


