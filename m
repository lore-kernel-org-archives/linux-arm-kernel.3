Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F61AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 15:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6COf3Hkk0aQA9lsD0i2AqUa4d4P/34xWsXqJ5E4hUk=; b=hoC3c/cv/B4qJkZbHsR3R8tuLT
	C1pVOho9h7sEsoJZDpWEPm1Oe8Kmmwo/Tmb0NBPFKz9c81yVoGAHrZ9ywxqOB7Eiekbwg20GniPMu
	Kn3yoYxJzD8HGf4yPEjih11BKvbBmgYLi4b1vTqTSblOWOgLOaW62HZwLKFE0A4Rqq0EjvCHLV6/u
	n7bIBQ4Akdw89nnjnjWthmVcLiv990O51rCauobK4aGvxexmnLeJsOhH8wSBBc1SNAmaaEki2bIDB
	O+nB272aUcWVBwmWRf9u0z42Arq5M3YSlxFGRDJeAfr3Uv+g4xC9nvl7fBt/qBH6cLi2avNDWvgK7
	kl2IDACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2ct-0000000C0fH-2w2F;
	Tue, 10 Dec 2024 15:58:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL2bU-0000000C0Pv-2c0t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 15:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733846210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O6COf3Hkk0aQA9lsD0i2AqUa4d4P/34xWsXqJ5E4hUk=;
	b=UZrZtxPjCjPRW6xbNd4MwTM/dlqj1XceBn3Lwr5nXV9lCQZ3Dx6cmuh/QIqd6/Ch314NZy
	qkX0Aft0OL1nUih5hsb7Muc2n3oGcexzzqntGqx/pENcl3OOI7+5OkZ+1KT3HH0EmHUp/6
	qcKXvPNpQUI1r+ShT5j0Rr8rfjFPhFU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-n5hhgecXPICdsPRbfkfxYg-1; Tue, 10 Dec 2024 10:56:48 -0500
X-MC-Unique: n5hhgecXPICdsPRbfkfxYg-1
X-Mimecast-MFC-AGG-ID: n5hhgecXPICdsPRbfkfxYg
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-83e5dd390bfso605345839f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 07:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733846208; x=1734451008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6COf3Hkk0aQA9lsD0i2AqUa4d4P/34xWsXqJ5E4hUk=;
        b=nalF5ptY2AquRU02d3LBVwrua4ce+9OGa1IMN9Qo7eQV7ONJomjpgp4yY4eK0qb5/6
         hi7o+ln35mDC56Fi3DW9C9wemnoNPx/Est7LNOu8HHayigA5FUv+uqwhMU1+OzaTfjkK
         ZFJRb+eOdqDmEQHFBHx9fTT7JFWRM6xvnor6kTw6zvBV4lZXONHMvQdslzD62jd3MJjq
         RkORzCaAUilZucKu4m7TFPnZAqaIN6bjTAiTc91JSbvlapPk8IBStPH3zzBv91jyCgmB
         DoQ+hHhLNQR0LZ0amG7NcyLJfPt3FAYjJJu3771qlatUmeOFauyK/SZYYSpAWTu/TWIj
         N2Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXh8on4lG3QJH8gQaFQfIEAaiKUIBr84Y2NlgPuo83CVsUzrWTshhuuv/ikr/C6QBRH9MMkR5W9Jtg+ItkLws3z@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9PMNt/F4lFCp4f+E56bAIdA9MD/kVCYqxbyqC5Wjx3vKoeHoh
	ngjZls6ddvsz4+7FEv8IkzCyHEEk3ZppLV6F9WipNAx2xqQWAE+XgJUaikDaFuLcCB74bbKvfai
	otWMToybfdGhuj/qOoxKLqs+j0sXTKJPB3BqkqWsNOXLMPqhWjE99gKQNXJr0cEX3P+lZs7/V
X-Gm-Gg: ASbGnctpOsEduJVTP/XuXJFgfYg4m77EGA9OpHd70VEqiUHeEc3Ic2OyCsnoT5qeY0b
	JUHG2tx4JOSHm3ca1Rf4dW7FwZ7YapFdQGaOAtkwPZKwf41xTAS/P2XvQX+HxEVJvrMtkIHOLwc
	UahZgZd6dOU9fPBW2VvSmotpu0o8EAFN+8F0xZkElJgifnVZ4o7KITwIDJyNPou6dY7IEpy3n9R
	QEpqBn8Dg0p09B2jAWaA88jIUmr7pdXoUfDaWxvf5mRcQijUsQObsk=
X-Received: by 2002:a05:6602:a108:b0:83a:943d:a280 with SMTP id ca18e2360f4ac-844b87f7863mr300000939f.1.1733846208055;
        Tue, 10 Dec 2024 07:56:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO/en2fuAvQyTs2jHHMl4LqDZEtajqMB/Su9iQAs0bW7stQDAwQKFTzGD6u5DQDQ+uVMvWSg==
X-Received: by 2002:a05:6602:a108:b0:83a:943d:a280 with SMTP id ca18e2360f4ac-844b87f7863mr299997739f.1.1733846207687;
        Tue, 10 Dec 2024 07:56:47 -0800 (PST)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e2bf67d125sm1155622173.96.2024.12.10.07.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:56:47 -0800 (PST)
Message-ID: <0723d890-1f90-463b-a814-9f7bb7e2200b@redhat.com>
Date: Tue, 10 Dec 2024 10:56:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] KVM: arm64: Map GPU memory with no struct pages
To: Jason Gunthorpe <jgg@nvidia.com>, Will Deacon <will@kernel.org>
Cc: ankita@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, ryan.roberts@arm.com, shahuang@redhat.com,
 lpieralisi@kernel.org, aniketa@nvidia.com, cjia@nvidia.com,
 kwankhede@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
 acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
 danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
 dnigam@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com,
 coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
 linux-mm@kvack.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241118131958.4609-1-ankita@nvidia.com>
 <20241210140739.GC15607@willie-the-truck>
 <20241210141806.GI2347147@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20241210141806.GI2347147@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4W_S3UCzf_8gdckgbJOkIVKw7hgwmFip-6GxEFzNIlc_1733846208
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_075652_734380_38307AB1 
X-CRM114-Status: GOOD (  20.33  )
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



On 12/10/24 9:18 AM, Jason Gunthorpe wrote:
> On Tue, Dec 10, 2024 at 02:07:40PM +0000, Will Deacon wrote:
>> On Mon, Nov 18, 2024 at 01:19:57PM +0000, ankita@nvidia.com wrote:
>>> The changes are heavily influenced by the insightful discussions between
>>> Catalin Marinas and Jason Gunthorpe [1] on v1. Many thanks for their
>>> valuable suggestions.
>>>
>>> Link: https://lore.kernel.org/lkml/20230907181459.18145-2-ankita@nvidia.com [1]
>>
>> That's a different series, no? It got merged at v9:
> 
> I was confused by this too. v1 of that series included this patch, as
> that series went along it became focused only on enabling WC
> (Normal-NC) in a VM for device MMIO and this patch for device cachable
> memory was dropped off.
> 
> There are two related things:
>   1) Device MMIO memory should be able to be Normal-NC in a VM. Already
>      merged
>   2) Device Cachable memory (ie CXL and pre-CXL coherently attached
>      memory) should be Normal Cachable in a VM, even if it doesn't have
>      struct page/etc. (this patch)
> 
> IIRC this part was dropped off because of the MTE complexity that
> Catalin raised.
> 
> Jason
> 
Jason & Catalin: Thanks for the filler for the splitting.

So, I'm not sure I read what is needed to resolve this patch.
I read Will's reply to split it further and basically along what logical lines of functionality;
is there still an MTE complexity that has to be resolved/included in the series?

IOW, I'm looking for a complete, clear (set of) statement(s) that Ankit can implement to get this (requested) series moving forward, sooner than later;
it's already been a year+ to get to this point, and I don't want further ambiguity/uncertainty to drag it out more than needed.

Thanks... Don


