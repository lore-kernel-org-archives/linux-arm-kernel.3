Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6499C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 14:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPqm9+gCQ4G++ODNHAXi9UZv0hvANLxxg7IJ6626syU=; b=SjSOMBULtP72dPgg0hQ/58rSKI
	YIt87l4nB7gTAkjwW26sjpRUNf4giVMvNP4pBa+iwI9UG9OSQW6bcy1RbRHXCVm4UqziH2S46lGRm
	tHH6LCQSjkiU0oKL7W+DeyNT8UtlbDB+RE6DZ5+SUOz6m1cvyDuuKLNkvPPZvKRco7l5arD+mv566
	KVpWHoa/po5ZNhlNuBgzsD2b6B/BScquS27GPCCV08WYRMAEbOAr1Gor+VE7UJ0YbaqPSO8GgHP0G
	L6fCiwAB5BqjUf88Jdc/dEdrGQ5x7p7igeb97LczQNwwR4BuLeauiTayCmyuqjDp/XNhSw0XtE/X0
	pv6yeQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKxB-0000000Bfuo-1PCZ;
	Thu, 03 Jul 2025 14:30:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJXg-0000000BQ5j-1LYP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 12:59:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751547594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RPqm9+gCQ4G++ODNHAXi9UZv0hvANLxxg7IJ6626syU=;
	b=ips3eZh1GUQUnfBZPK2trC3QAtSuhCGtuyI0m1nwI6QenIRR2p3V5keVpCLm8RXCHQJzKs
	ybqBmrAgZH6MGuh+yoxObsE8B5gSu57PvAMoclYiDvonVjEPK0po48LQXfAJSUyZLvux0t
	uQgXq/DNY9MvLFhhwtmPl2yIUjLCU/k=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-efKEIKrZNIWAz5ccHYbQwQ-1; Thu, 03 Jul 2025 08:59:52 -0400
X-MC-Unique: efKEIKrZNIWAz5ccHYbQwQ-1
X-Mimecast-MFC-AGG-ID: efKEIKrZNIWAz5ccHYbQwQ_1751547591
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ade6db50b98so471658466b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 05:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751547591; x=1752152391;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RPqm9+gCQ4G++ODNHAXi9UZv0hvANLxxg7IJ6626syU=;
        b=g/jYh+L9KxExuyWOnXU9Voc1Ku0G5tZ5PgvcjTYzRYfCQMo798fPUC6XT7ckFhGkZK
         ZHkGOjBp4enM/PHmFGhJ9NgTXBGEedMFZ9BjicQxiLKtdPRZarB9+ECLCWdTlM6aBjPi
         Wi54NGB+Z+OKtj95wqlOcdWWCV/UrsJcI+51wZhVAKMztDkL4OHsUi4/eTxo1u6aCBWr
         TW1an1L8T0wLGZkHEuMBzYdqbp+G1imuDZt5d8o5CuOYILVQinYq8l0J+F3D+Bum8gv/
         mYSiFN3B6zdmUMpqhFmI5XEoXJP2N4d6clP/pjDnvxks0tJWr1kJ/6WRu2eVoaWdftH+
         6hzw==
X-Forwarded-Encrypted: i=1; AJvYcCXvXlqdj90pKEODB91QTgNvpW4YIW+ehsbBl6aOgz53lWfwnZ4pLhJz+BDEbUEKUB9Qj41K81F03Wpg7tdePF/e@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw37stCl+xDo71ZbqyDennyh9GqEVrLdMcTtcdHM8brmH6fGB6
	nVWHyk6TioywLovAuwHiixMwfbk2CSs8oNUKFN+qd/sqzNwLWetWYntD9t0D4ehYZYeq2fj324g
	RZfvnDyMoAlnh1a4ApIDDtralOlXvppUkJbGRu8u1MH+1IvxfVrfwoNVzo+xQcFcj/eITGkCDoH
	8W
X-Gm-Gg: ASbGncsOG4UaEwIL0f2WgzyIzpE7k0FpeBXFwQx4d1a5RqNsqJeVNWHypu8tRhgpVcf
	6fNO27/ad6+MnDSN7egb7qEvNH89Z0m8Vv2z5jEWam48E4LtuyeoqWJNv1zEN96c1k3u9T7Lg6i
	e4pjEGPDd/2rP4RzZYU87PR71nNJSlcwWFD00sQ22w0H6fADiJBnPJ8Ddm4qhcGOkzpydQvrreY
	M8z92xMLemsBYDF4uHPJ5cYHoTxLU5I7PDiwtxRqFlm4/kiFGkRQjSSKsqIZo6o1KJN9aKcvIWr
	VujGGzCKZK3CcD3nHk0w+1NEEW1oOMKrnDfhm/2X6cD2
X-Received: by 2002:a17:907:e989:b0:ade:42a7:dad2 with SMTP id a640c23a62f3a-ae3d84f7bdfmr291461566b.33.1751547590638;
        Thu, 03 Jul 2025 05:59:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC0vmyCUfKNh5+RJRYCTBoX/Ahh5v1AgHscMOi05wRVFGjPHp+ArXAFWzQGHk5tNdxXoWaiw==
X-Received: by 2002:a17:907:e989:b0:ade:42a7:dad2 with SMTP id a640c23a62f3a-ae3d84f7bdfmr291458066b.33.1751547590098;
        Thu, 03 Jul 2025 05:59:50 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bbe3sm1258053466b.118.2025.07.03.05.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:59:49 -0700 (PDT)
Message-ID: <46474fc9-cf31-400d-aa65-d7fc013e6274@redhat.com>
Date: Thu, 3 Jul 2025 14:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
 <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
 <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
 <aed58edc-88c3-47bf-8cc3-bb8d80c4e221@arm.com>
 <d54cf100-3c74-450c-a7d1-8fedbc97bdb8@lucifer.local>
 <3ce333ae-dae2-4341-83c5-39877b6f2bd4@lucifer.local>
 <1d1312e8-325f-404c-9ea4-03b38ed7b1e1@arm.com>
 <9c7a0541-219a-4ea7-a7d8-83aaee992b1a@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9c7a0541-219a-4ea7-a7d8-83aaee992b1a@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kyH227TNibe-ma69SBmlbanLUv993h8eehuAXnmqnUg_1751547591
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_055956_442176_7577E3AA 
X-CRM114-Status: GOOD (  17.41  )
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

On 02.07.25 17:22, Lorenzo Stoakes wrote:
> On Wed, Jul 02, 2025 at 08:33:39PM +0530, Dev Jain wrote:
>>
>> On 02/07/25 4:02 pm, Lorenzo Stoakes wrote:
>>> On Tue, Jul 01, 2025 at 02:40:14PM +0100, Lorenzo Stoakes wrote:
>>>> Let me fiddle with this code and see if I can suggest something sensible.
>>> OK this is _even more fiddly_ than I thought.
>>>
>>> Dev - feel free to do a respin (once David's stuff's landed in mm-new, which I
>>> think maybe it has now?), and we can maybe discuss a v6 with everything else in
>>> place if this is still problematic.
>>>
>>> Ryan mentioned an iterator solution, which actually now seems sensible here, if
>>> fiddly. Please do try to attack that in v5 to see if something's workable there.
>>>
>>> Why are computers so complicated...
>>
>> Sure! I'll be out next week so the mm list can take a breather from my patches : )
>> My brain exploded trying to understand your and Ryan's implementation conversation,
>> will read it all and try to come up with something nice.
>>
> 
> No worries, it's actually genuinely annoyingly tricky this... :) we may need a
> few more iterations to get there.
> 
> Really the underlying issue (other than inherent complexity) is the poor
> mprotect implementation in the first instance that makes the complexity here
> less easy to integrate.
> 

I haven't really scanned all the discussions yet, just something to keep 
in mind:

In the common case, all PAE values will match. This is the case to 
optimize for.

Having some PAE values not match is the corner case, that can be left 
suboptimal if it makes the code nicer.

-- 
Cheers,

David / dhildenb


