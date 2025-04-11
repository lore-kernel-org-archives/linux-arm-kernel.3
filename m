Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165D6C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 23:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3q8NkCAFLhwuH+PrJyQ6/aUCrCXkw20ILW5ni23XHc=; b=t0AT5vze8v+ZYmZ4Nfda7SscTH
	8oofec3caAqgKKECNtvuiqg3SQnFmUFKa8Fd04jsBuWmP4XklNEe8x7u1LWljeK9p2k6hRkM7J3+D
	ctPuIkUE9leBQLCLDvfbDawnwW9uAuqknp2rlfAcx0tF1GqQ0Tcs9Er6drsuZa2JOyqKhENjc/1Ox
	M+kd3payyqRIphsq5BDMCRbKB3nzQy+Yib65Yb1abRWnOB74ogZCeC0y1NoU8TGstXQTnCXqXQoRg
	DRPO69lmxdl+PEyEygTxX9QewLtY1rr7rUBD6/KORwklZG0i4IoWH/7Ycs0+Y9X/JStsvDaxR/RFj
	JM0C0FyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3O1Z-0000000F6xY-2MiD;
	Fri, 11 Apr 2025 23:43:05 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Nzi-0000000F6oz-2En0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 23:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744414871; x=1775950871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DWUjtR2ftgxqvFrIhCE165hC8BZaXWmvSsovH5UcaMs=;
  b=eoeRzMbY2GdP4vZCy3AYdn9SMfOEZBBEwkCFIGuToS0TUq6nZrD41EcY
   bttVDdt0HL6leOxnUQsAceHZrAlaRQ+3ib8a1T7Zr0rxtRVI99d1WSxPR
   uwwEhpUJejt2j0zMsFHw2N/7Q1uhvIumFc+tzNheBiY5lDqRkwFMdAGIu
   Fy1p9BRSSQvEKuhCL/qkRQrIBfU+UiC24cwKypOIL0ZUvWLrVk/3CsZ7o
   BBxnSCIqMJCgepbDjQmeVxyMqe2qYBmQmkkB78x+mA6EFHd8CAbgVZ7sR
   iXtvkbS6sZjXd7Pm13uSGGbyH7lIVfX6jnqJGOq0cRHMKDKZWVchFa4mo
   w==;
X-CSE-ConnectionGUID: zUBDqGiRR1if6J+D92YfFQ==
X-CSE-MsgGUID: iIRm9ZwXRxWITVjBPQ2xyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45214918"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45214918"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 16:41:10 -0700
X-CSE-ConnectionGUID: 0qt2RC1dQ6qs2p+GCM63Mg==
X-CSE-MsgGUID: SBo1nEdNTBSc5C0oAKKNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129876944"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2025 16:41:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Nzc-000BRS-1A;
	Fri, 11 Apr 2025 23:41:04 +0000
Date: Sat, 12 Apr 2025 07:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, jgg@ziepe.ca, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 3/3] arm-smmu: select suitable MSI IOVA
Message-ID: <202504120727.1ZmvnvO2-lkp@intel.com>
References: <20250410225030.2528385-4-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410225030.2528385-4-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_164110_616683_4777804E 
X-CRM114-Status: GOOD (  11.62  )
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

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250411]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Saini/arm-smmu-move-MSI_IOVA-macro-definitions/20250411-070014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250410225030.2528385-4-shyamsaini%40linux.microsoft.com
patch subject: [PATCH v2 3/3] arm-smmu: select suitable MSI IOVA
config: arm-randconfig-002-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120727.1ZmvnvO2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120727.1ZmvnvO2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120727.1ZmvnvO2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:103:0:
   include/linux/iommu.h: In function 'select_msi_iova_base':
>> include/linux/iommu.h:1573:1: warning: no return statement in function returning non-void [-Wreturn-type]
    }
    ^


vim +1573 include/linux/iommu.h

  1570	
  1571	static inline u32 select_msi_iova_base(u32 erratic_iova_addr)
  1572	{
> 1573	}
  1574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

