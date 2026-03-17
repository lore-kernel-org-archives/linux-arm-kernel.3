Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF58FD8769
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7U6z3Ci8w4R1tNOPS3VmXJMgg839xyrQTuipdiKsKA=; b=j6AAaQ7/fsl7rBRb8xQEOv1QhK
	2e9flQH7ffkPIf7my1m2cHoOPfNFdIH+cmu7fZ8Ye/Fr2URy3SMhzD8k7Rk/H3JynNMqJkzqtU22j
	pfd46aFQX/a40zZ5wgSWEOZZ1/M8iAn3qiOJtut2oMuIZf5QfEEFHp9ZsB9GLNcJxh6e+ME32T+3m
	QXo3bkDTLiktKFmEiu+cCYBgACtwH+vR+D06hm+6KHAqZMGlIWIUwOyttCi8vyoUAfj+EE0xWrFtJ
	FtYMo3+vOwwIW1E/HGDHNIaMk6LhWIh3c+UdvR11MNucwqIxx4CddZUnGIvmGYLZgodotOpoBlfyy
	VydF4SMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UTN-00000006QdK-45dU;
	Tue, 17 Mar 2026 13:28:37 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UTL-00000006Qcv-0BqJ;
	Tue, 17 Mar 2026 13:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773754115; x=1805290115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5deYAWnk5PjnJBSj7gYUmK+FXdv106euB1I/XmQwMW4=;
  b=myIFe9i+Y6rx5bTg8R+UMoUkfeRMohQnGQqW7NKTpnGpPL1/+Q7bTy42
   RXg2+rseuxQ0jfiVBYtHrJ2t9j7zNvAnkpo1DaJsp/wPLm7MEqiI8sAnR
   HJHVvHKJXwXhWuN4YE0UO2wfJIdGNDRtseOieEGO1t96HrRHCfP5ddXfR
   GBLxIsO83jbNLdNhcPsytJI2y5fgmEU9/Xelac8G0BsoF/WsZ2aqrjLIW
   mhKGIq+L2IsINqVwLcNB+aETdhogbTGfmAGXSmPgLISv81hq6w+8TJWKQ
   WrVpN46C5OyWf6P/PJy6eEO9q91sfakO49R9baZW5vmKvnTCZaw4Tg6ca
   Q==;
X-CSE-ConnectionGUID: a86XJpDRQZe/d5oj+9pdjA==
X-CSE-MsgGUID: Ltpu3RbqQDC4igi0dJxRdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85412107"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85412107"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:28:34 -0700
X-CSE-ConnectionGUID: 91XVWifeTBGqTq3vc/kSJQ==
X-CSE-MsgGUID: 7+2RRmQVRtqZFCzALNf9ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226736160"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.171])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:28:29 -0700
Date: Tue, 17 Mar 2026 14:28:22 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
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
Message-ID: <ablWdjlrPLGhDJi4@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
 <ablRBViDR996euua@mdjait-mobl>
 <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_062835_123113_3C402496 
X-CRM114-Status: GOOD (  21.59  )
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

On Tue, Mar 17, 2026 at 02:21:20PM +0100, Michael Riesch wrote:
> Hi Mehdi,
> 
> On 3/17/26 14:08, Mehdi Djait wrote:
> > Hi Michael,
> > 
> > Thank you for this nice patch!
> > 
> > On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
> >> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
> >> for this variant to the rkcif driver and enable the MIPI CSI-2
> >> capture interfaces.
> >>
> >> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> > 
> > [...]
> > 
> >>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
> >>  					      unsigned int index)
> >>  {
> >> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
> >>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
> >>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
> >>  
> >> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
> >> +
> > 
> > while this is the correct solution for rk3588, for the rk3568 vicap this
> > will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.
> 
> nice catch ;-) However, the TRM (at least my version) claims that this
> bit has a reset value of 0x1, so the bit in question should be already
> set in the first place. Thus I decided to *not* make variant specific
> code paths.

Yes, the reset value is indeed 0x1

> 
> Do you see problems in your setup?
> 

No problems, it works as expected, I was just confused to see the
mipi capture enable added with this rk3588 patch and not before.

I just find it a bit confusing but if a nicer solution is too much
hassle we can leave it like this.

--
Kind Regards
Mehdi Djait

