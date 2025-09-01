Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC874CA1000
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 17:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQf4Reiy5apT64tfdgfETW33d38jjuSty8SoNlXS3hY=; b=pRH0Dwp80W6Bem1i/lWEqSwmsE
	1B4YqydxJRFcW8n4oDutS0NbcVxcDtdExJWsLlzYpaiRQqQvSx0YhrcevmUVSxyTqwgtqawCAw54O
	WCDBTgNjmw237MkkFj0s1cTKlaasmaro5mkpcxSCwPl+HRAxkPrpsj5L1IuuYvaG+sf5rjAY9Ir0x
	dbHYVG2rP79Vqpf3Su935F4eEWhwdcD+yM5irGGDXUDFt1QG7bF34GzSS6XSoeN9shGo03JH0Z2sx
	dQw/za90+Y8+DXGH8/L5GLiTQNb3BKua9BNjnjTtm5uAct7emGklUd5mNKHUDpwJhgPBw+AV+tWp0
	e/RcB2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8lT-0000000DVfp-49uM;
	Mon, 01 Sep 2025 17:56:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5kn-0000000Cs4A-0J8q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 14:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756737807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZQf4Reiy5apT64tfdgfETW33d38jjuSty8SoNlXS3hY=;
	b=he83A8Hr4oZxw6L7xZYUs5O56bNktzRy1zVWXInnzvHq6lU9BSaZhxS71R1yPfCC7poltk
	ul6uyxGnyjxq32PJhu5YntHb/ow7v59L9W+f9sCh3+ZnLuZG3Xws98WHMAAlh5yYtopkff
	zsQh8SlOPC6LGLSZi1jId1Np6uy00LA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-iwFLhbd9MzqESP-4jhpUfA-1; Mon, 01 Sep 2025 10:43:26 -0400
X-MC-Unique: iwFLhbd9MzqESP-4jhpUfA-1
X-Mimecast-MFC-AGG-ID: iwFLhbd9MzqESP-4jhpUfA_1756737805
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45b869d3582so9646675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 07:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756737805; x=1757342605;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQf4Reiy5apT64tfdgfETW33d38jjuSty8SoNlXS3hY=;
        b=e4/zRs/b66IvicmAEBrM4AeOAp5jwPt/WbBDfo/lDNwcqv02/LxhOQNMc/Ewu3hdgi
         iVjjIdpwTL42o8Hql5N0gbpZHAPPjqk4nP9GubFTTwfQ926fW+N5RoOCZkdMQI1NvBYa
         ZjUEeDCfhoEynutP0VpDO4KjuJRLnYnAdZpRB5Azf07kwwCZqvN6xFseJOuj0LDYetEH
         6YvUSnOXnB/uX9PXfid7tZ9sIcC8uSME6BZJnkIuCoPRTsecOeHpmmT0cqlM6WY0quYr
         /JWCNcova+Nl8aw25Fc6AHb5T5sqjFXdmabNAM9ioQws7bVQhZcMi1Q2FnkAC1x/HvrD
         uspA==
X-Forwarded-Encrypted: i=1; AJvYcCUo5t68+ikd73Z0eWUHKc/dzAHL26iRs3TMOOM0vKFVOBssZn0mPy+3YMdqMxVKDn4z3nhWwKgIXR8ObteDZn3v@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu0CnZcQ+RXPrizv8IKAE2WK1mKfCWLcIHdInJ+6SoFO97V3z+
	XY3CakwyzvGtFzcL1n68L0vcT/3eYAg1vNYcp2OyDft2kLzsLJRATbykbuXqmVYB9rmDbAP9/kw
	TOwe81L65wc9MwUOFUdYjOgJZWpEXRxRHPUxGCUPuyDTNX4wDFfnbFF6k2ytW+AYWjjn9lal94o
	KR
X-Gm-Gg: ASbGnct1yOfIvEJHCfPbx+2c5zGnVTpMLvQUGXjOhb9fjZRmRpCirxb0fJZmiy2hS/k
	ZpLzPS5HP1F/YQWg10aFUL3kxCIQjKjxtwjzZ/fzDNVlGY0wDgNuNy68tOBT9AaaMkXfjCK3r/I
	aOmsVO/X8tsdYw41GrEtMY1uSqZ9TuZxm8kXKu74z7bT9JxVxmgVc1VNYvZWl8JVkzJH1DSFgOi
	mBqBMstDyUD9QmkG9R+v8ZGVD5yk4qjr6VMq3QpFSVZghSBpX0+m3VI0ZHdS2J4Yp5/P3dY490Y
	ujqCBr5W1yY/xkdwU4blqFwk4cCLeeI7eWD/PmASjnEPqhNbsPSTuRZzGgYgYHAW1Z2Z3xAOimT
	TtY8ldc/6Z1YjojR5/ARGCXj/C+uBbc+DK6imn61eXxkU05tRuaoKzh8nUDspNgCHXgE=
X-Received: by 2002:a05:600c:3b9d:b0:45b:8a84:503b with SMTP id 5b1f17b1804b1-45b8a845256mr54590865e9.31.1756737805320;
        Mon, 01 Sep 2025 07:43:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQRfn5sR/77vqQEmdzkbnhL4QNlRAOrqr4TrvFYBM6bDd/eneSMeY2Ldu8ZaHvy16wvsmCiw==
X-Received: by 2002:a05:600c:3b9d:b0:45b:8a84:503b with SMTP id 5b1f17b1804b1-45b8a845256mr54590595e9.31.1756737804892;
        Mon, 01 Sep 2025 07:43:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b38fcfsm53262385e9.0.2025.09.01.07.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 07:43:24 -0700 (PDT)
Message-ID: <e2620083-656b-4af1-91d5-6452eda2e4a7@redhat.com>
Date: Mon, 1 Sep 2025 16:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] KVM: Documentation: describe
 GUEST_MEMFD_FLAG_NO_DIRECT_MAP
To: "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "ackerleytng@google.com" <ackerleytng@google.com>,
 "Manwaring, Derek" <derekmn@amazon.com>, "Thomson, Jack"
 <jackabt@amazon.co.uk>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "seanjc@google.com"
 <seanjc@google.com>, "tabba@google.com" <tabba@google.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "will@kernel.org" <will@kernel.org>,
 "Cali, Marco" <xmarcalx@amazon.co.uk>
References: <786503d6-e58d-412a-a17b-f5e4e481c3fe@redhat.com>
 <20250901143000.5017-1-roypat@amazon.co.uk>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250901143000.5017-1-roypat@amazon.co.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qW2-5dT0o-83ufT_JMMcRpiKgkw3oD-D2eHN-6RE3aw_1756737805
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_074329_190064_0E90A186 
X-CRM114-Status: GOOD (  17.02  )
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

On 01.09.25 16:30, Roy, Patrick wrote:
> On Thu, 2025-08-28 at 11:27 +0100, David Hildenbrand wrote:
>> On 28.08.25 11:39, Roy, Patrick wrote:
>>> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
>>> ---
>>>    Documentation/virt/kvm/api.rst | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>>> index c17a87a0a5ac..b52c14d58798 100644
>>> --- a/Documentation/virt/kvm/api.rst
>>> +++ b/Documentation/virt/kvm/api.rst
>>> @@ -6418,6 +6418,11 @@ When the capability KVM_CAP_GUEST_MEMFD_MMAP is supported, the 'flags' field
>>>    supports GUEST_MEMFD_FLAG_MMAP.  Setting this flag on guest_memfd creation
>>>    enables mmap() and faulting of guest_memfd memory to host userspace.
>>>
>>> +When the capability KVM_CAP_GMEM_NO_DIRECT_MAP is supported, the 'flags' field
>>> +supports GUEST_MEMFG_FLAG_NO_DIRECT_MAP. Setting this flag makes the guest_memfd
>>> +instance behave similarly to memfd_secret, and unmaps the memory backing it from
>>> +the kernel's address space after allocation.
>>> +
>>>    When the KVM MMU performs a PFN lookup to service a guest fault and the backing
>>>    guest_memfd has the GUEST_MEMFD_FLAG_MMAP set, then the fault will always be
>>>    consumed from guest_memfd, regardless of whether it is a shared or a private
>>
>> WARNING: Missing commit description - Add an appropriate one
> 
> Admittedly wasn't sure what to say that wouldn't just repeat the commit title
> or the contents. Maybe that just means this shouldn't be its own patch. Will
> squash in the previous one (same for PATCH 11/12).

Very right :)

If there is nothing to say then probably everything was already said 
(other patch), lol

> 
>> WARNING: From:/Signed-off-by: email name mismatch: 'From: "Roy, Patrick"
>> <roypat@amazon.co.uk>' != 'Signed-off-by: Patrick Roy <roypat@amazon.co.uk>'
> 
> Heh, my git config only ever uses "Patrick Roy <roypat@amazon.co.uk>". Not sure
> where "Roy, Patrick" comes from, could it be the mail server mangling things?

Good question. Does it only happen through git?

When Nikita sends through amazon.com[1] it seems to be fine.

But when he also sent through amazon.co.uk [2], it's also messed up.

I suggest contacting the amazon.co.uk admin or ... sending through 
amazon.com :)


[1] 
https://lore.kernel.org/all/cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com/T/#u
[1] 
https://lore.kernel.org/all/20250828153049.3922-1-kalyazin@amazon.com/T/#u

-- 
Cheers

David / dhildenb


