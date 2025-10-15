Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C478CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMhycy0ii/sUUxccnHx4Jta5oeilB8JlGG/oyHixMQ4=; b=3CqzkaeG2bo1cL3LhOr2cEowri
	CidWvtapNf4dLIqR4RXsCjHRgfUy0y7tYTHtOUz4l/6FAuH61GGfifhcjn1tVFMANVUqv5aOaC9ZP
	iqVs2LOIxrmbCGneGGrB+mQkOBqHauNZYwirXdnWzgZ9IgmCvBCeN3l5wg7my6xNWtUD6Nu7HefiK
	cQRvMzFeplN6sLj+TIOUAQfejIMwVewgk/98wSv2HDdNiuh5uX421HJz3/kZBu80FSXcFp1VqlBwK
	B4w9bakgq0kDL2IvXNkYx7iS2Kkd+0iOzl4CsJ7uMPtW2MqlSMsXV+MQwjdSOLcL7jD0NDHJaOeKm
	+xd9+gdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zms-00000001QR9-2dsi;
	Wed, 15 Oct 2025 11:35:22 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zmq-00000001QQj-0gtY;
	Wed, 15 Oct 2025 11:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528120; x=1792064120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N8KTLk2i4j4WLjDJhe9R8PN5ffY5bayo6I0hvYve81g=;
  b=hcaeKDL6ZpSgomkhqoFuGfP9Ik9ocUfPzSKBZrzmSBzq8gfhaaBfor9E
   vv+d1Br0s5vxAr0L8lACFTfgBIPGiAS134sJ2AADZWLdq25Vo+fPR5b7j
   OFfZY2TMjzTOX7hhNPQqPy3FCW7TzxjY9X39UINDFqtsqloqNIqKJLA9M
   plAUM+16ZacJGKbePWZXbgcYrrIlKj4XwZrA6ZpEUYPFBt0EyBKPLaRul
   oy0XvHRN37fHqKv+choXQf+pFjjebpExu4m3axs7To+A69jMHrg0ec4vd
   MEx3ivuIZMVPJN10IT1gjWETne7yLSRFGEkZULmb95nloOfWlbdazdCdI
   g==;
X-CSE-ConnectionGUID: kXJGeJsqSnqXJbbrUMax4g==
X-CSE-MsgGUID: hHhM4Nj0QWaySeYGgWb1Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62851836"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62851836"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:35:18 -0700
X-CSE-ConnectionGUID: t14M/OvQQLKxXxjF7/urHw==
X-CSE-MsgGUID: 99cgwGGKQsu1ghCz7GXPig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181952562"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:35:11 -0700
Date: Wed, 15 Oct 2025 13:35:02 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v12 06/18] media: rockchip: add driver for the rockchip
 mipi csi-2 receiver
Message-ID: <j2elclqcuwdkz3lan265u4wucwyiyl5xgb5t7mzzunfn2mwjpm@f7ipn4y2uiag>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-6-c6dbece6bb98@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-6-c6dbece6bb98@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_043520_285049_31DC32EF 
X-CRM114-Status: GOOD (  10.79  )
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

Hi Michael,

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:52PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one
> input port and one output port. It receives the data with the help
> of an external MIPI PHY (C-PHY or D-PHY) and passes it to the
> Rockchip RK3568 Video Capture (VICAP) block.
> 
> Add a V4L2 subdevice driver for this unit.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait

