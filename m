Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F77E6F071
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LA3YwEufs+AMLvn3OB/vCvvYh2wzQoQAmUDEG1SG9rA=; b=tLa3xXdg5utvD7CedvAw87CqOF
	HUClbmC83q+IgbiDEa0Uw0kk456gDrhF2deCzRUMO6TMu8gy9xxViUJ6YBQLFaQtbChwi04I6Z/E6
	wJ2dvO+uOwrBExN2l5vwiv5RdSBiqGlC+CJI9tHGCx1Pk3Jvabc0hUIMBuuKtjEQRiuefcZKkJHDp
	potm/YeL5iGCuUw6dheanZvO7Le98RsEGR6yCUZCAumWAZPSwNOagVUa9b6A8ICoV/RpEDDde1q6H
	PCgeYkaZM4cnYwBJeTCmzPFTOHWy/GjTkWZWW64qJzxA7EFyOv02bui/SWGGZ9WOOQe93augolJQ4
	cXv3WDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vNY-00000007pji-2YjY;
	Fri, 01 Nov 2024 17:24:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vLN-00000007pON-3uq7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:21:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3A085C55AB;
	Fri,  1 Nov 2024 17:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB98C4CECD;
	Fri,  1 Nov 2024 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730481712;
	bh=3A2/E11RnZgbKpQM60gPR6/16KeHF4eQh342j9UDESM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oltbq8yl/+NgUCRoK5gDXZ6TqGHRBXXNP0l8DZunO8JLxAsOlx04a2jPRDnpDwNaz
	 Uij8n+ekZoW3LkB/iapCqXKieuqN3HpmXQaR54bKDfs8yhZ7v9aEsNYAxPVmTRO0nb
	 1zWngrKGYJ+7tvVXm6145d4H13gbQWqbvYk20ZJ/eXjK/koeWE8gStyXHWNlWZZzRY
	 vKdWq+p01gxF+1j0ruIM74qz7+e+THH9S2zLTzdYwEJ1Ct7ScITRPJKyzgw3WHNikK
	 mjQyfL6nBYAuXO4iwFYRC2ip56c1drrEEKtD3ihVOhBj3Sqq0xpjNQQibLKTaLeTgE
	 i5GJwlmmFCynQ==
Date: Fri, 1 Nov 2024 12:21:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, tzimmermann@suse.de,
	jernej.skrabec@gmail.com, imx@lists.linux.dev,
	tomi.valkeinen@ideasonboard.com, airlied@gmail.com, jonas@kwiboo.se,
	catalin.marinas@arm.com, will@kernel.org, mripard@kernel.org,
	shawnguo@kernel.org, hverkuil@xs4all.nl,
	maarten.lankhorst@linux.intel.com, festevam@gmail.com,
	quic_bjorande@quicinc.com, sakari.ailus@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, biju.das.jz@bp.renesas.com,
	s.hauer@pengutronix.de, geert+renesas@glider.be,
	thierry.reding@gmail.com, neil.armstrong@linaro.org, marex@denx.de,
	mchehab@kernel.org, simona@ffwll.ch, linux-media@vger.kernel.org,
	conor+dt@kernel.org, kernel@pengutronix.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com, arnd@arndb.de, sam@ravnborg.org,
	andrzej.hajda@intel.com, rfoss@kernel.org,
	dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
	nfraprado@collabora.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 09/13] dt-bindings: display: bridge: Add ITE IT6263
 LVDS to HDMI converter
Message-ID: <173048170995.3772353.5460654511674582491.robh@kernel.org>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-10-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-10-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_102154_054653_18119BE7 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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


On Mon, 28 Oct 2024 10:37:36 +0800, Liu Ying wrote:
> Document ITE IT6263 LVDS to HDMI converter.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v4:
> * Require dual-lvds-odd-pixels or dual-lvds-even-pixels DT properties for
>   port@1.
> * Drop "data-mirror: true"(30-bit LVDS data bit order is not reversed).
> 
> v3:
> * Reference lvds-dual-ports.yaml.  (Dmitry)
> * Add data-mapping DT property.  (Dmitry, Biju)
> * Allow data-mirror.
> * Drop ite,lvds-link-num-data-lanes DT property.  (Dmitry, Biju)
> 
> v2:
> * Document number of LVDS link data lanes.  (Biju)
> * Simplify ports property by dropping "oneOf".  (Rob)
> 
>  .../bindings/display/bridge/ite,it6263.yaml   | 250 ++++++++++++++++++
>  1 file changed, 250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


