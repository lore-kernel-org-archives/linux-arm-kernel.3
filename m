Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA266C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 05:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWivMhdKEftu0UYa0E3V2EroqMtU5G/tMjhKGK8Rp9U=; b=lPtwPB8/CglmCtJDlGsQFh7+b2
	ES/nbkx514lQskUq/F8kzEV2DdOk7v2WbYK/d0m0G0DaApkjKOpUYA8+Dng50ea5F95ARYN1YpptS
	mR0I9cG6W4g+E2ox6hJXs7QhfEL/7OkKs7trDOm5R8ktn9M3agZsBA56pSRuVOLiyEjoajWDeyO4E
	OjPWf+7j6Lzj74HibWQcUnu0zI8zf3K28o1LSirRk2M9BeqkUGoSYKGRf36dRGgYRq8/FkXDLhIZN
	IC8jLjIRa49hbpFJK29F1wpgBkPt48lhRfTIAKmBtIEpT06B96ZoQDGvuBDvEYrO00vWKkLx46PYB
	pbAhQDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWGY-00000006LxY-2eg5;
	Thu, 27 Feb 2025 05:16:58 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnWEO-00000006Llv-1sxR;
	Thu, 27 Feb 2025 05:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740633284; x=1772169284;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=I69LPokZTV/4dzSJyY6dG46WwI4tfyw0UdAXPNutbc0=;
  b=B7uQ2Gftik/Myjsaxw6OGDsnKSLdRr7wmHID1SEgyjRKEi3N6MFLciSb
   jKgewosvBa9s5NM8geLqITJVhNrXGo+aKfbKgGtc/8dKpGXJicMa2WIDA
   L04JnXM545u7vopBKV0k4sp/cNPPfAv6xGG7Jc9uL9c0KZAAKipR6MVbN
   k+EXaCpcpuhwcFtuoDjS+YELfSIfEdq8LxmKbrHkPHsZz0tmJ99GCb1mM
   qFTNiswVdljmeNKYQsFSxd4qJWQbm8it8Ri1lIMQlae3SqkXio3InBsj9
   eDNykDtGEz6vTXdeGwf4nWnRj5TVDk65UK134J+DaAq1grAdreKv+Ocni
   A==;
X-CSE-ConnectionGUID: ThfU6PZDQkCw61HFjtljiA==
X-CSE-MsgGUID: cqjntFqrQtW3/QG5t7BeHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45287684"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="45287684"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:14:42 -0800
X-CSE-ConnectionGUID: 0+XEwoVFSSChkZxOVV0yIg==
X-CSE-MsgGUID: V/fupo75Q3OaStVprAAz7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="122030732"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:14:35 -0800
Message-ID: <5775de69-9a1b-4b75-829e-60ec958a01bc@linux.intel.com>
Date: Thu, 27 Feb 2025 13:11:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] iommu/pages: Formalize the freelist API
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>,
 asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Hector Martin <marcan@marcan.st>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Robin Murphy
 <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Jeznach <tjeznach@rivosinc.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
 David Rientjes <rientjes@google.com>, Matthew Wilcox <willy@infradead.org>
References: <9-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <6d9ceeb5-581e-48e8-a5cc-100a9699a9e8@linux.intel.com>
 <20250226173120.GA37280@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250226173120.GA37280@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_211444_528206_576ECE03 
X-CRM114-Status: GOOD (  17.26  )
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

On 2/27/25 01:31, Jason Gunthorpe wrote:
> On Wed, Feb 26, 2025 at 02:56:29PM +0800, Baolu Lu wrote:
>> On 2/26/25 03:39, Jason Gunthorpe wrote:
>>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>>> index 38c65e92ecd091..e414951c0af83f 100644
>>> --- a/include/linux/iommu.h
>>> +++ b/include/linux/iommu.h
>>> @@ -326,6 +326,18 @@ typedef unsigned int ioasid_t;
>>>    /* Read but do not clear any dirty bits */
>>>    #define IOMMU_DIRTY_NO_CLEAR (1 << 0)
>>> +/*
>>> + * Pages allocated through iommu_alloc_pages_node() can be placed on this list
>>> + * using iommu_pages_list_add(). Note: ONLY pages from iommu_alloc_pages_node()
>>> + * can be used this way!
>>> + */
>>> +struct iommu_pages_list {
>>> +	struct list_head pages;
>>> +};
>>> +
>>> +#define IOMMU_PAGES_LIST_INIT(name) \
>>> +	((struct iommu_pages_list){ .pages = LIST_HEAD_INIT(name.pages) })
>>> +
>>>    #ifdef CONFIG_IOMMU_API
>> Any reason why the above cannot be placed in the iommu-pages.h header
>> file? My understanding is that iommu-pages is only for the iommu drivers
>> and should not be accessible for external subsystems.
> I wanted to do that, but the issue is the gather:
> 
> struct iommu_iotlb_gather {
> 	unsigned long		start;
> 	unsigned long		end;
> 	size_t			pgsize;
> 	struct iommu_pages_list	freelist;
> 
> The struct is inlined so it must be declared. I do not want to include
> iommu-pages.h in this header.
> 
> Once the struct itself is there it made sense to include the INIT too.
> 
> FWIW I have a longstanding desire to split iommu.h into
> internal-driver-facing and external-user-facing files..

Okay, thanks!

