Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99BECCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qoaK4yMakgtgMKHI/qK9SUuNc61ZB/jZRmCofiSYi94=; b=rKRWybP2MA46ZlB11z4WdEOqwc
	qpAU8kDG5LbhXeSl0jG8FWx4mtQxwvlVSd0V+wZuDm51s+Wcp+ytLyxTsb8MM9B3NoR3J2bOz2ERL
	XZiavxbJq8y4tbjO7EQ9o7qLfoZrhzxjmuxLr1VBj1RC7BbAy6OTaHzu+KphlHYBabo2AZODzbRtL
	cgMkFuCHKwbnbcMVHjyCGclQ4fpLdduABV5ILx+96tBOy/DMY0E6YLpOAaYTO3MUKu9RvZEOID3BB
	AzL9DLP6Rq9pUqyQh2YjFysbPYpnuP2De0AvkBCsEHHbA1hzLNjBr6I2xihG4PlsGfG9sY120pXJv
	bihwwhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k2W-0000000Cswq-1MQ3;
	Fri, 03 Oct 2025 17:57:56 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4k2U-0000000CswT-0lGN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759514274; x=1791050274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SfAWQlorezkBZxxIHUCsLtcHflDB0Sm2Wq9hiH+hCB0=;
  b=CGHMD5MAUNEWxntjzx49yAVinzGYyF0V2kd2qexCz+WW6uuaSsZd3f+y
   xEMGIeNdblSvk11BisV/qP7YoCn//qIWcU0kyxh67JG2+Xl7N6HYkadA8
   ZlsOcJ+vpjsOlh2q3wOce49XgvXJ96rSmi5oQ9npnd1jHPkOPW+irCQF/
   qVXGffPBXj/VVXAV8LYkQ8UJafut2VsIJxnj1McUTg6nZaLwU8BYhGgZy
   h82BxMIFjCxBNp3lIv8DCu9HipzrZN1Q1Q6Zfm3pYt+3+QhEIBOvUgvHV
   Voy0ybhf/YSClBCsH2djh70+QajhIkUzcMOgq/fpKr7N0zYKmZwlf3oye
   w==;
X-CSE-ConnectionGUID: KzzC75MLQRSqYt5feAu/zw==
X-CSE-MsgGUID: AKEvwRa4TbCCsvYWsv/ogQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61509864"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="61509864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 10:57:46 -0700
X-CSE-ConnectionGUID: 2nTpPBVITSyMWNh7U2HbnA==
X-CSE-MsgGUID: fbK/03NWSXGaIAhLlvrs5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="178472428"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Oct 2025 10:57:45 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4k2H-0004n9-2M;
	Fri, 03 Oct 2025 17:57:41 +0000
Date: Sat, 4 Oct 2025 01:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [arm:clearfog 8/13] drivers/pci/pcie/aspm.c:827 pcie_aspm_cap_init()
 warn: inconsistent indenting
Message-ID: <202510040111.atsuGn0D-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_105754_317101_D4DBC78C 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git clearfog
head:   0c321d2afb01ca78544750d2c840a22f91251682
commit: 0932b03bba229e9456bb547a09ad43275ca8e6fc [8/13] mvebu/clearfog pcie updates
config: i386-randconfig-141-20251003 (https://download.01.org/0day-ci/archive/20251004/202510040111.atsuGn0D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040111.atsuGn0D-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/aspm.c:827 pcie_aspm_cap_init() warn: inconsistent indenting

vim +827 drivers/pci/pcie/aspm.c

   790	
   791	static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
   792	{
   793		struct pci_dev *child = link->downstream, *parent = link->pdev;
   794		u32 parent_lnkcap, child_lnkcap;
   795		u16 parent_lnkctl, child_lnkctl;
   796		struct pci_bus *linkbus = parent->subordinate;
   797	
   798		if (blacklist) {
   799			/* Set enabled/disable so that we will disable ASPM later */
   800			link->aspm_enabled = PCIE_LINK_STATE_ASPM_ALL;
   801			link->aspm_disable = PCIE_LINK_STATE_ASPM_ALL;
   802			return;
   803		}
   804	
   805		/*
   806		 * If ASPM not supported, don't mess with the clocks and link,
   807		 * bail out now.
   808		 */
   809		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
   810		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
   811		if (!(parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPMS))
   812			return;
   813	
   814		/* Configure common clock before checking latencies */
   815		pcie_aspm_configure_common_clock(link);
   816	
   817		/*
   818		 * Re-read upstream/downstream components' register state after
   819		 * clock configuration.  L0s & L1 exit latencies in the otherwise
   820		 * read-only Link Capabilities may change depending on common clock
   821		 * configuration (PCIe r5.0, sec 7.5.3.6).
   822		 */
   823		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
   824		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
   825		pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &parent_lnkctl);
   826		pcie_capability_read_word(child, PCI_EXP_LNKCTL, &child_lnkctl);
 > 827	dev_info(&parent->dev, "up support %x enabled %x\n",
   828		 (parent_lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10,
   829		 !!(parent_lnkctl & PCI_EXP_LNKCTL_ASPMC));
   830	dev_info(&parent->dev, "dn support %x enabled %x\n",
   831		 (child_lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10,
   832		 !!(child_lnkctl & PCI_EXP_LNKCTL_ASPMC));
   833	
   834		/* Disable L0s/L1 before updating L1SS config */
   835		if (FIELD_GET(PCI_EXP_LNKCTL_ASPMC, child_lnkctl) ||
   836		    FIELD_GET(PCI_EXP_LNKCTL_ASPMC, parent_lnkctl)) {
   837			pcie_capability_write_word(child, PCI_EXP_LNKCTL,
   838						   child_lnkctl & ~PCI_EXP_LNKCTL_ASPMC);
   839			pcie_capability_write_word(parent, PCI_EXP_LNKCTL,
   840						   parent_lnkctl & ~PCI_EXP_LNKCTL_ASPMC);
   841		}
   842	
   843		/*
   844		 * Setup L0s state
   845		 *
   846		 * Note that we must not enable L0s in either direction on a
   847		 * given link unless components on both sides of the link each
   848		 * support L0s.
   849		 */
   850		if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
   851			link->aspm_support |= PCIE_LINK_STATE_L0S;
   852	
   853		if (child_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
   854			link->aspm_enabled |= PCIE_LINK_STATE_L0S_UP;
   855		if (parent_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
   856			link->aspm_enabled |= PCIE_LINK_STATE_L0S_DW;
   857	
   858		/* Setup L1 state */
   859		if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
   860			link->aspm_support |= PCIE_LINK_STATE_L1;
   861	
   862		if (parent_lnkctl & child_lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
   863			link->aspm_enabled |= PCIE_LINK_STATE_L1;
   864	
   865		aspm_l1ss_init(link);
   866	
   867		/* Restore L0s/L1 if they were enabled */
   868		if (FIELD_GET(PCI_EXP_LNKCTL_ASPMC, child_lnkctl) ||
   869		    FIELD_GET(PCI_EXP_LNKCTL_ASPMC, parent_lnkctl)) {
   870			pcie_capability_write_word(parent, PCI_EXP_LNKCTL, parent_lnkctl);
   871			pcie_capability_write_word(child, PCI_EXP_LNKCTL, child_lnkctl);
   872		}
   873	
   874		/* Save default state */
   875		link->aspm_default = link->aspm_enabled;
   876	
   877		/* Setup initial capable state. Will be updated later */
   878		link->aspm_capable = link->aspm_support;
   879	
   880		/* Get and check endpoint acceptable latencies */
   881		list_for_each_entry(child, &linkbus->devices, bus_list) {
   882			if (pci_pcie_type(child) != PCI_EXP_TYPE_ENDPOINT &&
   883			    pci_pcie_type(child) != PCI_EXP_TYPE_LEG_END)
   884				continue;
   885	
   886			pcie_aspm_check_latency(child);
   887		}
   888	}
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

