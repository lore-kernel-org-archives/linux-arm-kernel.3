Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF94DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0rlDhIwvvVKAA/Z/ReGOUxjITf8M7mwn/BPJqxsGsg=; b=uKL+r9/kzzfagD3n9CRcDz05ST
	ghRiCwTVUNHYwzBLldXtglGbcpesc+mT4nvLF7vsHLn0edXa1Js8ZgbbGdrp+pLng22NjuekdxMsi
	/1onh/9G7bwFMP5mHeZ/puLBpHdiWNBX68PBLidRz/squlMQMqfeX0NMiu/BC/wa+wRkCEYfZMt2m
	721mN56uliJHHyJMuQKXJBO4D1pK2CradMgwaooHrtDdKyGzQG0SwKl4Q+WHAmmshm4xvUGfg+Q5W
	EixZQ+Y1Is/EPGpB15gSW3cRBdfQ+CfgP6MfxlCooMBuaQecxzMH1bslKYJ65aoyVCts6LJQpNpzd
	J9khWheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYdj-0000000972S-3DVc;
	Wed, 08 Jan 2025 16:10:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYcT-000000096Yh-2qhC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736352560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s0rlDhIwvvVKAA/Z/ReGOUxjITf8M7mwn/BPJqxsGsg=;
	b=LbaS4z/1oB4jM4LDfy2IamOYEnD5JX8u2xwtaqLPGa+8d27t/4c8Z8SchjBVJl+n7inkS1
	ByVd9CwhKXJDB/taHQyA67eqm2om5Qr+GK8xGT8xlXVhlOpt0Dak0oWZJ8kZNriGeIeR+6
	mmqk7VNWNm4FAU6t7DpTwQjO8kgDiLA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-1oEA-C00MV2wvJzkCgOsVw-1; Wed, 08 Jan 2025 11:09:19 -0500
X-MC-Unique: 1oEA-C00MV2wvJzkCgOsVw-1
X-Mimecast-MFC-AGG-ID: 1oEA-C00MV2wvJzkCgOsVw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43673af80a6so112671115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352558; x=1736957358;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s0rlDhIwvvVKAA/Z/ReGOUxjITf8M7mwn/BPJqxsGsg=;
        b=MeJfLKm43Gfjx7/fgxkyz5CxPuYZbvXQzS0qbeDvrT7bi2ZkUdbSvl01pObVOFC68S
         WHfU93CPGGuuI6Z4Pt5sqjb/RwgxY6XTnSHcumEZLJUJ3ZoUjxrwSWxM69PJAHfoc8xU
         VyKIiY3URopBNl6daDoDOP6AFTpADYby35nIDrFxEtb8cpRxs84NGpDAG4rN9/wr3vAF
         yUk/WoSoN08zVqLhAuP1/Doa8x+4HH5er3chvzj/AyhWrIss6VbdhNwKZT9SnCfTVvtU
         PVXuXoajEB5GeKQO9n3du/J0UbzS6nKJqAPSZ/Bqu/8agcCoZlPTAhewJsBTnWDUO9Mv
         dAHA==
X-Forwarded-Encrypted: i=1; AJvYcCWMwEyBDF/aIsLOEu8nYvBbuJychMFrWHR33SSfbIG3rSE7gmHe+q1zCwNO72rmeInIwc6XLdkjiOOmXWJpn2oI@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw17mA+3F9UPoIEV3ppTpch2+0xNangYHvSSnpvJ9aHyrHeJhZ
	slQ8Iabb3tILqQDlU/19mA4Tu5CK3Zghm1Kw7SbjrccvVfh+E+WeazrCk6dCgAw9lXxUWpolbgI
	kYW9jZa+GNJ68FPe3auuI+iSd1l77F77BfviPzjWrCAN+q39PIy22s0YljyHeP4Nq8uwTZK4y
X-Gm-Gg: ASbGncvaalhBx5r+/w4/v8piei2Q1Ny6REhBsErVlT+J6HDd7UnB5rLqyT12YXPFvL8
	u/Wnzmsg1xhbSTMhKe+l4hRpFbLsqo0KW7xJj4+cOW4T+AP3ms9Mq45r6IOha5LqN1MuP/YcmrX
	fgPkEf69XBEn7EAijfOhqA/IkLrrE9UZKXn/OMe7l9flJyvXJ9aGd4TB+5Qn1I5nCYMavt1KyJX
	FoybTjtg8E+rWz4IjKOQsS04HNRWoLYjD6A9QKRqsP6QsbjFQ0maUwA3noGDagArXu1Yl7Nr+1x
	C3vxrM8pwFO3yyAEe7ak4GLoNbbjJBbGcEabUmOaIGDTfVyLgDGnBLtkhjOy4+1NkYeuM/OsWlf
	fyfEZCA==
X-Received: by 2002:a05:600c:1d0c:b0:436:1bbe:f686 with SMTP id 5b1f17b1804b1-436e2707c59mr26526805e9.21.1736352557834;
        Wed, 08 Jan 2025 08:09:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuW+kXE4dSP1dwStt7dtEmz7DMdPJOlNk4fca0pJWrMp44Izq0k2N2szKXrAfMK8IDoDv+jg==
X-Received: by 2002:a05:600c:1d0c:b0:436:1bbe:f686 with SMTP id 5b1f17b1804b1-436e2707c59mr26526505e9.21.1736352557412;
        Wed, 08 Jan 2025 08:09:17 -0800 (PST)
Received: from ?IPV6:2003:cb:c70d:3a00:d73c:6a8:ca9f:1df7? (p200300cbc70d3a00d73c06a8ca9f1df7.dip0.t-ipconnect.de. [2003:cb:c70d:3a00:d73c:6a8:ca9f:1df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2df9f8bsm25473195e9.26.2025.01.08.08.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 08:09:16 -0800 (PST)
Message-ID: <f13622a2-6955-48d0-9793-fba6cea97a60@redhat.com>
Date: Wed, 8 Jan 2025 17:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: ankita@nvidia.com, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
 shahuang@redhat.com, lpieralisi@kernel.org, aniketa@nvidia.com,
 cjia@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com,
 jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com,
 udhoke@nvidia.com, dnigam@nvidia.com, alex.williamson@redhat.com,
 sebastianene@google.com, coltonlewis@google.com, kevin.tian@intel.com,
 yi.l.liu@intel.com, ardb@kernel.org, akpm@linux-foundation.org,
 gshan@redhat.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241118131958.4609-1-ankita@nvidia.com>
 <20241118131958.4609-2-ankita@nvidia.com>
 <a2d95399-62ad-46d3-9e48-6fa90fd2c2f3@redhat.com>
 <20250106165159.GJ5556@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250106165159.GJ5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9CqKnfu6RwE3mCWYRFCMiKeHb2Y3hUomtTLWjFWwYjA_1736352558
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_080921_799609_FF303332 
X-CRM114-Status: GOOD (  21.86  )
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


On 06.01.25 17:51, Jason Gunthorpe wrote:
> On Fri, Dec 20, 2024 at 04:42:35PM +0100, David Hildenbrand wrote:
>> On 18.11.24 14:19, ankita@nvidia.com wrote:
>>> From: Ankit Agrawal <ankita@nvidia.com>
>>>
>>> Currently KVM determines if a VMA is pointing at IO memory by checking
>>> pfn_is_map_memory(). However, the MM already gives us a way to tell what
>>> kind of memory it is by inspecting the VMA.
>>
>> Do you primarily care about VM_PFNMAP/VM_MIXEDMAP VMAs, or also other VMA
>> types?
> 
> I think this is exclusively about allowing cachable memory inside a
> VM_PFNMAP VMA (created by VFIO) remain cachable inside the guest VM.

Thanks!

> 
>>> This patch solves the problems where it is possible for the kernel to
>>> have VMAs pointing at cachable memory without causing
>>> pfn_is_map_memory() to be true, eg DAX memremap cases and CXL/pre-CXL
>>> devices. This memory is now properly marked as cachable in KVM.
>>
>> Does this only imply in worse performance, or does this also affect
>> correctness? I suspect performance is the problem, correct?
> 
> Correctness. Things like atomics don't work on non-cachable mappings.

Hah! This needs to be highlighted in the patch description. And maybe 
this even implies Fixes: etc?

> 
>> Maybe one could just reject such cases (if KVM PFN lookup code not
>> already rejects them, which might just be that case IIRC).
> 
> At least VFIO enforces SHARED or it won't create the VMA.
> 
> drivers/vfio/pci/vfio_pci_core.c:       if ((vma->vm_flags & VM_SHARED) == 0)

That makes a lot of sense for VFIO.

> 
> This is pretty normal/essential for drivers..
> 
> Are you suggesting the VMA flags should be inspected more?
> VM_SHARED/PFNMAP before allowing this?


I was wondering if we can safely assume that "device PFNs" can only 
exist in VM_PFNMAP mappings. Then we can avoid all that pfn_valid() / 
pfn_is_map_memory() stuff for "obviously not device" memory.

I tried to protoype, but have to give up for now; the code is too 
complicated to make quick progress :)

-- 
Cheers,

David / dhildenb


