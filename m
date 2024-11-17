Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2CBD68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 00:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGZ/FMiIULEo59v9i8aHwk5NShWDs+KEtnJqIceWRXw=; b=O/vy58n/v1kwLehc4Y1vZxq/M9
	aM4bgoY3asmhx0P0u3GmcFyxZ9MkocLan8S4IO4JeTt4u2c0RtQIRj42mFactEDkGuJpCWL0xAcd1
	vD8KFOrO/yMkW6k1am8UdVez+LL/pmoo41aQbd/UqVBreFdkQGUSucDSQnClZTyJVCzGjKqlnm+OQ
	YbT+8D9KziueXIHAhEUpfB/7Gn2HudyAOsR2c0cuKjR2fN0FAJCoS/Rp6qVygEAPoJbNmBU6bw6P8
	ksfOQ5naE+4TZ1SHHSL5GbKkooMffD1GuZtw8OsIKMD2hw9TU9XIFLlDVlXf5sImJwp+PPTOfdAWN
	sTap/uoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCSlG-00000006YeJ-2eWG;
	Sun, 17 Nov 2024 00:03:30 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCSkH-00000006YYO-3eai;
	Sun, 17 Nov 2024 00:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731801750; x=1763337750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gxKgLgaDLjJze/Htyj3X1BttLL7u3v4J/jz7At2NUZ8=;
  b=MdZ5Em9aZ1jMuF8ll1fhW+JDdJ06ulSug6GVUaiO0v328lmin6hHmYgA
   Y05waehbT1pjBfWL8N6J0Ddn61M3U1UqFId3aYvMTF8GFBmDnMFKTx5Ju
   7O4Ep49Mf2biURkqsXYLKIPnJQNEvX8EqOv1lWsb5vSeaQEiEMu5lzLZv
   IV88DR202UsrPM/xopT00RSQFgTUytC+LZc6jE6je88WVTXyEq39ZCOk2
   5j0KGGrTLhj1aujVVPuk6qaj3CnZsZ7xKjZlYphSUjSgv3tEVmEA1YTGx
   KSJDD+3tzQFmXGf4zR2LWV2MD5oL9PeVP0JGTrNr0trouk1okzsAKSzG7
   A==;
X-CSE-ConnectionGUID: d6gCN5IYQUSZqDopGbteSw==
X-CSE-MsgGUID: EkctcbD6QGW4XitFVBt2Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="32027335"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="32027335"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 16:02:25 -0800
X-CSE-ConnectionGUID: AJMT17puQ4uybtOhMITHQQ==
X-CSE-MsgGUID: 7wYf6vcVQbCNRNHNE56khQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="89289158"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Nov 2024 16:02:22 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCSk7-0001Av-1I;
	Sun, 17 Nov 2024 00:02:19 +0000
Date: Sun, 17 Nov 2024 08:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>,
	frattaroli.nicolas@gmail.com, linux-rockchip@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, heiko@sntech.de,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: Re: [PATCH sound-next] ASoC: rockchip: i2s-tdm: Fix a useless call
 issue
Message-ID: <202411170713.FymmFfl3-lkp@intel.com>
References: <20241115114924.23843-1-dheeraj.linuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115114924.23843-1-dheeraj.linuxdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_160230_055529_706E69A7 
X-CRM114-Status: GOOD (  12.10  )
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

Hi Dheeraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dheeraj-Reddy-Jonnalagadda/ASoC-rockchip-i2s-tdm-Fix-a-useless-call-issue/20241115-195011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20241115114924.23843-1-dheeraj.linuxdev%40gmail.com
patch subject: [PATCH sound-next] ASoC: rockchip: i2s-tdm: Fix a useless call issue
config: loongarch-randconfig-r054-20241117 (https://download.01.org/0day-ci/archive/20241117/202411170713.FymmFfl3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170713.FymmFfl3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170713.FymmFfl3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/rockchip/rockchip_i2s_tdm.c:517:12: warning: 'rockchip_i2s_ch_to_io' defined but not used [-Wunused-function]
     517 | static int rockchip_i2s_ch_to_io(unsigned int ch, bool substream_capture)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/rockchip_i2s_ch_to_io +517 sound/soc/rockchip/rockchip_i2s_tdm.c

081068fd641403 Nicolas Frattaroli 2021-10-01  516  
081068fd641403 Nicolas Frattaroli 2021-10-01 @517  static int rockchip_i2s_ch_to_io(unsigned int ch, bool substream_capture)
081068fd641403 Nicolas Frattaroli 2021-10-01  518  {
081068fd641403 Nicolas Frattaroli 2021-10-01  519  	if (substream_capture) {
081068fd641403 Nicolas Frattaroli 2021-10-01  520  		switch (ch) {
081068fd641403 Nicolas Frattaroli 2021-10-01  521  		case I2S_CHN_4:
081068fd641403 Nicolas Frattaroli 2021-10-01  522  			return I2S_IO_6CH_OUT_4CH_IN;
081068fd641403 Nicolas Frattaroli 2021-10-01  523  		case I2S_CHN_6:
081068fd641403 Nicolas Frattaroli 2021-10-01  524  			return I2S_IO_4CH_OUT_6CH_IN;
081068fd641403 Nicolas Frattaroli 2021-10-01  525  		case I2S_CHN_8:
081068fd641403 Nicolas Frattaroli 2021-10-01  526  			return I2S_IO_2CH_OUT_8CH_IN;
081068fd641403 Nicolas Frattaroli 2021-10-01  527  		default:
081068fd641403 Nicolas Frattaroli 2021-10-01  528  			return I2S_IO_8CH_OUT_2CH_IN;
081068fd641403 Nicolas Frattaroli 2021-10-01  529  		}
081068fd641403 Nicolas Frattaroli 2021-10-01  530  	} else {
081068fd641403 Nicolas Frattaroli 2021-10-01  531  		switch (ch) {
081068fd641403 Nicolas Frattaroli 2021-10-01  532  		case I2S_CHN_4:
081068fd641403 Nicolas Frattaroli 2021-10-01  533  			return I2S_IO_4CH_OUT_6CH_IN;
081068fd641403 Nicolas Frattaroli 2021-10-01  534  		case I2S_CHN_6:
081068fd641403 Nicolas Frattaroli 2021-10-01  535  			return I2S_IO_6CH_OUT_4CH_IN;
081068fd641403 Nicolas Frattaroli 2021-10-01  536  		case I2S_CHN_8:
081068fd641403 Nicolas Frattaroli 2021-10-01  537  			return I2S_IO_8CH_OUT_2CH_IN;
081068fd641403 Nicolas Frattaroli 2021-10-01  538  		default:
081068fd641403 Nicolas Frattaroli 2021-10-01  539  			return I2S_IO_2CH_OUT_8CH_IN;
081068fd641403 Nicolas Frattaroli 2021-10-01  540  		}
081068fd641403 Nicolas Frattaroli 2021-10-01  541  	}
081068fd641403 Nicolas Frattaroli 2021-10-01  542  }
081068fd641403 Nicolas Frattaroli 2021-10-01  543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

