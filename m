Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998D0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmee0Y/2KzL8ltQ4mdLkjCo3an6n8amiVIuMWza7rRQ=; b=OGZsWcSZ9T1Q0wFz5P/hxRSjoF
	jtrks24wd5ocWHnm92EbXDjmHktfBw7rZTMKN2juHs1yzxpyWcqT0CTwxtkZTyUKXaKyL5IgFluXJ
	wUrjXRpXbiLeVa6HklCJHQ0+8rx9tDeuK7RzQYFUO/zbqeL49iCP/P3rE8UMv/mskGhLUoOsRQrg6
	IJSywGIt+DRjYoHDnFWsxcFpmimUyTmiE+HbS3Rod/k2d7G4xMp+vB7iJNNqgm2UGnoq8yosunO8E
	8fG81+hSgUE/KYtVHFSqxcSgYF491Uz+bpT1IBpBPgAhm53pzY8HRJW4eXTexRToRWsJIepj+DA0u
	i+E0lz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubga5-00000005MHM-2uN6;
	Tue, 15 Jul 2025 14:24:29 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfON-000000059zA-1pVw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752584899; x=1784120899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERgqFp3dWEUt6TrdSa/YUzlMBzQe1R/D7z1fcvnBStk=;
  b=Myx2Goh5z5ruC3fY8eAkSaSuz/TKc6fdV4VNlO9eikFEw6ndC2LbsaoO
   UWHIOA3wQGriXCYKezCAr2QWQooFu6mRKDrkdNR5nbXRv6HY+rLbgOHgs
   gAm+jkRKE2OtqHnjhZk2iKBihridvvStyWxsBhZzteva5Z+E+WjIPkRxM
   dNrwrSrxsd5GIGeHoiZQszjAkIsDsnL2Y0xCQewnjyK/LWZb7BO63sHiu
   DCPQYDpu/lNcClsqbKxoUS138kn7zxh87OFjnUNqzVYRQaKMwKrniy1OW
   O5UXnozFHEYylNjG8bCaKgRZjZgTYWiYmLJgO69iOtaG/+gY6d8Q2Rsdz
   Q==;
X-CSE-ConnectionGUID: KGS2ESoNSPmIwnZw4fPmSg==
X-CSE-MsgGUID: XbUPLHRUSXah7yBoFc3i3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54740069"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54740069"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 06:08:19 -0700
X-CSE-ConnectionGUID: 1wcdqG34SWqIsJon1ARLKQ==
X-CSE-MsgGUID: TP7UHK2CRpyZLxyiQtiKnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157765105"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jul 2025 06:08:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubfOD-000A51-2g;
	Tue, 15 Jul 2025 13:08:09 +0000
Date: Tue, 15 Jul 2025 21:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joris Verhaegen <verhaegen@google.com>, Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
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
	linux-arm-kernel@lists.infradead.org, David Li <dvdli@google.com>
Subject: Re: [PATCH v2 4/4] ASoC: codecs: Implement 64-bit pointer operation
Message-ID: <202507152054.EKID8Uop-lkp@intel.com>
References: <20250711093636.28204-5-verhaegen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711093636.28204-5-verhaegen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_060819_489369_0F601B21 
X-CRM114-Status: GOOD (  12.28  )
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

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on vkoul-dmaengine/next linus/master v6.16-rc6]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus next-20250714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joris-Verhaegen/ALSA-compress_offload-Add-64-bit-safe-timestamp-infrastructure/20250711-174008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250711093636.28204-5-verhaegen%40google.com
patch subject: [PATCH v2 4/4] ASoC: codecs: Implement 64-bit pointer operation
config: i386-randconfig-141-20250714 (https://download.01.org/0day-ci/archive/20250715/202507152054.EKID8Uop-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152054.EKID8Uop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507152054.EKID8Uop-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/intel/atom/sst-mfld-platform-compress.o: in function `sst_platform_compr_pointer64':
>> sound/soc/intel/atom/sst-mfld-platform-compress.c:226: undefined reference to `__umoddi3'


vim +226 sound/soc/intel/atom/sst-mfld-platform-compress.c

   216	
   217	static int sst_platform_compr_pointer64(struct snd_soc_component *component,
   218						struct snd_compr_stream *cstream,
   219						struct snd_compr_tstamp64 *tstamp)
   220	{
   221		struct sst_runtime_stream *stream;
   222	
   223		stream = cstream->runtime->private_data;
   224		stream->compr_ops->tstamp64(sst->dev, stream->id, tstamp);
   225		tstamp->byte_offset =
 > 226			tstamp->copied_total % cstream->runtime->buffer_size;
   227		pr_debug("calc bytes offset/copied bytes as %u\n", tstamp->byte_offset);
   228		return 0;
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

