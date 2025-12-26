Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D02E8FDB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TeXICaWTl/KfVZ8H31EGm2TJnHW3xapz5vNb0Sw/RM=; b=oOWw9macPR3ihi0/2gOoN3i8ty
	G5uLoHvBcNf7IfmKqc9psJMzsH/vz4W446pjLB89NcCq3K1phidJyCu4F53n08mocKhz9mMWeObEw
	LohSw8X6zXn/r0sMxJIzJwF3Ful12xin2T831V9dJTeizxrRfL9K/28Fi8km8mdTM0KAlDtlOqWXl
	HDd6z/WMKKrTK0mPNtCBf3B1vL4KeHqXWo9grD6EOdZw0FO6UxCJ8ckFZcRkJszX0QquQO70CBo5s
	oLw4K/hRmybybXbW+tizTueWrl6ob45ElgjRXWf088hEIIvpSF5V/XOheisXgBSlwzmZwneXt/yWD
	BUscMu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZEge-00000001SJ4-0ky8;
	Fri, 26 Dec 2025 20:45:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZEgb-00000001SIg-1pKk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 20:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766781920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3TeXICaWTl/KfVZ8H31EGm2TJnHW3xapz5vNb0Sw/RM=;
	b=U8euMJKGQtFlOA15dlVWuSnGT5RdzrnTqSNqC9+jZTeyfo8Q19ruZL2jguLvglZ8IJDCcC
	iMS0glWu5ThsSOngS8zzDcMA37p+KFwWjaDQGcuSYK8k9SytA8gLhxJYdqduoEGwgemyLg
	PXfBRiSo9KhzxLpNeSn+x7EUYpSPp9c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-dbfQHfj4OVWWQNMNHSC1vg-1; Fri, 26 Dec 2025 15:45:18 -0500
X-MC-Unique: dbfQHfj4OVWWQNMNHSC1vg-1
X-Mimecast-MFC-AGG-ID: dbfQHfj4OVWWQNMNHSC1vg_1766781918
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb3388703dso2674147985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 12:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766781918; x=1767386718;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3TeXICaWTl/KfVZ8H31EGm2TJnHW3xapz5vNb0Sw/RM=;
        b=A5TQRtFb2S51ScI1T+tkc3rvQEMTHfrRDmYVx7VDfNVgpiB5SXFWGvlnBUEAlj1SG9
         Os85DyLl6CQpBBM6oGPYOp7oN3MSrd9yfP5uNIV6s8nIqOoArM4tXqg9pLB8uQHfp5kK
         5aEcNnR93cMBp1Es7HyQtbBn3FSye6+W96zGzWqvZwFaBvp6kTtnKf0FYFZuijJYl2N6
         1jGPyF68BZhCC5l7eFGrx4QdRvkQEHpbJvzs5PeTaaMz4kLtZgZUS5wxVQuidsc++NOE
         WtoPAnty36UyVVnSvU72Hkn3Eh3uHAEyCwKpbEo4qbaKp7TJZXes7XmiRQEx/Edbu2Hp
         auMA==
X-Forwarded-Encrypted: i=1; AJvYcCXr3SfuN9dL9yjQ4g5A/hpaadp/0lNAYyIZ7r3nplKebEfgwymzMS1oofKheG7WP6dtWPCU2O+C0Gr6DRXbLlMn@lists.infradead.org
X-Gm-Message-State: AOJu0YzaXDh8CgJkUP11TwguYZ3trQgDyubQ+e4+huIcWNGewIThP54Z
	Z453fl8j/KbTLwSx5xMX4GE9q1a2WWTi4/DMNUWcGoPfLn41pxclNaqqF8UvLItxcqg0F3KzITT
	m81Egtffz97BY2zC3FQ5aZUU/XAGhkKFuQp7Hdz75+5w4ryB/xJWkibo0DWjPKZt8sGVQiagi+2
	BW
X-Gm-Gg: AY/fxX51H1DvP915uW92LEVu5V5fRRD9OPrKCCzg8G4RFr3u05sVdvjh42OZTZ2IBNg
	whuBFBOaj3zz+LGSqXob2OXWQIrRDs9ZeZ29A+udH+JjEwWty1IVDAiQeA1zdfIHlsQoRNwSRmy
	68d2EEW8vjrZeI6R3PKArCRQAWjdtCugRfb2PsxPtLo49ottAmu5zufQWZm3ar87vQvYRHmyyA8
	8TcayRT+kNBHIyg/gZIfp/U6Rz92bR5xKrIQO49WBO6jXLV2poJ/DDz1wXTn0s3mwGUhNCrpHwP
	EEO8bdKb3+TiYjNJBTuSpUQID9m2hmCJhVHqEDoAmspTTqyjxeFQaewSc7geZuIJvx+U17oP0S8
	te5RE/Y+mdVmcivHQpFs6hdZXTpnNppgHWY+2ecHZWhe7p6cQ4X7vEftD
X-Received: by 2002:a05:620a:29c5:b0:8b2:dec7:d756 with SMTP id af79cd13be357-8c08fab88a2mr3620498985a.66.1766781918217;
        Fri, 26 Dec 2025 12:45:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXv60plEpPy2fU+PATnpKAA1Y80YGBXC1cy+B1fIWSmCaoTRFPW7/kxK6mjum3QMoJNZ6o1Q==
X-Received: by 2002:a05:620a:29c5:b0:8b2:dec7:d756 with SMTP id af79cd13be357-8c08fab88a2mr3620496685a.66.1766781917751;
        Fri, 26 Dec 2025 12:45:17 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09689153asm1727228085a.17.2025.12.26.12.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 12:45:17 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8282d85f-37b6-4f39-a70a-de5e6c77fb0b@redhat.com>
Date: Fri, 26 Dec 2025 15:45:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/33] timers/migration: Remove superfluous cpuset
 isolation test
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
 <20251224134520.33231-21-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-21-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6hF9JMcVwBItHbJm4mlfxS3lz4T3XfrfG59yTKL1MPY_1766781918
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_124521_605295_B28DB474 
X-CRM114-Status: GOOD (  15.90  )
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
> Cpuset isolated partitions are now included in HK_TYPE_DOMAIN. Testing
> if a CPU is part of an isolated partition alone is now useless.
>
> Remove the superflous test.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   kernel/time/timer_migration.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
> index 3879575a4975..6da9cd562b20 100644
> --- a/kernel/time/timer_migration.c
> +++ b/kernel/time/timer_migration.c
> @@ -466,9 +466,8 @@ static inline bool tmigr_is_isolated(int cpu)
>   {
>   	if (!static_branch_unlikely(&tmigr_exclude_isolated))
>   		return false;
> -	return (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
> -		cpuset_cpu_is_isolated(cpu)) &&
> -	       housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE);
> +	return (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN) &&
> +		housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE));
>   }
>   
>   /*
Reviewed-by: Waiman Long <longman@redhat.com>


