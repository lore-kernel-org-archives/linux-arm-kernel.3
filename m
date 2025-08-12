Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709EFCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 02:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+2BSqTE9b4vdbeurXBiimmenYHvwiKrCPCQzddJvsc=; b=4dCZVK3bm9uKkv1xnuuvFJfCDq
	UBn0gcdqjZaAohKs61hv9btf8CMIgsrbrYVs0FZHISwNY5Ndkc+n9nqOS6ovPWsZUt4VUGvAIfFab
	D2ZrtDM9MEDdhdpINs8Nbe7JOhTZ7v5dUlUYCxJg9BadgkqRXzenZ3M3Spm+m7S65MIam2mvKJ7s9
	qFHDALSi98AxTi02eAgZxc1mWqo4Nb4n6DjJqARd5rsRzjx0Neg8O4OhYFnPUzPkFxFO1FUcfLBPO
	9JcXZigkJZO4qPufHXiix9Wn6bseIXrHx1/ZFzRMqOhl/jWF66lIMy1c6O4BGWY94eeEOM2snFX7o
	TUXQgi3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulen7-00000009c4L-3WKd;
	Tue, 12 Aug 2025 02:31:09 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulekV-00000009bxm-0rtp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 02:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754965708; x=1786501708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERDc6HgIPWc+c9h6aqBfiaCNSHpUTxXrrgyXl87fFVs=;
  b=VdXcIRhybC5EoFr05njTCaI8WVo+Pj1EF6UVUzBEx6knxvfw9lbpFjAX
   wRrYtMAptK6tkUV0bttsHp7zLOiArQQibYEViMRBrBTTUb1lsJEbTcMG4
   mrGo0xelX8nyZCbk5klg88yiPAAJcu/0OhwSsYognL/+48quX0m4ybiHG
   DfaJ48vpxMH7vuuYYSFVihGVGLFtCS2cUcDW1Cd78kx5nvp2VNUUFIfmQ
   JjdRXcIZeAuTq7g97X8JZCVQu1fLwfphcmT6+gZ90xuneAl5qf/ipBHre
   lHR76IMacGq+d+Aw1blLEFwKmA+b+2JKacq7S+Y0rUTC3gDFA5FpPdlVM
   w==;
X-CSE-ConnectionGUID: x4MVFM9+ToaLXA5C3m0I3A==
X-CSE-MsgGUID: FNwnEItSQuerSm/RWsNA1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57375887"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57375887"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 19:28:25 -0700
X-CSE-ConnectionGUID: VPWNMlEPSEaCSYEKI8RCXQ==
X-CSE-MsgGUID: TUbvzhJGSkep8kTC2w5UbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165958752"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Aug 2025 19:28:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulekO-0006MS-01;
	Tue, 12 Aug 2025 02:28:20 +0000
Date: Tue, 12 Aug 2025 10:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 5/6] coresight: Add format attribute for setting the
 timestamp interval
Message-ID: <202508121018.1l0grTw7-lkp@intel.com>
References: <20250811-james-cs-syncfreq-v1-5-b001cd6e3404@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-james-cs-syncfreq-v1-5-b001cd6e3404@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_192827_286109_03E8F43B 
X-CRM114-Status: GOOD (  11.57  )
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

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on a80198ba650f50d266d7fc4a6c5262df9970f9f2]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Clark/coresight-Change-syncfreq-to-be-a-u8/20250811-174256
base:   a80198ba650f50d266d7fc4a6c5262df9970f9f2
patch link:    https://lore.kernel.org/r/20250811-james-cs-syncfreq-v1-5-b001cd6e3404%40linaro.org
patch subject: [PATCH 5/6] coresight: Add format attribute for setting the timestamp interval
config: arm-randconfig-003-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121018.1l0grTw7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121018.1l0grTw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121018.1l0grTw7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwtracing/coresight/coresight-etm-perf.c:25:
>> drivers/hwtracing/coresight/coresight-etm4x.h:247:10: fatal error: asm/sysreg.h: No such file or directory
     247 | #include <asm/sysreg.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.


vim +247 drivers/hwtracing/coresight/coresight-etm4x.h

03336d0f4d0d74 Suzuki K Poulose 2021-02-01  246  
03336d0f4d0d74 Suzuki K Poulose 2021-02-01 @247  #include <asm/sysreg.h>
03336d0f4d0d74 Suzuki K Poulose 2021-02-01  248  #define ETM4x_REG_NUM_TO_SYSREG(n)				\
03336d0f4d0d74 Suzuki K Poulose 2021-02-01  249  	sys_reg(2, 1, ETM4x_CRn(n), ETM4x_CRm(n), ETM4x_Op2(n))
03336d0f4d0d74 Suzuki K Poulose 2021-02-01  250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

