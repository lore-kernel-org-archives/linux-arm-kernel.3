Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E701C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQuRRc6UjZv7MMvZYp9f0IgnfsoYjE67I7AAiwlMvi8=; b=CtLWDozU/L95olb/hyUNoMjZ4q
	oOmXTuxBGmgUU8Tc0OwhmVwA6u3eg7xmsvTJAxKMcOKywwcPPInTmZDvHt1d+JvDKvf0+8u9aRIi1
	MNGqdN6SfPmKsGGGJ1Q4+dRVZKvmKq9gr1EmgFM+6UhcmwruufQwVVkegQx0GB7TsXy+52VEc+JLC
	Vus1gPceOEv9xcf7gubQEHjJes8B75Agtdq4NJMfbcAO3Sjba+yaZBatqSG938vJDeYL5DaG+zlUT
	5pUo3jW2rzFTnsGvdaFvI/n83BrB87i3GAFOEY5aNsdGYDKXb3GJ0zS8fEb5Nu8cCihGwb1Mg7oMg
	sm+ItDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwr4-00000005CIW-0QeJ;
	Tue, 11 Feb 2025 20:27:38 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwpd-00000005C2o-4424
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 20:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739305570; x=1770841570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GYEqww3EBLVnWe6k0sAX86yC5Szn3LGi9iPyMVCxXQk=;
  b=ZGEAGG2BWjvuMecvFvRknGAneQV1ZexsmGrYD9khyg05RtksGMOhqxLy
   0jtXzg/tYnf8ivGRPzRr3ueswB3W55tHwa0fCOmYH8Swyz9P42yXLQuP3
   s3YZAqZaGkzOOb/ynZNZvPRQepOQfD/TEtGHUWaxgpb3sDxNfsNUpaL/r
   swPhMKTJtINLmkxAT6SMqC3bMH0c46CWk1ymnerRlf94Lb6NWMmDHQzpB
   tGu19NME6z5PqaL0dV1r8vW1OeVMetuIT09zDRj9LYyLvVVL02y1RhC2m
   ekPEZr50CV/xB0wh7YkfR1VlpWUt5kvicu1bMuTR07R1NQwIitfUZFE8u
   w==;
X-CSE-ConnectionGUID: s17iJy9LRLyzHd5dvczQUA==
X-CSE-MsgGUID: LbkX4FZ8QVmKWeV1bvoRRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39137467"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="39137467"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 12:26:05 -0800
X-CSE-ConnectionGUID: 7SJUQcyPQbi74R8o9WyK9A==
X-CSE-MsgGUID: SSlMJQhpTpe3zjU+tOGBmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117791598"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2025 12:26:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thwpR-0014ff-0x;
	Tue, 11 Feb 2025 20:25:57 +0000
Date: Wed, 12 Feb 2025 04:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, sebastian.fricke@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: Re: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
Message-ID: <202502120449.ZTdCf6WQ-lkp@intel.com>
References: <20250210090725.4580-8-nas.chung@chipsnmedia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210090725.4580-8-nas.chung@chipsnmedia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_122610_012629_4F1B4FEE 
X-CRM114-Status: GOOD (  14.53  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on arm64/for-next/core robh/for-next linus/master v6.14-rc2 next-20250210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nas-Chung/media-platform-chips-media-wave5-Rename-Kconfig-parameter/20250210-171144
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250210090725.4580-8-nas.chung%40chipsnmedia.com
patch subject: [PATCH 7/8] media: chips-media: wave6: Add Wave6 control driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250212/202502120449.ZTdCf6WQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120449.ZTdCf6WQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120449.ZTdCf6WQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:10:
   drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c: In function 'wave6_vpu_ctrl_load_firmware':
>> drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:383:36: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     383 |                 dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:383:17: note: in expansion of macro 'dev_err'
     383 |                 dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
         |                 ^~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:383:54: note: format string is defined here
     383 |                 dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
         |                                                    ~~^
         |                                                      |
         |                                                      long int
         |                                                    %d
   drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c: In function 'wave6_vpu_ctrl_probe':
>> drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:928:38: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     928 |                 dev_info(&pdev->dev, "sram 0x%pad, 0x%pad, size 0x%lx\n",
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:928:17: note: in expansion of macro 'dev_info'
     928 |                 dev_info(&pdev->dev, "sram 0x%pad, 0x%pad, size 0x%lx\n",
         |                 ^~~~~~~~
   drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c:928:69: note: format string is defined here
     928 |                 dev_info(&pdev->dev, "sram 0x%pad, 0x%pad, size 0x%lx\n",
         |                                                                   ~~^
         |                                                                     |
         |                                                                     long unsigned int
         |                                                                   %x


vim +383 drivers/media/platform/chips-media/wave6/wave6-vpu-ctrl.c

   357	
   358	static void wave6_vpu_ctrl_load_firmware(const struct firmware *fw, void *context)
   359	{
   360		struct vpu_ctrl *ctrl = context;
   361		struct wave6_vpu_entity *entity = ctrl->current_entity;
   362		u32 product_code;
   363		int ret;
   364	
   365		ret = pm_runtime_resume_and_get(ctrl->dev);
   366		if (ret) {
   367			dev_err(ctrl->dev, "pm runtime resume fail, ret = %d\n", ret);
   368			mutex_lock(&ctrl->ctrl_lock);
   369			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
   370			ctrl->current_entity = NULL;
   371			mutex_unlock(&ctrl->ctrl_lock);
   372			release_firmware(fw);
   373			return;
   374		}
   375	
   376		if (!fw || !fw->data) {
   377			dev_err(ctrl->dev, "No firmware.\n");
   378			ret = -EINVAL;
   379			goto exit;
   380		}
   381	
   382		if (fw->size + WAVE6_EXTRA_CODE_BUF_SIZE > wave6_vpu_ctrl_get_code_buf_size(ctrl)) {
 > 383			dev_err(ctrl->dev, "firmware size (%ld > %zd) is too big\n",
   384				fw->size, ctrl->boot_mem.size);
   385			ret = -EINVAL;
   386			goto exit;
   387		}
   388	
   389		product_code = entity->read_reg(entity->dev, W6_VPU_RET_PRODUCT_VERSION);
   390		if (!PRODUCT_CODE_W_SERIES(product_code)) {
   391			dev_err(ctrl->dev, "unknown product : %08x\n", product_code);
   392			ret = -EINVAL;
   393			goto exit;
   394		}
   395	
   396		memcpy(ctrl->boot_mem.vaddr, fw->data, fw->size);
   397	
   398	exit:
   399		mutex_lock(&ctrl->ctrl_lock);
   400		if (!ret && wave6_vpu_ctrl_find_entity(ctrl, ctrl->current_entity)) {
   401			wave6_vpu_ctrl_remap_code_buffer(ctrl);
   402			ret = wave6_vpu_ctrl_init_vpu(ctrl);
   403		} else {
   404			ret = -EINVAL;
   405		}
   406		mutex_unlock(&ctrl->ctrl_lock);
   407	
   408		pm_runtime_put_sync(ctrl->dev);
   409		release_firmware(fw);
   410	
   411		mutex_lock(&ctrl->ctrl_lock);
   412		ctrl->current_entity = NULL;
   413		if (ret)
   414			wave6_vpu_ctrl_set_state(ctrl, WAVE6_VPU_STATE_OFF);
   415		else
   416			wave6_vpu_ctrl_boot_done(ctrl, 0);
   417		mutex_unlock(&ctrl->ctrl_lock);
   418	
   419		wake_up_interruptible_all(&ctrl->load_fw_wq);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

