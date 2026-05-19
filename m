Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74988CD4F58
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4mBD9lV6TrqbVsBKEhdINHs5dtc37/Ht1ZdIDWnpUs=; b=AYwBoqCa7x7PG5IwsvuDz5dSxp
	nh9Y5zEsSBnLr9mpCoivpY8qCl1rdYzkKzEYKp+XLQ+EbivLbP5aIxnZa5BZS04SCgkSlfAG5TmQb
	lV9loURRFXT8wkFlcOqgWIOE0ufu5FU071pcbmY/2wiP6xtH7c/FTt6JEZhtYwkf4d16uzZEtauTL
	YBbKUtv39cD9XgW8QbjCfsdRA7OMoRq5uHHCBx96XgOt3RotCgy/SNRXwssUF2Vi0hXDWawg2wwVY
	CClSeCnIDvf6nOci/zmsjrYnJdnXnsubhpC2RwqDL1g0Xal+d3aJUQfER+MRlolcfIyQ8EF+MRL31
	EH80xPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDtE-00000000K2j-35I8;
	Tue, 19 May 2026 06:25:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDtD-00000000K2F-0F1y;
	Tue, 19 May 2026 06:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 677F2601FD;
	Tue, 19 May 2026 06:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906AEC2BCF6;
	Tue, 19 May 2026 06:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171914;
	bh=MpgzPBqE/fWyBM0VdbQHNzKaNFoOyD/JuCeyGfbplSs=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=jo9E0rC68t/vIL+8vT1U3oPlIMgYNtoE9ZXok8N9x6ULV/N8mqfPdAyrI1tQRnzQ4
	 b6QTyyd+G3c/kCJsgwdMx3M3d8HKPSkkH8hmd8EVqnNoIm82itL7fLwFpAjTZs2NKI
	 oP6dVzJRWYA4pTC1US5z6FoZgtHmFCvoJcG1iQ9dFyImwn6Jsp547vwZEkqH+lOrUF
	 9YdQgczrAATdePQFoJZud3qudrVVW1A6x4Me4zNLcZscep3QjS9UFEjYDKuS/Yd16y
	 szYTcOAY6zjO62mRMRlVNgTxWvs5+GY6+blpY87MbZiB5sgBbeWR76O0RsXqC7klT+
	 lzTnBLfMrCnlg==
Message-ID: <cdd3d7ba-fa73-41d0-be1b-76f1fccad1dc@kernel.org>
Date: Tue, 19 May 2026 08:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 10/23] drm: bridge: dw_hdmi: Invalidate CEC phys addr
 from connector detect
To: Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-11-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-11-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 18/05/2026 20:01, Jonas Karlman wrote:
> Wait until the connector detect ops is called to invalidate CEC phys
> addr instead of doing it directly from the irq handler.
> 
> The CEC notifier is only registered for the dw-hdmi connector so this
> has no impact when the bridge connector is used.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: Update commit message
> v6: Collect t-b tag
> v5: No change
> v4: No change
> v3: No change
> v2: Collect r-b tag
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 5fd26ff8f55b..aae1b890167b 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2472,7 +2472,17 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
>  	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>  					     connector);
> -	return dw_hdmi_detect(hdmi);
> +	enum drm_connector_status status;
> +
> +	status = dw_hdmi_detect(hdmi);
> +
> +	if (status == connector_status_disconnected) {
> +		mutex_lock(&hdmi->cec_notifier_mutex);
> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +		mutex_unlock(&hdmi->cec_notifier_mutex);
> +	}
> +
> +	return status;
>  }
>  
>  static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> @@ -3106,12 +3116,6 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  				       phy_stat & HDMI_PHY_HPD,
>  				       phy_stat & HDMI_PHY_RX_SENSE);
>  
> -		if ((phy_stat & (HDMI_PHY_RX_SENSE | HDMI_PHY_HPD)) == 0) {
> -			mutex_lock(&hdmi->cec_notifier_mutex);
> -			cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> -			mutex_unlock(&hdmi->cec_notifier_mutex);
> -		}
> -
>  		if ((intr_stat & HDMI_IH_PHY_STAT0_HPD) &&
>  		    (phy_stat & HDMI_PHY_HPD))
>  			status = connector_status_connected;


