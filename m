Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C02C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSWKT5mUZ3JQ0NV2wReCpUV4eGDfH/9FlyleljT+7YI=; b=QsRRV0Eqzh8zRWFOOLdsVtmwkQ
	9wddHgvT+ckY2j4YOTdBZ0iiGx/gn5MM2qtlx0Sy5IAhbOUHOS9fpmGolUOvBgMADcDbfIj5Tz81q
	nTgQU+tJkusOh+zqfdF7gWx/EJ7026rRPaAZvdrO7nNAqBae3u+KfzWgwhTi4XyecUQfrGjqBWx92
	94jA+zZnAJ7qElrclO4jGVzqW5sL3bI5wD0jlz7C1zC104DeIguxZ3/jJa+iEKCi3tJKK8iD3dipz
	Z7/KzOlY6Iva0fdgOFEFwIPh+vXTyYdxfkalXop62Ya4nPBsEaHjKkIcBfWvcv4lv20gew3XBTmJN
	sVFlzerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vbS-0000000BMJq-3jw7;
	Thu, 10 Apr 2025 17:22:15 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uGc-0000000B6Ub-0Cvy;
	Thu, 10 Apr 2025 15:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744300598; x=1775836598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kQXYAVIwetUyVwvHQAZ8MBfV2JpMeqQiDyjEkLidttY=;
  b=KZi+Sg/bQxSuZ3Sd+OfXmANWS5NanJG1AkJmfQVkgPOCdPrRWvfZ0qze
   h0rqz75OqIHewyg66g1JWtQg38v0CEFNA+0c/4nkPS319FzlMwfbPQuyt
   A4B3TBr6VoTDahrCZNEZWszXbLvBJrG1Ogm6uM62ceaBmXBoCQ5luN+iF
   vwV14wP3eDjQJl1xg42d8M2fmLxwncha5Ez89GAQfrQ80O5W39mOypPQt
   2FWxHvD8oc6Cv5CHDU2m+DbqVGF+azbBt17n/DFs5fTMUVyaW5U42cYqs
   WoISNQwX7VQV2wJwQzpOoRNemGJHUUB8x7XrNKgQSgeH9vE6WSGjGzY3i
   A==;
X-CSE-ConnectionGUID: vvzvSAUlRKCO1xF7esyCbw==
X-CSE-MsgGUID: WP73TAgfQVCiVWLqfQ8NcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56010828"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="56010828"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 08:56:36 -0700
X-CSE-ConnectionGUID: cYuTcStpSoexM0h44TRRmg==
X-CSE-MsgGUID: GXm97F4OR8+Hd6GdEbBnOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="133671636"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2025 08:56:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2uGT-000AFT-27;
	Thu, 10 Apr 2025 15:56:29 +0000
Date: Thu, 10 Apr 2025 23:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-crypto@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Olivia Mackall <olivia@selenic.com>,
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
Message-ID: <202504102028.H0evWtkl-lkp@intel.com>
References: <20250410070623.3676647-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410070623.3676647-4-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_085638_161245_5FEEBD5A 
X-CRM114-Status: GOOD (  13.74  )
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
config: arm-randconfig-001-20250410 (https://download.01.org/0day-ci/archive/20250410/202504102028.H0evWtkl-lkp@intel.com/config)
compiler: clang version 19.1.1 (https://github.com/llvm/llvm-project d401987fe349a87c53fe25829215b080b70c0c1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504102028.H0evWtkl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504102028.H0evWtkl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/hw_random/npcm-rng.c:57:54: error: expected ';' at end of declaration
      57 |         struct device *dev = (struct device *)priv->rng.priv
         |                                                             ^
         |                                                             ;
   1 error generated.


vim +57 drivers/char/hw_random/npcm-rng.c

    53	
    54	static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
    55	{
    56		struct npcm_rng *priv = to_npcm_rng(rng);
  > 57		struct device *dev = (struct device *)priv->rng.priv
    58		int retval = 0;
    59		int ready;
    60	
    61		pm_runtime_get_sync(dev);
    62	
    63		while (max) {
    64			if (wait) {
    65				if (readb_poll_timeout(priv->base + NPCM_RNGCS_REG,
    66						       ready,
    67						       ready & NPCM_RNG_DATA_VALID,
    68						       NPCM_RNG_POLL_USEC,
    69						       NPCM_RNG_TIMEOUT_USEC))
    70					break;
    71			} else {
    72				if ((readb(priv->base + NPCM_RNGCS_REG) &
    73				    NPCM_RNG_DATA_VALID) == 0)
    74					break;
    75			}
    76	
    77			*(u8 *)buf = readb(priv->base + NPCM_RNGD_REG);
    78			retval++;
    79			buf++;
    80			max--;
    81		}
    82	
    83		pm_runtime_mark_last_busy(dev);
    84		pm_runtime_put_sync_autosuspend(dev);
    85	
    86		return retval || !wait ? retval : -EIO;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

