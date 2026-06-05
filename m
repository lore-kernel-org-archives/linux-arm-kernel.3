Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B5ECD8C81
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 14:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XE28rP0gHkRKZxmCo8G6hSPMXZh4wHGABByGW92aPvw=; b=owlnbpIFloefPQAQ3ju+Cfc3u0
	8mqu84QjUnJz04EB2up7NK80knod3iv4HilHIBouBwclO6hUQIhFzHPukL+demXG7q93rpUXQnVCf
	fgcgRli3xvE2oS3otCEwP8BFoN5OhLmOtFa+7TyA599X04OSqykA3C5+5JhrT94npvxE6xKM1/b28
	9F0JBEYR6fgKqrQqHIw8Ogbw/M7phGEvh2K6EyovYeGmuVTZqVGJY/izP6w6EDbM/p9HDIDqiGnfQ
	ujth2L6ORwSuWJKt3ibdMoE60vmACgd4LcR/tFsHzPZx8eOIls3JNf/u/N5RTi8mSChjafYtKCRRN
	qfLY+rRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVViF-00000000jgE-3scR;
	Fri, 05 Jun 2026 14:39:55 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVViC-00000000jfo-1GN1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 14:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780670392; x=1812206392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tGGVYQWaG2DkpvWm3JrwEukHfVKBSZrMyMDbAqGqXa0=;
  b=MYdLEsKMAqbTa4aKqEHxpM/oR79ik/0dM1Z/3IX8uDUhR1xIdTTyXvM9
   ktHX4THYksJCerxzIg8iITVZC7fdxrhFV0OF+JXJrtJoI0AQ+PHQKO0S4
   jf9r3XbLLj9r6+OKWRa+jUp3QWaN1b1jVFpbMTfFTFTxqlbJ2TZWWTSeM
   +zOZixWA0NOTJx/+DSPZQ2/1ONzCFH5VMXaAK2j1+EV1CH2ncynBxePfW
   JtKvajmQfI1RQv4ybk7sTxqOBFxr8MP12ERy3nZif7ua0/8vPqqPHkeKp
   9tI47IfqfELK9r5/uCD/iPMSqHvLroi5tKw3mTayoXSZgLKmZNOPfUeK1
   Q==;
X-CSE-ConnectionGUID: m6Kq+vK0QYemD/+PiNToyw==
X-CSE-MsgGUID: 37bYWIHKSs27weeli8WGxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81564162"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81564162"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:39:51 -0700
X-CSE-ConnectionGUID: 91cfdvQtTb6Sjw2BUk+p+A==
X-CSE-MsgGUID: Ko5gEoa1TfK7dQiOOQDf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238505062"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2026 07:39:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVi4-00000000G82-1jKW;
	Fri, 05 Jun 2026 14:39:44 +0000
Date: Fri, 5 Jun 2026 22:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Adam Young <admiyo@os.amperecomputing.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Saket Dumbre <saket.dumbre@intel.com>, Len Brown <lenb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Huisong Li <lihuisong@huawei.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v01] mailbox/pcc.c:  add query channel function
Message-ID: <202606052232.LAlOTWJr-lkp@intel.com>
References: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_073952_420684_4657C05C 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jassibrar-mailbox/for-next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge soc/for-next linus/master v7.1-rc6 next-20260603]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Young/mailbox-pcc-c-add-query-channel-function/20260605-044323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20260604203749.168752-1-admiyo%40os.amperecomputing.com
patch subject: [PATCH v01] mailbox/pcc.c:  add query channel function
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260605/202606052232.LAlOTWJr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052232.LAlOTWJr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052232.LAlOTWJr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'q_chan' not described in 'pcc_mbox_query_channel'
>> Warning: drivers/mailbox/pcc.c:358 function parameter 'subspace_id' not described in 'pcc_mbox_query_channel'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

