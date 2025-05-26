Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56B6C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxP4YOYO8dlyf+KUBoC8vu6XyLdR9tDcFbAO5S/GEYQ=; b=oEy3zwuUex0u7exRHldoosu9RP
	zeXTdnmxnfi1C6Xz5w0R9LROYpfe/ttpd4AgiV7XChovvt3zpWlR2JHoUhPOH9A1MoU3fapS64uva
	Sq4FIPFVnhs5YlRP2axHNPp8YFx/jqf/+9bAB5As/JNiYZHiMJ2MoXg1UVey5eA/BveK+7dIYCQjQ
	vqeABD7E2x4MjwZ05GHAz1omRSWOC395x2+LXPsxIyYtwvH8fpqGbsmEq5HFwh7gwQQOGKPCaFWR4
	YOX0IBScENPCdnACWHOaAQLr3rehtKcz1U5LLkLgZgdc6hE1QR+f4XNBOz7W0lNL/WqyIyYTSJpUo
	y53/Ej8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWoj-00000008mMB-0tRS;
	Mon, 26 May 2025 12:20:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJWjo-00000008low-1mhE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 12:15:29 +0000
Received: from pendragon.ideasonboard.com (237.69-130-109.adsl-dyn.isp.belgacom.be [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9D32D77;
	Mon, 26 May 2025 14:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748261701;
	bh=wKZ84rSUiqJ4oBYeWn0Yfd7vwqITA/nJdIUUtQp7npQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYDBm3eVdA3ASPVrxXfcbrOSDXsLPCZhjUEw6Gw4VyOkTfmbGz+KW8WmZn/9+5Ju5
	 iPFyxRMr85AXd7I91OQEzVeLz6EqEMDPrUEQRZIBXoXQxd9xIe8gn+urIbEhPZnCt3
	 cwqmAvveFpzJPV414VYNIJ+Fb3vVdGE6P/CPdi+s=
Date: Mon, 26 May 2025 14:15:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mathis Foerst <mathis.foerst@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com, mathis.foerst@zuehlke.com
Subject: Re: [PATCH v6 0/7] MT9M114 driver bugfix and improvements
Message-ID: <20250526121520.GH17743@pendragon.ideasonboard.com>
References: <20250522143512.112043-1-mathis.foerst@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522143512.112043-1-mathis.foerst@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_051528_608665_2D255A4D 
X-CRM114-Status: GOOD (  23.95  )
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

Hi Mathis, Sakari,

On Thu, May 22, 2025 at 04:35:04PM +0200, Mathis Foerst wrote:
> Hi,
> 
> this patch series contains the following bugfix and improvements
> for the MT9M114 camera driver:

Review comments need to be addressed for patches 4/7 and 5/7, but the
rest of the series seems ready. Sakari, could you merge the other
patches, to reduce the size of the next version ?

> Changelog:
> 
> v5 -> v6:
> - Add 'Reviewed-By:' tags. Sorry for forgetting this in the previous versions
> 
> v4 -> v5:
> - Apply reformatings and small refactorings as suggested in review comments
> - Split PATCH 4 into two parts: One for applying HFLIP / VFLIP while 
>   streaming, one for applying set_selection while streaming.
> - Add condition to apply set_selection immediately only if the size of the
>   cropping rectangle does not change in PATCH 5
> - Use device_property_read_u32 instead of of_property_read_u32 in PATCH 7
> 
> v3 -> v4:
> - Rename DT binding from "onnn,slew-rate" to "slew-rate" in PATCH 1 and 6 as
>   requested in the review comment.
> 
> v2 -> v3:
> - Dropped PATCH 2 ("media: mt9m114: Add get_mbus_config").
>   Based on the comments, this issure won't be fixed in the MT9M114
>   driver but in "imx-media-csi.c" in a separate patch.
> - Renumbered patches accordingly.
> - Fix the incomplete renaming of the DT property from 'pad-slew-rate'
>   to 'onnn,slew-rate' in PATCH 1 and 6.
> - Fix checkpatch formatting suggestions in PATCH 2 and 6.
> 
> v1 -> v2:
> - Fix the subjects of the patches
> - Dropped PATCH 1 ("Add bypass-pll DT-binding") as it can be automatically
>   detected if the PLL should be bypassed.
> - Renumbered patches accordingly
> - Switch to uint32, add default value and clarify documentation in PATCH 1
> - Add 'Fixes' and 'Cc' tags as suggested in PATCH 6
> 
> Link to v1 discussion:
> https://lore.kernel.org/linux-media/20250226153929.274562-1-mathis.foerst@mt.com/
> Link to v2 discussion:
> https://lore.kernel.org/linux-media/20250304103647.34235-1-mathis.foerst@mt.com/
> Link to v3 discussion:
> https://lore.kernel.org/linux-media/20250305101453.708270-1-mathis.foerst@mt.com/
> Link to v4 discussion:
> https://lore.kernel.org/linux-media/20250307093140.370061-1-mathis.foerst@mt.com/
> 
> 
> Bugfixes:
> - Fix a deadlock when using the V4L2 pad-ops get/set_frame_interval
> 
> New Features:
> - Bypass the internal PLL if EXTCLK matches the configured link_frequency
> - Make the slew-rate of the output pads configurable via DT
> - Allow to change the cropping configuration and the horizontal/vertical
>   flipping while the sensor is in streaming state
> 
> Thanks,
> Mathis
> 
> Mathis Foerst (7):
>   media: dt-bindings: mt9m114: Add slew-rate DT-binding
>   media: mt9m114: Bypass PLL if required
>   media: mt9m114: Factor out mt9m114_configure_pa
>   media: mt9m114: Apply horizontal / vertical flip while streaming
>   media: mt9m114: Allow set_selection while streaming
>   media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
>   media: mt9m114: Set pad-slew-rate
> 
>  .../bindings/media/i2c/onnn,mt9m114.yaml      |   9 +
>  drivers/media/i2c/mt9m114.c                   | 264 ++++++++++++------
>  2 files changed, 185 insertions(+), 88 deletions(-)
> 
> base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60

-- 
Regards,

Laurent Pinchart

