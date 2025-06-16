Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B503DC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 06:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXxKxSpchmgfUYf5LqT2qTHnbOdTm8gvbeC+DME5mrY=; b=OYsW4fySIQBbaV/6JshC3os4cd
	NCSn25vC5+QDIOtxyz+1hckA+XcARaTiKftzwAnH4RnaJGpg0ebiEFSYSD0agVQ6CQUB5rwAa20Ur
	yYGlTH9iPy0pC0pAkZxoizhD4m0FDwdjg9mGa2fkEQt6BPYqjJEfv2JqkWp+GT/fMZzdMuhpVbB7I
	ee+6UhxBSLH75lQCb6sFhQVMQioLjoe27PgpEY5ZQYD9WRkELFxoMaF4lP0/rG4IkxZ532E5myu8k
	zt7Zv2Rpb/PiyrQk5fNA/SClFEI+rHImqmncY9wnSmLgCeDCUCBb2fP/jylikVj08kfkfL8VNnibt
	ff6bhIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3OD-00000003WB8-0QWu;
	Mon, 16 Jun 2025 06:32:17 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR3JG-00000003VaS-1XYk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 06:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750055230; x=1781591230;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=guthJV8X5Sn3QS48dFxzVUYchT/ptlQNDvr7/P3ystE=;
  b=Myo6j2H3hOvtj5l9FIGo4kBFbP/7kmQ/A2vB9dBe2vF3x50Pye1PXiYL
   P8Ute8EgzA4k8MBVShxyeZOaVayIaLjKnP9q/LyJjIB/zyenWhze3A3q+
   0ic09FwBLrU7sXtn7W0hs6kEK4Yqmzt+oF3AI23NSAYQsQ3Hxlnj6zG4Q
   fxGQU9wTA/X3/CrBZmFhtOtFu1eYFp5PTqmaKHw2UezNm2py0TyH5bC3i
   KvZvp/EX/zkMxu83lHLjKGlkU6jVikot38npbXzobmtSF8Gnz2yC7PANW
   pv498b5XeZ7IWoU4IKGmKvgCEkR5HSiRDrIGiMoRNhcAloqUTVcMPmpZN
   Q==;
X-CSE-ConnectionGUID: ndFzivhfSIGqdkodyKo0cA==
X-CSE-MsgGUID: Xi4wibggRrquz1ZLiuJbDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69632507"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="69632507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:27:10 -0700
X-CSE-ConnectionGUID: ZURGS4SzT3Cu91PvtlrvWg==
X-CSE-MsgGUID: ZI6oSjeARV23YgzKHmA7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148841810"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 23:27:03 -0700
Message-ID: <ee1b9096-4687-49ad-815d-efe3dda5d31a@linux.intel.com>
Date: Mon, 16 Jun 2025 14:26:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/25] iommufd/viommu: Add driver-defined vDEVICE
 support
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com, kevin.tian@intel.com,
 corbet@lwn.net, will@kernel.org
Cc: bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
 thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
 shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
 peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
 praan@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev, mochs@nvidia.com,
 alok.a.tiwari@oracle.com, vasant.hegde@amd.com, dwmw2@infradead.org
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <937d515032be07af36c06a4adb662ee2f7693c75.1749884998.git.nicolinc@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <937d515032be07af36c06a4adb662ee2f7693c75.1749884998.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_232710_622647_EFAA1601 
X-CRM114-Status: GOOD (  14.27  )
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

On 6/14/25 15:14, Nicolin Chen wrote:
> NVIDIA VCMDQ driver will have a driver-defined vDEVICE structure and do
> some HW configurations with that.
> 
> To allow IOMMU drivers to define their own vDEVICE structures, move the
> struct iommufd_vdevice to the public header and provide a pair of viommu
> ops, similar to get_viommu_size and viommu_init.
> 
> Doing this, however, creates a new window between the vDEVICE allocation
> and its driver-level initialization, during which an abort could happen
> but it can't invoke a driver destroy function from the struct viommu_ops
> since the driver structure isn't initialized yet. vIOMMU object doesn't
> have this problem, since its destroy op is set via the viommu_ops by the
> driver viommu_init function. Thus, vDEVICE should do something similar:
> add a destroy function pointer inside the struct iommufd_vdevice instead
> of the struct iommufd_viommu_ops.
> 
> Note that there is unlikely a use case for a type dependent vDEVICE, so
> a static vdevice_size is probably enough for the near term instead of a
> get_vdevice_size function op.
> 
> Reviewed-by: Jason Gunthorpe<jgg@nvidia.com>
> Reviewed-by: Kevin Tian<kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen<nicolinc@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

