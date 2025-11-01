Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC8FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 11:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9kIH6UR3WvzItMogJ8+c2t26bKltrjc7KYTuVlXmfk=; b=ABAeMosHbr2dGeIA8q/iA5OTA8
	agBGUAaJSZDD4AkkP+7HbCcO+UrzvOwdeKfq+LTZyq1mbS9RkwGWcWVqgKK2Eo6NND8pPr3KUSnLJ
	u4zaeOoYq5HqHnWn06MYjzrpr/8aMdz+18W0b/cbJfPpRNdQpRMCUbobnXZjgGpBtbIjBCFTjIx3G
	Ev+T9A0dQrkZdXSlmO5Kqdl4Cr/xkH3TM4n1XiQW1t/6oNFZsK/fE3pDuV5OFKiF+8OuSNQvGkBAK
	pNAZaa6HeyXWOWC23OUXTmSHqfynjS3t8GD/ETecs6vLgAs30FjJDXgCxTikXFkrYlYlTy650GdB2
	TagXupqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9Sa-00000007HiX-26pw;
	Sat, 01 Nov 2025 11:07:52 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF9SX-00000007Hhh-19Dh;
	Sat, 01 Nov 2025 11:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761995269; x=1793531269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pwo2AH/F6d+H4i2vyh89lNZ+XD4n4HBplTVDLdDFnB4=;
  b=OdStbLUV0TYV6+cb7ou5cq0zbKWFOiQfsll+JAGDNIvEP83ZkkJ1cFaW
   fULYnrJ6qPMASZEUHEPwZrLUiMF+z7DANsaFyiwQgB0XunS/TVGlwSQr3
   lGh3d0wxyrElyOswNvmDmbAt4iXoZ2PpM90sjLlj30Cy1k7VLi+7LSXWm
   T+bfq560xJPf455SH69s01cf02OVn8sjqvXd6sEmGALKdMfhS/WRA0f+X
   UShM+lpXHcUM6LN6ZCXh4C4B+AjxhUvskCr9+1wEBc/CcI6KIBS0Rdyrv
   1Io6YRjmVqdxajeUu6cVU7t4/GVmDaqyiwh/HMUPNETOGTVEkc29aJ9pd
   g==;
X-CSE-ConnectionGUID: IvKCdI5NQO+YSEfEYKkNkw==
X-CSE-MsgGUID: N89bsFbbRKmCt11ENMJO7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64240775"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="64240775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:07:45 -0700
X-CSE-ConnectionGUID: D9pmvt2aRzub+M8lQn84cw==
X-CSE-MsgGUID: FpfaqeAFSECmJUUrEqcDeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="190789457"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2025 04:07:39 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9SE-000OAS-0o;
	Sat, 01 Nov 2025 11:07:33 +0000
Date: Sat, 1 Nov 2025 19:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Paul-PL Chen <paul-pl.chen@mediatek.com>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] soc: mediatek: Use pkt_write function pointer for
 subsys ID compatibility
Message-ID: <202511011822.Vn6fsvGr-lkp@intel.com>
References: <20251031160309.1654761-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031160309.1654761-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_040749_539928_3616A36F 
X-CRM114-Status: GOOD (  14.43  )
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

Hi Jason-JH,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/soc-mediatek-Use-pkt_write-function-pointer-for-subsys-ID-compatibility/20251101-000555
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20251031160309.1654761-2-jason-jh.lin%40mediatek.com
patch subject: [PATCH 1/5] soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
config: powerpc64-randconfig-r063-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011822.Vn6fsvGr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011822.Vn6fsvGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011822.Vn6fsvGr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/mediatek/mtk-mmsys.c:170:26: error: no member named 'pkt_write_mask' in 'struct cmdq_client_reg'
     170 |                 ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
         |                       ~~~~~~~~~~~~~~~~ ^
>> drivers/soc/mediatek/mtk-mmsys.c:172:30: error: no member named 'pa_base' in 'struct cmdq_client_reg'
     172 |                                                       mmsys->cmdq_base.pa_base,
         |                                                       ~~~~~~~~~~~~~~~~ ^
   2 errors generated.
--
>> drivers/soc/mediatek/mtk-mutex.c:1002:16: error: no member named 'pkt_write' in 'struct cmdq_client_reg'
    1002 |         mtx->cmdq_reg.pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, en_addr, 1);
         |         ~~~~~~~~~~~~~ ^
   1 error generated.


vim +170 drivers/soc/mediatek/mtk-mmsys.c

   162	
   163	static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
   164					  struct cmdq_pkt *cmdq_pkt)
   165	{
   166		int ret;
   167		u32 tmp;
   168	
   169		if (mmsys->cmdq_base.size && cmdq_pkt) {
 > 170			ret = mmsys->cmdq_base.pkt_write_mask(cmdq_pkt,
   171							      mmsys->cmdq_base.subsys,
 > 172							      mmsys->cmdq_base.pa_base,
   173							      mmsys->cmdq_base.offset + offset,
   174							      val, mask);
   175			if (ret)
   176				pr_debug("CMDQ unavailable: using CPU write\n");
   177			else
   178				return;
   179		}
   180		tmp = readl_relaxed(mmsys->regs + offset);
   181		tmp = (tmp & ~mask) | (val & mask);
   182		writel_relaxed(tmp, mmsys->regs + offset);
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

