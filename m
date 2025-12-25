Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BD5E7AD71
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ab+MnheIVRKoBcmzrgSbvk3S4ufWNXWYr9CVeGGgh3o=; b=HRh7AtD/ANwKW1g6rRAZK2e6+x
	mLzvJzsoakqiW8vEad8fJJbM6jsc+vWRhovKC4qLcWd7mElhQ2JZYjWynDqrpTtKrCtuMXxP73ZfJ
	XQWT3Tg8N/WBoYcNvf7XlxYcKjpqOysEafURE9Ih8XFGqKoZ9ro1Xab92ED0MFz3A4GmRZwfFJSEa
	CPbUfJQp5/4lgyx3R6USHkODlhoC9J61CQN9Yn4vHVYXpvOenLxQAgjmJ5qhUpbcvU/Cq9PCWb29e
	QOKU2A30IkYXES9fk/A6KVNTGaPTo8UA6ODh45pD+8y0yl9n6nMj5VLCViPXZtKArodua5IpTmoAO
	p6XERL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYtrY-00000000jKd-1FMs;
	Thu, 25 Dec 2025 22:31:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYtrU-00000000jKI-1QPj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 22:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766701870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ab+MnheIVRKoBcmzrgSbvk3S4ufWNXWYr9CVeGGgh3o=;
	b=FBLyrlJbYqMwWhUEkAnMt4GnM2/x3kr82jeNI1tdE1+oK2aoQGLETza9Gwk5MiRvWMs+r4
	RYKL872GtOYrkjYY9VUVWBa7MyoLNdA+p3zgEswZajn5M6C4iMAyHGqi9eWp3lceEcfxmi
	J3mb8UArmi7ct00zYtLlrWBpvolSNYQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-Ae3J49uSOAyORED7JtA-YA-1; Thu, 25 Dec 2025 17:31:08 -0500
X-MC-Unique: Ae3J49uSOAyORED7JtA-YA-1
X-Mimecast-MFC-AGG-ID: Ae3J49uSOAyORED7JtA-YA_1766701868
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a39993e5fso177456156d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 14:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766701868; x=1767306668;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ab+MnheIVRKoBcmzrgSbvk3S4ufWNXWYr9CVeGGgh3o=;
        b=Eek26InwWNFW48ezh+0fN1tMIKyx4B/jne45N8ptogClGTFvkuageaBbnk9lAZEhMQ
         0RlfHIbyym/+9oTwHnNHKgWbx11usybLdX6osSFfleUn9e9LFpcN8veFNKtmlyceV0wa
         90yplWUo1IkwSCdWIfah6isC7im/j9okIperEdahoGtCUC41ooqoiVugzIzy/JlwYz+K
         H/XqVEahH5J4aLc568VGTEPopQpCcpDlZZEhbw+3i/VqeSdo0bdSonjTsCaGp5vKcfSH
         /4PXC6f8gpi89wOmdwrltdoSqXxB/D0DdzsOXUh2BbcuPAm89YOW0ZOphzoAl5QCNnIm
         iTUA==
X-Forwarded-Encrypted: i=1; AJvYcCW3N07Tow4tqNyuLq/AUUVJ5wyQm9cZcPGa0+rB9CcNogcsT2OnJkPg/VHsOot6tMMK3kgs5E7y0/pOCVknQKW2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1mELD7Nzb1/wBqcIHdstlFneLNcSzdc2uVWH7kwgJYgtoZ64H
	tVhaemBVuOFx2MZENzeth3jHdBx2lsczY2/q4mbKTI8GGuKBubqoKpr9mWuBFqn/+37dzGkWQNQ
	19Q0qNfli9ZB4mu1IQL0fdXdIYPHunF9oAZRB1NUehrRBsu7TkcPKsgYozOFWgZkDWIVmnzAMxX
	98
X-Gm-Gg: AY/fxX7VcjWcXjqP2xiqBHrQSJ8rFP/5LZSxiNZQbKkgNiRXqhfA0PUkgTn2pW1ZYqo
	+SM3vFLZZH7D97Zrgv+xpgalqGfUrq5oJKeJGziVGPhhHnvIFgAdynn0sfnSy0eJzOHMf84UyvN
	cacv86H+nFPgoEFdgqT6yWsD+IQr/gzf0MhZzZfcqG+zWTB8zw+OQq8A7OGNXw+AAqqXRb8RA/v
	+6dQLy57itLmqZsPGVPCj8Ylv6TDDeRFZ3VmVWFF77KmStyswM1f5QWtYOkXm03C31ryjJAPIAF
	QJxAevEkZjnlinVXJ21OM9Pr0nGBodGfVWOYBNSXZjrNTlsg4ryIIViYMveSQp3xL70YRX9uobW
	DWq5Cla1K7zOf3lRTIFTeqKIX39QKKPazCsgS2ebhHiN01hTknEIbe27P
X-Received: by 2002:a05:622a:341:b0:4ee:24fc:be81 with SMTP id d75a77b69052e-4f4abd400d4mr330935701cf.36.1766701867879;
        Thu, 25 Dec 2025 14:31:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHthnytoNkit4+7wP+txqxK1npOqoQN/ulutuPL/gqwE7YXGTzVApXUK7yM3kp5hfoASbcRLg==
X-Received: by 2002:a05:622a:341:b0:4ee:24fc:be81 with SMTP id d75a77b69052e-4f4abd400d4mr330935421cf.36.1766701867385;
        Thu, 25 Dec 2025 14:31:07 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac65344bsm146923311cf.28.2025.12.25.14.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 14:31:06 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <006b00ab-c8b4-4a2d-aa38-94a41eadd238@redhat.com>
Date: Thu, 25 Dec 2025 17:31:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/33] cpuset: Convert boot_hk_cpus to use
 HK_TYPE_DOMAIN_BOOT
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
 <20251224134520.33231-7-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-7-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q7NYAn-V15J_omwBA4IdYyXdBN8SY8fJV4VsaTCiFlc_1766701868
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_143112_460925_FF072286 
X-CRM114-Status: GOOD (  20.28  )
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
> boot_hk_cpus is an ad-hoc copy of HK_TYPE_DOMAIN_BOOT. Remove it and use
> the official version.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> Reviewed-by: Phil Auld <pauld@redhat.com>
> Reviewed-by: Chen Ridong <chenridong@huawei.com>
> ---
>   kernel/cgroup/cpuset.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 6e6eb09b8db6..3afa72f8d579 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -88,12 +88,6 @@ static cpumask_var_t	isolated_cpus;
>    */
>   static bool isolated_cpus_updating;
>   
> -/*
> - * Housekeeping (HK_TYPE_DOMAIN) CPUs at boot
> - */
> -static cpumask_var_t	boot_hk_cpus;
> -static bool		have_boot_isolcpus;
> -
>   /*
>    * A flag to force sched domain rebuild at the end of an operation.
>    * It can be set in
> @@ -1453,15 +1447,16 @@ static bool isolated_cpus_can_update(struct cpumask *add_cpus,
>    * @new_cpus: cpu mask
>    * Return: true if there is conflict, false otherwise
>    *
> - * CPUs outside of boot_hk_cpus, if defined, can only be used in an
> + * CPUs outside of HK_TYPE_DOMAIN_BOOT, if defined, can only be used in an
>    * isolated partition.
>    */
>   static bool prstate_housekeeping_conflict(int prstate, struct cpumask *new_cpus)
>   {
> -	if (!have_boot_isolcpus)
> +	if (!housekeeping_enabled(HK_TYPE_DOMAIN_BOOT))
>   		return false;
>   
> -	if ((prstate != PRS_ISOLATED) && !cpumask_subset(new_cpus, boot_hk_cpus))
> +	if ((prstate != PRS_ISOLATED) &&
> +	    !cpumask_subset(new_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT)))
>   		return true;
>   
>   	return false;
> @@ -3892,12 +3887,9 @@ int __init cpuset_init(void)
>   
>   	BUG_ON(!alloc_cpumask_var(&cpus_attach, GFP_KERNEL));
>   
> -	have_boot_isolcpus = housekeeping_enabled(HK_TYPE_DOMAIN);
> -	if (have_boot_isolcpus) {
> -		BUG_ON(!alloc_cpumask_var(&boot_hk_cpus, GFP_KERNEL));
> -		cpumask_copy(boot_hk_cpus, housekeeping_cpumask(HK_TYPE_DOMAIN));
> -		cpumask_andnot(isolated_cpus, cpu_possible_mask, boot_hk_cpus);
> -	}
> +	if (housekeeping_enabled(HK_TYPE_DOMAIN_BOOT))
> +		cpumask_andnot(isolated_cpus, cpu_possible_mask,
> +			       housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT));
>   
>   	return 0;
>   }
Reviewed-by: Waiman Long <longman@redhat.com>


