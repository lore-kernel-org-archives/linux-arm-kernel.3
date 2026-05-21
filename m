Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A44DCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 23:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0ebOmJn6u1MxYGewPLj3waI4xbAN7qaMrGtxlI3D9I=; b=VFUs27lWwRGCa9iZu6QOlZJipO
	1RbSXugiXdrnHCBknSOWBVZ7x90ZMuKQ4o0cGWZVl5o4Bb6qYn/PzH0PNl26jEWwneHuuCd6HwSR1
	uT+tme0h95YZsLrnJj660ss3xN3F8Za3CKiEyJ2VJrHuP6Yp6M13q9Amebyv1XFumyyVAuTtszKXX
	RqSBU3A3Y87Cgl0vnS6TxFPwE39qvN2YnbxqqhNQa+vP+HXvk5/GABdHLIKFpbe31SGX8xi+X4ON0
	rtMz6Vd7jrITQRf6tq8jT8ZgH26/UCGsj1dI9HRaRmCj1RIXZoHyOsVC9v4CKexhjAJstrqJnwlHm
	6dL6emPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCdp-00000009IYc-3mjJ;
	Thu, 21 May 2026 23:17:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCdo-00000009IYD-0Ny2;
	Thu, 21 May 2026 23:17:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09639600FF;
	Thu, 21 May 2026 23:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE661F000E9;
	Thu, 21 May 2026 23:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779405442;
	bh=j0ebOmJn6u1MxYGewPLj3waI4xbAN7qaMrGtxlI3D9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RqthTvJfQ1ACcaGzGV9ao9TFO/VRou8BJSP4JXt5IuYUBfih0U8dNTpXsMpDFcQWN
	 O2dNS6Ivf7Q6wszwppAtNLAsmvvOQy/Worly6dF6ld38KOYeFxSzvTW+1hkmlLtpoo
	 fU4+SrUi280Gm73Wh3vlxI9wiQ6JHfSQYVw3f3dNeMF1f6gjPHmDL6yLilvfc1Y5HP
	 lP56Q6RZIZq1EsXOT8HpJK4l3bGpmzExwWA3iwU5Ob8/A9YBMujzk1TMfpInqOYc2Z
	 H6AI0Z4Ou+98aTsTYrHKIN56xvdcobEUMajumYS/CzrlB/Y9yZGZ5N2cslRACkzBLz
	 94wZdfkD3uqqA==
Date: Thu, 21 May 2026 18:17:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>, 
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 5/6] soc: qcom: pmic-glink-altmode: pass down
 HPD_IRQ events
Message-ID: <ag-SWn5FgRLBqUTR@baldur>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-hpd-irq-events-v3-5-086857017f16@oss.qualcomm.com>
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

On Wed, May 13, 2026 at 09:23:25PM +0300, Dmitry Baryshkov wrote:
> Pass IRQ_HPD events to the HPD bridge, letting those to be delivered to
> the DisplayPort driver.
> 

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 619bad2c27ee..946eb20b8f83 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -373,7 +373,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
>  		else
>  			conn_status = connector_status_disconnected;
>  
> -		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
> +		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
> +						conn_status,
> +						alt_port->hpd_irq ?
> +						DRM_CONNECTOR_DP_IRQ_HPD :
> +						DRM_CONNECTOR_NO_EXTRA_STATUS);
>  	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
>  		if (alt_port->svid == USB_TYPEC_TBT_SID)
>  			pmic_glink_altmode_enable_tbt(altmode, alt_port);
> 
> -- 
> 2.47.3
> 

