Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DA7CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83V8Z646mVNzx9401MPoYro6TvTHAhL4EUo02/1Nq0s=; b=VWkYcYywDpAO47/AWjtGaVsCwl
	x/dkBYS+xkOn0lQnpEBvjH91xi93lhMRuniqR6OqmqP0eN/HkRf+/9hz6tc/4gMv4sneL6F22iK3n
	I+5yY0EW/g5qaBwOcjbHHKnj7TusGlh8iZYigpZ09SQOiBxEsr6YwR47SxCxGg1Co+Ctx+sjplBVM
	UBVsmwGSRQoiQRSxYIOr6DGpYWIuEfwRMXGwXmh/oNDtRY2ww+BZnH+LI9PteeXv/VV0tOEY8MOBu
	on8+ZZA+zxiXGewdwqc/dFSU8gfqj+AuB2wI/uavtd0sLOhPb2Iq1MtoZT40rD+W+w6kr+oK1VZVK
	4h7lzikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6UA-0000000D210-1BDG;
	Wed, 13 Aug 2025 08:05:26 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6G1-0000000CzNw-0Gl1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 07:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755071450; x=1786607450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GCkcSwQXaPB+Reeu4y3cV78hJ9D/iB5yjlZx4Qatnh8=;
  b=mGrxNAGXzwyD7aEdOeeCbXbfjJxMYxcj/VEpPxnddezXAc/w8IPBmBwr
   nIaGT9PyTyiFn9r+RMakrXO45XKDznx5m1HNJFSc97itDo0EeYe/bO1Fb
   /gF3aEfDEeKuFvCnE1ZGo0mZb+e8aH4udxIZl2TidYnk5we8+gYFb01Qo
   3jVzmQTCbR2q8hPgVWzJAq/uNQQJYcZQpw4rLJ1lWat5YcJp+3cfJE5/+
   7YUZCxfbrQGQtBDu4/BZXfTYrLM/GaIlFCsxyZi5QINUyoPB9pn+5KSf5
   IxqGVWF/jmxrafUFElexmJsGs686cq+8dW7pKi3xWPfoGMPgU+JZsJftt
   w==;
X-CSE-ConnectionGUID: GepI10QeQMWcie+KGYhtqg==
X-CSE-MsgGUID: lwV6+U9pTaSYJYdLvUq3VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57260481"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57260481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 00:50:48 -0700
X-CSE-ConnectionGUID: UFpW3ZHJRgG7Yrcfgk7aGw==
X-CSE-MsgGUID: hr6+tZAJTK62MvVvrPVRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165625222"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2025 00:50:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um6Fc-0009gS-1J;
	Wed, 13 Aug 2025 07:50:29 +0000
Date: Wed, 13 Aug 2025 15:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] soc: fsl: qe: Add an interrupt controller for QUICC
 Engine Ports
Message-ID: <202508131517.P1Nfz0RF-lkp@intel.com>
References: <1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_005049_146949_966484FD 
X-CRM114-Status: GOOD (  14.02  )
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

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/soc-fsl-qe-Add-an-interrupt-controller-for-QUICC-Engine-Ports/20250812-195423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 1/4] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
config: powerpc64-randconfig-002-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131517.P1Nfz0RF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131517.P1Nfz0RF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131517.P1Nfz0RF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/fsl/qe/qe_ports_ic.c: In function 'qepic_probe':
>> drivers/soc/fsl/qe/qe_ports_ic.c:102:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     nb = (int)of_device_get_match_data(dev);
          ^


vim +102 drivers/soc/fsl/qe/qe_ports_ic.c

    94	
    95	static int qepic_probe(struct platform_device *pdev)
    96	{
    97		struct device *dev = &pdev->dev;
    98		struct qepic_data *data;
    99		int irq;
   100		int nb;
   101	
 > 102		nb = (int)of_device_get_match_data(dev);
   103		if (nb < 1 || nb > 32)
   104			return -EINVAL;
   105	
   106		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   107		if (!data)
   108			return -ENOMEM;
   109	
   110		data->reg = devm_platform_ioremap_resource(pdev, 0);
   111		if (IS_ERR(data->reg))
   112			return PTR_ERR(data->reg);
   113	
   114		irq = platform_get_irq(pdev, 0);
   115		if (irq < 0)
   116			return irq;
   117	
   118		data->host = irq_domain_add_linear(dev->of_node, nb, &qepic_host_ops, data);
   119		if (!data->host)
   120			return -ENODEV;
   121	
   122		irq_set_handler_data(irq, data);
   123		irq_set_chained_handler(irq, qepic_cascade);
   124	
   125		return 0;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

