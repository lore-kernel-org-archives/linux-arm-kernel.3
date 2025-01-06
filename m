Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86026E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuSdlTrFt2ZgY4biC3TVUKnGHuMFCcIecyWqFtdLMFg=; b=HR4EvkXXzsSuGEbDJ3d+6s4Lgc
	Fgm91pdy34Veuuv0e5tWBtfn3llpCBM8WfiML78fZufes4/kKjaVhzQY0hRuelx7ZKr9wmebBFKZD
	BVxTxUU+hgtsyl0awu4R3psjYMzLdHYnfkvxLaMxGqV6/CFuTGzWDc4VhHpQwmh127Zx3aw6Ppfn9
	WkhHMK2bN9rTzdRytv7Z/a039WAUYy3Oz0UBtr1L3/F59u0uQ6+Obg+1iXYd0PZI73WIfGx1LAUvf
	1KGYOrqaPO6VTcGjeCfaHtTzrwISkRueIYsZ56o4gBOBZsCI7Z4zzMkA3MkBTy1vIcRsng1GlhfKq
	U+ARPeXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdKF-000000006M0-1I6s;
	Mon, 06 Jan 2025 02:58:43 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdDi-000000005ZY-2VKE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736131918; x=1767667918;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yg92nUqhJzU5b5Z5WgjE9KWWIe4THP7jzmQyZfctNpI=;
  b=KKbbPHSBL3yp6CGptPT6AqUp7udHWfmAiQP5WwUF8VqkuxEzeHW1N2a1
   7cVOQhASXCNIa2t7pOGRLdKRxiTuLLZL+h+FgbNepmz2TLIr0o2cxFFtY
   SnnVx7AMeQXKSqwRDDUQtWeUrpui1+RllfRRvSgJiSZ8RWiI6xcOgF8V7
   G2VU8mOX0n0tCctSPBQKHbrIjJEEk2589zFg+4JSqmnjanO8rUFRtCtm3
   J3f01L1XclB2kQpexSqbozhkgvMWtI1iXcNYsjh55T7JjGhr+4OKVo5qs
   VFfI/m7/FSqcOWOrWbmu3hHYvTE3ftzfoY6PWFjnIb5hybrfmPqN1Q9v5
   w==;
X-CSE-ConnectionGUID: fZlHpVVARbCho2uM23ed6g==
X-CSE-MsgGUID: 0HZaJFdsS0WMt+nUyyqCog==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="35574980"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="35574980"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:51:58 -0800
X-CSE-ConnectionGUID: uz74PbeKRJCEdbLuqgEM9A==
X-CSE-MsgGUID: JMNX9CZzRaWjqBlMZHYLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103191593"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:51:53 -0800
Message-ID: <e59cbded-6f76-4533-8368-1d0f13a54c95@linux.intel.com>
Date: Mon, 6 Jan 2025 10:49:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/14] iommufd: Rename fault.c to eventq.c
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
 dwmw2@infradead.org, shuah@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
 mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
 smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
 patches@lists.linux.dev
References: <cover.1735933254.git.nicolinc@nvidia.com>
 <de1a507d2393edc25395242d1c9b704a36f02296.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <de1a507d2393edc25395242d1c9b704a36f02296.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185158_675164_089AEC16 
X-CRM114-Status: UNSURE (   7.60  )
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

On 1/4/25 03:43, Nicolin Chen wrote:
> Rename the file, aligning with the new eventq object.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/Makefile              | 2 +-
>   drivers/iommu/iommufd/{fault.c => eventq.c} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename drivers/iommu/iommufd/{fault.c => eventq.c} (100%)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

