Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB98ECCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 16:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxBBtH7krL28Lf++0v/88mZKwfVrP+XMX16p/0JxW/w=; b=UKsHXGGoKQHdYQyxKPp6+Fe7a+
	kgGYATECIBF+Miw/myquvScRfBr3owJLsWZpFv1gU0r5Uz7V2tEO+cJx/6kENO+eHfU8tUMb2Z0Mb
	HFxVoWVlVbWd+36iV5B6JV2oI0K/rlWzCkCi/n1G+wuZsWf/puovNZElwhBKvz3jQjY9b9r/SDlRV
	idatnwBEmkNBRi5lHVuxyFrNEXlw7E59FvfMW+TtXySXu/AnDQuyhYk3VdM+LXv5WrSpPfhXMeDen
	rLX6gbB5mr0lczzYNvOBbN9+CjRgNU+WwKO737GwGTZLG05YTTpuip9VdgS/0dKcn6sgAsnSIYe+0
	S1PemMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBc9X-00000003hfP-2fH9;
	Wed, 22 Oct 2025 16:57:35 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBc9U-00000003heM-2CHp;
	Wed, 22 Oct 2025 16:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761152252; x=1792688252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+nKmViPGEd5HHAvlkpd7KM0ge3MtmJeo7sJQU8Dwq/A=;
  b=Jqq9FesMA9VPv/MX4JGGSdn4MNrBGEvHouiy6o1LKCC6rg4oPCo+Jhkh
   +EwD6Xah5CY8Hz7YCOCK0mA6urQpcVYFi4NAeV7R58R3k+bzmet5wc2nC
   OGNaldXiqMyI37K3nYsl0gMw+R4KbMRl4gQh89QBJoXaOcscvBmuOBPF4
   ArS0dp8z1HmeuFmsdYNHA+BYgltikwL3mosNFHPgjvC44KY2BYK/lj41o
   nnMDYX26yYYCr9uAFz/jQUarQvNQ99mI+lcOMVtNGwl79/0IGgEeVdReQ
   fzvi7gWvGjvw84EMmwIyDWd5tYuoeDGeiHX9h5i93iWX8LPFGPsLPTesx
   A==;
X-CSE-ConnectionGUID: x/aiq0/rTpyd8PChhBBybw==
X-CSE-MsgGUID: lLqAJjPHQr2DthG/UvGQGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66950974"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="66950974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 09:57:31 -0700
X-CSE-ConnectionGUID: KRwIK/DMT6WLjNYvUcxYAw==
X-CSE-MsgGUID: gXpch7GKQ5y08FYg4WRk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184700187"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 09:57:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6B128121E5B;
	Wed, 22 Oct 2025 19:57:23 +0300 (EEST)
Date: Wed, 22 Oct 2025 19:57:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Markus Elfring <Markus.Elfring@web.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH v13 00/18] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <aPkM8wD7rbFaeO2N@kekkonen.localdomain>
References: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_095733_094373_C1F24815 
X-CRM114-Status: UNSURE (   8.60  )
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

Hi Michael,

> The driver can be readily extended to provide support for the RK3588
> VICAP variant. In order to keep things simple, however, this extension
> shall be submitted separately.

I can't recall whether you already did but -- can you provide a
v4l2-compliance -m report on this version, please?

-- 
Kind regards,

Sakari Ailus

