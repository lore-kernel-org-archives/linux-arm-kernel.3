Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E49CCA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8e7TUX7IG4O+szpBmaWnlqJMsPjMzhApAmHkWPg+PA=; b=NyHrrAkrGlrzaOkx3PVJylnWJM
	RdOF1e5DbO+fd0wSQ34b5VoHVRzJwIxqzJxTux64Mr1TKf7VA00O/JJ7hkck/EJHuTr/bVRHFg/tX
	mMMdfwqWQhM0G/95bpVHvSDZS0/mm2jJMzSdMrlsJ72WD6gEOLK4JfljQiO0ybolO0o8uWGbfxugI
	cMeXztxso828jTM+OLRJ7sLg9vws1O1MyvkYOJl2R4+CsCnyTbmfWaYieTnbbwicokr5aiFzMHk8Q
	rhIhxzZPttB5zD7mBOSdoR+NB4EkGg/VgUODiAmh8tYGh1mXpAg0YzDF7MuRfPVFKBVLCt6BVFJj9
	nj4e8nEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJhV-00000009ihW-2rqY;
	Thu, 01 Oct 2026 16:32:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJh4-00000009iaY-3ZM5;
	Thu, 01 Oct 2026 16:31:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 07D234E42094;
	Thu,  1 Oct 2026 16:31:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCC8960343;
	Thu,  1 Oct 2026 16:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D6BE3103282E5;
	Thu,  1 Oct 2026 18:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790872294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=s8e7TUX7IG4O+szpBmaWnlqJMsPjMzhApAmHkWPg+PA=;
	b=WmZEvWTgoyKaH9eLLiGFXxWcDUU0dRmzLAsatremk9U+apJk/cTbE1sE4O2BoZSUKoGqn/
	T6m6tLTnTYwvNgyHE3fJflIwRleuWUiGHM93OrdnncLS7iCcceIDXQyE+2qScx/2vahm/Y
	NofBYIRFEcLhJS9u9XHCF8kZepjh1fok7dKmedCoE/3CodLERISCHKfYSWaQlBQZkp8E/t
	HnwnjfoAFPLQWBG+4qpS6/nx3ElUZMD1Wcb/6CstoethefYeFtjKm+hOZObzIn07OlYTyY
	X0oQrSBreykAJ06OrGaZ5kSfQiMfF8XEVB80tgJ8mRrOV6WYz7jcAFLpIy31bw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 18:31:24 +0200
Message-Id: <DLTN8PZ4UZED.27LK4TI5T5GXA@bootlin.com>
Subject: Re: [PATCH 1/2] drm/rockchip: rk3066_hdmi: Convert to
 devm_drm_bridge_alloc() API
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Sandy Huang"
 <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Andy Yan" <andy.yan@rock-chips.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
 <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
In-Reply-To: <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_093142_625014_F1A804AC 
X-CRM114-Status: UNSURE (   6.95  )
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

On Thu Oct 1, 2026 at 10:25 AM CEST, Cristian Ciocaltea wrote:
> Bridge drivers are expected to use devm_drm_bridge_alloc() instead of
> devm_kzalloc() for allocating and partially initializing a private
> driver struct embedding a struct drm_bridge.
>
> Perform the API conversion and drop the now redundant manual
> initialization of the drm_bridge funcs pointer, following the pattern
> established by commit 9c399719cfb9 ("drm: convert many bridge drivers
> from devm_kzalloc() to devm_drm_bridge_alloc() API").
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

