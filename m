Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1854FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 02:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULaIIjhpTJAWa5QBMSk63znh3XKsSvthXbJugH56gGQ=; b=biERnbTdb0vCVzaz+HdmUiUHPR
	rpTspQqB+kqXu/ulxRHnYVzgxCiU5K+q5AZauODSttDMGFNRu1raeaapuZ2ZUPI9gqrOGn2GjPZRA
	++JzLSggEaXgNMTbz4EwuMBBORqolQmEOQA4+ywCyL583RCkFRoMOhy0Des5PwAPGpeXG2+IZZWHb
	M1+IIr1cHOVAmtWHIVQfFZXdlOzK8M//IDE/sz0GfBSSyLQ1yQ5ppPK2CW1hQ/cWKg0zYz1px85NK
	8WuTa8VI/u/gh/Z+r5zfLPn+pYMmVTiMVAYu5FpSlUb9kfWzLMD8wCI1CKEDFfUeErwFqwzJL/Cmt
	Nz3FI2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LHO-00000005wkK-1gOu;
	Wed, 09 Apr 2025 02:35:06 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2LF2-00000005wRG-1PJx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 02:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744165960; x=1775701960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vnaDNkCLPpmH76yQp56KQf7WqL8mrYB+8sRUh34dcGc=;
  b=P6qgTGzaq1oFnypmWHPMeDDkPCphjrDRqSnBygJic0NXVwZiFiTlMVIP
   OYSr5l+Ak81jM90K9L6KQoZ7j7FL9U988ifUynMJaIphqKz0oKpuxaROz
   nPdXs2P0im5KMjqiLqpPhpkmrR+nabXS4gpZMjXKevq8zErGV02cvgDak
   8uu4bjs3rQuqPZ0/iCbrBsV2OvXlIPB+G+e3pHMwOdEEUOcPL4I3OYla5
   K1MhfH00k0xhydT6K7rx8ESzZEDdtZm93gXrPP9c2UPtiZIuAMRCeddnE
   fe+5RzQqOTqwXZ4uDqCnjkW31GNP4w8YuXZf7FegC4ZhOTSthIJdRzrWL
   w==;
X-CSE-ConnectionGUID: vJUs72/aQcK72OWjh4I/Bw==
X-CSE-MsgGUID: pZXEMZ0pSXiFG4uxuE/P4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49465373"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="49465373"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 19:32:37 -0700
X-CSE-ConnectionGUID: thhpgLzqTnyYqgpIXkTxAQ==
X-CSE-MsgGUID: 9HlMwltuT7uIdLoQ6jkFpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="151634018"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 19:32:33 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2LEt-0008CT-07;
	Wed, 09 Apr 2025 02:32:31 +0000
Date: Wed, 9 Apr 2025 10:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Heiner Kallweit <hkallweit1@gmail.com>,
	upstream@airoha.com, Kory Maincent <kory.maincent@bootlin.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Robert Hancock <robert.hancock@calian.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: Re: [net-next PATCH v2 11/14] net: axienet: Convert to use PCS
 subsystem
Message-ID: <202504091007.RSwPrfcI-lkp@intel.com>
References: <20250407232058.2317056-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407232058.2317056-1-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_193240_384021_816A3C3F 
X-CRM114-Status: GOOD (  10.07  )
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

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-Xilinx-PCS/20250408-072650
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250407232058.2317056-1-sean.anderson%40linux.dev
patch subject: [net-next PATCH v2 11/14] net: axienet: Convert to use PCS subsystem
config: arm-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091007.RSwPrfcI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091007.RSwPrfcI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091007.RSwPrfcI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/xilinx/xilinx_axienet_main.c:38:0:
   include/linux/pcs.h: In function 'pcs_get':
>> include/linux/pcs.h:165:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return -EOPNOTSUPP;
            ^
   include/linux/pcs.h: In function 'pcs_get_by_fwnode':
   include/linux/pcs.h:178:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return -EOPNOTSUPP;
            ^
   include/linux/pcs.h: In function 'pcs_get_by_dev':
   include/linux/pcs.h:191:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return -EOPNOTSUPP;
            ^


vim +165 include/linux/pcs.h

b7da98b4ee6f2f Sean Anderson 2025-04-07  162  
b7da98b4ee6f2f Sean Anderson 2025-04-07  163  static inline struct phylink_pcs *pcs_get(struct device *dev, const char *id)
b7da98b4ee6f2f Sean Anderson 2025-04-07  164  {
b7da98b4ee6f2f Sean Anderson 2025-04-07 @165  	return -EOPNOTSUPP;
b7da98b4ee6f2f Sean Anderson 2025-04-07  166  }
b7da98b4ee6f2f Sean Anderson 2025-04-07  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

