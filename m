Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F311D5C0E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 15:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+364whBo894sDaHVPzMASpKtlz59oEjI004Zvg/C+50=; b=QRpy0bP2rfsgDRXdILAIxYFAlK
	yctcZoYqCJ0KJxp3IeiF3w0ATJVHuT698s3raq4o1vL+PHm+BNuXRJQB28miWhbmOOUHxg5esWh07
	Hy+08iqaUCj2NjdJnItI0oNCTJcw0tLMWfUMXPXzFTLafQMWQ+3nQINboVfxoB6eMmKbJHQaj6w6/
	lFRKxZloyR6jZnQ4bmaFEe19cCjonOgGPJBmM/XRbCtowsncgNJ6wKvGd4yyK8FX8udVTUzPT2XC6
	nC3uuCIkw14qduiWaBj99MzKL4XbP8cSi8Pq/0DyqHIKr+4OsddsIe+e230wlhJ3MM/pQkOkMoi6n
	UfTKZ7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QjI-0000000B02s-2WWU;
	Fri, 08 Nov 2024 15:16:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pvo-0000000AqLB-2YIC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 14:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A9F75C5BEE;
	Fri,  8 Nov 2024 14:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50A4C4CECD;
	Fri,  8 Nov 2024 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731075947;
	bh=kdDEJrQtUo9c/wbCOUyoETQ4cdcbxfzJWY3L1MDsYT8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=S95ecE1/5KUJlp1FAkDoMUxLDz1JyeQNjTNmZjJcbuDcL4yCxI0mljk10Ka49jiX/
	 aUZ6CAK3MjT+VZ57N/1PoD3WuOMKO5DUMUdPyQh0kmKQbrK5s3Y+/ajPDJepFq9mxS
	 L/ATMvmniafRUJGxviLLfTL2DnzCPa8gmkjxnR3HdemmMr1CdEPsAGP5FERL1TfIfA
	 k7SW+bNuASnRqooFFvqpzu5zseBbePUBUV9twIHxDRhInxXPblGUGbrw56rmpjGcKz
	 Va2pBWFCIoRIf2rCsoUM+t3krP08x8FND5HKF58JyW3QXbITRPHVPwkOalRSk6s1uT
	 SkoAf72GhqXjA==
Message-ID: <80b6fd96bdfb085271128f5bb3b5f515@kernel.org>
Date: Fri, 08 Nov 2024 14:25:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/6] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
In-Reply-To: <20241101-hdmi-mode-valid-v2-4-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-4-a6478fd20fa6@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_062548_742191_C2A28041 
X-CRM114-Status: UNSURE (   7.41  )
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

On Fri, 1 Nov 2024 02:25:07 +0200, Dmitry Baryshkov wrote:
> Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
> bridge in the bridge chain. This removes the need to perform TMDS char
> rate check manually in the bridge driver.
> 
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

