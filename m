Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3950C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 22:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pebFSQusyBkQvtHcDlPWOfhwpnXbf7nlES/s738/X4=; b=2VFrwBctQQN7v9ryicuWJnlkSf
	i7Jgu6oX5MDi12ai+uUezSFoMX3WJllqA8HqHKPof+VbcDjgmaVc2yxAgUqn2aRIwz02mF/NowK6X
	zh6zhh4DdGt91is/+lSZONpuwWiYT5txn6XxRqVvP3M4vbEPQSofg1QXwHbJuJPvYClZ1ZyXpV5Sa
	P90FLK9RRuyqQaod3mtyHAK3Csd9/1hog30z2U/hxFANB0A5rKFBNUJYnKm1GsaIbeQBFsc8rSWKo
	wxFvrfjKNMbtO8nD9G7ECUsKRwmsJhv+nZtfQ1jo+tTQwNORdaO76imIM34FdpYhHYTpCahp7+bYQ
	HBZhWZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNsQ-00000002tFh-2VPH;
	Tue, 04 Aug 2026 22:44:50 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNsO-00000002tFN-1TRN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 22:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785883488; x=1817419488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r0IphEcOPyKhSzCbbNGFOF/2AOB7cy6Ae1oYJmaozMA=;
  b=n0n1MqnxKFZ8CN2qf/KUtLesf0V1TQDmRTgv08+DXhwXdx9oS7LJRcJC
   E84GsP47txRIvyQoY7NwDKhxXi69qHA5nRCJ+zfVMYVR0kA7F4rAeZT1k
   R2RvLQdC7iDIdwXfCsZr98e7fBdvj4tIu0Ak7oeb+VH8y82g7mrsfhGqj
   ztsMCh8CXSvF2s/kpWuEnoviZtiDAhZ1Nycl0wdCgALkNUsBYpGYescWx
   3aiDDgSiqKnDadfuwnmPgdGtmK+XXRO5HsscDH8qdsocLeozRZKEt61Gd
   txYilRUCZaQxEp36UVurr5WxLSRkcA26E2sudEmULAjbDuGaiADixgbYb
   Q==;
X-CSE-ConnectionGUID: odrBQxekQx2LWs5fsjjzSQ==
X-CSE-MsgGUID: VhxeN420RR2HCOzma0LBiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="73984243"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="73984243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 15:44:47 -0700
X-CSE-ConnectionGUID: R4wZhYeLT1O44/n7kqKaRg==
X-CSE-MsgGUID: J83z7p5MR3qt3Vv/yfTBHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="285004034"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Aug 2026 15:44:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrNsH-000000004HK-3UxA;
	Tue, 04 Aug 2026 22:44:41 +0000
Date: Wed, 5 Aug 2026 00:44:27 +0200
From: kernel test robot <lkp@intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ACPI: IORT: validate RMR node array bounds
Message-ID: <202608050045.wC3xEg9O-lkp@intel.com>
References: <20260706094300.82618-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706094300.82618-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_154448_490828_AAEB757B 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Pengpeng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v7.2-rc6 next-20260804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengpeng-Hou/ACPI-IORT-validate-RMR-node-array-bounds/20260804-123552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20260706094300.82618-1-pengpeng%40iscas.ac.cn
patch subject: [PATCH] ACPI: IORT: validate RMR node array bounds
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260805/202608050045.wC3xEg9O-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050045.wC3xEg9O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050045.wC3xEg9O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/arm64/iort.c:199:13: warning: 'iort_rmr_node_valid' defined but not used [-Wunused-function]
     199 | static bool iort_rmr_node_valid(struct acpi_iort_node *node)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/iort_rmr_node_valid +199 drivers/acpi/arm64/iort.c

   198	
 > 199	static bool iort_rmr_node_valid(struct acpi_iort_node *node)
   200	{
   201		struct acpi_iort_rmr *rmr;
   202	
   203		if (node->length < sizeof(*node) + sizeof(*rmr)) {
   204			pr_err(FW_BUG "Truncated RMR node in IORT table\n");
   205			return false;
   206		}
   207	
   208		rmr = (struct acpi_iort_rmr *)node->node_data;
   209		return iort_node_array_valid(node, rmr->rmr_offset, rmr->rmr_count,
   210					     sizeof(struct acpi_iort_rmr_desc),
   211					     sizeof(*node) + sizeof(*rmr),
   212					     "RMR descriptor");
   213	}
   214	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

