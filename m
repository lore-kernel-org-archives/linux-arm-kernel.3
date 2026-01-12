Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878BECF45C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gLOxIDyxhTvVzJuSwvSFZ4MlqhsCFk9OHFtuRb1ESk=; b=MlSu6M3MojGJu88mEpve2mXAA3
	3GDweXP37oDkZueKG64WI6Ke1bWlA+DPcO6/GL9TWvw/Hz5DRMKyqmUZt6jjby0hxEoOw/i+5eCxR
	MrVZkXyR3aatyZ659u1llLUPjjZ+HVp05eSaO4wJ/hf69chi2Kb2+cXZG68IKcUeRdAPRC8Fp+ixr
	MXyRWbV6/EDKJ0+DOai3TR5rHQlKsIsbXW7dM9kW3jSNJLdS1phIuULd3C5byw8Sl9WYBYJUIfF7H
	fJ6xPXnfIyFl0w+H+ZpRHqYu+KRgdfGXQe9cV+DVo7UypEp5w9PeeR9jG7AsqFVVOdbdyrUlds68h
	GtWjH6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMaF-00000005vjm-1e3o;
	Mon, 12 Jan 2026 18:24:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMaC-00000005vjN-13H2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 18:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768242242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gLOxIDyxhTvVzJuSwvSFZ4MlqhsCFk9OHFtuRb1ESk=;
	b=EQE/r0PC89suHFff2EemW9DKNsGaLlkjV9b1PL8JmB6u/Y8avHlVRuE+DgGSRR3NCMl2ch
	bJRqbbHPhdyDM7SEyHEAsmDACN2caUBX2S5iSn+0rpeU51FHHpq9XRSDdOFvPbm2r/AYJJ
	NcJq+bWk35F6plRNy/dL00dad9z2SzU=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-GvytjYTAOziOlUsPtiQlAQ-1; Mon, 12 Jan 2026 13:23:58 -0500
X-MC-Unique: GvytjYTAOziOlUsPtiQlAQ-1
X-Mimecast-MFC-AGG-ID: GvytjYTAOziOlUsPtiQlAQ_1768242237
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ec9a4e6cb0so5988227137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 10:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242237; x=1768847037;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gLOxIDyxhTvVzJuSwvSFZ4MlqhsCFk9OHFtuRb1ESk=;
        b=T043Npdeg1fqApLpLQRZzkIjICwTFOOJXmRnlb2CgNlZCLhdAxKByF6rz8RjuOhmsl
         Ulf/ELUWx/h6mOpsidF8YkcHjWDzi+mEslnR23c+RmPLuVbbG9YnD2Tc5lEtPJzb7at+
         3MIaaACvv6rRqQJ/lvYHi5CU8hkVqpjn9/+VDYo9NE8+L7sAKeW2ra6h5z7UQnC71pmQ
         l3qlOHJzGg8/qnbjsHQJCxKCCWywWAAP/De6IftzJ6HPs8I8JOEcMb4YSoyzdAgK62fQ
         1tbfVcNs+G2uHMsWJO/f3e+6h7F9+EjEkfIM9l/MRINuS7kR1jCMVeEeOE/Fgjwy15Vz
         dafg==
X-Forwarded-Encrypted: i=1; AJvYcCViuyU/vIHQVuv2F2LjiYeCIC7WeEk6TXc8ZW2+eXU76BdRzHvMgEzf/8oCGYrLJXu3M1rNh7/QbvoCNVbUg6T7@lists.infradead.org
X-Gm-Message-State: AOJu0YzneY/vD1kM49TVgGoawbDDonEaawsU3gnN8grFJ0BgWuSCcXVQ
	oCnS3LiEVef1SjniTPBKNeWjMPl/14WHSWpbKIeghvZ3JqrhMGJQ3zOdJXUkYDDXfsStCQQZ8Id
	Z3DgcZlnnaIiy9/mPuQOqcX7BtUUc4/+w0jyJEjatvdKDy2BwDWVzQxe0UUqX3R4mb6Qilkts5/
	Nd
X-Gm-Gg: AY/fxX59JVrZ7tLeW5QkX1eEyafH6is2xsXNfHcqDiyyOgEm/cHnjv9yXuqd489SUd+
	cBQOu/AvdIwdXRgL+06J/eB5xE36NgCAX4r39QWLmwlI5p44E9A4HBC0YtUJm7BHrzSdxHYp27g
	sIhENMgwfiWRWRr/9VxQk6I+tt6PGTy37BuCMvxi4/P8zWBmIGZYBLv+VOLeF0mMMug31Jtu+ig
	ivepR0wkxlOp+Cv22Gq/zsILY5z+QWovTV1q02HpeHfuIDfy+MlOqCw9hLf88p+jYlO0QQm4blS
	QnB4Wr+U3gdCIbu+kFuLW2iabEL0xCdSaWvYHbKcYx7llN+ju8/UVYFuGYd9HOEld5p6624yrbR
	x/5fF7pWJQpoDYcC7Qb1aNgfIL3GK5bfoEHlbBieLX/Zc6ovbg1u0NRXp
X-Received: by 2002:a05:6102:ccd:b0:5ef:b5fc:dd4c with SMTP id ada2fe7eead31-5efb5fceabcmr2465137137.7.1768242237192;
        Mon, 12 Jan 2026 10:23:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwmHNbjOkRHiOzASiFvy8qH079mvHRUgTgzybGWlZGH94huRhJ7zei/lWRFsGQLOin7Q4KDw==
X-Received: by 2002:a05:6102:ccd:b0:5ef:b5fc:dd4c with SMTP id ada2fe7eead31-5efb5fceabcmr2465086137.7.1768242235294;
        Mon, 12 Jan 2026 10:23:55 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ef15be79c6sm10965711137.12.2026.01.12.10.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 10:23:54 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <437ccd7a-e839-4b40-840c-7c40d22f8166@redhat.com>
Date: Mon, 12 Jan 2026 13:23:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33 v6] cpuset/isolation: Honour kthreads preferred
 affinity
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Phil Auld <pauld@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Michal Koutny <mkoutny@suse.com>,
 netdev@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 linux-block@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Eric Dumazet <edumazet@google.com>, Michal Hocko <mhocko@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>,
 Chen Ridong <chenridong@huawei.com>, cgroups@vger.kernel.org,
 linux-pci@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S . Miller" <davem@davemloft.net>, Vlastimil Babka <vbabka@suse.cz>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Simon Horman <horms@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Gabriele Monaco <gmonaco@redhat.com>, Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen Ridong <chenridong@huaweicloud.com>
References: <20260101221359.22298-1-frederic@kernel.org>
In-Reply-To: <20260101221359.22298-1-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aOzD75ghMDqRJY2PNi19qDnY4s3zmWq_IN-gPCupsn8_1768242237
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_102404_366328_2DE4EB7C 
X-CRM114-Status: GOOD (  18.97  )
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
> Hi,
>
> The kthread code was enhanced lately to provide an infrastructure which
> manages the preferred affinity of unbound kthreads (node or custom
> cpumask) against housekeeping constraints and CPU hotplug events.
>
> One crucial missing piece is cpuset: when an isolated partition is
> created, deleted, or its CPUs updated, all the unbound kthreads in the
> top cpuset are affine to _all_ the non-isolated CPUs, possibly breaking
> their preferred affinity along the way
>
> Solve this with performing the kthreads affinity update from cpuset to
> the kthreads consolidated relevant code instead so that preferred
> affinities are honoured.
>
> The dispatch of the new cpumasks to workqueues and kthreads is performed
> by housekeeping, as per the nice Tejun's suggestion.
>
> As a welcome side effect, HK_TYPE_DOMAIN then integrates both the set
> from isolcpus= and cpuset isolated partitions. Housekeeping cpumasks are
> now modifyable with specific synchronization. A big step toward making
> nohz_full= also mutable through cpuset in the future.
>
> Changes since v5:
>
> * Add more tags
>
> * Fix leaked destroy_work_on_stack() (Zhang Qiao, Waiman Long)
>
> * Comment schedule_drain_work() synchronization requirement (Tejun)
>
> * s/Revert of/Inverse of (Waiman Long)
>
> * Remove housekeeping_update() needless (for now) parameter (Chen Ridong)
>
> * Don't propagate housekeeping_update() failures beyond allocations (Waiman Long)
>
> * Whitespace cleanup (Waiman Long)
>
>
> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
> 	kthread/core-v6
>
> HEAD: 811e87ca8a0a1e54eb5f23e71896cb97436cccdc
>
> Happy new year,
> 	Frederic

I don't see any major issue with this v6 version. There may be some 
minor issues that can be cleaned up later. Now the issue is which tree 
should this series go to as it touches a number of different subsystems 
with different maintainers.

Cheers,
Longman


