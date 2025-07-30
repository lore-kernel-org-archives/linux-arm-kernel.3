Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86993C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O2oNAXD8KVY8vBDD4aG+8v/vac45H/32JLje5KhFMI=; b=DrpcebVkRNwF+zBsefuwEMGho+
	kow/pTe2JRbfpZpNIEIhKvtLfiT0/OnMQgr2xnVHOwIgCMWtA5r/JsED/HWjybuqWg2LljFIMTKBr
	HwIgdZ/NZ9yJcbgk4xlT8rL/p+zsaGReObEFU9/DIgs5pDeHsb324Bfsvly+X0awKmZFO44JXLRcP
	12bTvKOjW9DpENWZEWLZDy6zSdntDms1kdf+O7ZJZ5l3AUORj41PiI/lMJwGLW1IptzBw9/SrwHTW
	bLWl09A6XRS9wO8M8O7qxTRs3dOwdIFvTedT9/cxChVZTNyXlUofXMQGsH9bfbHuJt4P2k6CUuI8B
	3mL9BV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7dj-00000001iYd-1GXE;
	Wed, 30 Jul 2025 14:18:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Q6-00000001gg7-1VAl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 14:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753884277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3O2oNAXD8KVY8vBDD4aG+8v/vac45H/32JLje5KhFMI=;
	b=cbDSvcIuUuqZrV67L4RpgEuEsNxbgLsj+AXZyidlO4UcrP3lOoF2XKfmBOGpM03qJSOeEr
	8HR40dEPLPoO546tPv+IWKlm7+Mi41ENYMtxbzUeglqq+7VItphTZrIDtWN7tjy3dNbmz4
	Dgv+3P2ZGPM5UU0sZktg+VrxY9QRCg0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-OwmFRgBcN2yNw3isEsx3Zg-1; Wed, 30 Jul 2025 10:04:35 -0400
X-MC-Unique: OwmFRgBcN2yNw3isEsx3Zg-1
X-Mimecast-MFC-AGG-ID: OwmFRgBcN2yNw3isEsx3Zg_1753884275
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae0a3511145so495255866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 07:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753884275; x=1754489075;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3O2oNAXD8KVY8vBDD4aG+8v/vac45H/32JLje5KhFMI=;
        b=cEOcjhDWNLw/duV4+rSYlBv8KsThbkKtxWTZUzudZd5ESjbw7hDkYZptoXkEFl7eLr
         d4NFxCmzM2M7866QB4h16B1TdbmAh4zzNpi3j7Ez+Mf/q7Y9p4iSag+k+ecC5UjSsPtV
         3a9twfLsoPCyJ4kDEs7zQXsLU36vyxfvLzc76FnYt6lcebH6GefHZ6cvuzvI360pvFVp
         Gn/Qtvd/ZURYZXUyswjgOszTNrrVOD6oYNHhJaFLFFvAspJmOdXBYPfDeZEqaPDrgtAG
         RZ7NUB9NGOkmqprwJjqZlUibM7HsNgbluNJvxaEcy5HauXe+nTfmX1zlTXeU5fuRXhAe
         3SGg==
X-Gm-Message-State: AOJu0YxUkYOW2xZ/ZN4CiIZi0GqN1vHbUaDNoJf5WXQyqkCRH7mbB6ZE
	HhoxqoiEAUaZmIDRyijdWLZpK6mC5irikLMjdlMkofLwgH6PLK5r+b4L3Iay1t2EsSQdN9SorL9
	XJgPi2OUTv1bbTj2ACLXK08KaKA9865V06xICDr0edvqMhQ2GzqOBiYLeVFAy8hGuZa2SXkz4ii
	Q8
X-Gm-Gg: ASbGncuJHZqzFE2pSCAn30G6wMDOwvXKraj5G+IZT4IMOzZzyrALDZ3ugClGnKfN3KL
	5A8o88ezhYpIMOnPe04I39hchhF1NZmU9WL9t1ERvkMJvQlYV05oB2gQxUlLpqNyq9mgjILEnqS
	l0rYSXLSo2N/zRvBcVeludCkheV0DuRgfvMp0jtHnf9AkS+pcVm9B8ExMrHgUEWgwwESnsQltL/
	fl0nhzrFVq+DTOqArnG9wLrLa+wXQGj+zQL2ex7Ie3WCNIVzA9Df+ij8CXlZKkpDhPEE7y0XOv3
	wBmKkSeec4IfS/kSPvpOytuRd4BIRZE3DsXnaU9nweXFYHiM7pxvYi21s+HVTg==
X-Received: by 2002:a17:907:3f88:b0:af8:f9e8:6fae with SMTP id a640c23a62f3a-af8fd9f663amr404271366b.46.1753884272879;
        Wed, 30 Jul 2025 07:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4NPzv48+fUrubCDntYT5pIsBc9DKyFBE7vheDZ6rVTSQBnixNsW4Ss/KjIbgNUx7Mki1uOA==
X-Received: by 2002:a17:907:3f88:b0:af8:f9e8:6fae with SMTP id a640c23a62f3a-af8fd9f663amr404265066b.46.1753884272305;
        Wed, 30 Jul 2025 07:04:32 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358600a4sm754596166b.25.2025.07.30.07.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:04:31 -0700 (PDT)
Message-ID: <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
Date: Wed, 30 Jul 2025 16:04:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
 pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <20250724135512.518487-23-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gpgYA-a8q_RWrj1hlTDzg0BHBPW6GY6hxOnoB3IBUPA_1753884275
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_070438_476311_D7460490 
X-CRM114-Status: GOOD (  21.31  )
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

On 30.07.25 15:57, Eugen Hristev wrote:
> Hello,
> 
> On 7/30/25 16:52, David Hildenbrand wrote:
>> On 24.07.25 15:55, Eugen Hristev wrote:
>>> Annotate vital static information into kmemdump:
>>>    - node_data
>>>
>>> Information on these variables is stored into dedicated kmemdump section.
>>>
>>> Register dynamic information into kmemdump:
>>>    - dynamic node data for each node
>>>
>>> This information is being allocated for each node, as physical address,
>>> so call kmemdump_phys_alloc_size that will allocate an unique kmemdump
>>> uid, and register the virtual address.
>>>
>>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>>> ---
>>>    mm/numa.c | 5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/numa.c b/mm/numa.c
>>> index 7d5e06fe5bd4..88cada571171 100644
>>> --- a/mm/numa.c
>>> +++ b/mm/numa.c
>>> @@ -4,9 +4,11 @@
>>>    #include <linux/printk.h>
>>>    #include <linux/numa.h>
>>>    #include <linux/numa_memblks.h>
>>> +#include <linux/kmemdump.h>
>>>    
>>>    struct pglist_data *node_data[MAX_NUMNODES];
>>>    EXPORT_SYMBOL(node_data);
>>> +KMEMDUMP_VAR_CORE(node_data, MAX_NUMNODES * sizeof(struct pglist_data));
>>>    
>>>    /* Allocate NODE_DATA for a node on the local memory */
>>>    void __init alloc_node_data(int nid)
>>> @@ -16,7 +18,8 @@ void __init alloc_node_data(int nid)
>>>    	int tnid;
>>>    
>>>    	/* Allocate node data.  Try node-local memory and then any node. */
>>> -	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
>>> +	nd_pa = kmemdump_phys_alloc_size(nd_size, memblock_phys_alloc_try_nid,
>>> +					 nd_size, SMP_CACHE_BYTES, nid);
>>
>> Do we really want to wrap memblock allocations in such a way? :/
>>
>> Gah, no, no no.
>>
>> Can't we pass that as some magical flag, or just ... register *after*
>> allocating?
>>
> 
> Thanks for looking into my patch.
> 
> Yes, registering after is also an option. Initially this is how I
> designed the kmemdump API, I also had in mind to add a flag, but, after
> discussing with Thomas Gleixner, he came up with the macro wrapper idea
> here:
> https://lore.kernel.org/lkml/87ikkzpcup.ffs@tglx/
> Do you think we can continue that discussion , or maybe start it here ?

Yeah, I don't like that, but I can see how we ended up here.

I also don't quite like the idea that we must encode here what to 
include in a dump and what not ...

For the vmcore we construct it at runtime in 
crash_save_vmcoreinfo_init(), where we e.g., have

VMCOREINFO_STRUCT_SIZE(pglist_data);

Could we similar have some place where we construct what to dump 
similarly, just not using the current values, but the memory ranges?

Did you consider that?

-- 
Cheers,

David / dhildenb


