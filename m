Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 06:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+pMyk0mMmqTOAgclRVoanZQNJ/H9UeAWVePDPFuEyk=; b=34baq/jnvFAgjlUeDzS309qLsX
	todTtNsKLeZ8MzsB6NuZ9sZ4lPcSxbD70eB8gfztJTo2nm6kxaJvreQ6+ayQu8mj4mPDNUTP6dydo
	w23dG1dF0yeJ2I/mBlpFtPHAKs3ohxYgmN9v5l+irQ/vwgy0V5p2+H0sHgQskoF0CzyRN4+/Ob3iC
	UHpp/CUlT8sFmqg4cdInDBxbNDo3lNve3sJXfctdLWGPK32W6DzXrPr7zEatDEVganopULzh0KgzN
	IXQXcOestwotQhhS0MMf5z6vuQEtufgZFgmRZ0v2ELY0/Bz2RAPWfK0C/GYPyLBUBCqELsFwfcv4c
	N1TxtoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9i7-00000008Bju-2LFb;
	Mon, 13 Jul 2026 06:00:11 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9i4-00000008BjP-3W2w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 06:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783922409; x=1815458409;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=psSl44kQAmpduvXJgayiRWg2HnIuLxnednHA5OIgwc4=;
  b=RsmQIjdZgWsVH+Hq7ShAPpZaNOGp8nh6RaW6Yx3EnXW+iVu7RXHVgA+h
   otpnUZToYIklO6qlDgZomeGhP11bShv7WWUxVD/fQbI1/jMA7O0aKOOzM
   ZRhLHd0Lgk9lXX7zrXdfM8TGSX9RenX0GWSvXReyWzS9PbimuPt/1HUVz
   GqCqrU9OImvvGw5YdcDBKAOhxeS7CwcGlWft17H0DVogdniLXYSYQJTEu
   cnl/G6di0uXixhXsNN5jrH65ueHpQKaNT70WSljxHTYlCo62ya3YZoZbn
   5Ojtqa3FOOvnLHvIVnxF1/L9c8C4kQ9NWhN50qBmb86PnHoGRBjtS9lhr
   A==;
X-CSE-ConnectionGUID: OetlRFOpQeuQCEqTF3G6Jg==
X-CSE-MsgGUID: hXAZpgiIS86z3hcfynm/Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84542242"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84542242"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 23:00:08 -0700
X-CSE-ConnectionGUID: 7YCWJH7ERM2Hvzz7QNTwpg==
X-CSE-MsgGUID: VTmitOknRAWzZ+CF1zlFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279862934"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 23:00:05 -0700
Message-ID: <06cfeb74-0cf5-49b0-bc94-5703524203fd@linux.intel.com>
Date: Mon, 13 Jul 2026 13:58:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] iommufd: Iterate the cache invalidation array in
 the core
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1783539724.git.nicolinc@nvidia.com>
 <c19b7508428e9f14d6997ff9f5a41d9d5ba6cde5.1783539724.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <c19b7508428e9f14d6997ff9f5a41d9d5ba6cde5.1783539724.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_230008_986693_9026EA9F 
X-CRM114-Status: GOOD (  15.81  )
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

On 7/9/26 03:44, Nicolin Chen wrote:
> The cache invalidation ops, cache_invalidate_user() for a nested HWPT and
> the cache_invalidate() for a vIOMMU, are each handed the full user request
> array and report how many of the array entries they handled by setting the
> array->entry_num. Every driver therefore implements its own loop over the
> array, and a driver wanting to process that array in fixed-size chunks
> (e.g. to issue commands out of a fixed-size on-stack buffer) has to carry
> the loop and its sub-array bookkeeping all on its own.
> 
> Move the iteration into the iommufd core instead. Invoke the op with a
> sub-array that starts at the first not-yet-handled entry, let it handle a
> prefix of that sub-array and report the count via array->entry_num, then
> advance the base pointer and re-invoke the op until the entire array has
> been consumed or until the op returns an error along the way.
> 
> A driver that handles the entire window in one single call, as all of the
> current drivers happen to do, finishes the loop in just one pass, so this
> does not change any of the existing behavior. It instead lets each of the
> drivers convert to bounded chunk processing on its own, done by each of the
> subsequent changes.
> 
> Suggested-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Assisted-by:Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   include/linux/iommu.h                |  6 ++++--
>   include/linux/iommufd.h              |  2 ++
>   drivers/iommu/iommufd/hw_pagetable.c | 25 +++++++++++++++----------
>   3 files changed, 21 insertions(+), 12 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

