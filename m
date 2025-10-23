Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77693CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 00:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CrzTgm8k9RlsReJFv3bI7ygR3IER4DYFbN55MgY7z8=; b=C3CZaJ4gKUpQ52TyrOWVY1ZIG6
	vW8x9QR7Tzvq960SNFU9iEDIYeeYTilk7O77Ys1OZIvAecq2TTGt6F8ZXGuENUETxgInDScy504WH
	fnWCid31reBj6LOBdxHpXLuttuUqj3e5lxVAiwzl/2iLGE0x4iLOXbvEdM5Z/IH5VjfV7H4CEnrDJ
	Iprxyhgpqc39a50xCIixlaYSyD4wO5lmMpVZ7XbgZC2A4EpycFOWrzHL/39lHtZ43uKUBOij4LpZx
	Y//BMDN5bJGqrGwgj4vnU5DcarMsdsEJp2B/VKldU4zRFNmX1OLqbIG8NG608k/06GPuX0MS/xorq
	7zimfr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiom-00000004cea-31XG;
	Thu, 23 Oct 2025 00:04:36 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBioj-00000004cdq-3ifR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 00:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761177874; x=1792713874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YaRWa+4fXlNlEgTLkC8isNnjxO4623M91te5nEqafqo=;
  b=aB1FYCsFt10IwQGAhPXTInhSs1EV6ejwNrpritEeJQdIBTUNojNDiPnc
   gr/Qz5/keFiTJ53FUfOGeplpq+lqUz3A6xchz5WqUdCGEMA4w2oawvTsj
   QG0Ybl2vrxyAEwDo5k5eWmphGJFh561VHtVrQV0/spXF/hIXP+Fz2p1kL
   PHNPcX/tawS0IFznAbQAW6WqB82hoOOt5gi07911al/JzxxnTTGUSbM+Y
   ilaLkA8BpUaSkNNLkBJl9R1/tSQ/h90qqED/ZgY3fJneH6QxdJmdP3Pqc
   eqNdELRuO1HU4DemRn8ngBY+k8Q6skciIPCIhuqRa9CInurJm/uydIFhQ
   g==;
X-CSE-ConnectionGUID: luIGNXzMTqiYYNjkpMhSUA==
X-CSE-MsgGUID: 6ooXmIbxR4mT9+5F0xn17w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73944583"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="73944583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:04:32 -0700
X-CSE-ConnectionGUID: +5yiHp4sRtiauTeU9tiIGA==
X-CSE-MsgGUID: zY4nswJCRleBt+pnFqLVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="184491032"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2025 17:04:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBiob-000Cqb-2F;
	Thu, 23 Oct 2025 00:04:25 +0000
Date: Thu, 23 Oct 2025 08:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org, Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: Re: [PATCH v4 8/9] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <202510230756.m2qLZNJc-lkp@intel.com>
References: <20251022074710.575-9-nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022074710.575-9-nas.chung@chipsnmedia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_170433_941557_17AFCF7E 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Nas,

kernel test robot noticed the following build errors:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on linuxtv-media-pending/master robh/for-next linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nas-Chung/media-v4l2-common-Add-YUV24-format-info/20251022-155246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20251022074710.575-9-nas.chung%40chipsnmedia.com
patch subject: [PATCH v4 8/9] media: chips-media: wave6: Add Wave6 control driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251023/202510230756.m2qLZNJc-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230756.m2qLZNJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230756.m2qLZNJc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/chips-media/wave6/wave6-vpu.c:25:
   drivers/media/platform/chips-media/wave6/wave6-vpu.c: In function 'wave6_vpu_remap_code_buf':
>> drivers/media/platform/chips-media/wave6/wave6-regdefine.h:83:57: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      83 | #define         REMAP_CTRL_INDEX(x)                     FIELD_PREP(GENMASK(15, 12), (x))
         |                                                         ^~~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu.c:131:27: note: in expansion of macro 'REMAP_CTRL_INDEX'
     131 |                           REMAP_CTRL_INDEX(i) |
         |                           ^~~~~~~~~~~~~~~~
--
   In file included from drivers/media/platform/chips-media/wave6/wave6-vpu-core.h:18,
                    from drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:17:
   drivers/media/platform/chips-media/wave6/wave6-vpu-core.c: In function 'wave6_vpu_core_check_state':
>> drivers/media/platform/chips-media/wave6/wave6-vpuapi.h:125:33: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     125 | #define FW_VERSION_MAJOR(x)     FIELD_GET(FW_VERSION_MAJOR_MASK, (x))
         |                                 ^~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in expansion of macro 'FW_VERSION_MAJOR'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '__dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu-core.c:133:9: note: in expansion of macro 'dev_dbg'
     133 |         dev_dbg(core->dev, "product 0x%x, fw_ver %d.%d.%d(r%d), hw_ver 0x%x\n",
         |         ^~~~~~~
--
   In file included from drivers/media/platform/chips-media/wave6/wave6-vpu-core.h:18,
                    from drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c:10:
   drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c: In function 'wave6_vpu_dbg_instance':
>> drivers/media/platform/chips-media/wave6/wave6-vpuapi.h:125:33: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     125 | #define FW_VERSION_MAJOR(x)     FIELD_GET(FW_VERSION_MAJOR_MASK, (x))
         |                                 ^~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c:34:25: note: in expansion of macro 'FW_VERSION_MAJOR'
      34 |                         FW_VERSION_MAJOR(inst->dev->attr.fw_version),
         |                         ^~~~~~~~~~~~~~~~
--
   In file included from drivers/media/platform/chips-media/wave6/wave6-hw.c:11:
   drivers/media/platform/chips-media/wave6/wave6-hw.c: In function 'wave6_send_command':
   drivers/media/platform/chips-media/wave6/wave6-regdefine.h:99:57: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      99 | #define         INSTANCE_INFO_CODEC_STD(x)              FIELD_PREP(GENMASK(31, 16), (x))
         |                                                         ^~~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-hw.c:237:27: note: in expansion of macro 'INSTANCE_INFO_CODEC_STD'
     237 |                 reg_val = INSTANCE_INFO_CODEC_STD(std);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-hw.c: In function 'wave6_vpu_get_version':
>> drivers/media/platform/chips-media/wave6/wave6-regdefine.h:125:57: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     125 | #define         STD_DEF1_HEVC_DEC(x)                    FIELD_GET(GENMASK(2, 2), (x))
         |                                                         ^~~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-hw.c:308:35: note: in expansion of macro 'STD_DEF1_HEVC_DEC'
     308 |         attr->support_decoders |= STD_DEF1_HEVC_DEC(std_def1) << W_HEVC_DEC;
         |                                   ^~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +83 drivers/media/platform/chips-media/wave6/wave6-regdefine.h

2fef07d3bbe662 Nas Chung 2025-10-22   71  
2fef07d3bbe662 Nas Chung 2025-10-22   72  #define W6_VPU_VCPU_CUR_PC				(W6_REG_BASE + 0x0004)
2fef07d3bbe662 Nas Chung 2025-10-22   73  #define W6_VPU_VINT_REASON_CLEAR			(W6_REG_BASE + 0x0034)
2fef07d3bbe662 Nas Chung 2025-10-22   74  #define W6_VPU_HOST_INT_REQ				(W6_REG_BASE + 0x0038)
2fef07d3bbe662 Nas Chung 2025-10-22   75  #define		HOST_INT_REQ_ON				BIT(0)
2fef07d3bbe662 Nas Chung 2025-10-22   76  #define W6_VPU_VINT_CLEAR				(W6_REG_BASE + 0x003C)
2fef07d3bbe662 Nas Chung 2025-10-22   77  #define		VINT_CLEAR				BIT(0)
2fef07d3bbe662 Nas Chung 2025-10-22   78  #define W6_VPU_VPU_INT_STS				(W6_REG_BASE + 0x0044)
2fef07d3bbe662 Nas Chung 2025-10-22   79  #define W6_VPU_VINT_ENABLE				(W6_REG_BASE + 0x0048)
2fef07d3bbe662 Nas Chung 2025-10-22   80  #define W6_VPU_VINT_REASON				(W6_REG_BASE + 0x004C)
2fef07d3bbe662 Nas Chung 2025-10-22   81  #define W6_VPU_REMAP_CTRL_GB				(W6_REG_BASE + 0x0060)
2fef07d3bbe662 Nas Chung 2025-10-22   82  #define		REMAP_CTRL_ON				BIT(31)
2fef07d3bbe662 Nas Chung 2025-10-22  @83  #define		REMAP_CTRL_INDEX(x)			FIELD_PREP(GENMASK(15, 12), (x))
2fef07d3bbe662 Nas Chung 2025-10-22   84  #define		REMAP_CTRL_PAGE_SIZE_ON			BIT(11)
2fef07d3bbe662 Nas Chung 2025-10-22   85  #define		REMAP_CTRL_PAGE_SIZE(x)			FIELD_PREP(GENMASK(8, 0), ((x) >> 12))
2fef07d3bbe662 Nas Chung 2025-10-22   86  #define W6_VPU_REMAP_VADDR_GB				(W6_REG_BASE + 0x0064)
2fef07d3bbe662 Nas Chung 2025-10-22   87  #define W6_VPU_REMAP_PADDR_GB				(W6_REG_BASE + 0x0068)
2fef07d3bbe662 Nas Chung 2025-10-22   88  #define W6_VPU_REMAP_CORE_START_GB			(W6_REG_BASE + 0x006C)
2fef07d3bbe662 Nas Chung 2025-10-22   89  #define		REMAP_CORE_START_ON			BIT(0)
2fef07d3bbe662 Nas Chung 2025-10-22   90  #define W6_VPU_BUSY_STATUS				(W6_REG_BASE + 0x0070)
2fef07d3bbe662 Nas Chung 2025-10-22   91  #define		BUSY_STATUS_SET				BIT(0)
2fef07d3bbe662 Nas Chung 2025-10-22   92  #define W6_VPU_RET_PRODUCT_CODE				(W6_REG_BASE + 0x0094)
2fef07d3bbe662 Nas Chung 2025-10-22   93  
2fef07d3bbe662 Nas Chung 2025-10-22   94  /* COMMON */
2fef07d3bbe662 Nas Chung 2025-10-22   95  #define W6_COMMAND_GB					(W6_REG_BASE + 0x104)
2fef07d3bbe662 Nas Chung 2025-10-22   96  #define W6_COMMAND					(W6_REG_BASE + 0x200)
2fef07d3bbe662 Nas Chung 2025-10-22   97  #define W6_QUERY_OPTION					(W6_REG_BASE + 0x204)
2fef07d3bbe662 Nas Chung 2025-10-22   98  #define W6_CMD_INSTANCE_INFO				(W6_REG_BASE + 0x210)
2fef07d3bbe662 Nas Chung 2025-10-22   99  #define		INSTANCE_INFO_CODEC_STD(x)		FIELD_PREP(GENMASK(31, 16), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  100  #define		INSTANCE_INFO_ID(x)			FIELD_PREP(GENMASK(15, 0), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  101  #define W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0		(W6_REG_BASE + 0x364)
2fef07d3bbe662 Nas Chung 2025-10-22  102  #define W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0		(W6_REG_BASE + 0x368)
2fef07d3bbe662 Nas Chung 2025-10-22  103  #define W6_CMD_SET_WORK_BUF_ADDR			(W6_REG_BASE + 0x5F0)
2fef07d3bbe662 Nas Chung 2025-10-22  104  #define W6_CMD_SET_WORK_BUF_SIZE			(W6_REG_BASE + 0x5F4)
2fef07d3bbe662 Nas Chung 2025-10-22  105  #define		SET_WORK_BUF_SIZE_ACK			0
2fef07d3bbe662 Nas Chung 2025-10-22  106  #define W6_RET_SUCCESS					(W6_REG_BASE + 0x208)
2fef07d3bbe662 Nas Chung 2025-10-22  107  #define W6_RET_FAIL_REASON				(W6_REG_BASE + 0x20C)
2fef07d3bbe662 Nas Chung 2025-10-22  108  #define W6_RET_INT_INSTANCE_INFO			(W6_REG_BASE + 0x21C)
2fef07d3bbe662 Nas Chung 2025-10-22  109  #define		INT_INSTANCE_INFO_CLEAR			0
2fef07d3bbe662 Nas Chung 2025-10-22  110  #define W6_RET_INSTANCE_ID				(W6_REG_BASE + 0x220)
2fef07d3bbe662 Nas Chung 2025-10-22  111  #define W6_RET_CQ_IN_TICK				(W6_REG_BASE + 0x23C)
2fef07d3bbe662 Nas Chung 2025-10-22  112  #define W6_RET_FW_RUN_TICK				(W6_REG_BASE + 0x240)
2fef07d3bbe662 Nas Chung 2025-10-22  113  #define W6_RET_HW_RUN_TICK				(W6_REG_BASE + 0x244)
2fef07d3bbe662 Nas Chung 2025-10-22  114  #define W6_RET_HW_DONE_TICK				(W6_REG_BASE + 0x248)
2fef07d3bbe662 Nas Chung 2025-10-22  115  #define W6_RET_FW_DONE_TICK				(W6_REG_BASE + 0x24C)
2fef07d3bbe662 Nas Chung 2025-10-22  116  #define W6_RET_RQ_OUT_TICK				(W6_REG_BASE + 0x250)
2fef07d3bbe662 Nas Chung 2025-10-22  117  
2fef07d3bbe662 Nas Chung 2025-10-22  118  /* COMMON - QUERY : GET_VPU_INFO */
2fef07d3bbe662 Nas Chung 2025-10-22  119  #define W6_RET_FW_VERSION				(W6_REG_BASE + 0x300)
2fef07d3bbe662 Nas Chung 2025-10-22  120  #define W6_RET_PRODUCT_NAME				(W6_REG_BASE + 0x304)
2fef07d3bbe662 Nas Chung 2025-10-22  121  #define W6_RET_PRODUCT_VERSION				(W6_REG_BASE + 0x308)
2fef07d3bbe662 Nas Chung 2025-10-22  122  #define W6_RET_STD_DEF0					(W6_REG_BASE + 0x30C)
2fef07d3bbe662 Nas Chung 2025-10-22  123  #define W6_RET_STD_DEF1					(W6_REG_BASE + 0x310)
2fef07d3bbe662 Nas Chung 2025-10-22  124  #define		STD_DEF1_AVC_DEC(x)			FIELD_GET(GENMASK(3, 3), (x))
2fef07d3bbe662 Nas Chung 2025-10-22 @125  #define		STD_DEF1_HEVC_DEC(x)			FIELD_GET(GENMASK(2, 2), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  126  #define		STD_DEF1_AVC_ENC(x)			FIELD_GET(GENMASK(1, 1), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  127  #define		STD_DEF1_HEVC_ENC(x)			FIELD_GET(GENMASK(0, 0), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  128  #define W6_RET_CONF_FEATURE				(W6_REG_BASE + 0x314)
2fef07d3bbe662 Nas Chung 2025-10-22  129  #define		CONF_FEATURE_AVC10BIT_ENC(x)		FIELD_GET(GENMASK(11, 11), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  130  #define		CONF_FEATURE_AVC10BIT_DEC(x)		FIELD_GET(GENMASK(9, 9), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  131  #define		CONF_FEATURE_HEVC10BIT_ENC(x)		FIELD_GET(GENMASK(3, 3), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  132  #define		CONF_FEATURE_HEVC10BIT_DEC(x)		FIELD_GET(GENMASK(1, 1), (x))
2fef07d3bbe662 Nas Chung 2025-10-22  133  #define W6_RET_CONF_DATE				(W6_REG_BASE + 0x318)
2fef07d3bbe662 Nas Chung 2025-10-22  134  #define W6_RET_CONF_HW_VERSION				(W6_REG_BASE + 0x31C)
2fef07d3bbe662 Nas Chung 2025-10-22  135  #define W6_RET_CONF_TYPE				(W6_REG_BASE + 0x320)
2fef07d3bbe662 Nas Chung 2025-10-22  136  #define W6_RET_FW_API_VERSION				(W6_REG_BASE + 0x32C)
2fef07d3bbe662 Nas Chung 2025-10-22  137  #define W6_RET_SHA_ID					(W6_REG_BASE + 0x330)
2fef07d3bbe662 Nas Chung 2025-10-22  138  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

