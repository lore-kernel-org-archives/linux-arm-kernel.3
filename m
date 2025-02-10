Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7DAC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HA223N7bzpD0iurwVL/uuRnSBdx4Qsn+l1XE/28dqsc=; b=qyaWEopMz52Yewz62liJlR3Ujj
	tu8ejuyBBmG0LpKZ5F+RUS0Fqbr8bph3oMMwRA9qdRWD/ScrEuFCXxqPYpYisdMrWjUY+HK+EFl2K
	IPpqPHsDLDkxCLsRPrzpE9WAoTjh9wL6avRS3/1xU/qY1ZapMomPikCznxvHsYNhC10k0bWBiHRXp
	quTeFaW8xFxSLkevfvUmrTpAadjYRhlK4lFgyklFMHnwYGOZdJPW7LpqyE/ghkaSedg+KHCZbKdmr
	qrez+IEM4gyxAouhnhEv00sLH+Emk6bY08iupq2ZWR6HHsL70155RXetfDrEkvYAunS5lQO+UkEOY
	mbtJMwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeB-00000001AWs-0D1R;
	Mon, 10 Feb 2025 19:40:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYUh-00000000uyu-36fh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739212014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HA223N7bzpD0iurwVL/uuRnSBdx4Qsn+l1XE/28dqsc=;
	b=Soi4BvTD82qUyR+7Z/FGrwHIwMXgzPvXLcKXKsQh5kJ6+9DvDHFUtNxfZOzAnVwoe6xgGy
	CTso+Nb9EMP/jTudN1G+WEOsHsfgxHm9aUJ/YJmQYY0Z6IU5/IzuqykqOh9YC3UPVHNJsj
	tyX222ugvK4epdHhG+N3AvqVoVjNLDo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-ZWABsTBjP2OxWQHVrmVxbg-1; Mon, 10 Feb 2025 13:26:53 -0500
X-MC-Unique: ZWABsTBjP2OxWQHVrmVxbg-1
X-Mimecast-MFC-AGG-ID: ZWABsTBjP2OxWQHVrmVxbg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394c0a58e7so2946775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 10:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212012; x=1739816812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HA223N7bzpD0iurwVL/uuRnSBdx4Qsn+l1XE/28dqsc=;
        b=FMHN0I7u91YSMEWZvpIJHgFxL7hDQyd1pF2ZnhHvxH9f/B5edQxpUiWZ/hFqiL/phs
         PspB6GpDao2p92nE9D47IPZkNXE/QL5HibXZddSXMOvBDBPAL/EwMIeeTdFihNJkABy9
         3NjFZYuBwdFyMNInTAfGttJyFCsPZk13sTFSxuSQnek6oiVSmZuPY23VM7Q59rCNorho
         e9DAH5nA0A0ucFkHb6ZBCAVzWti40wuUR6U6I7n0FL7TsGMpccbQp4yZcHLTf9Z4IQy5
         xj3T2Gp6D/SGWb16RamSXk30Wgzwa227Ack6I4q4Gb9N101dxOLBr2wszyRi7pcB0kAp
         4Z7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNj599bnel2r1gthpM0nogaTiokbuyUnUK5b+k++s0HDW6tm56LGTNIqsLvJiDuJQNqGW3SPrsjVj+BYoA9VnF@lists.infradead.org
X-Gm-Message-State: AOJu0YxyaEbC3ZFTq1SJT+E3kZuuekHB+pUjjmhwz9hXMEXCTASBuZsk
	LInujTl1Z5lNrLmBplK/KPYg7Ohu6UWo66NihGAO879oj8EtrwPFYeIK/WwZihwfuYcHzkdfp2v
	DualSacxkYgfjgtyQFgF1RYd4fZTA5EB4ahiSiA+FYje90f3AX8nWm7h2hfuwGHNuymdNq1eb
X-Gm-Gg: ASbGncs65oYDC/lYkDyo+80uLiduTxbRa6RQ+e6pFsGi1JQtUKvN4XGiR6DtAbL9qOi
	aALHksMVTKpNUuZUQnkupK/8+SlxkzbtL/QnW05qDydE9f7fTvBEpSppI/CnplGcvmD4aAFR1p8
	KvHskCrvMlCU3EzoZVGG4PakH4RGvv59rwzY4iSInZG1Wflvyi09kBacej96AnHleGyWd0gB+04
	CP1cV4f41Q7vwoVjYRM9f0h6cIiZctAXxmh/EiNmO0gJp4elRakUA99Q6bv/7ZrsqInMEb8oDg7
	x6DI42zNkX5o93lu/+Y0MkXbQm/0K8Pgg4JvmGoaUrSSRlc=
X-Received: by 2002:a05:600c:5026:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-439249c6eeamr102512875e9.26.1739212012021;
        Mon, 10 Feb 2025 10:26:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdXSicXWsQFBmaEUffk1qaLUEnTABUYO99W2RiA4VYZWZefOzltKbNAoDI4virz7wvcWBw1g==
X-Received: by 2002:a05:600c:5026:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-439249c6eeamr102512675e9.26.1739212011660;
        Mon, 10 Feb 2025 10:26:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd1093bb2sm8205458f8f.40.2025.02.10.10.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:26:50 -0800 (PST)
Message-ID: <8da22249-eedb-477b-98d8-f50dee56f1f7@redhat.com>
Date: Mon, 10 Feb 2025 19:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: nv: Set ISTATUS for emulated timers, If timer
 expired
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 kvmarm <kvmarm@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, christoffer.dall@arm.com,
 suzuki.poulose@arm.com, will@kernel.org, catalin.marinas@arm.com,
 coltonlewis@google.com, joey.gouly@arm.com, yuzenghui@huawei.com,
 darren@os.amperecomputing.com, vishnu@os.amperecomputing.com
References: <bcb4289b-507c-4ea1-afc7-6febd34d88db@redhat.com>
 <86y10osr19.wl-maz@kernel.org>
 <4d443db1-85b1-4071-acd5-3187deb9cb17@redhat.com>
 <2f6b2cb1-3d32-480a-9801-9b993ae74e2d@os.amperecomputing.com>
 <152d262e-641d-4bb1-9656-a13e049d62c4@redhat.com>
 <86h661wje4.wl-maz@kernel.org>
 <4a9fbdd9-ad23-44bc-8ba5-399f08068db4@redhat.com>
 <86cygpwfy0.wl-maz@kernel.org>
 <b22d5916-8b55-43bc-a256-2136d66ad25f@redhat.com>
 <86frkptzr6.wl-maz@kernel.org> <Z6ZMdv8jJUvYwQzT@linux.dev>
 <86bjvdtxb5.wl-maz@kernel.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <86bjvdtxb5.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5htMRtylf0Z542U-qZDX_MOGxwFb9FGVrwuf_5acdwI_1739212012
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102655_858374_1DCD93E5 
X-CRM114-Status: GOOD (  26.88  )
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

Hi Marc,

On 2/7/25 7:38 PM, Marc Zyngier wrote:
> On Fri, 07 Feb 2025 18:09:58 +0000,
> Oliver Upton <oliver.upton@linux.dev> wrote:
>>
>> Hey,
>>
>> On Fri, Feb 07, 2025 at 05:45:33PM +0000, Marc Zyngier wrote:
>>> I found at least one issue that could fail the migration. Before the
>>> VM starts running, we limit the feature set to the subset we actually
>>> support with NV.
>>>
>>> By doing this, we also change the value of IDreg fields that are not
>>> writable, because they describe features that we don't support.
>>> Obviously, that fails on restore.
>>>
>>> I need to have a think...
>>
>> We spoke about this a while ago (and I forgot til now), but I was
>> wondering if we could use vCPU feature flags to describe NV, including
>> the selection between FEAT_E2H0 and FEAT_VHE.
>>
>> I think this might match userspace expectations a bit more closely where
>> the state of the ID registers after init gives the actual feature set
>> supported by the VM.
> 
> I'm not sure that's enough. Let me give you an example:
> 
> My host has FEAT_XNX, described in ID_AA64MMFR1_EL1.XNX. For whatever
> reason, we don't allow this field to be written to, even out of NV
> context. This is odd, because for an EL1 VM, this field means nothing
> at all.
So the curprit fields for me look like

- ID_AA64MMFR1_EL1.XNX
- ID_AA64DFR0_EL1.DoubleLock
- ID_AA64PFR0_EL1.RAS

This is still based on your nv-next branch from Jan 9
https://github.com/eauger/linux/tree/nv_next_jan9_2025

Eric
> 
> However, we don't yet support FEAT_XNX with NV (it requires some extra
> surgery in the S2 walker, in the S2 shadowing code and in AT).
> 
> How would you manage this field if you had a vcpu flag saying E2H0 or
> not? I don't think it helps, at least not in that particular case. It
> may help for some things, but not all.
> 
> It feels that we need to define the field limit (and what is writable
> or not) based on the NV/!NV support, and maybe E2H0/VHE as well.
> 
> This is getting complicated...
> 
> 	M.
> 


