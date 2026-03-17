Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A23FD876A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDygi8RPHkpUpj5yd00s/h2OSWXQ9dat1oOGbFe70+s=; b=lKqtq70lcwy6c+W1Ca1DJjJo9G
	7rzB1XR4h7LKWFTVDVomXK3O0H8I2NrxHNiMBJIejoFEOdjtjrFj8CO0QPEZbH54JNHotDlxH7gD1
	4M0ZCu4Yw1HSlQ/aPKJkzuw/j9kAyotfxdZJmG69j2cEL39+YE5zAcT1UhtZ7+pysfcZg9y60+zNE
	14eg5xqO5XyiN0AZOnPBF66qnOs3m35UcPYq0kBNxgG0/x2bo4HhHWuhqkX0Vxeb4rXt6a7YDv3mB
	HoeFBxLQNb+on6WF5r2dk/aplkhgSaS7dIZdhxVMGhuJ/xuLt8YeAygDrGBseZvuwjwjYljaZRFPT
	ckAzx2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UP4-00000006Q6i-0Gh4;
	Tue, 17 Mar 2026 13:24:10 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UP1-00000006Q6E-1cIY;
	Tue, 17 Mar 2026 13:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773753847; x=1805289847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tEAUK+pa+VR09YaPr4Y45r4hPgbJ47nS8N90OSVRsNA=;
  b=AlaMwYvWdoQF5odv1ZxRywoFC7kMeNgh6lax/ki4gG/nOkhT6d8/5to7
   oCj/WUnyI+li3A41nF2e4v7y26cLNLBqdfbcuewTjF/ewD5+LyREUhnyq
   x/xyoX+aDYVZUWxYYxm9M3tzHd0mXeoZnyYdGRDnWKm/COiWYp9sknmu6
   5RGZgqKQ82yYo+Ed49HPZaVjhRLCOIxULjoH5Zo/+b73gmbv2j9nqBy2y
   N7dbtm12agPZw988ydcjFI4PVPLL3b0brGI9kQu2wxn3n6L9AlXe3zV1q
   G1w6zzbpf/5zn0K18tdZOEnmLU8KdN79FzGhvg+9FRu73ghYEKdupXPdV
   Q==;
X-CSE-ConnectionGUID: WmzOF0esQ0avP6RtDLMl0A==
X-CSE-MsgGUID: Z4JdZwWQTD6l4wLt6y1DoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="77395736"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77395736"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:24:05 -0700
X-CSE-ConnectionGUID: t1KaPoM3RfWc9xe3EIi62Q==
X-CSE-MsgGUID: 8oAUK+V8QrazFR3d+q8ogw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226958468"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.171])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:24:01 -0700
Date: Tue, 17 Mar 2026 14:23:54 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, 
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Collabora Kernel Team <kernel@collabora.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] arm64: defconfig: enable designware mipi csi-2
 receiver
Message-ID: <ablVqNnYYFoy76NJ@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-9-77de5ee9048e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v2-9-77de5ee9048e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_062407_639165_BDC13B97 
X-CRM114-Status: GOOD (  10.86  )
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

Thank you for the patch!

On Tue, Mar 17, 2026 at 10:32:27AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
> recent Rockchip SoCs, such as the RK3568 and the RK3588.
> As a consequence, they are used on a lot of Rockchip-based
> single board computers and/or corresponding camera modules, such
> as the Radxa Camera 4K.
> Enable the driver for it in the default configuration.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

--
Kind Regards
Mehdi Djait

