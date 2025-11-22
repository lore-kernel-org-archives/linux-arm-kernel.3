Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC825CF64B1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWHXPiJRYKkrps01kIqZqRVu3P4qRHYIVg+MRqwWDCs=; b=14/QG6se0ZDJY2k8xqlutARnaK
	PFljSR8qFTAxMLYAssB3FqxBFPkyBP/5GWDDnMRVzLgi1pXjm0KgrXk9XsBxsPc+f2+oDLLGXWRcm
	TCLvpR7ZRFg8sBQAAGeFWKa2T6jYaoTfbOhB6mszJaU1zTAX9Sg+dauVvkJk6239eMsfkl7089pqZ
	fkI37hMh6S2tAbkC50SCJDmcay2bCX+dx+NjDdeFxETczEGq9QV9qKeZ6XRw9kGhew4XAmh/aePDt
	ewLBVrZ83j+RVbk0mGAE9Nvx1zpYTfIcX9CISNzrEqTX1Ta7C97EJ6HTJL3/LFZ9qFAgBt8YH37ta
	H8A414Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMiTG-00000009MYl-3z9b;
	Sat, 22 Nov 2025 07:55:50 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMiTE-00000009MYA-3GzL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 07:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763798149; x=1795334149;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SXw40nk81lfewjY1S+9hPKCWNPlyLR4zHML4HwWfuNQ=;
  b=QVM9mC5GJ0P1V3L2M/VZh8bvwnbxYhpmWtr7FeFr+cRdbghWKhXAjUMq
   nnmT6oTArYPZ2Z3woTbDhCbFA18yi6oeLw+knEOivXmaGf/V1Gh1gKH2i
   2h3Wdarrpv1sm5J4aoGlBntQVFqdjpRAFMBqEZ0U1GXxGv7Ecgj/8+uvC
   2oOkvmzMnWq3yTbrpsgxL3A2DamMS7n6bUmrPHKuu73BIqMa6CDiOAxgH
   sMCiBihE3WaJQlx760FIZULJbH25La+HHUn6Qo2Oi5UL6hwszdi3TJUuW
   2bH9ke2PDrVDLuDR6UPzAEwEXnFMYKWKusQx+DGdEt5zHZE5dfjKVsBf2
   A==;
X-CSE-ConnectionGUID: kH6eYSr+RcmJSTLEJO+26A==
X-CSE-MsgGUID: ooxesvXqSWy+dxsF/tTBwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69748456"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="69748456"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 23:55:48 -0800
X-CSE-ConnectionGUID: wOeO3mLQSJuDwYi3qD24uQ==
X-CSE-MsgGUID: AycttFy4TB+6j12x7ifhWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="222833433"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2025 23:55:43 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMiT6-0007Gp-1a;
	Sat, 22 Nov 2025 07:55:40 +0000
Date: Sat, 22 Nov 2025 15:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	tglx@linutronix.de, andersson@kernel.org, pmladek@suse.com,
	rdunlap@infradead.org, corbet@lwn.net, david@redhat.com,
	mhocko@suse.com
Cc: oe-kbuild-all@lists.linux.dev, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH 23/26] soc: qcom: Add minidump driver
Message-ID: <202511221521.2OINSDPK-lkp@intel.com>
References: <20251119154427.1033475-24-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-24-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_235548_829853_3E1593A6 
X-CRM114-Status: GOOD (  14.37  )
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

Hi Eugen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rppt-memblock/fixes]
[also build test WARNING on linus/master v6.18-rc6]
[cannot apply to akpm-mm/mm-everything rppt-memblock/for-next next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/kernel-Introduce-meminspect/20251119-235912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
patch link:    https://lore.kernel.org/r/20251119154427.1033475-24-eugen.hristev%40linaro.org
patch subject: [PATCH 23/26] soc: qcom: Add minidump driver
config: nios2-randconfig-r123-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221521.2OINSDPK-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221521.2OINSDPK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221521.2OINSDPK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/minidump.c:108:35: sparse: sparse: restricted __le32 degrades to integer
>> drivers/soc/qcom/minidump.c:154:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] seq_num @@     got unsigned int enum meminspect_uid const id @@
   drivers/soc/qcom/minidump.c:154:22: sparse:     expected restricted __le32 [usertype] seq_num
   drivers/soc/qcom/minidump.c:154:22: sparse:     got unsigned int enum meminspect_uid const id
>> drivers/soc/qcom/minidump.c:184:19: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/soc/qcom/minidump.c:183:39: sparse: signed value source

vim +108 drivers/soc/qcom/minidump.c

    93	
    94	/**
    95	 * qcom_md_get_region_index() - Lookup minidump region by id
    96	 * @md: minidump data
    97	 * @id: minidump region id
    98	 *
    99	 * Return: On success, it returns the internal region index, on failure,
   100	 *	returns	negative error value
   101	 */
   102	static int qcom_md_get_region_index(struct minidump *md, int id)
   103	{
   104		unsigned int count = le32_to_cpu(md->toc->region_count);
   105		unsigned int i;
   106	
   107		for (i = 0; i < count; i++)
 > 108			if (md->regions[i].seq_num == id)
   109				return i;
   110	
   111		return -ENOENT;
   112	}
   113	
   114	/**
   115	 * register_md_region() - Register a new minidump region
   116	 * @priv: private data
   117	 * @e: pointer to inspect entry
   118	 *
   119	 * Return: None
   120	 */
   121	static void __maybe_unused register_md_region(void *priv,
   122						      const struct inspect_entry *e)
   123	{
   124		unsigned int num_region, region_cnt;
   125		const char *name = "unknown";
   126		struct minidump_region *mdr;
   127		struct minidump *md = priv;
   128	
   129		if (!(e->va || e->pa) || !e->size) {
   130			dev_dbg(md->dev, "invalid region requested\n");
   131			return;
   132		}
   133	
   134		if (e->id < ARRAY_SIZE(meminspect_id_to_md_string))
   135			name = meminspect_id_to_md_string[e->id];
   136	
   137		if (qcom_md_get_region_index(md, e->id) >= 0) {
   138			dev_dbg(md->dev, "%s:%d region is already registered\n",
   139				name, e->id);
   140			return;
   141		}
   142	
   143		/* Check if there is a room for a new entry */
   144		num_region = le32_to_cpu(md->toc->region_count);
   145		if (num_region >= MAX_NUM_REGIONS) {
   146			dev_dbg(md->dev, "maximum region limit %u reached\n",
   147				num_region);
   148			return;
   149		}
   150	
   151		region_cnt = le32_to_cpu(md->toc->region_count);
   152		mdr = &md->regions[region_cnt];
   153		scnprintf(mdr->name, MAX_REGION_NAME_LENGTH, "K%.8s", name);
 > 154		mdr->seq_num = e->id;
   155		if (e->pa)
   156			mdr->address = cpu_to_le64(e->pa);
   157		else if (e->va)
   158			mdr->address = cpu_to_le64(__pa(e->va));
   159		mdr->size = cpu_to_le64(ALIGN(e->size, 4));
   160		mdr->valid = cpu_to_le32(MINIDUMP_REGION_VALID);
   161		region_cnt++;
   162		md->toc->region_count = cpu_to_le32(region_cnt);
   163	
   164		dev_dbg(md->dev, "%s:%d region registered %llx:%llx\n",
   165			mdr->name, mdr->seq_num, mdr->address, mdr->size);
   166	}
   167	
   168	/**
   169	 * unregister_md_region() - Unregister a previously registered minidump region
   170	 * @priv: private data
   171	 * @e: pointer to inspect entry
   172	 *
   173	 * Return: None
   174	 */
   175	static void __maybe_unused unregister_md_region(void *priv,
   176							const struct inspect_entry *e)
   177	{
   178		struct minidump_region *mdr;
   179		struct minidump *md = priv;
   180		unsigned int region_cnt;
   181		unsigned int idx;
   182	
   183		idx = qcom_md_get_region_index(md, e->id);
 > 184		if (idx < 0) {
   185			dev_dbg(md->dev, "%d region is not present\n", e->id);
   186			return;
   187		}
   188	
   189		mdr = &md->regions[0];
   190		region_cnt = le32_to_cpu(md->toc->region_count);
   191	
   192		/*
   193		 * Left shift one position all the regions located after the
   194		 * region being removed, in order to fill the gap.
   195		 * Then, zero out the last region at the end.
   196		 */
   197		memmove(&mdr[idx], &mdr[idx + 1], (region_cnt - idx - 1) * sizeof(*mdr));
   198		memset(&mdr[region_cnt - 1], 0, sizeof(*mdr));
   199		region_cnt--;
   200		md->toc->region_count = cpu_to_le32(region_cnt);
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

