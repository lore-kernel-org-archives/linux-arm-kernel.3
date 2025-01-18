Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3707AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 02:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqovUAvTnWO1esoAEYa2H9gFSaosRbXEP9jCjc+Yy4E=; b=fwxUdI2auAm9wh2JvXuINX0LTD
	VZXAgMANZXxIg8XhaG1bb/gB/Dm6BNNYIolWcum8iVIW1uDo4lffsmfNcbjTI+oHaT/KApVpBp4S6
	xFC6ctWIgGRR2w/jWJKvVwjDZ31MN42r4N+pXr81Q35PGWJPwvKtvSV4NKjRFlJZtxl20R0RrywsN
	f7s3XEuk91FYMeCUOauisvK9IpDI5OnFhpgzbPtg2Rz3lI9mAOyyg0BqT0NN0drePMKh3D1wccMuN
	9WvlhkgyOjhpSfUm/RUGGRJSBaMp5UysAlZS9zcvQMgypHQeUIFf+wNKGlxlYWfK0PvI6NMZ4CrfL
	YXzO/chQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYykN-00000001jRV-18jH;
	Sat, 18 Jan 2025 02:39:39 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYyj6-00000001jLV-0JYa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 02:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737167900; x=1768703900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kodQxwwBcXy2fga1isLQuccPgQM8MH6REQC6XoX/EPw=;
  b=gY9sutq/jBah6ZC6NsQogrdFE74YWvnOCr9z/tkCBD0begs2BgXdhdoP
   wDc0F28aR8Ww7ttt1HWtry3hMRtfJUAhZ2bqQnvhzcCTfaaeEBiP8MTPU
   +Ol+x8lrGN7QpWvpdjU1prhBIIbfWgllP+ufcYjdIpnS5zQ8dya1LugN0
   aobSYUGzdgEpDZPuYUGbhQrjZM5ERPpQgShPsA9U2P/OXqcXL+YXCrpCD
   HxSs0EjdRDQt8gy6Y/u/+D3fjjDUaHGCf7H6HO0dEXmd2nyTazR0EkJG/
   A/JZoPmN7mKHcKPgrtRiPsZnT612fQAckvi9gFwFJSQzLEUuEWWTB2NnF
   w==;
X-CSE-ConnectionGUID: 5gmOF2x2Tyy+Kru3NScUaQ==
X-CSE-MsgGUID: CVQWfg50SY+Bq2Nu7RolEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48284276"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="48284276"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 18:38:14 -0800
X-CSE-ConnectionGUID: 1d+YHYsETxqJ+S+FuvUzjA==
X-CSE-MsgGUID: S0PV8amMTvq5OriV29SPuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="110962931"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2025 18:38:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYyit-000U11-1y;
	Sat, 18 Jan 2025 02:38:07 +0000
Date: Sat, 18 Jan 2025 10:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, catalin.marinas@arm.com,
	will@kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com,
	sudeep.holla@arm.com, xueshuai@linux.alibaba.com,
	baolin.wang@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org, lenb@kernel.org, tony.luck@intel.com,
	bp@alien8.de, yazen.ghannam@amd.com
Cc: oe-kbuild-all@lists.linux.dev, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v3 2/5] RAS/AEST: Introduce AEST driver sysfs interface
Message-ID: <202501181043.Qi8ohhYk-lkp@intel.com>
References: <20250115084228.107573-3-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115084228.107573-3-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_183820_125593_C4EDFD9D 
X-CRM114-Status: GOOD (  11.81  )
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

Hi Ruidong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge arm64/for-next/core ras/edac-for-next linus/master tip/smp/core v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/ACPI-RAS-AEST-Initial-AEST-driver/20250115-164601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250115084228.107573-3-tianruidong%40linux.alibaba.com
patch subject: [PATCH v3 2/5] RAS/AEST: Introduce AEST driver sysfs interface
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501181043.Qi8ohhYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181043.Qi8ohhYk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
>> Warning: /sys/kernel/debug/aest/<dev_name>/<node_name>/record<index>/err_* is defined 2 times:  ./Documentation/ABI/testing/debugfs-aest:69  ./Documentation/ABI/testing/debugfs-aest:76
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

