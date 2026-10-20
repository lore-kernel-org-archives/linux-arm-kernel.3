Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06DD606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1O8eVxBs;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kMz/KM02
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdOLrX7Vbro6mz+D+OPkX1mbllMUobn9e9VhBO0BxN4=; b=1O8eVxBslJjEpjmF3agk3H8kLj
	3s15OvKpmhusBmIKKKra9Ee+RfeZhcQX40rQU1U4isUvKTpNrCwPKVCYwaklEV7j04N3SHTFotqoh
	mgtfCp3iKGFwYXZgZDqdRQYgzMnZyxsaERbexeMdBkHQckuy5ava1+M1/1xHDTyR7ozZ7G/D4to5j
	JN4I5rncwlPTW0q1vvBMmv1WKkLv+M8PEIyQVVYYRrLwyJ2wInUoYEhyaHtk2LugqyFI4KCgkxU7L
	VnhdWVtgTYdrWMQOEcvIz1Ik1DDIszq1wtP+Rwrtu6NWcWHLNl3nnRKnJZ9wrJiBBIAkJA9aiCyCJ
	bohyvVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD50-0000000AGO3-2axj;
	Tue, 20 Oct 2026 16:52:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD4y-0000000AGL1-0Mzi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:52:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8703D1A1298;
	Tue, 20 Oct 2026 16:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5874560393;
	Tue, 20 Oct 2026 16:52:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC61B10328E3D;
	Tue, 20 Oct 2026 18:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515160; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JdOLrX7Vbro6mz+D+OPkX1mbllMUobn9e9VhBO0BxN4=;
	b=kMz/KM02Vd6xGxFEu3+ivkFmGDhDhyr4J8jcMsEUOV4wnhKcAxqqVk/Lho8oTU1EDAdJWg
	eszwLV7OlmzXKBZzrnMZJtGzSeCn8gmzh/+/0detapC6r8I65jU4ueEdTRKOf+x2rICJfn
	Oe0kLjtROzseab7yR8o1Kc5PcmHIm7SjY8v8lKRMwTl0atRAaED35WEjR4xz8FeGj0/RVK
	5muG3mNeT7qgMqCuaBPbmWuRUm3EmHtxOmTSWK6ovNMbYTQYAUZMJE/PB20Rwyzh3eDyf9
	OsfB6sGh8fK2dy0YKFMc2uSy58liq/TlMyiiYKmU90YPnaNPzxN4GYg8EM13Hg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 06/14] drm/bridge: it6505: bail out of the IRQ
 handler when status reads fail
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
In-Reply-To: <2e003c2e6fdb56d03c3a6effdf090079afb2ffaf.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <2e003c2e6fdb56d03c3a6effdf090079afb2ffaf.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509977.78870.3399297204284524303.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095248_287153_5EF5D1E1 
X-CRM114-Status: GOOD (  18.28  )
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

Hello Daniel,

> When reading the interrupt status registers fails, the negative error
> codes end up in int_status[], where it6505_test_bit() sees almost all
> bits set: every interrupt sub-handler runs on garbage and the error
> values are even written back to the status registers. Return IRQ_NONE
> instead.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 6fd8f5ba9acc..f249520ebd41 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2714,6 +2714,11 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
>  	int_status[1] = it6505_read(it6505, INT_STATUS_02);
>  	int_status[2] = it6505_read(it6505, INT_STATUS_03);
>
> +	if (int_status[0] < 0 || int_status[1] < 0 || int_status[2] < 0) {
> +		pm_runtime_put_sync(dev);
> +		return IRQ_NONE;
> +	}

One first question it whether a read failure is realistic or not, and
whether you have experienced it on real hardware.

Theoretical or real, the issue is in the code, but I think a cleaner
solution exists.

Considering that:

 * it6505_read() does 2 things:
   1. check whether it6505->powered is true, else return error
   2. regmap_read()
 * it6505_int_threaded_handler() already checks for it6505->powered
   earlier, so it6505_read() is basically a regmap_read() wrapper
   cramming an error or a register value in the same return value

I would consider replacing all the 3 it6505_read() calls with a single
regmap_bulk_read(), making error management cleaner.

What do you think about this option?

Perhaps the three it6505_write() below could also become a bulk write.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


