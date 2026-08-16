Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EC8C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 02:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hf0bcgXhFsvZ7c7JmzPtO9xQACjT+wJvPR9UdOzXlo8=; b=rlYyEBRIDihGpxCr+6Mm6gurv2
	WBPnFTRGuIFBTFT1YiJI5gv0LeLEEvcusdvJZdZJWXNOgvKjJJGKGOV7YJA6ckmAk2pn5LxkDjt+2
	AyT17A5F06PZ5PJnUba9hOMwBu4/Kbocbs/nY3exSrkCHT/nWXEZqQcEzF96e39lZ2sy/61UIfmo/
	0LL6M/TYooloxg3J27IiQWq3lNE2sKnMqcXTMMidkMomAcFg5CtpstKIwHTtmakmtEvaet5O7t4ad
	Uw4aGSSHuPWjRM2IuClGR8VcYh+P4OemI3YGYCxM3OiXZPN9Fd0Tb12i6PifRV0eUYYJnQ5oCY+in
	nGiwZNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvQhq-00000004PYG-1bzs;
	Sun, 16 Aug 2026 02:34:38 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvQhn-00000004PXv-1RWr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 02:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786847676; x=1818383676;
  h=date:from:to:cc:subject:message-id;
  bh=aWMprau9E1JTMZxSXZEil3Kg0rLOZ+ml78UzAUfGLLI=;
  b=KjMD3OJQzMdaoTHJxIwSk9I6vUmZS7c6sy4vCRO8CIY2lrGLug1A03O3
   ZHpkYTJheHGAtDm+8IOVil8YsPJ0sAnZFE50PJvBXwdda8scXnMzf3uZc
   yEPs2TEwF3ceUxctE2BS/04YN0XYFA/Ifq+Q/O4ZUAclZ8RHbeSWbVaAC
   Q/8z/Wq0XYwfpFMgk27G4b9lkuEmDbiaTn4wbYt6h5QUtf2KahORPIwAH
   jGgDs4QNxlGwHGo2I+XlB26CWGTBXC8HVSBfQVh8MIA1x76Wz9UKviIwf
   rM0gH5GOkdcPz5bYlhYX99Jtno5ZgvEFTkp48LNXV9cBtUtdQTXRXsOkA
   Q==;
X-CSE-ConnectionGUID: l28jBwdmSaCCf7Z0Kv0ezw==
X-CSE-MsgGUID: 7HEUO7wuSCWLbHfmkx8jAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87129520"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87129520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 19:34:32 -0700
X-CSE-ConnectionGUID: fdGLr7gVSii6hbQCvrVxbA==
X-CSE-MsgGUID: HihxDhMPS3a1fqoB9d4ZGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="268838618"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Aug 2026 19:34:31 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvQhg-00000000ch7-0oDV;
	Sun, 16 Aug 2026 02:34:28 +0000
Date: Sun, 16 Aug 2026 10:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 136/217] Warning:
 drivers/regulator/lp872x.c:58 cannot understand function prototype: 'struct
 lp872x_dvs'
Message-ID: <202608161036.Aj9u7pLN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_193435_449007_05ED36B9 
X-CRM114-Status: UNSURE (   8.36  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: 1bfa9e891050872a9b1e1b4840d6a92bdc2d2502 [136/217] regulator: remove obsolete platform_data probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260816/202608161036.Aj9u7pLN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161036.Aj9u7pLN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161036.Aj9u7pLN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/regulator/lp872x.c:58 cannot understand function prototype: 'struct lp872x_dvs'
>> Warning: drivers/regulator/lp872x.c:69 cannot understand function prototype: 'struct lp872x_regulator_data'
>> Warning: drivers/regulator/lp872x.c:82 cannot understand function prototype: 'struct lp872x_platform_data'
--
>> Warning: drivers/regulator/max1586.c:30 cannot understand function prototype: 'struct max1586_subdev_data'
>> Warning: drivers/regulator/max1586.c:46 cannot understand function prototype: 'struct max1586_platform_data'
--
>> Warning: drivers/regulator/max8660.c:52 cannot understand function prototype: 'struct max8660_subdev_data'
>> Warning: drivers/regulator/max8660.c:63 cannot understand function prototype: 'struct max8660_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

