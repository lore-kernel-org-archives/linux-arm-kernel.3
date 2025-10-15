Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E298BCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jhd+H4jDSg7qXVaJ8Xe0DvnWNODYNzGeC1e0BGynoQM=; b=ch++M//L4eLaH0+GIxcaLMw35U
	r2ND9oYGEOJ2QS7ShWocMho1A0LHyGN77LKp1EFrtdyil9Arzyv7axX8kfGgFL8LaUT/dyECyUeB8
	R6xfVeqWVedLHgchTM8k0DMnc7tJonxk1E1O2jxiBx9NXcpRu4BofEAA5LfD/ZW6Hc64c/bAIw7fD
	aEnHi4Qu7B+RC2rDvvnFXwTG/Bs5JmwQjaB3ImEQHjukUvlfdVXLzIWpgSbjECMt08ss49BcF9QPz
	BWlEzGsOVAf16pi1INtyRMzuZOdUoSU4DfqUtHm3ImmIykAatXSamo9/a7SFS6YscTd2E3wdxE0ZJ
	wSDPnZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zpN-00000001R43-3uKC;
	Wed, 15 Oct 2025 11:37:57 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zpL-00000001R39-2F8i;
	Wed, 15 Oct 2025 11:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528275; x=1792064275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BJ+2SR/KpWGdwemam3DESbxbbfj8Nd9/wR+hwgNUt10=;
  b=kva0eKlPbs6usQETCfrAnym6HWySvcmaUpnD49xMXQmygc+7OjukKDUS
   FuivbXv9mXmW9966/f5cCKR9KuiiY++uzuebGrkTDQLHXEgfbZBt3mlwg
   gCjfzpRwtBmIB9b6+6CDFCh+CdjEOisE0LzO7EuWd4NPwttj4gVuPXhyK
   hArNiTwB4OmQDQoiIRhQYnaSr+4/UPXi3r/HqXnKwuIrpLNgOvw3C3L+1
   KtLSE0YtH+CLShKozfvn4kNzrWwKrt9uq67Or6gAdg4u1R9wzj2jhu5Kb
   XpbqdunKkIokiE8bNI6WNBdj54lew3+zr0vkQyNSNRqy6BW9ZDPtX5W94
   A==;
X-CSE-ConnectionGUID: zbAK+xINRHGfajZIbYFinw==
X-CSE-MsgGUID: lB4+ulX9QvmHWFTh/e21/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62795982"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="62795982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:37:55 -0700
X-CSE-ConnectionGUID: /Orw3SdKQBCjlEN5Hkydig==
X-CSE-MsgGUID: F4S/ezpqRiOXba+i69Fv3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="219294054"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:37:48 -0700
Date: Wed, 15 Oct 2025 13:37:24 +0200
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
Subject: Re: [PATCH v12 10/18] media: rockchip: rkcif: add support for px30
 vip dvp capture
Message-ID: <w4hx4pk44vyg2j7dxp3yv2dih34fay2p35egrv3b5doh6go7rx@lli3njjm7hmg>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-10-c6dbece6bb98@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-10-c6dbece6bb98@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_043755_601882_F246C00E 
X-CRM114-Status: UNSURE (   9.26  )
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

On Tue, Oct 14, 2025 at 03:01:56PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The PX30 Video Input Processor (VIP) unit features a Digital Video
> Port (DVP). Add support for the DVP in general and for the PX30
> VIP DVP in particular.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait

