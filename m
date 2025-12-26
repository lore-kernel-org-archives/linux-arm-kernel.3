Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C064E8FDB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 21:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hl0E323tW0AxgEnWj1OLKxpboSYa7xNjNvCKjrDAdIc=; b=nG0j0icnXQwPoHZ1fBq4gEFaur
	jL2Ikcxn9clwydcJxP5Q4z0gkrhA17TwrEPbMgcr7sYrmOa/XSrH3hI2Jegh5ltYIs/VpU+i3qUfE
	Ic6ZQrs4KltUA6extIWH1lCYzegEKQXMQ2My0yypEpjH3WFt/y426BCyZ1dqcEgwJ1IXMsxBQKuu4
	7TL/eAbZ1VNHJWhXrbNNOfCGMQAE8AaZRYKj6wIZZl/azm9+KIUd0gi4wxLh5DmtolT3nhQML9WIk
	TSGKUmOasFx/lX6833YWQ8ezT90p2qbufV7U7JyaMdIAoR5pe/P9hqR9v6p5sato7Xhku/JgSQaaX
	Q2TbG3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFL2-00000001TiL-0vrL;
	Fri, 26 Dec 2025 21:27:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFKy-00000001Thv-1orN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 21:27:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766784422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hl0E323tW0AxgEnWj1OLKxpboSYa7xNjNvCKjrDAdIc=;
	b=dK9qEbZ1EOkXSDnsFlpLv/nhmy10vJX+UZmjZO8Ndo83KfSQj8qEUINl2F8hMX5V/5EWeE
	VtdBHHLBS/04hkXtRvML6XpjPyl3aWg8GEDFGB0nneS3pPEt+sqrqW9o2kTp6jflYP1orR
	dRXnzWbhzhgp79Nrgim124m6Rt/7cQo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-KFpFBd1OMeCYD9lCdJ4ldQ-1; Fri, 26 Dec 2025 16:27:01 -0500
X-MC-Unique: KFpFBd1OMeCYD9lCdJ4ldQ-1
X-Mimecast-MFC-AGG-ID: KFpFBd1OMeCYD9lCdJ4ldQ_1766784421
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8888a6cb328so191932606d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 13:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784421; x=1767389221;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hl0E323tW0AxgEnWj1OLKxpboSYa7xNjNvCKjrDAdIc=;
        b=ca8POqn9Py1CxlcaTAPtjq6JH5didBOh9TCxF4y7Ur/GzvnJh6y4dFiAGnfD7LDNlu
         8tDrjDD78suqu1MFsQDx+d2Wav+g4lGEPL4Cg9wSd898FeSPRF+U7rNqh1UaRXvuAXnJ
         2ESjbGc2Pix9E25dxnMlYYsLdadD1pI6J6mblSyfLHyIdO6rGr6zbF/ly7bpQwxW6xZQ
         lyMD72c3j7XpsKEnq1nRkBPXmgPBSsW8iDBO7PaHoC0usJtIMg2DdfHwiuZXAyIVjyrz
         YusUFUx3XgThMNaJWW+glXphvKR7lFbYwrI5mZcVjwsK+SsjUzPzaXZu/0q/MBfTkTAy
         mdqA==
X-Forwarded-Encrypted: i=1; AJvYcCXPHCObY9sS80ryWgY3eLd6ecMKtutAgDg9UL7Re6MXNK596fAjYaKqXBuGhXF2K4OF7YLzgI21e3ndrj34e9r6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4X6hcxelCz9ImFLXyEXBbHM746SbMEPeP+rBEejkdqgtWjPZ/
	gW6jA9itVEGpluFB2BVr2GDvkauPkxMe30EW1sn9tOeiwR5eoa4MoKa4YxO/+oR0x23JmznsFCV
	MXHJjjeFtn+IWu1pKYOwtLvnyCquVfWGaesIVJEa6NQHh+jGy6QmoYxoGnrw5Tuq2fRg6+kdaHb
	dV
X-Gm-Gg: AY/fxX5x3awykpklnAC0LbX05jdgjY9EMWzo6+t79vFaL0T/DCDbBQ7nLeAAbL456iz
	jzZjLqbDef3psFjYkBCydHW9i/oWeQ719N+/nQVCbd8FwlwW/+1BrFRe5ujZdxQmU/jP28VpolU
	ymCftnnak4gxA67I+Nv0sfVI1nPKVT62Lf/LZ045gUYcwngH+vpduJ0hPVLUFX+F5MetviQNgew
	xuojbCfCq/XmbITUzn9QGPHiAJpmUj2NpMBSU1F0NSCx+cdpmDp7g1S/XCMoYNlHcOG/1xPBhs/
	HPV3ygZ3ndocytluBQeDtANoPlKeMbmpzphUdZW+s/HzgUuNq9+rpAfUf+hMrKwC9qUW+/YbMQL
	SuNxHl8ZlT/CQ/D5IY0xdhapWVouuVl4ZHIgdF1GMKajtAumoikWr7FtF
X-Received: by 2002:a0c:fb45:0:b0:88a:529a:a530 with SMTP id 6a1803df08f44-88d82041773mr328947866d6.23.1766784420882;
        Fri, 26 Dec 2025 13:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfZAYYIQ2fUbZyPMB45iQArY9ihsQ/fJKmBvKtaCb5+ZXeC6tWw3vCNx5szpnr8D6LkXzAiQ==
X-Received: by 2002:a0c:fb45:0:b0:88a:529a:a530 with SMTP id 6a1803df08f44-88d82041773mr328947536d6.23.1766784420468;
        Fri, 26 Dec 2025 13:27:00 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9aa3ac8fsm175993226d6.56.2025.12.26.13.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:26:59 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <bc573163-c5a8-4bb9-a280-45ca48431999@redhat.com>
Date: Fri, 26 Dec 2025 16:26:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/33] sched/isolation: Remove HK_TYPE_TICK test from
 cpu_is_isolated()
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
 <20251224134520.33231-23-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-23-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jl1sEAHPFsoV6rf8pt9WzlnLcZfIk9ahbXA6YaCkct0_1766784421
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_132704_609932_CA65327D 
X-CRM114-Status: GOOD (  20.04  )
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
> It doesn't make sense to use nohz_full without also isolating the
> related CPUs from the domain topology, either through the use of
> isolcpus= or cpuset isolated partitions.
>
> And now HK_TYPE_DOMAIN includes all kinds of domain isolated CPUs.
>
> This means that HK_TYPE_KERNEL_NOISE (of which HK_TYPE_TICK is only an
> alias) should always be a subset of HK_TYPE_DOMAIN.
>
> Therefore if a CPU is not HK_TYPE_DOMAIN, it shouldn't be
> HK_TYPE_KERNEL_NOISE either. Testing the former is then enough.
>
> Simplify cpu_is_isolated() accordingly.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/sched/isolation.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> index 19905adbb705..cbb1d30f699a 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -82,8 +82,7 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
>   
>   static inline bool cpu_is_isolated(int cpu)
>   {
> -	return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN) ||
> -	       !housekeeping_test_cpu(cpu, HK_TYPE_TICK);
> +	return !housekeeping_test_cpu(cpu, HK_TYPE_DOMAIN);
>   }
>   
>   #endif /* _LINUX_SCHED_ISOLATION_H */
Acked-by: Waiman Long <longman@redhat.com>


