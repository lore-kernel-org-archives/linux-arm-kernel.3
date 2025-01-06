Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020F7E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzWx9ERzh0NCBCW3tJOA7a8HLPhjKwSg8FZwROILaNw=; b=CakuV8LCVMH35NDmlqxOb7moW4
	Vw8Ozb5IyDjwxzOstr45VFjuYJsd5VNRvkOZV2Tbb6a1F0AWI0F4cyfL1MsksSQQaZ7qy6h8J2YC+
	1CmGJdjrSYetNfb9LSBTdmCba8QhTNzuR9lTvo8IOP+duPAlfqt2UcFHjO9miwyTt6wWiS3PqttdJ
	uLbx12OjkyDkukwMuuUVaI10TbhgjwFIdkhdArNaMnCRWmn1R35P2cs3AobYyyk7J0fRmfVz1m3TK
	tyCjZL5hwtPE3+weAii0P48vpO4+vh5wGBZlSEgwAKEn6YJJDqlFHwcuHNtPMp2YoMCFIAW0BPKkJ
	ilYPO2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdEN-000000005ev-3tua;
	Mon, 06 Jan 2025 02:52:39 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdCc-000000005FO-0tHB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736131850; x=1767667850;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JFtPzvb18FfE+wL5jWUzNx+kpfpVZKFUa+nvYsaeaAw=;
  b=IxRCI/Zs77e5imkem2qxbkAzfk+SYETWIVSoGtWEQtkd7g2zvMZDD0iP
   siXRSXONAZRTNXOtnAosB/hKp8z7J2qQWBvmH5M8mgmV0iJF09iRecDba
   swK6QigxnnIye2P/9XdifTio0MdSssGqDr8duRKs2eyBi6SbinNpOMArs
   epXkprBNajMCOlTJgVJM97T7qXgZYeptahi/LXzEMYeFZtz7iLByvyp8c
   Gbv/g9qKGtk+AnewpUb9Bx/bVA24VNL2q1JviKDrmSFIlCQU8N7KyORZL
   Zf7ZX8Sx3QA8soveDh3uxIIuTRBlls7gUKW1zeTBeyaDtk6vlipOYttWx
   w==;
X-CSE-ConnectionGUID: VgWjZ9xxRAWALMh94Az7zA==
X-CSE-MsgGUID: q9+eqr/aQPK71AfVm9yRcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="53690644"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="53690644"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:50:50 -0800
X-CSE-ConnectionGUID: zi8f8q+4SN614nlesVQy+g==
X-CSE-MsgGUID: Mn2+SyAnSRikRE+VWQNAVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125600038"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 18:50:26 -0800
Message-ID: <59c4f1e6-1ea8-4110-aeee-7b7bf06cbaf1@linux.intel.com>
Date: Mon, 6 Jan 2025 10:48:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] iommufd/fault: Add an iommufd_fault_init()
 helper
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
 <f01c9eb88608f349a31756eb975e24d300796759.1735933254.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <f01c9eb88608f349a31756eb975e24d300796759.1735933254.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_185050_350068_FCDB5E2E 
X-CRM114-Status: GOOD (  10.38  )
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
> The infrastructure of a fault object will be shared with a new vEVENTQ
> object in a following change. Add a helper for a vEVENTQ allocator to
> call it too.
> 
> Reorder the iommufd_ctx_get and refcount_inc, to keep them symmetrical
> with the iommufd_fault_fops_release().
> 
> Since the new vEVENTQ doesn't need "response", leave the xa_init_flags
> in its original location.
> 
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>
> ---
>   drivers/iommu/iommufd/fault.c | 48 ++++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 20 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

