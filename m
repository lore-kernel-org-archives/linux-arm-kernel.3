Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9805ACDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPDkO1NcxOi2yneUaOfec5RhTuU+EenKgtvTV73EXfw=; b=ZdAjQz/tImNxcGVq123SUW8ZVJ
	i/FmznCb174UDK6RY6BWouwD7Lv1H/Es7Ebj/p7FMeODc541SCLpGBrm4ak0dymr8Jcc23lYHKp/4
	qcXysv2i5ZCHQlMQ3UbWi0urGIHcQ6x/luprRFWEDgCnjfxX8oSpPWT7jyr0P9Tdt3NVQaV/qGMFK
	jdE8cnYa/ikVEvRNQY+apeIH+djgV1Et5JbzP95ithRUK2GB3VWmco83/obSNZqQ43JZ/ER+E/ROQ
	FSLdJU2BIHE3BmupC6N5/ConyQyH+eV+No1T/mw1i2tOwARePUT8AHefR3+CnWx4f2UCemnAJTe0C
	CfE6CeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOI5-00000007tB0-2Q34;
	Wed, 24 Jun 2026 14:09:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOHy-00000007t8Y-2eVK;
	Wed, 24 Jun 2026 14:09:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EF4811A0909;
	Wed, 24 Jun 2026 14:09:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B64C2601C5;
	Wed, 24 Jun 2026 14:09:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C245A106C8468;
	Wed, 24 Jun 2026 16:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782310149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mPDkO1NcxOi2yneUaOfec5RhTuU+EenKgtvTV73EXfw=;
	b=vwIo7hMxQ71YV730wXNBAMmgVvFBgSTcr6/Zj0mghHoUun1/MrbC1Ii2cSPFVaiO1UJp2F
	JX/9ZkPu8w8O9OudojoBK11jXwpQAkZs+T0Vlt7+9N7KQGroKaYyRwMVYrRuKEiiN6L01C
	xZbzTTUIQ2jZulFVdYdDt6thOwokeXvV0ydZBq4Ay/gGycxQh5EbqE/KXmL7yWlCodbUmZ
	V7pFcyQd2Dc10/bWsO67rhf3Rynw+EUL5AWglSohvVU8//VzxoVyb0+tcjZTz5SDOg3o/J
	FaiYlZg4Q3kvTUkAuXzIlrnFkUAUVDkpCz/q5/slwpa3XoMEHo9c1cJEgBhk0A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
References: <20260602-dw-hdmi-qp-scramb-v7-0-445eb54ee1ed@collabora.com>
Subject: Re: (subset) [PATCH v7 00/30] Add HDMI 2.0 support to DW HDMI QP
 TX
Message-Id: <178231013719.859921.5124678664798209095.b4-ty@b4>
Date: Wed, 24 Jun 2026 16:08:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_070914_814633_D7118550 
X-CRM114-Status: UNSURE (   7.78  )
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


On Tue, 02 Jun 2026 01:44:00 +0300, Cristian Ciocaltea wrote:
> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) on the Synopsys DW HDMI QP
> TX controller, as found in Rockchip RK3576 & RK3588 SoCs, by adding SCDC
> management for high TMDS clock ratio and scrambling.
> 
> Since SCDC state is lost on sink disconnects, the bridge driver needs to
> trigger a CRTC reset during connector detection.  To support this, the
> series introduces the connector and bridge scrambling infrastructure
> (patches 1-8), wires it up through the bridge connector layer with an
> atomic-aware detect_ctx hook (patches 9-11), then implements the SCDC
> scrambling feature in the DW HDMI QP bridge driver (patches 12-15).
> 
> [...]

Applied, thanks!

[01/30] drm/fb-helper: Remove unused local variable in hotplug_event()
        commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



