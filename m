Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6CCD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 00:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/CDgNkZblMNX0vZ2UhN83fVcTiMDNWys0q+0nxcmRE=; b=ZzhnOdQo7ONna5MoPlxZ8/Hss6
	Fd2NirEEY6co8OBs0RoU+pe40nYv7mdEKfV5ExH3/XHCtD/PB9Q9nzOw2dxCroP3RfK52HE2ksiob
	pBbKe0Zwi071/rcRjNJkuPn1n1CnVzhp4aoY9g3lcvKr1B0W2AwPwLMrejkCLz7HgtRdx83zzB7NF
	Afb+S+bYd2wDd/LLFJeBO0YX4CuDnt72UUM99IoXmBboLf6JSXW+9uQiG4D70BYiRRCxspTCb9pxn
	efFglPKcuIGbnOEU/MxQP6l4liamyCHvxAPGftof5/Lr1QJnRBV3UaFppCl9qdJZv7Pi0fDs9fvFw
	V3s13Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUwFz-00000002rdX-0ZlI;
	Mon, 15 Dec 2025 00:16:07 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUwFs-00000002rd1-0AFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 00:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765757760; x=1797293760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6vO9OPJFXH8fJHuAE5U1pt8kHsXsUM50SQnjRnDfTjc=;
  b=fHz9v0e3LqBCanF2iSm+mpNUFfszcpbj0tUD7s/MhRP8rhPoZCq45vZy
   hbda6mcQyZIznv8T03Fxj3xleqbjgaKeKiEC4FAVJ2GsuXzei154qhiJO
   ZGicywokFhiENRe3q1QKeUFXpZP55vlXq2Gy2a+4Cu3TXaZz12x1trYEQ
   2jSaRITuyjG3nyPO0pk8OEkfO7Eku5r3JImOu33YKq+MWLvvZAfqw/Zr1
   f/9e4faJtTXzeAbf/f/o5tJC5Qos1cQ9oGt3fvEQM5EH1WWbxZ8DPs8gL
   af8hdLdvEuhYmAYrPezHclgOUBiGzlA83OFK5QFSWSgC+x6Zyh3tPiuzX
   w==;
X-CSE-ConnectionGUID: mwZoHyDRSCSszdv32MXMIg==
X-CSE-MsgGUID: QEd8jHKwSriNtUWJLlDq5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="85253709"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="85253709"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 16:15:54 -0800
X-CSE-ConnectionGUID: g0FLMlKmS8O7naC0yBHObg==
X-CSE-MsgGUID: cDHUDq0hQO6apXALujtp6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202093788"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 14 Dec 2025 16:15:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUwFg-000000002Vs-2YCT;
	Mon, 15 Dec 2025 00:15:48 +0000
Date: Mon, 15 Dec 2025 01:15:42 +0100
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 31/32] Documentation: KVM: Introduce documentation for
 VGICv5
Message-ID: <202512150153.QbgdGdcn-lkp@intel.com>
References: <20251212152215.675767-32-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212152215.675767-32-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_161600_163010_4919834E 
X-CRM114-Status: GOOD (  10.09  )
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

Hi Sascha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc1 next-20251212]
[cannot apply to kvmarm/next arm64/for-next/core kvm/queue kvm/next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sascha-Bischoff/KVM-arm64-Account-for-RES1-bits-in-DECLARE_FEAT_MAP-and-co/20251212-233140
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212152215.675767-32-sascha.bischoff%40arm.com
patch subject: [PATCH 31/32] Documentation: KVM: Introduce documentation for VGICv5
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512150153.QbgdGdcn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150153.QbgdGdcn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/virt/kvm/devices/arm-vgic-v5.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

