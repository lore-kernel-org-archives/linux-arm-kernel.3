Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEF5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 11:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6n+Y+0Mn3tzEtZfjjCZErQIge+1bRF7+E9/wI/xHXUQ=; b=leeedd5QcvcUKBqNzTiJh2msht
	dSAuscZSLSapabqEGrCs9UCgAWLdin9j59wKW5ZDoV4wxGABaVM4RRsFbZ82P8Rs1ePEI0ao2RIDy
	sIuHCh5yaBAzw1jvSuuGh1tM3ElOWo1/7f/ofb+No6D5OQeilo5wVpPKustTX/6UfSSHeLt+2Ze00
	J89yOe6R63P46xXw/Uxp40/m2LXVVKftgs+4MYfwbwMECCEI0DschyNQHv70Dl7rzmr/QtpPiOp/O
	ZUAh/du+CMMQZ0A1QdLaEXOxNPawkmKY0gpGT2j0tLN7LOUhO6FczIvAXMhimWfY67NdWUt4e0YY8
	wZ9tCNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9nD-00000007Idl-1JqM;
	Sat, 01 Nov 2025 11:29:11 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9n8-00000007IcE-18HI;
	Sat, 01 Nov 2025 11:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761996546; x=1793532546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Reok4oEuIAaxqAgmj0W2bIeJU4APzPDb2Uj5NGGYoJI=;
  b=UxgOBT2N7W59rq2qXZGDAqmUTsFACi4d1B2V1XDp9oIcUc4PXMB6+DTr
   e05AvrnLvrVFVVstfljp+vkmTdW7BMJ2VMHemqVMNvG+H94EDBARpmoaI
   mS0GpOSty0jNzqNUgtngQXuB0lppkuIfCEOD7h57YtehOtbbGoLqqYBHK
   kDG7yS2SNV6lsoQRYay1EvTwmTt4lafVzkcmMGoLGyD2sZ2dojJE4Hclv
   0sFu8SMm9MqHAoME78RbU/W0F1Ej5gvR6ZMgpFlXalDqYUIAeTqbrmN9P
   MtbiJLcOGvG28+ZJJWsRGAtId4FbTkEePTngB/Co+ipzJNN6ewYX9bfql
   w==;
X-CSE-ConnectionGUID: xbBf2YzVTA2+iHvWd4JFNA==
X-CSE-MsgGUID: +BWAo2lKR6OBOVNqWi4d1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63839658"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="63839658"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:29:03 -0700
X-CSE-ConnectionGUID: cKgZ26MZRE2lzqT36WXJvQ==
X-CSE-MsgGUID: rpFU1DQ1RS6UsQlYYlZchw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="187183168"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Nov 2025 04:28:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9mx-000OBq-01;
	Sat, 01 Nov 2025 11:28:55 +0000
Date: Sat, 1 Nov 2025 19:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Paul-PL Chen <paul-pl.chen@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] soc: mediatek: mtk-cmdq: Add
 cmdq_pkt_jump_rel_temp() for removing shift_pa
Message-ID: <202511011919.0lkK3DY8-lkp@intel.com>
References: <20251031160309.1654761-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031160309.1654761-3-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_042906_936572_95ADF7A6 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Jason-JH,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/soc-mediatek-Use-pkt_write-function-pointer-for-subsys-ID-compatibility/20251101-000555
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251031160309.1654761-3-jason-jh.lin%40mediatek.com
patch subject: [PATCH 2/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa
config: x86_64-buildonly-randconfig-001-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011919.0lkK3DY8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011919.0lkK3DY8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011919.0lkK3DY8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/mediatek/mtk-mmsys.c:14:
   In file included from include/linux/soc/mediatek/mtk-mmsys.h:11:
>> include/linux/soc/mediatek/mtk-cmdq.h:530:10: error: use of undeclared identifier 'EIMVAL'
     530 |         return -EIMVAL;
         |                 ^
   drivers/soc/mediatek/mtk-mmsys.c:170:26: error: no member named 'pkt_write_mask' in 'struct cmdq_client_reg'
     170 |                 ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
         |                       ~~~~~~~~~~~~~~~~ ^
   drivers/soc/mediatek/mtk-mmsys.c:172:30: error: no member named 'pa_base' in 'struct cmdq_client_reg'
     172 |                                                       mmsys->cmdq_base.pa_base,
         |                                                       ~~~~~~~~~~~~~~~~ ^
   3 errors generated.
--
   In file included from drivers/soc/mediatek/mtk-mutex.c:12:
   In file included from include/linux/soc/mediatek/mtk-mmsys.h:11:
>> include/linux/soc/mediatek/mtk-cmdq.h:530:10: error: use of undeclared identifier 'EIMVAL'
     530 |         return -EIMVAL;
         |                 ^
   drivers/soc/mediatek/mtk-mutex.c:1002:16: error: no member named 'pkt_write' in 'struct cmdq_client_reg'
    1002 |         mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
         |         ~~~~~~~~~~~~~ ^
   2 errors generated.
--
   In file included from mtk-mmsys.c:14:
   In file included from include/linux/soc/mediatek/mtk-mmsys.h:11:
>> include/linux/soc/mediatek/mtk-cmdq.h:530:10: error: use of undeclared identifier 'EIMVAL'
     530 |         return -EIMVAL;
         |                 ^
   mtk-mmsys.c:170:26: error: no member named 'pkt_write_mask' in 'struct cmdq_client_reg'
     170 |                 ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
         |                       ~~~~~~~~~~~~~~~~ ^
   mtk-mmsys.c:172:30: error: no member named 'pa_base' in 'struct cmdq_client_reg'
     172 |                                                       mmsys->cmdq_base.pa_base,
         |                                                       ~~~~~~~~~~~~~~~~ ^
   3 errors generated.
--
   In file included from mtk-mutex.c:12:
   In file included from include/linux/soc/mediatek/mtk-mmsys.h:11:
>> include/linux/soc/mediatek/mtk-cmdq.h:530:10: error: use of undeclared identifier 'EIMVAL'
     530 |         return -EIMVAL;
         |                 ^
   mtk-mutex.c:1002:16: error: no member named 'pkt_write' in 'struct cmdq_client_reg'
    1002 |         mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
         |         ~~~~~~~~~~~~~ ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/EIMVAL +530 include/linux/soc/mediatek/mtk-cmdq.h

   526	
   527	/* This wrapper has to be removed after all users migrated to jump_rel */
   528	static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
   529	{
 > 530		return -EIMVAL;
   531	}
   532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

