Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2201EE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gb98MWMdlEGo36TvwfyminxMDlqaYbAnnXftxbdSDi0=; b=3w0kKpoOEbH5WppHroVlr6lxpK
	9m0j74EwXVxSteO6CsT33xqaTt6y4MlmgOShINBZe8Rs8d4AsyLcOlw4JMwnm2HwqI89muhbf8kkg
	MMKzHdAMPn8h7sR9qbD7UgQYSli57LEoe6+e2wh7ZMEIa1tzorX/LDJk9YVz/LoVYt9TcW5YKnsb1
	KH5KzSzi23xxUCAOUwPJmfV3gR/wxsnMWdhJo0k3f7b6tmYyLArHwwbfK08Ma1O7KoKja+mNxeqlK
	wPLLyemPdk3+E0m34prdCBrNEEo9Fi7cC3TnOBSSzTxiWzB3yV02kWvYCBf2BAlf5ejQlkGOGYXsJ
	cXXsYBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZG7P-00000001VpM-3FjP;
	Fri, 26 Dec 2025 22:17:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZG7L-00000001Vou-3g8J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766787421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb98MWMdlEGo36TvwfyminxMDlqaYbAnnXftxbdSDi0=;
	b=d0pJk+UBil7d0TNuXgVSAFqSsz1UkHMD+fhnWvxd2VU79CI/VKTpCKYpMJH7xiQIxokCt4
	Xq5M636MDoPCsC6InRJb/TvcbKzvuZgdCgyBjddreTDCZ9A/Q8SA3mcw3xbn0lKhC1vf8X
	wr7P3l0c7OCIGk2JfW3LtoyTLBDpJAY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-m8mmdzHFNP-m4FxbJuI0aQ-1; Fri, 26 Dec 2025 17:16:59 -0500
X-MC-Unique: m8mmdzHFNP-m4FxbJuI0aQ-1
X-Mimecast-MFC-AGG-ID: m8mmdzHFNP-m4FxbJuI0aQ_1766787419
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1c57bcso275436231cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766787419; x=1767392219;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gb98MWMdlEGo36TvwfyminxMDlqaYbAnnXftxbdSDi0=;
        b=fWle30xkDSram+I7nMNGO4elBrtVwGsIHzeOad7bs+NUtQCotKf3UP1NsgS8i4pRKz
         iXZ+SKBG0yhknM+/XiHnjfTnV2j76OXGm4uhdLfZbhTfFMHBdjyC2Lo+NuRF6g0np3o0
         vppcPCHVVRX2xPrK/MzvfjVkUMuQSlok/Hv4EgNIci1z9adt8nnP4p9sbUQCifYDmcrf
         FKNg99asUy1HNMl2wLZgswNsH80m+XzpRgLKRyCpwW5u5y25R5RxuF4wt0Uj+6rOy48N
         gLpaAH21rJpg5CKAGc8UfcmV9yFgT7BG8R/raEtDqK+MvmGpbvYElpgpXT3y7B1Xcgnc
         YXSg==
X-Forwarded-Encrypted: i=1; AJvYcCUtfquhksE694cOzH3ENL4j3BZZ9aKBLtgzv4oRbW1NR9//VDU2J5hXk5VIfAR8UK6fVm9uNVvnyCnp6NquggEP@lists.infradead.org
X-Gm-Message-State: AOJu0YwpLNCAPjhDXG2u28uEvvgfyNVutLGCKMHXQtrqqQiZbdp8YpnE
	UAeUBYr9GXdm3lcXrCI7e5kfMYJREcyyKGLEYhEeJFKFUhCGsUyKiveuLqdO+nJ1dOZF0xmXJyY
	C0uKdTLkf4L9SRbpSnPIoXiXoGmSYVu12bSZyj1zyfvLg7ZJq5ofU/LkJZN5rGvg+eF5ZFiGcrw
	iq
X-Gm-Gg: AY/fxX4WYQf0hpeJWz5Gwfvv451UtxRx4qns85cbK1fcJi/+xNvjKJF/Fxj07gN6+E1
	JHSQhbZKf2jUlQsxxgV304Z+DqZeW0AAoVasAtYtHNfWCh51rE3wpkt7y13JqkrtUxg7WbFOgei
	xWpexfSKMpr6mzVuEtbp/3Lbs1RE/1cgh0zcTpr6JzhYJ15GF2Fk+Q5fLh3f1AUbQJgSicAyQVN
	ih8Ft7CdwookfQVs8Wtv5cKX3eNr1x5k0ytY30ja8v1okrpkstwdrLX4GPdR/hG1oXLx5uG4CCl
	ry2CrHaBbvQoagtr3JNEgo8ADX4ERCBRmvZbOrl31PIldHiQmaNoifZR1QCavG1BPUsI/J+hC+/
	S7jnxDYLDz6Cw8OywD1DpsXLaodbgC4JMEDQLl2OwFoqXHYvlpQOfjZQk
X-Received: by 2002:a05:622a:cc:b0:4f0:22df:9afe with SMTP id d75a77b69052e-4f4abd801f1mr367336441cf.51.1766787419319;
        Fri, 26 Dec 2025 14:16:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRvuLHSyqUpCT4r+1J8I9GjzOXah9qpvn8vbYEiTnx2y0sMdtY9oMwdnxWWZ/KZalKRQ1OSQ==
X-Received: by 2002:a05:622a:cc:b0:4f0:22df:9afe with SMTP id d75a77b69052e-4f4abd801f1mr367336221cf.51.1766787418961;
        Fri, 26 Dec 2025 14:16:58 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac54adb9sm164334711cf.10.2025.12.26.14.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 14:16:58 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <46a613e8-cf5b-4fbc-9299-48ab1a6f347b@redhat.com>
Date: Fri, 26 Dec 2025 17:16:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/33] kthread: Rely on HK_TYPE_DOMAIN for preferred
 affinity management
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
 <20251224134520.33231-28-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-28-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dG2G30YTN86cEZVJVrtm8eYkXCdc_BWEqP1ldN1ED_8_1766787419
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_141704_002875_F8EC3A24 
X-CRM114-Status: GOOD (  17.33  )
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
> Unbound kthreads want to run neither on nohz_full CPUs nor on domain
> isolated CPUs. And since nohz_full implies domain isolation, checking
> the latter is enough to verify both.
>
> Therefore exclude kthreads from domain isolation.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   kernel/kthread.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 85ccf5bb17c9..968fa5868d21 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -362,18 +362,20 @@ static void kthread_fetch_affinity(struct kthread *kthread, struct cpumask *cpum
>   {
>   	const struct cpumask *pref;
>   
> +	guard(rcu)();
> +
>   	if (kthread->preferred_affinity) {
>   		pref = kthread->preferred_affinity;
>   	} else {
>   		if (kthread->node == NUMA_NO_NODE)
> -			pref = housekeeping_cpumask(HK_TYPE_KTHREAD);
> +			pref = housekeeping_cpumask(HK_TYPE_DOMAIN);
>   		else
>   			pref = cpumask_of_node(kthread->node);
>   	}
>   
> -	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_KTHREAD));
> +	cpumask_and(cpumask, pref, housekeeping_cpumask(HK_TYPE_DOMAIN));
>   	if (cpumask_empty(cpumask))
> -		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_KTHREAD));
> +		cpumask_copy(cpumask, housekeeping_cpumask(HK_TYPE_DOMAIN));
>   }
>   
>   static void kthread_affine_node(void)
Reviewed-by: Waiman Long <longman@redhat.com>


