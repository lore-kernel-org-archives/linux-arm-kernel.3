Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C287FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFYFj3cS+32kdh6iscyaRgMTftC7LDL3TybYyPKLyps=; b=m/B6D1b1bY43KVwvGAkWsu5eqE
	5AKhFu+uUlhyr4BmVt1obTdCHLwL+yPB0roxKk525MfgBgwj9ziKNdyTsUpYdUGRKVdn3g6Wcx+d1
	YnltpjnoS3A7lnWCltppAbEa5qiui5J2YEcAmfdAM/KFC+RNwymNMMj3AaNkBk52Trof9pgDTozw9
	KjK/FNaI0UIvcmiSXJ3pFksi7mXIeCBm7wl2gZXrL13y/8jWLf3V2XNQ8/ivMB9eW8hKf7/vJuiZj
	U356tIxa3JOmmJ7jcGLwEmTwHGmuXDcYuOlA5Sa+GK4CM07yEGEKjUnLs8hs9WE2rGd1hsAC4ju8Y
	c6eqnlWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqNm-0000000CuUJ-3S0g;
	Mon, 04 May 2026 10:18:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqNi-0000000CuTO-2A7t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:18:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 551691A350E;
	Mon,  4 May 2026 10:18:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FC045FD5F;
	Mon,  4 May 2026 10:18:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31A7411AD2634;
	Mon,  4 May 2026 12:18:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777889904; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FFYFj3cS+32kdh6iscyaRgMTftC7LDL3TybYyPKLyps=;
	b=y5KVyl5r8t6lQy6MGnFNSqdNvb33m+EsSq4JviTs2xwRoNPAVk4ekBn7oKPxJWKULiqpTj
	EH2ZjuYHrymSLkS3r7SbLO1qEuY8OLmu2FN8lBdw7f3SKarq9Nxrw79CgveyVwdHmXB1NQ
	xyUSOcp5W7WB9jMWjzEBq4mUSCOsW/q7aOnAkR4kTPwQOu/q7qdN4jdV0ntnXbsgJjnK/8
	rWMLC7NBOIy/HT9Wzm/R0LMDZQGT7L8TcDKTkZt322CrhmeJUOsTAjsv8tMiFhjpBB459B
	wPPKmEQhluoKhKXDBjdgnC/d8UXpEZwVLtFxnGCl6Z4UQgVppMN0QOyAHHL4jA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Damon Ding <damon.ding@rock-chips.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260429140024.192432-1-arnd@kernel.org>
References: <20260429140024.192432-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/ipv3: add CONFIG_OF dependency for
 DRM_OF_DISPLAY_MODE_BRIDGE
Message-Id: <177788989685.160168.8237474738653611517.b4-ty@b4>
Date: Mon, 04 May 2026 12:18:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_031831_082757_B8704E9F 
X-CRM114-Status: UNSURE (   5.96  )
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


On Wed, 29 Apr 2026 16:00:11 +0200, Arnd Bergmann wrote:
> Without this, not all dependencies are met here.
> 
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]
>   - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]
> 
> [...]

Applied, thanks!

[1/1] drm/ipv3: add CONFIG_OF dependency for DRM_OF_DISPLAY_MODE_BRIDGE
      commit: 528578941a240e0916942bbb5b910c57bbfb3614

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


