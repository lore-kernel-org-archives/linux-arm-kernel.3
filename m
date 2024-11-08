Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4345CD64079
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 19:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36eFDsOfiY1+4YLO6rK+nEUslj6oGDxfi+BcWF49SpY=; b=EXllp73a8RXT9NOLeYM+PPi5v7
	JGqLlSIwJ/awjLN0KTLQwTYtK1PthVBQKt+BxTOgO6ubFv62ix/m+ARF7V9IZTnfFIGPiJzGZP2np
	VcXjPsMgisAZlzay9QU5AE25wmJjQgk0Ht0BIA/any4NEY1rvjYLKAzZJfpLg0ZW7FitzeTRexjfJ
	cUiOwjA/QFiCNiRIuZHJ/ccxOAMxkGyzHsf3mSnzc+tdnZmDcpN2SJlmuq1ED1Ejc9ijCQlZ/BXFd
	VLg/w4GclG1eu8TqC77rGjtuiQqSWvgJTfffMplAHkTt350QyCIRKOc8RjENlkFJnVlYDFcB5lJnb
	aEQU5hVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UNz-0000000Bhi0-016b;
	Fri, 08 Nov 2024 19:11:11 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UMD-0000000BhPb-47lo;
	Fri, 08 Nov 2024 19:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731092962; x=1762628962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R+CGtLg7J7cZFkaK6iEbxTqVB/sl271eFJkHFX8PQlI=;
  b=nojhclBeajCu+gWMTqEkl6HCqCDSH8tEOtzgjhtR6u3HHX7rrtnsxPNl
   qeUAX2fWSFyd+2fW1mD+BMtZ6dYJ+PLEyaPahRDWfhdWBxzrbJq7h0HS1
   E7IiLZ6Xv27CohFYsXuz9xbK5W6EaydmGQuQkuOwkSiVYpqnPZs4v0j8u
   MMh9DiusICFbiCoLuY+tDiXJrAgHgAZUzEsJISv7FL0s7TQiQIf9K5GAk
   szO8JhkAxXMq+39lgZZNJYgcDug0DSzip3jbGgM1x94PPW35RqQBHfXIV
   y2Vk0rJvjyG+Y7XSjwgRM31MW+GFRC27u4fP+i6Ss5mMoHBKqtBg7Tbos
   g==;
X-CSE-ConnectionGUID: vb0mMZm1QCWcewiGmoxAKw==
X-CSE-MsgGUID: KKnRooZrQkiANBvnhVdvHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42086776"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42086776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 11:09:20 -0800
X-CSE-ConnectionGUID: XD1n0tMySAq3Ut+3KlDDLQ==
X-CSE-MsgGUID: YGwNEXImR2OgQ2epJ63MLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="90231501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 11:09:15 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9UM5-000ria-11;
	Fri, 08 Nov 2024 19:09:13 +0000
Date: Sat, 9 Nov 2024 03:08:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Romanov <avromanov@salutedevices.com>, neil.armstrong@linaro.org,
	clabbe@baylibre.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com,
	Alexey Romanov <avromanov@salutedevices.com>
Subject: Re: [PATCH v10 09/22] crypto: amlogic - Process more than MAXDESCS
 descriptors
Message-ID: <202411090235.a7vEgZQo-lkp@intel.com>
References: <20241108102907.1788584-10-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108102907.1788584-10-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_110922_099849_9ADD2308 
X-CRM114-Status: GOOD (  13.95  )
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

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20241108]
[cannot apply to herbert-crypto-2.6/master robh/for-next linus/master v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Romanov/crypto-amlogic-Don-t-hardcode-IRQ-count/20241108-183503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241108102907.1788584-10-avromanov%40salutedevices.com
patch subject: [PATCH v10 09/22] crypto: amlogic - Process more than MAXDESCS descriptors
config: x86_64-buildonly-randconfig-002-20241109 (https://download.01.org/0day-ci/archive/20241109/202411090235.a7vEgZQo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090235.a7vEgZQo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090235.a7vEgZQo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/amlogic/amlogic-gxl-cipher.c:14:
   In file included from include/crypto/scatterwalk.h:16:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/crypto/amlogic/amlogic-gxl-cipher.c:235:13: warning: variable 'new_iv_phys' set but not used [-Wunused-but-set-variable]
     235 |         dma_addr_t new_iv_phys;
         |                    ^
   2 warnings generated.


vim +/new_iv_phys +235 drivers/crypto/amlogic/amlogic-gxl-cipher.c

   220	
   221	static int meson_kick_hardware(struct cipher_ctx *ctx)
   222	{
   223		struct meson_cipher_req_ctx *rctx = skcipher_request_ctx(ctx->areq);
   224		struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(ctx->areq);
   225		struct meson_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
   226		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
   227		struct meson_alg_template *algt = container_of(alg,
   228							       struct meson_alg_template,
   229							       alg.skcipher.base);
   230		struct meson_dev *mc = op->mc;
   231		unsigned int ivsize = crypto_skcipher_ivsize(tfm);
   232		unsigned int blockmode = algt->blockmode;
   233		enum dma_data_direction new_iv_dir;
   234		struct scatterlist *sg_head;
 > 235		dma_addr_t new_iv_phys;
   236		void *new_iv;
   237		int err;
   238	
   239		if (blockmode == DESC_OPMODE_CBC) {
   240			struct scatterlist *sg_current;
   241			unsigned int offset;
   242	
   243			if (rctx->op_dir == MESON_ENCRYPT) {
   244				sg_current = ctx->dst_sg;
   245				sg_head = ctx->areq->dst;
   246				offset = ctx->dst_offset;
   247				new_iv_dir = DMA_FROM_DEVICE;
   248			} else {
   249				sg_current = ctx->src_sg;
   250				sg_head = ctx->areq->src;
   251				offset = ctx->src_offset;
   252				new_iv_dir = DMA_TO_DEVICE;
   253			}
   254	
   255			if (ctx->areq->src == ctx->areq->dst)
   256				new_iv_dir = DMA_BIDIRECTIONAL;
   257	
   258			offset -= ivsize;
   259			new_iv = sg_virt(sg_current) + offset;
   260			new_iv_phys = sg_dma_address(sg_current) + offset;
   261		}
   262	
   263		if (blockmode == DESC_OPMODE_CBC &&
   264		    rctx->op_dir == MESON_DECRYPT) {
   265			dma_sync_sg_for_cpu(mc->dev, sg_head,
   266					    sg_nents(sg_head), new_iv_dir);
   267			memcpy(ctx->areq->iv, new_iv, ivsize);
   268		}
   269	
   270		reinit_completion(&mc->chanlist[rctx->flow].complete);
   271		meson_dma_start(mc, rctx->flow);
   272		err = wait_for_completion_interruptible_timeout(&mc->chanlist[rctx->flow].complete,
   273								msecs_to_jiffies(500));
   274		if (err == 0) {
   275			dev_err(mc->dev, "DMA timeout for flow %d\n", rctx->flow);
   276			return -EINVAL;
   277		} else if (err < 0) {
   278			dev_err(mc->dev, "Waiting for DMA completion is failed (%d)\n", err);
   279			return err;
   280		}
   281	
   282		if (blockmode == DESC_OPMODE_CBC &&
   283		    rctx->op_dir == MESON_ENCRYPT) {
   284			dma_sync_sg_for_cpu(mc->dev, sg_head,
   285					    sg_nents(sg_head), new_iv_dir);
   286			memcpy(ctx->areq->iv, new_iv, ivsize);
   287		}
   288	
   289		ctx->tloffset = 0;
   290	
   291		return 0;
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

