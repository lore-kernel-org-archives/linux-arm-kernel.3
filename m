Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C425E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3B74QvxE2eLaIA5gbbL1wkpmj1gudPe46BgSmSp8VgQ=; b=hJU6Zh5QE/uUd1KNM/nWzZxpu1
	kX+1ziBYAfBljuMZeVEf8ba/tA6i3xdYafMdZdkoT3FmymVAne6Zaf/D0qWq8TcI51sX0b9/LfU1t
	RXSmnH9DSnTu+uBhEjy255hVSVsd3iNn7FtPInxteGG/CJxAd2iR6+8ZvbJ+SG/Im1aOkhNevTIWy
	wlH47XqJkNkZpbrU8aTv1n1ShoZsAefUA2DYMXJuzuwun566HOn0pvdfpSRpF6YGeNzXwg9tbf1ia
	Zn7nRiqWY3WW4BTdSp15vm2ult78lYl0DvE1KKOF3wGx0+VguhZzHN2lhrmHL4/MM5qiSNTSNDPM4
	WvoJseFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqM6-0000000Be42-3y5o;
	Thu, 09 Jan 2025 11:05:38 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqKt-0000000Bdox-1w7C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 11:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736420663; x=1767956663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IP79LBJkq7R0JdTUMY4tcQDHZkX+te/jZ0WVpzZaqp4=;
  b=ii0cE7+69Or4wslApfIvUmV5ay2+FzJu0CWQvstXuCB02Otv0ECea1JX
   ijs+HNw+cq73JBYB5WIZEY0MADyqf3437WYCAAFbsSWz8T4uOm9GNbTb4
   WLN8KqNZ7hb9xT7X55SDjZJQjlErZ2i+1/w+TRhqE9pFpfnBrIn0GawH4
   uL/drBF2RsHH521M43J5uiH/kqSj1doN1omlRATEA6cFiG71MnF1FIu8C
   W49sM+XmvCWrsyJJardsISrdz4LJNDUgXUfJ8mDfSjtpZvb/qoAMShbsq
   5VNKyz+VLaKSCiCvx4eI8+gYGdZdpjXfUxIA7w/T3DwslMeGHtFvNy1W7
   Q==;
X-CSE-ConnectionGUID: BW6Y7TkETVqDtHQxG0sdVA==
X-CSE-MsgGUID: 0ExDGZliSQGzCl+tmJso6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36370920"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36370920"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 03:04:22 -0800
X-CSE-ConnectionGUID: KWuf3KQCRHuOZRxQ0NsmIw==
X-CSE-MsgGUID: GsyVUl2OT/W0wQ0EAIHqMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103259034"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jan 2025 03:04:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVqKk-000HRT-0t;
	Thu, 09 Jan 2025 11:04:14 +0000
Date: Thu, 9 Jan 2025 19:04:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
	kevin.tian@intel.com, corbet@lwn.net, will@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v5 14/14] iommu/arm-smmu-v3: Report events that belong to
 devices attached to vIOMMU
Message-ID: <202501091822.4ocbIobQ-lkp@intel.com>
References: <03c01be90e53f743a91b6c1376c408404b891867.1736237481.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03c01be90e53f743a91b6c1376c408404b891867.1736237481.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_030423_541715_2A6DA944 
X-CRM114-Status: UNSURE (   8.92  )
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

Hi Nicolin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e94dc6ddda8dd3770879a132d577accd2cce25f9]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommufd-Keep-OBJ-IOCTL-lists-in-an-alphabetical-order/20250108-011247
base:   e94dc6ddda8dd3770879a132d577accd2cce25f9
patch link:    https://lore.kernel.org/r/03c01be90e53f743a91b6c1376c408404b891867.1736237481.git.nicolinc%40nvidia.com
patch subject: [PATCH v5 14/14] iommu/arm-smmu-v3: Report events that belong to devices attached to vIOMMU
config: arm64-randconfig-r131-20250109 (https://download.01.org/0day-ci/archive/20250109/202501091822.4ocbIobQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250109/202501091822.4ocbIobQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091822.4ocbIobQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:461:21: sparse: sparse: invalid assignment: &=
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:461:21: sparse:    left side has type restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:461:21: sparse:    right side has type unsigned long long
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:462:21: sparse: sparse: invalid assignment: |=
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:462:21: sparse:    left side has type restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:462:21: sparse:    right side has type unsigned long long
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:464:23: sparse: sparse: cast from restricted __le64
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:465:23: sparse: sparse: cast from restricted __le64

vim +461 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c

   455	
   456	int arm_vmaster_report_event(struct arm_smmu_vmaster *vmaster, u64 *evt)
   457	{
   458		struct iommu_vevent_arm_smmuv3 vevt =
   459			*(struct iommu_vevent_arm_smmuv3 *)evt;
   460	
 > 461		vevt.evt[0] &= ~EVTQ_0_SID;
   462		vevt.evt[0] |= FIELD_PREP(EVTQ_0_SID, vmaster->vsid);
   463	
 > 464		vevt.evt[0] = cpu_to_le64(vevt.evt[0]);
   465		vevt.evt[1] = cpu_to_le64(vevt.evt[1]);
   466	
   467		return iommufd_viommu_report_event(&vmaster->vsmmu->core,
   468						   IOMMU_VEVENTQ_TYPE_ARM_SMMUV3, &vevt,
   469						   sizeof(vevt));
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

