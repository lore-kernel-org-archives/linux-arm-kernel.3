Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820BDD49C66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd3ZWISkH7OCD0MlOUZh/i2rdOr7pszDoypE0edg7wA=; b=yRb/bRUAZnR6zBNmLGLc45pIBH
	USbXkv4+Qc9Z3th9Nosa+sopIfjYl1nVTtkZVNIjc210YfIdWkQm62WERCYMtk8Ds9bDpq+A9cyKr
	bApuR2wyY1Kju2NHmoR9dWMqYmhhzpsFZNUbuoonIOrSdMOXzIGatLAUthbr7DJxUMJiAoaNaEzLp
	qSddaAD/Wauj0Qppfubf6sI7zquNAsW4gF5dYGGtcQsU5bmuftZz0bXwCO8q7+AEER06DRhpBaoQ/
	pGtcP+A5GmmurVBgzkEfLCljs2RLiy5ulGYOhOxcBjwD8sYokZzdGmeHEnimS2sGTOe4ubi/c2O7x
	0IF9PqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljJA-00000001Ad3-3yy2;
	Fri, 30 Jan 2026 07:52:48 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljJ7-00000001AcI-34ZK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769759565; x=1801295565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aX2gGtLk0RdmVui+gtEWlxTOSd9DpW+YmCX91ZUxfTk=;
  b=JMexN6HBnxdflLggTKiCviUPY2RUbZz7Eg0hB3gvPSPVIfTHR18c+W7f
   ewRCjnPfdcSK+WoSNOrxW8EmszbHpQkMskPkmFRqR5bf6BQrY0XnWUIm8
   Rca+wmv6Y+0UaEkOV5yd+BiikztmOdDpPC40x1VJ8kKx89aE0jgppIkyT
   p0jSOWjGzuB+LGBC+aG8vX0bYacpuSjoZ6tgSFYdC4EbgMqnCP7bNs0Z2
   me6bGKMtLnRKlzojMocyH+GbSfyV7YY/5tL97LeHhTKdNul8eTR1jtt52
   AxDBL15kHcB+u4V75aKARZePj49yyF0Yvc90X2UFn+WEoL2DW/PdVbYdD
   A==;
X-CSE-ConnectionGUID: bPfLdIoUStiTvjjIDgDrfA==
X-CSE-MsgGUID: eoppa5QbRhKrYLrgf0oNkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96472144"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="96472144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 23:52:44 -0800
X-CSE-ConnectionGUID: 4lPDyHmuRlCDGd/lYki7Jg==
X-CSE-MsgGUID: gAwQQt+aTxyOY6vj7lBOxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="239522017"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2026 23:52:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vljIz-00000000cLg-3aEb;
	Fri, 30 Jan 2026 07:52:37 +0000
Date: Fri, 30 Jan 2026 15:51:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Geyko <ageyko0@gmail.com>, linux-staging@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, mripard@kernel.org, paulk@sys-base.io,
	mchehab@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, Andrew Geyko <ageyko0@gmail.com>
Subject: Re: [PATCH] cedrus: Convert bitfield macros to FIELD_PREP for clarity
Message-ID: <202601301548.SMgNvRPx-lkp@intel.com>
References: <20260129164341.104155-1-ageyko0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129164341.104155-1-ageyko0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_235245_786284_CBCA4045 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Andrew,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on linus/master v6.19-rc7 next-20260129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Geyko/cedrus-Convert-bitfield-macros-to-FIELD_PREP-for-clarity/20260130-004554
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20260129164341.104155-1-ageyko0%40gmail.com
patch subject: [PATCH] cedrus: Convert bitfield macros to FIELD_PREP for clarity
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260130/202601301548.SMgNvRPx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301548.SMgNvRPx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301548.SMgNvRPx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/media/sunxi/cedrus/cedrus_h265.c:17:
   drivers/staging/media/sunxi/cedrus/cedrus_h265.c: In function 'cedrus_h265_skip_bits':
>> drivers/staging/media/sunxi/cedrus/cedrus_regs.h:434:40: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     434 | #define VE_DEC_H265_TRIGGER_FLUSH_BITS FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x3)
         |                                        ^~~~~~~~~~
   drivers/staging/media/sunxi/cedrus/cedrus_h265.c:248:30: note: in expansion of macro 'VE_DEC_H265_TRIGGER_FLUSH_BITS'
     248 |                              VE_DEC_H265_TRIGGER_FLUSH_BITS |
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +434 drivers/staging/media/sunxi/cedrus/cedrus_regs.h

   425	
   426	#define VE_DEC_H265_TRIGGER_TYPE_N_BITS(x)	(((x) & 0x3f) << 8)
   427	#define VE_DEC_H265_TRIGGER_STCD_MASK  GENMASK(5, 4)
   428	#define VE_DEC_H265_TRIGGER_CMD_MASK   GENMASK(3, 0)
   429	#define VE_DEC_H265_TRIGGER_STCD_HEVC  FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x0)
   430	#define VE_DEC_H265_TRIGGER_STCD_AVS   FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x1)
   431	#define VE_DEC_H265_TRIGGER_STCD_VC1   FIELD_PREP(VE_DEC_H265_TRIGGER_STCD_MASK, 0x2)
   432	#define VE_DEC_H265_TRIGGER_SHOW_BITS  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x1)
   433	#define VE_DEC_H265_TRIGGER_GET_BITS   FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x2)
 > 434	#define VE_DEC_H265_TRIGGER_FLUSH_BITS FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x3)
   435	#define VE_DEC_H265_TRIGGER_GET_VLCSE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x4)
   436	#define VE_DEC_H265_TRIGGER_GET_VLCUE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x5)
   437	#define VE_DEC_H265_TRIGGER_BYTE_ALIGN FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x6)
   438	#define VE_DEC_H265_TRIGGER_INIT_SWDEC FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x7)
   439	#define VE_DEC_H265_TRIGGER_DEC_SLICE  FIELD_PREP(VE_DEC_H265_TRIGGER_CMD_MASK, 0x8)
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

