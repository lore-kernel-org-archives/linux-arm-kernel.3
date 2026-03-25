Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B736FEA833
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpAfvjnNbEC85YXzdOF716CNdnqpemHaD6lNsFIXXNo=; b=KLKFkqllw7MU5fGnOX8D2Kx0Ui
	bIAQwHegvUIQzbrgNQ/p5puLJqtElrjhmR5y5P5MiaL+1wkAAnW9TDY0P30f7fhTq6YeC2U5Fy/P3
	FrxjoUmOLMRLk5zEmtcfMQ5GH8p016j1lGLtfLwdrDTrjMvkxDO1U1ATUg2jZmvMNbiUAx/ICjcLg
	+jf6vqpZxSyOap0am0Na7IOrQtzFDmnA+FS+HLoGWoWPe3V2ynh54L5tqg7+A7JmrPCUqdL4a0I1+
	q7l/7nOFU1TLsjueNvaDuKsmtjFia6PQhUgyGTpHUryP2ctG20v4pVVp8J2tZo0m8dfTDeEuMimg3
	m1hpfPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5K6U-00000002zo9-0PEI;
	Wed, 25 Mar 2026 09:00:42 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5K6S-00000002znZ-1eVY;
	Wed, 25 Mar 2026 09:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774429240; x=1805965240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DpD3cz3pQHgqJTBucX6RnJ1ygBMNYK/5RTUg9Cqf2cE=;
  b=KxZ7yMNdNwiECbyNSyAk1cd3pgtNpfZsM1PaQBatIc9M0lgz6WtFjz++
   bRdEI9pFgqG7Vjsaf/jKw8F5c9/rKPvtBKrzxAH7juUM/bfDzbpWHP2H5
   PHJLPZ/So1ZRvQewufFez9btzCVYMbWwgHp9fmLSyu1zb84uP0sNJjGr/
   ZJhaJ3v98SQv947p7tysfesim6R2OQvsCZvp8cXYARte59sOOetrQ/avL
   0GsIeXvgARozzJ/UXnjHGtsEVFyGDpZ0KZB5xn/9vTvipHZRcbug/wPra
   6w3P/UttTSlo/VZZ6kmZokiIkp3kFcq5Oso8XzhrZg/G7oGVklNpEE20U
   A==;
X-CSE-ConnectionGUID: QWeDfJE8SJmclWRQwNu+qw==
X-CSE-MsgGUID: g/bJSt97RMeESstxnl9gbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="85771610"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="85771610"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:00:38 -0700
X-CSE-ConnectionGUID: FfBrG/siSUeCka5yu+K/8A==
X-CSE-MsgGUID: YXrsMJFFTrywJEx/SOr1vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="226253949"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.94])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:00:33 -0700
Date: Wed, 25 Mar 2026 10:00:25 +0100
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
Message-ID: <acOjnYakfLwgIW2V@mdjait-mobl>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
 <20250430-rk3588-vicap-v2-3-77de5ee9048e@collabora.com>
 <ablRBViDR996euua@mdjait-mobl>
 <e894fe10-3780-465a-984d-01f5e8f4c97e@collabora.com>
 <ablWdjlrPLGhDJi4@mdjait-mobl>
 <d97b05cb-396b-4189-8b96-88eab6f85f24@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97b05cb-396b-4189-8b96-88eab6f85f24@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_020040_484855_04E20543 
X-CRM114-Status: GOOD (  29.02  )
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

On Wed, Mar 25, 2026 at 09:04:57AM +0100, Michael Riesch wrote:
> Hi Mehdi,
> 
> On 3/17/26 14:28, Mehdi Djait wrote:
> > Hi Michael,
> > 
> > On Tue, Mar 17, 2026 at 02:21:20PM +0100, Michael Riesch wrote:
> >> Hi Mehdi,
> >>
> >> On 3/17/26 14:08, Mehdi Djait wrote:
> >>> Hi Michael,
> >>>
> >>> Thank you for this nice patch!
> >>>
> >>> On Tue, Mar 17, 2026 at 10:32:21AM +0100, Michael Riesch via B4 Relay wrote:
> >>>> From: Michael Riesch <michael.riesch@collabora.com>
> >>>>
> >>>> The RK3588 Video Capture (VICAP) unit features a Digital Video Port
> >>>> (DVP) and six MIPI CSI-2 capture interfaces. Add initial support
> >>>> for this variant to the rkcif driver and enable the MIPI CSI-2
> >>>> capture interfaces.
> >>>>
> >>>> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> >>>
> >>> [...]
> >>>
> >>>>  static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
> >>>>  					      unsigned int index)
> >>>>  {
> >>>> @@ -631,6 +765,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
> >>>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
> >>>>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
> >>>>  
> >>>> +	rkcif_mipi_write(interface, RKCIF_MIPI_CTRL, RKCIF_MIPI_CTRL_CAP_EN);
> >>>> +
> >>>
> >>> while this is the correct solution for rk3588, for the rk3568 vicap this
> >>> will write 0x1 to the VICAP_MIPI_CTRL : 0x00A0 which will enable the water line.
> >>
> >> nice catch ;-) However, the TRM (at least my version) claims that this
> >> bit has a reset value of 0x1, so the bit in question should be already
> >> set in the first place. Thus I decided to *not* make variant specific
> >> code paths.
> > 
> > Yes, the reset value is indeed 0x1
> > 
> >>
> >> Do you see problems in your setup?
> >>
> > 
> > No problems, it works as expected, I was just confused to see the
> > mipi capture enable added with this rk3588 patch and not before.
> > 
> > I just find it a bit confusing but if a nicer solution is too much
> > hassle we can leave it like this.
> 
> I agree that this is (while correct) not the nicest way. I am still
> bringing up the remaining features of the RK3588 VICAP (MUX + TOISP +
> SCALER) and it looks like I need to do some refactoring anyway to
> support them. When I do that, I shall rewrite this part. For the time
> being it would be great to have this merged in order to provide initial
> mainline support for this unit.

That sounds good.

How about adding a TODO comment ?

--
Kind Regards
Mehdi Djait

