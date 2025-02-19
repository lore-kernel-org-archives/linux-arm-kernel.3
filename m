Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA32BC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 03:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnqMBPWhfEqxMu6F1Nwvef2Y64BddATJMWu8Qgb4Fi0=; b=R1OWWW+IcFS6e3Yv8vTETeBr8n
	9cl2dtH9lthaIxTtD7y6k3l5lO3Jx9wvEcoAL9HvhD6wVkG0m50r6BWls1b9VX4Y5UZVdsjt13EFd
	pchSWfZ3B+XlayqtWikjRXwQtmtZBKHz/dGHmLn+53MwaFrO22rnStHdhuQUbF0DRPuJ24xpFy37n
	9S97UDBKbrFoLqs7efyL6tZoLZWDqP52LCqJsD984aF7ryRZyhobBDnCnS6oHoRvYs4OGxTovCrfe
	fjHty5eookXfngau9AjMykgbXOtWrRabxAGZ1s3y8QysNMtIrlfmT4sQUHP/G1+tVuIpFY8t1b9jD
	2+IuSq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkaKc-0000000Ai8Q-13Mh;
	Wed, 19 Feb 2025 03:01:02 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkaJ9-0000000Ai0L-0Oqn;
	Wed, 19 Feb 2025 02:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739933971; x=1771469971;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rOMFbl3z2EdNZq26KKAZFNR9PZtZbOBVCWnC4y2z5Us=;
  b=JVJL4d8+Wpq+RGvwBkbN5os6UU4C1hyPhC1ixWhMypvic3qwUjMGZOfl
   eQcjh0lBTV3kvoe/rxWTSj4lPPn9GPLZhkjn0uB4HRkFgNaOkMIXMS6/R
   9Pt3hhvMAd/OGfleZteI2aQ0jHsqKjrspqIoFB00Ec9gy7jkvpVD43CVQ
   syDUTm1fg7Zk4bWEcRHDeXOdln5KyylV/47md8/hqax1jtTvwmq+pohaJ
   3BHt/ZB2u7qJdaFk7+KhyOreRbnrglFHkSGJFewcyEc/2vBJJFw4JbX5I
   fqiECPiMFwPaI3gDfec+zXXLllca5emvzjwOJiTkwf39i8DWz/efzy1OF
   g==;
X-CSE-ConnectionGUID: QscKp2A/RLeG1LDZXYgI7Q==
X-CSE-MsgGUID: pCYuGqZVRAyuDYS+x4N6yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40515889"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40515889"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 18:59:29 -0800
X-CSE-ConnectionGUID: TBYZGMlXQXKSyTkYi9M/6A==
X-CSE-MsgGUID: 7HleMqibRqa4OaCc6SPD+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="114437430"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 18:59:21 -0800
Message-ID: <25d9f6de-5cc0-41ec-bdbc-0cf5f66743cf@linux.intel.com>
Date: Wed, 19 Feb 2025 10:56:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/23] iommu/pages: De-inline the substantial functions
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
References: <7-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
 <84fd4500-a12c-40d6-a532-e2956ed1c35e@linux.intel.com>
 <20250218201924.GJ4183890@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20250218201924.GJ4183890@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_185931_186648_DA005E13 
X-CRM114-Status: GOOD (  21.38  )
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

On 2/19/25 04:19, Jason Gunthorpe wrote:
> On Sat, Feb 15, 2025 at 04:48:04PM +0800, Baolu Lu wrote:
> 
>>> +#include <linux/gfp.h>
>>> +#include <linux/mm.h>
>>> +
>>> +/**
>>> + * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
>>> + *                          specific NUMA node
>>> + * @nid: memory NUMA node id
>>> + * @gfp: buddy allocator flags
>>> + * @order: page order
>>> + *
>>> + * Returns the virtual address of the allocated page. The page must be
>>> + * freed either by calling iommu_free_page() or via iommu_put_pages_list().
>> nit: ... by calling iommu_free_pages() ...
> Got it
> 
>> and
>>
>>   s/page/pages/g in above comments?
> There is alot of historical confusion here because it was all designed
> around alloc_pages() which allocated a list of contiguous pages that
> could be subdivided. When this moved to GFP_COMP and later to
> folio_alloc() the subdivision is no longer possible. So it is not
> "pages" at all anymore, but a single "[compound] page".
> 
> So the module name is called "iommu-pages" but aside from the free
> list functions everything else acts on a single [compound] page only.
> 
> If you think about it too much it makes no sense but I didn't want to
> rename every function. I tried to keep it so that "iommu pages" was
> part of othe module name, and function designators, but the comments
> talk about a singular [compound] page
> 
>>> +static void __iommu_free_page(struct page *page)
>> It's more readable if renaming it to __iommu_free_pages()?
> Ah.. Well, it captures the module name but nothing it does acts on
> multiple things, since it is internal I used the other name
> 
> How about I rename it later on to:
> 
> static void __iommu_free_desc(struct ioptdesc *iopt)
> 
> ?

No problem. It actually depends on you. Since this is only used locally,
the iommu drivers won't use it. So, anything that helps understand what
it does is okay. :-)

Thanks,
baolu

