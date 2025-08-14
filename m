Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD7ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJLy+njtJg3zpJU0OkjP/MMxOF47ssgjSnpzzM71YWA=; b=lDq9TMG7gWYzfJHl5YRiKcaNGy
	u1wCjcK4tICv9H5PrT79ZbB8nUL2ZbVlC2Kw96zwNd9rxHOsiE14cc0czSlqD/1ENnyTKVUf00Or0
	U5fCXUPagqgtmvHSm5dTowr4j9v3LNzAOAK/8LCRty0a0seXP7aMEUmO6HByLxevnYgqtqqkVlhz7
	sTlGSRCaFRcJ6KqTXWN7XGviiOdxCXZrwJv5vI7MKbdiFqPmy5Hj04GBj0WxB+G41jTNgnzsIMCKU
	GEO3ITmZ63tZNVGgLOOGhtBRfPmDvAR2/nZrVE6jOEX0jHxaocRnF52kO+Bcp+eN3jZ/QW9nZ6xkm
	EUwkZ6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umdl7-00000000RIH-1QHQ;
	Thu, 14 Aug 2025 19:37:09 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umdgY-00000000QuB-0qQX;
	Thu, 14 Aug 2025 19:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755199946; x=1786735946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sYNHy3au3eJJGLyMM/KY+GBcda4zdf0KZ+o9Rn0lDjo=;
  b=A5gID3jvD8MXvmNP+J3EDFJAzd69QDR7it3LgfjiX79oQUv277Hz43aQ
   jy6nCd0afy9ky7qJNiUnBHQZgq5RRbR7ZLfn8CqRE9uaWStvLqB/bHuKa
   QnSsLOErBqKrVNluncERZVhJh2kc1aQxub54Ukaz4DSg4WmqfviqKeFP8
   IBjB1G9Hbh2GbXEXwdYOATPpwVLpuFH0RLQqpaeynfIoOUjAL7UgeZryV
   VxFaUaLTFY0nRfOuHKn7qe40BPda36GZPfdx50KH/0msWhFVXjP++VFPQ
   3ac5XHjZ2ni7ZLLarkdGiyj0DktZl/t0NT6CNcePncJ6V+Ew0djOxU4ao
   A==;
X-CSE-ConnectionGUID: GTN68hugSdSAjTtANhtsjw==
X-CSE-MsgGUID: Hybt3szMSF26aWusTI/MJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68226982"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68226982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 12:32:24 -0700
X-CSE-ConnectionGUID: Zw1G2UnqTsuBfPLENwqAVA==
X-CSE-MsgGUID: EWHfKfNOQs+XEJGaMZISwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166807007"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2025 12:32:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umdgP-000BGs-08;
	Thu, 14 Aug 2025 19:32:17 +0000
Date: Fri, 15 Aug 2025 03:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Houlong Wei <houlong.wei@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: Re: [PATCH v1 2/4] [v1,02/04]mailbox: mtk-cmdq: Add cmdq driver for
 mt8189
Message-ID: <202508150338.bTVJvFtV-lkp@intel.com>
References: <20250814070401.13432-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814070401.13432-2-xiandong.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_123226_254955_9885B603 
X-CRM114-Status: GOOD (  12.81  )
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

Hi Xiandong,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiandong-Wang/mailbox-mtk-cmdq-Add-cmdq-driver-for-mt8189/20250814-152237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20250814070401.13432-2-xiandong.wang%40mediatek.com
patch subject: [PATCH v1 2/4] [v1,02/04]mailbox: mtk-cmdq: Add cmdq driver for mt8189
config: x86_64-buildonly-randconfig-004-20250815 (https://download.01.org/0day-ci/archive/20250815/202508150338.bTVJvFtV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150338.bTVJvFtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150338.bTVJvFtV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/mtk-cmdq-mailbox.c:781:3: error: field designator 'mminfra_offset' does not refer to any field in type 'const struct gce_plat'
     781 |         .mminfra_offset = 0x40000000, /* 1GB */
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/mtk-cmdq-mailbox.c:784:3: error: field designator 'dma_mask_bit' does not refer to any field in type 'const struct gce_plat'
     784 |         .dma_mask_bit = 35,
         |         ~^~~~~~~~~~~~~~~~~
>> drivers/mailbox/mtk-cmdq-mailbox.c:785:3: error: field designator 'secure_thread_nr' does not refer to any field in type 'const struct gce_plat'
     785 |         .secure_thread_nr = 2,
         |         ~^~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/mtk-cmdq-mailbox.c:786:3: error: field designator 'secure_thread_min' does not refer to any field in type 'const struct gce_plat'
     786 |         .secure_thread_min = 8,
         |         ~^~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +781 drivers/mailbox/mtk-cmdq-mailbox.c

   777	
   778	static const struct gce_plat gce_plat_mt8189 = {
   779		.thread_nr = 32,
   780		.shift = 3,
 > 781		.mminfra_offset = 0x40000000, /* 1GB */
   782		.control_by_sw = false,
   783		.sw_ddr_en = true,
 > 784		.dma_mask_bit = 35,
 > 785		.secure_thread_nr = 2,
 > 786		.secure_thread_min = 8,
   787		.gce_num = 2
   788	};
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

