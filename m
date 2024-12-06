Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1B1E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnlD6eehiCi0yW8lw5+nmSfnLEf5c3IgHaaruFEWcTc=; b=ZKITV+Ku6gOwGL6cL/oOYAJ36R
	eD+/xFPBoylrsmAGBKp2aWyX1d78U5nrGcRzuiRCz9DkBJY69MhH0aH8C4yZRwMmGDCrin6V0PIGR
	kmKzOd3IKa8pf2cUt4N+AsG5jqe43y+ycpL52XVn/5jJfJ/+XOwTkmd3IX9QfvwUT8IBoJuqIla0A
	oO5Fwv/+hJLlCMK0IvbVY9a3zP1ABjiOL35zutIdsB8DUQgMqDTW/g17r5NLDlr44YLaS8oe8IDmC
	8yYWmS+YlF9nQtclV12vsxAmpq7XlFyYNqKNMqd7+Alph1zHkP1iIg2YwOzSfVU6u0BejjQCFrBPG
	AOSrpTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcP5-00000002NYL-0ZBS;
	Fri, 06 Dec 2024 17:46:11 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcO2-00000002NPH-082j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733507106; x=1765043106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vlNGMkQtRJVFoqeWyR5VVwsR/4xTRvRmeXtD9OqxIFc=;
  b=mPIZF18VjoXD3+SPEUlLaJhKpmOgm3shzWNYu3B3rEb7S9MaEBVEiJxJ
   CsuZaWlIlPo1lFy8CeCJvSf1BzzAb/tHPXkt2gqfaT4+cCAacWiuTirHA
   8kmAc0xSue8tXWkrF0oYI18Pb7SyBoyzU+ezCKmpb6Y/SDpj0mXI8MfAt
   F7qKlJT/SigMH1J0GeB/UoVMwpqS4yu8hyHOj/4R0XLduUDGeYrG4rfgt
   Tt82RsTi3ISuT4YnL3iYPS5GDDj/iPBxlqjlZf0JKAb9HdaoNXK96t3JX
   hLsP7Jk0L1rOjxFqXGmx1RCjPKYyd7P/Wnr7JnA+HQQE0puKHQday9/H/
   Q==;
X-CSE-ConnectionGUID: iFRxNbc0S2eKBV1HVxmdnw==
X-CSE-MsgGUID: iJ3DFzKOQWyhz6tWoZOEsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33999115"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="33999115"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 09:45:04 -0800
X-CSE-ConnectionGUID: +7LaT3YuQJqTnzuTU58faA==
X-CSE-MsgGUID: YHtzXtNUQxC1JwVHbSM5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="95272272"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Dec 2024 09:44:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJcNt-00028N-0z;
	Fri, 06 Dec 2024 17:44:57 +0000
Date: Sat, 7 Dec 2024 01:44:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?unknown-8bit?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Frank <Li@nxp.com>,
	"open list:PCI DRIVER FOR NXP LAYERSCAPE GEN4 CONTROLLER" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR NXP LAYERSCAPE GEN4 CONTROLLER" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: PCI: mobiveil: convert
 mobiveil-pcie.txt to yaml format
Message-ID: <202412070127.BkBJhnZ4-lkp@intel.com>
References: <20241205201423.3430862-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205201423.3430862-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_094506_155401_6A285200 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.13-rc1 next-20241206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-PCI-mobiveil-convert-mobiveil-pcie-txt-to-yaml-format/20241206-041830
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20241205201423.3430862-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] dt-bindings: PCI: mobiveil: convert mobiveil-pcie.txt to yaml format
reproduce: (https://download.01.org/0day-ci/archive/20241207/202412070127.BkBJhnZ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070127.BkBJhnZ4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

