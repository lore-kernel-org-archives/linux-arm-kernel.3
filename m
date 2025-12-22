Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE7CE66886
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 02:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4b0AVWqU2i8eA5vP8y1GXsxHHkwJ90eXPFBqwdIcpo=; b=ye8rV9Ab/bFnC3+P3Seqyy9sH8
	QYwhxIUdDKrLhKHTeoM4ygC8yVy4YPXmplFyv36uv+0Np9sF1yXzkgR4dzYd8G8lmT/P5i87oYMiP
	OqMBfg9v+XP5Y38Pb6w1Gr6YkvHy1kbZTV6Jb1xpzQWs5yWLEl1bqlL8DIjQ4JNKRDG3PDVaR6j+D
	RW2Cpn3S7dS4FRIyeR5FY+iEbbfWnwDolN77j+MQzD9Daa/Cw4EUPD0jJtrE8THT8WaSEYNDA1Uld
	l3WtXtwdTyevf7m9KJD22OF1bHHHFN3YRLChSnyLxzMqyJ83Pq88SpFEq1vWqG+n4aOFfvASNK1pb
	i0QiOGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXVJE-0000000CyNp-2cX7;
	Mon, 22 Dec 2025 02:06:04 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXVJ7-0000000CyNH-3oIS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 02:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766369158; x=1797905158;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74Ut1XHK0Vm4PFNeT//uEB30ynxJ0edLsHANsPIf0HY=;
  b=bWmCM/e2Uj8Ij/Xe0o5DjYMfROnOTNgNi9CCTd/4dCy48D1h2CY8EvP0
   QUJWx3t8LHQKwE8aVv4oqWkDHlDGkBdLvtzg2Ykr9qWUENpcmYyVpJVZT
   wXusbEN2aC/7O+R3JY6fV0Lf4cyP2gbFugKSM31aDtwjiSJG+az5GvC1t
   W1pRA65OWaqBoHqQYYsSGJ3Tl2UfnNSNeUOcgGjtVhis42+6x5mdcmnSK
   rZUWD4RwbIlaN6Pcx1ZU3QV/rlhkL4sanEotb1hQmStENkEkQUQhGU7Mt
   5MWotenA0C4qvcxUI2PN4/XscmxdVhzcInMCGXYjBtOfTrjBZCQFhZGgH
   w==;
X-CSE-ConnectionGUID: Lw3ETrtKTRWqayMUvzqPWA==
X-CSE-MsgGUID: Ari+sJZERuOyoZltIMGEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68380072"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68380072"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:05:55 -0800
X-CSE-ConnectionGUID: yyog3z2hQm6/itLrAJirFQ==
X-CSE-MsgGUID: G27CFI2eSW6N9+rNHGbJrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="203873738"
Received: from lkp-server02.sh.intel.com (HELO 9d662e18a02b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Dec 2025 18:05:52 -0800
Received: from kbuild by 9d662e18a02b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXVIY-0000000003B-2U6u;
	Mon, 22 Dec 2025 02:05:35 +0000
Date: Mon, 22 Dec 2025 10:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v23 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <202512220932.Gu4LnMge-lkp@intel.com>
References: <20251219-imx-se-if-v23-3-5c6773d00318@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-imx-se-if-v23-3-5c6773d00318@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_180559_751904_9C21BE02 
X-CRM114-Status: GOOD (  12.38  )
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

Hi Pankaj,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4a26e7032d7d57c998598c08a034872d6f0d3945]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Gupta/Documentation-firmware-add-imx-se-to-other_interfaces/20251219-132830
base:   4a26e7032d7d57c998598c08a034872d6f0d3945
patch link:    https://lore.kernel.org/r/20251219-imx-se-if-v23-3-5c6773d00318%40nxp.com
patch subject: [PATCH v23 3/7] firmware: imx: add driver for NXP EdgeLock Enclave
config: xtensa-randconfig-001-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220932.Gu4LnMge-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220932.Gu4LnMge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220932.Gu4LnMge-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/imx/ele_base_msg.h:14,
                    from drivers/firmware/imx/ele_common.c:6:
   drivers/firmware/imx/ele_common.c: In function 'se_val_rsp_hdr_n_status':
>> drivers/firmware/imx/se_ctrl.h:16:25: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
    #define RES_STATUS(x)   FIELD_GET(0x000000ff, x)
                            ^~~~~~~~~
   drivers/firmware/imx/ele_common.c:241:11: note: in expansion of macro 'RES_STATUS'
     status = RES_STATUS(msg->data[0]);
              ^~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/firmware/imx/se_ctrl.c: In function 'get_se_soc_info':
>> drivers/firmware/imx/se_ctrl.c:168:6: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
         ^~~~~~~~~
   At top level:
   drivers/firmware/imx/se_ctrl.c:374:12: warning: 'se_resume' defined but not used [-Wunused-function]
    static int se_resume(struct device *dev)
               ^~~~~~~~~
   drivers/firmware/imx/se_ctrl.c:357:12: warning: 'se_suspend' defined but not used [-Wunused-function]
    static int se_suspend(struct device *dev)
               ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +16 drivers/firmware/imx/se_ctrl.h

    15	
  > 16	#define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
    17	#define MAX_NVM_MSG_LEN			(256)
    18	#define MESSAGING_VERSION_6		0x6
    19	#define MESSAGING_VERSION_7		0x7
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

