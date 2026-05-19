Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E10CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFHqRuATmPbaGVZexZcisMNqWxtDcoKZS/vBDt5crY0=; b=FTOwmIpdar67a0UjfRi3WcHsca
	vC3hsng0lgcpnQZs2UQByI0ZThrR7W0gQ5iLnmzvAZLT7ghEomcJ2XhhSwyKNYHKe4VVjELUCfHbG
	buI24ZomGvMBg5eJB1yW1J6sP9+SGlwtL/wJsryqngcZgvztZF2sJD5n7WF8QqSbuQERPBJ7LBimb
	nr+45bwivMEJGZZ4lO8fFeBtAWsMCFvOmvT8/we5yA8G9LhTiBweorftcL/ECArr9Zyjew209XmZp
	SXbk0wCDUmVAAaZ3JwAOIy9G66gIxV8saJMfFTuYSn8V7irOEQsYPGVdgm9cAHfFDDLTan74d2lA3
	OOXvTGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPE3A-00000000MKP-1gVV;
	Tue, 19 May 2026 06:35:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPE39-00000000MK7-02yo;
	Tue, 19 May 2026 06:35:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D7D3860052;
	Tue, 19 May 2026 06:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A48AC2BCB3;
	Tue, 19 May 2026 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779172529;
	bh=PRsYzknanFyATavLtM7cL+hf9VvsO0oo90C5CxicR8E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=PSNqpumrg6dYiiQYEmynbnixtWYpoeBtue8tnZKdS6qB5He5qHUutjvNLBuZJScPT
	 K1YQ6nDd+8DbQDcjZkfN4hcr0VnYElD8W+jpwAAXcG0RwxKfNeQvvMnaIPSnUVhSwM
	 5/bk/7/DgiM4Jd3kWs15hlvvWuqabW69r7hRymqbQADCeyh7gL7iR/AZMyAY3VTX/D
	 +N71z7FTLu2IomD1junPsiCBeG3ZPXQPRquV9lBmerq7Hu9oDE8jvPnZpGKo8clMuI
	 lFzu529xv3zIDVyPSljZHahvq+sjcZTRc3jX4vwXpu1Y7U36tNXlNbJxRVSp1es5ZN
	 R31nkIMZqs4Ow==
Message-ID: <3672b556-e66d-471d-90f9-ef1078527929@kernel.org>
Date: Tue, 19 May 2026 08:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 17/23] drm: bridge: dw_hdmi: Declare bridge CEC
 notifier support
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
 <20260518180206.2480119-18-jonas@kwiboo.se>
Content-Language: en-US, nl
In-Reply-To: <20260518180206.2480119-18-jonas@kwiboo.se>
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
> EDID and CEC phys addr is now being updated in bridge detect() func,
> making it possible to have CEC notifier support using the bridge
> connector.
> 
> Add the CEC notifier bridge op to instruct the bridge connector to make
> use of the generic CEC notifier helpers.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
> v7: Only declare CEC notifier support when CEC device register succeeds
> v6: New patch
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 0c4388e7aa5e..5dacb8a99715 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3515,6 +3515,10 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  		pdevinfo.dma_mask = 0;
>  
>  		hdmi->cec = platform_device_register_full(&pdevinfo);
> +		if (!IS_ERR(hdmi->cec)) {
> +			hdmi->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER;
> +			hdmi->bridge.hdmi_cec_dev = hdmi->dev;
> +		}
>  	}
>  
>  	drm_bridge_add(&hdmi->bridge);


