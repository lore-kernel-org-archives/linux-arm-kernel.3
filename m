Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A9DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkGwSEJqH44xvRl33FFpA2uDYAvnfdNPsAFM1tC6ma8=; b=a3HjyFcWTGTfapUeK3TRCEYE9m
	8rgKpG5KNV6G0HkkitCY/9jtIPRpn+62U2N1VzMbqdWOvJIh4K0kMgrkln/Bwmytg1X7GR/v6QBAq
	1jegzbaI8gIJodRex0sracZvcLU0Rv6vkQ8E/YeYbBYrrzKGPbB/Lb2cYKBfj2eDay3yVvZeBnk0/
	QGc15B1/Xx/wHuCTvgJPkPBkYMruJZjj53ic5imN+Vb4r2cl+uuY86L9GaVZNHP103c1sjoPCNyPf
	Y/6+NugSmV0LBTBzczQstd1TjVn6wHvEdmOgC30DcRS6v97J3NoAmnyjLa2DkybNYuZTnF7ltxGDN
	2xS0Zp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeCp-00000005BFu-0aqi;
	Fri, 20 Dec 2024 14:42:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeAN-00000005An4-2E5U
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 14:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NkGwSEJqH44xvRl33FFpA2uDYAvnfdNPsAFM1tC6ma8=; b=l5etdAFlunOQW3720bAGfcR/0J
	UKTk4RQAowHei65j/vfH4iVA6Y2E/wB4IyeEipRPBIR92R7T5vGtE4mlFlyqiLcAAgXxaZKicq0/U
	B6No4fv99DAqeR0Y+Y9wye9e3B9FIEjWuoavWkzHbv1yq7jOv+pSfGkyjLbz1DvkOdZII5akC9Vm9
	yJMqansVfX5ykhjdfHXA/liqPKu7WZfjlqjQbqhMXL4TevvPyOMAr/EKAZ+IsyD5DKG7KzQnS7+ei
	l9kPJsZXsAXxQgfWatU8iEmpj/CwYLkEEjADfVD83/1bGGmuGVj7vTftYt+peRV/kfv+be4j32FJN
	p/503USA==;
Received: from mgamail.intel.com ([192.198.163.18])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeAJ-00000005ehP-0AZ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734705583; x=1766241583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sOmJNa/Hhe5XFaDXpS4COomViHvCXO7/i6xVU89uBIE=;
  b=mkcWWlT+poVmrAwjqvlHi1nM27MPSZp+S0br3aPrs0hXADdujHJZiaoX
   L/ACsNbLfxOOcRdpXSZk5HsbLuemtnurx2SQ//mm9XPUI1lt6DSkqJMpU
   wmEAW/BEDL8/wrko7ijbC1DnY9mxYiUbqGx9+gQEk0eQGwg9V4bnFTYy0
   LgzY4H0pHdP840nGwKrGlQI3+YVRwHCBgVuvt0sVaDiuRIqI4q++W6b3d
   UEK9SvyaNoDldbVb7iFTM9YqbhzNBs5DrcoiBN2D4RywVGSNJuYbj/9iI
   U5d8PnqVbYsa5RtMxHU+kzjZX3UvZX6Nbg6qPqjhImIbkAPbov6pf2zai
   g==;
X-CSE-ConnectionGUID: 9b9rZWNBQb6m6IARgKGh5g==
X-CSE-MsgGUID: V54p++67R5um7YW3CWDbTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="34576134"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="34576134"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 06:39:37 -0800
X-CSE-ConnectionGUID: wUDdKprFQWmiQUA2fp4c2A==
X-CSE-MsgGUID: wYszqG/7TYGV/vME6GN0Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98429513"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2024 06:39:33 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOeA6-0001FJ-0S;
	Fri, 20 Dec 2024 14:39:30 +0000
Date: Fri, 20 Dec 2024 22:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Olivier Masse <olivier.masse@nxp.com>,
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
Message-ID: <202412202214.OdgzpOke-lkp@intel.com>
References: <20241217100809.3962439-6-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217100809.3962439-6-jens.wiklander@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_143943_585155_12496830 
X-CRM114-Status: GOOD (  12.73  )
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
config: arm64-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202214.OdgzpOke-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202214.OdgzpOke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202214.OdgzpOke-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tee/optee/rstmem.c:8:
   In file included from include/linux/dma-map-ops.h:9:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/tee/optee/rstmem.c:311:67: error: expected ')'
     311 | static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee __unused,
         |                                                                   ^
   drivers/tee/optee/rstmem.c:311:46: note: to match this '('
     311 | static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee __unused,
         |                                              ^
>> drivers/tee/optee/rstmem.c:332:35: error: too many arguments to function call, expected single argument 'optee', have 2 arguments
     332 |                 pool = alloc_rstmem_pool(optee, use_case);
         |                        ~~~~~~~~~~~~~~~~~        ^~~~~~~~
   drivers/tee/optee/rstmem.c:311:29: note: 'alloc_rstmem_pool' declared here
     311 | static struct tee_shm_pool *alloc_rstmem_pool(struct optee *optee __unused,
         |                             ^                 ~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


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

