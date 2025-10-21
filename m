Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B932DCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 03:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvtwqFSdwBIJ1DhFupvj6yUOG7znXFLvI8hL6gZ8038=; b=ONHlho7L6nrL9hLmRWxhfETKcp
	ucqM1ovmHnZDhBvMPkVKlA/Fq3Sf/eZLRWLCzmOSi0j9BOz1WXimy2gAoujJ45te9PhNR5ivsJ6pD
	tEAYqAKsol3t9Eo1VINm3XjMNPnEz3EB8WnjeLnXbcTVjITRjZbhJdTUdE12aiRMLosleZAf5nivz
	7z7G6SShh4w9I9igxdr8TYmCQx++xrA99Lm/gW1jLOlI7sTK0ht89uluohCX1CgRAZyHrdjWPLD3D
	eRXdeREm7IbYrOpZHNWnZqpFj23ZT4Ig0b6JpD48035uOKWPoBr27REMjGPR/08TKVElUYxqzK4Oh
	QSaVM60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB3Nu-0000000FkGV-1wLX;
	Tue, 21 Oct 2025 03:50:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB3Nq-0000000FkFj-1q35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 03:50:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761018601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YvtwqFSdwBIJ1DhFupvj6yUOG7znXFLvI8hL6gZ8038=;
	b=XvboJjdmIihWo7+/gD2ilhJTaBrTcn4A0qwoTl5RF4qI9zYm+3/je/YNW7YUIP2I34iRjn
	gDX6kL8qArUK7ieyziZVn0ntJsNbgeGbKQx/Kbu+rLA31+vX+22uC5dOACrdCRl2++un2c
	Ukw3O8ZRzLKCWRwaJEdFW91baLwkivI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-UOrjuvEkOeS1BC2TYKFIlw-1; Mon, 20 Oct 2025 23:49:59 -0400
X-MC-Unique: UOrjuvEkOeS1BC2TYKFIlw-1
X-Mimecast-MFC-AGG-ID: UOrjuvEkOeS1BC2TYKFIlw_1761018599
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88e2bd0791cso679161885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 20:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761018599; x=1761623399;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YvtwqFSdwBIJ1DhFupvj6yUOG7znXFLvI8hL6gZ8038=;
        b=dk3U8lXzKZLv77lDMhLk2vS+nGpz2J2Cub7GyFI5oOlYV8FoAAd+zq5T+ysoBHwsyf
         SlRT7fu2o8sHH/jhf1faCMC4C+Y7bPCqjg1CuHkMRkUbzKQ/HsShUQnOqQpwWxE6smb6
         Shs28/Pn1DyJ3zVmYNkGir8DLArXs0N0FYBZc6O4ODGU9YRE5ij0orXrd3vWMk8Pggu6
         mSdikAwLkwOet6xcI5Z8i5cNlTUwR92qDA/74tsvA4Dt/GaJ2Xl+29jzDcT68aLWazLm
         yv72x9rC0vBrwbcd9y9exi8NvTZ0b1bMUaV8CCDp1GGc+Zz2xuhR5YwPfmMr5ucc2ZjY
         LsTg==
X-Forwarded-Encrypted: i=1; AJvYcCW1oC9lMDmPBYVxKRw29XIP6FuHHIG5H8QrxICBZnSbV5vjtP9Of13LMVcURhLiiyHl1vSxzndvvXk+3PtvZRMb@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq27Poze3zlfVBS5bEZTJaVENQvDntkc4BwsWDTnGXksHyCfsI
	k+LsmxjSaLvMljWHNb1TL40Siy82ouupxN3UhqBm5ymEgsdEVVx8+DFiP9diEzHyPjJonsDpq9w
	SmFeglDYs24v17wsHmGm4iCzZauIMKSt/utNWqgaJaPW/pvdLpoEEAQI5TQvSc376dYt2VvDRj3
	3K
X-Gm-Gg: ASbGncuk7ngdE8w2c+Yj04YFKzP/UNtRji2E1DY+vN+1lyHSZrpTa3Tw7xYvOxU/0xL
	Abyl9tsRssHPG9oB8ZpYSi7VnUY+ZhdVmqLg3igKqvauUNQ/Q4jkfHkgGXepAt1wAPr5xM3rhLw
	oSEsM70vx6THtJyY1fQn3Lhl6zTYQGXAVorEUINwkXn4lKAMsr43vMZr4RzxdOWWdqHLIrgyK7x
	klMDR7ZM2vLUco+fKwrIdSnd7yLkcRIyxcKsj5USIYcO2ZY38okgldg+iYOcBLqgkYGgVkBxx+Q
	irZPlZix39rYmBqR0awe3TjAmpUxaJq6TPoQH5mtAP6XIMaaXB4hWBu9rEVLqCzcFM7sUq/tmfk
	caA2Woss3We1HdB1twKiu7e8hNaNiqKR47SLsQ5ZHJ/absw==
X-Received: by 2002:a05:622a:14d1:b0:4e8:ac66:ee45 with SMTP id d75a77b69052e-4e8ac66f422mr138856461cf.43.1761018598795;
        Mon, 20 Oct 2025 20:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzYxTQpPj871EoIMw1y246oGNNWS2hGT92x0DCSyPVsnjuqhhKKjEAvaY7EAUAoH4h5eayPQ==
X-Received: by 2002:a05:622a:14d1:b0:4e8:ac66:ee45 with SMTP id d75a77b69052e-4e8ac66f422mr138856231cf.43.1761018598358;
        Mon, 20 Oct 2025 20:49:58 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cd6717desm684147885a.26.2025.10.20.20.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 20:49:57 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <083388fb-3240-4329-ad49-b81cd89acffd@redhat.com>
Date: Mon, 20 Oct 2025 23:49:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/33] sched/isolation: Convert housekeeping cpumasks to
 rcu pointers
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich
 <dakr@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
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
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-13-frederic@kernel.org>
In-Reply-To: <20251013203146.10162-13-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dLU2lnHnmc0nhBvy56ozn4F2lod6IWB6QOjLA-GGAdo_1761018599
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_205002_557783_1B6C581B 
X-CRM114-Status: GOOD (  21.58  )
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


On 10/13/25 4:31 PM, Frederic Weisbecker wrote:
> HK_TYPE_DOMAIN's cpumask will soon be made modifyable by cpuset.
> A synchronization mechanism is then needed to synchronize the updates
> with the housekeeping cpumask readers.
>
> Turn the housekeeping cpumasks into RCU pointers. Once a housekeeping
> cpumask will be modified, the update side will wait for an RCU grace
> period and propagate the change to interested subsystem when deemed
> necessary.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   kernel/sched/isolation.c | 58 +++++++++++++++++++++++++---------------
>   kernel/sched/sched.h     |  1 +
>   2 files changed, 37 insertions(+), 22 deletions(-)
>
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 8690fb705089..b46c20b5437f 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -21,7 +21,7 @@ DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
>   EXPORT_SYMBOL_GPL(housekeeping_overridden);
>   
>   struct housekeeping {
> -	cpumask_var_t cpumasks[HK_TYPE_MAX];
> +	struct cpumask __rcu *cpumasks[HK_TYPE_MAX];
>   	unsigned long flags;
>   };
>   
> @@ -33,17 +33,28 @@ bool housekeeping_enabled(enum hk_type type)
>   }
>   EXPORT_SYMBOL_GPL(housekeeping_enabled);
>   
> +const struct cpumask *housekeeping_cpumask(enum hk_type type)
> +{
> +	if (static_branch_unlikely(&housekeeping_overridden)) {
> +		if (housekeeping.flags & BIT(type)) {
> +			return rcu_dereference_check(housekeeping.cpumasks[type], 1);
> +		}
> +	}
> +	return cpu_possible_mask;
> +}
> +EXPORT_SYMBOL_GPL(housekeeping_cpumask);
> +
>   int housekeeping_any_cpu(enum hk_type type)
>   {
>   	int cpu;
>   
>   	if (static_branch_unlikely(&housekeeping_overridden)) {
>   		if (housekeeping.flags & BIT(type)) {
> -			cpu = sched_numa_find_closest(housekeeping.cpumasks[type], smp_processor_id());
> +			cpu = sched_numa_find_closest(housekeeping_cpumask(type), smp_processor_id());
>   			if (cpu < nr_cpu_ids)
>   				return cpu;
>   
> -			cpu = cpumask_any_and_distribute(housekeeping.cpumasks[type], cpu_online_mask);
> +			cpu = cpumask_any_and_distribute(housekeeping_cpumask(type), cpu_online_mask);
>   			if (likely(cpu < nr_cpu_ids))
>   				return cpu;
>   			/*
> @@ -59,28 +70,18 @@ int housekeeping_any_cpu(enum hk_type type)
>   }
>   EXPORT_SYMBOL_GPL(housekeeping_any_cpu);
>   
> -const struct cpumask *housekeeping_cpumask(enum hk_type type)
> -{
> -	if (static_branch_unlikely(&housekeeping_overridden))
> -		if (housekeeping.flags & BIT(type))
> -			return housekeeping.cpumasks[type];
> -	return cpu_possible_mask;
> -}
> -EXPORT_SYMBOL_GPL(housekeeping_cpumask);
> -
>   void housekeeping_affine(struct task_struct *t, enum hk_type type)
>   {
>   	if (static_branch_unlikely(&housekeeping_overridden))
>   		if (housekeeping.flags & BIT(type))
> -			set_cpus_allowed_ptr(t, housekeeping.cpumasks[type]);
> +			set_cpus_allowed_ptr(t, housekeeping_cpumask(type));
>   }
>   EXPORT_SYMBOL_GPL(housekeeping_affine);
>   
>   bool housekeeping_test_cpu(int cpu, enum hk_type type)
>   {
> -	if (static_branch_unlikely(&housekeeping_overridden))
> -		if (housekeeping.flags & BIT(type))
> -			return cpumask_test_cpu(cpu, housekeeping.cpumasks[type]);
> +	if (housekeeping.flags & BIT(type))
> +		return cpumask_test_cpu(cpu, housekeeping_cpumask(type));
>   	return true;
>   }

The housekeeping_overridden static key check is kept in other places 
except this one. Should we keep it for consistency?

Cheers,
Longman


