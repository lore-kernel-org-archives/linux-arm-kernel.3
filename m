Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4C7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dt1kczoXN1IjcsZEgdGpuHzPjUFVeWcPeY871Xb3e9A=; b=HrvB17Uf3E3fNoClg1B3WNwbjS
	550SI+EaBSHt2tYxZc9PoJkYkHj9P4HQXbLAOHbKlFOLIMLagVDPHOJXD0Hlcskm0CwkDszPQZv6c
	6Ub0SMueP3/eW9YLGDDjgKTI2sNvJMapAmqUfAAWjofSHC3cKKALouF5RgVSemKiu4xhSB+tBvEOW
	dsbVb1pSQR0OCF9FbBs7YXupKEzpLq09Ic+YUVyoaGYRmbVIJ4kRTCzymR0bJ4QVsqeS+kokCJjBW
	R8minNc4EE6r2aGJK4LG/LciJAliSJv7aaLMPSqtIdDJAG1XTxwHLzS74Q6bluvlj81TWRgwcl5Fk
	MTOS7YoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDo1P-00000006DKx-1n1f;
	Sat, 10 May 2025 17:29:59 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDnzK-00000006DDS-2sHB;
	Sat, 10 May 2025 17:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746898070; x=1778434070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+J/+CqkaZBq2Lqdhn+5CkAOalO3LtUaHMJsMspBO4Qs=;
  b=PGCpCOuhPA9456X+voyy1ZOC/Q9MsnE6HRWNku12sLykTBuT74itUWtA
   A7oM7+LDOU7himWfatfML5njr5R6gPVuvacnlNxKL+vbXcEkdLNm3FnyL
   qBfqKkNONO4UIm1dyuO1Lo9aQcRfyX7V7HuFkmgMOLXSs3AlA3oze7DdK
   NhFxZ9Djc39CaQfTNaLoQaOvyKyNMYLhSldbIuLJlMNePD2pDG4QXB+v7
   7xs+RNgN4KQzRupaGTwPG7L+9Ot9lkVO5EJUsk33htyvbx6OqoH/xn5n3
   RG67SHw9BbVIuSaeDgwi/zjs95w5QO5itbMfrJL2wDY3vqiujAkvLhDgO
   g==;
X-CSE-ConnectionGUID: Kf8V2f0MSeWikO2xj1aClQ==
X-CSE-MsgGUID: ABaxkzUyRMerQNx/bzndDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="52370604"
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="52370604"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2025 10:27:44 -0700
X-CSE-ConnectionGUID: cBLo+jBWRP+JHUZYaI3zLQ==
X-CSE-MsgGUID: Vqz4sNCcRO+QrY8wrOd+aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,278,1739865600"; 
   d="scan'208";a="174084803"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 May 2025 10:27:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDnz7-000DF1-2S;
	Sat, 10 May 2025 17:27:37 +0000
Date: Sun, 11 May 2025 01:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [net-next PATCH v3 11/11] net: airoha: add phylink support for
 GDM2/3/4
Message-ID: <202505110156.WGym4cxS-lkp@intel.com>
References: <20250510102348.14134-12-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510102348.14134-12-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_102750_778766_D5A2BA9E 
X-CRM114-Status: GOOD (  15.40  )
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-phylink-keep-and-use-MAC-supported_interfaces-in-phylink-struct/20250510-182833
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250510102348.14134-12-ansuelsmth%40gmail.com
patch subject: [net-next PATCH v3 11/11] net: airoha: add phylink support for GDM2/3/4
config: sh-randconfig-002-20250510 (https://download.01.org/0day-ci/archive/20250511/202505110156.WGym4cxS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505110156.WGym4cxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505110156.WGym4cxS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/airoha/airoha_eth.c:10:
>> include/linux/pcs/pcs.h:90:1: warning: 'fwnode_phylink_pcs_get_from_fwnode' defined but not used [-Wunused-function]
      90 | fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/pcs/pcs.h:78:12: warning: 'register_fwnode_pcs_notifier' defined but not used [-Wunused-function]
      78 | static int register_fwnode_pcs_notifier(struct notifier_block *nb)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fwnode_phylink_pcs_get_from_fwnode +90 include/linux/pcs/pcs.h

91110a42083f1a Christian Marangi 2025-05-10  24  
90fbe52edd2a1f Christian Marangi 2025-05-10  25  /**
90fbe52edd2a1f Christian Marangi 2025-05-10  26   * fwnode_pcs_get - Retrieves a PCS from a firmware node
90fbe52edd2a1f Christian Marangi 2025-05-10  27   * @fwnode: firmware node
90fbe52edd2a1f Christian Marangi 2025-05-10  28   * @index: index fwnode PCS handle in firmware node
90fbe52edd2a1f Christian Marangi 2025-05-10  29   *
90fbe52edd2a1f Christian Marangi 2025-05-10  30   * Get a PCS from the firmware node at index.
90fbe52edd2a1f Christian Marangi 2025-05-10  31   *
90fbe52edd2a1f Christian Marangi 2025-05-10  32   * Returns a pointer to the phylink_pcs or a negative
90fbe52edd2a1f Christian Marangi 2025-05-10  33   * error pointer. Can return -EPROBE_DEFER if the PCS is not
90fbe52edd2a1f Christian Marangi 2025-05-10  34   * present in global providers list (either due to driver
90fbe52edd2a1f Christian Marangi 2025-05-10  35   * still needs to be probed or it failed to probe/removed)
90fbe52edd2a1f Christian Marangi 2025-05-10  36   */
90fbe52edd2a1f Christian Marangi 2025-05-10  37  struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
90fbe52edd2a1f Christian Marangi 2025-05-10  38  				   int index);
90fbe52edd2a1f Christian Marangi 2025-05-10  39  
91110a42083f1a Christian Marangi 2025-05-10  40  /**
91110a42083f1a Christian Marangi 2025-05-10  41   * fwnode_phylink_pcs_get_from_fwnode - Retrieves the PCS provided
91110a42083f1a Christian Marangi 2025-05-10  42   *					by the firmware node from a
91110a42083f1a Christian Marangi 2025-05-10  43   *					firmware node
91110a42083f1a Christian Marangi 2025-05-10  44   * @fwnode: firmware node
91110a42083f1a Christian Marangi 2025-05-10  45   * @pcs_fwnode: PCS firmware node
91110a42083f1a Christian Marangi 2025-05-10  46   *
91110a42083f1a Christian Marangi 2025-05-10  47   * Parse 'pcs-handle' in 'fwnode' and get the PCS that match
91110a42083f1a Christian Marangi 2025-05-10  48   * 'pcs_fwnode' firmware node.
91110a42083f1a Christian Marangi 2025-05-10  49   *
91110a42083f1a Christian Marangi 2025-05-10  50   * Returns a pointer to the phylink_pcs or a negative
91110a42083f1a Christian Marangi 2025-05-10  51   * error pointer. Can return -EPROBE_DEFER if the PCS is not
91110a42083f1a Christian Marangi 2025-05-10  52   * present in global providers list (either due to driver
91110a42083f1a Christian Marangi 2025-05-10  53   * still needs to be probed or it failed to probe/removed)
91110a42083f1a Christian Marangi 2025-05-10  54   */
91110a42083f1a Christian Marangi 2025-05-10  55  struct phylink_pcs *
91110a42083f1a Christian Marangi 2025-05-10  56  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
91110a42083f1a Christian Marangi 2025-05-10  57  				   struct fwnode_handle *pcs_fwnode);
91110a42083f1a Christian Marangi 2025-05-10  58  
90fbe52edd2a1f Christian Marangi 2025-05-10  59  /**
90fbe52edd2a1f Christian Marangi 2025-05-10  60   * fwnode_phylink_pcs_parse - generic PCS parse for fwnode PCS provider
90fbe52edd2a1f Christian Marangi 2025-05-10  61   * @fwnode: firmware node
90fbe52edd2a1f Christian Marangi 2025-05-10  62   * @available_pcs: pointer to preallocated array of PCS
90fbe52edd2a1f Christian Marangi 2025-05-10  63   * @num_pcs: where to store count of parsed PCS
90fbe52edd2a1f Christian Marangi 2025-05-10  64   *
90fbe52edd2a1f Christian Marangi 2025-05-10  65   * Generic helper function to fill available_pcs array with PCS parsed
90fbe52edd2a1f Christian Marangi 2025-05-10  66   * from a "pcs-handle" fwnode property defined in firmware node up to
90fbe52edd2a1f Christian Marangi 2025-05-10  67   * passed num_pcs.
90fbe52edd2a1f Christian Marangi 2025-05-10  68   *
90fbe52edd2a1f Christian Marangi 2025-05-10  69   * If available_pcs is NULL, num_pcs is updated with the count of the
90fbe52edd2a1f Christian Marangi 2025-05-10  70   * parsed PCS.
90fbe52edd2a1f Christian Marangi 2025-05-10  71   *
90fbe52edd2a1f Christian Marangi 2025-05-10  72   * Returns 0 or a negative error.
90fbe52edd2a1f Christian Marangi 2025-05-10  73   */
90fbe52edd2a1f Christian Marangi 2025-05-10  74  int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
90fbe52edd2a1f Christian Marangi 2025-05-10  75  			     struct phylink_pcs **available_pcs,
90fbe52edd2a1f Christian Marangi 2025-05-10  76  			     unsigned int *num_pcs);
90fbe52edd2a1f Christian Marangi 2025-05-10  77  #else
91110a42083f1a Christian Marangi 2025-05-10 @78  static int register_fwnode_pcs_notifier(struct notifier_block *nb)
91110a42083f1a Christian Marangi 2025-05-10  79  {
91110a42083f1a Christian Marangi 2025-05-10  80  	return -EOPNOTSUPP;
91110a42083f1a Christian Marangi 2025-05-10  81  }
91110a42083f1a Christian Marangi 2025-05-10  82  
90fbe52edd2a1f Christian Marangi 2025-05-10  83  static inline struct phylink_pcs *fwnode_pcs_get(struct fwnode_handle *fwnode,
90fbe52edd2a1f Christian Marangi 2025-05-10  84  						 int index)
90fbe52edd2a1f Christian Marangi 2025-05-10  85  {
90fbe52edd2a1f Christian Marangi 2025-05-10  86  	return ERR_PTR(-ENOENT);
90fbe52edd2a1f Christian Marangi 2025-05-10  87  }
90fbe52edd2a1f Christian Marangi 2025-05-10  88  
91110a42083f1a Christian Marangi 2025-05-10  89  static struct phylink_pcs *
91110a42083f1a Christian Marangi 2025-05-10 @90  fwnode_phylink_pcs_get_from_fwnode(struct fwnode_handle *fwnode,
91110a42083f1a Christian Marangi 2025-05-10  91  				   struct fwnode_handle *pcs_fwnode)
91110a42083f1a Christian Marangi 2025-05-10  92  {
91110a42083f1a Christian Marangi 2025-05-10  93  	return ERR_PTR(-ENOENT);
91110a42083f1a Christian Marangi 2025-05-10  94  }
91110a42083f1a Christian Marangi 2025-05-10  95  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

