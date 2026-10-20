Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CBD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3wU13OdN;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BH61s1Gl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XcyUJtIkiO9vvPz7IKkbuTRkju9mP6Fus4ZIhOD+q4=; b=3wU13OdNpL1FN8Vy8CPNx4aAOJ
	Y+b/bQoFHXDy82UKWyjwdl9rULCdDhedJQsM7/CoNiBRBEwceXe9jWtHPGpfnmxrj4F36o3c0SA+R
	P/vJe7oCtS6U3+2csgI5i1fALuzlUK0pZNZv5/b7PGTiUYfZleogTa4+ffX7Yy/G7C3eVgg8I2p7j
	mZ/SlrAQVYPbbz1HlyTwsQBFxvZLdK5vAIh9FQTYzwe0V8o6AaDsE7LJ0iLQg0jFa1kpSdh4oeh1Y
	dS0QXdQUnpwH2S7kHVgw97Zxs6aEYm9tPNafFZB4I/DwTY4Pmfr4iiccuRLj1shRLK68zq1y7C30B
	+80hX6rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD55-0000000AGT2-3Oci;
	Tue, 20 Oct 2026 16:52:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJD53-0000000AGPe-0xnX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:52:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A73BB4E41295;
	Tue, 20 Oct 2026 16:52:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7580B60393;
	Tue, 20 Oct 2026 16:52:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4571010328DD2;
	Tue, 20 Oct 2026 18:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792515169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6XcyUJtIkiO9vvPz7IKkbuTRkju9mP6Fus4ZIhOD+q4=;
	b=BH61s1Glkuc4IxXGejfE6yKzOVXmvtqYAN418w+0wiTjCfAgCoLPyXHjEB3XKx+HNVboKs
	Lql+vfMdKlrL5nJFY8D/KMkV2C8b8UePQAagBAp2uQrZT6smuK0kG0GDcKseWtpMOuoCPU
	RbbLsipSRVXHkIs4d6Ao/o7GEpOxJcANWzb6C6HtNAxEb3Dbkm7IxbNsDs6uiTtEr7/sDD
	/QMO9thr39SGBEJujl4rV+038KKA/68H/1aLze6C4RshH52vFQF5MzsbbOtOIpUsUHhFcI
	472tEUA2/BCueBZEbchM9vtGq5wq/UyMSLkjY6VDzxGCNql0f1S3/9eXog89Kg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 07/14] drm/bridge: it6505: avoid division by zero in
 pixel clock calculation
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
In-Reply-To: <4316fa443587b7778d4f135d8656511a11233d87.1790552614.git.daniel@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <4316fa443587b7778d4f135d8656511a11233d87.1790552614.git.daniel@makrotopia.org>
Date: Tue, 20 Oct 2026 18:51:39 +0200
Message-Id: <179251509978.78870.5665512963665107929.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_095253_431767_FA558BB1 
X-CRM114-Status: UNSURE (   7.12  )
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

On Mon, 28 Sep 2026 00:50:25 +0100, Daniel Golle <daniel@makrotopia.org> wrote:
> it6505_calc_video_info() checks the sum of the three pixel clock
> counter samples for zero before dividing it by 3, so sums of 1 or 2
> truncate to 0 and the following pixel clock calculation divides by
> zero. Divide first and check the result.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


