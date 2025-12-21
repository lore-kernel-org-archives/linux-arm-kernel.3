Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ED3D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv0RZUZUD/7eGDNAUz1N+trczdwSsFw0LoBnw39J6SA=; b=NnTzza+o46ifuyb9ucqBRWMeTg
	I4CqFAUHaLFJ+QpJl+ID/tK/JRyxamUjXQ3v5qhoF7UrhcbF0JsyTirMDdhnBHYIvKxtrsuh58OO7
	do7E9xpHbKfOD3ABHAjJCN962w2Y9feFMH/4eeHxUMHr3MVS1cnFrvy1Q22C6O2TAnPJ741JpUQ94
	vI/XqUWffh7lHv5w3Ptw480V8PFVizeQhm18VwoKhA49J6us0jYkfmDjEYK1EuCmSr51gMYGA1Nte
	cyz6C+XrswtrFmYMMbx78Ag9PaNtu/+6v8nwOhH2b/n03utd2mcLE6eL+oaM2dX4QcSjomF52NUG1
	44LnSVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDw8-0000000CDOb-3eOQ;
	Sun, 21 Dec 2025 07:33:04 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDw5-0000000CDOC-3fb4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 07:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766302382; x=1797838382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=acLNH9XZUwJ+/RUGFg15css9I9hbu1oRWu7mAn9c4XA=;
  b=RPk2S39raFefSgmMNL0y5LirZF3+SeuONNQCzGK4byi/x1LEx9q474cj
   iW56eXHfAY9AN2Bpk3B8Jw+dT2jY0FxpX9yRi8naVqlpP7FNberdU6jTi
   FiThVkaBTMVrtAbVi7MuR/IVn4OStNVjPHUm4d6jmx/Yad0/9FFK4+ICE
   BdaSrVKSy0OLdogdqjxiZMKjuddRQWt3d4L2zlvTSG0WZ+Yam4A2wOe+c
   +Pmbsh/xUgYzfA3+lLMMmlUJ5OKj4XClExenhPxPyI9Fwl2a+GR61QBxk
   UV78boy3OrzOrkyeVF0hYFeYz3YWumxzfxT1Y7h5KBN6WtyEmFuW87zpE
   g==;
X-CSE-ConnectionGUID: dXxct6QXQICJyfCIJjYJOQ==
X-CSE-MsgGUID: 1Be6MiMBRfmGhoDmmbpkNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72044554"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72044554"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 23:33:01 -0800
X-CSE-ConnectionGUID: WhT26M+xQ7i3MqpLrDYIvA==
X-CSE-MsgGUID: /f0OMu86QL+ajuC4w0edDw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 23:32:56 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXDvx-000000004y0-3IUv;
	Sun, 21 Dec 2025 07:32:53 +0000
Date: Sun, 21 Dec 2025 08:31:59 +0100
From: kernel test robot <lkp@intel.com>
To: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>,
	Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH v2 4/5] power: supply: max77759: add charger driver
Message-ID: <202512210844.O8gAG2p9-lkp@intel.com>
References: <20251218-max77759-charger-v2-4-2b259980a686@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-max77759-charger-v2-4-2b259980a686@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_233301_998322_C330386E 
X-CRM114-Status: GOOD (  10.28  )
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

Hi Amit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-fixes]
[also build test WARNING on sre-power-supply/for-next usb/usb-testing usb/usb-next usb/usb-linus v6.16-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-mfd-maxim-max77759-add-charger-child-node/20251219-065531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-fixes
patch link:    https://lore.kernel.org/r/20251218-max77759-charger-v2-4-2b259980a686%40google.com
patch subject: [PATCH v2 4/5] power: supply: max77759: add charger driver
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512210844.O8gAG2p9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210844.O8gAG2p9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/power/supply/maxim,max77759-charger.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Warning: include/rv/da_monitor.h references a file that doesn't exist: Documentation/trace/rv/da_monitor_synthesis.rst
   Using alabaster theme
   ERROR: Cannot find file ./include/linux/pci.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

