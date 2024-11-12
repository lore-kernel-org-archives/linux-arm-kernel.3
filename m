Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6BED32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulJzkTsIUnc28xlLcy2pT/LCNA6vpbN+dsaVmwcqf0o=; b=ThsgppOSDBhZO40FNcVPtrANWq
	jMaSZyGVvZPxf12WFW9r8gq5jUtjMPj3h4WbP42yGchABYGetXj3etVlDqCkxeBRsS+EO4IQRWy1q
	k6pGsdP3sFkRwZmf9twt2IRRJViRgMclpb78AjELDX4f2yPMNgs3pPwQ4BUuL0QmAffmGQzfBwwN3
	vv6aH+fZ2MTvGrQ/aoNOrmZBBNoX6LMKISQLDoMlcxr8CDE55t2rLc18m8C9DMiwey40yk69u6LDJ
	fk9YXAHVY/YqlQ1aceoY27sQ8u1waYR2W6m71H3ATILsMdPfLV++VKdglYfrHZwJl1gvu+mnNc7hD
	HxDniCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tApIP-00000003GTI-1FUL;
	Tue, 12 Nov 2024 11:42:57 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoJi-000000035Bb-1E7Q;
	Tue, 12 Nov 2024 10:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731408014; x=1762944014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WSbuPZjViriUwxWd751c13Ib+xMquV1ZIwNh2c1zfsk=;
  b=Mcaq+EWtEaGzXKgPGzJ2XrbutIyCI85qy92sbOx/n8JhxjeSR4WOynls
   I0rT6O336VFre0hgMS6z5b/QN2UkDtCOL8PaxmrsQ7KY+kuLKu1SPK3iH
   3Xo/gRMYnshBIO1NHy7ukyjeHQge7bocBu2h42rPrwPIV/lfrnTeL6JrN
   xSYXFTtqEIjJbnWzOoXJS3omPe+BWXPDZmtyB1IXsoq2Y3qM9QkuTL/59
   Al1FttMEYWdwOsciG6a5IIlqejTY/IdxWZc9ME6TMNhK6Oy2aOxyVCVu4
   06JS0dIYNKZRIYmm2iX06YXlmaC55tB8jopvBgvtTFNtLm6QVLGmBYWIk
   A==;
X-CSE-ConnectionGUID: fmxi8083SWS4Ru6kDqamyg==
X-CSE-MsgGUID: /v+3IMFyTCCkz8vYzQMK1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31091438"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31091438"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:40:13 -0800
X-CSE-ConnectionGUID: x1PI4aN5Rga4d8kiUcZPSA==
X-CSE-MsgGUID: o+qOjH0vRYiNEwLirGwchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="92482645"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 02:40:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAoJb-0000000DwMj-1sn6;
	Tue, 12 Nov 2024 12:40:07 +0200
Date: Tue, 12 Nov 2024 12:40:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org,
	heiko@sntech.de, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com, tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v5 4/4] gpio: rockchip: Set input direction when request
 irq
Message-ID: <ZzMwh2GMP-bE7aLO@smile.fi.intel.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
 <20241112015408.3139996-5-ye.zhang@rock-chips.com>
 <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfTmpLSEUVTXSu8jf9tyTfQc=iG9NpovFem-qSDOCnagQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_024014_457776_A81E7D69 
X-CRM114-Status: GOOD (  11.99  )
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

On Tue, Nov 12, 2024 at 09:48:06AM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 12, 2024 at 2:54 AM Ye Zhang <ye.zhang@rock-chips.com> wrote:
> >
> > Since the GPIO can only generate interrupts when its direction is set to
> > input, it is set to input before requesting the interrupt resources.

...

> This looks like a fix to me, do you want it sent for stable? If so,
> please add the Fixes tag and put it first in the series.

Independently on the resolution on this, can the first three be applied to
for-next? I think they are valuable from the documentation perspective as
it adds the explanation of the version register bit fields.

The last one seems to me independent (code wise, meaning no potential
conflicts) to the rest and may be applied to for-current later on.

-- 
With Best Regards,
Andy Shevchenko



