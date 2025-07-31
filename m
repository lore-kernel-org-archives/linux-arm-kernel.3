Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB9CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JJijs4W2vHC2VDBttSaecYsyLQnG1kUwLx2TkZowLU=; b=ESpkgbONITbMo+SbSDikBwxD0j
	0khMop7fuV5bXo5relK+rK4Dfun0uNm3uCC+qDi8tntxwDkPGxxVVUNoATdHiyaOocDVY63ouaYvi
	S7py+AOySwn9biHg9Dj2LmTZu9KOzTaY7BYjWzdSuwrd/d0cEt+hjSqKmrwa0cYmEI7GBRmCwyXm7
	WGw+haZ4ATijJRfzWDfx4L3YZAw9B/D7tdaJVtco5r+VyN+LkiLCvAYTy7s8qrNM7hx0NROtZEwjw
	x4hTY5pTsYvUR0awpqYcdISLW6lUlJElz9fQG3OdV0uPZMOEy6Xq5+BPl+Oq56bp8LORSWYLQWg1+
	b1Z2Vp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOMJ-000000038BX-0g6W;
	Thu, 31 Jul 2025 08:09:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOEk-00000003767-20sI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753948921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1JJijs4W2vHC2VDBttSaecYsyLQnG1kUwLx2TkZowLU=;
	b=gdlKeNwobwp7tiH5vRFPtjY21w2Z7+r3ozjqTM4WsuLvHFUz32AwTGwIaBDWlqfFOXF/35
	fITF5p1ekLM/fAnV1cVcV32FLjTPujyQbSobBeeKuZ/B3U4g1fQpV3t7zYKOJL/s0D7YmS
	lClpG1E6AZrul3l9MtZJDLPywi4pUlc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-sdcDgcOENsK95D9PDHK4cg-1; Thu, 31 Jul 2025 04:01:58 -0400
X-MC-Unique: sdcDgcOENsK95D9PDHK4cg-1
X-Mimecast-MFC-AGG-ID: sdcDgcOENsK95D9PDHK4cg_1753948917
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45359bfe631so3040075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753948917; x=1754553717;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1JJijs4W2vHC2VDBttSaecYsyLQnG1kUwLx2TkZowLU=;
        b=HQzchn5/mYLJSw+An9ocHchcAQNw3HPYXyUwAyvOmlmGYc2B9QWLuoXZJfXgJ3hKa2
         OJ/BCTWoLgK3UXKAxKQKOQ/KlHOt8Z/Su/1qU9JQRiy5NhY2Qn2RJY0Hxq35X7/LuiEU
         WIKJKpMBNVonCELssYuAbsQd8qcbr9muUC1RLHfb0+LwjQv7bXJyRCGdBTQ6ysgdqUuW
         prZ5fKSP59k8PL4ncTl5p2TpL0/LhfDAoTuud32AO7AZjkDFyLTjZk4LULowV4np3XI6
         EPF7pVZi3eDh5nGDkVPcBj1vq5e+gFzoJeGzxupNQMMAgT2vAFlOXiWQ6UhxFx+PdioG
         pS+w==
X-Forwarded-Encrypted: i=1; AJvYcCVM06Kyt01+5jirnybkS+JELw+8Z6FzWNMc8fGVkfub3mIhgV+xN5XJGYQj2meMGiLy5O/y9vP8QB/TmQuDw8f0@lists.infradead.org
X-Gm-Message-State: AOJu0YwDJImCpab9uE6mGwduxRr/vwqY9b9qv8ExcEBet4c0YWNBLrgk
	vRg2hJ7IC0HGFklUc9yekSwLZP57/M/oibdWx7fzcMSAni+7wOez/1n4gzqJ4PqtNzvOQ9P1iHP
	ISagMpfcKXmLH9QC0WeSx1JeukgqQkGLFCp66GI+6ZhW/bpTuqyl5GjSL7peON3u+Tkd04J6871
	B3
X-Gm-Gg: ASbGnctlJZ26+cNVV5ioEQb82iMZ3EnweFPjyAJ6YhRz0kjkqns2BJcE5U9OqUoucYe
	SmGySInesYTV8K6Mm99mbtiU0gdKfB0nWs8LKimXBrRezcP9NeH12Y3JQ/wpJYhpo8vc9XWVN33
	j4inas2t684OerVEf6cGuIhXd8ePedHfiwtioS3W9azkYXNenX7N0gmTmWc4dIy9/RFY7xo5UX+
	So6JYCECsH5lTzgoRVZzKPselvpwqweENDFLQwJdwJcCT6IpzDzfhF10Prjt7cbY/x3+bEMcXH5
	LmcUHE34UaE0dNsmK5JcBikpKSnJsoWBGOFzSDDdbQAc0C6x5B1T7cNyidpAULw5MjA8fdqd7sQ
	VH+HHXUILtXDxy8YPOhmOXgNPmo6IWE8c5enwSQLirDslqSE5siuxfqwOHMY3slbg9oc=
X-Received: by 2002:a05:600c:8b77:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-45892ceaecbmr48174755e9.33.1753948916695;
        Thu, 31 Jul 2025 01:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyLz/naDKoYXO0ZrbHzB0TQqBQIY0shm63Y9kIehrjwG6I0rtLZZVVvO3oMjdHoQbbfXbHRw==
X-Received: by 2002:a05:600c:8b77:b0:43d:fa58:700e with SMTP id 5b1f17b1804b1-45892ceaecbmr48174345e9.33.1753948916261;
        Thu, 31 Jul 2025 01:01:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f44:3700:be07:9a67:67f7:24e6? (p200300d82f443700be079a6767f724e6.dip0.t-ipconnect.de. [2003:d8:2f44:3700:be07:9a67:67f7:24e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458a3038121sm10902415e9.1.2025.07.31.01.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 01:01:55 -0700 (PDT)
Message-ID: <33b6deba-a1bb-4515-a659-9822b5b13d95@redhat.com>
Date: Thu, 31 Jul 2025 10:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 15/24] KVM: x86/mmu: Extend guest_memfd's max mapping
 level to shared mappings
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>,
 Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>,
 Xiaoyao Li <xiaoyao.li@intel.com>, Fuad Tabba <tabba@google.com>,
 Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>,
 James Houghton <jthoughton@google.com>
References: <20250729225455.670324-1-seanjc@google.com>
 <20250729225455.670324-16-seanjc@google.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <20250729225455.670324-16-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tZQDPw27J_pU3VHnfgnju5ZqzgO6FnhLXBe397QdgwY_1753948917
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_010202_601217_3AF2F5E9 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

On 30.07.25 00:54, Sean Christopherson wrote:
> Rework kvm_mmu_max_mapping_level() to consult guest_memfd for all mappings,
> not just private mappings, so that hugepage support plays nice with the
> upcoming support for backing non-private memory with guest_memfd.
> 
> In addition to getting the max order from guest_memfd for gmem-only
> memslots, update TDX's hook to effectively ignore shared mappings, as TDX's
> restrictions on page size only apply to Secure EPT mappings.  Do nothing
> for SNP, as RMP restrictions apply to both private and shared memory.
> 
> Suggested-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


