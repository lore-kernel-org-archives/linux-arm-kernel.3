Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB469C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V6apllFtU2yY4kzjy1gvspq/tEcLQ58mQF9OgvDNcg=; b=SIhOPO1lq5/6V3Tj+B4ZPCCLql
	kB7CMVN/5HRlYoPwCobvRvV7D3dOqpcZCh7E8yZtN3dv9A7U8YfvrDDFzHV9HOUO6gxQTv6BgOKwr
	fuJYYB5+howsvbWROLci7Q7eyaHYrb8ESvUSvpRAewDxn3SMhgSrXypLZ2MXCKSm7CqR4o5m69kBY
	oDkqMiTMqykAwdgmTXq1l8MJp/oGbqXiPlkpJG+dq4aCJ+KQwqdIe5kucr2FgL8PQB5ZPIGxvb8pl
	ytmR2mJr44nfaw662QI8eNGFV1DsycmvMImSiDRxEMLo5CcGjsA4k9nlSueBEKJRerXYCPK9QpJbq
	QjbCEbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trwoo-00000005KdP-0tEc;
	Tue, 11 Mar 2025 10:26:38 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trwhI-00000005J9N-0BpT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 10:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741688332; x=1773224332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=01sOVUPbNeWequzCM14Vb8FmyT9+hZ83vgLe53UwStg=;
  b=TIEYayfLIat6SzOXwo/SzPthDmM5LU1nL15rvmitaN5zp67GEL5jS/lB
   877xPGWQ0yk6PoISfI+ALt4Uzw985LC/kM2FSTSF3fRsNSQld+6qwTrAM
   MjqgG/cjSq1vZLoHLFPPLaJdMB6t9J6e2Tarogg40CcgD0hxUC0zsDEiT
   qaeLs0kuocssCcsVJTQtkrKZwaiFTHDatDrB2XX7Rq2nSjM8ng31HUtnE
   253WZSlS0M82a6Y8+ieiOyLR2YoLIoq7JRgp1Ob177w1c/NetaaJQ1USQ
   AlDBVxCo9FP/OxXLi7r0c3EUz9hcMsHcAekgP3PLDk0v//2rQhGB73XSv
   w==;
X-CSE-ConnectionGUID: cgJASE3DQMy3TWQ+3dB3Qw==
X-CSE-MsgGUID: eFexhXhMQTut4BzEr3rwBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="45503512"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="45503512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 03:18:51 -0700
X-CSE-ConnectionGUID: wviOlQuzQGGl9dl+J9CknQ==
X-CSE-MsgGUID: lfjkY8ClS0+uA3DYnP5lZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="120004427"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 03:18:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7FAFD11F7E5;
	Tue, 11 Mar 2025 12:18:38 +0200 (EET)
Date: Tue, 11 Mar 2025 10:18:38 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sebastian LaVine <slavine@d3embedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Achath Vaishnav <vaishnav.a@ti.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jianzhong Xu <xuj@ti.com>,
	Julien Massot <julien.massot@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stuart Burtner <sburtner@d3embedded.com>,
	Tero Kristo <kristo@kernel.org>, Thakkar Devarsh <devarsht@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
Message-ID: <Z9AN_lo5T5VfshT9@kekkonen.localdomain>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
 <20250213101903.GH5888@pendragon.ideasonboard.com>
 <D8CU9UT1XQV9.3NFZ4OAQOKQG0@d3embedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8CU9UT1XQV9.3NFZ4OAQOKQG0@d3embedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_031852_092913_69BEEFD1 
X-CRM114-Status: GOOD (  22.62  )
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

Hi Sebastian,

On Mon, Mar 10, 2025 at 03:39:02PM -0400, Sebastian LaVine wrote:
> On Thu Feb 13, 2025 at 5:19 AM EST, Laurent Pinchart wrote:
> >
> > ...
> >
> >> +static const struct cci_reg_sequence imx728_wdr_12bit_3856x2176[] = {
> >
> > This table is way too big, with over 8000 entries. Some are even
> > duplicated, with identical or different values for the same register. It
> > will take more than a second at 400kHz to program this.
> >
> > At the very least I would expect a way to compact the table and make use
> > of I2C register address auto-increment. Default power-up values should
> > also likely be just dropped.
> >
> > I haven't checked in details, but doesn't this table also contain tuning
> > data for your specific camera ?
> >
> 
> In my testing, it takes around two seconds to write this table to the sensor.
> 
> I can investigate how to condense the table further, though the
> registers for this sensor are more complex than just writing values to
> addresses. The meaning of certain address writes depend on previous
> writes -- thus the "duplicated" writes you mentioned.
> 
> I do not believe this table contains tuning information for our camera
> module in particular.

The amount of the data is significantly higher than what sensors mostly
have for configuring the analogue processing and does not look like
executable code either (I've seen that, too).

Any idea what that data is?

-- 
Kind regards,

Sakari Ailus

