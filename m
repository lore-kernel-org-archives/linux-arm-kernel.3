Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4907DD262AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 23:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud7u5XNHKVb1+pXLbOOnmKLlsgXOFpeEaoun4aEf7AI=; b=3O56eeeTXjRxBd8KN3iVoGY1p0
	vsUHhheSZqrSSM2FCnW0vB/w26UFhMfouVUzT2oBmc1FS6FeZMyWNHbuDf70El+hpfvHUBNEy8C4I
	AudYosAwAvcnLaL8SObfHC1OePqRLRrhmwny3Vdq3tEIwfaVayefK4mwNZ0WPp9LgCbuychXbN1yi
	pxk33AQ/Car1DUxpbWGDKnhkEEeg1JdDOGpcFuSE5B9ZE59lAwtCBOhP23XIkx0nsgunGHLjOVcxh
	HoPRujU86oLoVxQxbvVz8s4D9zsbIpBGiDFjhiHBpyHsMUSxWKQ8UN/nvEN4qPWfP3pt0uWPviEiO
	tND/yvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKmX-00000004brO-0p48;
	Tue, 20 Jan 2026 23:05:05 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viKmU-00000004bqr-1bXJ;
	Tue, 20 Jan 2026 23:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768950301; x=1800486301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/C10asdU+CskhWeQvv6lZElGi85Hl4tPtMi3dsJAszk=;
  b=mW+fQKePcjd5c0+JfaUTaaTBfaEbwHOTbgP2JZuQoJBxQWexC9NVZ1jO
   QP5AW0xJUGy0EcCYnaZOR1UpawVOZ5PKL9Wj5BA2dD0ffk8tq9Ea3JYVh
   0fpLSH1VM6cJA21x7ZCunECTWTrUv1YHQDlw4jphGipyvdgqyScdjNP7y
   +p4qVAa1to0Z1q76CP1vM3H8W1KpmRv0PUmKXyWB+E2UA4Bmhx3P1arId
   C5B07OMGyxgcnlvyBlsgdVQ3mB9xtIiscxOgHcNitvM0XGqltmxURXfKk
   FR5ooE3On9KULpv34GVU+iTzueT9OqKLo6IK6Y2eZ3Elcy8b4XKSVMkTA
   w==;
X-CSE-ConnectionGUID: Vfy0lbdmQCW0VcdUIALMdQ==
X-CSE-MsgGUID: 7kQxHgg5RMywUj1RwEP2Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74025241"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="74025241"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:05:00 -0800
X-CSE-ConnectionGUID: Lsv2Uk+LR6aYFpYi3yjcVg==
X-CSE-MsgGUID: YVTunqWuQvWJGPPljzBMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="206168836"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 15:04:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3AA3C121D60;
	Wed, 21 Jan 2026 01:05:00 +0200 (EET)
Date: Wed, 21 Jan 2026 01:05:00 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: fixup! media: synopsys: add driver for the designware mipi csi-2
 receiver
Message-ID: <aXAKHMjwVpWYUmp7@kekkonen.localdomain>
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
 <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
 <7722373a-b491-4aaa-9527-a8f091cf22fe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7722373a-b491-4aaa-9527-a8f091cf22fe@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_150502_494600_5A3DA161 
X-CRM114-Status: GOOD (  15.91  )
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

On Tue, Jan 20, 2026 at 08:35:17PM +0100, Michael Riesch wrote:
> Make smatch happy by adding braces around the initialization in switch
> cases.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
> @Sakari could you try the following patch? I think this should solve the
> issues with smatch/sparse you mentioned off-list.

I don't know what went wrong but this won't apply.

Instead I made the following changes:

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 29119a1a8d38..170346ae1a59 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -237,10 +237,8 @@ static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
 
 	switch (csi2->bus_type) {
 	case V4L2_MBUS_CSI2_DPHY:
-		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-
 		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
-								 lanes, cfg);
+								 lanes, &opts.mipi_dphy);
 		if (ret)
 			return ret;
 
@@ -294,14 +292,12 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 
 	switch (code->pad) {
 	case DW_MIPI_CSI2RX_PAD_SRC:
-		const struct v4l2_mbus_framefmt *sink_fmt;
-
 		if (code->index)
 			return -EINVAL;
 
-		sink_fmt = v4l2_subdev_state_get_format(
-			sd_state, DW_MIPI_CSI2RX_PAD_SINK);
-		code->code = sink_fmt->code;
+		code->code =
+			v4l2_subdev_state_get_format(sd_state,
+						     DW_MIPI_CSI2RX_PAD_SINK)->code;
 
 		return 0;
 	case DW_MIPI_CSI2RX_PAD_SINK:

-- 
Regards,

Sakari Ailus

