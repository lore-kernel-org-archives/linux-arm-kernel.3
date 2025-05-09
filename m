Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B25C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDjh+fsxBMVWL6faGywENYAgWaAopitAtIxcmOxSOvY=; b=TKtuUPeFxG46fdoNmzkjX4BaPy
	wxozaPjr9nzyNxVQLaxNGPXxdziT+o3Bzuz515H3OtoWBjHyjkGRwkWRwAxaNLHjzkB2UyNdKCbnF
	Ex3yNZyaEZTlLxScLFPQFnE/d9NxDsZkhKycrSBA4prwkoZYaNYjxsqfesPqsZsbCp9zHEiJxKlv/
	05Sa1Rql7A5Ye1b/6tBDbz5KwOZEq37pMRW4cjbd10rFeEYhjn8zKpHt0bGNJ16FdYVc+BZy4O42T
	0syk0b85YAEV3Gz3hEELPNEsY1ELhhv4xy7owW8Uggcop4NfuelXqQdQYo86fXHzeD0FMiXHwQ2g2
	MLnHt2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQSu-00000004GPw-091M;
	Fri, 09 May 2025 16:20:48 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOTh-00000003uR8-0uNA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746800009; x=1778336009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0/dtn/kdBfNqf/vszxB+yWxoYVNi1v0FvDrPLSfbTQY=;
  b=VQuYcGm0gHAFJzW0uHVOfjVduJ3qLaO2CNVUXY+Iqj62E9K9TgNAnqmT
   jK8Nd+9cJTT7P26+bbW3wAOnAmD8suuCc1rw/2CIB5bV+v8VmZ56v5j3m
   xve5lJ8lbuTX82cfjOQ6McPkw4n0TpmFoyaeTdXupVPVIxETW8r8dYmL+
   pguYXJcT5OFPbKgbHz+Fv1DHf2HLqmaPsAvIO3Y3AMKp0D1Hvuwy2/45D
   yo5gR4uQAupZh4ctNXt08/UxKx7Ah5dHoFni2/9ikCLIEKrlW0tP6++A/
   WKvVAwr6MOv9VNUOw/x8Nt5Ww2qOHO3nAO3+f1T21mRjdAAKXm1tyQqs/
   w==;
X-CSE-ConnectionGUID: E18VgMi6RPq7pUOeOtspBg==
X-CSE-MsgGUID: 37jECTnHScaAb60nGHxC2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48782061"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48782061"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 07:13:28 -0700
X-CSE-ConnectionGUID: H4zXQepxSMe8aX0MXumPvw==
X-CSE-MsgGUID: RcgC4DNNQty3MbgoXScnBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="141580924"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2025 07:13:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDOTW-000C9N-2m;
	Fri, 09 May 2025 14:13:18 +0000
Date: Fri, 9 May 2025 22:13:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, jgg@nvidia.com,
	kevin.tian@intel.com, corbet@lwn.net, will@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	yi.l.liu@intel.com, mshavit@google.com, praan@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v4 14/23] iommufd: Add mmap interface
Message-ID: <202505092119.UALKhnIX-lkp@intel.com>
References: <ee9ee287264fd75eb4fc64a63f20d03e9ba18161.1746757630.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee9ee287264fd75eb4fc64a63f20d03e9ba18161.1746757630.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_071329_293529_3F1473F1 
X-CRM114-Status: GOOD (  12.68  )
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

[auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolin-Chen/iommufd-viommu-Add-driver-allocated-vDEVICE-support/20250509-110521
base:   92a09c47464d040866cf2b4cd052bc60555185fb
patch link:    https://lore.kernel.org/r/ee9ee287264fd75eb4fc64a63f20d03e9ba18161.1746757630.git.nicolinc%40nvidia.com
patch subject: [PATCH v4 14/23] iommufd: Add mmap interface
config: i386-buildonly-randconfig-003-20250509 (https://download.01.org/0day-ci/archive/20250509/202505092119.UALKhnIX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505092119.UALKhnIX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505092119.UALKhnIX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommufd/driver.c:91:6: warning: variable 'num_pfns' set but not used [-Wunused-but-set-variable]
      91 |         int num_pfns, rc;
         |             ^
   1 warning generated.


vim +/num_pfns +91 drivers/iommu/iommufd/driver.c

    80	
    81	/*
    82	 * Allocate an @offset to return to user space to use for an mmap() syscall
    83	 *
    84	 * Driver should use a per-structure helper in include/linux/iommufd.h
    85	 */
    86	int _iommufd_alloc_mmap(struct iommufd_ctx *ictx, struct iommufd_object *owner,
    87				phys_addr_t base, size_t length, unsigned long *offset)
    88	{
    89		struct iommufd_mmap *immap;
    90		unsigned long startp;
  > 91		int num_pfns, rc;
    92	
    93		if (WARN_ON_ONCE(!offset))
    94			return -EINVAL;
    95		if (!PAGE_ALIGNED(base))
    96			return -EINVAL;
    97		if (!length || !PAGE_ALIGNED(length))
    98			return -EINVAL;
    99		num_pfns = length >> PAGE_SHIFT;
   100	
   101		immap = kzalloc(sizeof(*immap), GFP_KERNEL);
   102		if (!immap)
   103			return -ENOMEM;
   104		immap->owner = owner;
   105		immap->base_pfn = base >> PAGE_SHIFT;
   106		immap->num_pfns = length >> PAGE_SHIFT;
   107	
   108		rc = mtree_alloc_range(&ictx->mt_mmap, &startp, immap, immap->num_pfns,
   109				       0, U32_MAX >> PAGE_SHIFT, GFP_KERNEL);
   110		if (rc < 0) {
   111			kfree(immap);
   112			return rc;
   113		}
   114	
   115		/* mmap() syscall will right-shift the offset in vma->vm_pgoff */
   116		*offset = startp << PAGE_SHIFT;
   117		return 0;
   118	}
   119	EXPORT_SYMBOL_NS_GPL(_iommufd_alloc_mmap, "IOMMUFD");
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

