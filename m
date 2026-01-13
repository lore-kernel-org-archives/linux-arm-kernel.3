Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912FFCF45DD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 01:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ipl04u3803c/IO8SDz5fqTBlvGqq/KbVl3bI4vEOEvs=; b=h0EbDjD74gt2T0ph4nI3F95LgM
	vSFUlxHyf2gnZcavElESmwNumfvHAYQv1pHNFT9fZvVdjuL4bDltuZZjtHWSn6iUai2U5G8ISxb6C
	09zYc55dgnDOgwOXUvFOzQ5eQ/lH5fD4yN9wx7V2f6SsyM8Kd5erZgixP1ByFzTEK4+PMi5sTvsVa
	834rvSzScgtBLIkqCP1eKh0L1K5tNfoCrZyJZQdS5r3Ug1AMyibeYkPAIt2/gwwiCo6Qyxrmu4M1D
	id85LhjeszCcv2bLw5Q1g8/LSFBfjpJjlebQfKVR4QO7SUwe2RM6MnqF/av/7l5z/mhGg4lu3HQq7
	4KPGVbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTXM-00000006OnO-0xMF;
	Tue, 13 Jan 2026 01:49:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfTXI-00000006On3-2JXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 01:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768268970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ipl04u3803c/IO8SDz5fqTBlvGqq/KbVl3bI4vEOEvs=;
	b=AfR8I3XSgXC3QDakTMXcD4SieZrqZDbSE5OWZCrTbNy9+zdeZne5jRgFESmBX1GXKIGGAO
	N8p/kKhFA2oezh3XOR0GcpI+01vMPqQEQZYv4bGD5rczfSwT56Yb6gJT+cC4VfrQ6swyl4
	FeikNQ4ZLylSiXRyxRSNrTt3pPDZU8w=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-NRd1-Xu4MKibfQH3wfjf4Q-1; Mon, 12 Jan 2026 20:49:28 -0500
X-MC-Unique: NRd1-Xu4MKibfQH3wfjf4Q-1
X-Mimecast-MFC-AGG-ID: NRd1-Xu4MKibfQH3wfjf4Q_1768268968
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-93f5ac349ecso8869046241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 17:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268968; x=1768873768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ipl04u3803c/IO8SDz5fqTBlvGqq/KbVl3bI4vEOEvs=;
        b=SE20aPaNuOnll5A4VFQ0ZM6kV2+4hYmDcdxh1B7Nq8+4cFH2TpNz0Lh7E7189UClKv
         Qm5PqtjP1PkBt1nFPcie5xrYIlLiC7gkMWxIwhWySvFY5DpQbN1UJ2fg6/ruiQAxGpVK
         Tm648g4teaItsHukbLtG9yQI2kuhxNr4SC8bdm52btiOeIH2w9hM/R3lM/dD+S+xUGNH
         Elwv9DHg6UIYjh+/HA+b05E/pWunW+hLRw5jne1L0nXagAhbdiq7ia25uOEaWrOBC+Jz
         GK/FI/6e910d9bVSplutKgk3GmTCsXNoZPLuh1NCnramZjD4/fMqsNnUNhgIZNhtDBAu
         N/uA==
X-Forwarded-Encrypted: i=1; AJvYcCXEFFRjkd73rUIUt18ftkI+btyftxe1Aq5h0YLlZe44oByiY6Tw4TsitiT1XbNM5JOyZcKXRh3tTqN6q3OoKrUp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/zHl1N0dThWRwkyb9guhY0OLEUZZdVtiTHa40G3dHmUmypI7u
	K+oEfN5pEcoqiLyYWS+uNyfSA+mw45GoL3WIbSB2auOtccItmTkiarHQyTyQXia4JNZp7grk9N6
	lYMjCsl67SKs+egdoxl2Ualhb8nmUSAkoQ3c5RJBXJiFOu1sl9cn2P/fSSQDeAuiqyidzSgW1GA
	it
X-Gm-Gg: AY/fxX6fSPQp/U0m3sffvw0d0dXk3W4KJ8yn5OkrkGzfVUJycb52vhw//8Xh3j3032G
	fIeZMjughNaszP9UI2E4bq2XR6Sl5ACAvRQoVfWti7Cny4biBWkRZVTlv/Due+6C5kl9J5i5uYn
	/zf5gv+8S4nCQ+kLmRkcbU31gP5hhDt/11Ch6eWiCVqgUyVyWDgX2ciBwOL210weCHAyDg7xiZB
	18UsVp5XefIdrG870jsJ8trsJ5NscSprTEGOqYjsVrRzVwS9G71VIjVcS+2RpKOY7JAu5jrM2zG
	561u9/1W/vMR495tSrbEauzRkDauATGMd30u0jyKBkeQ1vLSRhSaPC9JjNF+VHqjndAEy0cNWfH
	kH1aIak6HhtW9UUkm4eunlI41zlJUQ2OvvOac6RaQDrJZTJXxkg+uyAwc
X-Received: by 2002:a05:6122:4b89:b0:55b:305b:4e38 with SMTP id 71dfb90a1353d-5634800729cmr7402443e0c.19.1768268967528;
        Mon, 12 Jan 2026 17:49:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFK3nQoFNSvzu3p3PMs7jwaVTVycoM8jcu4b27g95LRRVLuycfC94MCTb+8aGEaS+r94nXQbg==
X-Received: by 2002:a05:6122:4b89:b0:55b:305b:4e38 with SMTP id 71dfb90a1353d-5634800729cmr7402411e0c.19.1768268967043;
        Mon, 12 Jan 2026 17:49:27 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5635bd72c7esm13437373e0c.12.2026.01.12.17.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 17:49:26 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2857c203-96e5-4bf9-b19c-7a80b009cce2@redhat.com>
Date: Mon, 12 Jan 2026 20:49:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33 v6] cpuset/isolation: Honour kthreads preferred
 affinity
To: Frederic Weisbecker <frederic@kernel.org>, Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 Phil Auld <pauld@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
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
 <437ccd7a-e839-4b40-840c-7c40d22f8166@redhat.com>
 <aWVxJVQYEWQiyO8Q@pavilion.home>
In-Reply-To: <aWVxJVQYEWQiyO8Q@pavilion.home>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 08B7Y9jGsgYcQb0saXY__HNVwubJ9b0lyo-zXWl1-tA_1768268968
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_174932_681314_66EE438C 
X-CRM114-Status: GOOD (  21.01  )
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

On 1/12/26 5:09 PM, Frederic Weisbecker wrote:
> Le Mon, Jan 12, 2026 at 01:23:40PM -0500, Waiman Long a écrit :
>> On 1/1/26 5:13 PM, Frederic Weisbecker wrote:
>>> Hi,
>>>
>>> The kthread code was enhanced lately to provide an infrastructure which
>>> manages the preferred affinity of unbound kthreads (node or custom
>>> cpumask) against housekeeping constraints and CPU hotplug events.
>>>
>>> One crucial missing piece is cpuset: when an isolated partition is
>>> created, deleted, or its CPUs updated, all the unbound kthreads in the
>>> top cpuset are affine to _all_ the non-isolated CPUs, possibly breaking
>>> their preferred affinity along the way
>>>
>>> Solve this with performing the kthreads affinity update from cpuset to
>>> the kthreads consolidated relevant code instead so that preferred
>>> affinities are honoured.
>>>
>>> The dispatch of the new cpumasks to workqueues and kthreads is performed
>>> by housekeeping, as per the nice Tejun's suggestion.
>>>
>>> As a welcome side effect, HK_TYPE_DOMAIN then integrates both the set
>>> from isolcpus= and cpuset isolated partitions. Housekeeping cpumasks are
>>> now modifyable with specific synchronization. A big step toward making
>>> nohz_full= also mutable through cpuset in the future.
>>>
>>> Changes since v5:
>>>
>>> * Add more tags
>>>
>>> * Fix leaked destroy_work_on_stack() (Zhang Qiao, Waiman Long)
>>>
>>> * Comment schedule_drain_work() synchronization requirement (Tejun)
>>>
>>> * s/Revert of/Inverse of (Waiman Long)
>>>
>>> * Remove housekeeping_update() needless (for now) parameter (Chen Ridong)
>>>
>>> * Don't propagate housekeeping_update() failures beyond allocations (Waiman Long)
>>>
>>> * Whitespace cleanup (Waiman Long)
>>>
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
>>> 	kthread/core-v6
>>>
>>> HEAD: 811e87ca8a0a1e54eb5f23e71896cb97436cccdc
>>>
>>> Happy new year,
>>> 	Frederic
>> I don't see any major issue with this v6 version. There may be some minor
>> issues that can be cleaned up later. Now the issue is which tree should this
>> series go to as it touches a number of different subsystems with different
>> maintainers.
> It indeed crosses many subsystems. I would be fine if anybody takes it but
> nobody volunteered so far.
>
> The main purpose is to fix kthreads affinity (HK_TYPE_DOMAIN handling cpuset is
> a bonus). And since I made the pull request myself to Linus when I introduced
> kthreads managed affinity, I guess I could reiterate with this patchset. I
> already pushed it to linux-next.
>
> But if anybody wants to pull that to another tree, that's fine, just tell me
> so that we synchronize to avoid duplication on linux-next.
>
> Thanks.

Good to know as I am wondering where it will go. So you are going to 
push that directly to Linus.

Cheers,
Longman


