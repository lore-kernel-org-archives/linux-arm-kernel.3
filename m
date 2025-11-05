Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7983CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kizs9xJ2GRG/rLXAdsJnM3tvDx/8JZcjC0BTEZZ5WY=; b=oEtdRpNsrb7Qtl54xwjLEFLYzc
	5NgRAQZLXl8noZSLQGwxGdOtMsFtEpi0eRwT7eG7jpZXMDljL30s10Riu8GlcDhNUK9iQ4C14pivs
	qhlHVfa/qYiQSbbMacSODwgpR/9cWJsPEdcvkcu9oQFGlSEDUkYRLZgAugR5vp4XpAK4a5PkeQzHB
	zzYTvxv0uPs6FpCa4H15XWIwDZTkaDXl40avYqZnMa7TSgUYqJhQnTHG2DHWrzYtI2jNYyy6SAUBj
	90yWKdHW79De6lRK8TRl+y0jAEIat6IyCkztOdWmT7NoCyZ06ieCF0G8tXIC7DOv7ewWJOJiTR8IV
	lAnJ7XhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjMS-0000000EJVY-3E91;
	Wed, 05 Nov 2025 19:40:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjMQ-0000000EJUe-1Wpe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 19:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762371601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7kizs9xJ2GRG/rLXAdsJnM3tvDx/8JZcjC0BTEZZ5WY=;
	b=gc74MPLv8MUIz3iYSOQ/t8qTqAV1Wvq+VblVnk0on6MNPQ/pybewi9gsQeSVsT7zlWDMJo
	EPkJdud5c4xBJINJb8FkMnjmD9wpq77zC6G8taf9UA0X6ZMW9wuJMyGHb+NVEFE+vBFaSl
	cKyw/pyOJcsa5LthOeYE4Jmuuc6M1cs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-U20MyOr9OMSFyz6gIMf_JQ-1; Wed, 05 Nov 2025 14:39:57 -0500
X-MC-Unique: U20MyOr9OMSFyz6gIMf_JQ-1
X-Mimecast-MFC-AGG-ID: U20MyOr9OMSFyz6gIMf_JQ_1762371597
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2217a9c60so65266285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 11:39:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762371597; x=1762976397;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kizs9xJ2GRG/rLXAdsJnM3tvDx/8JZcjC0BTEZZ5WY=;
        b=aAw0ZNgUpyknrM3cHbBLQDxvL6H0/MkrJdRfRsDIbaFa6UxWJvf6Lg9WP3AWi59Rq2
         jxCOBRGtggVRM4iPj6t8i7CBodKMILhgPRLCHzd3+3Sos5qKwEyknQ1rJLsnZhmZwzUN
         p2seTlHES4LBOCLV+z67nsi1kAqDUfWvBHGywaZt5N1WSuHOM5w36FsWcHitqduSOC9S
         11Sp8ks/O7+ybT1ovlE6eZXbFq091+b1uxnnUrETjrCT3aiiDcHn40hAOb8WjEQLPvSg
         xiRcStimbVGbhuWOdVsHPcFvvl0VxJ4eeCGQOLcAN5nVif3JzI3LZqf5ABk/aLZFnQmZ
         ODEg==
X-Forwarded-Encrypted: i=1; AJvYcCV1YHDz+VFGg3YOkijWnqq4wh7Ed5LWXhAZ+uubLirNAHAqdvyHV9Xx62a+pcSLNQws0YmmZL7JGb8gjUQFsJgY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw96J+fmbp8pdvuEXN3Gdq8mRafpxvjuyKt36rtI865JfNodPwF
	wRFLdMDR+2eOziby27S0A+saYy+j2vS0lthToECnKPDq/JaUowYKdH6taW9AnunVOKqPet7jehN
	BybKRMb2qap5vCvMzMrJX778JSxfKj4WJh+DxMEFkRU1EXegfkdadRfZanjDcZEuZzEHp1cXIRa
	6T
X-Gm-Gg: ASbGncu/biJdQBsC/M03nDcrFfD+2nU0yH2H/eUdGb+dpjZGtpvEbEqp/2MxnbV2VGe
	QIvaoT8jDJIx4c3xipoR48pstlxatdEUqIYppNh+b9y/qmP/ie0T9SMPXHm7hBWbsrHMDXpX72x
	q+ntpWSFV0oEZ1FPRq6fJ/9cQRSJ/Z3bJRJeYeUXplKb1ehREzGYObx2PqYZPFOA2l/LQikEG1C
	mOzVllgI5ymRY9TaHQRlz3VUEl0WqxQI/63qeFT5VYjcYxG59Y8SuAGO1+X9H+jo5zi6CVdd+mP
	kBPZKaACz7KAppQpkzRI/8j7ynl0acZxVKK2OhC93mzsKwV4ZifINUQcpJ4RWXs+3X4SP6pM6Gz
	4BJVmDNs9+BOTO1GaGBKpgSmj7lvPldrTRyHod0LD0kd9bA==
X-Received: by 2002:a05:620a:460f:b0:89f:7109:185f with SMTP id af79cd13be357-8b220af7c8dmr589559285a.31.1762371597215;
        Wed, 05 Nov 2025 11:39:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd9eT2YzuyaD6xKA1zXzyy0WWTMe4/Y4jwbmI24djGe/tYf+EHmXjHRZnQzj3cSXaGnWo3FQ==
X-Received: by 2002:a05:620a:460f:b0:89f:7109:185f with SMTP id af79cd13be357-8b220af7c8dmr589555485a.31.1762371596761;
        Wed, 05 Nov 2025 11:39:56 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355c2797sm30330485a.10.2025.11.05.11.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 11:39:55 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <74c2751a-4de6-49fb-b675-dc3c7f6e0bef@redhat.com>
Date: Wed, 5 Nov 2025 14:39:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
To: Frederic Weisbecker <frederic@kernel.org>, Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
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
 <ea2d3e0e-b1ee-4b58-a93a-b9d127258e75@redhat.com>
 <aQtxMYmwzfg2NW1O@localhost.localdomain>
In-Reply-To: <aQtxMYmwzfg2NW1O@localhost.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XG18ecLHb0y-iD_k-NMZ383XdQNR5TgESqDNMZfDXsI_1762371597
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_114002_484902_2DC42DD5 
X-CRM114-Status: GOOD (  17.99  )
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

On 11/5/25 10:45 AM, Frederic Weisbecker wrote:
>>> +	if (!trial)
>>> +		return -ENOMEM;
>>> +
>>> +	cpumask_andnot(trial, housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT), mask);
>>> +	if (!cpumask_intersects(trial, cpu_online_mask)) {
>>> +		kfree(trial);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (!housekeeping.flags)
>>> +		static_branch_enable(&housekeeping_overridden);
>>> +
>>> +	if (!(housekeeping.flags & BIT(type)))
>>> +		old = housekeeping_cpumask_dereference(type);
>>> +	else
>>> +		WRITE_ONCE(housekeeping.flags, housekeeping.flags | BIT(type));
>>> +	rcu_assign_pointer(housekeeping.cpumasks[type], trial);
>>> +
>>> +	synchronize_rcu();
>>> +
>>> +	kfree(old);
>> If "isolcpus" boot command line option is set, old can be a pointer to the
>> boot time memblock area which isn't a pointer that can be handled by the
>> slab allocator AFAIU. I don't know the exact consequence, but it may not be
>> good. One possible solution I can think of is to make HK_TYPE_DOMAIN and
>> HK_TYPE_DOMAIN_ROOT point to the same memblock pointer and don't pass the
>> old HK_TYPE_DOMAIN pointer to kfree() if it matches HK_TYPE_DOMAIN_BOOT one.
>> Alternatively, we can just set the HK_TYPE_DOMAIN_BOOT pointer at boot and
>> make HK_TYPE_DOMAIN falls back to HK_TYPE_DOMAIN_BOOT if not set.
> Have a look at housekeeping_init() which reallocates the memblock
> allocated memory with kmalloc to avoid these troubles.

Ah your previous patch of this series did that. I was thinking about the 
existing kernel code at the time. So you can ignore that comment.

Thanks,
Longman


