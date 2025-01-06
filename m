Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92546E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqPBQ1jeIzq6KtzQpdLHmaDHZQpw3oYklm1XM5ctYdU=; b=j9zsMMGDmEKT8Lv4yKTjn0D1e3
	ju1gxVGl1jEtC3ZGzjyNrP9S34q/OpuR7E3Y53oqvrV+OcNH4dFxcO8Wp+PTcAOKq6YmyJO5YoJkT
	Du6eXR8urzycNmuYGAMRcqBuDIRQQDtQhw+yCbZv6QWFhfKAm179nm5lghcyMv5dix1OHaWKKSOzN
	gOaYQYSKt+xTaGDGIa0canVwVDP7lUc37/d1pFc/aMZLfrsh0u6JSLrvvfxoSDaU8qMEGGOGM5zbk
	o2K02zaXenl72dAN6fPNWxk+lC7Iy58WvPkAfm12R0QHAOSt1QS2z9K5obzfR3R3hFqYlQxJTLGXS
	9qZ+mO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdJ4-000000006H5-2O7N;
	Mon, 06 Jan 2025 02:57:30 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdDO-000000005U4-1ICn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736131898; x=1767667898;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p+rSGSb1fcY4Z+BFW/0sBY66DwVhq4ZBNQgOm7e3CZw=;
  b=AGXmwMX3X/Ysux2FDF8Ta/jf7IH3kaGEt3T9damOVEcaEGLpau0veIvP
   mzDexwwXVEn2/7XCsgcs9DUp2L6OKIWER/ZJEAUdC1KCHEpoLEM7K53Dm
   kypDm4x0gtrBruy4JxuAg2ZLlxHrc/v00dKvoP847ct1MU8oL2Ns0Q1jL
   x6NSCmlPr3TBRTg2+uUsiF4+N07hI8DamOmzVpJms0ksGYAM5C0rjs5QK
   onAVEBH3DJSIxpq1ywJp6w5YUQXe61XUDXY4OYnPKkX/UdiXZNHpJaQAq
   JfLeCUOajwhtp1GyGzUO1kScPI+28ck2zU2BHt4wapMTQcklkiDBRmRVm
   w==;
X-CSE-ConnectionGUID: Ut4R7BcmRtGLFzNDb/63Dw==
X-CSE-MsgGUID: bqlFiFNRSm+HUjiYenvsMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="35574963"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="35574963"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:51:35 -0800
X-CSE-ConnectionGUID: rc2EfEReT5uicVtr1fh1Wg==
X-CSE-MsgGUID: FRP5fobRRRSKxYmFBPvXNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103191561"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:51:30 -0800
Message-ID: <3992ea4a-a0f9-47bd-b46b-c50e47496d53@linux.intel.com>
Date: Mon, 6 Jan 2025 10:49:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] iommufd: Abstract an iommufd_eventq from
 iommufd_fault
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
 <5d4bf92ce7e64a1c424f1b89d1a78f20bc6d7557.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <5d4bf92ce7e64a1c424f1b89d1a78f20bc6d7557.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185138_362576_7451627D 
X-CRM114-Status: GOOD (  10.37  )
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
> The fault object was designed exclusively for hwpt's IO page faults (PRI).
> But its queue implementation can be reused for other purposes too, such as
> hardware IRQ and event injections to user space.
> 
> Meanwhile, a fault object holds a list of faults. So it's more accurate to
> call it a "fault queue". Combining the reusing idea above, abstract a new
> iommufd_eventq as a common structure embedded into struct iommufd_fault,
> similar to hwpt_paging holding a common hwpt.
> 
> Add a common iommufd_eventq_ops and iommufd_eventq_init to prepare for an
> IOMMUFD_OBJ_VEVENTQ (vIOMMU Event Queue).
> 
> Also, add missing xa_destroy and mutex_destroy in iommufd_fault_destroy().
> 
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/iommufd_private.h |  52 ++++++---
>   drivers/iommu/iommufd/fault.c           | 142 +++++++++++++++---------
>   drivers/iommu/iommufd/hw_pagetable.c    |   6 +-
>   3 files changed, 130 insertions(+), 70 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

