Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40677CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZpvAdTidzv5frFA2Fh59VQYe4hvOqmAQpFG53pkriM=; b=j+7m0C+9vDBuBSGUkejUZQWLCX
	QPAp+2WKw2n9n786EazbAdEpKwUq2NK1GC2Dhgr+TZYHiqy3vwYiz9YGSQZvOFAmtMQcyfuN8J0/J
	al9orlEtataRWIOQEWfxixnPU6NFs4x/sB/3v/t7tDvZBZwgYOQJ+ta3UfRBJLqwVUYLuCpY/Mq76
	3innTYWmW/FVPD7PfuU6KHD6MGzMtrEJr4wRRlxHzkH5q/0KBI8OBpA1nMlIq4rQDinnnw3/E8sCr
	pO4Q0lfdZu9Ha1c0K3ctcsAIhv0cNC+s05WSadyibtWX1OvNa4QvLgbGl4mI8WhqV64TfZMBnyAgd
	OvhOGZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIJw-00000001GSJ-3bX4;
	Tue, 19 May 2026 11:09:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIJs-00000001GQk-3XcT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:09:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22CC91A3629;
	Tue, 19 May 2026 11:09:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D99A0606E9;
	Tue, 19 May 2026 11:09:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 115D5107E8B31;
	Tue, 19 May 2026 13:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779188939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rZpvAdTidzv5frFA2Fh59VQYe4hvOqmAQpFG53pkriM=;
	b=lPPJ03+beU7EqTBcCvAJlMCYn4/SnelIvqTJz0zwMbjb08bZHBlSuK8JTIQ4+0DVnfCr46
	yvyCl6mMLegw+jVfHXVbvNa7IiW1FgaGBLE6+7zJBeOKrD8zGLYlVYy7AkT6JFsJApPs0K
	9+v70l4hOu8w7CIXxQAVLnQ5+UfxFJ1bk9goDmnsWq9qc5fPFXtpkC8eW+6ODZzAcp5ns5
	7ya1T7M3Ozz4N7mOGMzhYeQY5GBha93i11thrrL6mpl2VY23vJON/iwSxeqjperT0VmeCM
	i8QrljjzudkimZwllny+bcsjBmbZZpiea83vxwFXZHwRP4smcr6j/dExBvVBig==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 05/12] drm/bridge: synopsys: dw-dp: Add follow-up
 bridge support
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-5-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
 <20260501-synopsys-dw-dp-improvements-v2-5-d7e7f6bac77f@collabora.com>
Date: Tue, 19 May 2026 13:08:43 +0200
Message-Id: <177918892313.537125.10814687633426590148.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_040905_297813_76938224 
X-CRM114-Status: GOOD (  11.57  )
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

On Fri, 01 May 2026 00:20:32 +0200, Sebastian Reichel <sebastian.reichel@collabora.com> wrote:

Hello Sebastian,

>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> index fc4ddb7792d7..ccc55e40e81c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -2064,6 +2064,20 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
>  		goto unregister_aux;
>  	}
>  
> +	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);

devm_drm_of_get_bridge() looks for either a panel or a bridge. Is it
possible to have a panel connected here?

If it isn't, then using of_drm_get_bridge_by_endpoint() which has just been
merged [0] would be much simpler and cleaner.

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/03d1078112fddd706b2c1e4a7d98cf18700eb5df

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


