Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0952E77184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGGAeiJA6FciiOuW19o3087NumEDaOafIgZcBRmVsf4=; b=POWiQahJqnLeq2BodzSD3vYN3p
	AZgI8HZ6C+h8tJ/WA9Qw9Bd0hZM8vpPVuXkhodue17JeZMY0DcFrYRA1Pgo59XGf5McGXHZ+cwMNk
	V/jubbzUkjCabBWi8jaBemJ9suQQhFe+6q6Z9dPcf7jh79/BQG5582BROKJNDuoNEgzLI9XFE+pBY
	7C+ASREDL4Gan4BMYP7WTtmGrzB7Lr72WjSxLbNhzV8QB8mK5mqz59mqsKvLNqCwPflksIXJ02pYX
	ay5SkY1SoU9YvQtBi6+K5zCHlUErIxSuiZ0XENPWmBu321zBxTz16Bi6SoORR6vS5lDCM/pHIY6Of
	HctFBlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOw0P-00000006nUj-1oIT;
	Sat, 21 Dec 2024 09:42:41 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOvzD-00000006nEW-2OQh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 09:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734774087; x=1766310087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9eM/1Gwvqw9NFasQx8+TbXTknoD5E3yJoT0gay2E3b4=;
  b=HeaWxvsUc6PQeKQFfl20t+83QvUQNBNGm/Lr0GSIDItd1JwatJJ5MXvE
   2yw88xq/fnZlqIqIifvdujEg2h/1Y2s7ZyJXy4krKIRagm8gWBvBVd3of
   3uZfDqH7H5NE3a0jiXwYt0c/sv4mF4tTGplbvu26Ftcqv7U/PPMzjDUom
   hfQ02E/9jF8l40FczEol1o7u/Il2sqhwQmpmxBQpaCMCzq/fn6E14n/OM
   cOvSELFL36/NwaalfWZuoC7L62pDZ0tWDJayI6cN9IwZlWdKFYXLQwEDT
   reSkRGWCyDDvcE+2WQ8nvoxSLCFZC4vYr3DUds+7Ha+VC4tH2rSI133VD
   w==;
X-CSE-ConnectionGUID: DJpuC0uQSMeAK02wbjIEPQ==
X-CSE-MsgGUID: Xw6WaPl0RqSw/GUZIKHLkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34591739"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="34591739"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 01:41:25 -0800
X-CSE-ConnectionGUID: IQY7nnjrRhChZ3O5MRg0Kw==
X-CSE-MsgGUID: U9hk4K7xQCueEJK+xwO6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="98798584"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Dec 2024 01:41:19 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOvz3-00027L-12;
	Sat, 21 Dec 2024 09:41:17 +0000
Date: Sat, 21 Dec 2024 17:40:18 +0800
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH v4 5/6] optee: FF-A: dynamic restricted memory allocation
Message-ID: <202412211952.LOCC8Lbo-lkp@intel.com>
References: <20241217100809.3962439-6-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217100809.3962439-6-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_014127_663615_BF2A77F9 
X-CRM114-Status: GOOD (  11.62  )
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

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/tee-add-restricted-memory-allocation/20241217-181101
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241217100809.3962439-6-jens.wiklander%40linaro.org
patch subject: [PATCH v4 5/6] optee: FF-A: dynamic restricted memory allocation
config: arm64-randconfig-r112-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211952.LOCC8Lbo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241221/202412211952.LOCC8Lbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211952.LOCC8Lbo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tee/optee/rstmem.c:311:67: error: expected ';', ',' or ')' before '__unused'
     311 | static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee __unused,
         |                                                                   ^~~~~~~~
   drivers/tee/optee/rstmem.c: In function 'optee_rstmem_alloc':
>> drivers/tee/optee/rstmem.c:332:24: error: implicit declaration of function 'alloc_rstmem_pool' [-Wimplicit-function-declaration]
     332 |                 pool = alloc_rstmem_pool(optee, use_case);
         |                        ^~~~~~~~~~~~~~~~~
>> drivers/tee/optee/rstmem.c:332:22: error: assignment to 'struct tee_shm_pool *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     332 |                 pool = alloc_rstmem_pool(optee, use_case);
         |                      ^


vim +311 drivers/tee/optee/rstmem.c

   268	
   269	static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee, u32 use_case)
   270	{
   271		struct optee_rstmem_cma_pool *rp;
   272		size_t min_size;
   273		int rc;
   274	
   275		rp = kzalloc(sizeof(*rp), GFP_KERNEL);
   276		if (!rp)
   277			return ERR_PTR(-ENOMEM);
   278		rp->rstmem.use_case = use_case;
   279	
   280		rc = get_rstmem_config(optee, use_case, &min_size, &rp->align, NULL,
   281				       &rp->end_point_count);
   282		if (rc) {
   283			if (rc != -ENOSPC)
   284				goto err;
   285			rp->end_points = kcalloc(rp->end_point_count,
   286						 sizeof(*rp->end_points), GFP_KERNEL);
   287			if (!rp->end_points) {
   288				rc = -ENOMEM;
   289				goto err;
   290			}
   291			rc = get_rstmem_config(optee, use_case, &min_size, &rp->align,
   292					       rp->end_points, &rp->end_point_count);
   293			if (rc)
   294				goto err_kfree_eps;
   295		}
   296	
   297		rp->pool.ops = &rstmem_pool_ops_cma;
   298		rp->optee = optee;
   299		rp->page_count = min_size / PAGE_SIZE;
   300		mutex_init(&rp->mutex);
   301	
   302		return &rp->pool;
   303	
   304	err_kfree_eps:
   305		kfree(rp->end_points);
   306	err:
   307		kfree(rp);
   308		return ERR_PTR(rc);
   309	}
   310	#else /*CONFIG_CMA*/
 > 311	static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee __unused,
   312						      u32 use_case __unused)
   313	{
   314		return ERR_PTR(-EINVAL);
   315	}
   316	#endif /*CONFIG_CMA*/
   317	
   318	int optee_rstmem_alloc(struct tee_context *ctx, struct tee_shm *shm,
   319			       u32 flags, u32 use_case, size_t size)
   320	{
   321		struct optee *optee = tee_get_drvdata(ctx->teedev);
   322		struct tee_shm_pool *pool;
   323		int rc;
   324	
   325		if (!optee->rstmem_pools)
   326			return -EINVAL;
   327		if (flags)
   328			return -EINVAL;
   329	
   330		pool = xa_load(&optee->rstmem_pools->xa, use_case);
   331		if (!pool) {
 > 332			pool = alloc_rstmem_pool(optee, use_case);
   333			if (IS_ERR(pool))
   334				return PTR_ERR(pool);
   335			rc = xa_insert(&optee->rstmem_pools->xa, use_case, pool,
   336				       GFP_KERNEL);
   337			if (rc) {
   338				pool->ops->destroy_pool(pool);
   339				return rc;
   340			}
   341		}
   342	
   343		return pool->ops->alloc(pool, shm, size, 0);
   344	}
   345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

