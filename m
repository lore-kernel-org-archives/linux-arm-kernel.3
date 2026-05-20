Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164AACD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 23:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yszNpx6ONUtJUZVIyoh+4Qv40wyr+0Fcu+NHrai9Eco=; b=WLJK3vhNSdrBVJzGAD6WCvzLFj
	A5u1qVvytkSHbwZYEJ7fNhMI+Z0lNeyCey2dfOkf+3UWfvZMlwBIX0QzD66xoyh+WS2FxGwMTNSWH
	hNYoBoBTDSQLCfCpOkqrsPwj+2nYW/Wy5rAn4K2Td1w6NfrBD2wY+ir2xhgJPu0gseEl3NagxCYKD
	VmMhKfOMzbrMbU4jeIo4MG4kGkZ3KMq9XhwIOvPI+W2U8uVOMttNH2+CyP1UbYR/fw5+JaO7Jlgfa
	BGG7LWs9rQj4WkffylpJZ6xKvrKL4ql5PsWw90ms3XhIRdqWqp/03nfvkZeFbBa8yKnletRHmoZTw
	095W5+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPq5x-000000067Lj-0HYC;
	Wed, 20 May 2026 23:12:57 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPq5t-000000067Kt-1VuI;
	Wed, 20 May 2026 23:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779318773; x=1810854773;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sxvvufs2Ec+0ep9xlt+slYUDEx/V5xfFBWwd9vLO+vs=;
  b=lgGXFCm21ywcyVXMrYn0RvDQLa2Y5+5ul2qGwUCaTSpZA2VxmL8Bkilx
   ISdVHuuQ72EhveTR4us2IYHjlONTBO4fpbqQDxwStVPR+WsGrD6EgvQLV
   PTNxlce5oCXiO8lg56zjJwcBxx8pN0NhEM+Qfb2X36zvC51XTA9KmSx3c
   xnl9VV/Uc4Ik2JSN4TX9jacbi6rjQXiMQajqKo9pShMrvPLrPTIEQSAsH
   UCY9S0D6p8b2Tu8QOk3kzSTsKtgIH6t3QU+pde78QKkMVBF7oLTAoM2FJ
   Kfok+IFMJyc8Nh1himi7Js87LFbmKbicT9Vt3AaFx21kSfKqdBbutbYpe
   w==;
X-CSE-ConnectionGUID: VZSgqE+dSJycp2a4AwTPyg==
X-CSE-MsgGUID: u35Hl7Q4Q2u6v+t6LQTocA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91623228"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91623228"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:12:50 -0700
X-CSE-ConnectionGUID: qwMb1zaLS0iVTfvtUG609g==
X-CSE-MsgGUID: rEK3q4mgSRGwi38bI7S5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="270701254"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2026 16:12:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPq5i-00000000AfZ-2YHm;
	Wed, 20 May 2026 23:12:42 +0000
Date: Thu, 21 May 2026 01:12:04 +0200
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sharq0406@gmail.com,
	kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
Message-ID: <202605210132.USry3Haw-lkp@intel.com>
References: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_161253_690191_42C6C05C 
X-CRM114-Status: GOOD (  12.13  )
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

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-max98090-use-component-set_jack-callback/20260520-213646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260520132930.54333-3-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set jack
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260521/202605210132.USry3Haw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210132.USry3Haw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210132.USry3Haw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in 'max98090_set_jack'
>> Warning: sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in 'max98090_set_jack'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

