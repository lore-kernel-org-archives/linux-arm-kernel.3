Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA40C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 22:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aQow7u8F41nYxZweuJnfSOxquTxQHS6OPqzJyCHngI=; b=XDfRvV9egHIJ/Wpk+8Apdfz3mP
	tYfS29EPEEqMLdTJh+IDtHX8DkX2oz4iSXmBJ6xKOBGdKTpaGGjgEOeNxsmbWunUuN9AugXWTj8Vg
	/q8lkiTziql7bapzHMb85kQCAACnWEb5MXPdGem81LcYUaYs2I3x0hJTAu8IaCLJk1T+VGr2+ltNi
	uxiwzn/bKT1i8Fr0zWDFvof2Hco4Vo2ANwR+g9sbSNJGeD0J9liJ+LPwSXC3PUUvgiB6R37umOKw3
	iGz5+oHLMQ6KMFrN6AMohmY7JCcD5F9ZIZYRT3FVuBKi+lPe3bferdmlm9YQ9SV3i8NyYEqaVZn7W
	d2CFHWRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAc1w-0000000HQ7p-31nt;
	Thu, 01 May 2025 22:05:20 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAc01-0000000HOss-1zlR;
	Thu, 01 May 2025 22:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746137001; x=1777673001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DPAjQ3tcmkEJv3Lg42rr0PDxLthYy4jnQbe2u0kwB4M=;
  b=RApLwJeJk6ptJzI+/Bsu58pF7Og1dEi9aT2pM7kfMFe7wj3JuKGBqKS+
   yWoNugWOiUoW2bBb91CP6F+FYFQZIRDv4ahpkQ9xWc+U1bjuaJcxBKzkQ
   CU+3rN5OxENuR2yKQL/Vgyu0T4tb9I32vF4O0eo3i3Nn0t+D6fZYEPwZg
   Zp9Y4Yw+mdee6cZOIUs+NLNv1I3o2exfi2cghDIqhhWP/rVZyYTIFdavq
   hQWGGmHsSQqeSj6jxHwFqUl6Knk1SpxMtIWWTyPiO9jaFsn6rkMZdzwXE
   fNBq1zJKK7Oxzn/MqpSW9jaL5co+GjCHOL3LdzBWXEkaPyiliN71dqqvb
   Q==;
X-CSE-ConnectionGUID: f3qcSXxeRFyo4flPbu9AQQ==
X-CSE-MsgGUID: aRTtksJFQie8hZ5BUGKIUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47707637"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47707637"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:03:19 -0700
X-CSE-ConnectionGUID: x/h8zWSZSKGq/ivGo4f39A==
X-CSE-MsgGUID: oZ/+2AXHTPKdy9kwJsTIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165547378"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.38])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:03:13 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1EC6011F96E;
	Fri,  2 May 2025 01:03:10 +0300 (EEST)
Date: Thu, 1 May 2025 22:03:10 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v5 05/11] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <aBPvnkdakh9AtAjv@kekkonen.localdomain>
References: <20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net>
 <20250306-v6-8-topic-rk3568-vicap-v5-5-f02152534f3c@wolfvision.net>
 <aA-hsrXa_bwiDVKS@kekkonen.localdomain>
 <43682906-f965-4e6e-8f60-22217c34fd39@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43682906-f965-4e6e-8f60-22217c34fd39@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_150321_533651_CA2FD003 
X-CRM114-Status: GOOD (  29.36  )
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

On Tue, Apr 29, 2025 at 06:08:51PM +0200, Michael Riesch wrote:
> Hi Sakari,
> 
> Thanks for your review.
> 
> On 4/28/25 17:41, Sakari Ailus wrote:
> > Hi Michael,
> > 
> > On Thu, Mar 06, 2025 at 05:56:06PM +0100, Michael Riesch wrote:
> >> [...]
> >> +
> >> +const struct rkcif_dvp_match_data px30_vip_dvp_match_data = {
> > 
> > Can you prefix this with e.g. "rk_"? It's not static...
> 
> Will do. "rkcif_" is the prefix for the other global symbols, so I'll
> use that here as well.

Ack.

> 
> > [...]
> >> +const struct rkcif_dvp_match_data rk3568_vicap_dvp_match_data = {
> >> +	.in_fmts = rk3568_dvp_in_fmts,
> >> +	.in_fmts_num = ARRAY_SIZE(rk3568_dvp_in_fmts),
> >> +	.out_fmts = dvp_out_fmts,
> >> +	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
> >> +	.setup = rk3568_dvp_grf_setup,
> >> +	.has_scaler = false,
> >> +	.regs = {
> >> +		[RKCIF_DVP_CTRL] = 0x00,
> >> +		[RKCIF_DVP_INTEN] = 0x04,
> >> +		[RKCIF_DVP_INTSTAT] = 0x08,
> >> +		[RKCIF_DVP_FOR] = 0x0c,
> >> +		[RKCIF_DVP_LINE_NUM_ADDR] = 0x2c,
> >> +		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
> >> +		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
> >> +		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
> >> +		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
> >> +		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
> >> +		[RKCIF_DVP_SET_SIZE] = 0x28,
> >> +		[RKCIF_DVP_CROP] = 0x34,
> >> +		[RKCIF_DVP_FRAME_STATUS] = 0x3c,
> >> +		[RKCIF_DVP_LAST_LINE] = 0x44,
> >> +		[RKCIF_DVP_LAST_PIX] = 0x48,
> >> +	},
> >> +};
> > 
> > Does this belong here? Or on the user's side?
> 
> Not sure I understand your question. The *_dvp_match_data structs are
> mostly used by rkcif-capture-dvp.c, which would mean that they belong
> here. rkcif-dev.c stores the pointer to it, but I think it can be
> considered an opaque data structure.

Ack.

> 
> > 
> >> [...]
> >> +err_streams_unregister:
> >> +	for (; i >= 0; i--)
> > 
> > You can
> 
> ... use
> 
>    for (i++; i--; )
> 
> as you pointed out in your other mail? I would rather not, actually. I
> think this would require using "i - 1"...
> 
> > 
> >> +		rkcif_stream_unregister(&interface->streams[i]);
> 
> ... here:
> 
> rkcif_stream_unregister(&interface->streams[i - 1]);
> 
> which I find less readable. Or I am wrong, but then I did not understand
> the for loop definition above, which would mean that it is less readable
> than my version.

Would it? The values inside the loop are the same, it's just the loop that
is different and does not require a signed counter variable.

> 
> OK for you if I leave this as is?

Yours might be slightly easier to grasp but making the variable signed just
for that is not very pretty.

> 
> Unfortunately, your mail seems to be cut off here. Any further comments
> to the part below?

No, that was all for now.

-- 
Regards,

Sakari Ailus

