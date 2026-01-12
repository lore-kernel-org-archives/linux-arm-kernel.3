Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB60CF45AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niuwlukY4G5Spngj6ahATQFt383vhuD9uikDSg5CgGU=; b=h7j1n6krJZ+Uq6sevq/5Q3p/vQ
	sBfTZEDhV+W/HseTH2+lPPxB96H6xmIYEtS4eABGNCYqIUoYUKGCsjdRQpJnt3GPOM5nQKneBu9TM
	MTqObJACmkMXfuwCyKdZpDy7w81hobjOaaz5e0FJjYeTmPyL/nQVTzdGxVp50FmIudz3+ZGX6F+eE
	I/qV3MpcbiglngtRKJZ7l4KxN5tYHpsUWqWsTLHyfQB1CfSaTGBt4rDRWk3cJ4ALzhAuhZfwX9Upk
	801liO3llV2TrY8h7RafU6duh7QFMnWrziAdu0PURd72iicPtuzS8L4tkCpc89tjpP64bJMX0JqDt
	Mmo0WvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLV8-00000005q4m-1Wxf;
	Mon, 12 Jan 2026 17:14:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLV4-00000005q3g-3wQl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768238081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=niuwlukY4G5Spngj6ahATQFt383vhuD9uikDSg5CgGU=;
	b=PEbdwa2nxu6dn2AM9SklIQjYnPcMEqjqKr83wTGHCUhEyTCxu4BMSMvbQg8RxCKy4dgMJM
	VsrTHWcjDMS1/9+GLhwwzZ5BfN+D+sKKDaCPxAHqZU+NMblZ+02cCTIbRJpj8KRxvhWP+S
	wZfpPIAURY8eLHfiqmGeSEMyqy161Wk=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-rHNd1O1YMJyb4DpbWX2SBg-1; Mon, 12 Jan 2026 12:14:38 -0500
X-MC-Unique: rHNd1O1YMJyb4DpbWX2SBg-1
X-Mimecast-MFC-AGG-ID: rHNd1O1YMJyb4DpbWX2SBg_1768238078
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5634dbbc1a2so4761289e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768238077; x=1768842877;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niuwlukY4G5Spngj6ahATQFt383vhuD9uikDSg5CgGU=;
        b=uY3jFARNvEKQZMerAoiKpg1lrWejwvu5q64ogIJTAJAHoBcp+g0rYrYNU2JXaGIrpU
         EC11h0ge+/Ldb16ZLK1b0U1VUlHO6cPdZjS058lyvcJJGRRrK7gDuHAU1ESOVw3H8tdF
         2LvC685ltOxddhnLWOzl21zU6cSxix6U7NRmKuLqV9doeMoXb0ieSWHtnf1olpmAvq+Y
         4tH1JxZsy7x469qi84p4Td0ptTvz9r24BdvMHRshvpQzlOnsRmKxwAuP/4zCvm3YUU7e
         /S3UMEmAVidY4qIMRl5GroSBf0vANltkwrO+onKimdMT01bY9mvS2PmQpd6r07ywEcbZ
         Lx9w==
X-Forwarded-Encrypted: i=1; AJvYcCUuAoCJhLXuWmbnRRg6VGhheZwCfpObsAcTgUS0dsZKPBZ0hMlj/kIIc8+3RF/YEOMv9IZpMw2uhldjkwOmSOKG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0LsIGH7SCSM/SzxYvm0/6cpmYhXua0EaYqeuFTijhmqQuAu27
	sPwT0+phdcxxvQ5duPzm8YWRSy+CtmHMRolT9M5h502oY6Dj9rRIMU7naAU23NoA0+uWjCh6Gjl
	WOVIhyG0c7gDWNDsggi7Y+3/+V/VUt7EK8LzXm8NGnI83IRqrkUAPL6J9zdQvLl0KgYHXqEkcjW
	bY071EST1Z
X-Gm-Gg: AY/fxX43tSk3sjrhVCFSNZmuzPZEuJsXAFFLQV+qQz8zNT1PlM9Inwo6wZDDeMa8l03
	vRDDvw+fXefFukwD11WefXAoYGRNC9esss6dbdpzYu7O6ZJjy2xO3e4cO3NftS8tarrDLYH0M5U
	s6Kmb+Mt54zEYpBXoojsX5LP1jxWw/hmyP7exlhl8vCTWYrRhlphs/nIlcXkhMz4lfv2ydkPyTh
	pixRovj65lgt4ErsRJR8mYnUREsFhuUxPKIWytgkyB0Akq3KdIy0jX3RzeUfy+rjtXs8BObxDJj
	Pd5l6+ufWGC5Gv3IYfaTfiDZSiyTuMll/jTtzT/ZbfYAuqDSP+IAZsChlkI6KiBRO9Bc3v5Xs+S
	fhpVHO9VxsblTxBfkqNg8K7HO91Fs5YuFJEMXSwWXonQvIns0c76Awm/6
X-Received: by 2002:a05:6122:2887:b0:55b:305b:4e3e with SMTP id 71dfb90a1353d-56347ffb9edmr5814837e0c.20.1768238076673;
        Mon, 12 Jan 2026 09:14:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlqbRNk7nmg9s0QyR3wuxXiH+S603lyrhRY4LiNHJf7Z/PHgn/i4o1R+LczeMDwvDVUwoqOg==
X-Received: by 2002:a05:6122:2887:b0:55b:305b:4e3e with SMTP id 71dfb90a1353d-56347ffb9edmr5814824e0c.20.1768238076243;
        Mon, 12 Jan 2026 09:14:36 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56374ba06efsm7016541e0c.11.2026.01.12.09.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 09:14:35 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <5f4bfd8b-8699-4bef-bf49-f29965e95ca4@redhat.com>
Date: Mon, 12 Jan 2026 12:14:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
To: Thomas Gleixner <tglx@kernel.org>, Waiman Long <llong@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org> <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org> <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org>
 <40cec799-f363-4642-969b-24f5a2d56dfb@redhat.com> <87cy3eg94y.ffs@tglx>
In-Reply-To: <87cy3eg94y.ffs@tglx>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MMGd0PFliQqww419-GdcvTtPOShKPan1pw8LODhsUHM_1768238078
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_091443_055755_99477B49 
X-CRM114-Status: GOOD (  16.21  )
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

On 1/12/26 10:09 AM, Thomas Gleixner wrote:
> On Sun, Jan 11 2026 at 18:02, Waiman Long wrote:
>> On 1/11/26 5:38 AM, Marc Zyngier wrote:
>>>> Also that patch seems to be incomplete because there is another
>>>> allocation further down in allocate_vpe_l1_table()....
>>> Yeah, I wondered why page allocation wasn't affected by this issue,
>>> but didn't try to find out.
>> The use of GFP_ATOMIC flag in the page allocation request may help it to
>> dip into the reserved area and avoid taking any spinlock. In my own
>> test, just removing the kzalloc() call is enough to avoid any invalid
>> context warning. In the page allocation code, there is a zone lock and a
>> per_cpu_pages lock. They were not acquired in my particular test case,
>> though further investigation may be needed to make sure it is really safe.
> They might be acquired though. Only alloc_pages_nolock() guarantees that
> no lock is taken IIRC.

Thanks for the suggestion. I will look into using that for page 
allocation. I had actually attempt to use kmalloc_nolock() to replace 
kzalloc() initially. Even though it removed the call to rmqueue(), but 
there were other spinlocks in the slub code that were still being 
acquired like the local_lock() or the spinlock in the get_random() code. 
So I gave up using that. Anyway, kmalloc_nolock() doesn't seem to be 
fully working yet.

Cheers,
Longman


