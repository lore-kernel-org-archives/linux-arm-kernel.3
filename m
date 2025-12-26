Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11790E8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 21:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asBMqPMMlBYgauRrbMzCES/5E7Ini+6B8CJ6RNaEzp0=; b=16vlXB36IfBW2KkVmLzCSEMPVf
	h9pVJjwiS0K7v9ePGrPW6CbAsuhudHSv2UMZ2a7JqagA9W6k35T/p5ZOvTuD9yMuFqBtstiGJ52mS
	XH1XQjIjy+gPKzUvKc2rKdd6XW4/V9YyfixmhTbohbL4QfVynms6EVew+jA6TgutDAcHbogZNrSNf
	x9VT6zOfCewD9K+eJm99Fe1iabBrOKZFnu1zsUeC4bDAdGJOOwwwOSrRCGn76EMam7OReiQD2JdMr
	kPYrTfseeLhuM14XiJoEVuh1m3kxXpzNATWm7h7KR+94ZHSFhb0xfYKBO8QDgSFIObqZnSgYcI5xP
	tYmBZBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFVH-00000001UbF-37mF;
	Fri, 26 Dec 2025 21:37:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFVE-00000001Uar-3FaN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 21:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766785059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asBMqPMMlBYgauRrbMzCES/5E7Ini+6B8CJ6RNaEzp0=;
	b=at5MxfpXPcGsx/TZLr7nyP2tiwzuQqkcnp1HC//xhVFgPi+hgYwwRQDZVpvLheS6n2VjlI
	Eyjzfqbz/C+4KpdM8XxmvVqFGi2VPSYx3Zcv3BwyNBJqgwdZPj4hbIwvikv0MCbiDHlReC
	SbQo3jQNiQGMnQMfdNQrNXzyR+cijps=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-1_L76P-VOtOTD-FhhQ4_ng-1; Fri, 26 Dec 2025 16:37:37 -0500
X-MC-Unique: 1_L76P-VOtOTD-FhhQ4_ng-1
X-Mimecast-MFC-AGG-ID: 1_L76P-VOtOTD-FhhQ4_ng_1766785057
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a3929171bso155732706d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 13:37:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766785057; x=1767389857;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=asBMqPMMlBYgauRrbMzCES/5E7Ini+6B8CJ6RNaEzp0=;
        b=KqkppXBrWnGweaAXtsuM2YIErFBN2ReeWgjLS7C4aQ/EPn1qEuzShGEK4rQN8HYMq4
         xRcfQ+Exl6WM/s/VLWxVioOwQQkFRO3erBMFxzOUqepMhj6vRqrlaao5dykTb1pcuLpB
         XNDueAkzYXT/V7Nvca+wRHhd67hqTBqd50s90BQ9UBJqa5aPLyOu0g8ZH72oFQH8JVS6
         vEjTYRrlFhPzt9GBXDbWczjiW0pJC6tMZ80y9wMtN1AkoKg0ONjeMk9zxeFlEhHcbW0H
         NwXrvdHxj/wEqDkQJCQXBvCVPThX/7Ogag5ZeHUB/gOGVoiPfjOxk9TzXDkQ1W78cD83
         8bRA==
X-Forwarded-Encrypted: i=1; AJvYcCU3hV4jyAde7piL6S7htGYtAjIkxBOo633azWdUK3GW8pwtbTwr8laAvbXM6by5Hy1BwZaiCFw7FCxn9JXYD4IF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8SQlVEXfeRt/ZPJKhG5Gs55jhVtq+co+s3qlwEGNyPz/E6N9t
	2LKYtHhB7bJTyIGxNUnbEYcFSeA7OPgTlGCwxPE+U+6b5MBYSYb+c7WxMj/bX76Z2vy9A8Drf4j
	y4Di5bf8uK5P+/hjvtB9iA/K0yEWIZ9+g6DOg40Ea6z/VJQjcJq4ea359NAWsCq4V7Xg3LXSaEk
	wB
X-Gm-Gg: AY/fxX4FWKEvedrI0ytJbtonh8YT4L2YMv9QM7QXOubrWsqM2aD6SNH3tjlmtciydu7
	dvlZvt46qm+pcrHSOdL/rBIxBR5A4AhYZEFy/UKYnZ342QwoIIfWF97G/ywdzL9ednBraf3jgPb
	NdMUe+9CHs2r/LY2FQIAyOzk7h1dt1HUysHtGghLsitly/MjTKKuqTqjgARAgbhxTo42drq3l4u
	WsaJkMo2sL67Pd/3sQZmkcRiZSfBKYa1xuNL2LlP+C3RIic5ro3QJmx7cBeFd0Es5bwEb5h4roJ
	f62gvqsgphP3A0T4VhWoY0fxvioxRkQYf5nMy7Vp9JwlIiAaEqEPlpc45UO6cdoCRYxUDd3lJgj
	E0NouJ/MmMN/FHdU5mrIogfR0boJlyC8QwCHyd6A49TJwjfP+rLeiWUCl
X-Received: by 2002:a05:6214:1ccf:b0:786:8f81:42f with SMTP id 6a1803df08f44-88d8369eac6mr381482016d6.39.1766785056798;
        Fri, 26 Dec 2025 13:37:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/UszSTKNZq6JUtpfA708/ibPfYyEh5wUQDx/+llWKoJlmPrhzPZqD/XUz+CjETOu+z3XbwQ==
X-Received: by 2002:a05:6214:1ccf:b0:786:8f81:42f with SMTP id 6a1803df08f44-88d8369eac6mr381481746d6.39.1766785056354;
        Fri, 26 Dec 2025 13:37:36 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9680c323sm170712766d6.13.2025.12.26.13.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:37:35 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <af440ae9-e6ee-4cc8-a2d6-2178d9c80a50@redhat.com>
Date: Fri, 26 Dec 2025 16:37:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/33] kthread: Refine naming of affinity related fields
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
 <20251224134520.33231-25-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-25-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EgT1oRYGOm5yREXfl13r-pxbrygeCA2eA6Pfxosv6uY_1766785057
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_133740_903385_57408F86 
X-CRM114-Status: GOOD (  23.55  )
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
> The kthreads preferred affinity related fields use "hotplug" as the base
> of their naming because the affinity management was initially deemed to
> deal with CPU hotplug.
>
> The scope of this role is going to broaden now and also deal with
> cpuset isolated partition updates.
>
> Switch the naming accordingly.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   kernel/kthread.c | 38 +++++++++++++++++++-------------------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 99a3808d086f..f1e4f1f35cae 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -35,8 +35,8 @@ static DEFINE_SPINLOCK(kthread_create_lock);
>   static LIST_HEAD(kthread_create_list);
>   struct task_struct *kthreadd_task;
>   
> -static LIST_HEAD(kthreads_hotplug);
> -static DEFINE_MUTEX(kthreads_hotplug_lock);
> +static LIST_HEAD(kthread_affinity_list);
> +static DEFINE_MUTEX(kthread_affinity_lock);
>   
>   struct kthread_create_info
>   {
> @@ -69,7 +69,7 @@ struct kthread {
>   	/* To store the full name if task comm is truncated. */
>   	char *full_name;
>   	struct task_struct *task;
> -	struct list_head hotplug_node;
> +	struct list_head affinity_node;
>   	struct cpumask *preferred_affinity;
>   };
>   
> @@ -128,7 +128,7 @@ bool set_kthread_struct(struct task_struct *p)
>   
>   	init_completion(&kthread->exited);
>   	init_completion(&kthread->parked);
> -	INIT_LIST_HEAD(&kthread->hotplug_node);
> +	INIT_LIST_HEAD(&kthread->affinity_node);
>   	p->vfork_done = &kthread->exited;
>   
>   	kthread->task = p;
> @@ -323,10 +323,10 @@ void __noreturn kthread_exit(long result)
>   {
>   	struct kthread *kthread = to_kthread(current);
>   	kthread->result = result;
> -	if (!list_empty(&kthread->hotplug_node)) {
> -		mutex_lock(&kthreads_hotplug_lock);
> -		list_del(&kthread->hotplug_node);
> -		mutex_unlock(&kthreads_hotplug_lock);
> +	if (!list_empty(&kthread->affinity_node)) {
> +		mutex_lock(&kthread_affinity_lock);
> +		list_del(&kthread->affinity_node);
> +		mutex_unlock(&kthread_affinity_lock);
>   
>   		if (kthread->preferred_affinity) {
>   			kfree(kthread->preferred_affinity);
> @@ -390,9 +390,9 @@ static void kthread_affine_node(void)
>   			return;
>   		}
>   
> -		mutex_lock(&kthreads_hotplug_lock);
> -		WARN_ON_ONCE(!list_empty(&kthread->hotplug_node));
> -		list_add_tail(&kthread->hotplug_node, &kthreads_hotplug);
> +		mutex_lock(&kthread_affinity_lock);
> +		WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
> +		list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
>   		/*
>   		 * The node cpumask is racy when read from kthread() but:
>   		 * - a racing CPU going down will either fail on the subsequent
> @@ -402,7 +402,7 @@ static void kthread_affine_node(void)
>   		 */
>   		kthread_fetch_affinity(kthread, affinity);
>   		set_cpus_allowed_ptr(current, affinity);
> -		mutex_unlock(&kthreads_hotplug_lock);
> +		mutex_unlock(&kthread_affinity_lock);
>   
>   		free_cpumask_var(affinity);
>   	}
> @@ -873,16 +873,16 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
>   		goto out;
>   	}
>   
> -	mutex_lock(&kthreads_hotplug_lock);
> +	mutex_lock(&kthread_affinity_lock);
>   	cpumask_copy(kthread->preferred_affinity, mask);
> -	WARN_ON_ONCE(!list_empty(&kthread->hotplug_node));
> -	list_add_tail(&kthread->hotplug_node, &kthreads_hotplug);
> +	WARN_ON_ONCE(!list_empty(&kthread->affinity_node));
> +	list_add_tail(&kthread->affinity_node, &kthread_affinity_list);
>   	kthread_fetch_affinity(kthread, affinity);
>   
>   	scoped_guard (raw_spinlock_irqsave, &p->pi_lock)
>   		set_cpus_allowed_force(p, affinity);
>   
> -	mutex_unlock(&kthreads_hotplug_lock);
> +	mutex_unlock(&kthread_affinity_lock);
>   out:
>   	free_cpumask_var(affinity);
>   
> @@ -903,9 +903,9 @@ static int kthreads_online_cpu(unsigned int cpu)
>   	struct kthread *k;
>   	int ret;
>   
> -	guard(mutex)(&kthreads_hotplug_lock);
> +	guard(mutex)(&kthread_affinity_lock);
>   
> -	if (list_empty(&kthreads_hotplug))
> +	if (list_empty(&kthread_affinity_list))
>   		return 0;
>   
>   	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL))
> @@ -913,7 +913,7 @@ static int kthreads_online_cpu(unsigned int cpu)
>   
>   	ret = 0;
>   
> -	list_for_each_entry(k, &kthreads_hotplug, hotplug_node) {
> +	list_for_each_entry(k, &kthread_affinity_list, affinity_node) {
>   		if (WARN_ON_ONCE((k->task->flags & PF_NO_SETAFFINITY) ||
>   				 kthread_is_per_cpu(k->task))) {
>   			ret = -EINVAL;
Acked-by: Waiman Long <longman@redhat.com>


