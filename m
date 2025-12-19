Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417DAD7878F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 15:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld4vcRsaM1nAAmCLAGvTjncvtrY02tFpadBGKYaEmv8=; b=3qAI4rYxcR8DiMr+DVejCRZAzt
	E6w9AWTYNCRsvyYfhaMTjwaqOepSHEEIfjvItNCZN5Moov9P44O6ONJ6hP/k2PqjeJzuNLmBQKHkB
	gY9JC+9V6ZAD6j1uSuAGes+AIjk63oN0W36e5ik7onJtVmmW/+CFFoqC6hPTI/z6kadzoh8vrSJn7
	Ku/Xama2ZREsNuKjEcHmaiYle+9lPHkM/sThHEI9OOB+OVX5tEI0MTZmJoH5eZmAC5k/6qAyHNG14
	ct7RXAmRo3ffEEgaYR3T3Tx7SSdBWp2gNG/mPNaVvdNcnLkWA6AYsAs2Q9skcS4uvSL0pTV9jQ0KS
	/gQZMp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcjs-0000000AXCo-3lBm;
	Fri, 19 Dec 2025 15:49:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWcjq-0000000AXCM-3xh2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 15:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ld4vcRsaM1nAAmCLAGvTjncvtrY02tFpadBGKYaEmv8=; b=UU6FHl7MSDr1WS7pFS9p3ZNJ8q
	r484UfApXYkx+cRmgERONLIi9139sZFY1FHWlJxHrjUGQRGnLGYemJZZW5nkJYb7MO1jxJBYdDz4Z
	4wDbN5W6Ao5vcpzzse8gSx+PEhRsoQ5W87sTu4zuOc+2voAoCvu8LDTaneqCTmULTD5s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vWcjP-00HTzF-Fy; Fri, 19 Dec 2025 16:49:27 +0100
Date: Fri, 19 Dec 2025 16:49:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Liu Ying <victor.liu@nxp.com>,
	krzk+dt@kernel.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <033450ab-f14d-4bf7-b7ee-aaffd014820d@lunn.ch>
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-1-2cce31d64608@pengutronix.de>
 <705773fc-5aba-4bff-b05e-272e1cd0262c@nxp.com>
 <20251215161706.2ea3wtu3xlwcxxar@pengutronix.de>
 <7127040f-55ab-4bfa-8795-1df76085470c@kernel.org>
 <20251219153537.zgxcokyhcqerw4jp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219153537.zgxcokyhcqerw4jp@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_074954_987294_30AE3E81 
X-CRM114-Status: GOOD (  12.21  )
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

> We discussed the ranges/reg usage internally as well with the following
> outcome:
> 
> - Situation
> 
>   With i.MX8M SoCs NXP introduced MIX domains. Each domain has a so
>   called BLK-CTRL IP. There is no common register layout for the
>   BLK-CTRL IPs. In addition to this, the register fields within one
>   register may not related to the same IP. Please see my below example:
>   
>   The DISP_MUX register configures the DPI output routed to physical
>   SoC pads as well as the internal MIPI-DSI DPI behavior. This PDFC
>   bridge binding is only interested in the first part, not the 2nd.
> 
>   In other words, the BLK-CTRL IP can be seen as a bunch of loose
>   register fields.

Why do hardware engineers keep on insisting on doing this. And why
don't software engineers when asked to review the proposed registers
push back and say No?

I know this is out of you hands, but it is something we should
encourage software engineers at SoC vendors to do. Otherwise we will
have to continually live with such a mess.

     Andrew

