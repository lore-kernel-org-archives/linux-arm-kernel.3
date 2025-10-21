Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FED0CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3KJELQ+1zBaV6zsfBpuZG8t84lL3xkiKid35BQ9x2E=; b=h9lbdNmjNshm6pEdn2tIaUQhHr
	AgXtI5gvRrA36ke0r1P7R2SEOOB1Q62S0nugZ6G2ZZ+GS3Kr82bvEG94VIRREOwp8qTEqibZ9kBPj
	TrOVUwB0M+yVPLGditWDRH/pXCrJeMa3Rju4aHrR+KfoFk7BViN7cCfzWklQhD5OYyIE4FWzeSWTu
	UPYYmD+vnyXX25p8oExQRMsfK9bPE+pr0qyxMs0JsBcnYjgqPPwTwy4f8bfuNt8ZRjvBV837D1Mt6
	2lLPGeZGBiV2JAxhvzPXx1GmiEEHtZpcwZwAM+cR9EB/WcrW9H1piLUdPHPKbP9ltoKX2izhW5NwM
	peToa67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCaA-0000000HBDO-0vVM;
	Tue, 21 Oct 2025 13:39:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCa7-0000000HBBp-1mwi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 13:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761053958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j3KJELQ+1zBaV6zsfBpuZG8t84lL3xkiKid35BQ9x2E=;
	b=Fm52bYlPGqZSpzR3cdtOjdEXeelUUsG5PHSGjAV/zjQEyENbmo2PQWPbX2fn9uyy3WRoZD
	NU6v78EOuATTjK8j3laFDDcanzU/poGe8X5JCfmBhX7zYW+ZAWfbs8CLH7IUXq7OXU9kWq
	Y78ybsBF4i7aGyYe/wp+KDsEzeI0IOQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-4ezr0MEKOeO2SN7t5S-99w-1; Tue, 21 Oct 2025 09:39:16 -0400
X-MC-Unique: 4ezr0MEKOeO2SN7t5S-99w-1
X-Mimecast-MFC-AGG-ID: 4ezr0MEKOeO2SN7t5S-99w_1761053956
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-86df46fa013so2472017685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 06:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053956; x=1761658756;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3KJELQ+1zBaV6zsfBpuZG8t84lL3xkiKid35BQ9x2E=;
        b=kp0S2RKNPkxf7NvqlAdaPHzGgmeOZoZKSVH5U8hikW3EA29jhJmyn6Cd15g+PBEq6s
         r4qqwR0mvLgh+Th1kNbxAeQ4i9VfOn+7GwRmkPeUukbLfACoEUi7LEJnMFLpbym678k4
         RJ0PgNAcEEVdfqeoY1DjvgT5IfeAur8b0o9wV8BT8bCxyE8JqF8hFNSRDV6sXccjAbX9
         gvUtAN3xKrDhP+yvlECum8CTnTeOGYXtjLS+5A/oJjUrh47mdOvOghh1GbnH5dWurIJu
         zdYXvW2pR9OiShClq6d25EhoT8ZqpKNnsRGZecXfOxToU4ofTlA4tV510NwhEMmJY6q1
         PyBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX45Xl2f9qmuJSSrP+Izzz/8XcvbY4RBCrQF4OAUY32uIs5omzs51+Vey1KK0CecvLDesS09NzDcvc2xTisbggL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx+zPf2rOJsgEmfHP/XnSknirmh2VWV/CCzv1h7NvBHceeFKTD
	sjLPQtiVz3nZC7kDf5t+htNmBMhouxrs+ym4clTP8f4RCHG/k5pfvYF18/akXwFqATotrH66eWY
	iO80Br0vLShb+z7c7fX0sCnAs5h7fhffFeCpwV87Rembe7l7Y/Ape5jvshrmK3ML9MRk4eSvfMu
	v5
X-Gm-Gg: ASbGncutk92lIzt9gYzOUUrq7lgIx7ykjAsaAm3suSQW+GkO/jcc/vlOssYhB2bqyhT
	YNfVaATmd76kZznMm3PPMGEfRdnCfJe9AOHL1JBHAy6X+9tRsiI69sCho2CWg9SIkjcoH4nrppU
	5cPfCBKUV2CFiQwqC4qUgfbwc9MPaJ6o/FVh828LRJGECd2eCr0SAof6RlkyZGqrG8k/vOh5F8E
	yhwog/bLYqYc5vrPoVZvgoiSbZLUB0TdyJxbJh5ah36O9uye+nP2QEyvUy8+ZkXkNZUuzChatcq
	gcjZemBBKsIfCRs1v/3hoBiqiLE15LNIUXXf4PiiubrubER4ErlVKN/IpBSA4ZdBgZdHutHEvyH
	i8ARa9JH6Gq0RwKFfuz0wTxa9fsYZ/vFBNZpplCfzIvodbg==
X-Received: by 2002:ac8:7d8a:0:b0:4e8:a6c3:4322 with SMTP id d75a77b69052e-4e8a6c343dbmr147838271cf.68.1761053955806;
        Tue, 21 Oct 2025 06:39:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz7AKLLzN2UNU/guKrJvkpbFnggCrMTTSh4yWUy38aXqbwBFVcdBvCw2i1DLngSoeAJ3ah8Q==
X-Received: by 2002:ac8:7d8a:0:b0:4e8:a6c3:4322 with SMTP id d75a77b69052e-4e8a6c343dbmr147838031cf.68.1761053955419;
        Tue, 21 Oct 2025 06:39:15 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8aaf3370fsm74330521cf.3.2025.10.21.06.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:39:14 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <ea2d3e0e-b1ee-4b58-a93a-b9d127258e75@redhat.com>
Date: Tue, 21 Oct 2025 09:39:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
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
 <20251013203146.10162-14-frederic@kernel.org>
In-Reply-To: <20251013203146.10162-14-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FpcnoFnSDR6CnG2vUaC7VbNBZLQHBIG7bENs_XjzBQA_1761053956
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_063919_579583_16385B7F 
X-CRM114-Status: GOOD (  18.18  )
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
> @@ -80,12 +110,45 @@ EXPORT_SYMBOL_GPL(housekeeping_affine);
>   
>   bool housekeeping_test_cpu(int cpu, enum hk_type type)
>   {
> -	if (housekeeping.flags & BIT(type))
> +	if (READ_ONCE(housekeeping.flags) & BIT(type))
>   		return cpumask_test_cpu(cpu, housekeeping_cpumask(type));
>   	return true;
>   }
>   EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
>   
> +int housekeeping_update(struct cpumask *mask, enum hk_type type)
> +{
> +	struct cpumask *trial, *old = NULL;
> +
> +	if (type != HK_TYPE_DOMAIN)
> +		return -ENOTSUPP;
> +
> +	trial = kmalloc(sizeof(*trial), GFP_KERNEL);
Should you use cpumask_size() instead of sizeof(*trial) as the latter 
can be much bigger?
> +	if (!trial)
> +		return -ENOMEM;
> +
> +	cpumask_andnot(trial, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT), mask);
> +	if (!cpumask_intersects(trial, cpu_online_mask)) {
> +		kfree(trial);
> +		return -EINVAL;
> +	}
> +
> +	if (!housekeeping.flags)
> +		static_branch_enable(&housekeeping_overridden);
> +
> +	if (!(housekeeping.flags & BIT(type)))
> +		old = housekeeping_cpumask_dereference(type);
> +	else
> +		WRITE_ONCE(housekeeping.flags, housekeeping.flags | BIT(type));
> +	rcu_assign_pointer(housekeeping.cpumasks[type], trial);
> +
> +	synchronize_rcu();
> +
> +	kfree(old);

If "isolcpus" boot command line option is set, old can be a pointer to 
the boot time memblock area which isn't a pointer that can be handled by 
the slab allocator AFAIU. I don't know the exact consequence, but it may 
not be good. One possible solution I can think of is to make 
HK_TYPE_DOMAIN and HK_TYPE_DOMAIN_ROOT point to the same memblock 
pointer and don't pass the old HK_TYPE_DOMAIN pointer to kfree() if it 
matches HK_TYPE_DOMAIN_BOOT one. Alternatively, we can just set the 
HK_TYPE_DOMAIN_BOOT pointer at boot and make HK_TYPE_DOMAIN falls back 
to HK_TYPE_DOMAIN_BOOT if not set.

Cheers,
Longman


