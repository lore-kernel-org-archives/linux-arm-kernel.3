Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D24E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tt7lHcSj5kJ/ns4PrxRSwEUqvL+PzAG+QL06WBXm9bY=; b=OnMPk2tfJRwzp0UmfFOUFzriaB
	5Y6s8FCHRKhQofmVjL9j+5T4CP4elfj0kVPnzxeOsLsj5WGWlXZi9gJbSe8MY1QprXL1nvLwTkn07
	tcWS5bAh4RyK7ma00UL7lxAwdasH3C7Zg6TMSJxaygpmBhxc2vIoA7D8uu3K51y+QG8jWQVtU7VFD
	dF8KXit0J/iVeCIJaT7PdRUu3tOG/MygEc9DznIym3H/gazfgEaCcTCBue0thMe8TgHdyZRcgt1Dt
	LeuUbXGCmqazpcWZMiF12dGjsKXngADid7oTw+6D86cgzGdgMQeHggLyS+Zescuh+Q51vlSrbAb+n
	xCzj9Yog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEaX-0000000GjIX-1V7e;
	Thu, 05 Dec 2024 16:20:25 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEZV-0000000Gj7A-3izX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733415562; x=1764951562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RQuaPC2ur4uaraO165fvbtuw9fpDtmA6qNnsLNhAwWQ=;
  b=F5w6NooCn1BRixd2CaFtnzpC7FHVzPYYgpXeD11yeiArcc/npQoefem+
   WZhPWJRPQrn19RKTJ5PsOMEHWv7mX0Q+5wgU2Gp3qUw8SqJFQGYvbzPTA
   YoWR6N4xwIEdKLP74Ev2GNCRpPbEO46RIfJUlci8MQZ8V3MLSh82E8gwD
   9ICabrdhDib6Zajv/5SdhAl4nsEeW/atNBjQDXqPSwpwFvN6QcsCoEpfz
   MPnsIxC4mgRhDP8RMbzD7QxaPnqRW7rYU+/+uaydaqOWo1R/Vf2B7kLy6
   1IoFms+s3BSKitiEEVow/y1TzNEebqXxrbVr7343tKZfItJ7v5LPtGtvX
   Q==;
X-CSE-ConnectionGUID: i0oQSrRmR+Swu5up52NEkQ==
X-CSE-MsgGUID: tI5Q1Yn9R9enw7+3YfiozA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37522386"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="37522386"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 08:18:51 -0800
X-CSE-ConnectionGUID: SKjPmepHRFSK5ooVJrwuiQ==
X-CSE-MsgGUID: a+TN6FZqQSyXZ4kLpEe+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="99181428"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Dec 2024 08:18:46 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJEYu-0000C7-0P;
	Thu, 05 Dec 2024 16:18:44 +0000
Date: Fri, 6 Dec 2024 00:17:54 +0800
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
Subject: Re: [PATCH v4 4/4] firmware: imx: secvio: Add support for SNVS
 secvio and tamper via SCFW
Message-ID: <202412060014.woL5otGn-lkp@intel.com>
References: <20241205-secvio-v4-4-5c37cdc39573@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-secvio-v4-4-5c37cdc39573@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_081922_030691_DE0E49E4 
X-CRM114-Status: GOOD (  11.43  )
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

url:    https://github.com/intel-lab-lkp/linux/commits/Vabhav-Sharma/dt-bindings-firmware-imx-add-nvmem-phandle/20241205-125909
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241205-secvio-v4-4-5c37cdc39573%40nxp.com
patch subject: [PATCH v4 4/4] firmware: imx: secvio: Add support for SNVS secvio and tamper via SCFW
config: nios2-randconfig-r063-20241205 (https://download.01.org/0day-ci/archive/20241206/202412060014.woL5otGn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412060014.woL5otGn-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/imx/imx-scu-secvio.c:368:11-29: WARNING opportunity for simple_open, see also structure on line 419

vim +368 drivers/firmware/imx/imx-scu-secvio.c

   367	
 > 368	static int imx_secvio_sc_open(struct inode *node, struct file *filp)
   369	{
   370		filp->private_data = node->i_private;
   371	
   372		return 0;
   373	}
   374	
   375	static long imx_secvio_sc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
   376	{
   377		struct device *dev = file->private_data;
   378		struct secvio_sc_notifier_info info;
   379		int ret;
   380	
   381		switch (cmd) {
   382		case IMX_SECVIO_SC_GET_STATE:
   383			ret = imx_secvio_sc_get_state(dev, &info);
   384			if (ret)
   385				return ret;
   386	
   387			ret = copy_to_user((void __user *)arg, &info, sizeof(info));
   388			if (ret) {
   389				dev_err(dev, "Fail to copy info to user\n");
   390				return -EFAULT;
   391			}
   392			break;
   393		case IMX_SECVIO_SC_CHECK_STATE:
   394			ret = imx_secvio_sc_check_state(dev);
   395			if (ret)
   396				return ret;
   397			break;
   398		case IMX_SECVIO_SC_CLEAR_STATE:
   399			ret = copy_from_user(&info, (void __user *)arg, sizeof(info));
   400			if (ret) {
   401				dev_err(dev, "Fail to copy info from user\n");
   402				return -EFAULT;
   403			}
   404	
   405			ret = imx_secvio_sc_clear_state(dev, info.hpsvs, info.lps,
   406							    info.lptds);
   407			if (ret)
   408				return ret;
   409			break;
   410		default:
   411			ret = -ENOIOCTLCMD;
   412		}
   413	
   414		return ret;
   415	}
   416	
   417	static const struct file_operations imx_secvio_sc_fops = {
   418		.owner = THIS_MODULE,
 > 419		.open = imx_secvio_sc_open,
   420		.unlocked_ioctl = imx_secvio_sc_ioctl,
   421	};
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

