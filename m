Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF61C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAZ6PoM2yHxT2XxiC3h9Ua+Sq3PY55BOVc0a18RVQnA=; b=S/4hqUWYQof32RxW4Xv/6h5Yxh
	4EEMgEigcArLvAkuOKVPoyq2uS1ONiwG3ZbHZ+7YsRirZupQYgjGJFcs4RWlfqjhgz3SIQx4jcX2n
	BsHMXSN2fln+W03CRlvbwdwkaDWIUNNutIz+/E8ZJpNS6J3bTi+mz7gE4uq3j1dGBEGd/v9C5yeqX
	6asrvxO+T316BRRNnP+8POCa6N1zQU0A7zf56PqayXcK8YhkcKCZeEct3jx62hDz2BciFmPs74zT9
	jf7k8WcXiX461ggVKybbbki6pMaWdRj8ln9PGbIZ2I/+xQ8TTH7p7j5WpMF7icGeTsJ+f+6lOW+VM
	uE/bBeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmZm-0000000DEoq-1EKt;
	Wed, 04 Jun 2025 11:46:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmXg-0000000DEft-3syM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749037463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lAZ6PoM2yHxT2XxiC3h9Ua+Sq3PY55BOVc0a18RVQnA=;
	b=JETNjJcnnGVlg1fuibc1QcdtxCN4msAf6FPeH6FPY1pwvjKjm5fl3JyIsps6gxMoJB+o63
	Q7T3+TcDlNHdPAv3vRXNFxMcqWp7OHnucxTeAtSs5YU6VGcjeuyvPzEKrF6aRuC/brJVIj
	dKOpdIq8ZpFMwriMxL/ciERNchIg/Oc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-Sthdxp2GObaa6sHVczp31w-1; Wed, 04 Jun 2025 07:44:21 -0400
X-MC-Unique: Sthdxp2GObaa6sHVczp31w-1
X-Mimecast-MFC-AGG-ID: Sthdxp2GObaa6sHVczp31w_1749037460
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so4051403f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 04:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749037460; x=1749642260;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lAZ6PoM2yHxT2XxiC3h9Ua+Sq3PY55BOVc0a18RVQnA=;
        b=bEAHUCVXizmyzGXV1BTRZrG+SwrUd4AL81r+1YfgjwOeo0w7ofHWY8pvtpivhr6oeo
         EoooJF5BOkqiG+KUUCs8imlEtmUG+FSfGZHwxsMi/Zn9Hw844mb7AadjCGlyc+HKJSwz
         212LZyi5wZA4foogNy1wUULCOBSOQB6opngRE6FAkSbC5SQaPJbiW6Vj19Ry0Yy+xI1G
         aVKGd/YtbYCOB7P6jV6f9mvkHIRX+kSp67z1uGnGZtKmnEuHw9hS1nLnKuQS09ixr0S4
         jbrMmtYPySpkTNpLwnlNRVoHzIOTokpGwgLljDoQGrSzhjlFMe/oMt+GVjf0voYJ9gVa
         uASg==
X-Forwarded-Encrypted: i=1; AJvYcCX8+1ysoL7V/LwJVJ22BYIqWgsPz5Uuhhw/vaYmKh0osM6T/wuC84yRI4vGfcCVuno3XE8TvDg5z2niMyrO2nuf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrjr37PcybX7X7UQYNJCHt4aGuaqXGKGh9whwLAwcsxuPpVgaU
	L/b/0QlypW01CwPi4Hr92J0DKYZrazmgE7RtxGoeq8ABkvI5MnJmHnynZK9KqoPqZF6DwNFiGlP
	7ysiMPwfKoV2ijjKBuCGxKoS2UPToAyrk0Lp7o7x6SVJ2PjWvP02c9bwqjCp7BChcB7/2d+Zwvf
	h0
X-Gm-Gg: ASbGncv1Dd8JdSyaetRRp538K0dZYZh+d/ebuGBrN2aeypYk2vGfz3fthVdOzULHQy8
	tYz3Oza1U7hFzL58DaeV4TEE+An1NxJigA04dSUgUbyYXdYBdtyyVWveyBIa1boke/ENgqJuYah
	wiOevXRxmCA38wiJg+0LRBxzV7Ji4f/B5A2JWuBFYPe5KSLviCxlzTH8JEzYA9819AThwO5MUni
	exE6B/gCjQjCL1ZzGOU+eQBWXJbxZKNQ38lUEdPYbr8TRp/xl3Nbnpuj20lIAO10ifkQJ02A1Y+
	ZS76LfrCzIXRe3Z8nlMWzHOWMn6TGpe61WKVd5eEEPQgZfElIFEq+F7FbYV1PyRyodTP+hVj1p8
	skR7BHgokV3ig2NapJx7XP0wRCi6l96tUHClb69Q=
X-Received: by 2002:a5d:5f95:0:b0:3a4:ed62:c7e1 with SMTP id ffacd0b85a97d-3a51d8f59cfmr1948553f8f.12.1749037460507;
        Wed, 04 Jun 2025 04:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTk+ZZ/txMdPYiZPbWtN+UTbUQiFhEQ2KYLiZED5o28ZN+uPzMH8V5s47pXStLZWFaTG3UiA==
X-Received: by 2002:a5d:5f95:0:b0:3a4:ed62:c7e1 with SMTP id ffacd0b85a97d-3a51d8f59cfmr1948538f8f.12.1749037460114;
        Wed, 04 Jun 2025 04:44:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451e505c350sm51456695e9.0.2025.06.04.04.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 04:44:19 -0700 (PDT)
Message-ID: <d72c77b7-2f40-4236-8288-e811f82671c6@redhat.com>
Date: Wed, 4 Jun 2025 13:44:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
 <912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com>
 <76afb4f3-79b5-4126-b408-614bb6202526@arm.com>
 <25c0c700-656c-4a8a-8ef1-5093581cf25c@redhat.com>
 <4f97491c-b0dd-406a-9ddb-4f4424571704@arm.com>
 <8c389ee5-f7a4-44f6-a0d6-cc01c3da4d91@redhat.com>
 <92cc1bfb-ab7a-4abc-afd0-49f8f2d12da0@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <92cc1bfb-ab7a-4abc-afd0-49f8f2d12da0@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0sspJ4K-3nUnqAPSPO4khVUzIt90cBrpKeW_sA9PiJ0_1749037460
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_044425_032702_A40F4B52 
X-CRM114-Status: GOOD (  13.76  )
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

On 04.06.25 12:38, Dev Jain wrote:
> 
> On 22/05/25 9:48 pm, David Hildenbrand wrote:
>> On 22.05.25 09:47, Dev Jain wrote:
>>>
>>> On 22/05/25 12:43 pm, David Hildenbrand wrote:
>>>>
>>>>>> ... likely with a better function name,
>>>>>
>>>>>
>>>>> I want to be able to reuse the folio from vm_normal_folio(), and we
>>>>> also
>>>>> need
>>>>>
>>>>> nr_ptes to know how much to skip, so if there is no objection in
>>>>> passing
>>>>> int *nr_ptes,
>>>>>
>>>>> or struct folio **foliop to this new function, then I'll carry on with
>>>>> your suggestion :)
>>>>
>>>> Can you quickly prototype what you have in mind and paste it here?
>>>> Will make it easier :)
>>>
>>>
>>> if (prot_numa)
>>>
>>>        func(vma, addr, oldpte, &nr);
>>
>> I'd probably return "nr_ptes" and return the folio using a &folio
>> instead.
>>
>> That way, you can easily extend the function to return the folio in
>> the patch where you really need it (not this patch IIUR :) )
> 
> Just confirming, you mean to return nr_ptes and get the folio by passing
> &folio, and the function parameter will be struct folio **foliop?

Yes.

-- 
Cheers,

David / dhildenb


