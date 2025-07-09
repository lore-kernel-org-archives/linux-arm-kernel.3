Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1137C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 06:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qiye+7CAOoMur15FwsWFPDi1mVFk2rkWwaMS8vkZIkg=; b=qunGFQ8zwA/bLnllb+R66cM2mP
	I6dM+7dvF7xMNtURxYWjwgTY8FNmcng0I0/FQzipPbsRFKsO6LISIku5Vs7Q1dTHI8MPr8QOItrQ5
	dUEuK96p9RvnzzvOY7AltLwrWKYdmQzVMrBmV+JJjoxkMkCTeeiJQSzaICFQl9hv64FFHcsSdZMK4
	/gpcgvqgv8CwPO5O8kXz/5Sl1cgQsu1Wv7/+ZWGFa4fc2ZOjxNpApdNkzTotoOGePY4JIaf15bi9a
	HsrRQwgdW/2O7NJVHhksdfTxSx7AOtrV2PykaMxKC/E8oDVSs5FNmh5EbpmOa62R2h48bFGjH/G3N
	3LMDXb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNst-00000007eDL-0Jn8;
	Wed, 09 Jul 2025 06:02:23 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNqV-00000007e1P-0gyd;
	Wed, 09 Jul 2025 05:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752040795; x=1783576795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LzYB6pw/2+1lvLXdkdXCIJm1qBGvJhF76UZJym27mtI=;
  b=PUy+jt29B+AS6VgSHuTlTZeTtAy7LcGQWHeKebrEJvdbaUHsmdQi8Xd7
   IM+wKzUeXh08/NgW3uCx4vK5CrfcYzBAM7utn0F8ox5YGToVgeYtHZsWp
   Fm8TR6OnoA8v4RzIP/FIYR89aTHZjW9h9NcDxXpGCPaCWlqhhfMyoZItu
   ymrACk3MHHO8ttZzTHkcOQjF/DcymKYyfwNt3oaIMVehw+PbibcuoANzP
   2JCECzPqfWIDAUHqBj8piMcyQKEZ65SF5p4YrH9dO4yTnrZogPiH+ZWJ9
   ZNKkhl8v8U0shga9VCwS+IFdtzid2yl6LbNPAxNs25VoRwAHi2lKWwCWa
   w==;
X-CSE-ConnectionGUID: 776E7IXtQa2OFEuGjmQgLg==
X-CSE-MsgGUID: 791wO8a4SAar2kZpk2Y75g==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54009931"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54009931"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 22:59:50 -0700
X-CSE-ConnectionGUID: A6UhJEe2QCS4oMRU34mFqw==
X-CSE-MsgGUID: L/VUNKizQfG5E89QG7KNzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="156414304"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2025 22:59:47 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZNqL-00039P-06;
	Wed, 09 Jul 2025 05:59:45 +0000
Date: Wed, 9 Jul 2025 13:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
Message-ID: <202507091305.hPkKkWZJ-lkp@intel.com>
References: <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-extensible-parameters-validation-v1-1-9fc27c9c728c@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_225955_267945_407CB9BE 
X-CRM114-Status: UNSURE (   9.93  )
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

Hi Jacopo,

kernel test robot noticed the following build errors:

[auto build test ERROR on a8598c7de1bcd94461ca54c972efa9b4ea501fb9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250708-184651
base:   a8598c7de1bcd94461ca54c972efa9b4ea501fb9
patch link:    https://lore.kernel.org/r/20250708-extensible-parameters-validation-v1-1-9fc27c9c728c%40ideasonboard.com
patch subject: [PATCH 1/8] media: uapi: Introduce V4L2 extensible params
config: i386-buildonly-randconfig-003-20250709 (https://download.01.org/0day-ci/archive/20250709/202507091305.hPkKkWZJ-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250709/202507091305.hPkKkWZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091305.hPkKkWZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/media/v4l2-extensible-params.h:23:2: error: "This file should not be included directly by applications"
      23 | #error "This file should not be included directly by applications"
         |  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

