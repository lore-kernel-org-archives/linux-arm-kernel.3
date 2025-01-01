Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B383AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 22:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWtGsC6VD7JbMPGWl8EVOk9EyjRNOLRXagxmqa1Awn4=; b=slTpbTEweOtRCXedAcanYRZYYu
	bDKNxPqF96D4/NOVA9t6f/BCyPWZwQph4kehllz24z33qPy/2mzHmBBYIwfKJY8vIFgGjjuJf2ONn
	mgQwnnULrjodVvtjJ6WrZI0HmTfFaphtuKAd9a5NEyJEYNxGbhiQBCkpAGwgH95p7gG4WRhjNGwux
	+4brJIGh2qTptn+A+AnfL5ZLh438ymEcr9+Z8VOqHNs4JQJ4yDxpTHuRfvwArWyRSsog/FApyVrGv
	vy0zY6f2I6HCsHkXT6ma6XGwMZgI6KQgnY6ln9WUIsUD7gc5QMZU5Gd/fh4ov3keKJGOeMYfS5dPB
	R1jS7NnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tT7LQ-00000009RA6-0ejQ;
	Wed, 01 Jan 2025 22:37:40 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tT7KC-00000009R4M-0KQp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jan 2025 22:36:25 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC886778;
	Wed,  1 Jan 2025 23:35:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735770931;
	bh=iNsUYUiEGnb6iomJgG7ri6tQFUsvekg+LieM8mXv0LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HN25fJ9Uo0EujdCHA2A8+alerR+ls8x0zaHaJVziAbh8RG+Rt/T84/+weZt7P/Jch
	 ci58r2q2MApprmFn93DRlQVXV9bmfhe5Kri4mklEOTuvRBPB5XX+ULQHbbST48fZAG
	 wZUN+NucQCH+YLdg4jz/+Y5SMxmOTFDmHV0z+ff8=
Date: Thu, 2 Jan 2025 00:36:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250101223620.GA7206@pendragon.ideasonboard.com>
References: <20241231192925.97614-1-marex@denx.de>
 <20241231203136.GD31768@pendragon.ideasonboard.com>
 <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88778e2b-8c43-46a1-bb79-0d9c968a5233@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_143624_255124_E2BC0253 
X-CRM114-Status: GOOD (  27.81  )
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

On Tue, Dec 31, 2024 at 10:10:51PM +0100, Marek Vasut wrote:
> On 12/31/24 9:31 PM, Laurent Pinchart wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Thank you for the patch.
> > 
> > On Tue, Dec 31, 2024 at 08:28:48PM +0100, Marek Vasut wrote:
> >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> >> HDMI but do not contain the HDMI connector node. This flag allows such
> >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> >> use this flag, do not proliferate this flag, please fix your DTs.
> > 
> > What's the rationale for this, what prevents fixing DT instead of using
> > this flag ? Adding such a flag will most likely open the door to
> > proliferation.
> 
> See the V2 series discussion, there are a few in-tree DTs which do not 
> have the HDMI connector node. The rationale is there might be more and 
> they might come from vendors, so this flag is necessary to work around 
> those DTs.
>
> > If you can't fix the DT on particular boards, patching it could be an
> > option. We had a similar problem on Renesas boards, which we fixed with
> > a DT overlay, see commit 81c0e3dd82927064 ("drm: rcar-du: Fix legacy DT
> > to create LVDS encoder nodes"). This made the workaround self-contained,
> > and allowed dropping it several kernel versions later (in commit
> > 841281fe52a769fe, "drm: rcar-du: Drop LVDS device tree backward
> > compatibility").
>
> Frankly, I would much rather fix the few in-tree DTs and mandate the 
> HDMI connector node in DT, which would keep the code simple, rather than 
> maintain a backward compatibility workaround for problem which might not 
> even exist.

The in-tree device tree sources should be converted as part of the
series, I don't see a point trying to maintain backward compatibility
for in-tree DT sources.

For out-of-tree sources it depends on how likely the problem is. There's
no regression if nobody is affected. I personally like restricting
backward compatibility to the strict minimum, to ensure that all new DTs
will use proper bindings. Making the backward compatibility code
self-contained helps there, and we could also print a loud warning
(WARN_ON() seems appropriate) and set a date for the removal of the
workaround.

-- 
Regards,

Laurent Pinchart

