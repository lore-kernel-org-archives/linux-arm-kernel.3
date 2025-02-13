Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDE6C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fujQcuDo9J87ofsx+TLKXGXGbfi37HBSQ8k+8GDOCTs=; b=ENbUnBcfrpUwDz1aYQAMOlWR43
	Nz1W0/oIGBYH7wQGx9zjswFfTwkvkWyn+glD8Q2v92C6wMTDaaTBnWx4aite3+KjZ0cZVsY2Qyv02
	cEwmgADyeFPVPisQGm3MUCnR9Rlr2MyTNqWy22+CM5mK0i/9t25M+G4NFubLwcFfdZL5WWyP84Uuz
	fr+cOtJJaU/GG8BeThVOxMNj1SK84EnMhyStv7AKOJ5plI28svWJ06554/Xz65oMEh/omb2teIH8i
	ZkAtVnLCmZjQpKS+dKUpGRIBN5gdLm8Z8QPQZan4w5ilXoPpzTFGE6inmQ6JxyeuUMCPN+tHEl/uo
	SCta7S9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYpz-0000000B4qi-3HvO;
	Thu, 13 Feb 2025 13:01:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYoY-0000000B4UQ-2N3l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739451573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fujQcuDo9J87ofsx+TLKXGXGbfi37HBSQ8k+8GDOCTs=;
	b=FpwoJIqwV5VFa3kaglMqNtjQid2Eypp1ax6/diV9l3ZWtOn+BDsELDPm1JcuD+xLNfJBW9
	APMSQy9DwLNyORHHx56Y4ZvUvjjRhmLZIniOgXL4xss6lgMPsIavX/Yvu7HsMTc2tkLQwW
	Sx8NT4DqZaEmMDXTdMcYCTSlJ1Yjuss=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-GFmTf4JoODOYCFPRENb3Ng-1; Thu, 13 Feb 2025 07:59:30 -0500
X-MC-Unique: GFmTf4JoODOYCFPRENb3Ng-1
X-Mimecast-MFC-AGG-ID: GFmTf4JoODOYCFPRENb3Ng
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38de11a0002so857553f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 04:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451569; x=1740056369;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fujQcuDo9J87ofsx+TLKXGXGbfi37HBSQ8k+8GDOCTs=;
        b=oWF0AS33aoOqOqUsNSIcpvUL3FlBl58y3GoYaUmwim0FUx4bdQ6OYZB5CPa0crYz/1
         zD8FOODOS59ULSekpmAL9jyYZv57z6Rx46Cv9oZ92tkf/zNmH8iSL3qfAP9eNIsWKj4M
         Ltv53sDWJeOvl89p527eRkPiV+vnfr3Fv/bLx+MUv1N573qa/NA7Skqrt3szWOAbxKNr
         ghWIa/COGE11i9BOMGKHDGMHh/4eDJl8fY+AeZYcS3nHu0kzw0DJ32LuaN2xh10Vye7f
         0XySq7NvxH4DyJCnthiZ329Q0Ctsc6SYPw3n8GvRf/gbeRIcwWk+LD4CVSn/2AF8/ypb
         JYlA==
X-Forwarded-Encrypted: i=1; AJvYcCWIpUrxd8PWSBbn1b4/TJklzjcXTuKk5hQJt9sZmx3gsq8gYnJ1KipLbDFL9Jz+mlCfAXAdqPntsw/28DOSN91T@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2YQIPCqfAI9QDsE6aw67VMffawTZm4diBk5S273tDNWfHAD9C
	leuriqHSjAh0pUvG1cyHR4+JscxGnxpONNwVPutb2OoOX6R+pSh9oYRFOyi01qDbH3yC1Om1DvO
	3A+zkIxpeW4eoDbUwyh514H7cC0jVL1wSk22Fc/yjkhPM3fI4pt6znzs4RRyalbpIS7yhayZX
X-Gm-Gg: ASbGncuQyguZ6bG5MedjNWmCXNg/YRBjj1Dyk/ZqohnFLQTWWKhEFxknFFjxxYNqiZR
	cBrf2g/W6446pAMz9Wks0CY29vLBiC+ITZ+BiNMW7jr5VzQs4NUc4HRMmkIG3YMSBqmqL9nSuoT
	3CrW2eYw6NtLFIcYSVtjbI0UO6zHOO7YIf0q/kABM5cjGBVMErNldcsVfb1PF+aPh7jpj7usG4h
	f6hIr7FejB58BFuPNP5Vpp9E4ta225YYB+TrdwiHDxwXWF/T4ebrL3ahm1mhzBQsLUNJmQ8jRID
	8bTGPYqvBysRmkPPyHjxh8UfbroJ/T58KS+S0mfiEccZh0tIZgKGXv4as0n03EVHjz0JdBU0xeq
	8yYGdJxXTedxUsnxyQ4xq1q8c8R/uew==
X-Received: by 2002:a5d:448f:0:b0:38d:b28f:566e with SMTP id ffacd0b85a97d-38dea271a35mr6486132f8f.21.1739451568903;
        Thu, 13 Feb 2025 04:59:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxZ8Mqp3ocRrEcmNJLaftIa8GhH9BoSzacpHhP8FrLdFX3M0pWiywCH3wHnjAaCJoFenB1+Q==
X-Received: by 2002:a5d:448f:0:b0:38d:b28f:566e with SMTP id ffacd0b85a97d-38dea271a35mr6486103f8f.21.1739451568547;
        Thu, 13 Feb 2025 04:59:28 -0800 (PST)
Received: from ?IPV6:2003:cb:c718:100:347d:db94:161d:398f? (p200300cbc7180100347ddb94161d398f.dip0.t-ipconnect.de. [2003:cb:c718:100:347d:db94:161d:398f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4396180f7d6sm17145955e9.17.2025.02.13.04.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 04:59:27 -0800 (PST)
Message-ID: <9bc91fe3-c590-48e2-b29f-736d0b056c34@redhat.com>
Date: Thu, 13 Feb 2025 13:59:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: mm: Populate vmemmap/linear at the page level
 for hotplugged sections
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>, anshuman.khandual@arm.com,
 catalin.marinas@arm.com
Cc: will@kernel.org, ardb@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, joey.gouly@arm.com, dave.hansen@linux.intel.com,
 akpm@linux-foundation.org, chenfeiyang@loongson.cn, chenhuacai@kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
 stable@vger.kernel.org
References: <20250213075703.1270713-1-quic_zhenhuah@quicinc.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250213075703.1270713-1-quic_zhenhuah@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0exRFWZP7CMADoo5g0SWAREGpxJeDb78sPVwR-V6_EM_1739451569
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_045934_681002_EF0EA413 
X-CRM114-Status: GOOD (  13.93  )
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

On 13.02.25 08:57, Zhenhua Huang wrote:
> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
> to 27, making one section 128M. The related page struct which vmemmap
> points to is 2M then.
> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
> vmemmap to populate at the PMD section level which was suitable
> initially since hot plug granule is always one section(128M). However,
> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
> existing arm64 assumptions.
> 
> Considering the vmemmap_free -> unmap_hotplug_pmd_range path, when
> pmd_sect() is true, the entire PMD section is cleared, even if there is
> other effective subsection. For example page_struct_map1 and
> page_strcut_map2 are part of a single PMD entry and they are hot-added
> sequentially. Then page_struct_map1 is removed, vmemmap_free() will clear
> the entire PMD entry freeing the struct page map for the whole section,
> even though page_struct_map2 is still active. Similar problem exists
> with linear mapping as well, for 16K base page(PMD size = 32M) or 64K
> base page(PMD = 512M), their block mappings exceed SUBSECTION_SIZE.
> Tearing down the entire PMD mapping too will leave other subsections
> unmapped in the linear mapping.
> 
> To address the issue, we need to prevent PMD/PUD/CONT mappings for both
> linear and vmemmap for non-boot sections if corresponding size on the
> given base page exceeds SUBSECTION_SIZE(2MB now).
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>

Just so I understand correctly: for ordinary memory-sections-size 
hotplug (NVDIMM, virtio-mem), we still get a large mapping where possible?


-- 
Cheers,

David / dhildenb


