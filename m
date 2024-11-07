Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7957D5D67D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrEaqzRh9RjFI0C6ur6R2GS+/CXjD2mh4UQc0jLEjks=; b=zVWQgsGNTWtqjeWvUecjALcE+8
	WmFGRcwuy+qmzUhIYEwzttaR3jQTC53g3jJhME3/sIdX4F/VU+bRZMfkmNa2aVykW7UYtyAMFLpXd
	vONgbl6mvqWb1ziO1a2m+1KfyEZdfTve048AuD0FZzLy6waXzx15+v1B8sPIR4WKBHbSo+cjNUsxQ
	KxS6S3BHPC2SqILtse0o0M1Fq+t8MxleqsQ1IgGRa2HJIeVFQBPhz+eDTMEKhCe4AvFDBPPNLt398
	tsjA4i/O0npoz7FPQpLLIoO2ujDfxbq0CFQlW2XT6FZTKaaWPWC8XXwwFHp9Kl9Sbh1+i8d90WIrw
	rNYeVb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96Re-00000007poW-3jba;
	Thu, 07 Nov 2024 17:37:22 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96Pt-00000007pVV-2mtq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 17:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731000933; x=1762536933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fh7b2FLtKZz1fA4g8oA+3ghKoAEai4NjPZV7Xf1oozk=;
  b=iXMpCZghLNFUyVJ2QFQmS6wTbaXVU0Ur3mAH0figEqBnmC1BSErj+NuO
   JRGq8DbIp0g6jgxL51VZHi+PA7+5nUduug9Lqgf8KmDc6R92rE0kS0W7G
   5AxFDXMg+Yk/Vy1sQPqPao2HxIH0r/EnnQwl3/u/vi+mlOS8+skslXm7g
   at3upLZewJVhyg85CRclD5ZFd2R5ojl5gLNHTFlYwF5EYaS2R0frM1ndQ
   3p1mf7Lomo0WH4hURPlgcbgiMwXmDpbdCkyGkpXkl5wwUcM9340HoMVuo
   HLCzaKVgzLN1VQoE6DMGhKlhcO3Ypfv+J5IhWn/sgYTgvfqCYs6cbgR1Z
   w==;
X-CSE-ConnectionGUID: Bkihuy9uQRmT0scVT0ECKw==
X-CSE-MsgGUID: qfoqKn22RWWBUrx8woLK8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30281677"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="30281677"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 09:35:31 -0800
X-CSE-ConnectionGUID: sRYe6437RISlO9BLWn+mog==
X-CSE-MsgGUID: Hd+P5H2JSPSX7Ag2FJXLJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="84786005"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Nov 2024 09:35:27 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t96Pk-000qY8-39;
	Thu, 07 Nov 2024 17:35:24 +0000
Date: Fri, 8 Nov 2024 01:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Vabhav Sharma <vabhav.sharma@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, frank.li@nxp.com,
	pankaj.gupta@nxp.com, daniel.baluta@nxp.com,
	silvano.dininno@nxp.com, V.Sethi@nxp.com,
	meenakshi.aggarwal@nxp.com, Vabhav Sharma <vabhav.sharma@nxp.com>,
	Franck LENORMAND <franck.lenormand@nxp.com>
Subject: Re: [PATCH v3 4/4] firmware: imx: secvio: Add support for SNVS
 secvio and tamper via SCFW
Message-ID: <202411080130.F3kATjgU-lkp@intel.com>
References: <20241107-secvio-v3-4-ea27f1e9ced4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-secvio-v3-4-ea27f1e9ced4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_093533_983199_18E118E9 
X-CRM114-Status: GOOD (  11.79  )
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

Hi Vabhav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Vabhav-Sharma/dt-bindings-firmware-imx-add-nvmem-phandle/20241107-134504
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241107-secvio-v3-4-ea27f1e9ced4%40nxp.com
patch subject: [PATCH v3 4/4] firmware: imx: secvio: Add support for SNVS secvio and tamper via SCFW
config: nios2-randconfig-r131-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080130.F3kATjgU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241108/202411080130.F3kATjgU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080130.F3kATjgU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/imx-scu-secvio.c:59:15: sparse: sparse: symbol 'scdev' was not declared. Should it be static?
>> drivers/firmware/imx/imx-scu-secvio.c:387:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/firmware/imx/imx-scu-secvio.c:387:37: sparse:     expected void [noderef] __user *to
   drivers/firmware/imx/imx-scu-secvio.c:387:37: sparse:     got void *
>> drivers/firmware/imx/imx-scu-secvio.c:399:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void * @@
   drivers/firmware/imx/imx-scu-secvio.c:399:46: sparse:     expected void const [noderef] __user *from
   drivers/firmware/imx/imx-scu-secvio.c:399:46: sparse:     got void *

vim +/scdev +59 drivers/firmware/imx/imx-scu-secvio.c

    56	
    57	static struct platform_driver imx_secvio_sc_driver;
  > 58	struct platform_device *pdev;
  > 59	struct device *scdev;
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

