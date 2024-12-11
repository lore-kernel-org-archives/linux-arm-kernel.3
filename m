Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D54AE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXGReJJ8Y5ZtiNEFWEAXP7P76tT8F7Q81VHLFeIYpqk=; b=G0dAJ7eyOKA4wyV9+KPX9vazCy
	LpUgwjsF+uUFIQWIieh9R4sLojo67gIEFtHLNawMU8euHfF4oRriCTdQZrA880H35N2Hpel8IrNrq
	3VXp0FCH71W/vHEhG7jtP9RJiv/8XE8th8JyhAU10XiVlhH6lAf+7HoYTH3LpY2xyYVD8t6W3rkat
	SowJSzK9o6pJVYM3kR6LeGHv2/Vm3Ad8N1Q9dgX9Dc1rNzfSOiDmNwfLNhOyZQrb0t3rwkNrFZKe+
	1sn/Qp0CZRe/r/P7+jRruSXNDMeDeSWL1kV1/zbbVnSwxnQOaPUCfAQxcBX/+05Mkc8QRr9Q+VbBh
	M+RSgeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVTW-0000000GOki-0ETs;
	Wed, 11 Dec 2024 22:46:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVNo-0000000GNgj-2Gre;
	Wed, 11 Dec 2024 22:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hXGReJJ8Y5ZtiNEFWEAXP7P76tT8F7Q81VHLFeIYpqk=; b=Ag2lvHdhJx3url5s1XZSGf8Ihf
	qRQ14ElMfh8OqTkFd+B61mZ2SDMKkH25GyI3e8e87C7dEY+7UKpFOMjGhEgXkPbrfiu/uhPp3dbxE
	UFIJj7Y+N/BQOvyqPSEVkvjSISe/t2CHQlY0qmu79gDp3QKJeBQxw0sVi84mydxmtTMjMFPRv3lcs
	vGsWJbuPSdvIygQB+sPllmXPdGBvduEn0b6uaLhIy6fI6YhLo4bWz6nfzJi5EDNnVQi1+SEHhkeKI
	TafvPTtVfWCdAv1i3XsmoObtJHNhi/SKHk+7583Kj05vRluUVdTFxY9FbXf6s3GYwdD+Q+NN9hpDJ
	pmh8ikqw==;
Received: from mgamail.intel.com ([198.175.65.10])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVNi-00000003trj-2yd3;
	Wed, 11 Dec 2024 22:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733956834; x=1765492834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2kvRBBph1xJE6pvRj6ZGPkSzRKem9ywKKkiLD48BVGA=;
  b=PE4NxIqgYlgKF9IDXE5cCdgrRtucDpdYaNawqMpLaMIaCfPGYXYd6Dnm
   gwD6DyuK6b57G2sipLauMFz0z6M01DxAyFPLpebgxV+PePFY3vUFObQyQ
   YruDzgkLjk2owUi+T5eo+jsxy3WkNA1kG+XVYtYrpuRyK2vpMHe0zJI25
   kun6i4t7l+iL7yOMDXvbXLy1AK4lgO1cLXEwNBcRxG66ncxGUUAAcdKAI
   nBuT57Zv8y16+kGCge9sT4SagmUjcCkbkhHk+aFdGODPHJoirrOSdF+dQ
   kJcflxcoxU3PaKwBbvOZEKQChmstT4VOPImyYEx4B2m/9wGslrS4dOdh3
   A==;
X-CSE-ConnectionGUID: aeE4e75lRMq475x7DsnreA==
X-CSE-MsgGUID: FCL3hLu6Qr+5I6bDSdMgYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="51772139"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="51772139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 14:40:23 -0800
X-CSE-ConnectionGUID: OCh016OeTByxsIW9zlk+Cw==
X-CSE-MsgGUID: kTbgP8mzSsaErlQESFa1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="96389004"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2024 14:40:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLVNQ-0007AT-2d;
	Wed, 11 Dec 2024 22:40:16 +0000
Date: Thu, 12 Dec 2024 06:39:54 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Xavier Chang <xavier.chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
Message-ID: <202412120643.qzGYgONG-lkp@intel.com>
References: <20241211032256.28494-7-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211032256.28494-7-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_224035_291474_B8FE351F 
X-CRM114-Status: GOOD (  13.88  )
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
config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412120643.qzGYgONG-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120643.qzGYgONG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412120643.qzGYgONG-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/soc/mediatek/mtk-mmsys.o: in function `mtk_mmsys_update_bits':
>> drivers/soc/mediatek/mtk-mmsys.c:173:(.text+0x6c): undefined reference to `cmdq_subsys_is_valid'
   sparc-linux-ld: drivers/soc/mediatek/mtk-mutex.o: in function `mtk_mutex_enable_by_cmdq':
>> drivers/soc/mediatek/mtk-mutex.c:976:(.text+0x48c): undefined reference to `cmdq_subsys_is_valid'


vim +173 drivers/soc/mediatek/mtk-mmsys.c

   162	
   163	static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
   164					  struct cmdq_pkt *cmdq_pkt)
   165	{
   166		int ret;
   167		u32 tmp;
   168	
   169		if (mmsys->cmdq_base.size && cmdq_pkt) {
   170			struct cmdq_client *cl = (struct cmdq_client *)cmdq_pkt->cl;
   171	
   172			offset += mmsys->cmdq_base.offset;
 > 173			if (cmdq_subsys_is_valid(cl->chan, mmsys->cmdq_base.subsys)) {
   174				ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
   175							  offset, val, mask);
   176			} else {
   177				/* only MMIO access, no need to check mminfro_offset */
   178				ret = cmdq_pkt_assign(cmdq_pkt, 0,
   179						      CMDQ_ADDR_HIGH(mmsys->cmdq_base.pa_base));
   180				ret |= cmdq_pkt_write_s_mask_value(cmdq_pkt, 0,
   181								   CMDQ_ADDR_LOW(offset), val, mask);
   182			}
   183			if (ret)
   184				pr_debug("CMDQ unavailable: using CPU write\n");
   185			else
   186				return;
   187		}
   188		tmp = readl_relaxed(mmsys->regs + offset);
   189		tmp = (tmp & ~mask) | (val & mask);
   190		writel_relaxed(tmp, mmsys->regs + offset);
   191	}
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

