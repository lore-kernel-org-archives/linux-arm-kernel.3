Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E2BD25030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 01:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5g0eqFZw+saooIdmg9NsoPWVUWAMnQL8vdrqEmKZ9zg=; b=ZRxssxNBq1Vc82cIVqL451kL6d
	j5K4/0GdCa3U0M+vvzyTX/8Yrjl4hUEku1KR8qRNvoDY7kZQ2wOzlATfJAieJp6bwVKnm5dQDu/fR
	OPCwUx4+r1RK3d/35rgAbZUqj5z7Hd3bUumzW4yheSYVsDp+2ym4m7zvcyY8OKk8xzXyMkmaBvvLj
	w47+xvws5Iakl8wS+zRdjbr62uyzkz2L2GmLI9SgcEKdplZx1ytuLeP3k9gR25O5cZYvosvaa0Tio
	s8hvqtq10Lr4vQcBySMPBorK/d8quJatLZSE5rb2eniB1myw91PqV0YTwrF4kzgLM+RByLuPL0nOM
	JqURfN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf6y4-00000004dec-16JT;
	Mon, 12 Jan 2026 01:43:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf6y1-00000004deF-0AmY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 01:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768182215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5g0eqFZw+saooIdmg9NsoPWVUWAMnQL8vdrqEmKZ9zg=;
	b=YOipb1TBGiSct2dfeiltIJQh7GjVNMsW6XfiCsyx0I+065IQ/oSYZWAqbaX8IsEixbctkQ
	9RIoH9aEEZmD4sSm3uhF90BNZFUQ2U5/FY1WXzOsQZDWDQYFTaLevJcJqrh6ko30Jqw7Li
	vx5NlQjr+9QFD8VZPpt/6+QCYQ9N8Ec=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-pY5sym90Oc6AIw5Jlk_VGg-1; Sun, 11 Jan 2026 20:43:31 -0500
X-MC-Unique: pY5sym90Oc6AIw5Jlk_VGg-1
X-Mimecast-MFC-AGG-ID: pY5sym90Oc6AIw5Jlk_VGg_1768182211
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f5265a39dso15945164241.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 17:43:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768182211; x=1768787011;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5g0eqFZw+saooIdmg9NsoPWVUWAMnQL8vdrqEmKZ9zg=;
        b=MoSOpe4BQRw5IQ7Gdr+agsYcTwGebok+Cm7wMLGPZD91QgwXGeLAbXbGduKisMlilS
         G8+vRjInWFH0K5mk1Z7xbwodfTnD2aj1go0ESacQZk1ekTbtnhi+XWKUyiAVK7KisqUJ
         obi9J0j1wWxYhaAiZn0s1YexXKWtEOT5b6v+FvIWk05KFv/+/k1EX4nuBjvCi/CTaiOh
         hSEWV4YOU4FI7i/AKnBuF5pqmyO8OIHbmuC6iaZWAQ6SOY2qhULN7AxLZ9MrqIXKNgOQ
         NQ+XlkSjAQ1L5CVrxgLlazwvnBMMxid/tyV5I7PIx/B5gPN9lwK6A39LVzHqIGISySkm
         tTmA==
X-Forwarded-Encrypted: i=1; AJvYcCVtUREGcZqkaC0zym4D/dJzx2e4U00ljeXlm+AVtzF/1w3yW8XppvkEBVmv2svtHZgDsuEJdYphEKyGcT9Rm6Nr@lists.infradead.org
X-Gm-Message-State: AOJu0YwWrt+kgRV630ZSBdeML9xE86QhfQByFLv3qjTaQfPjN629dVM1
	AMQVJFT8M8KUTM6NX3U4QkXGTe5trsVF1RBJciZD8wRtv4jmjxRvJ1XFufp57Y7I5vg4mYT3Z3R
	QSGV4dcQjLCBOTJ2oj8YqCrRhA9G0INq32Cfguo7FjrrCn5ZRCT9Hhn10092phzPR+rkpNQ16CZ
	KS
X-Gm-Gg: AY/fxX7u6gjNaegPrJmf9V+b1LjghsUV5ZsO2N6M3Z0IprTxvXaqj0fXvoJk4kp1gCF
	uvng8BdXh64hRq2SGmpcS5aGOAKawJIFnbyLyqafBKZ6sXxgRYkvHXmK+pb6EwNEtXG+sUsCz7W
	ex9KbuEYkF/BXx5Vq585BENOkNMM49UN7szygtSl9g78Ofc4yUlnhbdIB1M6EHgv7gyOFFcSpTg
	PnziQbVxXWFEpBTcdUXNy1GMHdEpUE7FjSq519JS775oS46rsY12FBB1VA76fkgEIkg7SRlzsnW
	DGTjeP85LTRJ069k774Ib750bqNAyEe4GrO5er6a3YAGJFhfR9zukWMrdT+89RwzuhqxC+k34kK
	zzh7k7Pr1LajRuBqRGK23vxqiVFqKLgAPT10YuOUw9vGqh3jBqmlHBzAj
X-Received: by 2002:a05:6122:3383:b0:55e:82c3:e1fb with SMTP id 71dfb90a1353d-563466b1471mr6360634e0c.10.1768182211346;
        Sun, 11 Jan 2026 17:43:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHV+QUILwqeHqopifLZI0TMkyTSwUxskEqEsydIK3wu+6ViPTcpBZklzMvbaEYb1jKTIvUBCg==
X-Received: by 2002:a05:6122:3383:b0:55e:82c3:e1fb with SMTP id 71dfb90a1353d-563466b1471mr6360599e0c.10.1768182210967;
        Sun, 11 Jan 2026 17:43:30 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56375cd7cd6sm4961512e0c.10.2026.01.11.17.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 17:43:30 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <e97d96fc-cbdf-4c03-aa1a-b0cde5419681@redhat.com>
Date: Sun, 11 Jan 2026 20:43:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/33] cpuset: Provide lockdep check for cpuset lock held
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
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-13-frederic@kernel.org>
In-Reply-To: <20260101221359.22298-13-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: K1TV3YhDO1Mg19uVtG-XchdKevbA705thrNLoWgVsXU_1768182211
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_174337_162572_2E309BE2 
X-CRM114-Status: GOOD (  18.78  )
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

On 1/1/26 5:13 PM, Frederic Weisbecker wrote:
> cpuset modifies partitions, including isolated, while holding the cpuset
> mutex.
>
> This means that holding the cpuset mutex is safe to synchronize against
> housekeeping cpumask changes.
>
> Provide a lockdep check to validate that.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/cpuset.h | 2 ++
>   kernel/cgroup/cpuset.c | 7 +++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> index a98d3330385c..1c49ffd2ca9b 100644
> --- a/include/linux/cpuset.h
> +++ b/include/linux/cpuset.h
> @@ -18,6 +18,8 @@
>   #include <linux/mmu_context.h>
>   #include <linux/jump_label.h>
>   
> +extern bool lockdep_is_cpuset_held(void);
> +
>   #ifdef CONFIG_CPUSETS
>   
>   /*
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 3afa72f8d579..5e2e3514c22e 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -283,6 +283,13 @@ void cpuset_full_unlock(void)
>   	cpus_read_unlock();
>   }
>   
> +#ifdef CONFIG_LOCKDEP
> +bool lockdep_is_cpuset_held(void)
> +{
> +	return lockdep_is_held(&cpuset_mutex);
> +}
> +#endif
> +
>   static DEFINE_SPINLOCK(callback_lock);
>   
>   void cpuset_callback_lock_irq(void)

The cgroup/for-next tree already have a similar 
lockdep_assert_cpuset_lock_held() defined. So you can drop this patch if 
this series won't land in the next merge window.

Cheers,
Longman


