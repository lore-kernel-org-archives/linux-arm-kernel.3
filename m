Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C87CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 05:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTvNkpQ3IAQko7+6csryLy/+cqTSJvKQKa3PlxiKrOA=; b=NbQG0ZME5a34Z0B/7R58PNBDLS
	TiHP94j7/J98gxRKGnVlbAdKeXOV0IZ1K77ajE4cUQos9/f05lr1cQYTkZhwEba84wOCIngxjG0nD
	RJWOe8OAWHsS9kXFXjeFCgRbv9usKI+ooAojzj1Q19pbr9+rCxu3WIi+t29fL4i/fprCYgmnoRcRM
	OGIN9/o3O6nTYjuuGgUFi0LguZQqPiVyKF+dpWIKN4NhOG0Qc3jvOayxKgVkbtrjtO6k3J+3MauAb
	bcFxyUIz4GWhmQ4n58ob+l0V1tgiR/85MLw3xHb5IymzKhakJ5UTxduHSS1y4Cuf+qFVeW7T74oE2
	9NxqC03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeVq-0000000EJrv-1nwq;
	Wed, 03 Jun 2026 05:51:34 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeVn-0000000EJqo-2hXP;
	Wed, 03 Jun 2026 05:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780465892; x=1812001892;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=U/sFUr+evDyY5P6S9Fd2jS9cFVU/nDx264kKOJ8IN08=;
  b=meAbCKrjRXYTKzMGNtcangqcX5uJMLHiiYPFM94iZj3JlFya5A6l72K3
   AzrdUm7UdQ4U7CI7qjMsnXdnIpodSLZUQE34UJVDPCyuHoD+pBUWEi62h
   RZps7yRXY1MaghT6qcGoi7+cC1FQPfod8vBWGt1ANFGbE091tchFqcww2
   NguweYiCxDKzlYk6r70v2gVHgkBGUHamtzD3X8POpvL46hMx5adIzbnx4
   Ny+nAISHFPA35D+XiHK9AW16mBVjs+Da3Po2jDw2+Q5zXBhxLz7lGhaUV
   L86Gd/PkVJBWWpGmheVG5Srmp1GX+ITDvy/r12t672FqTB1Wp+UjUhtgj
   A==;
X-CSE-ConnectionGUID: asn7sdO1RdOX54tdQUkTQw==
X-CSE-MsgGUID: ELuWxyyOQzeG2UFT1IiBNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81389794"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81389794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 22:51:22 -0700
X-CSE-ConnectionGUID: WH3kdDGERByF5mzs+Oj+Mg==
X-CSE-MsgGUID: 6jqZ1pqTQt2aNAKf7ZYlLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="241134290"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 22:51:17 -0700
Date: Wed, 3 Jun 2026 08:51:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: rva333@protonmail.com,
	Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <ah_A0yDhmZnanzn5@ashevche-desk.local>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
 <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
 <1F6728A6-BD73-4159-AAC9-82370212EF04@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1F6728A6-BD73-4159-AAC9-82370212EF04@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_225131_711801_017314E6 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 03, 2026 at 06:41:43AM +0530, Sanjay Chitroda wrote:
> On 2 June 2026 6:16:55 pm IST, Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

...

> >+MEDIATEK MT6323 PMIC AUXADC DRIVER
> >+M:	Roman Vivchar <rva333@protonmail.com>
> >+L:	linux-iio@vger.kernel.org
> 
> No need to add explicit iio list for driver.
> Top level entry covers this driver.

While that's true, if person wants to commit to maintain the code, it is always
being appreciated.

> >+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)

This line might be questionable (or at least needs an Ack from MediaTek
maintainers / senior developers.

> >+S:	Maintained
> >+F:	drivers/iio/adc/mt6323-auxadc.c
> >+F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h

-- 
With Best Regards,
Andy Shevchenko



