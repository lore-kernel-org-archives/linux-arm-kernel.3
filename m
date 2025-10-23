Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1411BCCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 00:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BzUm9JmA2mCRf/KGS8HyJCgaS2vPaXa6bP7oAZwWOg=; b=p6Gnyy4v2syobcJuYR3t6J037V
	0D0wDN/VUw6+XHG+A5ngubL578sEOWl2JUDjh4OqrV6y4FPjamKAl+XROJYtZ+b1qxCqMMiHwf444
	cGsLelEqCb1iOtlYEMF/Uedu+eKLXl9haKkptY+ZUyJtHL7uuClcbqZ+CL6VYZ7yCmAblBvvyxj1r
	Lne0Agl2iwdxqnrZzcOHhe44rHZE6vnWWddcS9utRg1uiNpNv+Uica9m2u0ecp0zPgH+M6AINbbd1
	8sroPQV7tPuyJrkM5OLhjWwUB487cS0t26mFawPUmWIzsWH6xRHFUiqrFZbgxCvTGqNR2gIQEbI/S
	+qvGunow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBiom-00000004ceU-1hLq;
	Thu, 23 Oct 2025 00:04:36 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBioj-00000004cdp-2cXD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 00:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761177874; x=1792713874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R7sNaw4y/sEBbeMQ9YD6iGrdQApY+snp9f5pwr/so7s=;
  b=X42mms2f7+cCXJHgIPaahyDLBaix+duTiNIXk012QoX+MoWW3GSMy6WP
   9+6ekSeqAEGbshmtmu0vLFNuXOgsRE+tYsD/pPE03I1t9pH7eI/Pcnz42
   g0FvpJpnAFhJ2Re/jQtPWW2vOXzgG4A/s+OD7L3ycKSQIetEKnPnX5QKa
   UNnqCnf79yvFqrcbx6BfVDTAy7Gt/JgBp9lz98sCe8SLLR/FYISR8roAJ
   dpLYqCBDkKhTBZXI5rB7K6wgk9/T3K+yLrKr4GIkB4D4BKRQSsZhGZHR2
   B7qO1fXDv9U5o0RnHVQ0F8cmc2PRacE0c8M5Gn8eL23g/7qxclx+3DoXd
   Q==;
X-CSE-ConnectionGUID: 5VfejwaISluS4BbeCr7vOA==
X-CSE-MsgGUID: NFbyZQmCSZeLNjVJ6dkvOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63242434"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63242434"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 17:04:33 -0700
X-CSE-ConnectionGUID: RQ5X8IvDSJW+shKWJ/XzaQ==
X-CSE-MsgGUID: SUBhFPknQIWpRfmqleoJzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183179024"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Oct 2025 17:04:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBiob-000CqZ-2B;
	Thu, 23 Oct 2025 00:04:25 +0000
Date: Thu, 23 Oct 2025 08:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, quic_yingdeng@quicinc.com,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Subject: Re: [PATCH v3] stm: class: Add MIPI OST protocol support
Message-ID: <202510230717.u8tTLt9x-lkp@intel.com>
References: <20251022071834.1658684-1-yingchao.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022071834.1658684-1-yingchao.deng@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_170433_711850_0155EA9B 
X-CRM114-Status: GOOD (  14.39  )
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

Hi Yingchao,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yingchao-Deng/stm-class-Add-MIPI-OST-protocol-support/20251022-152642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20251022071834.1658684-1-yingchao.deng%40oss.qualcomm.com
patch subject: [PATCH v3] stm: class: Add MIPI OST protocol support
config: i386-randconfig-013-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230717.u8tTLt9x-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230717.u8tTLt9x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230717.u8tTLt9x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/stm/p_ost.c:201:13: error: call to undeclared function 'task_tgid_nr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     201 |         hdr.tgid        = task_tgid_nr(current);
         |                           ^
   drivers/hwtracing/stm/p_ost.c:172:6: warning: unused variable 'i' [-Wunused-variable]
     172 |         int i;
         |             ^
   1 warning and 1 error generated.


vim +/task_tgid_nr +201 drivers/hwtracing/stm/p_ost.c

   154	
   155	static ssize_t
   156	notrace ost_write(struct stm_data *data, struct stm_output *output,
   157			  unsigned int chan, const char *buf, size_t count,
   158			  struct stm_source_data *source)
   159	{
   160		unsigned int c = output->channel + chan;
   161		unsigned int m = output->master;
   162		const unsigned char nil = 0;
   163		u32 header = DATA_HEADER;
   164		struct trc_hdr {
   165			u16 version;
   166			u16 magic;
   167			u32 cpu;
   168			u64 timestamp;
   169			u64 tgid;
   170		} hdr;
   171		ssize_t sz;
   172		int i;
   173		struct ost_output *op = output->pdrv_private;
   174	
   175		/*
   176		 * Identify the source by entity type.
   177		 * If entity type is not set, return error value.
   178		 */
   179		if (op->node.entity_type)
   180			header |= ost_entity_value[op->node.entity_type];
   181		else
   182			return -EINVAL;
   183	
   184		/*
   185		 * STP framing rules for OST frames:
   186		 *   * the first packet of the OST frame is marked;
   187		 *   * the last packet is a FLAG with timestamped tag.
   188		 */
   189		/* Message layout: HEADER / DATA / TAIL */
   190		/* HEADER */
   191		sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
   192				  4, (u8 *)&header);
   193		if (sz <= 0)
   194			return sz;
   195	
   196		/* DATA */
   197		hdr.version	= STM_MAKE_VERSION(0, 3);
   198		hdr.magic	= STM_HEADER_MAGIC;
   199		hdr.cpu		= raw_smp_processor_id();
   200		hdr.timestamp = sched_clock();
 > 201		hdr.tgid	= task_tgid_nr(current);
   202		sz = stm_data_write(data, m, c, false, &hdr, sizeof(hdr));
   203		if (sz <= 0)
   204			return sz;
   205	
   206		sz = stm_data_write(data, m, c, false, buf, count);
   207	
   208		/* TAIL */
   209		if (sz > 0)
   210			data->packet(data, m, c, STP_PACKET_FLAG,
   211				STP_PACKET_TIMESTAMPED, 0, &nil);
   212	
   213		return sz;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

