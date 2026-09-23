Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD445C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncu/zn34XT642TVemZ5axxyGYMS/DAuu33HgolCVC6E=; b=4ZuL1Npn6NHd+1ghZKkQwv4dTt
	Hvy17/JIwJvmLERkpBbeiE6TYZ1osilJVCg4Jg4IFwvJTTAPcX55zek7evL1OAnuoYNNzpLGcfIwQ
	ePWfUtNX8IjHkZujAqLd0xbGkZ+Vh7qAp75LBfKk4XLl2u5tejCUXuMm/mv1lwmeUI0t8AbdX2wtI
	aH5V8J7S3S9dcHw2JdN6drcq8EA9YfCc6aGMn1ReL7MsT1NszlwZW0HYBayX1GU4qDWMMnlI2Sh14
	wDPM9d2XguSIq46+mqnfmAlj2Y7V9hGzYvvi0MpdTQfRQZIU4tric8ip1P1J6D6rCz2g72mGW5owQ
	bEp15Dyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O6c-00000008YMM-1Kld;
	Wed, 23 Sep 2026 14:37:54 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O6Z-00000008YLn-1qGn;
	Wed, 23 Sep 2026 14:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790174271; x=1821710271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dsl1YCwoDeYP9QmGMRAGNj+aPB82/2DMvVDC0LuLiqU=;
  b=MGhGqc7P7/Sl0BFrJp60gMzU1f9i6sStS13MY4OQY8fbhYrgC92/sg/c
   ZlQ0b93vazPNG0IxcvIVWge+YGYqu+4xcFaPkfmvYuUgG2RdWXf38kDSm
   LU2W1VkWQ0rmLXV2LvYwTQKM93uhiCral8ibZj9lEUKzh9uWXD3E/wFIR
   OJgZAd1Wwn5QcFJ0mM6opJBDnoJtqv9/5rONUgpxkRMI6pJ06TZ0lIA15
   K1F1m44sY4YIEUHNlcl58oJGmb7RjHm8NXaJD5wqnWmLoCiM6p4KRr2q9
   4QR8zv4KsIrt4oIW4ZpiD9KuP/KTmwUEEs0SMSQNsj0+LLRQ8U5DijYzJ
   Q==;
X-CSE-ConnectionGUID: etCjxM1iQOm2ydeDys72tQ==
X-CSE-MsgGUID: 7UxHu2uZRQy7kWmS601Y+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="93375533"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="93375533"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:37:50 -0700
X-CSE-ConnectionGUID: xIdu7W2RTAeaQNWHbrwklg==
X-CSE-MsgGUID: ubVJ2sRKQLKW38djxC7DEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="273116363"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:36:05 -0700
Date: Wed, 23 Sep 2026 16:35:56 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/5] media: rockchip: add support for the RK3576 Video
 Capture unit
Message-ID: <arPiz67nCQRPXdh3@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_073751_488915_D6037DC6 
X-CRM114-Status: GOOD (  14.24  )
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

Hello Amin,

Thank you for the series!

On Mon, Sep 21, 2026 at 05:29:56PM +0200, Amin Gattout wrote:
> This series adds support for the Video Capture (VICAP) unit of the
> Rockchip RK3576 to the rkcif driver.
> 
> The RK3576 VICAP features a digital video port (DVP) and five MIPI
> CSI-2 capture interfaces. Compared to the RK3588 variant, the MIPI
> register blocks are laid out differently, the ID_CTRL0 bit layout has
> changed, the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1, and the
> capture size is configured in the new ID_SET_SIZE register. In
> addition, the pixel clock of each MIPI port enters the VICAP through a
> dedicated gate in the clock and reset unit, so the VICAP claims five
> interface clocks and five interface resets.

[..]

> Amin Gattout (5):
>       media: dt-bindings: add rockchip rk3576 vicap
>       media: rockchip: rkcif: add a register index for the MIPI capture size
>       media: rockchip: rkcif: add a callback for the MIPI ID_CTRL1 register
>       media: rockchip: rkcif: add support for rk3576 vicap mipi capture
>       arm64: dts: rockchip: add vicap node to rk3576

For the series:
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

