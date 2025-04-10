Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAAAC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Uo5er/uYGpDnrC4qdUdTQ+M350k6gcqOXroe0mMArE=; b=q/ylISHksUYHgMbe2qBDzc8ItP
	pP7Mi6X7Q+TdWREA0W21MZOZAYSi9W/jFyB99+B/ukC3569aqYFrGwK2ee8zsOt8MIq6re5zmAu5/
	ngIEd0y9fl5N1KAKDPeVDf01EE4/FRj0AB1DfMJ/2/QfhJhBjvO3gzrD/DDTk4sgkrRRCUlhUSJfm
	fqNfGQIFGwB5OE+cV0EKq4QKJHeCRwtShg5QrOzIn7dpLpMf3wwJX3Jx6x8Blaco7Xf91ZjAa1MKS
	GNdThyAQ3h1nqAG8DmGVRK3jv7RhAw98bXuNPHQcj1+qGtSmcnWZScBOHDEqGhNWOxqXlfhfPoERF
	361lzRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pvK-0000000AFA5-43fL;
	Thu, 10 Apr 2025 11:18:22 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2oi7-0000000A1U1-0nF2;
	Thu, 10 Apr 2025 10:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744279239; x=1775815239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ONUHM5dAa9V9tNPfQhvJhcJq9TbPfVh38gul5GwseA0=;
  b=Fux1xUHgpwGhqjq7nNpdXhE4Ehm1haJXLUZaNBaROTOkpfC0JNxfAH5G
   NPU68Ib+r3LHpsVu3aGD96o+n5ubWiYmX51LNA24XuBnNdyIn8WLmW3Za
   6xPX126FhcQhrxc13S3qEtsIKXaRhE5/nqUg00ezxddTb38nHsVj1IUZK
   NEI85xqZM8mLAcScRQz1kb5Xrkc/888Li7SVOMwKnw3DFtk3hnkv4Fd27
   70RQeKYMx/qBLWJXDRbJVs81oLj1WQAYKmT/E5HrYODr86Nukmyl4C5cZ
   91tliRmvKnEtOjv40l69u1UgOWf6HQRr21mTtKv9QW1i3ryP669bUkxyE
   w==;
X-CSE-ConnectionGUID: tfCAnchXSyCbWWZfS9fCnw==
X-CSE-MsgGUID: dQ1hywIKR8yBs3juWinBMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="57159392"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="57159392"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 03:00:37 -0700
X-CSE-ConnectionGUID: 05lbWpcNR3KWflc7G4CuNA==
X-CSE-MsgGUID: YLZYCk0KSbOI90zQomq2Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133980819"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Apr 2025 03:00:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2ohz-0009tz-0B;
	Thu, 10 Apr 2025 10:00:31 +0000
Date: Thu, 10 Apr 2025 17:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-crypto@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH 3/3] hwrng: npcm - Add a local variable for struct device
 pointer
Message-ID: <202504101705.PeW9QC3m-lkp@intel.com>
References: <20250410070623.3676647-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410070623.3676647-4-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_030039_302890_95E67B51 
X-CRM114-Status: GOOD (  16.43  )
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

Hi Sakari,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master linus/master v6.15-rc1 next-20250410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/hwrng-atmel-Add-a-local-variable-for-struct-device-pointer/20250410-151223
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250410070623.3676647-4-sakari.ailus%40linux.intel.com
patch subject: [PATCH 3/3] hwrng: npcm - Add a local variable for struct device pointer
config: csky-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250410/202504101705.PeW9QC3m-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504101705.PeW9QC3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504101705.PeW9QC3m-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/char/hw_random/npcm-rng.c: In function 'npcm_rng_read':
>> drivers/char/hw_random/npcm-rng.c:58:9: error: expected ',' or ';' before 'int'
      58 |         int retval = 0;
         |         ^~~
>> drivers/char/hw_random/npcm-rng.c:78:17: error: 'retval' undeclared (first use in this function)
      78 |                 retval++;
         |                 ^~~~~~
   drivers/char/hw_random/npcm-rng.c:78:17: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/char/hw_random/npcm-rng.c:87:1: warning: control reaches end of non-void function [-Wreturn-type]
      87 | }
         | ^


vim +58 drivers/char/hw_random/npcm-rng.c

c98429297d8b25a Tomer Maimon 2019-09-12  53  
c98429297d8b25a Tomer Maimon 2019-09-12  54  static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
c98429297d8b25a Tomer Maimon 2019-09-12  55  {
c98429297d8b25a Tomer Maimon 2019-09-12  56  	struct npcm_rng *priv = to_npcm_rng(rng);
11fd03b27c8824f Sakari Ailus 2025-04-10  57  	struct device *dev = (struct device *)priv->rng.priv
c98429297d8b25a Tomer Maimon 2019-09-12 @58  	int retval = 0;
c98429297d8b25a Tomer Maimon 2019-09-12  59  	int ready;
c98429297d8b25a Tomer Maimon 2019-09-12  60  
11fd03b27c8824f Sakari Ailus 2025-04-10  61  	pm_runtime_get_sync(dev);
c98429297d8b25a Tomer Maimon 2019-09-12  62  
c2fb644638ae45c Tomer Maimon 2020-09-24  63  	while (max) {
c98429297d8b25a Tomer Maimon 2019-09-12  64  		if (wait) {
c2fb644638ae45c Tomer Maimon 2020-09-24  65  			if (readb_poll_timeout(priv->base + NPCM_RNGCS_REG,
c98429297d8b25a Tomer Maimon 2019-09-12  66  					       ready,
c98429297d8b25a Tomer Maimon 2019-09-12  67  					       ready & NPCM_RNG_DATA_VALID,
c98429297d8b25a Tomer Maimon 2019-09-12  68  					       NPCM_RNG_POLL_USEC,
c98429297d8b25a Tomer Maimon 2019-09-12  69  					       NPCM_RNG_TIMEOUT_USEC))
c98429297d8b25a Tomer Maimon 2019-09-12  70  				break;
c98429297d8b25a Tomer Maimon 2019-09-12  71  		} else {
c2fb644638ae45c Tomer Maimon 2020-09-24  72  			if ((readb(priv->base + NPCM_RNGCS_REG) &
c98429297d8b25a Tomer Maimon 2019-09-12  73  			    NPCM_RNG_DATA_VALID) == 0)
c98429297d8b25a Tomer Maimon 2019-09-12  74  				break;
c98429297d8b25a Tomer Maimon 2019-09-12  75  		}
c98429297d8b25a Tomer Maimon 2019-09-12  76  
c2fb644638ae45c Tomer Maimon 2020-09-24  77  		*(u8 *)buf = readb(priv->base + NPCM_RNGD_REG);
c2fb644638ae45c Tomer Maimon 2020-09-24 @78  		retval++;
c2fb644638ae45c Tomer Maimon 2020-09-24  79  		buf++;
c2fb644638ae45c Tomer Maimon 2020-09-24  80  		max--;
c98429297d8b25a Tomer Maimon 2019-09-12  81  	}
c98429297d8b25a Tomer Maimon 2019-09-12  82  
11fd03b27c8824f Sakari Ailus 2025-04-10  83  	pm_runtime_mark_last_busy(dev);
11fd03b27c8824f Sakari Ailus 2025-04-10  84  	pm_runtime_put_sync_autosuspend(dev);
c98429297d8b25a Tomer Maimon 2019-09-12  85  
c98429297d8b25a Tomer Maimon 2019-09-12  86  	return retval || !wait ? retval : -EIO;
c98429297d8b25a Tomer Maimon 2019-09-12 @87  }
c98429297d8b25a Tomer Maimon 2019-09-12  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

