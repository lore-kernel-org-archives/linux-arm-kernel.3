Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA8B606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D1h2mvbO;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0pt+d0KO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVEh3gnmjMCOZtG0jYsrPGvjcEg6BmmePivPcjrSTKM=; b=D1h2mvbOgVDxaCm+aey0FfW/pg
	SdpU9EurpXnzvga3ISCUtHDrpFMl7gr/u9LFUubpIvEbWXMU7AoZD3TEWn2MZ/r0n8/+TgSR8NimH
	0VZCidMXQWjDyFp2d1bnwzZZGg20VQtUcx/9t5znCVCl7xpKO5jxJzzqXVfILW/wxkV7FRxxIAq55
	jqZ43H1QyKP+wh9A1JqtD3ZyQZaXzkFrur45upqwZFAqZVl0aKq/l85m2pmU+my+y1BxCQp6txHLo
	wSg/VTGenKZGMX8MZRBRQO4hHpN7/o29Cb0ury1W+7dvRaSnu4uIbCbYOYjJI1As6pbaV4a0GU5+r
	TU+HjT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD4b-0000000AG2F-1Bwz;
	Tue, 20 Oct 2026 16:52:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD4Y-0000000AFyu-3i7j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:52:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7020BC62200;
	Tue, 20 Oct 2026 16:53:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D80DA60393;
	Tue, 20 Oct 2026 16:52:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA8B810328DD0;
	Tue, 20 Oct 2026 18:52:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LVEh3gnmjMCOZtG0jYsrPGvjcEg6BmmePivPcjrSTKM=;
	b=0pt+d0KOP7v+af1AEM+4HLq1rwl5H8zrXsX3C221TSUBZciN7OSEJtlTHx0NC44oclS8C9
	OIjLwvgNDBfHJ79OD8MIxuOx7LiIrpqBnXhvlMnHYKYyIVc5Sc2T5hKwHIYD23yppahRbq
	r0thPNaygG3A3fY6D4sIzCDAOm4dBsAslYoBjwPcvanvuimzWtugNinjpbtnqIxk1xL2aQ
	KFr0sHQcSPRzY6DPzs4Kv01Kj1pQIMnXbvrgGkCvOXcOjaJJas6c82uY4Ak+Ri5bGN05n6
	mrmyj5kFnZbcX0Ow+HioAHdQYQ6N9NV9hay89858T8ds5nYpdIZ3W+7ESCrkgg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 03/14] drm/bridge: it6505: balance and disable
 runtime PM on remove
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
In-Reply-To: <aa94f192ee4ac67bc51d0809fdd4a0e675050fef.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <aa94f192ee4ac67bc51d0809fdd4a0e675050fef.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509976.78870.15886930993907247858.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095223_096674_9CDC49E9 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 28 Sep 2026 00:49:56 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> Runtime PM is enabled in probe but never disabled on remove, so
> rebinding the driver warns "Unbalanced pm_runtime_enable!". The
> extcon work also holds a usage reference while a display is
> connected, which unbinding leaks; the count survives in struct
> device, so after a rebind the device never runtime-suspends again.
> 
> Drop the usage reference held for a connected display and disable
> runtime PM in remove().
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


