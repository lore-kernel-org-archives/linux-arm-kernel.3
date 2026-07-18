Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB7AC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tMDcOMCOuv2/S1kjEybtD3qi7le2Cks8fYUJXxydzs=; b=Fmu/4Vj1tsLR1rmFhrrTTvOYW2
	6rjgDbai+5t48XNWEYnZifP8oUT7ifQtcdoBFAfTnx6ckZc7dWjuLV+bEoL0I6KKar6JMPPohT6pm
	T0O/Ikuza43abHUGNKMOQoyppUkghvgngdTX5kTPAiDOXXs9qVGpa5hgni4VMhNoYvugXyTZI0RFc
	bQc83uiaAffAjqj4Rx6eAkabrdivtMQaxMgtsAMcPPVuj539RnS/okcRoHsLYot0jxEXIkMdu95Sy
	ejunFbf8SktN0d096p75GFIpuD9+lGqh/4wa6xdcsHDz7CqYgyJubW5vf0n0847igNUqqXiwjO3yr
	G3nWDgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0aT-00000003u3l-0DuK;
	Sat, 18 Jul 2026 08:39:57 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl0aQ-00000003u2w-1Gz4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 08:39:55 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f6edffd06so88070f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 01:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784363992; x=1784968792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tMDcOMCOuv2/S1kjEybtD3qi7le2Cks8fYUJXxydzs=;
        b=GNzJYiTRFhagk7rVSF2og9KXgh7inIVEVsD4cwVGbfgYnBL6t/P7bwA9swNceyQ/yu
         GMo/0foNki4Wq/+bEaZtybgNyIf4EXlf17OYTe5KIA8jb18G29NtDfyXov+vYKQBONoS
         HetXIIBpyK8DWHqxd8xvAgSmipmek9fduVycGoUE4QffyD+MZ9cSitgYwMwgY6G8pwjM
         yN9FW2d/+aHOOa7KDxuUFjIfX/+aARCKgGeBIgxuMhqBzbjpr+34GKF3TkhD4U0t7QCT
         3HgR33ViTv1R2UJWad7Cqcfz/2r1fQGOC4/isLFrOQs/9YFNQrfajA2VemHc+UuQmR6e
         Sy2w==
X-Forwarded-Encrypted: i=1; AHgh+RqxZjxetdiSILOLbZXm9uCazkOErOcmRUVtaaCblDMhgnXMoLZYwILjo/FbApxCO333F7Nske1ozqUntBpmtkGg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+AkhEa+uT6e0b5RyEuLXlFyGtIy3ro402r3wWS2F4BKRGFX3f
	ymmjYm7yfAx2GXAw3SQELxIy0btaH8Gysg1+HTtoeuUVZXn4PYnTIK3x
X-Gm-Gg: AfdE7clCjmu2+dJ9OOLOyKnt+eyPrPKNEmor5dtNJRU9s1zvqNESi3w8Zp4Jb2jZS1B
	8tVUtlPQcNU/TOY98wv5MUvxZ6/kmspbPruLQ9WIFppcLO5WOrv2QYtq6l1lyuygJYj2SuvMRDK
	XjaAQTTOYG0FU3MCny6/2gSJ74Q+07UwZBe55m7byQShujbRHafbmBiAZnk/ZzpYNtQYOxZdEli
	rfnsoNWV/Yb4mxk+6ZvE4CroQzFNEauX2x5HYnAbmhZK8ZLJi0AObJVGLHHuEZyYzMKFFEKGPyL
	TrYU6rU5rVPX8qsZLEY1q3Pjca7WX056hJ76iabHb0ErbCbtlsbiLtnr/SBiPi6tFaYN4JNtUY0
	iJrgbAvIfPJc5r2hWLl/DBWEVC9F/71usiTBgTfSbQNR0YMd0+bdMC8hwagdDjk4icorF68w2Xf
	jHNealOAVH1HqGiT5+tdJkLZWg29G/S+mbkCQrnvSG5ZrmqBwsT5ZbWKunTgOsOB9FbPOODcuI6
	W9/jBa8lQ==
X-Received: by 2002:a5d:458c:0:b0:47f:45b1:128c with SMTP id ffacd0b85a97d-47f6233eda7mr5267829f8f.58.1784363991641;
        Sat, 18 Jul 2026 01:39:51 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eddd27sm10661708f8f.28.2026.07.18.01.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 01:39:51 -0700 (PDT)
Message-ID: <57f5675c-8bcd-4022-978b-9f7933bb0032@reactivated.net>
Date: Sat, 18 Jul 2026 09:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] iommu: Add Broadcom BCM2712 IOMMU driver
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
 <20260712221125.GD1835788@ziepe.ca>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260712221125.GD1835788@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_013954_366186_EDC0D52A 
X-CRM114-Status: GOOD (  15.76  )
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

Hi,

On 12/07/2026 23:11, Jason Gunthorpe wrote:
>> +static int bcm2712_iommu_map_pages(struct iommu_domain *domain,
>> +				   unsigned long iova, phys_addr_t paddr,
>> +				   size_t pgsize, size_t pgcount, int prot,
>> +				   gfp_t gfp, size_t *mapped)
>> +{
>> +	struct bcm2712_iommu_domain *mydomain = to_bcm2712_domain(domain);
>> +	struct pt_iommu *pt = &mydomain->pt.iommu;
>> +
>> +	return pt->ops->map_range(pt, bcm2712_iova_to_offset(mydomain, iova),
>> +				  paddr, pgsize * pgcount, prot, gfp, mapped);
>> +}
> 
> These ops should not be present, the iommpt provides the ops directly
> through a macro;
> 
>> +static const struct iommu_ops bcm2712_iommu_ops = {
>> +	.identity_domain = &bcm2712_identity_domain,
>> +	.domain_alloc_paging = bcm2712_iommu_domain_alloc,
>> +	.probe_device = bcm2712_iommu_probe_device,
>> +	.device_group = generic_single_device_group,
>> +	.of_xlate = bcm2712_iommu_of_xlate,
>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>> +		.attach_dev	 = bcm2712_iommu_attach_dev,
>> +		.iotlb_sync      = bcm2712_iommu_sync,
>> +		.iotlb_sync_map  = bcm2712_iommu_sync_map,
>> +		.flush_iotlb_all = bcm2712_iommu_sync_all,
>> +		.free		 = bcm2712_iommu_domain_free,
>> +		.map_pages       = bcm2712_iommu_map_pages,
>> +		.unmap_pages     = bcm2712_iommu_unmap_pages,
>> +		.iova_to_phys    = bcm2712_iova_to_phys,
>> +	},
> 
> Then use something like:
> 
> 		IOMMU_PT_DOMAIN_OPS(bcm2712),
> 
> To define all the page table related ops automatically.
I don't think I can use that because this setup uses an IOVA aperture at 
base 0xA00000000, whereas generic_pt assumes it is managing a 0-indexed 
virtual address space. So the driver has to intercept every incoming 
IOVA and translate for the aperture, see how map_pages calls:

  static inline unsigned long
  bcm2712_iova_to_offset(struct bcm2712_iommu_domain *domain, unsigned 
long iova)
  {
  	return iova - domain->mmu->aperture_start;
  }

That's why I also set is_iommupt=false. I will add a comment to make 
this clear. Let me know if you see a better approach. I was wondering 
about making iommupt understand apertures and translate accordingly, but 
I imagine you would want to keep that kind of thing out of the generic 
fast path?

Thanks for all the other feedback too - working on it!

Daniel


