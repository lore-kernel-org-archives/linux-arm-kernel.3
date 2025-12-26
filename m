Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6EAE8FDBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 23:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPVYyOhmWYyUzd26KqEqEx9SiJ2wqcstK13CbukMaus=; b=RHqQ+5TcyG1TATx3RDtXjoS1TG
	YU9UYAFwv7bwej5F8cr6WMX5lAhwnpiX40j8U09gGbajHbI5e6IDqynuHFNPjcGRANL0tXceAuXLz
	YGWmSMxhE5++yt+geo3zn9yWe7XkvsWjOTTPp3YqIReDL6QQ5g9Lu2uFiG44B2bGWN1lac9kBpUZ1
	tZcKjJAk8t9wJyFQmP3HTS4X7ym/din4yzvtBhCMPN6BMqpLfpb/5hjzOeEoFn7aPx1zPXR4x09mP
	6BrCrb+/49NfWe/oR7R/nMraCtK+7BKRBoQk1bQQpEzSaB/9e9d2e7o5ldH8039Pefsv8ZLgRFzqu
	XFv2xwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGvb-00000001YAd-2UYD;
	Fri, 26 Dec 2025 23:08:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGvY-00000001Y9g-19C2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 23:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766790533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hPVYyOhmWYyUzd26KqEqEx9SiJ2wqcstK13CbukMaus=;
	b=N5ULQChj3waHbp5JqOilPGouwqSvFnriOeVsIcIceHVuRNFf+tQ3+oRsuiOqgBXlJ//H94
	vAKxXsupdXBy363SM/u6u7X9NWKbGjvZozmeJjg3GksuMzqVFkFx130Oz0j/ViDgIlTSdx
	PNe3kVV9U2QuHVm3T1ndtjdTyNW8Dqw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-TLW-3vI8MOa6wfxLMKI0Gg-1; Fri, 26 Dec 2025 18:08:52 -0500
X-MC-Unique: TLW-3vI8MOa6wfxLMKI0Gg-1
X-Mimecast-MFC-AGG-ID: TLW-3vI8MOa6wfxLMKI0Gg_1766790532
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a25a341ebso179394746d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 15:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766790532; x=1767395332;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPVYyOhmWYyUzd26KqEqEx9SiJ2wqcstK13CbukMaus=;
        b=igcgQzZL5w/xTmqNmD0I6YdnJkrBeorwtYFc9z6tRHchScyCRodcfNX20vxvK1TvaQ
         FUH4QkLNrM21c3nslly50Dff4P/KfJ4TihPaixBA9CKG8s/TBHHy1LV/TfFQyrLCtEpn
         cyJJrkTyp8PtjNFj3Z5uNrvF+bjSxOsVringpg60afsRfNaOy0ZCRteOZXIKMmvUn77Z
         /hI0/xaimf4/KS+Bbx7eH0Iy1mpDyFPfPGZh/uXQqgT2RSTEvyzPu+GPGs2+znd1LAwv
         y6rNuiQJdCDu4YCq6jc3ohdloTTRXXBU872l3m9fOlPZb3jLPivTv76lrvnzFI/1hQJZ
         H3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUb+3R9UH3ejrbdaCqFNFXs17hyepU++VTbaauyBkm+BouxZ2W8kWuG4zA7KCSOgKScgiNyg7u/eUd1r44dbDp8@lists.infradead.org
X-Gm-Message-State: AOJu0YwDlIjsDBaKukMGBOFxQyD/g3FjQJrVHOlHalUzErYIsEP5hVc7
	9ICnBqGukmF56mEEi4P4KFxihQ13spdKZurjSzfqEM5KInc5sItd556HyK4MsPgIoOyGTLojJ//
	8R9dUbbCwDoPsryt2agk9CMJgSq0r1GPk7JtHy4NLHbwOKqfc5hBK0jh5N3R1makpW4pV9uI4JU
	Ax
X-Gm-Gg: AY/fxX4G3GW8F9bKIjG67oBptaHZ9DHmm/S1w1faWEC15Q2cg7UMsEcpYE6lSmAhoky
	Jv5DO8tb4jhM/NwZ1l+QlzgIqRDE/tFumhURdVXs4zj7rdjlPRXnfxS3EGUQ7y7lkNdBBGOhe4r
	AOeBNR61z+6bgWLkMjcNel+4dQbfhqM5Y1Ou9FqTOCQCGhUtBJbYzBfrJWglUNo9EVRNYzotV1y
	xtn1ZN3XeUWCx52DAFVaXbcH7UswvzV+uk0zw2dxPtUt4ep56FWLwQiPJtJOI80NM5xHTWLcpN/
	Qnpp+joL06bht2zeRm4YRaatgEXLFnxD+fVeciuq4csgI9P09Q3grKc1PiZEeACC766nx12zi+B
	Q3EbdzbAIKC1BXLGwlNvqPecEgkpSN2qLv4q3Re9hqrS/J96fqur8Xzev
X-Received: by 2002:a05:6214:48b:b0:890:e31:9685 with SMTP id 6a1803df08f44-8900e319a28mr37823546d6.69.1766790532036;
        Fri, 26 Dec 2025 15:08:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpv55vF+vDJeT6imxDEvVCM6zgRYx4B3T4/k2S1vjNooJ5kJOtFWemCi2nC+rcnjO9pXNW8Q==
X-Received: by 2002:a05:6214:48b:b0:890:e31:9685 with SMTP id 6a1803df08f44-8900e319a28mr37823076d6.69.1766790531561;
        Fri, 26 Dec 2025 15:08:51 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dc1esm173664886d6.39.2025.12.26.15.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 15:08:50 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2f892ef9-1965-486d-beab-eacf0b6b0386@redhat.com>
Date: Fri, 26 Dec 2025 18:08:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/33] sched: Switch the fallback task allowed cpumask to
 HK_TYPE_DOMAIN
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
 <20251224134520.33231-29-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-29-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fthVGc4W_eq0Qe61D_UOhdOXH4P4nAjJcRtAHKSz26k_1766790532
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_150856_410156_52472E28 
X-CRM114-Status: GOOD (  15.66  )
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
> Tasks that have all their allowed CPUs offline don't want their affinity
> to fallback on either nohz_full CPUs or on domain isolated CPUs. And
> since nohz_full implies domain isolation, checking the latter is enough
> to verify both.
>
> Therefore exclude domain isolation from fallback task affinity.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/mmu_context.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/mmu_context.h b/include/linux/mmu_context.h
> index ac01dc4eb2ce..ed3dd0f3fe19 100644
> --- a/include/linux/mmu_context.h
> +++ b/include/linux/mmu_context.h
> @@ -24,7 +24,7 @@ static inline void leave_mm(void) { }
>   #ifndef task_cpu_possible_mask
>   # define task_cpu_possible_mask(p)	cpu_possible_mask
>   # define task_cpu_possible(cpu, p)	true
> -# define task_cpu_fallback_mask(p)	housekeeping_cpumask(HK_TYPE_TICK)
> +# define task_cpu_fallback_mask(p)	housekeeping_cpumask(HK_TYPE_DOMAIN)
>   #else
>   # define task_cpu_possible(cpu, p)	cpumask_test_cpu((cpu), task_cpu_possible_mask(p))
>   #endif
Acked-by: Waiman Long <longman@redhat.com>


