Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0122BCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xT1zy2ErfG3SFW5CODkUdNvZ/oE1fSceIq5DpdGAxaM=; b=00OzcUMMtJAbHmQX9Oz70V7ivZ
	w6QXgcG0jivwsysFbYcgrmoNaYnNYG7L3w+I0yht2QxcFyPBQJ017TDiHNSi+K1Zcqy2a7i2pIkdr
	haTuN9y5atbDqusNlkuAI0uak4D+k3OXi8SQkgeO3n8/7nXZL/X9QfGx3cpdyJXm5GwyHoHJLhRS3
	1Tsr3E/ZZP2htx2NalOoKgEM0OmsPy6WkLHMKH9LCkHIl/xQiWHsfEnWKyNPyLdAhoxKl2NS7wpXP
	XB/GhvXNN9G9S/MKtRfAQc74+D280KXAWPGz6wcnHRrF5ylUh11fyBnMP01u9LR7KB/aJRPIm1CH7
	swvbbPgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9JT-00000004Keu-0BRd;
	Mon, 15 Sep 2025 13:32:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9JQ-00000004KdY-1idG;
	Mon, 15 Sep 2025 13:32:09 +0000
Received: from ideasonboard.com (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5F748D4;
	Mon, 15 Sep 2025 15:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757943049;
	bh=k7APw+7V8PNd8IB0fAO6nOf+PeE0WSb2I+w3OW89x10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iP/hQB7Zutz0NwyinWcdTqovZFAdiTd98hd3Zh9P3IRrC7xx8nwYCjOdI8bmEneG+
	 6cd5+8mHWijpos30s62l1cJr9B+bTxhWdsZmfGHSTKZnQl0aSat3+tzpdr4u+BxcIr
	 utZhbyITMiYF7QCZRBecgNc27yhL+/kzxzzJtZd4=
Date: Mon, 15 Sep 2025 15:31:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: kernel test robot <lkp@intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
Message-ID: <jhynzoppwi22vnrdzrvqixsbvntsli7sj2vtsxrevtmxluveps@q6yzgvlqmxxb>
References: <20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f@ideasonboard.com>
 <202508240704.AZwGXBaw-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202508240704.AZwGXBaw-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_063208_587669_2D98378C 
X-CRM114-Status: GOOD (  16.51  )
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

Question for media maintainers...

I'm not sure how I should better handle this one

On Sun, Aug 24, 2025 at 07:16:21AM +0800, kernel test robot wrote:
> Hi Jacopo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on a75b8d198c55e9eb5feb6f6e155496305caba2dc]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jacopo-Mondi/media-uapi-Introduce-V4L2-extensible-params/20250820-210503
> base:   a75b8d198c55e9eb5feb6f6e155496305caba2dc
> patch link:    https://lore.kernel.org/r/20250820-extensible-parameters-validation-v4-5-30fe5a99cb1f%40ideasonboard.com
> patch subject: [PATCH v4 5/8] media: v4l2-core: Introduce v4l2-params.c
> config: nios2-randconfig-002-20250824 (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 9.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240704.AZwGXBaw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508240704.AZwGXBaw-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    nios2-linux-ld: drivers/media/v4l2-core/v4l2-params.o: in function `v4l2_params_buffer_validate':
>    v4l2-params.c:(.text+0x124): undefined reference to `vb2_plane_vaddr'
> >> v4l2-params.c:(.text+0x124): relocation truncated to fit: R_NIOS2_CALL26 against `vb2_plane_vaddr'
>

Clearly v4l2-params.c (now v4l2-isp.c) depends on VIDEOBUF2_CORE

Right now v4l2-params.c gets compiled in as part of the
videodev-objs Makefile target. IOW is not gated by a KConfig option.

To select (or better, depend) on VIDEOBUF2_CORE I should guard
v4l2-params.c with a KConfig option so that I can 'depend on
VIDEOBUF2_CORE'. Drivers that use the v4l2-params.c helper would then
have to 'select V4L2_PARAMS` (or similar).

Is this the best approach or are there alternatives I might be missing ?

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

