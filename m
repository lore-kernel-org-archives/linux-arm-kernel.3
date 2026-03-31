Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EF910F92E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 17:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeHvqiew2Y/ju1T0GobjBCZNMGeG07uDxOxTlV8Ufos=; b=MO0d/ciPrDeUM+5z0uHDKY9Uro
	BMT70BfGwEaFvgA11jigrMksqcxYngvePlaOKfPf1R0OC51f780MnPNHxpv5QjvmHPToEul5S45Xc
	c2hoInkLoIMm/EKIV2uiZcWCnMiLo6jJvbSSMnjKqwwZjbGlUBxDcZD5sZbLGWnyLcNm9z77QHOjO
	9/mbfpiNozEz2XqUrOjybPG5Ycpy3H8VY1eNkUkrWxeL+hY4vRIdJ4c2JD5r34+kYupmhqMo+lRbQ
	fp6abVRyW6yDsEj/aML+5C7/I+DJSNUFL+yNTCA6hMft+1YG5lGySNvT2yJUwfTQmf6uQOhsPi+kP
	jlq/d0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dKW-0000000DNI6-1BTm;
	Tue, 31 Mar 2026 17:56:44 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dKS-0000000DNHG-3p3x;
	Tue, 31 Mar 2026 17:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774979801; x=1806515801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TcZWBzzpqTS7aPD+ZnOCeM/2iUYCY9wQrFL9paJkYx8=;
  b=cRzGRS/cezPGrGogxLWnNqwrP8TiQc69+vgpwEHJXbVWyHE2k5dmQUHC
   jB/pYHymDpfxOjevJ2Dnhvi2w/x1APMoHWmx39YRx6EHw8lxPdt8Y61lB
   VDaujUsRTw+5XSesrPemi0fXKeJ6TmcUQ7iF/1M/+jU+xGel3887lxYL+
   YHC1TIz/NGGoQL0SQoiU/AZVDNfBkL5wXu0eZ5JLYYWjXGpdemxmGXHLR
   ZcTNneKWCMiTAj6dN6a9e268OJYkBvYahw5TOEZmLa1iEgbBjjfuBL0yx
   K5yy/ZYCIMXXybnM6H4a6Fa4BgE659HmOU2v6p3hTSwyDj1teEq90QUoY
   Q==;
X-CSE-ConnectionGUID: Yoz2HVP5Rd2VwmVVXpdUJg==
X-CSE-MsgGUID: UFMDQNoZS4Oog+7nJSeGDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87078498"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="87078498"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 10:56:40 -0700
X-CSE-ConnectionGUID: vgGp7BthSbC+6Z49GyWWcA==
X-CSE-MsgGUID: z3szsMWpQeymP90If8fszQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230501581"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Mar 2026 10:56:33 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7dKI-00000000463-3PEk;
	Tue, 31 Mar 2026 17:56:30 +0000
Date: Wed, 1 Apr 2026 01:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 7/9] regulator: Add MediaTek MT6392 regulator
Message-ID: <202604010103.FzAGRPye-lkp@intel.com>
References: <20260330083429.359819-8-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330083429.359819-8-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_105641_022888_1FA5DBB8 
X-CRM114-Status: GOOD (  13.77  )
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

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on broonie-regulator/for-next linusw-pinctrl/devel linusw-pinctrl/for-next lee-mfd/for-mfd-fixes linus/master v7.0-rc6 next-20260330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Leonardo-Scorcia/dt-bindings-mfd-mt6397-Add-MT6392-PMIC/20260331-081127
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260330083429.359819-8-l.scorcia%40gmail.com
patch subject: [PATCH v4 7/9] regulator: Add MediaTek MT6392 regulator
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260401/202604010103.FzAGRPye-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010103.FzAGRPye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010103.FzAGRPye-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/mt6392-regulator.c:181:18: warning: 'ldo_volt_table1b' defined but not used [-Wunused-const-variable=]
     181 | static const u32 ldo_volt_table1b[] = {
         |                  ^~~~~~~~~~~~~~~~


vim +/ldo_volt_table1b +181 drivers/regulator/mt6392-regulator.c

   180	
 > 181	static const u32 ldo_volt_table1b[] = {
   182		1500000, 1800000, 2500000, 2800000,
   183	};
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

