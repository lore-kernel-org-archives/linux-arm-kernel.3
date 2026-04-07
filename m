Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD38BFEEF49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 14:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFpKKgJSe3LDnkGc1FYdedAaRZnlCAUJQ/ukxoYtD4Y=; b=B0LgMT2ytH088iU0ZdV0mJiuSu
	HL9TFC1E6BIjzFwKOv01mV+oQ6SeE1eAB4eDmoRM7l9Ch3Id2jnrlyYqkhIMreE+QopT+C6qrZaoy
	C4TAj33padGv6mv5aV4Uf/BHrF7ENqxBGDVkXVG/PwtTY2ymsMC+LZSqxa1yAS+D/4dUxIy9alVuM
	Tq2sxGuelhvknsPxwQiVJd8AjOYGJza88cnOUp83Zo5jAvYaMKpeMzBN4flYf2stleOaLR2DbWVw6
	AVqL3UYmWya4wIiU3v0EmE4YtIgSc8mQLQU15ynkQjDRG52arGzggaaV9rcMSl0xEp+gNEdGBQRFQ
	vmcnm4dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7oV-00000006ebL-2yZv;
	Tue, 07 Apr 2026 14:53:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA7oT-00000006eaS-07pW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 14:53:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A24D41A31C6;
	Tue,  7 Apr 2026 14:53:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74AD7603C7;
	Tue,  7 Apr 2026 14:53:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E190010450234;
	Tue,  7 Apr 2026 16:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775573631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dFpKKgJSe3LDnkGc1FYdedAaRZnlCAUJQ/ukxoYtD4Y=;
	b=jyg5zU1hYNkpXLJb6meqXDq8VXWt5eBi1yf3MaMX4NsBnSaVC/ZPYaTPMHOcbkpkgn7seX
	HdjHcw4PrpZ0PYHJ18lCo/NHNq/wkP2Ku+QULqsv8pSWhETT/KsLi7kQeTcjZWYThxn7Q4
	l7zHJtiDTJiJlC1CO/bQDYp8BnlXkGJuxUHCWCez3KNaNT6ICV89h3x6N65jZYF6dnuQhC
	xOEOeYuOK/aBMpBgzW0JucXrgPsddZzoiqseZiqilL5Fht5CfhYh8s8Bs8eo05cTOYj83O
	phfnzk8yElIsP6clYK1BZPlnI0lWTWcda3nfyaoQG1wnb5XiWHJf1bmTtOtIUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 16:53:40 +0200
Message-Id: <DHN0BGS5NT7V.364S1W551CQW6@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <hjc@rock-chips.com>, <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <wens@kernel.org>, <samuel@sholland.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v1 2/4] drm/bridge: dw-hdmi: Allow
 &dw_hdmi_plat_data.output_port = 0 without DRM_BRIDGE_ATTACH_NO_CONNECTOR
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <victor.liu@nxp.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <shengjiu.wang@nxp.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
X-Mailer: aerc 0.20.1
References: <20260403070032.447102-1-damon.ding@rock-chips.com>
 <20260403070032.447102-3-damon.ding@rock-chips.com>
In-Reply-To: <20260403070032.447102-3-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_075357_234114_290D358D 
X-CRM114-Status: GOOD (  19.60  )
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

Hello Damon,

On Fri Apr 3, 2026 at 9:00 AM CEST, Damon Ding wrote:
> In the previous commit, Luca split the dw-hdmi attach process into two
> cases:
>
>  A. hdmi->plat_data->output_port =3D 0:
>     the HDMI output (port@1) in device tree is not used
>
>  B. hdmi->plat_data->output_port =3D 1:
>     the HDMI output (port@1) is parsed to find the next bridge
>
> For Rockchip, many older platforms (RK3288, RK3399, etc.) only support
> case A by default. They can support DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
> after adapting to the bridge connector helper. Relax this constraint in
> preparation for Rockchip dw-hdmi bridge-connector adaptation.
>
> Link: https://lore.kernel.org/all/20260402-drm-lcdif-dbanc-v3-6-27cd247a0=
847@bootlin.com/
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index dd50dda3a4f5..20b2f9e145b0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2912,9 +2912,8 @@ static int dw_hdmi_bridge_attach(struct drm_bridge =
*bridge,
>  {
>  	struct dw_hdmi *hdmi =3D bridge->driver_private;
>
> -	/* DRM_BRIDGE_ATTACH_NO_CONNECTOR requires a remote-endpoint to the nex=
t bridge */
> -	if (WARN_ON((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_dat=
a->output_port))
> -		return -EINVAL;
> +	if ((flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) && !hdmi->plat_data->outpu=
t_port)
> +		return 0;
>
>  	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
>  		struct device_node *remote __free(device_node) =3D

My understanding is that a hdmi-connector node is required in DT when using
drm_bridge_connector and DRM_BRIDGE_ATTACH_NO_CONNECTOR. Among others, it
is necessary to expose the correct connector type instead of defaulting to
DRM_MODE_CONNECTOR_HDMIA.

@Dmitry, others, can you confirm or deny the above?

If I'm correct, then the right way to support
DRM_BRIDGE_ATTACH_NO_CONNECTOR here is adding an hdmi-connector node in DT,
perhaps reusing the device tree overlay I proposed in [0].

[0] https://lore.kernel.org/lkml/20260407-drm-lcdif-dbanc-v4-8-247a16e61ef9=
@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

