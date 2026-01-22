Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1C7D3EE60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVPx498pL63xcPc56dIx1zi60xZFKj+s4Rq+nVTUx5Y=; b=EcQHPzEnOUEpQiiPD9xAaKMAix
	VWKvkXgcr42TZJguWSGodD0uSfbjqTmOHB6SkInsj4FQEUK3YPMeZ9SXDjmgCGPiYxc5wsqRcagtp
	K18X4/qa9zgRDEKUZeLwQGTHeVoeOCPH6xMJ6awbB+c7Q5YFU+ypfrbiCLJ4hvxN97WB0Nw8w9q8/
	K6x9iO0TDBYpA5bG6/V8X6Ooi+JnlGKN6t2IaXdhXLqWShQ/P2YFvAbR06Wf6RQT4kK5FfDVyf4KT
	jkieS+z9T5wCB+yr4HITx2BpM10pMtN7QNw9MKkY7RJga5RikEWhfdGEnf6XWHOSAm3vgR2/wHTQo
	5d23I5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuO2-000000076Xs-1ySG;
	Thu, 22 Jan 2026 13:06:10 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuNy-000000076XX-2joe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769087167; x=1800623167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rC6T3O4H3sHc69QHplsUYFl5tJd5RhVrogcigqQQ2PQ=;
  b=dFt848akYMn5lycZ18g6x3gIdYZ3hz929Ntv3eLZr/OQ0N0b1Y0k2tYF
   ZwcSxw4+JQZ7MiT0jkXUOj6XIOeBqhzf+wy9VFJYbOwsgxSmafeyLjCGF
   ROmBKkvv6DtG3rELifB5qulmO97OAtPTpp637dxnP2QNqRpv0CbvKchAw
   a3vR6PKYKHp9X2UZsAcBD/e4sbEM6zUhgeRsKjW0UbzcP//QLdYMPz+AJ
   8gd2pG/Sa3AmAOBKgsreg9NItGDjz5TCDXQFRtXyomSPri0565RWUPRzX
   ewsRCODXdUpfH6DDdzMtXrnuebwEDnxxJZte4FZLAh51yK7dthFvaLk7d
   w==;
X-CSE-ConnectionGUID: 7tlPk5uDSu+syvJgn9WUaQ==
X-CSE-MsgGUID: qOcXFDCpQZuLOKqM7G6jgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57892421"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="57892421"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 05:06:05 -0800
X-CSE-ConnectionGUID: 079ECkJBSHqbNlHT4t7v0w==
X-CSE-MsgGUID: Wl0Myg7PSjGDi9QeczkPvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206991199"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jan 2026 05:06:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viuNr-00000000Sqn-1c5V;
	Thu, 22 Jan 2026 13:05:59 +0000
Date: Thu, 22 Jan 2026 21:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Song <carlos.song@nxp.com>, andi.shyti@kernel.org,
	aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, vz@mleia.com,
	pandy.gao@nxp.com, B38611@freescale.com, wsa@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [Patch V3] i2c: imx-lpi2c: fix SMBus block read NACK after byte
 count
Message-ID: <202601222033.Qhu55YA4-lkp@intel.com>
References: <20260121094837.2651035-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121094837.2651035-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_050606_705814_00D6FD02 
X-CRM114-Status: GOOD (  11.73  )
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

Hi Carlos,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc6 next-20260121]
[cannot apply to andi-shyti/i2c/i2c-host]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Carlos-Song/i2c-imx-lpi2c-fix-SMBus-block-read-NACK-after-byte-count/20260121-175629
base:   linus/master
patch link:    https://lore.kernel.org/r/20260121094837.2651035-1-carlos.song%40nxp.com
patch subject: [Patch V3] i2c: imx-lpi2c: fix SMBus block read NACK after byte count
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260122/202601222033.Qhu55YA4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222033.Qhu55YA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601222033.Qhu55YA4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-imx-lpi2c.c:19:
   drivers/i2c/busses/i2c-imx-lpi2c.c: In function 'lpi2c_imx_read_init':
>> drivers/i2c/busses/i2c-imx-lpi2c.c:93:29: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      93 | #define MSR_RDF_ASSERTED(x) FIELD_GET(MSR_RDF, (x))
         |                             ^~~~~~~~~
   include/linux/iopoll.h:49:21: note: in definition of macro 'poll_timeout_us'
      49 |                 if (cond) { \
         |                     ^~~~
   include/linux/iopoll.h:193:9: note: in expansion of macro 'read_poll_timeout'
     193 |         read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, addr)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:228:9: note: in expansion of macro 'readx_poll_timeout'
     228 |         readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx-lpi2c.c:569:23: note: in expansion of macro 'readl_poll_timeout'
     569 |                 ret = readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
         |                       ^~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-imx-lpi2c.c:570:42: note: in expansion of macro 'MSR_RDF_ASSERTED'
     570 |                                          MSR_RDF_ASSERTED(val), 1, 1000);
         |                                          ^~~~~~~~~~~~~~~~


vim +/FIELD_GET +93 drivers/i2c/busses/i2c-imx-lpi2c.c

    70	
    71	#define MCR_MEN		BIT(0)
    72	#define MCR_RST		BIT(1)
    73	#define MCR_DOZEN	BIT(2)
    74	#define MCR_DBGEN	BIT(3)
    75	#define MCR_RTF		BIT(8)
    76	#define MCR_RRF		BIT(9)
    77	#define MSR_TDF		BIT(0)
    78	#define MSR_RDF		BIT(1)
    79	#define MSR_SDF		BIT(9)
    80	#define MSR_NDF		BIT(10)
    81	#define MSR_ALF		BIT(11)
    82	#define MSR_MBF		BIT(24)
    83	#define MSR_BBF		BIT(25)
    84	#define MIER_TDIE	BIT(0)
    85	#define MIER_RDIE	BIT(1)
    86	#define MIER_SDIE	BIT(9)
    87	#define MIER_NDIE	BIT(10)
    88	#define MCFGR1_AUTOSTOP	BIT(8)
    89	#define MCFGR1_IGNACK	BIT(9)
    90	#define MRDR_RXEMPTY	BIT(14)
    91	#define MDER_TDDE	BIT(0)
    92	#define MDER_RDDE	BIT(1)
  > 93	#define MSR_RDF_ASSERTED(x) FIELD_GET(MSR_RDF, (x))
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

