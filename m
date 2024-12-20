Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20F9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+FdABT5+3sBQCKYx4Y/j6i0+op2wLTUYbplc+n9dbE=; b=ZmzhQozNUyJD4wXfDOlRDXaKYR
	bQHDLFqqFTwMw+B+fmDj6/zfWV8PWuKDjEehkiYF7MaZu4nJ6gEHjAg406x6opEiEZlizEjv9HUA9
	JMhQMsDu/3rmyoyDZr2X2yj7L/LOhuO6Oq/x+m7S4mEjdD251601HvvbFjjGtuTIYzNwCsgtjfM5B
	2cI6Fx0KNpN0JZoytWCrJZBM+TVQzZo3g41pVW/Yzno65UMU00kyFQByyJb4E5srFqgivlZJ9nr+D
	Wfhgi4ZfdnS6epuQ+bS1JyZTDindlxzcpjkLAO+YVX9oWTtVtDUowY4L98LJIl1jH90112fKpNWD9
	TrJdxdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOika-00000005xLa-1wEq;
	Fri, 20 Dec 2024 19:33:28 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiic-00000005x0a-3lqY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 19:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734723087; x=1766259087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gE5B/harMQOgrohpMM0tjbu+TwLh/J6VRdbbGp8Y0Q4=;
  b=d7QtAmKC4F3lQeMLcwxEw2aw0kjsscKOj/hnMj0++5CdMOeJSkyeb1+5
   DThsEOU1Qtnz8Nu9v6NhOVdvkr2HNwwUx87LVMpb4PX2MHTrXcoI220ad
   lwgvoSpHbdF1Dda9EL5nb6rV//YWLA0Cl3yZpkUpiFNdoiqMJzeDvytIq
   pLwVTH3RDZ553Fb9Ed1cZle71cmOVt8o/OnxSGKxy388FWlyfK5yQ/9JX
   2ZbNTp+yXdrzvEoTByn1298PAGIsxHenE1NnfIHV0eBbLjjZ0T6lAtacp
   2CTrvxYRvbdJnZFjW+uubu+sEgZZQPN3DqE7Dn2BufNnoHbWb6TRfol/X
   w==;
X-CSE-ConnectionGUID: 9+IUHJ32TjWMkZnl1oL8/Q==
X-CSE-MsgGUID: LKRO0eEZQSyFFgRuTIRW+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45773437"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="45773437"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 11:31:15 -0800
X-CSE-ConnectionGUID: Im4d5srGTq6qkVGqKay+qA==
X-CSE-MsgGUID: ZEwlx298SN2ELracm5cmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="103568129"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2024 11:31:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOiiH-0001dL-1p;
	Fri, 20 Dec 2024 19:31:05 +0000
Date: Sat, 21 Dec 2024 03:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: MD Danish Anwar <danishanwar@ti.com>, aleksander.lobakin@intel.com,
	lukma@denx.de, m-malladi@ti.com, diogo.ivo@siemens.com,
	rdunlap@infradead.org, schnelle@linux.ibm.com,
	vladimir.oltean@nxp.com, horms@kernel.org, rogerq@kernel.org,
	pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net-next 1/4] net: ti: Kconfig: Select HSR for ICSSG
 Driver
Message-ID: <202412210336.BmgcX3Td-lkp@intel.com>
References: <20241216100044.577489-2-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216100044.577489-2-danishanwar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_113127_017045_FB6C08E6 
X-CRM114-Status: UNSURE (   7.56  )
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

Hi MD,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 92c932b9946c1e082406aa0515916adb3e662e24]

url:    https://github.com/intel-lab-lkp/linux/commits/MD-Danish-Anwar/net-ti-Kconfig-Select-HSR-for-ICSSG-Driver/20241216-180412
base:   92c932b9946c1e082406aa0515916adb3e662e24
patch link:    https://lore.kernel.org/r/20241216100044.577489-2-danishanwar%40ti.com
patch subject: [PATCH net-next 1/4] net: ti: Kconfig: Select HSR for ICSSG Driver
config: arm64-kismet-CONFIG_NET_SWITCHDEV-CONFIG_TI_ICSSG_PRUETH-0-0 (https://download.01.org/0day-ci/archive/20241221/202412210336.BmgcX3Td-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241221/202412210336.BmgcX3Td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210336.BmgcX3Td-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_SWITCHDEV when selected by TI_ICSSG_PRUETH
   WARNING: unmet direct dependencies detected for NET_SWITCHDEV
     Depends on [n]: NET [=y] && INET [=n]
     Selected by [y]:
     - TI_ICSSG_PRUETH [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_TI [=y] && PRU_REMOTEPROC [=y] && ARCH_K3 [=y] && OF [=y] && TI_K3_UDMA_GLUE_LAYER [=y] && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

