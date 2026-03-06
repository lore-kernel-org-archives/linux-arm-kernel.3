Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DEDFCC04F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFElwYG1YsdXvOmcPnGwrLyjy/Z58J1iPJBpk5wjpc8=; b=FoWw/SMHi1v0uzWcdx/3oFylRt
	lb0LAutmtCoJdmuoHCdo7/40FU3WtTgUZGleF6weCVESmhs8w5lRqiB1WOFnuHp740qvLqs/R4BrH
	P1ManPNqIj2/tDJPN2Dstsi4KQcl0+nzEn8PIH6JRsaL6j58eW9voGcUrEa4fRkfMBEXawf8mNeTg
	Cmls/VE7i8xXjHiEL21sl0JaKGGchPZYbNPtHCsinXyVnihOP+22vO2HKBe8JIUGxxPLYWX6c/5Or
	dHfBVHLxSjX7EfzDCH+ETfQnGnrXR9koY0lwZt5/MLDY3OTDe2Z1fbpWob4Su+431DePfmsV/6aJu
	RRqcyI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZ0Z-00000004HDS-0KZj;
	Fri, 06 Mar 2026 17:30:39 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZ0T-00000004HCc-37uK;
	Fri, 06 Mar 2026 17:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772818234; x=1804354234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8VmuFnYbiOKgaR+BBAUnY6HUkEujulh2Twpm6HK6CSU=;
  b=WlbUfbrtdpW8UO0jqDLo4POvpY8U2GcYCDe94DBPZvZ2AqD6vwrHxsMU
   IXyxD/T0EG9HyUZDiwKnY0/TIuNXbYauA0Obd9t9mkhoJ8C69IiSzhmDr
   vJU0omO4MTTisiPpRIX5La++2YtwQrG5jBm87D+1I7p/BQHo7ybPKXpJq
   yI8CKeJvIDJew2in9qIs1R+cXXYSNSCZfAdlLVq3IU/NTYidwPh/pNVtd
   71AaMjXxzurC6pOpdtx91oM+FmW1RUxqoqsqg5b9CbEwbH/fVV64kW7Yb
   2wDxI4qB7ZcLZBKFXgJ/y5OErBCdLapabZSOl+pdQOFTFa96ndW9PaIcj
   g==;
X-CSE-ConnectionGUID: FyIrSxaeTROzfckO1V22dw==
X-CSE-MsgGUID: YvMyj8kWSAe+M4pwxzswqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="76536352"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="76536352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 09:30:32 -0800
X-CSE-ConnectionGUID: 0bx+XxIITUy/ALxxQyoj5Q==
X-CSE-MsgGUID: qc/tcyJERO+MUV1m2NxX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="218305101"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2026 09:30:26 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyZ0H-00000000197-44lO;
	Fri, 06 Mar 2026 17:30:21 +0000
Date: Sat, 7 Mar 2026 01:29:40 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, naseefkm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, cjd@cjdns.fr,
	tsbogend@alpha.franken.de, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
	vkoul@kernel.org, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	nbd@nbd.name, ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <202603070131.ufbXMWzw-lkp@intel.com>
References: <20260303190948.694783-7-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303190948.694783-7-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_093033_803797_A1924F9F 
X-CRM114-Status: UNSURE (   8.82  )
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

Hi Caleb,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3fa5e5702a82d259897bd7e209469bc06368bf31]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/dt-bindings-clock-reset-Add-econet-EN751221-bindings/20260304-031451
base:   3fa5e5702a82d259897bd7e209469bc06368bf31
patch link:    https://lore.kernel.org/r/20260303190948.694783-7-cjd%40cjdns.fr
patch subject: [PATCH 6/8] PCI: mediatek: Add support for EcoNet EN7528 SoC
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603070131.ufbXMWzw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070131.ufbXMWzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070131.ufbXMWzw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pcie_retrain_link" [drivers/pci/controller/pcie-mediatek.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

