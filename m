Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C52E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVtE64flcFMdAxL4WT68V1LwmueRtNSMbpset8i6nwU=; b=WPMTODE0YZK46p7avJywjXT5n4
	wB10gcr8Z4+3ndfKzHoK6osh+SF3myu9enXec6pvQbm9zlqCT4bcDNeuUY5iYS3UCPGnSeSqt4/Jb
	QgXXtMlbesR7ctN84Y10nLxtuB4O1WC0SWveX2eqr5I8HzfNcJGac8GhsUoz9S/RsZiUuVzjc/gil
	D/SCApIFS1LWMy5JjTq43IQt8OWO2e/lkRKc2ycR1VH3Rcj3mJJ+AObaCiUMpTj2l6RNzmgw1rJPu
	RoUYvhUkiHxkIMpwoXq4FYLJDCZs4Zanh4zyTrzLrix5hC8tyALPlcDy/eegGW3D3T6JcEqKuIYqK
	FYxdFmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLV3L-0000000GILK-0BiA;
	Wed, 11 Dec 2024 22:19:31 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLV2G-0000000GI9m-09cA;
	Wed, 11 Dec 2024 22:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733955504; x=1765491504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RU7JEwDXb/NNK1SC/cKVBh0dMOSbGzWgfg2o+0Wox24=;
  b=LbthixgFxOh2h7GwF2RBDqdyovTLv/oMB4CpxNrd7fNCfFD3EA9Qs7wn
   49uwQu8cFdGxg9/lyQ/x1CIRZJo+07kIa7KD3q+DH+DerEqcXoOzkalLS
   MA8qCEA9TO9kzkivMKDGbVBe0/f0ILAn+sMbPbWKG+I4cE4nKTKTcXBXz
   OusWkYD3UlElRWEcRMePm3DywUH9w0qJ1A8aWwi+EDXBdogcZaYk/cvro
   uXMel6/ntHAQ0IRv2UOe5f5/yapo7j9tqR0rQt+qi6RP74xCTQVsnnTqx
   0H0Nv1zbczP+742RUrjTkUGSKgMNT/TjlXnRdnwSXq8ma5/PYbWbpvR2U
   g==;
X-CSE-ConnectionGUID: bdPJtvEBRbqfRhc7BLeahw==
X-CSE-MsgGUID: GChjpwnkSAOZTiiLktRtyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34483475"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="34483475"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 14:18:23 -0800
X-CSE-ConnectionGUID: mVW+lHN2RmWm9oEd/Ls7ag==
X-CSE-MsgGUID: kdgG+cDmR8qMoXCWeM0NPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96792761"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2024 14:18:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLV26-00079T-1j;
	Wed, 11 Dec 2024 22:18:14 +0000
Date: Thu, 12 Dec 2024 06:17:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Xavier Chang <xavier.chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Message-ID: <202412120633.avM5EfRz-lkp@intel.com>
References: <20241211032256.28494-7-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-7-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_141824_086190_5DCA6661 
X-CRM114-Status: GOOD (  12.53  )
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

Hi Jason-JH.Lin,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/dt-bindings-mailbox-mediatek-Add-GCE-header-file-for-MT8196/20241211-112605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241211032256.28494-7-jason-jh.lin%40mediatek.com
patch subject: [PATCH v2 6/8] soc: mediatek: Add programming flow for unsupported subsys ID hardware
config: arm64-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241212/202412120633.avM5EfRz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120633.avM5EfRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120633.avM5EfRz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: cmdq_subsys_is_valid
   >>> referenced by mtk-mmsys.c:173 (drivers/soc/mediatek/mtk-mmsys.c:173)
   >>>               drivers/soc/mediatek/mtk-mmsys.o:(mtk_mmsys_update_bits) in archive vmlinux.a
   >>> referenced by mtk-mutex.c:976 (drivers/soc/mediatek/mtk-mutex.c:976)
   >>>               drivers/soc/mediatek/mtk-mutex.o:(mtk_mutex_enable_by_cmdq) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

