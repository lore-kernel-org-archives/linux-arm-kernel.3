Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBD5606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KAfjaw6X;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dYVwCpdy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLdXsNmeIbjCOijJh4ieF8NftgaQHDTYB8E1f/WmycQ=; b=KAfjaw6XPCroHpceq2p1ANRiny
	WWPdkWbJ/5LVD99vT6ZHJcXzW1pe2w/YqRSnX7FNTLWqbYDtg8qOn55cJSPkYPJOrcxGhESb3VlTk
	Yyz3tOwCNRTR17Gp9fPF6LTDL3tgGGXv8aDnLsmw3+VqlIF1mDizrtxghD+naB2pfyg38kji6WRCG
	Ts1F632iUXqO04G5I5M9oaSQiH+FWbRQe9y+zXTMsBnrojgHyMvo/Pt9Key/Wsrv/tUDKRHFxG3Q4
	h3pKOQiYkwT+ccjaBuCKWu47yKqYsioGxvWbI8PYJOW+sgRQJG4C02VCk6iOI3v0gA5mfJtinMHe/
	C4xqmwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD5B-0000000AGZ4-2ccR;
	Tue, 20 Oct 2026 16:53:01 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD58-0000000AGV6-2pEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:53:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2517D4E41292;
	Tue, 20 Oct 2026 16:52:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7CE960393;
	Tue, 20 Oct 2026 16:52:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6FCF103289A8;
	Tue, 20 Oct 2026 18:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GLdXsNmeIbjCOijJh4ieF8NftgaQHDTYB8E1f/WmycQ=;
	b=dYVwCpdyD92wQz+JCeRfjuWXiDzWAHklB7DPGH8oFtwSYyloIH2w2wCvYj+YC2KtWJhezG
	mRYa6hyJ3gvlC5ZAlc8FZBU3meamkg06H4WIzPEFbMhFaBSGqKZy2SqjuhXcVqC2UkCP1D
	vo0vR1Z1Z15OLOntYCooWWpaXnPLVXI6zav//wE3J1OckY00w2ioPDFernM6nveeNSQWnT
	07LoPl4YrxXleLL4QVudzZae3uYVHUfOzitFpeRtQ3gNOA4tyJk0s/LRGPeh+9PIciU9U7
	Cn077/qne5F3Afqm0uLrtuOB6JhtAfbntUSHQ9Fcb0jNVvrRTpIS4qlII+4yEQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hermes Wu <hermes.wu@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>, 
 Pin-yen Lin <treapking@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509978.78870.2485132679226608837.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095258_888409_6BBB752D 
X-CRM114-Status: GOOD (  17.51  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> REG_AUDIO_INPUT_FREQ reads back 0 when no audio clock has been
> latched, and it6505_read() returns a negative errno on i2c failure.
> The debug print divides by the readback, and its arguments are
> evaluated even with debug output disabled. Only print when the value
> is usable as a divisor.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index cf2cd59625d5..0d2101432416 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1623,8 +1623,11 @@ static void it6505_enable_audio(struct it6505 *it6505)
>  	it6505_set_bits(it6505, REG_AUDIO_SRC_CTRL, AUDIO_FIFO_RESET, 0x00);
>  	it6505_set_bits(it6505, REG_RESET_CTRL, AUDIO_RESET, 0x00);
>  	regbe = it6505_read(it6505, REG_AUDIO_INPUT_FREQ);
> -	DRM_DEV_DEBUG_DRIVER(dev, "regbe:0x%02x audio input fs: %d.%d kHz",
> -			     regbe, 6750 / regbe, (6750 % regbe) * 10 / regbe);
> +	if (regbe > 0)
> +		DRM_DEV_DEBUG_DRIVER(dev,
> +				     "regbe:0x%02x audio input fs: %d.%d kHz",
> +				     regbe, 6750 / regbe,
> +				     (6750 % regbe) * 10 / regbe);
>  	it6505_set_bits(it6505, REG_DATA_MUTE_CTRL, EN_AUD_MUTE, 0x00);
>  }
>

By just looking at your patch and the current driver code I'm failing to
understand what's going on with the REG_AUDIO_INPUT_FREQ register:

 * it is read, but never written
 * its value is used by:
   - it6505_enable_audio() only for logging: is that logging really useful?
   - it6505_audio_input(), just checking whether it is 0xFF or not; what's
     that 0xFF? Is it documented? A macro hinting at what 0xFF means would
     be better than just '0xFF'

If you could share what that register is for, it would probably answer some
of those questions.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


