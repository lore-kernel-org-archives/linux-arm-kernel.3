Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE37DD3CC92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 00:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYkNFvJwEuqAt6wVs1CFHuXsvdUZTZIn0wd8doPFLBA=; b=cxqakmkBdfjGzGVfVreMdfBOlE
	jii7+WlnCD1si7Z8Fn37StUZKxp821LZJ/DZ3PSNnquAjpWbkZX6sOIcgUiL97zIShcPqbtU1slXI
	URU1J1SQT6fHeSpb2h0uP5HuOmWigp5wR/bswlUoeL/78HvWIEOPh18zjLwOVhguInGAZ3DTn+z7O
	HbFQiltTEIo0e/GbD9Tj6hiquojjzN8LoZZUJFLr7+39YlvwqraIUqrRFJ01SeNwmEA/ZEC6H8lA3
	WkrCAwflrJ0WyBPZRy1sOf60VHCC/eXK/rBO+uEXCFVfJy3ceMdlAUfB00W6d/y5j3Dh4qVVkOSwR
	2fTiq2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBRf-0000000BGac-2Oy3;
	Thu, 15 Jan 2026 00:42:40 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBRc-0000000BGa0-45Xv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 00:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768437758; x=1799973758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=46ZrE0WMU4jUx8qBB1E6yFTcAcqcMpFbiNSws0WY6xE=;
  b=ca8d82kOIGOG8Se+Y6VHBq8d3OoE8cxLET9DZmZjod0oDgXmK3rMVBIx
   xkQrCqKBRrutu34Xl2cs8e6gX1IezWdx+GfQj/r+V9DmfGyQHEPMrtP7y
   hKbWpUmxy4YRFLIJ93mPmzrRAtUKsZysfptWViidMMm5yWbYwkHYP40xj
   0VlkGil6jH9tt6ZoCJd95fJzlvFAEdChL6Fd7d7bZTjCbxTRc2HUyo00K
   GrovC+tPJxuhnrzoZhwCW7jUoPE3hqW88AuNQIWTjitoGl3/xdAB8PhKv
   PPRxg3At7gAM48c75BrhpoPwvAvygfZ8wcX33Schh2O2kkRqCh1OKPueE
   A==;
X-CSE-ConnectionGUID: RvCHk5SPQrWnfsO0jnTNJw==
X-CSE-MsgGUID: LH4tL0sLSoifQr1kpL6GRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92418344"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="92418344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 16:42:37 -0800
X-CSE-ConnectionGUID: A342G+IkTnKFu9368MOmLg==
X-CSE-MsgGUID: 4sccYvdRSD+XgoGS7afEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="235541231"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jan 2026 16:42:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgBRY-00000000HGq-0FRf;
	Thu, 15 Jan 2026 00:42:32 +0000
Date: Thu, 15 Jan 2026 08:42:01 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Melin <tomas.melin@vaisala.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Tomas Melin <tomas.melin@vaisala.com>
Subject: Re: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
Message-ID: <202601150836.Yk8DcSZW-lkp@intel.com>
References: <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-3-864c161fa83d@vaisala.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_164237_091567_A8AD6A33 
X-CRM114-Status: GOOD (  11.30  )
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

Hi Tomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on xilinx-xlnx/master linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomas-Melin/rtc-zynqmp-check-calibration-max-value/20260108-223800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20260108-zynqmp-rtc-updates-v2-3-864c161fa83d%40vaisala.com
patch subject: [PATCH v2 3/5] rtc: zynqmp: rework read_offset
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260115/202601150836.Yk8DcSZW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150836.Yk8DcSZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150836.Yk8DcSZW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/spi/spi-amlogic-spifc-a4.o: in function `aml_sfc_set_bus_width':
   spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0x8c): undefined reference to `__ffsdi2'
   arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xac): undefined reference to `__ffsdi2'
   arm-linux-gnueabi-ld: spi-amlogic-spifc-a4.c:(.text.aml_sfc_set_bus_width+0xcc): undefined reference to `__ffsdi2'
   arm-linux-gnueabi-ld: drivers/rtc/rtc-zynqmp.o: in function `xlnx_rtc_read_offset':
>> rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0xd0): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: rtc-zynqmp.c:(.text.xlnx_rtc_read_offset+0x15c): undefined reference to `__aeabi_ldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

