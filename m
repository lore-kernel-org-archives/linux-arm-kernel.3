Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2760CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hqkb1t6keEZzndZlT6hY+PcIRT3tlo1JQ2H0aW/304=; b=odbF+2AI/MdL6wXU34cSrv63Mn
	koACq2VwKvKSa3LMekRWsRXrExYVnCIbxoCBrDmy2AnuaDegwtBiUr0D+ytsxWnT5A1pI2fPw7+ix
	NULp+I2G3QCdtKhX6WPb564XdrNtn2Ya7+V3bXHbe6f7fx69xuDzg912nuwBRS1cp9QZjCbYackJG
	XZIlYCa9kVw7qvAY96VySLlznVr99QULgBbx7VRuUeXpHIl0hRRAGG+IomzUS2XnZtPDDjLS8YIp7
	YuZa0sqaLHTBkG+VuwWJZCJPGN65kG7Xg1vu0urZ2sYAwFRsBVufylO7CMsD1qUevxanZzr8SYPrm
	EbH7HtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zr1-00000001RT9-3grN;
	Wed, 15 Oct 2025 11:39:39 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zqz-00000001RSE-0Uak;
	Wed, 15 Oct 2025 11:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528378; x=1792064378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TXu0uh7CCLhF3toLYB57ykbCtHisNyv/kjrZeA9vK9k=;
  b=Lwu61r+4bOgXNGIiopGlg20bc3SxfCKYGPflYR8t9UIUxzE8/xUdruce
   tLGfBq2w8VgQjWrEnas6pq11FWgyM5kIey9yJpn0x4LLnHmlnN3tb3SyI
   x503jwN8Yh8dgru+1XOBFpjxgPA2cRFyMNrugkMLt9c+PEdVAFMk0nMvl
   dvWDDcHAxGbe+NbyvavYPlM6cXo7HEkJfZYQow8tzTq/84cxRGG5nW2jI
   rudH+SrGHRHG/0Bg8D7gvCbaoyd7oFbhrLcQUgSukN1NQX8I2So0Ad5I5
   SyEMSIOMLGKopAIJvCuR/eYCA89qomS47psU3n94XgYGJy7HXxrY/lUG2
   w==;
X-CSE-ConnectionGUID: wNhg+ZnbRKOvsxxFvFFUnA==
X-CSE-MsgGUID: ogpoS93NTXGbTyapFUI++A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="85317991"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="85317991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:39:36 -0700
X-CSE-ConnectionGUID: WFNW40x6TH6qFAmoRoGiFA==
X-CSE-MsgGUID: NjIqZYg9TfO1WpOAutWVbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181281878"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:39:30 -0700
Date: Wed, 15 Oct 2025 13:39:22 +0200
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
Subject: Re: [PATCH v12 12/18] media: rockchip: rkcif: add support for rk3568
 vicap mipi capture
Message-ID: <dzdactqc2rajva7qwfua32b6rj2a2hfehj5xwiiobuamoy4x6i@cptlfyp6czrh>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-12-c6dbece6bb98@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-12-c6dbece6bb98@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_043937_229146_82E237CB 
X-CRM114-Status: UNSURE (   9.88  )
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

Thank you for the patches!

On Tue, Oct 14, 2025 at 03:01:58PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 capture
> interface. Add support for the MIPI capture interface in general
> and for the RK3568 VICAP MIPI capture in particular.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait

