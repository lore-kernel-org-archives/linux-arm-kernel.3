Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A439AC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBNFppg5gGhEUcTy40lyR4CxuB+lwRHUeDQnTBHgD8c=; b=v3w18XeQGwsMzTNY4CL1xNs8gb
	8LsSO3shrp539oRjIefhvmqAVe5x1v84qOhsf8npHPuqxOl/BTgIW+/oh+N1j7JenEUMV+pHokF6W
	vgdy6n5Kky2gwstnZl6UVdcKqjLm+uwBfF7Tq/pq0kbIrMA4UbZs3I7438gM0i0AZ7h0Eo5yx1z+S
	FMK23v7XqyHCY+rC9RA71iUnh5W/V1YpVlud6w4gOsfFd08RVeDcrxuLGIyeRnX3NF48vzAvrBQdw
	QyjW+ENx5PBSFuom9eKxDwvBxbbmu4TtY51GWuV5/Of1/mZrENjga8dJzIiIibq13ZIrt8nUR9/FZ
	o71ba8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI99Z-00000001fLU-1r0z;
	Thu, 22 May 2025 16:52:21 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI97X-00000001f9I-14Qw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 16:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747932615; x=1779468615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAQaKse2ihBxfu0TJ9aEs4/TLMUkglE0FPdyzXEACyg=;
  b=NDMhW3rAbFiuePF43ilafJA4YtWevh8/3hfTA/q0jyR9Br5ERanu+jeg
   bb+T40cDLpB2CNLUB3aMz+Qfu/AgRJizyZZ29SlAHgvuR9VOaKnqnkiMs
   HAK38Rqbq/Vj5yIF94k+35Bx6eke3c6Jp/GpafkMk6hurKz8klNimoedM
   dWpJDpvZVQTaqlu/PwworLUCXibbKmRGb7GHCAWqyRJ+BzulZw9DBjWWL
   sKGZF2W2jd2wwgSERNweRrrTBjDKkbisVMullrhxOIM9MR95qkoS+XaHx
   OaK1x5gl3fIT8KCS3u/tI7YKDKoyepsBDrAcNLCverkf3zpy/o1rCv7RG
   g==;
X-CSE-ConnectionGUID: 3sc80vWwTQupnjoAsRaljQ==
X-CSE-MsgGUID: 0VAimaMvSv2LkCZ7F9s6Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53783823"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="53783823"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 09:50:14 -0700
X-CSE-ConnectionGUID: k2um+OxgQP2XgqQbU3n+og==
X-CSE-MsgGUID: BSIuWrpQQNafNT2SQQcBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145550047"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 May 2025 09:50:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI97L-000PWq-2Q;
	Thu, 22 May 2025 16:50:03 +0000
Date: Fri, 23 May 2025 00:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
Message-ID: <202505230242.8jtn9m5R-lkp@intel.com>
References: <20250520152436.474778-7-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520152436.474778-7-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_095015_363894_D88CEFCB 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on b4432656b36e5cc1d50a1f2dc15357543add530e]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/optee-sync-secure-world-ABI-headers/20250520-232546
base:   b4432656b36e5cc1d50a1f2dc15357543add530e
patch link:    https://lore.kernel.org/r/20250520152436.474778-7-jens.wiklander%40linaro.org
patch subject: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
config: um-randconfig-r123-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230242.8jtn9m5R-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230242.8jtn9m5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230242.8jtn9m5R-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "memremap" [drivers/tee/tee.ko] undefined!
ERROR: modpost: "memunmap" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "dma_alloc_pages" [drivers/tee/tee.ko] undefined!
>> ERROR: modpost: "dma_free_pages" [drivers/tee/tee.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

