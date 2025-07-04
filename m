Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FCEC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkahBsI5VNxUJE8D/bd1T6fawfYSiY+jT8womBzp5i4=; b=EsEaLjG9YfbqxGGIf+kIcuxIdF
	z6DnHycmZOXyl2gVwwZTEelzqtu+cfjFEgTuSUgEpQBRgH9S5Xt4JA2y2sv5KJFa5csBlNSAaiOWY
	6MmEhrDARZxHrCChxLsV2yyEMZaT9rRCFw3307+OU/G1CisyirZSmtZwJVMxhREWeruX1/6Ly4Fpu
	mCzq6BgULulomBkpDFeP5vsjAESpqOBGiNl+m1icl4UR8Benp++7MlrrduHuVnp0HNlEqH/IbAWj4
	6NGZJH7RMkWvV9yRUkwvk2DLHD/n20BqE27Z7UWPjbRl0QyiONFHC9iujKGDNmi0ATPrm5Dtizgyx
	u1CeKw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfSa-0000000ENf7-3z4Y;
	Fri, 04 Jul 2025 12:24:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfQD-0000000ENS4-0vyF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 12:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751631700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fkahBsI5VNxUJE8D/bd1T6fawfYSiY+jT8womBzp5i4=;
	b=VTeJzmpTIjep0CJ1VMpbaPF4YKcs7XoxLRofqWQdIn+DfF/UOLRrwf75Ngsvi/VfroksiK
	dyQzbCrEnvXiyw2X11TjPAas5awR2O25FPjVQCPZRqnlevC79efIYBsp3yyjVO7SSJCrut
	sAeEmgW/5q7By/sWHCz4KvEf2r9vnS0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-rXkIOYunOYGU-5p7yyvrxg-1; Fri, 04 Jul 2025 08:21:36 -0400
X-MC-Unique: rXkIOYunOYGU-5p7yyvrxg-1
X-Mimecast-MFC-AGG-ID: rXkIOYunOYGU-5p7yyvrxg_1751631696
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4538f375e86so6868035e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 05:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631695; x=1752236495;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fkahBsI5VNxUJE8D/bd1T6fawfYSiY+jT8womBzp5i4=;
        b=ASghUuG96DsYtp28fgbvPckyqDbfvA5fnGxExd7KQIwDG1bQGzmoBfL+PyatZ2yQ9q
         S2uG90jLFTD47QUpV2KqQ5emLfbbnTqJMHTZZj881752onLQBZ4IBEOWAdpe5B9kBUhM
         SEJYwfvGqkgMvgRJMrqGAp/P3d3wKfu7bRF1bsZlGQz8xmqafjUwJ5qj/akFv4T5ytnn
         dRun8YuNxa4Z++xltf1vV1wYPv7Yxi0SSc3VWGACrJqfp6aA8tKVNz/Uy3bdAW6gxHEp
         kKVWQziu645654ge87kpFB1RJhPf4yOKNIYaj4n2qb3p5mc8zqHr73il8yAuT/iyg3mQ
         WGog==
X-Forwarded-Encrypted: i=1; AJvYcCVN5M6knDIyAZqVn+YggJrML0SrMx+/jCAd1D0P56jruPwhU75EbF0v3+QlFPg20yLe0SVpTJ9zz4yFUxLqQkSk@lists.infradead.org
X-Gm-Message-State: AOJu0YzK8NF5wqR4n63AiUuL/kXjZ+/deduuzsID0aUB99F39yh6mEPW
	5fx5O6CRwWRWTGs27IMxZ3jkY0S0rWlWw+ydgZ8N1gjUUngYYKfyVgdC/9g4IEbV0BWgtcMyLSz
	0qG/7NIaKSQjwUHW3RxjxBtCaxVntAra3kR/oW7mgKbqlTGhlWtjMz/kt2NECNr2XExk1A81N0h
	0J
X-Gm-Gg: ASbGncuUOYVeoZOsJOJqobyldaM6XGzffFjtObXWaHXgweFTqQdkQQBISpunYFdU40E
	O94xRJPbNRbZrguGFQN7x/NM3jREpji3pcwrVWXJJNYNS0n60pGNUmq+Oa82x3Datf8P4053WVJ
	n8TFczS4vtu6PkMXMFpGIrzodk7COAb1tKLrs3pPPJsp+/gLEUseoy2+DjfBkcG/ov9DdhgxWQH
	GZnpWetgIBNPX1QJTSCEzccqXGzRSWXVLmSgaPXc0e0a+oOhs/O6uRrOvh7Q7YP8dOuKA/uc4BQ
	Agzr5X5P+cHdTU323IuhM6F21lsGgarWhk92lBSFi7GEohuFMdSjJi3RlcJqr0/4QsMMR10sQ+1
	PAYQf33hcPX2rUv9l0Q3JmZGEzP/Uo23MCyVl7zT1J1jbF9k=
X-Received: by 2002:a05:600c:8b6f:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-454b30b4e96mr28391565e9.15.1751631695324;
        Fri, 04 Jul 2025 05:21:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXg7u6lGXcf+dIc0GhzPq0GsACARq1xT2O67ZRsTnKiJsXkcINlfprRNMS1WIcRgYppep5HA==
X-Received: by 2002:a05:600c:8b6f:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-454b30b4e96mr28390995e9.15.1751631694749;
        Fri, 04 Jul 2025 05:21:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bde3b9sm55238795e9.28.2025.07.04.05.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 05:21:34 -0700 (PDT)
Message-ID: <4b06b163-e1ce-4c20-b878-4593bc86bf53@redhat.com>
Date: Fri, 4 Jul 2025 14:21:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] KVM: arm64: Block cacheable PFNMAP mapping
To: Jason Gunthorpe <jgg@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>
Cc: Will Deacon <will@kernel.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>, Aniket Agashe <aniketa@nvidia.com>,
 Neo Jia <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Krishnakant Jaju <kjaju@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <danw@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "sebastianene@google.com" <sebastianene@google.com>,
 "coltonlewis@google.com" <coltonlewis@google.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, "ardb@kernel.org"
 <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "tabba@google.com" <tabba@google.com>,
 "qperret@google.com" <qperret@google.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-4-ankita@nvidia.com> <aF6hamOI7YVDP1Cp@willie-the-truck>
 <SA1PR12MB7199144BBDA23C9A06DA12F9B046A@SA1PR12MB7199.namprd12.prod.outlook.com>
 <20250630122501.GQ167785@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250630122501.GQ167785@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 37wO_rIjY_vNRiCtZISRImaHpQr4gNlYFv0xPPLWDGk_1751631696
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_052141_339317_F5926A4F 
X-CRM114-Status: GOOD (  14.78  )
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

On 30.06.25 14:25, Jason Gunthorpe wrote:
> On Mon, Jun 30, 2025 at 01:56:43AM +0000, Ankit Agrawal wrote:
>>> Sorry for the drive-by comment, but I was looking at this old series from
>>> Paolo (look at the cover letter and patch 5):
>>>
>>> https://lore.kernel.org/r/20250109133817.314401-1-pbonzini@redhat.com
>>>
>>> in which he points out that the arm64 get_vma_page_shift() function
>>> incorrectly assumes that a VM_PFNMAP VMA is physically contiguous, which
>>> may not be the case if a driver calls remap_pfn_range() to mess around
>>> with mappings within the VMA. I think that implies that the optimisation
>>> in 2aa53d68cee6 ("KVM: arm64: Try stage2 block mapping for host device
>>> MMIO") is unsound.
>>
>> Hm yeah, that does seem problematic. Perhaps we need a new
>> vma flag that could help the driver communicate to the KVM that the
>> mapping is contiguous and it can go ahead with the optimization?
>> E.g. something similar to VM_ALLOW_ANY_UNCACHED.
> 
> I think Paolo has the right direction - remove any attempts by KVM to
> expand contiguity, it should only copy the primary's PTEs and rely on
> the primary to discover contiguity. No new flags.

100%

-- 
Cheers,

David / dhildenb


