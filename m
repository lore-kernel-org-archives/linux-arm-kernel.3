Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5785CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFtWyOoydlgnH6luhqkJj5nxwgQHKbXv4tPerGLz1Jg=; b=4eB+CHPXAUnmnsAsStEK27QFJy
	pdRAvDcnMfupEcHlf3B8iv7zhCbYLzsGbSwB5AMInnqCaojopM+kuaIl2rj94iDg/lZugXaro/TeS
	d0QCAzs8ZltclnNjNtMEyCJgeOrx/bMyLUUkIApgFPVlIKc09qdS6aA4e6Se3rZYrTAKTfba6JN5c
	q8Xy8kOm0mJnLahF39jUrHXD06ExRmH9NSj1knTqLrolKFo9J6D1WSLJ1YEBWzwK8tsR+bHOHTrEQ
	3Te2A5tqqboPbdA8JGbJTFs6Lwx1U/0RKUAcnHOVbY+jLVOfFtYnz8BpSh8O8mw6RmbDUPD9X9upp
	uG61t/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DvR-00000008eaP-2Xpm;
	Fri, 10 Oct 2025 14:16:53 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DvP-00000008eYo-1Vcl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 14:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760105811; x=1791641811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=80h6mrAaud97uc9EduYzED8S14ed6d870EpHss4JGBc=;
  b=KLRMleA5JUxaUPQ58Mqo5+JbDtZI9q9OoiMfzWhaJNCJ2XaBJSiiYEOS
   UL8WvAQIZ0fmXPVaNsyrsWp+KSyMInv6SM6BqZQ4VlqOIowNHyLb4Xb4G
   tETkBYVGP6mSOgFt53yplGPLOfrL3ksyzYkiVoGNB0u+cshUBDD5IqZdH
   1pygJp2QvQuqa5sZNh2ntSQHTCWJvoCbZh98wZAqb2R+f4vNNfmJN44zV
   0AiDM+WoAVCe1s+u+XP2Zzr8oQdHHuS9eNsgvyZl6wnm0cSOfLbuQY8ja
   KT5tFq283cJ11RSu6k9msePiIpV2CmO7JKzB/BSFctyi19+cD7QiCA+21
   g==;
X-CSE-ConnectionGUID: JfgbTRfWRwOyv/OrLXrEow==
X-CSE-MsgGUID: v5mCu5VpQoSXgQKZ17s83A==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="72582400"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="72582400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 07:16:51 -0700
X-CSE-ConnectionGUID: 8LBWA8r0S8KeaHF8A8VjEQ==
X-CSE-MsgGUID: BIOHHL5DRvuQZ8fJ2wR0Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="186122752"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2025 07:16:46 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7DvJ-0002qV-0H;
	Fri, 10 Oct 2025 14:16:45 +0000
Date: Fri, 10 Oct 2025 22:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH] coco: guest: arm64: Update ARM CCA guest driver
Message-ID: <202510102121.hLzgHTck-lkp@intel.com>
References: <20251008132758.784275-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008132758.784275-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_071651_467704_D88292A2 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Aneesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v6.17 next-20251009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V-Arm/coco-guest-arm64-Update-ARM-CCA-guest-driver/20251009-203207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20251008132758.784275-1-aneesh.kumar%40kernel.org
patch subject: [PATCH] coco: guest: arm64: Update ARM CCA guest driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251010/202510102121.hLzgHTck-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510102121.hLzgHTck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510102121.hLzgHTck-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: cannot open drivers/virt/coco/arm-cca-guest/: Is a directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

