Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF78C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 17:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxHyXVTGdvPF5a9p9kgmM7fG6g2+URsMDm3UV8cQbCM=; b=a57CA8AFAUTOW/ZdeTESaD5VXL
	eKC6n1KaXeWWqasTwsN9FCIo4KUqFAdAz+SAHoFuYRB+wkY7d047kUQRHfdS+u2ecM5fY5xvB4e6F
	ZfQhq2NXfVXLgfy0hXe5gzzaxw/m78+EJ6qfInJ3zOBmzRhyHuLa3aJKWmOLlIbwZP+okEx0ONVHR
	xtCoGauBLsA+gVEA+VqYIlUZBHFbV1ypCMdx3Jdmhgpv5QuXoAIpfylCkvSni26tIQaUr1xccY+y6
	LgPyODC2vS0zXLg3Irgyp3gzAmwrKcDCLvjcBA4l2i3eOkrpCQ1on9CkIuTKPyuHXOJ88T2QwDMh7
	XKsMsiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uizMK-0000000B7Gs-1cMM;
	Mon, 04 Aug 2025 17:52:28 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uizJl-0000000B75k-3OFb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 17:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754329790; x=1785865790;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6heWKyDFbjItz7wuCWRrYQJUr7D5cG41YJHZWVIU6g=;
  b=d4o1GDu6MLTT5i98+kDNrdwZDzvF463kXsPUieVBCdfYZGRljhGABIgE
   ErOxs8Y1XqQ0jXlfBtDKqfc6Xq42cEDXOUjq0w9T+DQWVMAJECjLNb43b
   6sblvc3YtoVnH4SxRjhNw/G8ueqzSbaOBRyC8gaP2nmBU6aormS5MPk2N
   ch9hgLpOd6N+PsVDlw6mBO9S5HtRgTBZ+qbbPEfldxXFS1PnW3lznoOxx
   zku0NTbAylcdCQ/cOAf6BM3PppZBCStE39eyTr97aOawQpYKy37wN9GOl
   bd/EPUi87EN/DwafOLk9LtD8A5RSkVgdvU4S+4NXxALSe3BoemSqVssfn
   Q==;
X-CSE-ConnectionGUID: mheI1iQvRhWYGSqGzUEFKg==
X-CSE-MsgGUID: Iic0tekVTJ2/WckpLZ+eEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67304831"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67304831"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 10:49:42 -0700
X-CSE-ConnectionGUID: olE6/67RQQOuZ+UKVgVyYA==
X-CSE-MsgGUID: 3xthNx7uR+eN5fI4n0anQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163905010"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Aug 2025 10:49:38 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uizJX-0000At-0a;
	Mon, 04 Aug 2025 17:49:35 +0000
Date: Tue, 5 Aug 2025 01:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
	eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, srini@kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, varshini.rajendran@microchip.com
Subject: Re: [PATCH 02/15] nvmem: microchip-otpc: rework to access packets
 based on tag
Message-ID: <202508050141.HKFcYdLy-lkp@intel.com>
References: <20250804100219.63325-3-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804100219.63325-3-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_104949_858365_0E7E403E 
X-CRM114-Status: GOOD (  12.34  )
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

Hi Varshini,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on jic23-iio/togreg v6.16]
[cannot apply to linus/master next-20250804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Varshini-Rajendran/ARM-dts-microchip-sama7d65-add-cpu-opps/20250804-180839
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250804100219.63325-3-varshini.rajendran%40microchip.com
patch subject: [PATCH 02/15] nvmem: microchip-otpc: rework to access packets based on tag
config: arc-randconfig-002-20250804 (https://download.01.org/0day-ci/archive/20250805/202508050141.HKFcYdLy-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050141.HKFcYdLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050141.HKFcYdLy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/nvmem/microchip-otpc.c:83 struct member 'payload_info' not described in 'mchp_otpc_packet'
>> Warning: drivers/nvmem/microchip-otpc.c:83 Excess struct member 'id' description in 'mchp_otpc_packet'
>> Warning: drivers/nvmem/microchip-otpc.c:83 Excess struct member 'offset' description in 'mchp_otpc_packet'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

