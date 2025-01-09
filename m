Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB2FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PwBEZz6YVr/6T8ss/EzcuHqwLAprNsdntStPdkHz4c=; b=CmNxL0FBIBj0MJ6h5C+lCuv7QN
	eDkDPfwOPKNyBq4dc9qD9f9fCwxh+TUY89tInd4xAavNHBUVbaoK+4LitNVysdwTNhTt9BuZANZAz
	SORHn13w+lSIh4UiLjqD2XluAkO93mL1gBrd+jtrmAJ5Ob4kzY68YN2byYAiu5y1VWgSfxPLRRDqm
	Q66shYvSn4g6t18WACABkIXABJdA4/MxzQ6YutN5wsqo16HyK69Zqza9Uo+9lgNAITtKvi/lK0vLt
	38ZeyUIfSPT36ZiCcoKD3eFTppWCk8enPE8sWDbZm3/L3PqtA7eJbsHOu1OClQzYkcSJ/bUhKcWpJ
	l3LI2HKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuxh-0000000Ca2L-0QT9;
	Thu, 09 Jan 2025 16:00:45 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuvN-0000000CZVs-20tJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736438301; x=1767974301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u0Q3qMre0aMHaDk85LcQYX7xMhhq2kI0NBFqwqx45t8=;
  b=OoaPzjmd2XD30JycM1srpN4H6ZtND3txLCSWo/qs/utDZ7gmko+TVR1M
   B6okt3ty3FzjufytWsAZ4qMPTypYK55l1fjEZZe0eooVwCsY1Iwt5pHsZ
   lLoNTbjNFHxEM7vgN7m/ikjW7uQ6ojaQleNi9I8H0Ei0KFSWgvwrwKZdk
   n9ARVFH6tv+I5kwjne0Ge3+ROJcRSSJMnkWa1tIFfDIagIx2IUouVC+Dg
   SyO9wQ+5t4LqQopEyA4twpSA9SxfJBxIbmX4BlKYYSnmmfKpU8PES1wdm
   1FLiYR6mniAsJB71gyk4KozVrnfsHvFZ9r2aRyeb4t6yi39763ABGxJlm
   A==;
X-CSE-ConnectionGUID: ihKSvSmgSH+WciqenIUpSg==
X-CSE-MsgGUID: AG45/RwUQTWfksBTsDilhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62084567"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="62084567"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 07:58:21 -0800
X-CSE-ConnectionGUID: ejKYjoAETXOFREmHOzu4cw==
X-CSE-MsgGUID: ITW0uxELTgG7RqmwdaaPGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103414324"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jan 2025 07:58:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVuvI-000HmZ-24;
	Thu, 09 Jan 2025 15:58:16 +0000
Date: Thu, 9 Jan 2025 23:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	fj6611ie@aa.jp.fujitsu.com
Subject: Re: [PATCH] serial: amba-pl011: Implement nbcon console
Message-ID: <202501092346.Q71aj5kq-lkp@intel.com>
References: <20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108004730.2302996-1-fj6611ie@aa.jp.fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_075821_530660_9F9F05C5 
X-CRM114-Status: GOOD (  14.48  )
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
config: arm64-randconfig-003-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092346.Q71aj5kq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092346.Q71aj5kq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092346.Q71aj5kq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/amba-pl011.c: In function 'pl011_register_port':
>> drivers/tty/serial/amba-pl011.c:2851:25: error: implicit declaration of function 'pl011_console_switch_to_nbcon' [-Wimplicit-function-declaration]
    2851 |                         pl011_console_switch_to_nbcon(amba_reg.cons);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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

