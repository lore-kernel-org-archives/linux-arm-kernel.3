Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2385FD5D695
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 00:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3X19bO/8A1ykt5WLwJdnzj5IAYaBH+LMIVFCh/j6qT0=; b=taxaqA/LXmfFtpOfRXP3STukGp
	0QZe61kq14qaPBGi30OKKE8V1RH8DAks18blJiyeQd2X3QOGyTbHnSGGDDn9fVjqOqsjlfO30lm54
	/N5tSmKjmEMT/4FzxpRdyNUDTto4jDDIkWNdeR3p9WD72Dyz83Xb6VsFGddGsdFligBD2WhKfGIDv
	35bvHRnDqW11h3JnePAi6BB0v1Nfp/OjIlA2uSjnEf/LN7uWddY2YcJr90ihMQh9sxjJRiFnita8p
	gjI2oDxBswUTM9r4tZp/twGLux0LtLSE09b/Hpi6Slg37bBUhfCywkZ0qBp79WjXtDYMIhxSj4oFU
	LOMhJMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9D6S-00000008rCs-3Pzc;
	Fri, 08 Nov 2024 00:43:56 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9D4Q-00000008r3V-40iY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 00:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731026511; x=1762562511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CmUZRygZ4UPlGvskAJ81DD3Jq3d1Dpg5a2sXaVTWYtw=;
  b=C03wkngC2fCa2XVpTzR1Dy5pjRSbeHckutNtISP5yo6rac2MkM7VUfc3
   gwEdTj70CGmdV99Y6qleqO67m97rJyqu0vfmFrxKqtlnYzbF7RqdoA0lf
   zyHvwie59q1iLnwxvKyoeAFNlEr6rGsjjVbzqkdPd/QBjrNEXu1mRcYuK
   wc7wKFsw1qpixD2KV4+BfT63zeZhc6oCEhU/k5lYeTcsPczjetHDxcVaB
   WYrwE/wtgrWEADYGNyoqQJVc7a5GSlmlVSTKYdSRVUv1+63WCx4IE4dsV
   LZOlWpiQ5JTxRP+XBSVR4eMscmay54kAuC31wppJmyVKJM7/n/fwCmr3O
   Q==;
X-CSE-ConnectionGUID: U5RBqOFBRiO65cGhWlGozg==
X-CSE-MsgGUID: Vi1Zb176Rn+HswGal8E7Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30856142"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30856142"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 16:41:48 -0800
X-CSE-ConnectionGUID: VyAfSg8xRomwEzapJ8OcTQ==
X-CSE-MsgGUID: kE2IlYXWRomBOPH8xMoSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="89943431"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Nov 2024 16:41:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9D4C-000qpW-2d;
	Fri, 08 Nov 2024 00:41:36 +0000
Date: Fri, 8 Nov 2024 08:41:02 +0800
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
Message-ID: <202411080826.ovlSnU8b-lkp@intel.com>
References: <20241107-secvio-v3-4-ea27f1e9ced4@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-secvio-v3-4-ea27f1e9ced4@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_164151_116874_5EC4A2C6 
X-CRM114-Status: GOOD (  11.05  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Vabhav-Sharma/dt-bindings-firmware-imx-add-nvmem-phandle/20241107-134504
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241107-secvio-v3-4-ea27f1e9ced4%40nxp.com
patch subject: [PATCH v3 4/4] firmware: imx: secvio: Add support for SNVS secvio and tamper via SCFW
config: csky-randconfig-001-20241108 (https://download.01.org/0day-ci/archive/20241108/202411080826.ovlSnU8b-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080826.ovlSnU8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080826.ovlSnU8b-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/firmware/imx/imx-scu.o: in function `imx_scu_probe':
>> imx-scu.c:(.text+0x3dc): undefined reference to `imx_scu_secvio_init'
>> csky-linux-ld: imx-scu.c:(.text+0x460): undefined reference to `imx_scu_secvio_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

