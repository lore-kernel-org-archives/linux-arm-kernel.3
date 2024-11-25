Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0D2D58D42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwPLPKNHPm3n+RkRysXQ+FuqGvtEDdbnI0FEGTb6oCs=; b=VIfq5mRj4rSDYvL1C5YBqNrZc0
	bWRvlDmrlVX9W6SwqbjWSAgs1UjYxWH3MOV11bmIYPmnHsgbYAgP8fmimKX3qNi4xIpIJsCQuzTeO
	EhVRBP+8eO+b4RkKx942177N/H1MH9F8TQGZEuUMAbg1UHSN6b0eRb5ZJfU71hqVP0To5ASWcd4OL
	7sHdPh2fWqyhYu0IpODZJ1jDc9M+Cx/iS1gpyDvQqFWt43+BYZUUlWVhzlrLGHxUUlDoAOHXpJJKB
	yQnFhw1ebMKLSyB+ekudmRCMkrILEQcMh/oGzk6dJP0rdYND8rnJsFOE4ZOHWcSrMwQw4NOb00rYV
	8xClwBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZ9L-000000088Cc-1P7O;
	Mon, 25 Nov 2024 13:29:11 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZ8N-0000000882m-2quj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 13:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732541291; x=1764077291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sESHCfmHmHaI8KY+ZzE7Zdm/gqTJOAtsxdweAV4cr24=;
  b=FYVYYmyXzzHVWXXM7D1ICtDLK66t3p2D71xlucFA2hV8w+Byrt4PrFRO
   sO2WsD9k4deEqOtutAVh86S7r7h0N7cv9fUCmMDAxXnhWqLnj0LHWnTd9
   GDrKPPZ8ijwVAO8mNuToGJHGkgNCIPtquBo+d2A5LkTnyqMXw1Mfoh8jY
   ExZdaf4XOUICL8BYtDzZbC4rW3zuAopn9Pk1ByARgEP5OVEtWvZT+4vFK
   l1LHRHho9QdNI3w2sbBVjoq+StntlcyomyRkzIPPekG/THYjr2YDYyp9r
   yTa1C+e7AzUlIknzab5fkX8UPH3jIz3YFGvSWdjUt+cyvNEx1nzO0S6nz
   A==;
X-CSE-ConnectionGUID: Xo7nh6XDR7CU8UREfqvb8A==
X-CSE-MsgGUID: g0O0vnTSQjiHO/5I9eSxGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="55151950"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="55151950"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 05:28:10 -0800
X-CSE-ConnectionGUID: EKBxTmvNRvKCf6ayHaqmfQ==
X-CSE-MsgGUID: s4BsTlWTRJ2gm3aQ0d27lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91732760"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Nov 2024 05:28:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFZ8C-0006Qj-2o;
	Mon, 25 Nov 2024 13:28:00 +0000
Date: Mon, 25 Nov 2024 21:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alistair Popple <apopple@nvidia.com>, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 05/25] fs/dax: Create a common implementation to break
 DAX layouts
Message-ID: <202411252137.GpJ4mLOe-lkp@intel.com>
References: <31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_052811_792504_46A3BD42 
X-CRM114-Status: UNSURE (   9.45  )
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

Hi Alistair,

kernel test robot noticed the following build errors:

[auto build test ERROR on 81983758430957d9a5cb3333fe324fd70cf63e7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/fuse-Fix-dax-truncate-punch_hole-fault-path/20241125-094004
base:   81983758430957d9a5cb3333fe324fd70cf63e7e
patch link:    https://lore.kernel.org/r/31b18e4f813bf9e661d5d98d928c79556c8c2c57.1732239628.git-series.apopple%40nvidia.com
patch subject: [PATCH v3 05/25] fs/dax: Create a common implementation to break DAX layouts
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241125/202411252137.GpJ4mLOe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252137.GpJ4mLOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252137.GpJ4mLOe-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dax_break_mapping" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

