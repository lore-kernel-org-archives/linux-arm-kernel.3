Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E7BE7AD70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 22:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeNHvsN1ZBvb8Hdsv//kNjFTWoycJwfijVViJF41qv8=; b=VbLY+mFDNV68PSoZ+u7sGYWnk5
	q1RS9aiIn3V8zvw953a+DkyLlx3kRiLOdGmnI/65x2L1YaCvznMnAxt+mQdnPuCNF41mgPwA2zYpS
	pMYO2t+IbvsjBK35ksG3IVKegPX5ysR1XcQGae+dt4I3OLm+5cJwhAMx5jYQkc7Z/fn6yMzTkMjAW
	oHZAYnuV7ZheMu+egiuR+RzpRpg1fbCGUqdz4f+2ZOy8oMmj59nfV1hkrKQaLq7cAj7R1J+AYh0jz
	aKdOpNZ7+BU48CV0cUaPNeN6Kjk+Sdda882Wc+sz4E04S4+0PWOLaK9vus3bCvrnIju+puKlEmQV2
	UcSfDXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYtog-00000000j90-1hxn;
	Thu, 25 Dec 2025 22:28:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYtof-00000000j8h-06cF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Dec 2025 22:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PeNHvsN1ZBvb8Hdsv//kNjFTWoycJwfijVViJF41qv8=; b=JQT/mmsm00jYPf0lp3GLD4Y7Vj
	hvWK0qKiYdVPNDs56L+zI5k+1gB7RJywPB18iUgCR2kIDK3XDml0MJ4psE5hBaXSSf1Z/981WOL3j
	GXmBwcWq2m7+HlxbVUwX4QifmhRo1093FyrXcZZuQlBNbd2FEq67DMf1WS+/C3MfIlPQ6Ow2HISMW
	/nVVpNm35+cMp9P/u0wB95qlagJe1i6RNs4f/VAMoCS6JBhALPMk/P8aq6X1bHs/GDrSb2MuT07JH
	linrY/C7rdBEecPxk4WG08Ne2YnRq+R//p876qOqoIqgSaGsErwPI5ive+aRfhfjmLddnprvtg+0k
	/O23j73w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYtob-00000000f5T-2FyF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 22:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766701682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeNHvsN1ZBvb8Hdsv//kNjFTWoycJwfijVViJF41qv8=;
	b=NTzyyZTKAi+1p0EJ9DGkep+IfGVWOPiYNgfLeIF8l9mtC7emjX2vS66Id0WH9bm7MDt67Z
	vkb3oMtcB4qu4346L097XKLPpdbX2G7G+q6UPHdqnI4dKPm34V9eJ+eHxVyUZek2S/PuBN
	pRIt3j3Q+hZ5QFOZTXcEtStnDf1HQfw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766701691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeNHvsN1ZBvb8Hdsv//kNjFTWoycJwfijVViJF41qv8=;
	b=c+EZt+4fx66AOobrVUCxbkQIKjRPGAj6adUVZLuoTovJ8vpK/ZqyGxoIp5Agav3veaIJAi
	lTudUUyg5rIr6h/RH5Vm+aA4BxGS00mgNzJYsIzxe4DpZbB+ZZQJDKMmsouYeifj4b/mdB
	QXR2lCpWIlKJcSV7mhCV2K4Ri0Fd51M=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-RQABeyFgP66uZur0khLrCA-1; Thu, 25 Dec 2025 17:28:00 -0500
X-MC-Unique: RQABeyFgP66uZur0khLrCA-1
X-Mimecast-MFC-AGG-ID: RQABeyFgP66uZur0khLrCA_1766701680
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a366fa140so323782856d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 14:28:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766701680; x=1767306480;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeNHvsN1ZBvb8Hdsv//kNjFTWoycJwfijVViJF41qv8=;
        b=H9srRIfbaBXWM+aKqo1C3asxGvzV8+TMa6s0rdaCPsjXHKywCChI9RxHcWjCxnj4vS
         klA6fJ5zyMajZ9x50xh/klBde3GSbrzaeMwqJqwm9HjAnPIYo4sAXB5SbWaM5kJDRkuI
         W3ZavHoGPDZRnFGreKLQG9aKxTOuD+xzZfMMD7wj8U7N9Kxc4dFwN9UDYfE9Rc9Qkyxf
         ZGSD01cmYpVqQUimrLw9gE5DBZtLSzqGdAHNBEH4CPrhNPS5jGYWerQA4kMjpHw/Lrnq
         LrvPEMhCEOPTaFG3/Tct7hMLdGnGKEO/OvYgGIMPoE/qGMV+FKXBnTibJDNE+QF1nRau
         1HFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtGe1AGI7kALWt9MZUUKUVq0A4aC75PMcacL3qnwy/4pvOppcbC21Lmu2hc5hXmcx3ushMYwaGJ1nRmFuPy/mT@lists.infradead.org
X-Gm-Message-State: AOJu0YySaXipPGcG7qlmEt0nqGlP2AGGemcrIeql3TGMyDeLtgBoiZPP
	Q5xEjO0zLnzTFj3SeSgvNzNrZw+SGbWzMJp8AGwPfeGQNVQKdSN5ga4QZSbiYJetAGv3ywYROQ8
	kYQ3l06X/8zQMBIYi5g9jz6QjSM17rLpncHcwSTC6i9K5tIfea9YegD79fOHLEfAMvDyQhR3yR+
	wN
X-Gm-Gg: AY/fxX4gYlimBoK6r53MA9KAHydcPnBmOs3cfFH54vAXtJESqTdlpLr7SCnoXix79g9
	5U6TsBBIuuaBQRg8rI5qlghklq6vZhF5LGew26qkl+lwBBFpWoMiq/PtjrfRF+xCPjv1SFmOfXb
	+ASAUN/WOYjW013Qleg4Q+6sFmpybUiItTPvVn7tTZ9KnwD+q79nUwAoxh1qzgowf3BrHIw9TDd
	1L2IVpdHNNYoqEjZ1K+YfNwirSPu4Dffzg/g1hSGiIU0RnrMFX9nTAKG2fLaD4MqfA74Cynd8LO
	S9ouDNNcz00GJ6USgvyVzSBxg2EEDrRnSY9BfaeDwSQ0/SUknGeub1xMVa8T5bNyQM4llQGkMqZ
	Q/oZigf2PPSn1cWhneXMjNC6RuJmGW98AhXZJC7nr4v0TVIykxQVMa+M0
X-Received: by 2002:a05:620a:414c:b0:8bb:26db:e22f with SMTP id af79cd13be357-8c08fbb5432mr3197589085a.30.1766701679945;
        Thu, 25 Dec 2025 14:27:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkk34PfoZDZVXHOsdvaSoOtEJlSomrI6NhnO1ciZ/uaqISBnHAQBKZ+i37TxyEDRNXrTUZhA==
X-Received: by 2002:a05:620a:414c:b0:8bb:26db:e22f with SMTP id af79cd13be357-8c08fbb5432mr3197585085a.30.1766701679541;
        Thu, 25 Dec 2025 14:27:59 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f5fdasm1605628285a.35.2025.12.25.14.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 14:27:58 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <04708b57-7ffe-4a97-925f-926d577061a6@redhat.com>
Date: Thu, 25 Dec 2025 17:27:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/33] sched/isolation: Save boot defined domain flags
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
 <20251224134520.33231-6-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-6-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fk4ZOMlsZyKHOGQbqUCKbnZxYATf1oaxQ1QxEOfElyw_1766701680
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_222813_737745_9C74D8A7 
X-CRM114-Status: GOOD (  18.09  )
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

On 12/24/25 8:44 AM, Frederic Weisbecker wrote:
> HK_TYPE_DOMAIN will soon integrate not only boot defined isolcpus= CPUs
> but also cpuset isolated partitions.
>
> Housekeeping still needs a way to record what was initially passed
> to isolcpus= in order to keep these CPUs isolated after a cpuset
> isolated partition is modified or destroyed while containing some of
> them.
>
> Create a new HK_TYPE_DOMAIN_BOOT to keep track of those.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Reviewed-by: Phil Auld <pauld@redhat.com>
> ---
>   include/linux/sched/isolation.h | 4 ++++
>   kernel/sched/isolation.c        | 5 +++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> index d8501f4709b5..109a2149e21a 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -7,8 +7,12 @@
>   #include <linux/tick.h>
>   
>   enum hk_type {
> +	/* Revert of boot-time isolcpus= argument */
> +	HK_TYPE_DOMAIN_BOOT,
>   	HK_TYPE_DOMAIN,
> +	/* Revert of boot-time isolcpus=managed_irq argument */
>   	HK_TYPE_MANAGED_IRQ,
> +	/* Revert of boot-time nohz_full= or isolcpus=nohz arguments */
>   	HK_TYPE_KERNEL_NOISE,
>   	HK_TYPE_MAX,
>   

"Revert" is a verb. The term "Revert of" sound strange to me. I think 
using "Inverse of" will sound better.

Cheers,
Longman


