Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F73C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWoj2EnYU8pdqpEgmLb2/YRwbjJFFZInnM4IcyzbaYM=; b=hyyi1ghAyf9LwjU7JcFs+lu7ic
	RJIAf9bLhkaE28RVdSYi5iXFDKybnVN2PRWDqrLCgQ8DOXz3Mw7w968CdAAtLaxYfina+8iRHEQWt
	xwl82Rw8x9morq/UZQ4RtCzJDh5eFvn0wvlHOMRNcTwbn3xf73p1I1wVZvgJa8S7iZL19Dm/MO97W
	ie9g593pHGBw6R/+ElgBvTsnyyPtr+joaFslnwuCFwfAkhPHgUcjD3qRUbfj/9vAbhUKakK34jJFQ
	ngJnTFwdTG9iPBw5O2LHL+UkWB3VSaUAirHpSv7tn7RpesJ90122dqP1A7xeLJ4J9GSCVcyb1lc9c
	kZeaTXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0pg-0000000BXwO-137O;
	Wed, 15 Jan 2025 10:41:08 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0kH-0000000BWgz-0egi;
	Wed, 15 Jan 2025 10:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736937333; x=1768473333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=srmbFPQOHGz4l0rqphK2ONGqHNDOAhI+wHcwQagKgAY=;
  b=gTOsXL19XjQeysrb6m1j9prpEv2+gPdvJtv3bBF+KaInmxW0y9IqbInZ
   Vfn+koGDVWs7XxRw6+ZnQ23L3bhlsiO/asIwWCMcfeeLkKsNPjLnuaSqG
   7npolJyLQw05faQgzk5CtWDlpJvvjnnKjABSdzeXs8+x2z+GR8A9sa2/V
   4YkhtkuexIZkq/Jh1XlbJcjlUx5k1+qqIs88aOq6YwMyvEKCWUSBzCiH9
   Eagf60MUAp8RVHV0hYbMgetS0RAqu6TlzVoXRW17kT8Tu5GU5eMw95LHe
   siE8J8Zj6sbxxvPf06fnT//cpF8cinEvfV/c80+goxcN8T4mRycZOjQZN
   A==;
X-CSE-ConnectionGUID: kmqtbzojSYaqqBIhfndD4g==
X-CSE-MsgGUID: 14GSIo/6SCm7ul7J93Npcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37293888"
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; 
   d="scan'208";a="37293888"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:35:31 -0800
X-CSE-ConnectionGUID: yHD1Mg5hS+CA7ypCYlvO/A==
X-CSE-MsgGUID: BCdZ7nwgR6K8jb4ux29lKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; 
   d="scan'208";a="110064450"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.123])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:35:26 -0800
Date: Wed, 15 Jan 2025 11:35:19 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kever Yang <kever.yang@rock-chips.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH v2 0/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Message-ID: <2ktcdemu3og64vuvyxykpxrwquewubsqcpmhxykynkbl5ddwym@dsxaldpwu2u4>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20250109171232.GA17638@pendragon.ideasonboard.com>
 <6380144e-f0c4-4415-89d5-36ed3d5a4205@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6380144e-f0c4-4415-89d5-36ed3d5a4205@wolfvision.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_023533_278963_E3D66520 
X-CRM114-Status: GOOD (  48.88  )
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

Hi Michael and Laurent,

On Fri, Jan 10, 2025 at 09:48:04AM +0100, Michael Riesch wrote:
> Hi Laurent,
> 
> On 1/9/25 18:12, Laurent Pinchart wrote:
> > Hi Michael,
> > 
> > On Tue, Dec 17, 2024 at 04:55:12PM +0100, Michael Riesch wrote:
> >> [...]
> >> and refactor the whole thing. The resulting v2 of the series now adds a
> >> basic media controller centric V4L2 driver for the Rockchip CIF with
> >>  - support for the PX30 VIP (not tested, though, due to the lack of HW)
> >>  - support for the RK3568 VICAP DVP
> >>  - abstraction for the ping-pong scheme to allow for future extensions 
> >>
> >> However, several features are not yet addressed, such as
> >>  - support for the RK3568 MIPI CSI-2 receiver
> > 
> > We've discussed this previously on IRC, but I don't think the issue has
> > been raised on the list.
> > 
> > I'm puzzled by how this will work. As far as I understand, the RK3568
> > has a CSI-2 receiver with 4 data lanes and 2 clock lanes. I assume this
> > is used to support both 2x2 lanes and 1x4 lanes. Both the VICAP and ISP
> > sections of the TRM list CSI2 RX registers, but it's not clear how the
> > components are all connected. Does the ISP need to be part of the same
> > media graph ?
> 
> Well you are not the only one to be puzzled by this HW :-) I started to
> bring up the MIPI CSI-2 part and can describe the situation as I
> understand it. No claim for correctness or completeness, though.
> 
> Indeed, the RK3568 MIPI CSI-2 PHY (TRM Chapter 28) has 4 data lanes and
> 2 clock lanes. And indeed it is possible to attach one device (1x4) or
> two devices (2x2) to it. In the latter case the PHY is operated in split
> mode (and 1x4 would be the default full mode, then). The mode can be set
> in a GRF register.
> 
> The RK3568 features a MIPI CSI-2 host controller (TRM Chapter 27) that
> (apparently) is connected to the RK3568 VICAP but has its registers in a
> separate memory region. Right now I am trying to clean up the downstream
> V4L2 subdevice driver for this host controller, which shall be linked to
> the PHY using the "phys" DT property, and linked to the VICAP using DT
> endpoints. In the end, the media graph could look like
> 
>   CC1 (V4L2 subdev) --> RK3568 VICAP DVP (V4L2 device)
> 
>   CC2 (V4L2 subdev) --> RK3568 MIPI CSI-2 HOST (V4L2 subdev) -->
>   RK3568 VICAP MIPI (V4L2 device)
> 
> where CC denotes a companion chip, such as an image sensor or a video
> decoder. Note that there are two disjoint subgraphs in this topology.
> 
> As you already pointed out, the RK3568 ISP features its integrated MIPI
> CSI-2 host controller (as e.g. the RK3399 ISP does). This host
> controller is represented by a V4L2 subdevice as well, and the
> connection to the (same) MIPI PHY is established similarly. The
> difference may be that this controller has its registers within the ISP
> register block and is thus tightly coupled to the ISP (and the rkisp1
> driver).
> 
> Now I guess that in split mode the ISP MIPI path works completely
> independent and could be represented either by a separate media graph or
> by another disjoint subgraph in the same media graph.
> In split mode we need to define which host controller should handle
> which set of lanes (there are two sets, clock 1 + data 1 + data 2 as
> well as clock 2 + data 3 + data 4). Right now I am not sure how this
> should be accomplished, but then the split mode can also wait a bit.
> 
> However, as you pointed out in our IRC discussion, it is mentioned in
> TRM Chapter 12 that the RK3568 ISP can also process the DVP input. This
> still needs some verification, the rest of the paragraph is pure
> speculation. But maybe on simply needs to set the correct bits in
> CTRL_0000_VI_DPCL. Now this would mean that there should be one large
> media graph the includes the RK3568 VICAP as well as the RK3568 ISP,
> i.e., something along the lines
> 
>   CC0 (V4L2 subdev) --> RK3568 ISP MIPI CSI-2 HOST (V4L2 subdev)
>                             |
>                             v
>                      RK3568 ISP MUX (V4L2 subdev) --> RK3568 ISP...
>                             ^
>                             |
>   CC1 (V4L2 subdev) --> MAGIC V4L2 subdev? -->
>   RK3568 VICAP DVP (V4L2 device)
> 
>   CC2 (V4L2 subdev) --> RK3568 MIPI CSI-2 HOST (V4L2 subdev) -->
>   RK3568 VICAP MIPI (V4L2 device)
> 
> where the MAGIC V4L2 subdev should be a fan out of some sort?!
> 
> Now to answer your question: I guess it is going to be one media graph
> for RK3568 VICAP and RK3588 ISP. This shall be in perfect alignment with
> the RK3588, where VICAP and ISPs are clearly connected.

From what I can gather online:

"For RV1126/RV1109 and RK356X platforms, VICAP and ISP are two independent image processing IPs,
If the image collected by VICAP is to be processed by ISP , it is necessary to generate v4l2
corresponding to the interface of VICAP at the driver level sub The device is linked to the node
corresponding to the ISP to provide parameters for the ISP driver to use."

"For the RK356X chip, VICAP has only a single core and has both dvp/mipi interfaces. The dvp interface
corresponds to a rkvicap_dvp node, and the mipi interface corresponds to a rkvicap_mipi_lvds node each
node can be collected independently."

"In order to synchronize the VICAP collected data information to the isp driver, it is necessary to link the
logical sditf node generated by the VICAP driver to the virtual node
device generated by the isp"

In a graph showing how ISP and VICAP are connected a virtual connection
is used (as opposed to a Entitative connection, e.g., between the mipi
sensor and the csi2 dphy)

So from my understanding, VICAP/ISP2.1 of rk3568 seem to be different from the rk3588,
where the VICAP is clearly connected to the two ISP3.0

--
Kind Regards
Mehdi Djait

