Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9EE8E8FDB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkFBnQY3LS/CUDnrkcxR3YOk4jUDJ9IE93cEOOeBXqU=; b=sKr8aEp3w2ywnZFeWMs2pHxkFT
	4MK2T5ymm6G0cdq7BVFca8qzIoFnqmNV9qqsYF4IyAB4RpAEaEIuopvaHVxW6WGTUFrstTPF1GI3N
	p8+YU9IhM6zRheTXwke5tJMxyScBjxUXJTSo8R/nZT4ho0x9SO1cHKX0hio9L2INSUG25mfspgwwE
	A0VE8aXGXWg8DlHu90R8YM9WOfnNQzZRNnaRRg2Yb9LNRSK6woOE+XeZ/8lzRSZsvkXqMHQ2/0IFH
	x+at93eFvJTqfn3VssJjRRoUP8kko3Ac433dsID21ZHo6gYzwTerRPGE/B/QWfk4vYybiYPSnqEli
	cgILSHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZG2E-00000001VVH-02m6;
	Fri, 26 Dec 2025 22:11:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZG25-00000001VUG-37wn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766787096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkFBnQY3LS/CUDnrkcxR3YOk4jUDJ9IE93cEOOeBXqU=;
	b=KX8DYMxY+wNqkGGusEq+sa/AKUrGxa7ZGLtjib0MAPuA3YGKljCTu5xZflxSKCrzJqy4qe
	o8Ca6H6u/YbTkjV8uC8RBrp6YuPYAo1EY0IgAZHbW+SboAhYjG+gBTWCylAax3gtSzUW3Y
	XHXERKJODToqm4oe4CBwFuWqTNbaOm0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-Uub2rIjgPf6iZJSZP1i-CA-1; Fri, 26 Dec 2025 17:11:32 -0500
X-MC-Unique: Uub2rIjgPf6iZJSZP1i-CA-1
X-Mimecast-MFC-AGG-ID: Uub2rIjgPf6iZJSZP1i-CA_1766787092
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so196283981cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:11:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766787092; x=1767391892;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TkFBnQY3LS/CUDnrkcxR3YOk4jUDJ9IE93cEOOeBXqU=;
        b=ShMsTkOqtYeC4D4S47qJ/VZjvze/dY0I4iLDwolObA0Tb2gnX4VlBnJLejqpjzDy9W
         8bThTSFdsRZ/BLxqgvqZ+FXKKXcBZGWACDpz18ncJ1o+mZZv7aoBbxtP/T4RTgtMbtZ5
         uA2c/L6b8C+5qCjPV+fytEJTbEYGDz5XGFwPoVvn97CpKBPrKsUCN2935IrYq5q9tLKV
         2Cj9W4vAU7auj08FjgO5/RcWkfrMoyB8NJQvaT8lLjcsEQ7i6yrX185WYVVg3AkHpNTo
         kDzZRiNKNqxr1l4lpfJfXkBW8NB0L4PLBF4itq/MjFZ7VHt+C1hesk+7JiRXX9F85sag
         N/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUjpbrs5oV8QxGcHAIyDaUO9j1M2jTF27ohvH2Mod2jjA24jhRQU46+cpwl6IyB/H/nAchHmGVmpMsAj3sD1Cxl@lists.infradead.org
X-Gm-Message-State: AOJu0YxWusTtg0rhjjN1dmn9+wDn5NcpjWuP17ihn++q/HQyP5CxAxKh
	Wmo3iWrtDjpyAkfkhsLJCXtUGiZ3nFrKyaI4/0bLCoOsS5oy0eh231ygrP4YjiTB7hSLwO5AHKr
	zLQOl6j3S33B6FsLVpCZdMAsN8fMrwajIDy2/WBnbEUIB9/ZkTR+cIUEEebnKiefGuKKmsShwOU
	/o
X-Gm-Gg: AY/fxX7Phg67mlGcTBYAvxAu6BboWZQLJA2jN3mRQHxhqR88MlBsJvsPnfe/G4AOU3c
	IJQx3RpxQASQ5o9DANENEm9hXxy+4N4MSw33xknpK6vClXqe3STph122/nNKh/pCNh5gvgECH/P
	rlPRZr4UCl4Ctqtk17YkU4y5r6uKepOEKksmcqySzW1MXQdhdCWWDtb+8gzy/l/oqGBtVHX49iu
	/q5cIGMZtYH+9ZDuv30STardAwZW4rCRsRS+L4JedvCcWaHcLgQP4JZ9b9FTZQLcRM+WkYT7haJ
	PjlCuvJftkIsNH0pWe+PcITQpIQ9kPoK8a1R+B5B4j5kAB1PAGgnUUsqejVRAx1GeR48v3zcS/Q
	Cf+7U9ciTY+NShuBUY9MA8jfffoibIi/feKSk14RIzfjI2JX1NdXzqxft
X-Received: by 2002:a05:622a:4a09:b0:4ee:2510:198a with SMTP id d75a77b69052e-4f4abd75629mr345582151cf.39.1766787091846;
        Fri, 26 Dec 2025 14:11:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfAC0mMAvBMTtIg0HnYR5V/3qz64S5XCvmCWe5yr1a0y1ZiMQUT11GI7YF+lRu7HFhzwx/CQ==
X-Received: by 2002:a05:622a:4a09:b0:4ee:2510:198a with SMTP id d75a77b69052e-4f4abd75629mr345581701cf.39.1766787091473;
        Fri, 26 Dec 2025 14:11:31 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9623fd37sm176347436d6.3.2025.12.26.14.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 14:11:30 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <1e530c72-75d7-4c7e-96e7-329056d6baf5@redhat.com>
Date: Fri, 26 Dec 2025 17:11:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/33] kthread: Include unbound kthreads in the managed
 affinity list
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Ridong <chenridong@huawei.com>, Danilo Krummrich <dakr@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Simon Horman <horms@kernel.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 netdev@vger.kernel.org
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-26-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-26-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D1Mfkdxr9ykDN9ecffHdm9ki6Z2JZ-eVUDneadEH5bE_1766787092
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_141137_903034_A6F19820 
X-CRM114-Status: GOOD (  27.07  )
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

On 12/24/25 8:45 AM, Frederic Weisbecker wrote:
> The managed affinity list currently contains only unbound kthreads that
> have affinity preferences. Unbound kthreads globally affine by default
> are outside of the list because their affinity is automatically managed
> by the scheduler (through the fallback housekeeping mask) and by cpuset.
>
> However in order to preserve the preferred affinity of kthreads, cpuset
> will delegate the isolated partition update propagation to the
> housekeeping and kthread code.
>
> Prepare for that with including all unbound kthreads in the managed
> affinity list.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   kernel/kthread.c | 70 ++++++++++++++++++++++++++++--------------------
>   1 file changed, 41 insertions(+), 29 deletions(-)
>
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index f1e4f1f35cae..51c0908d3d02 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -365,9 +365,10 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
>   	if (kthread->preferred_affinity) {
>   		pref = kthread->preferred_affinity;
>   	} else {
> -		if (WARN_ON_ONCE(kthread->node == NUMA_NO_NODE))
> -			return;
> -		pref = cpumask_of_node(kthread->node);
> +		if (kthread->node == NUMA_NO_NODE)
> +			pref = housekeeping_cpumask(HK_TYPE_KTHREAD);
> +		else
> +			pref = cpumask_of_node(kthread->node);
>   	}
>   
>   	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_KTHREAD));
> @@ -380,32 +381,29 @@ static void kthread_affine_node(void)
>   	struct kthread *kthread = to_kthread(current);
>   	cpumask_var_t affinity;
>   
> -	WARN_ON_ONCE(kthread_is_per_cpu(current));
> +	if (WARN_ON_ONCE(kthread_is_per_cpu(current)))
> +		return;
>   
> -	if (kthread->node == NUMA_NO_NODE) {
> -		housekeeping_affine(current, HK_TYPE_KTHREAD);
> -	} else {
> -		if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
> -			WARN_ON_ONCE(1);
> -			return;
> -		}
> -
> -		mutex_lock(&kthread_affinity_lock);
> -		WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
> -		list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
> -		/*
> -		 * The node cpumask is racy when read from kthread() but:
> -		 * - a racing CPU going down will either fail on the subsequent
> -		 *   call to set_cpus_allowed_ptr() or be migrated to housekeepers
> -		 *   afterwards by the scheduler.
> -		 * - a racing CPU going up will be handled by kthreads_online_cpu()
> -		 */
> -		kthread_fetch_affinity(kthread, affinity);
> -		set_cpus_allowed_ptr(current, affinity);
> -		mutex_unlock(&kthread_affinity_lock);
> -
> -		free_cpumask_var(affinity);
> +	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
> +		WARN_ON_ONCE(1);
> +		return;
>   	}
> +
> +	mutex_lock(&kthread_affinity_lock);
> +	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
> +	list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
> +	/*
> +	 * The node cpumask is racy when read from kthread() but:
> +	 * - a racing CPU going down will either fail on the subsequent
> +	 *   call to set_cpus_allowed_ptr() or be migrated to housekeepers
> +	 *   afterwards by the scheduler.
> +	 * - a racing CPU going up will be handled by kthreads_online_cpu()
> +	 */
> +	kthread_fetch_affinity(kthread, affinity);
> +	set_cpus_allowed_ptr(current, affinity);
> +	mutex_unlock(&kthread_affinity_lock);
> +
> +	free_cpumask_var(affinity);
>   }
>   
>   static int kthread(void *_create)
> @@ -919,8 +917,22 @@ static int kthreads_online_cpu(unsigned int cpu)
>   			ret = -EINVAL;
>   			continue;
>   		}
> -		kthread_fetch_affinity(k, affinity);
> -		set_cpus_allowed_ptr(k->task, affinity);
> +
> +		/*
> +		 * Unbound kthreads without preferred affinity are already affine
> +		 * to housekeeping, whether those CPUs are online or not. So no need
> +		 * to handle newly online CPUs for them.
> +		 *
> +		 * But kthreads with a preferred affinity or node are different:
> +		 * if none of their preferred CPUs are online and part of
> +		 * housekeeping at the same time, they must be affine to housekeeping.
> +		 * But as soon as one of their preferred CPU becomes online, they must
> +		 * be affine to them.
> +		 */
> +		if (k->preferred_affinity || k->node != NUMA_NO_NODE) {
> +			kthread_fetch_affinity(k, affinity);
> +			set_cpus_allowed_ptr(k->task, affinity);
> +		}
>   	}
>   
>   	free_cpumask_var(affinity);
Reviewed-by: Waiman Long <longman@redhat.com>


