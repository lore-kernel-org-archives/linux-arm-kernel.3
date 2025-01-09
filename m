Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7967EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cgaLuih+sHYzsG6ByjkZHnH+MywHGixKxxgjBsWprw=; b=AeC2AxytJyObbO+EOrAoQsKx+D
	ft7qoZYpGDXnonjztkxkFIz3D78nDUIGUxK57vSLQIOpqD/LcUMMBXrVcdZQqz2WHaRKz5l5GJ4DP
	zWsOupo+TAtT+Xr3jiMdGUugjL7tV7HTtBxA0A5oSyAZ1SPu5PuWpNh212KeCZtNF7pC3Eg01S7Vk
	6g3nq1sHqX7CWVDnV3H1w9/g9IkEEfI8rv+zfIIdalYXt9hxFqV0RS0lZ9wfGBVJp1gE9k0S3Syq3
	Adt8KNOYOfYfuhpZp9OJK7edtt9Jw/RIM1abeGp+NkuvDtVEB53n+iSlBb0RgXuABrOPCuA77GXYc
	VjVJ5jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv9t-0000000Ccyc-30kF;
	Thu, 09 Jan 2025 16:13:21 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVv86-0000000Cchs-0W59
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736439090; x=1767975090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Emqtas35W+tRsMR+yz4iHAA5AcQzA9KyA6DL+J/Iba0=;
  b=QluCXVI7bfXG59zPxfKEw7PJ16wcqIaF9saWTQ2BLYI+Bd62wBJhgYrT
   0ikDl6qqL+9uXm1Y64DB6fegWoBdn9AhuA+EWmapaSvRrLU2IG6iwyh1U
   fmv/RU1KHOIwud+qZ9tkkefhzk1vgv0gyOfQnVrpLfv2Z1yJ9xhfvZmlJ
   OhuwoaWPLWjrOEDuBhnYOUKYuh9NkgH55CPJHEy/Uyqq59fwTAgN6NsGp
   B1r0PlETyMqbT+otrhN13KATUJ9el9CiVwNRsWO2BQoo5hCwT9TuZifZt
   YPHsPWDqGpg+JNIK/+ZHsSwGbOckEeMl376E+rrhynWpjVJz7mRZN1DvA
   A==;
X-CSE-ConnectionGUID: ORSnoVr6Q8+2YLTsnI5R0w==
X-CSE-MsgGUID: luPmNIgeRH+muy3bkgOvvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47286538"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47286538"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 08:11:29 -0800
X-CSE-ConnectionGUID: t7AQ2IhHQ4ifJgb5sRam5A==
X-CSE-MsgGUID: 40E7aMoRT8+QB5GezzapYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103257370"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jan 2025 08:11:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVv80-000Hnf-00;
	Thu, 09 Jan 2025 16:11:24 +0000
Date: Fri, 10 Jan 2025 00:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, fj6611ie@aa.jp.fujitsu.com
Subject: Re: [PATCH] serial: amba-pl011: Implement nbcon console
Message-ID: <202501092316.bZPuAcFC-lkp@intel.com>
References: <20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_081130_175847_4CC4E82F 
X-CRM114-Status: GOOD (  15.83  )
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

Hi Toshiyuki,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-linus]
[also build test ERROR on usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.13-rc6]
[cannot apply to tty/tty-testing tty/tty-next next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Toshiyuki-Sato/serial-amba-pl011-Implement-nbcon-console/20250108-085122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-linus
patch link:    https://lore.kernel.org/r/20250108004730.2302996-1-fj6611ie%40aa.jp.fujitsu.com
patch subject: [PATCH] serial: amba-pl011: Implement nbcon console
config: arm64-randconfig-002-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092316.bZPuAcFC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092316.bZPuAcFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092316.bZPuAcFC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tty/serial/amba-pl011.c:30:
   In file included from include/linux/amba/bus.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/tty/serial/amba-pl011.c:2851:4: error: call to undeclared function 'pl011_console_switch_to_nbcon'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2851 |                         pl011_console_switch_to_nbcon(amba_reg.cons);
         |                         ^
   3 warnings and 1 error generated.


vim +/pl011_console_switch_to_nbcon +2851 drivers/tty/serial/amba-pl011.c

  2839	
  2840	static int pl011_register_port(struct uart_amba_port *uap)
  2841	{
  2842		int ret, i;
  2843	
  2844		/* Ensure interrupts from this UART are masked and cleared */
  2845		pl011_write(0, uap, REG_IMSC);
  2846		pl011_write(0xffff, uap, REG_ICR);
  2847	
  2848		if (!amba_reg.state) {
  2849			/* Replaces the console descriptor if NBCON is selected. */
  2850			if (amba_reg.cons && use_nbcon)
> 2851				pl011_console_switch_to_nbcon(amba_reg.cons);
  2852	
  2853			ret = uart_register_driver(&amba_reg);
  2854			if (ret < 0) {
  2855				dev_err(uap->port.dev,
  2856					"Failed to register AMBA-PL011 driver\n");
  2857				for (i = 0; i < ARRAY_SIZE(amba_ports); i++)
  2858					if (amba_ports[i] == uap)
  2859						amba_ports[i] = NULL;
  2860				return ret;
  2861			}
  2862		}
  2863	
  2864		ret = uart_add_one_port(&amba_reg, &uap->port);
  2865		if (ret)
  2866			pl011_unregister_port(uap);
  2867	
  2868		return ret;
  2869	}
  2870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

