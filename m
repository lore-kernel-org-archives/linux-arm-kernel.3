Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E327FD8766
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRmwpKlLKDMSw83Yd8tZmcF+bi+32B6iCdXNw0BBwSE=; b=Ap8PY+sqS/ekhJhFVIjixJrfxP
	jHFRHSlbIl0WyzVrtQdMdq1u8LzBSv/+Pe1B7/xDIortdjpm347bVj8JunAE7UvJqMHLJxMab6O64
	ZCLHvr2ef/i8QGJ60DfXqUEgTaNh1D/Dhnlml588/hsdLnnebCw1oRVyzhTxMq0mChOjR+2ZZaBsX
	mJ2Lx7kYpWFoPxi5ReK70tegcgYtCG6EXNyXE7WnZkK9HukvvhrckcE/AMVqCmTgDZ9rNw2gc9DYw
	/apVnouB8qn7DGANbr4AZS+g7r2tAeGOrAlA0iLVdh0tx3DJ/s1x4N8FBU5Jh+KbsdXPmugy+obkQ
	5EfJocjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UAE-00000006Nld-1GC6;
	Tue, 17 Mar 2026 13:08:50 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UAA-00000006NkE-3vHy;
	Tue, 17 Mar 2026 13:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752927; x=1805288927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ib+EHay5TwScbqjSQEom9TotQYBqbPZY5UE1lmP2yCM=;
  b=Lz6YYB+qbanSNs+wmw/sTYvFYurim4yr8CN2fgDu0TtcE4Ut+tXn0SIm
   iCQiF/oNt9xmOmzOOPLQCjGv+NvitUanB2xPh813IM5xrUiPhxAqF40X/
   T/xhTBjsHtwiTa8ro0/5u0rUsAC2R3kFP+f1GIm5CeuSVSIwVoXfCOx8J
   bN+xcMkiyQ/JXAu/2v5xbHt9yC5yG66vcbnGvVUU4rvf+wY2wji57kCrR
   CwSJEHrUh7scmG00Xb+1o2Lbbz/L/EVotVrm9JKVQwuwp1/HEDueYDFjM
   bUmo+lWOxTk18OzL8TZo9UMKC0Lgc2Ii/EratKSjdA7JRt3aOvJmV9XkE
   g==;
X-CSE-ConnectionGUID: JFuQDnWDS8i1UjtmrPA5eg==
X-CSE-MsgGUID: KNI/uKn1TqyuWeWFsBHYJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74669407"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74669407"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:08:46 -0700
X-CSE-ConnectionGUID: b8XqIg+6TLOZoB8v4Ra2Zw==
X-CSE-MsgGUID: V7YGtNTNRBS500EvoE7Sgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218407842"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.171])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:08:41 -0700
Date: Tue, 17 Mar 2026 14:08:33 +0100
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
Subject: Re: [PATCH v2 3/9] media: rockchip: rkcif: add support for rk3588
 vicap mipi capture
Message-ID: <ablRBViDR996euua@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_060847_014311_F74AFECE 
X-CRM114-Status: GOOD (  11.67  )
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

Thank you for this nice patch!

On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
> for this variant to the rkcif driver and enable the MIPI CSI-2
> capture interfaces.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>

[...]

>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
>  					      unsigned int index)
>  {
> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
>  
> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
> +

while this is the correct solution for rk3588, for the rk3568 vicap this
will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.

--
Kind Regards
Mehdi Djait

