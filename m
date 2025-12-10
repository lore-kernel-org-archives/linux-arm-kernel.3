Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234DFD3E77A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a1JSTHrOpRDI+ib1Lban2VDalaUoxT/Nswsf5qAdbTM=; b=Prj/fsxE8hFCwEWmw4UapBtRXj
	DH2nEdBq9Yy1uJ40VFM9bbmNoIq3i8HY8+7kp6aMh1cCrtuygtzMgUSP4qSCbDkSlfql2SNIzYJIZ
	/boXMXCkyVP7a9aPakqtcnaORnRVFw6bfMt8ca1hXVkmHgyzBVzGT6YeleEDm1elBa5PZzg6BJjkm
	FUPGHgCX9UEaxPKsi9g971OnKegq1RyvT8tiZJD4TOLCTmbC9JhTAzzdCnI5VSfZSByWAf8CdF/b0
	3/Nh+4B4NSuMSJl3wcmOaVbZ7l4JbHye3phd/+J5JIS8IburbV3dXdl4E9msdZQxtEQXNY0CNYkGa
	RyBjfuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQiG-0000000FpzX-3Vn9;
	Wed, 10 Dec 2025 20:23:04 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQiE-0000000Fpyx-3lHC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 20:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765398184; x=1796934184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RxEHatHQ0Qy/ChtgEVQnw0Bex/SyCFO2r36FHfM3As0=;
  b=n5Y59edrM+ayTGjQeeXIlCx8xlr6HpSZ+enofvkiJGe+do12n6KunxwL
   NIMVoACoRi8SEDaDTHpvn1CM8hz6XTrxrutd5EDz3TnzFKxqHB7gq9iiM
   ZW2UbS9vVLJ486hbgtt+0KdVQr+OVCNvC9EaGTt6Dr5UIRZt+xAK6aBlM
   M9MzqJGweszhRK4lOnqnmriUeJVXXsa8bV92HBqBrbGL/i2LpDtO+flpy
   TK+WCzb8/kMHCI/dkKIpJtUG/dbZBFfbxU7lYpjGXJcFpOrzTD2ua8Me/
   0PJB/g3Yr5kcDyMRaO2nrM/AQIhQ/5xAF4zGaLx3EW6DvGgnNf1wi3CXp
   Q==;
X-CSE-ConnectionGUID: fs/oTqCjT9e9aql1iF/iVw==
X-CSE-MsgGUID: Doc0SP+hTDGMsoyoeewUNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78846124"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="78846124"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 12:22:58 -0800
X-CSE-ConnectionGUID: cQOMJWuWSbOlJRB/Ih9UEQ==
X-CSE-MsgGUID: bTPfKaUBSC2wiNq3JOclMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="195684982"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Dec 2025 12:22:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTQi1-000000003j7-3dyl;
	Wed, 10 Dec 2025 20:22:49 +0000
Date: Thu, 11 Dec 2025 04:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Colton Lewis <coltonlewis@google.com>
Subject: Re: [PATCH v5 09/24] perf: arm_pmuv3: Keep out of guest counter
 partition
Message-ID: <202512110439.UXwb1Qh4-lkp@intel.com>
References: <20251209205121.1871534-10-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-10-coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_122302_996927_F305B936 
X-CRM114-Status: GOOD (  10.39  )
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

Hi Colton,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d]

url:    https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20251210-055309
base:   ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
patch link:    https://lore.kernel.org/r/20251209205121.1871534-10-coltonlewis%40google.com
patch subject: [PATCH v5 09/24] perf: arm_pmuv3: Keep out of guest counter partition
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251211/202512110439.UXwb1Qh4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110439.UXwb1Qh4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110439.UXwb1Qh4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/arm64/kvm/pmu-direct.c:75 function parameter 'pmu' not described in 'kvm_pmu_guest_counter_mask'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

