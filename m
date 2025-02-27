Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECFDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAw305aiv/DT04skCJaXpRu2GW4cm7RnvfNxS7iWIHk=; b=z7Nar3yUo9A9MEjljN6Yxnd5+J
	Bpe5bdyotXKFe4cv0A1sUszfV+Ojqcl1eE7FdlR4RE5QYgCxCnmN4gj1fphoKhhFOq3GHHUfK7+DI
	IH6Bs8UpMUnIlcfBCeL2gU7Aj6fbVwuS1gZ8tWs7iGcxuJbytt2mdXcAtezFmvdKUu3cNzir12qeh
	E1i+QQsCCasaAV/UNAAOOqtMWQ+qRJx9LcabT3CTCX5ejohO/5TnxWIl6fhco0TVu/IqiPcaGV9l5
	hJSKRJiuaUE87a6yVNWSJQ6P8hVPXKIFINfIfVDlW9OFHQnMpc06lxkxq89u+6zQ8Uv56A9KR/6vA
	WzxOSrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkLJ-00000008knB-1NEl;
	Thu, 27 Feb 2025 20:18:49 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkJl-00000008kVq-0WsF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:17:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnkJi-0004yh-Ub; Thu, 27 Feb 2025 21:17:10 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnkJh-003BEq-1W;
	Thu, 27 Feb 2025 21:17:09 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tnkJh-003Wgm-15;
	Thu, 27 Feb 2025 21:17:09 +0100
Date: Thu, 27 Feb 2025 21:17:09 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Steven Price <steven.price@arm.com>, imx@lists.linux.dev,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
Message-ID: <20250227201709.2diz57xv2tntw36q@pengutronix.de>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-9-marex@denx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_121713_163220_F583B364 
X-CRM114-Status: GOOD (  20.32  )
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

Hi Marek,

On 25-02-27, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 is the
> Mali G310, add support for this variant.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1 +
>  drivers/gpu/drm/panthor/panthor_gpu.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 06fe46e320738..2504a456d45c4 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>  ATTRIBUTE_GROUPS(panthor);
>  
>  static const struct of_device_id dt_match[] = {
> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
			  ^
			 nxp?

Can we switch to nxp instead?

Regards,
  Marco

>  	{ .compatible = "rockchip,rk3588-mali" },
>  	{ .compatible = "arm,mali-valhall-csf" },
>  	{}
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 0f07ef7d9aea7..2371ab8e50627 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -67,6 +67,7 @@ struct panthor_model {
>  }
>  
>  static const struct panthor_model gpu_models[] = {
> +	GPU_MODEL(g310, 0, 0),	/* NXP i.MX95 */
>  	GPU_MODEL(g610, 10, 7),
>  	{},
>  };
> -- 
> 2.47.2
> 
> 
> 

