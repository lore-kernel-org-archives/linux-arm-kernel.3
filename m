Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1264D1BDC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjrMDEEWBsrWVJKjOgmunNnT0rvcXHBBLrNpNk01FAg=; b=gScUgID9Nsn2BHjWCE651jKCHg
	bT6UkTlg56tCNYtyhjtBrqXf4EcifWl7Lu9p5cxFWyElqAOBJXyQLicDI8/K82OtJ/vg99gzHGMqf
	VW2ucQR4CoMR1eGlx3DV9xMQAUTRgFfZFOlkUeoXjHxjIxM4YcXiL58eLqPtxPuJQtbptHRT920Pb
	vHkV2Pe6C3igx/l9wrYTadVIvi4Q+TcIhhXVWdwQvGmC70K2frGcp7VE0WH2f1OWNY5qGuJnu33Kd
	eknoMciPn7RmsUmCpk+kqdG+9y1EmKDR+nnkM0QTjMLdnAFHWYK5BE2c0T11HqGiKX7BSAOiFUOo/
	SMsEZW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zik-0000000ELPZ-1Aii;
	Mon, 04 Nov 2024 16:14:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zh3-0000000ELAm-0W4F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 711435C47B2;
	Mon,  4 Nov 2024 16:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D564C4CECE;
	Mon,  4 Nov 2024 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730736759;
	bh=CSI8nmFVeCBUZm3j23aCaLtGEVXGHX7F+EO7hopFI+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdwUCbNmHML9PrNRdfy29kUrRCJ+UtUsiVXu0fQDqOvjEDs1MiwEtWWsiE4TNtwCr
	 15ttqIq17BRC9+3YTw8CQf1lIqQSb8DpE8Aqd6NFQjCvWdh6tnVjypmIbECUbk5EqU
	 Rs+HYZR/snvujBQGJylaQ71jiUH+YmzyUYqQsTU8tzG/jq3jInKe5RrOyUeoI0BRrr
	 X+OVVN4KzoshoecdzH9MWUr0wVrs2UhQpRNybBQbQKg6EFVcIJQG0KZrZgsd859jzN
	 WQwHpxAZZwXAIcnelk0ZpR10LFHinC8ACu2kJ9+5k8K3burokUgzCmfAdxnBjizLpx
	 gTsgy9KArpFbQ==
Date: Mon, 4 Nov 2024 10:12:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, tzimmermann@suse.de, mchehab@kernel.org,
	mripard@kernel.org, geert+renesas@glider.be, jonas@kwiboo.se,
	nfraprado@collabora.com, jernej.skrabec@gmail.com,
	kernel@pengutronix.de, prabhakar.mahadev-lad.rj@bp.renesas.com,
	quic_jesszhan@quicinc.com, Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org, arnd@arndb.de, neil.armstrong@linaro.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org, s.hauer@pengutronix.de,
	tomi.valkeinen@ideasonboard.com, shawnguo@kernel.org,
	simona@ffwll.ch, will@kernel.org, conor+dt@kernel.org,
	marex@denx.de, quic_bjorande@quicinc.com, andrzej.hajda@intel.com,
	catalin.marinas@arm.com, rfoss@kernel.org,
	sakari.ailus@linux.intel.com, airlied@gmail.com,
	maarten.lankhorst@linux.intel.com, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, hverkuil@xs4all.nl,
	biju.das.jz@bp.renesas.com, festevam@gmail.com
Subject: Re: [PATCH v5 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Message-ID: <173073675713.309604.179338628102616229.robh@kernel.org>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <20241104032806.611890-9-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104032806.611890-9-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_081241_226705_E86BAB82 
X-CRM114-Status: GOOD (  12.15  )
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


On Mon, 04 Nov 2024 11:28:01 +0800, Liu Ying wrote:
> Dual-link LVDS displays receive odd pixels and even pixels separately from
> dual LVDS links.  One link receives odd pixels and the other receives even
> pixels.  Some of those displays may also use only one LVDS link to receive
> all pixels, being odd and even agnostic.  Document common properties for
> those displays by extending LVDS display common properties defined in
> lvds.yaml.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5:
> * Use patternProperties to define port@0 and port@1.  (Biju)
> * Require port@0 or port@1.
> 
> v4:
> * Squash change for advantech,idk-2121wr.yaml and
>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
> 
> v3:
> * New patch.  (Dmitry)
> 
>  .../bindings/display/lvds-dual-ports.yaml     | 63 +++++++++++++++++++
>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +----
>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +-----
>  3 files changed, 65 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


