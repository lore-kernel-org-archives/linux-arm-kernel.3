Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C904C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 10:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLICwLFk49XIM8zqkHomjSFai+fB7iTawAZGd1t88/w=; b=BM92MEmZrEneo7U+SKWi3sCzKO
	aCuY1FglMQhzb8rGFWDdGQpOos38409WPtgU5qxzve2nc8BoNrddH/K+3JG4DRtZNBiQicZTwdQ6e
	6eXXHKbfuSBh9RWULta4qWYeT0jnfm5sBuh7AC1JBozwzOkOhhOeDCnJCQY+ML4VqpBvbheBg6xhX
	blEFN+Eq82oCNvQA+CVweWaMr1yqmx058gsdiHcbPHeeyJOSVu5f6eHk8oEdxsDvCQSgsTmsw3fRe
	ixNY3hRtzdU+ssDTMwbFXG1fWZMlDPRfDfIyRouIwfTmj1f5d3dSR9mMFaKRIqlWcfGuxii5vv3Gn
	I1jKLVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcBg-0000000BM2X-1UR8;
	Sat, 26 Jul 2025 10:31:32 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufc6u-0000000BLay-1yOg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 10:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753525597; x=1785061597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0t2t5gOaH4FT/nkKwfR5kcbQmx/FGJLG1SNJAyN3m2w=;
  b=ScdBdJNNR/2rgyjQiIWUKOIfiKhuv7vCkkEokI0gqsqZea3Hh+KZ71G8
   gXHkGOUgtEIIRYMBMm+uenhHguKB7GaVvVbJtBv+novelenmbWttEwc1v
   y5tpuRHrMRJyCGpw+F3RVoBBEv7gweWWrJiJwUbrmpMNf5yOfY9kXwP6A
   gDeGTcH8DW/dMPPRiKCAB0x6BfVBJqlDry1xTXcTzPTMP2OLf+svY8Ddi
   HO0dfC8gU+9Ke2Q86UfWqSyhVJHIH4AIc5YXh4uCivmSzlbmD5Rb+b4+l
   bZn3+Q3Gdsd3gsk3zKalVNnZke56BcjvPmGDMYBLD28j+LlfiDX1MZKC5
   w==;
X-CSE-ConnectionGUID: oHxJ1xs9QaKcDUJFRKX/8Q==
X-CSE-MsgGUID: pQwpS+HCRXa0rC8Cj0MGzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55996084"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55996084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:26:32 -0700
X-CSE-ConnectionGUID: MSiKk5w8SaOgVodEbqULPQ==
X-CSE-MsgGUID: 1oGAlqsQQqezTwykz+547w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192406726"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jul 2025 03:26:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufc6h-000LsF-32;
	Sat, 26 Jul 2025 10:26:23 +0000
Date: Sat, 26 Jul 2025 18:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joris Verhaegen <verhaegen@google.com>, Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Joris Verhaegen <verhaegen@google.com>,
	kernel-team@android.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v3 1/3] ALSA: compress_offload: Add 64-bit safe timestamp
 infrastructure
Message-ID: <202507261801.Ma45NLlT-lkp@intel.com>
References: <20250725114249.2086974-2-verhaegen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725114249.2086974-2-verhaegen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_032636_547436_15EA0FDB 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Joris,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.16-rc7 next-20250725]
[cannot apply to broonie-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joris-Verhaegen/ALSA-compress_offload-Add-64-bit-safe-timestamp-infrastructure/20250725-194613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20250725114249.2086974-2-verhaegen%40google.com
patch subject: [PATCH v3 1/3] ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
config: loongarch-randconfig-001-20250726 (https://download.01.org/0day-ci/archive/20250726/202507261801.Ma45NLlT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261801.Ma45NLlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261801.Ma45NLlT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/sof-client-probes.c:156:20: error: initialization of 'int (*)(struct snd_compr_stream *, struct snd_compr_tstamp64 *, struct snd_soc_dai *)' from incompatible pointer type 'int (*)(struct snd_compr_stream *, struct snd_compr_tstamp *, struct snd_soc_dai *)' [-Wincompatible-pointer-types]
     156 |         .pointer = sof_probes_compr_pointer,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/sof-client-probes.c:156:20: note: (near initialization for 'sof_probes_compr_ops.pointer')
   sound/soc/sof/sof-client-probes.c:139:12: note: 'sof_probes_compr_pointer' declared here
     139 | static int sof_probes_compr_pointer(struct snd_compr_stream *cstream,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> sound/soc/intel/avs/probes.c:260:20: error: initialization of 'int (*)(struct snd_compr_stream *, struct snd_compr_tstamp64 *, struct snd_soc_dai *)' from incompatible pointer type 'int (*)(struct snd_compr_stream *, struct snd_compr_tstamp *, struct snd_soc_dai *)' [-Wincompatible-pointer-types]
     260 |         .pointer = avs_probe_compr_pointer,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/intel/avs/probes.c:260:20: note: (near initialization for 'avs_probe_cdai_ops.pointer')
   sound/soc/intel/avs/probes.c:215:12: note: 'avs_probe_compr_pointer' declared here
     215 | static int avs_probe_compr_pointer(struct snd_compr_stream *cstream,
         |            ^~~~~~~~~~~~~~~~~~~~~~~


vim +156 sound/soc/sof/sof-client-probes.c

3dc0d709177828 Peter Ujfalusi 2022-02-10  150  
3dc0d709177828 Peter Ujfalusi 2022-02-10  151  static const struct snd_soc_cdai_ops sof_probes_compr_ops = {
3dc0d709177828 Peter Ujfalusi 2022-02-10  152  	.startup = sof_probes_compr_startup,
3dc0d709177828 Peter Ujfalusi 2022-02-10  153  	.shutdown = sof_probes_compr_shutdown,
3dc0d709177828 Peter Ujfalusi 2022-02-10  154  	.set_params = sof_probes_compr_set_params,
3dc0d709177828 Peter Ujfalusi 2022-02-10  155  	.trigger = sof_probes_compr_trigger,
3dc0d709177828 Peter Ujfalusi 2022-02-10 @156  	.pointer = sof_probes_compr_pointer,
3dc0d709177828 Peter Ujfalusi 2022-02-10  157  };
3dc0d709177828 Peter Ujfalusi 2022-02-10  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

