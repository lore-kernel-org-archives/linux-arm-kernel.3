Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767DCE8FDB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbQAbHkG6iNX6LkB+q4ATv+TKkhtMlH6KHEacyY50T0=; b=acl8Eau2voZFd3lCUdYRNUfXi1
	rSOBhRSDib4UjD/hfvZNNwk/mEFKqHkVhtsGz8M/xL4o3DMCQinLs99wPCmu8T1uq+9aQDHVJs/2D
	eBguqPwxatr581txIVknwu4I5w9lOJ4Zep2hu3c4m2YeiS5y7A5OJQ/sjp8PeRxdi9oUT7AG7CyTE
	8J18fLlpKHwbWmB4L6CFoecyKWwANlWIlhEpwkbq04mwr21oj0KXB4rV6viMvy4IoEb26+XDkM49W
	5ypKG2Da7j7n6VTjusmnDzM9aEkH5rxNvFAP+8w50fPRzGPut/DCob8AnpCUX2QX+9je55UaVvuWP
	q+F9IkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZG40-00000001Vev-0C1V;
	Fri, 26 Dec 2025 22:13:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZG3x-00000001VeV-3P8X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766787212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MbQAbHkG6iNX6LkB+q4ATv+TKkhtMlH6KHEacyY50T0=;
	b=RLlGyUwtYevISZY2BzXkC+HU2I13BJVJnZfdig3vmf1eRamCR6Z5+pBqr9wf1y5Gh76d8l
	uwjAfSZrC3YEokcCIZU7r+bV0UqYuQdTPhGNAe+phYMbNYerhjryR/wEpLw/JAvgPLwK24
	/1qDKqfSCVpV5gLipzIhB33e1BMKU+Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-XQFjhcPSN0ioIEfbxadpQA-1; Fri, 26 Dec 2025 17:13:31 -0500
X-MC-Unique: XQFjhcPSN0ioIEfbxadpQA-1
X-Mimecast-MFC-AGG-ID: XQFjhcPSN0ioIEfbxadpQA_1766787210
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a316ede50so149378096d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766787210; x=1767392010;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbQAbHkG6iNX6LkB+q4ATv+TKkhtMlH6KHEacyY50T0=;
        b=IyS3q8p5N4vFrXNnMAB+dUIlIl/eAKTJWfvnZQ7BA2hGCB7PoLX+UCuMC7Fqs6GFcO
         ljjIM9mEbra3wDCVtuERu03Fq1BYzcqWHHn6lsIjddpAcDnFR7FZy6xFnj67TcT9EiiF
         YApo3hdTknXR6++CktBqabTyG6n+LHP4VSHaEov3Mjy6WP9oRSvGkfRXL3T0D6QST62i
         JG8Ojje9Roz5Evo1oT2mU/Uo+lGkqIbZ4HAdljcm/nIK4nYL83b/fQlzDPtzbvkgKoah
         wXLQyTUD7j5ycSwcVyjjE4SHr+2OB9ewr3kYfq7/PPgZC8S3JzdTT7FKkCRvv6rCnrp0
         Atdw==
X-Forwarded-Encrypted: i=1; AJvYcCWwuZ76xg4+m4W3m3EdANbZO5E5/+sHBzUTJ4W8RMOQNtFHs6WPU9wLRKm7vp7Pe2Xe1YQ/lq+PPVyBXa20SJQ3@lists.infradead.org
X-Gm-Message-State: AOJu0YyUfoIVCz/BWwfrP/NiR286fCq3q2igKH8B/ffcA5a4EUeyMDjY
	otdojpUppm3a3At09tCuCZ5tzRYRkMb1k3aC8/F07iT66eH9eS+0xZzLhzve+SGZr/8GvorV928
	Xn2avboE753PqHC+GVnRLPWikQxY8oPH+1odf/Yv1nPRFdIZLK8sabGokKHx04yFUzuLv8asey+
	Vn
X-Gm-Gg: AY/fxX5o3RE6okhMgXX55tWmAGW+sHYM+1kUB7ktz9beEUVtqjj6zI8N+ABpJu49lUF
	aDOuDQsroTU0hkDn4L5ZopvXBrq63A0yMukDTXP8ETZAbwTkaD4kFpARd/Hx1KAXILXfJN0C02j
	daNh7hr08Dugy65ZulWMMLb4i4GcPpaOUltejUVNvpEalz3n98fJm8D+Otg2kRWMnk9RVjARAho
	GjflTIdUWfDUy1TDYkbKHteoyVf7NaMVs1Br6Hk/0A/GUu6ZCHnokHduh8AGsybopqSjR6duPpN
	HAbyl/z2PfTOIw7ONGM2WXj1d/VPjQ2EvQHuselQnZq/MOQ2eRXNwyUUFuB+opq8I7gIuTg7ICB
	RspENa43DFq8F7GvudfOIteqNeEEv2JwFwuajtd9FzxS4HFNOdfYwYu2C
X-Received: by 2002:a05:6214:c2e:b0:888:8047:e514 with SMTP id 6a1803df08f44-88d81278a7bmr406254326d6.5.1766787210429;
        Fri, 26 Dec 2025 14:13:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYVLwcCzEd9vRQ5ZAiqiA7WVLjHHO5Pqc++xoxQfNciNGScOhGispLouTYQ6DDT3yyTzTvrQ==
X-Received: by 2002:a05:6214:c2e:b0:888:8047:e514 with SMTP id 6a1803df08f44-88d81278a7bmr406253916d6.5.1766787209977;
        Fri, 26 Dec 2025 14:13:29 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4d5b4c975sm115870181cf.1.2025.12.26.14.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 14:13:29 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <48f8bff9-178c-4ab7-a8ef-7edba9b0e7bb@redhat.com>
Date: Fri, 26 Dec 2025 17:13:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/33] kthread: Include kthreadd to the managed affinity
 list
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
 <20251224134520.33231-27-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-27-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y5eRLfpqQ7FHtjijwr6Cq8ZyuJtKPRYovH7XIoFCuSo_1766787210
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_141333_929307_C567160C 
X-CRM114-Status: GOOD (  16.81  )
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
> The unbound kthreads affinity management performed by cpuset is going to
> be imported to the kthread core code for consolidation purposes.
>
> Treat kthreadd just like any other kthread.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   kernel/kthread.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 51c0908d3d02..85ccf5bb17c9 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -818,12 +818,13 @@ int kthreadd(void *unused)
>   	/* Setup a clean context for our children to inherit. */
>   	set_task_comm(tsk, comm);
>   	ignore_signals(tsk);
> -	set_cpus_allowed_ptr(tsk, housekeeping_cpumask(HK_TYPE_KTHREAD));
>   	set_mems_allowed(node_states[N_MEMORY]);
>   
>   	current->flags |= PF_NOFREEZE;
>   	cgroup_init_kthreadd();
>   
> +	kthread_affine_node();
> +
>   	for (;;) {
>   		set_current_state(TASK_INTERRUPTIBLE);
>   		if (list_empty(&kthread_create_list))
Reviewed-by: Waiman Long <longman@redhat.com>


