Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997BEF5513C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 10:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Er7jqtGu/SwP74yZXXG+08yd9veX7NSpsz0SMsaehE=; b=FdUd9gCNT3TCQkcKjBUYgz3BDB
	MWuzrC0l1o9Hb5W8ZwNQGflLDt1ZO4g3afUpERJJ/lc3RCBSpbLzbuLS+n7AEu8icnxrINMPHHhbg
	zqk5juYOiNYrxPXvUQTr5rfPCadEuWMv5MOkgwPJ56Ezw6AdecL9K1QIBYK8G7OZQp16I9gr12a4d
	4wMQJu78Uu2QbkD+Qszho4j2J/AIYjcoZulgmrkqDaqRgbwASDoJnV1sJpDwOrvawNoNV50ts6LnZ
	PLRwr4nA/xGBFAizB1LuU7MJ9XSAVlVrlL0Q5m/sfpbHZhU8jS7ivob4QjB5dZ6wGLSPeA5jRQo1+
	ZuWqfaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzBQp-00000005sRG-0aB8;
	Sun, 08 Mar 2026 10:32:19 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzBQl-00000005sQp-1Mx9;
	Sun, 08 Mar 2026 10:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772965935; x=1804501935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J09zkkMc6nwZpCtbBGADOJnfZUNEnobOKYU2m/BqZbs=;
  b=ZL4RPRibTcPybVeJavJ3xaKoIirRXbKnwkQ80t+kTyQWxvNQCVt7k4/j
   RY/oVubRl7nf1sC28nbh7VZQlHBwuwAW++ie3TDbvkNrV1J5sLLp/S2MC
   H0dBMcMkhqQI6Rtm0xozGvPzxZPFixXcVxOa2UmzuDjmDA945UqbXrG+X
   siraixChFRqdFzzjPdVjKuvBBXnxqIn0R7NTyoUHsMVDEXBpcVIJGWahq
   JCQHoKbcU/ySp7rjZMD/C8zCBILDNBFTypwxZ5+002ivIBBEgr+FPFpQq
   gvxlT1V6HDiBtXQowLzyaOUZ6I4f+LGeribjVnyrxreusdnlq0pupZ2Pv
   A==;
X-CSE-ConnectionGUID: Hm+o8lfgQCmmS8G3YqTRdQ==
X-CSE-MsgGUID: 3lLCxKOzTnePr6g8SUG0Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="85367081"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="85367081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 03:32:10 -0700
X-CSE-ConnectionGUID: t8zOX5JEQn2k6A5dgS2Q6w==
X-CSE-MsgGUID: HVncasczSrez9SydP0b2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219441274"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2026 03:32:03 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzBQV-0000000031t-1c3D;
	Sun, 08 Mar 2026 10:31:59 +0000
Date: Sun, 8 Mar 2026 18:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chaotian Jing <Chaotian.Jing@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v9 19/23] scsi: ufs: mediatek: Rework hardware version
 reading
Message-ID: <202603081809.R9OrrITa-lkp@intel.com>
References: <20260306-mt8196-ufs-v9-19-55b073f7a830@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-mt8196-ufs-v9-19-55b073f7a830@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_033215_410180_E9A12423 
X-CRM114-Status: GOOD (  14.06  )
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

Hi Nicolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 11e703f54ac21f4dc609ea12ab578ffa47c87e11]

url:    https://github.com/intel-lab-lkp/linux/commits/Nicolas-Frattaroli/dt-bindings-phy-Add-mediatek-mt8196-ufsphy-variant/20260306-215930
base:   11e703f54ac21f4dc609ea12ab578ffa47c87e11
patch link:    https://lore.kernel.org/r/20260306-mt8196-ufs-v9-19-55b073f7a830%40collabora.com
patch subject: [PATCH v9 19/23] scsi: ufs: mediatek: Rework hardware version reading
config: arm-randconfig-002-20260308 (https://download.01.org/0day-ci/archive/20260308/202603081809.R9OrrITa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081809.R9OrrITa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081809.R9OrrITa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ufs/host/ufs-mediatek.c:10:
   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_get_hw_ip_version':
>> include/linux/bitfield.h:195:40: warning: result of '268435456 << 24' requires 54 bits to represent, but 'int' only has 32 bits [-Wshift-overflow=]
      *(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask)); \
                                           ^~
   drivers/ufs/host/ufs-mediatek.c:838:3: note: in expansion of macro 'FIELD_MODIFY'
      FIELD_MODIFY(MTK_UFS_VER_PREFIX_M, &version, BIT(28));
      ^~~~~~~~~~~~


vim +195 include/linux/bitfield.h

e2192de59e457a Johannes Berg      2023-01-18  142  
e2192de59e457a Johannes Berg      2023-01-18  143  /**
e2192de59e457a Johannes Berg      2023-01-18  144   * FIELD_PREP_CONST() - prepare a constant bitfield element
e2192de59e457a Johannes Berg      2023-01-18  145   * @_mask: shifted mask defining the field's length and position
e2192de59e457a Johannes Berg      2023-01-18  146   * @_val:  value to put in the field
e2192de59e457a Johannes Berg      2023-01-18  147   *
e2192de59e457a Johannes Berg      2023-01-18  148   * FIELD_PREP_CONST() masks and shifts up the value.  The result should
e2192de59e457a Johannes Berg      2023-01-18  149   * be combined with other fields of the bitfield using logical OR.
e2192de59e457a Johannes Berg      2023-01-18  150   *
e2192de59e457a Johannes Berg      2023-01-18  151   * Unlike FIELD_PREP() this is a constant expression and can therefore
e2192de59e457a Johannes Berg      2023-01-18  152   * be used in initializers. Error checking is less comfortable for this
e2192de59e457a Johannes Berg      2023-01-18  153   * version, and non-constant masks cannot be used.
e2192de59e457a Johannes Berg      2023-01-18  154   */
e2192de59e457a Johannes Berg      2023-01-18  155  #define FIELD_PREP_CONST(_mask, _val)					\
e2192de59e457a Johannes Berg      2023-01-18  156  	(								\
e2192de59e457a Johannes Berg      2023-01-18  157  		/* mask must be non-zero */				\
e2192de59e457a Johannes Berg      2023-01-18  158  		BUILD_BUG_ON_ZERO((_mask) == 0) +			\
e2192de59e457a Johannes Berg      2023-01-18  159  		/* check if value fits */				\
e2192de59e457a Johannes Berg      2023-01-18  160  		BUILD_BUG_ON_ZERO(~((_mask) >> __bf_shf(_mask)) & (_val)) + \
e2192de59e457a Johannes Berg      2023-01-18  161  		/* check if mask is contiguous */			\
e2192de59e457a Johannes Berg      2023-01-18  162  		__BF_CHECK_POW2((_mask) + (1ULL << __bf_shf(_mask))) +	\
e2192de59e457a Johannes Berg      2023-01-18  163  		/* and create the value */				\
e2192de59e457a Johannes Berg      2023-01-18  164  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
e2192de59e457a Johannes Berg      2023-01-18  165  	)
e2192de59e457a Johannes Berg      2023-01-18  166  
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  167  /**
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  168   * FIELD_GET() - extract a bitfield element
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  169   * @_mask: shifted mask defining the field's length and position
7240767450d6d8 Masahiro Yamada    2017-10-03  170   * @_reg:  value of entire bitfield
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  171   *
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  172   * FIELD_GET() extracts the field specified by @_mask from the
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  173   * bitfield passed in as @_reg by masking and shifting it down.
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  174   */
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  175  #define FIELD_GET(_mask, _reg)						\
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  176  	({								\
2a6c045640c38a Geert Uytterhoeven 2025-11-06  177  		__BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");	\
2a6c045640c38a Geert Uytterhoeven 2025-11-06  178  		__FIELD_GET(_mask, _reg, "FIELD_GET: ");		\
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  179  	})
3e9b3112ec74f1 Jakub Kicinski     2016-08-31  180  
a256ae22570ee4 Luo Jie            2025-04-17  181  /**
a256ae22570ee4 Luo Jie            2025-04-17  182   * FIELD_MODIFY() - modify a bitfield element
a256ae22570ee4 Luo Jie            2025-04-17  183   * @_mask: shifted mask defining the field's length and position
a256ae22570ee4 Luo Jie            2025-04-17  184   * @_reg_p: pointer to the memory that should be updated
a256ae22570ee4 Luo Jie            2025-04-17  185   * @_val: value to store in the bitfield
a256ae22570ee4 Luo Jie            2025-04-17  186   *
a256ae22570ee4 Luo Jie            2025-04-17  187   * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
a256ae22570ee4 Luo Jie            2025-04-17  188   * by replacing them with the bitfield value passed in as @_val.
a256ae22570ee4 Luo Jie            2025-04-17  189   */
a256ae22570ee4 Luo Jie            2025-04-17  190  #define FIELD_MODIFY(_mask, _reg_p, _val)						\
a256ae22570ee4 Luo Jie            2025-04-17  191  	({										\
a256ae22570ee4 Luo Jie            2025-04-17  192  		typecheck_pointer(_reg_p);						\
a256ae22570ee4 Luo Jie            2025-04-17  193  		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");		\
a256ae22570ee4 Luo Jie            2025-04-17  194  		*(_reg_p) &= ~(_mask);							\
a256ae22570ee4 Luo Jie            2025-04-17 @195  		*(_reg_p) |= (((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask));	\
a256ae22570ee4 Luo Jie            2025-04-17  196  	})
a256ae22570ee4 Luo Jie            2025-04-17  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

