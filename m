Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B46D35668
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 03:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEw5eZ7O0RKLxujc/La8pPEjG2PY+2w8GP45y8bpQb4=; b=CiPr5hlwTIFDQyaGP8ruIp+tXJ
	J4VCu7/EwYbSF+6bicV6FTGN4ZyRjeBLeK5lyGjUlwUiCduTPED2SpYfYHU3g8giRueSIm59V9WjX
	gKgqjYjXNqsD9eQe20lsHpGi6UxeKSt9eZVEzvQNVWMn9Vizd/w3m7ohJAnsQduYFl+QH775Q0Hd3
	DnHSLp1p1gw0s85cxanM55V0cKMXAs7rc5ckPTI6w4U3eaV+bIav0OqSZT/2BIoqzPA10GjI82Wzo
	69datT98eLmteqTZZX5hhRGE3bdqCiI/94r6ABRwrmZ7GgLSsVoI+kb+ItA8IarMw0o59NXwCr6TT
	XJFj/sNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkweD-0000000FOpH-1FFc;
	Wed, 28 Jan 2026 03:55:17 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkweA-0000000FOot-07aP;
	Wed, 28 Jan 2026 03:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769572514; x=1801108514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnHA1NlQw1mcHorufZdTT4X1PTF99NxQ5Mrf5GGTJ/I=;
  b=hECn2+c27RwYmlgmnsk5MaT4GCV5kvEY15qPumh/5g34uvpcBsTkaRcU
   dFoby/+CQcwISbscPrtakq/v5yys/6fWiWJ5n3doWCr/lAGKhYy60knZs
   zYw8cpoKbmR3F6dQk4AYaC9u4P3cDueyTIQ6RX+/THjrH//GbJI9XIU7O
   ECRY3U2HkfptZuhPZPXnMWdbjfD0jq88D05fCGNUdC7AChOeOPGWAZRcD
   pHT3R8vhrvRKALgeCerHN4CjbxTF4ZAXHMYLMCikXTzJKgS6dVr5f31P4
   l4BCQd9bmyncpZ1IKL8V9d6vXmXM3k1jHWEotnYzeJSfrC/Utyt9HyLmc
   A==;
X-CSE-ConnectionGUID: IhGckUqnS3iTKiUtln42Ng==
X-CSE-MsgGUID: 3gLqK++AQfmMsTcKdHyLgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88355691"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88355691"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 19:55:13 -0800
X-CSE-ConnectionGUID: 0hTreD+IT2aSiZskovpb/A==
X-CSE-MsgGUID: XDqaFL56QMCgaXcPcW3djQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208390434"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 19:55:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkwe4-00000000ZCy-12Kc;
	Wed, 28 Jan 2026 03:55:08 +0000
Date: Wed, 28 Jan 2026 11:54:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc: oe-kbuild-all@lists.linux.dev, Alexey Charkov <alchark@gmail.com>,
	Sjoerd Simons <sjoerd.simons@collabora.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
Message-ID: <202601281116.z12yhNfr-lkp@intel.com>
References: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_195514_086984_1A0ADD32 
X-CRM114-Status: GOOD (  11.19  )
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

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/ASoC-rockchip-spdif-Use-device_get_match_data/20260128-001701
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260127-rockchip-spdif-cleanup-and-bsp-sync-v1-10-a7c547072bbb%40collabora.com
patch subject: [PATCH 10/10] ASoC: rockchip: spdif: Convert to FIELD_PREP
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260128/202601281116.z12yhNfr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281116.z12yhNfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281116.z12yhNfr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/rockchip/rockchip_spdif.c:22:
   sound/soc/rockchip/rockchip_spdif.c: In function 'rk_spdif_hw_params':
>> sound/soc/rockchip/rockchip_spdif.h:33:41: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      33 | #define SPDIF_CFGR_HALFWORD_ENABLE      FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 1)
         |                                         ^~~~~~~~~~
   sound/soc/rockchip/rockchip_spdif.c:109:28: note: in expansion of macro 'SPDIF_CFGR_HALFWORD_ENABLE'
     109 |         unsigned int val = SPDIF_CFGR_HALFWORD_ENABLE;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +33 sound/soc/rockchip/rockchip_spdif.h

    30	
    31	#define SPDIF_CFGR_HALFWORD_MASK	BIT(2)
    32	#define SPDIF_CFGR_HALFWORD_DISABLE	FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 0)
  > 33	#define SPDIF_CFGR_HALFWORD_ENABLE	FIELD_PREP(SPDIF_CFGR_HALFWORD_MASK, 1)
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

