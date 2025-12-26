Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D12E7AD78
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 02:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Qsz5WPFD/uExCJQBnyZrl3TgkdgAhutxKnz59++5sE=; b=rK97X6A576dOv1OdoHpPYG/BdS
	J4z3oIK6u22DLZRYqaWHXzhKOi4LiVvvPTdLVQHS1O/MUD3ZZNo4qyh6JSCmcFidsmw+ACeUBUW84
	2K5zBP/P1aaFgM99yZnsEVmbLCrpCHyi6LwtF6LaeXdidsxyDMxq+slisCO4TieckozyIE5g8dv+B
	9du3bNqv+u4m9aleMg57wSdTrDowuQfYyPJ7yNUbwCN+8nkwebtV0deco3++kmq3HuyRyLmG0mCJA
	fu3+z9AqPvses3p13cOELR7JsWAlWuLKYTLwc2ysUGJbMJZlTzeTa8hHVOS3H8VxTwDnmZkTV9PvS
	pGkHeJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYxVq-00000000pUk-2Fuo;
	Fri, 26 Dec 2025 02:25:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYxVl-00000000pU1-3JJh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 02:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766715899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Qsz5WPFD/uExCJQBnyZrl3TgkdgAhutxKnz59++5sE=;
	b=hOwfFZ710VPjketZu6BcT4FTzJihP8HWqg/bEK12ffUbnuOtlDn7F61S+drIcBvfayJQiO
	uPy0yhHcM91k1GV2F+M763QrXGRwYmf+LWEV70nvqdRGZ8sqHgZDdM9/DyyMUzRO0B+5+j
	Ulw5E/AE8OgX604RaBBQKKgGs5fV6ec=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-LLVOLiUEMv27TZ3jXTQujg-1; Thu, 25 Dec 2025 21:24:57 -0500
X-MC-Unique: LLVOLiUEMv27TZ3jXTQujg-1
X-Mimecast-MFC-AGG-ID: LLVOLiUEMv27TZ3jXTQujg_1766715897
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so6739000a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 18:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766715897; x=1767320697;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Qsz5WPFD/uExCJQBnyZrl3TgkdgAhutxKnz59++5sE=;
        b=JEfxwISJTfbKXVSnNp3HHkuYSHAMmweXdMplscvvvyt/f1AF4dM3HO+PEgRkJVw7qg
         jV2sxL28ok6RjOHj/zx5LgKKfiyKNHSqG+OL7TUBVxBCSV3ms+ClsCYxW9x0Jag4arAH
         KRi1SDwrC/VdY+fVkY1e0ghkX3ZjW66frlNsMxt+fHvjxQZYewABJ/PGT+7ZiSLnjq2r
         +f6poOkwY0HtvCKEBklpqmKK0GrtzCDJygdYmO+9RJTFasSKlUTxIyE3uczasIsmtBw3
         AyiluIoLwnycRWWjrME7KbPFqN+F/HkdK2oYV959V1Ktbde5TXv+dX8VhBHDelnoCFLn
         X8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcI5DyXjvgJgAY3SsF5SY4TD6qoFffWoPjsFrGfKpwiYYKPYiVdQYCYOydxB5QdIFt+yJy//ZOuuDgaZpYRuu6@lists.infradead.org
X-Gm-Message-State: AOJu0YwvzHF07dJlVJdUKAQ76oHXq9LiGCLojMevdNHF3bxfYyPA7XQX
	gUPa0SUvwWBRQ9ElC8Mvst4cddXCBatGEr2EISPSEgZvFDena8OVTbv/I3ytZobuepYiGvud2Z9
	wcC6nOMT6xhwpqqn7ijvcr2fA1VSAGP0YiodYkKqnUOzJ/YWUT6oUH2FJStem926EPNB+pTM7Of
	7m
X-Gm-Gg: AY/fxX6blXzSqhPdftCnXKG74MuT6Hua9DFAQufL72T4AGN6PqSzcFgRbpxdj7HQk24
	7wyebva22+chO4nDM5JdO+NEL6B/v4Vk+T0mYPK+T3SslnBypMj2Gb/WDzMoYURI/+3WMbS9KQ1
	LmTqzYd3n0BniqWY+L6g4yhvFJOLIvFaeH6/Bbb1PssrJmRvkELYzKbBnfxe8nRhkKE75/zg+YO
	5OeuEpQNJxvKqh5BcBzGNckHAHobQqctxeeZkDUyJGV150VjMqB/AI03tQEWLocdjwCB+xQIcHN
	cVLh0YBmie3/sf0OdU7ra52U/lfDLZ0yv5jkajRcgU0fCeEuErqdIhWQsoLXhY/lTUZqjAhj+xr
	EmHaX5oMqO0GO78ixw6tT39HoKYZbJKlWW6snqygkg/vAhbf+H5MK8bqt
X-Received: by 2002:a05:7301:7d16:b0:2ae:526a:961d with SMTP id 5a478bee46e88-2b05ec8642fmr15215236eec.40.1766715896414;
        Thu, 25 Dec 2025 18:24:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXdA8ClkjU6K261gUhCEsY/UDJEEfrrLSdJplFZD7gmyleR6jxqLs3c/WeMtHejh420lmUqA==
X-Received: by 2002:a05:7301:7d16:b0:2ae:526a:961d with SMTP id 5a478bee46e88-2b05ec8642fmr15215216eec.40.1766715895871;
        Thu, 25 Dec 2025 18:24:55 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm49761798eec.4.2025.12.25.18.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 18:24:55 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <17aadc7e-7dd6-4335-a748-e66f0239df85@redhat.com>
Date: Thu, 25 Dec 2025 21:24:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
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
 <20251224134520.33231-15-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-15-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TiFkDmBW3vxv-cXCw1-cWoOV_THVZuXEF35CmLxEkNo_1766715897
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_182501_913696_C90D84CA 
X-CRM114-Status: GOOD (  28.52  )
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
> Until now, HK_TYPE_DOMAIN used to only include boot defined isolated
> CPUs passed through isolcpus= boot option. Users interested in also
> knowing the runtime defined isolated CPUs through cpuset must use
> different APIs: cpuset_cpu_is_isolated(), cpu_is_isolated(), etc...
>
> There are many drawbacks to that approach:
>
> 1) Most interested subsystems want to know about all isolated CPUs, not
>    just those defined on boot time.
>
> 2) cpuset_cpu_is_isolated() / cpu_is_isolated() are not synchronized with
>    concurrent cpuset changes.
>
> 3) Further cpuset modifications are not propagated to subsystems
>
> Solve 1) and 2) and centralize all isolated CPUs within the
> HK_TYPE_DOMAIN housekeeping cpumask.
>
> Subsystems can rely on RCU to synchronize against concurrent changes.
>
> The propagation mentioned in 3) will be handled in further patches.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/sched/isolation.h |  7 +++
>   kernel/cgroup/cpuset.c          |  3 ++
>   kernel/sched/isolation.c        | 76 ++++++++++++++++++++++++++++++---
>   kernel/sched/sched.h            |  1 +
>   4 files changed, 81 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> index 109a2149e21a..6842a1ba4d13 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -9,6 +9,11 @@
>   enum hk_type {
>   	/* Revert of boot-time isolcpus= argument */
>   	HK_TYPE_DOMAIN_BOOT,
> +	/*
> +	 * Same as HK_TYPE_DOMAIN_BOOT but also includes the
> +	 * revert of cpuset isolated partitions. As such it
> +	 * is always a subset of HK_TYPE_DOMAIN_BOOT.
> +	 */
>   	HK_TYPE_DOMAIN,
>   	/* Revert of boot-time isolcpus=managed_irq argument */
>   	HK_TYPE_MANAGED_IRQ,
> @@ -35,6 +40,7 @@ extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
>   extern bool housekeeping_enabled(enum hk_type type);
>   extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
>   extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
> +extern int housekeeping_update(struct cpumask *isol_mask, enum hk_type type);
>   extern void __init housekeeping_init(void);
>   
>   #else
> @@ -62,6 +68,7 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
>   	return true;
>   }
>   
> +static inline int housekeeping_update(struct cpumask *isol_mask, enum hk_type type) { return 0; }
>   static inline void housekeeping_init(void) { }
>   #endif /* CONFIG_CPU_ISOLATION */
>   
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 5e2e3514c22e..e13e32491ebf 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1490,6 +1490,9 @@ static void update_isolation_cpumasks(void)
>   	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
>   	WARN_ON_ONCE(ret < 0);
>   
> +	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
> +	WARN_ON_ONCE(ret < 0);
> +
>   	isolated_cpus_updating = false;
>   }
>   
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 83be49ec2b06..a124f1119f2e 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -29,18 +29,48 @@ static struct housekeeping housekeeping;
>   
>   bool housekeeping_enabled(enum hk_type type)
>   {
> -	return !!(housekeeping.flags & BIT(type));
> +	return !!(READ_ONCE(housekeeping.flags) & BIT(type));
>   }
>   EXPORT_SYMBOL_GPL(housekeeping_enabled);
>   
> +static bool housekeeping_dereference_check(enum hk_type type)
> +{
> +	if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {

To be more correct, we should use IS_ENABLED(CONFIG_PROVE_LOCKING) as 
this is the real kconfig that enables most of the lockdep checking. 
PROVE_LOCKING selects LOCKDEP but not vice versa. So for some weird 
configs that set LOCKDEP but not PROVE_LOCKING, it can cause compilation 
problem.

Other than that, the rest looks good to me.

Cheers,
Longman


