Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA40C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HBQvXv6p+u/RbI1JvgnZn1coJcIMNlU2UJpSprDOLww=; b=zo3NXQqT0Fy4PZRD0p9twWj3Xz
	SBZzH7PtGPF6/EjPTppKzDJYwSxEkikPgrm4tmnedcoQv8tLKPhckb6/CHk58FwN1qyKZ6MVZBak3
	W0r9Rj/saqo3C/iBmVuhzJgEBqnOGaGseZ0kI0zIlqNsXBswzwizSQwkapU23SeMewemRXh7IejoU
	5tUxO82h3gLCDiVEGlt46K5B4j91MLU7mkONENqnSWQkSlga3x8Qko0Dp4I+kurPbi/JqjHr8TgE/
	D2FK0PBvdOSZVlDeCdoA3ztFEDvxbPL5olcM+qhdQpOoyLJOp8QiWyM6HOACcPBlpbeqJzkilE9fv
	OmILJU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OGY-00000005aOn-2fDI;
	Tue, 15 Sep 2026 08:11:46 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OGV-00000005aNT-3BTh;
	Tue, 15 Sep 2026 08:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789459903; x=1820995903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIV5i/07/x8Lh1kdJ4pqvn6E+LCPP2Auh0d7O+8uc6g=;
  b=jxQJOl5qfks5PkaHy28IGEbylAQiYuF3KJNqj5ayKNk7mmYAw0qRXBaQ
   I04GsAhw4NAINAaChIWRJFTQQJvqgHZozGf1Jtp+XTYHhEq2c7IG2kvFg
   8WE8fCdytw4y7Yzl3cWDKK89q957i9u0hzElDBk6/pQY82gaTEc3aCuBi
   PpWzHWrVsPE/elxcXVL8PEk9i5tlrftxR0xAas0IRniKro7ZtawzLL5Js
   ODQ2VitXvZtFOESijD5FJxOHc7t4Nez5zIDLag/xuJnmdVpLLOALpFKkR
   cMsg8pUox++OOGp8s3S3CAsK2csIFxbHrgNtCt4hRovYH3S/p61ZkfUHX
   g==;
X-CSE-ConnectionGUID: mA739q27Q+K1O47JIRQNHQ==
X-CSE-MsgGUID: FrC9BwTYTS+wYUb9tw8dvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100970537"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100970537"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:11:40 -0700
X-CSE-ConnectionGUID: A61ofmMuT1WaatRfRHR9oQ==
X-CSE-MsgGUID: 9FXUUD7fTb+kFjCdl+uAGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269613058"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.203])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 01:11:36 -0700
Date: Tue, 15 Sep 2026 11:11:34 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: rva333@protonmail.com, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v4 2/3] nvmem: add mt6323 PMIC EFUSE driver
Message-ID: <aqj9ttde-cZXPm_Z@ashevche-desk.local>
References: <20260911-mt6323-nvmem-v4-0-626dd17531dc@protonmail.com>
 <20260911-mt6323-nvmem-v4-2-626dd17531dc@protonmail.com>
 <170bcc15-38fc-47cb-89f5-8fe7411111aa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170bcc15-38fc-47cb-89f5-8fe7411111aa@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_011143_832723_E75A55E2 
X-CRM114-Status: GOOD (  13.17  )
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

On Mon, Sep 14, 2026 at 11:08:36PM +0100, Srinivas Kandagatla wrote:
> On 9/11/26 7:33 AM, Roman Vivchar via B4 Relay wrote:

> > Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> > The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> > thermal sensor calibration values.

...

> > +++ b/MAINTAINERS

> >  F:	drivers/iio/adc/mt6323-auxadc.c
> >  F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
> >  
> > +MEDIATEK MT6323 PMIC NVMEM DRIVER
> > +M:	Roman Vivchar <rva333@protonmail.com>
> > +S:	Maintained
> > +F:	drivers/nvmem/mt6323-efuse.c
> 
> placement is in wrong order,

Can you elaborate on this? I do not see the issue.

> same in make file too.

> >  MEDIATEK MT6735 CLOCK & RESET DRIVERS
> >  M:	Yassine Oudjana <y.oudjana@protonmail.com>
> >  L:	linux-clk@vger.kernel.org

...

> > +++ b/drivers/nvmem/Makefile

> > obj-$(CONFIG_NVMEM_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
> >  nvmem-microchip-otpc-y			:= microchip-otpc.o
> >  obj-$(CONFIG_NVMEM_MTK_EFUSE)		+= nvmem_mtk-efuse.o
> >  nvmem_mtk-efuse-y			:= mtk-efuse.o
> > +obj-$(CONFIG_NVMEM_MT6323_EFUSE)		+= nvmem_mt6323-efuse.o
> > +nvmem_mt6323-efuse-y			:= mt6323-efuse.o

Yes, here the digits should be before letters.

> >  obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
> >  nvmem-mxs-ocotp-y			:= mxs-ocotp.o
> >  obj-$(CONFIG_NVMEM_NINTENDO_OTP)	+= nvmem-nintendo-otp.o

-- 
With Best Regards,
Andy Shevchenko



