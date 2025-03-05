Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F440C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 00:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fo7blU2Bz0ygJPtG4Wn+lGih/daURM9cZ9yeAGPof3Q=; b=0MN089ytL0peiLO2Wnh5bWfdNN
	qvXJf7K+ZdTJBrCWuPLa3MTjQPXmNdN2NUWH3y5k1Fsh0nYbmraA5QmlV9rOasWiObiS2+IwZ9g9Y
	xzYjEtaPc5hrlNmSfryLnUEMyeXX1SJQYNcZQ7l9pv8JYvjkBL41jf+Hi1UAcaXkL7mAqDS1NUiX3
	l74WLHKNgE8tynUbluEI2CFtx35k8V0ZIXIKEkZxp9/juGWVoidJ0cLIDzNXfmRt03wC8TgIFQNOo
	tX84w6keII/wiEkDX5lI/plqbjBybPFW1EvBQnVWD53qvsEXnOtzTn7ul2pjT4tTWwevjsgHCxDlC
	hPOXS+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpzBM-00000009hue-1qoe;
	Thu, 06 Mar 2025 00:33:48 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpy1t-00000009bmj-2Go0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 23:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741216798; x=1772752798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jNjm1cYUFMQZ9mfrDQzo9hhp7ND5yA4DLzm1+XAQYrg=;
  b=SL8Xl7DW3+RK4xFON3XCeQaMyp9PPsmBPUxs3nqneWq9WTRShCEA50Dp
   X47jUTVSP8Iood3l9P9UodIJ9UeZWbRghDKU450N8zcwnndmBUHeBSYV4
   W0I84V0wkZBlpzQWsvOUfJyTOSkjXuYxAOqK4akrKxeUfdD5AJrmheV4Z
   O9Lu4kICK8NutvEwGzkhPTHe0pA7XrefDzAw0bpMTV2HPbstQPUVLAvzk
   dC3So5hVoCCh560dDhquGAEHI8p9HLBpOwcv6Mu9dlNPERWHG9Vlavssd
   GTD5pfXRllm5VZBuLuoBc9XYYhE/QCXY8scVbdPUU1I/AebWBcJe+N+Ja
   A==;
X-CSE-ConnectionGUID: A47IXzCeSbSEWMQKczmdVQ==
X-CSE-MsgGUID: Gl900U07QOWOwAJQl7KDTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59613115"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="59613115"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 15:19:52 -0800
X-CSE-ConnectionGUID: HlxSlCs0TSCIaan0QpIjmA==
X-CSE-MsgGUID: jCEax0NNT1Cswvrw3DHVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="149607166"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Mar 2025 15:19:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpy1h-000MJ6-2W;
	Wed, 05 Mar 2025 23:19:45 +0000
Date: Thu, 6 Mar 2025 07:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Chen <kevin_chen@aspeedtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, derek.kiernan@amd.com,
	dragan.cvetic@amd.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Kevin Chen <kevin_chen@aspeedtech.com>
Subject: Re: [PATCH v2 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
Message-ID: <202503060750.pkwFWR24-lkp@intel.com>
References: <20250304104434.481429-4-kevin_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304104434.481429-4-kevin_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_151957_623799_12D6ED2E 
X-CRM114-Status: GOOD (  10.41  )
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

Hi Kevin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus lee-leds/for-leds-next lee-mfd/for-mfd-next robh/for-next lee-mfd/for-mfd-fixes linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Chen/ARM-dts-aspeed-g6-Add-AST2600-LPC-PCC-support/20250304-194530
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250304104434.481429-4-kevin_chen%40aspeedtech.com
patch subject: [PATCH v2 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
config: s390-kismet-CONFIG_MFD_SYSCON-CONFIG_ASPEED_LPC_PCC-0-0 (https://download.01.org/0day-ci/archive/20250306/202503060750.pkwFWR24-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250306/202503060750.pkwFWR24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060750.pkwFWR24-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_SYSCON when selected by ASPEED_LPC_PCC
   WARNING: unmet direct dependencies detected for MFD_SYSCON
     Depends on [n]: HAS_IOMEM [=n]
     Selected by [y]:
     - ASPEED_LPC_PCC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

