Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE255C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQumjg4RpN2CHMHvpoXdDoQW/7ZhmuGr3SWT7grjcOo=; b=Hcgx2Bcu95jmi0wVftiG8QSmNt
	BFLDRCnTw8PQhW20PbdC2HjjWfhTpSMtyFL+r0psxb5IvPJsuHCSqFE3XmhOVTfbb6GPgpWsqjsdO
	Dg5v7hkdMozxE2h8ZEZJv6PxYwfkGuHOOBmVXyoku1eU99qyKv6gOkKr4us03jUDTQt+M6+eqoDyD
	Fv4GyhHslxKat8ugVlmzMCRaO0t9cGTpGRcYJe22hBuvTXFpuog6A59cSSuk9w+6COVSc1A617hmo
	z0uuWsPtAz7XhckW8UUaOfpkBgOQTp7YsLXV417J2ovF2dsygBL+x4rC0X2Ggkvz5B6HE9lwzM7Lt
	gzKeBp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SNl-0000000DbsU-48BJ;
	Fri, 18 Sep 2026 06:47:37 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SNi-0000000Dbru-3Za8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789714054; x=1821250054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6YanQ4j2axnNmAVMCsCzfrwlvp0zLxWMQEBqbUI0jaA=;
  b=lsNithr35OB6dlco6vZuBhg4KsNMgYIAz6INaMgr6332YWGcptjTtEGT
   NUReX/KxEBsVlbs0YRF8TkBuf4l9D84B7MZ4xZ3QgqDKUvis/LBZCeOXw
   TYiucbOTH4vDZinOOuTAqF3kHd6CPiwkbuosBlIMGgbP2Yycglt5xc8ZM
   nljPnASh3tve4NkSJ0Ih99tm6fKwjIlPlIcCMY972kBZP/43ONv/8nZQ8
   31YqWRL7/gmu36r5qYNO5CPu/CcKkXQXLoPXPUbJUikAFNYBl9hoVwC/F
   ZHd41Fn4lC2dBp89zhyiHPS6sCTinwgmkISLO2h0Hn4BAnkulpM0Bpr8v
   Q==;
X-CSE-ConnectionGUID: S27Cw1e1Tz+1WaSPY8icCA==
X-CSE-MsgGUID: 9ZCcXhaCSpOmI6Bq7flNQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90218031"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90218031"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:47:33 -0700
X-CSE-ConnectionGUID: G7IZiRvjTG+wDabJyYvZwQ==
X-CSE-MsgGUID: apAPhVFURX+XHpRIfNXygw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2435704"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:47:27 -0700
Date: Fri, 18 Sep 2026 09:47:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Frank.Li@oss.nxp.com
Cc: Eugen Hristev <ehristev@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Felix Gu <ustc.gu@gmail.com>, Stepan Ionichev <sozdayvek@gmail.com>,
	Shuvam Pandey <shuvampandey1@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Frank Li <Frank.Li@nxp.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Pei Xiao <xiaopei01@kylinos.cn>, Shi Hao <i.shihao.999@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	"open list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER" <linux-iio@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH 1/1] iio: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-ID: <aqzefLjkj6VrLR1b@ashevche-desk.local>
References: <20260917203652.1279059-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917203652.1279059-1-Frank.Li@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_234734_899255_E8EEEF3D 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, Sep 17, 2026 at 04:36:26PM -0400, Frank.Li@oss.nxp.com wrote:

> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() accessor in IIO DMA consumers.
> 
> chan->device->dev is not always the device used for DMA mapping.
> Some DMA engines support per-channel IOMMU mappings, so different
> channels may use different DMA devices.  dmaengine_get_dma_device()
> returns the correct device for each channel.
> 
> This also prepares for making the DMA engine provider data structures
> private. DMA consumers should not access DMA engine internals directly.

...

>  drivers/iio/adc/at91-sama5d2_adc.c                 |  9 ++++++---
>  drivers/iio/adc/nxp-sar-adc.c                      |  2 +-
>  drivers/iio/adc/stm32-adc.c                        | 10 ++++++----
>  drivers/iio/adc/stm32-dfsdm-adc.c                  |  4 ++--
>  drivers/iio/adc/ti_am335x_adc.c                    |  4 ++--
>  drivers/iio/buffer/industrialio-buffer-dmaengine.c |  5 +++--

Strictly speaking this is two patches, one per ADC folder and the other against
IIO core. But this one is not a big one, so up to Jonathan.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



