Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F43CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urW+lmtuJLhheVWQ8BpFuUgwQCN7IY+4DAe3lFTEh4w=; b=cKPWYEsUlYN7QyMkFll9NYIJ/K
	+9F95v+eBLS8a/p9nLMh1ExmZ0JHtVuSnUUtEY0bKDOL5k47cuNwS/BC9fHm9pKBwFaVnm6pq9Fhm
	Yi+I4W/um0ETFkMHH7GB8w5hfbIjU2FcygBw5TNQsZ89OpN1tqaxMEUwBu7aOE5NpVY+jg6AjrYgu
	sOqHDJqdwsrCXaoBpLebY0brCxAHNkebAy5HEBAMlJamMOjUbxOywv/hMLg/dx66gH9rJnDsM5t32
	nZ3zgLlshTCWL9I7EEQRcnnA6IKytDh0jXRXDYZ++Q950dxyMa6d6auVJxhDDAHDnPZJ8gnzbIQ0U
	W52VDE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zty-00000001SYG-3uv3;
	Wed, 15 Oct 2025 11:42:42 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ztu-00000001SX8-4BV3;
	Wed, 15 Oct 2025 11:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760528559; x=1792064559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pFu+OWGmKrNiW7IbMpvyiGL3vcu2W3CPoANkyq6Cw98=;
  b=cXP72WUbXrn0JhAzeUdYamEHfLbHOYxUlydlViLqmbM1Ue7rFBaG5zvg
   Z3iKHnq0pEQwQpW6y5zbJkHO/uWjLBYOr1jM6qDoJKtXiHbN+o7d86blv
   SJvaz3HwpeGtOn5iKQ4SVVVp7uFmRvVz8x0nCwH5Ow3AdqgTN5Npzupx5
   XHTTrI3zrHUn6KlVwsriNZMNC33+T8WFbG3euU84sO0ILFC/wxiSqejUN
   EHiMhxr6zkyjjbG4PwkfPJHPf577v0yhxgj9/zSDkELzQbAXXMsoztbWj
   uW5sTMW5XsL4dVNcVTKsRwBR3jfG+TDxk3+Y7ID9eGG//u+7PhpGD7vbL
   g==;
X-CSE-ConnectionGUID: grGBb+6uQ6y4twW3WcwdCw==
X-CSE-MsgGUID: vPKw45NRQdm02pp6qMpAxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="80137271"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="80137271"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:42:39 -0700
X-CSE-ConnectionGUID: T4LwNRi7SEO7sg7l4pkAgQ==
X-CSE-MsgGUID: x0PJqqQaSTaobOzVqfIv7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="186568667"
Received: from rvuia-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.114])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 04:42:32 -0700
Date: Wed, 15 Oct 2025 13:42:24 +0200
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
Subject: Re: [PATCH v12 11/18] media: rockchip: rkcif: add support for rk3568
 vicap dvp capture
Message-ID: <ny6fwo7jk7wnporyrqn4cqgrmf5m7repdg3shfflr2wnv5yn5a@k5sxpmvlwxk5>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
 <20240220-rk3568-vicap-v12-11-c6dbece6bb98@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220-rk3568-vicap-v12-11-c6dbece6bb98@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_044239_077504_DE542DE9 
X-CRM114-Status: UNSURE (   9.63  )
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

On Tue, Oct 14, 2025 at 03:01:57PM +0200, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3568 Video Capture (VICAP) unit features a Digital Video Port
> (DVP). Add support for it.
> 
> Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

--
Kind Regards
Mehdi Djait
 

