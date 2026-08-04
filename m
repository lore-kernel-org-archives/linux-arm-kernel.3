Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D97C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 09:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukzJUrxVGism5T7q511qwl/xpNe86Uc9McPdwfBNVKg=; b=4mWyQCZHWKFJAro/bSkoa1gXUQ
	ZAZ4t/Cxu/rlIve6uF/MvMN92GRRJvKHG5VvX8FVEs5uFOP3ytQTpXe1x4gvmhfINjuCz6/9OvGp3
	qb/4asaMH+AN3GaXvAXjjefBn6aVtYmYFgdfVeEO7/viMgiZUrDutr72XgcKmSCo7j2xzR7z7gNuC
	N9L4Nb9GSlz9h/9sm2ms7SXIfA9tLMthiKY2Y7iWM5xiF5Y9xX7MDaFLm5NMiRjsbEQLk7Y3JPVx6
	p+l7ZkaTO3sNSm3CAkzaRjhtqXzT8e1qpsCBYwuBuk2I1dEna0wBRnRzUoVNcjTzrk/uG9DhXju0a
	u8rAjBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBHf-00000001Qqe-0TOh;
	Tue, 04 Aug 2026 09:18:03 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrBHb-00000001QpH-24UN;
	Tue, 04 Aug 2026 09:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785835080; x=1817371080;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xnc5KBLqfTrzf1YHz9XESgTn+NFwXtPtYwkXhanXaHU=;
  b=cxF8yV/q77wxZbRdNrol/7aolw1WzuREMVez62m2LhnYDF70erJAH6nw
   W8Fla4Hjsva2hiXNuEbLG7kqODYwvGHCcJYCeYzqFOjQ37eAGSSYy2M0P
   pig6xIwUghH/RBajDrCSHmbAGI3HAFTXNbDHpJNm87hS2S0+Ym5GNSFx6
   ROE7Y9WrUkyp/Zs5m/0ABgNrVM0m1zMyJ2omYkTMCeQcxaOe20/p9aaAc
   Hd+6CH+eQa8OzDf0VoYbOoXiaD340d8zGY+Y/C3HWHwmQ6sPjd9/kljST
   YoJn6Hmufk4720HJvB8/1VBiDEisRJ+wblPX04043/bSNvOcpo50RQXx/
   g==;
X-CSE-ConnectionGUID: ZGWLhwEKR4qH21GYjgSi/w==
X-CSE-MsgGUID: kRSloIUTQjSygNLT5VTJFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86150480"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86150480"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 02:17:58 -0700
X-CSE-ConnectionGUID: RwfehJXCRJaaQFErlCyujQ==
X-CSE-MsgGUID: MDC7Lv8tT+iWScqToc/J2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263448278"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2026 02:17:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrBHT-000000009Wj-2Awl;
	Tue, 04 Aug 2026 09:17:51 +0000
Date: Tue, 4 Aug 2026 17:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guangshuo Li <lgs201920130244@gmail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: mediatek: vcodec: unregister VPU watchdog handler
Message-ID: <202608041721.qBlQgdnE-lkp@intel.com>
References: <20260708124235.763036-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708124235.763036-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_021759_564952_A55C8B6B 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Guangshuo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on media-tree/master linus/master v7.2-rc6 next-20260803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guangshuo-Li/media-mediatek-vcodec-unregister-VPU-watchdog-handler/20260804-140933
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20260708124235.763036-1-lgs201920130244%40gmail.com
patch subject: [PATCH] media: mediatek: vcodec: unregister VPU watchdog handler
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608041721.qBlQgdnE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041721.qBlQgdnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041721.qBlQgdnE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vpu/mtk_vpu.c:440:1: error: expected identifier or '(' before '+' token
     440 | +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
         | ^


vim +440 drivers/media/platform/mediatek/vpu/mtk_vpu.c

   439	
 > 440	+void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
   441	{
   442		struct mtk_vpu *vpu = platform_get_drvdata(pdev);
   443	
   444		if (!vpu || id >= VPU_RST_MAX)
   445			return;
   446	
   447		mutex_lock(&vpu->vpu_mutex);
   448		vpu->wdt.handler[id].reset_func = NULL;
   449		vpu->wdt.handler[id].priv = NULL;
   450		mutex_unlock(&vpu->vpu_mutex);
   451	}
   452	EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
   453	
   454	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

