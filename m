Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F88D262AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 00:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DKV3jdDtusFwTNcI1zFYxCfbx0xqcR9nOuDrUtmRBs=; b=pzmPOosn+jwlHDXdHwe0OB0hKm
	lGTDV/25mmtUOz3/R6tZsY9xA6pttxZ8kmJUYtDd45AZQp+aJtP9wEIrKMnNfuqwzun+GAH1rgf+s
	mBeHwnAlx1xSsJacXiw7EKkNK+6md5/AqLzr9TmzHG+oXSph0Y9N2b0SuLAqd1roAVZ6qUjcfjx+R
	BSKK7vHoMciX4OhxkOu+cR6VV2dIqNdNVspF9DesD+5ilaa6wqu5y0pnIxXlgzSO+AdnzzHBycLud
	GhX+MRPT+/YsZCsRxGNiFlDZrg+nHEZcF1RcR7xOLG6gqmQ36clRMse2P9cxygtMB58G67kLFlS4u
	l9aob8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMUL-00000004gH1-1HRS;
	Wed, 21 Jan 2026 00:54:25 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viMUI-00000004gGg-1ivn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 00:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768956863; x=1800492863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=69IQMwe9upLzgpC2oBZtZFsOB+a5jIJ7cJY12DniSbA=;
  b=QBXtmcKizw8fDBXbInxK4PcyuveCWZ0oK/5Y+4JLdmpIYR/ksdvIyyfY
   o5bJ96MLfvSyU8jtSe8JYk+2zGFBqnUjb5uruVzl3uRze4Amkv+IaWLsW
   ifpr/ngoIa/s2cJE3jl0HZwlkfLejfNd58wMaK8JPDklDxznzj++bg3mc
   efy1eA6GNBFoGnmWaWR38ZjIObxAWF4DJESr9UdbXbhYJ9y3fghOyv0ei
   mbQjrLQDwO9D+KtGEWkepwFhao6EA1Qp2L+A/5eJChTl/JLpb3gwQn0/Y
   urMVaBcCIYle58WuW8q71qdQ6zL2JbPyhK4DXODoyXteQaq/9Wpb5siaE
   g==;
X-CSE-ConnectionGUID: W448ZS8sQbi6a/7wuLJ8MQ==
X-CSE-MsgGUID: X07WvUqhTROp42aBmfSn5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70083923"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70083923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 16:54:21 -0800
X-CSE-ConnectionGUID: cZWcoejfSjeisQa/O17UuQ==
X-CSE-MsgGUID: m8tR31AxS6mJ9HycUVnXaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="236942661"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 16:54:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viMU7-00000000Pmv-2DUO;
	Wed, 21 Jan 2026 00:54:11 +0000
Date: Wed, 21 Jan 2026 08:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh R <mrathor@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
	nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
	romank@linux.microsoft.com
Subject: Re: [PATCH v0 03/15] x86/hyperv: add insufficient memory support in
 irqdomain.c
Message-ID: <202601210731.f1WLdgcO-lkp@intel.com>
References: <20260120064230.3602565-4-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064230.3602565-4-mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_165422_540299_74FF80D2 
X-CRM114-Status: GOOD (  10.97  )
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

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on pci/next pci/for-linus arm64/for-next/core clk/clk-next soc/for-next linus/master v6.19-rc6 next-20260120]
[cannot apply to arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-R/iommu-hyperv-rename-hyperv-iommu-c-to-hyperv-irq-c/20260120-145832
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260120064230.3602565-4-mrathor%40linux.microsoft.com
patch subject: [PATCH v0 03/15] x86/hyperv: add insufficient memory support in irqdomain.c
config: i386-randconfig-053-20260120 (https://download.01.org/0day-ci/archive/20260121/202601210731.f1WLdgcO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601210731.f1WLdgcO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/hyperv/irqdomain.c:90:2-3: Unneeded semicolon

vim +90 arch/x86/hyperv/irqdomain.c

    72	
    73	static int hv_map_interrupt(u64 ptid, union hv_device_id device_id, bool level,
    74				    int cpu, int vector,
    75				    struct hv_interrupt_entry *ret_entry)
    76	{
    77		u64 status;
    78		int rc, deposit_pgs = 16;		/* don't loop forever */
    79	
    80		while (deposit_pgs--) {
    81			status = hv_map_interrupt_hcall(ptid, device_id, level, cpu,
    82							vector, ret_entry);
    83	
    84			if (hv_result(status) != HV_STATUS_INSUFFICIENT_MEMORY)
    85				break;
    86	
    87			rc = hv_call_deposit_pages(NUMA_NO_NODE, ptid, 1);
    88			if (rc)
    89				break;
  > 90		};
    91	
    92		if (!hv_result_success(status))
    93			hv_status_err(status, "\n");
    94	
    95		return hv_result_to_errno(status);
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

