Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE12CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNxXxUzXoqQQT9w5Yf9S20ddLNixsnFzdxWTN/CN8Uk=; b=ilCgtbZVMSyFa0XTOC/3fhJ8St
	7EI/Z1gLGXO2UUpaihDpVuvcVLtYgByGcClrR7k8T9fcAEg1DCFsvvJ5C2QgRUqs1kOcHncxxt6jr
	Cl14dyTaGp46tiMW8DpkGAllfNOaARnW+NZUjYpfFu9QEOUlTEDhNJY4YbEvxxSUstJnG9DAXJ0Ve
	wN49+hBR+pMw+S39NRouHGcQIVpylsfASYOZ68pDyzguFFRcEDRfepUcVIAlgJV4T5S3aAWLH7Vde
	pqtAtFrzWcm17CpY3pJzC7nbtTE1RCVm0Nt1J/ARYBvgbeKKMH5hqqa3gEOwPfBbKD2xInKVUf5H3
	6LzOVoiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAY4-00000002LNN-0lkP;
	Wed, 29 Oct 2025 18:05:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAY0-00000002LLw-0O2E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 18:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761761122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNxXxUzXoqQQT9w5Yf9S20ddLNixsnFzdxWTN/CN8Uk=;
	b=CzK6rvVXkHLPs7sH+Hs7gaX+eOZgHfh505gYz7jLU19UnA6WTL5TNrE/vVDQwDy+Gg3b+w
	o+RaIoH53mI6VMFQfViqwYhri6xex71+J3fg2vyXMdasWSkM4QVvk0avDOzjcliKUeeadE
	OOLOTjlM3EoGxJBgSowNNFQtBRMBYOc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-K6huvsJKMhC-uCWDhQrOSg-1; Wed, 29 Oct 2025 14:05:21 -0400
X-MC-Unique: K6huvsJKMhC-uCWDhQrOSg-1
X-Mimecast-MFC-AGG-ID: K6huvsJKMhC-uCWDhQrOSg_1761761121
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a6fc271d46so28655485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761761120; x=1762365920;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lNxXxUzXoqQQT9w5Yf9S20ddLNixsnFzdxWTN/CN8Uk=;
        b=ZhND5ap1FNJ409sA2AiFQmcSCBuhGQ7yjjfOoJlxBv673zWHaGshV0mHnXZAuwNiZI
         wvgp764NVTgs9GN/MPVJur9dvw/xLTZAQDNdUCS6y3PTDwNeMMPe53uMFrpFho+i6K3u
         Scp3Q9/1PDrxa7A4AU/ih/5YiT8np3CzHdVP9O4T+QWjBEK1CjP9hzkw9Pu8+wDG5ece
         0HjLQvdrI+Ol6FHqnqY0BQ7/dDLdSAPxk0k5Oyh+jZ/6etCz57nBWVdVDHrd0itpYLcd
         cQvi+JovJvTNQT9H7bZnfgm6n3UEevU4TCTQ3lgP0NrS+KAzydh+r/Szgimrny1LUCO+
         KHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrDPl6YnzIPw1teTOkLIZ/2HTlD94wPxbw9gvndeZym7VAVjv5yCd7hbBDXH1HubmPS2mj5uhRk3p+cOS1GNoe@lists.infradead.org
X-Gm-Message-State: AOJu0YxryoeJmk13GVBPiP0Qefwo5t3lr/zs9/WMuYR6CKmnJ+RysICU
	ghfitWA3iyoPxCPugQ3jsMwAOKIh6YI9r+FQn9/NV/5hQBeqMd4AjaLBs6Od+L9PtMHEkzpnhhh
	pZNV/jfuKh9wxGWStX40caFcJAPtMfvTYpEDJoShJI03Qqt7fiMqG2HS/PG5gaEWgvXOmNfLkdv
	tq
X-Gm-Gg: ASbGncsR+zt7WMW4UMtkdeYQxQqLHP8sUvXOEbYD4wad8NZDBLxX4kk7mLPQmcERrf/
	YvF1uOAzo+o1IJ/8qZHkVbR93Uu67Hy2ZDpg5Nzwtpal/B6xv+XSUSNjOqKIoJUgXJqsSqaoBA5
	q7Xsm3Tx1nGvXB0cWBV50Zx2RYstOoE2OkePxgE+gWaNABpJz6nTKnez/cSuBJBPhdi8prKgwau
	6j6Do03mPfV4o30ukuz5b3z/w8/2dAqgCCzTXYkB1sCRFVYRxK/6WReLjKu9H1oKOyoUtBHbrAQ
	LSg8m0Zd/St03BEcCn4R5pimOr7QrbL8hmfYYQ4ZkogznstNmf5UP2WHlGGLIXRF4klbI2ktuEi
	I+88pwWvKiQcCVUr05BVPzjUbacIM3Cbj6UNme7MCOypZcQ==
X-Received: by 2002:a05:620a:29cd:b0:8a6:92d1:2db5 with SMTP id af79cd13be357-8a8e473a6e6mr573645385a.24.1761761120510;
        Wed, 29 Oct 2025 11:05:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE6iTF4BqCkm725oJpB//2W/KjYfs5LBPrMdbtexGrXjP/dhJ17Z6sn/BKCKYXRH3K32fmkA==
X-Received: by 2002:a05:620a:29cd:b0:8a6:92d1:2db5 with SMTP id af79cd13be357-8a8e473a6e6mr573635985a.24.1761761119960;
        Wed, 29 Oct 2025 11:05:19 -0700 (PDT)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2421f6a5sm1111574885a.5.2025.10.29.11.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 11:05:19 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <7821fb40-5082-4d11-b539-4c5abc2e572c@redhat.com>
Date: Wed, 29 Oct 2025 14:05:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/33] cpuset: Remove cpuset_cpu_is_isolated()
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
 <20251013203146.10162-19-frederic@kernel.org>
In-Reply-To: <20251013203146.10162-19-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Hu-pq_w-eYaFe-Oaq2z5qgLlb2a_OjbosGe0f42D7nM_1761761121
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_110524_234826_BF787D9B 
X-CRM114-Status: GOOD (  16.82  )
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
> The set of cpuset isolated CPUs is now included in HK_TYPE_DOMAIN
> housekeeping cpumask. There is no usecase left interested in just
> checking what is isolated by cpuset and not by the isolcpus= kernel
> boot parameter.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/cpuset.h          |  6 ------
>   include/linux/sched/isolation.h |  3 +--
>   kernel/cgroup/cpuset.c          | 12 ------------
>   3 files changed, 1 insertion(+), 20 deletions(-)
>
> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> index 051d36fec578..a10775a4f702 100644
> --- a/include/linux/cpuset.h
> +++ b/include/linux/cpuset.h
> @@ -78,7 +78,6 @@ extern void cpuset_lock(void);
>   extern void cpuset_unlock(void);
>   extern void cpuset_cpus_allowed(struct task_struct *p, struct cpumask *mask);
>   extern bool cpuset_cpus_allowed_fallback(struct task_struct *p);
> -extern bool cpuset_cpu_is_isolated(int cpu);
>   extern nodemask_t cpuset_mems_allowed(struct task_struct *p);
>   #define cpuset_current_mems_allowed (current->mems_allowed)
>   void cpuset_init_current_mems_allowed(void);
> @@ -208,11 +207,6 @@ static inline bool cpuset_cpus_allowed_fallback(struct task_struct *p)
>   	return false;
>   }
>   
> -static inline bool cpuset_cpu_is_isolated(int cpu)
> -{
> -	return false;
> -}
> -
>   static inline nodemask_t cpuset_mems_allowed(struct task_struct *p)
>   {
>   	return node_possible_map;
> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> index 94d5c835121b..0f50c152cf68 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -76,8 +76,7 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
>   static inline bool cpu_is_isolated(int cpu)
>   {
>   	return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
> -	       !housekeeping_test_cpu(cpu, HK_TYPE_TICK) ||
> -	       cpuset_cpu_is_isolated(cpu);
> +	       !housekeeping_test_cpu(cpu, HK_TYPE_TICK);
>   }
>   

You can also remove the "<linux/cpuset.h>" include from isolation.h 
which was added by commit 3232e7aad11e5 ("cgroup/cpuset: Include 
isolated cpuset CPUs in cpu_is_isolated() check") which introduces 
cpuset_cpu_is_isolated().

Cheers,
Longman



