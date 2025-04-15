Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7E9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7mYhx2kRriJ8qhsg8G/2thr6sZGezFvHhrfnmNR+G0=; b=NGr9TwbQ3gfCK0ceF8tozNSOfN
	MjUsxeQTBIEZ8seu1HdB+RdgA8Ep20HswNsRIpnXdoTY10t8huaMA11xFfJxhw8viXdD/4FUaRr1+
	0h4l4CveardWrHfFv+voxUN5vK4816g/+nBGggfy4ToqK4sTutKVGYmxRYqZari68xUGvQQZ4l1jU
	j1odrHFu7vVVFAM5Axtilel9CJ34zM9M8CVBLIcAAE52hXso2FUmiRyZJ4rEgRfaKz+tDpXqmP4qE
	e+KzRcHy2HdHJo4hYq66BllveoZyzkFq5OarAsaHdUjAxhf0BEqNcms/wV7hAiYqZxLh0896DnNhQ
	Mq80M+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4kaQ-00000006epU-3jEy;
	Tue, 15 Apr 2025 18:00:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4k8e-00000006Zny-2mro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 17:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744738318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/7mYhx2kRriJ8qhsg8G/2thr6sZGezFvHhrfnmNR+G0=;
	b=gRNlhqBxaDZBhxEiIWFOKuw+zrBjKJNY2P4F8JavXuhlj5WuImCHsC8q7udRFZXXHcv6uG
	8VJSCOn048GXNZfN/ZBSgrAFlBUWUFhK8R3p3A91DnawxoeXHe/eDulc+8TcaJGMksBVNM
	GWdpOAsB6EwapcuKYla0wkeQTqjjqNY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-GjgG9VlWMXmneTwbTpv7Gw-1; Tue, 15 Apr 2025 13:31:55 -0400
X-MC-Unique: GjgG9VlWMXmneTwbTpv7Gw-1
X-Mimecast-MFC-AGG-ID: GjgG9VlWMXmneTwbTpv7Gw_1744738314
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so36402445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 10:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744738314; x=1745343114;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7mYhx2kRriJ8qhsg8G/2thr6sZGezFvHhrfnmNR+G0=;
        b=vzak7ONQshFlkqtmUim8MAnQgzVH53P3Yt1+7ovyXDwa+gMTN7CNdpSbZ1FKe/4S8q
         xOcNMVMbJB+zz5YE1Rf6CdHe5no538kvb/+VEb5SgAVah8bH9DlXmGeTnPSPSMAEXIW1
         bzspvZvEs8VRT4EAbvmfjMcqXJa4QNPL8165af2dfURJfVKR1LhbqrGn9Hk2S0eHqQCg
         oiSiosRe6Ww+28SYNynUTNPOTszXVkJYzJ1FsvPruJIEFdVBbIdtFETcGlLWsMOJGnCV
         teoT9vL8DC4F1eySWVPVhLvnCJyT4xKsacQWbTCOmAWFLNB5GDsW9xUh1CtEyDdPIjMb
         QEpg==
X-Forwarded-Encrypted: i=1; AJvYcCV53kwHAEJ1vkBldXno+ftr0z+bKsIeZRsnzzTD+C3NKVKifKetr2giRb8pFNS+/R87OzjFIBK+NWjHM4ua/XHT@lists.infradead.org
X-Gm-Message-State: AOJu0YwrZt6n2FPnutDY449EwXfprycfmtD5rm8Zc2SUiO0pffkPG+/b
	CDgJhYLHxrYNG/va7f8vQORiRPuljKTWgwBYCgachowRJkmT0/dugBvldXFl5Z4+PoZpnXr8LpP
	izod5FZy9As53lgZ5+203NbMAghteKlAe41Kr0NYX4Da1rKXgn7I8Aoz5jAeFYXlNAXoSHlWG
X-Gm-Gg: ASbGncsQPuzI2vMpcNja8wF5NCim8XKcu+UCba7vz/QdnESxv/Oz+9HVOq1WTKoK2YB
	5f9RXjOyczR71/Hkv0i1V1d1tDg9wXc/xgf9IPOcCtxb3YI6YLaoFF9eQ9MLxc5G+RnjjZrREcj
	TlYLNEfgcHP2UvBRWOgvKkEVSA0k9WTYv9xa/1IY25c8DDvzgceSntuE0S+KdfvmsbY/NpjYu3t
	ckwFAvfvGIdugaZ0J71jrHlR5Yl5/BstidZYqWfUbm5AFQW4Sg8HkGsnNfNP7a/vmnFav4Lhkox
	fBnhzkrlKafXiKf3qSe0jwSEwWVQTvVlFihDZb6PPx9OxUlkfjT4G2KJCHur
X-Received: by 2002:a05:600c:348f:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43f3a9b0264mr177173395e9.30.1744738314314;
        Tue, 15 Apr 2025 10:31:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA/tx9grXm5jqEEDz9Bpub9UAtfBltUciF6sMqY25djhf7AkRnDKyrBy1HMtLSSHaxXK+rkA==
X-Received: by 2002:a05:600c:348f:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-43f3a9b0264mr177173135e9.30.1744738313974;
        Tue, 15 Apr 2025 10:31:53 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c53sm213921645e9.14.2025.04.15.10.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:31:53 -0700 (PDT)
Date: Tue, 15 Apr 2025 19:31:52 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: arch_timer_edge_cases failures on ampere-one
In-Reply-To: <86h62wkp1c.wl-maz@kernel.org>
Message-ID: <2490752b-530d-df2c-7ec2-5feb8160c115@redhat.com>
References: <ac1de1d2-ef2b-d439-dc48-8615e121b07b@redhat.com> <86h62wkp1c.wl-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l4VT3fnv3neYhqiOAA6uDcSSkEqqr2KzNxmAktz3UIU_1744738314
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_103200_785319_B919140A 
X-CRM114-Status: GOOD (  13.49  )
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

On Thu, 10 Apr 2025, Marc Zyngier wrote:
> On Thu, 10 Apr 2025 16:10:43 +0100,
> Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Hey,
>>
>> I'm seeing consistent failures for the arch_timer_edge_cases
>> selftest one ampere-one(x):
>> ==== Test Assertion Failure ====
>>   arm64/arch_timer_edge_cases.c:170: timer_condition == istatus
>>   pid=6277 tid=6277 errno=4 - Interrupted system call
>>      1  0x0000000000403bcf: test_run at arch_timer_edge_cases.c:962
>>      2  0x0000000000401f1f: main at arch_timer_edge_cases.c:1083
>>      3  0x0000ffffa8b2625b: ?? ??:0
>>      4  0x0000ffffa8b2633b: ?? ??:0
>>      5  0x000000000040202f: _start at ??:?
>>   0x1 != 0x0 (timer_condition != istatus)
>>
>> The (first) test that's failing is from test_timers_in_the_past():
>>     /* Set a timer to counter=0 (in the past) */
>>     test_timer_cval(timer, 0, wm, true, DEF_CNT);
>>
>> If I understand this correctly then the timer condition is met, an
>> irq should be raised with the istatus bit from SYS_CNTV_CTL_EL0 set.
>>
>> What the guest gets for SYS_CNTV_CTL_EL0 is 1 (only the enable bit
>> set). KVM also reads 1 in timer_save_state() via
>> read_sysreg_el0(SYS_CNTV_CTL). Is this a HW/FW issue?
>
> My hunch is that this is related to AC03_CPU_14 in [1] (now archived
> locally for future reference...).

Thanks! Your hunch seems to point in the right direction. If the diff is
smaller than 2^63 this is working as expected. I'll try to figure out some
changes that let the test succeed on ampere while still doing meaningful
tests.

Sebastian


