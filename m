Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8ECE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 23:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+UYc77EWjqrP2FaPLZ0XP5kkvWLGJVdF4PjgZLE6CU=; b=EKxTABs+afd7XweyGfljNqoqSM
	9dUG9aXQCBFv3fop478G/bZEVjE0KyeDq5mXtJsF1HfdIN+YtmUbn2X0S+6Hhwkb3f31ZSuVP+mk3
	+CvLADlO0fz0QS3wo/XVr4RbFGbaSN80q1AsAuwR9AL52Zb9DwFRKUCjIle/U0XVUe3pDCGDjGoSD
	JyXZUYAgr6+jn7gTPiDOE3KM5p4q0O4NvKHwsd/xVKvabLETHQIIC4Jgy/KtOgosR510t8df0PfLF
	fE2v403Wz3q9YDLv0F3Cx6Jpyt0p5AR2e5Ec9xI4YQnEa5X8O3dl6K6ZicsJKoGpYTosnWUJiPdG4
	sRkPIVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIu9-00000006XWO-3Bcw;
	Tue, 07 Jan 2025 23:22:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIsw-00000006XFt-22bE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 23:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0FF55C576C;
	Tue,  7 Jan 2025 23:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F12C4CED6;
	Tue,  7 Jan 2025 23:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736292077;
	bh=Kilm1ZAdWzy3rPEDUVkX5c9b+aYHLITqsZsNfgNyC2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUgylO24DAttxYL26qZXve5hvrgsTvvOnKU7yq7oY/O13PXLgH2yaUT8j3dzbDI4F
	 G9gnqx8F2ap2hpu7iaASyaqHOfJli9UmxBevnHSF7UXBo7Bqje8zyZzfoNad0rvDYK
	 vctghzjYXEqQ6+9kIBAuHDSzFRUEXsjZP0JkDg0Y3iyXzdr47eYgDJZl8innUNJuU+
	 Bs1ibYZaqkYXENoWmYZnZVM0qE0RP3h0HMurlFB65jj78ZeB2qN0Ewezg7o0W1sTRR
	 FZ36XWzWe1sJeV5wOs0+d6l8bAnqoQBa1Xeo3tBY8iJRyz6zCy7HUDFNEaPVtGoBOM
	 wehUeO4yRC1Jw==
Date: Tue, 7 Jan 2025 17:21:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific
 compatible
Message-ID: <173629198495.2036683.9877314471091548361.robh@kernel.org>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_152118_571093_6BAF9689 
X-CRM114-Status: GOOD (  12.30  )
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


On Tue, 07 Jan 2025 10:49:42 +0100, Alexander Stein wrote:
> This add a imx7(d) specific compatible which is compatible to imx8mm.
> This silences the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneOf' conditional failed, one must be fixed:
>  ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Fabio is clearly confused, and I prefer this patch over his. As 
it is probably past the drm-misc cutoff, I applied it to DT tree.
 
Thanks,
Rob


