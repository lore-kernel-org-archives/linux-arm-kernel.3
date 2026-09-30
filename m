Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C23CCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijJfwiKLlTSy9rxP4IMNmmV3iD9aU2IeJcZz/YO1yr0=; b=ZsCWR3d44D9U1qK46NpNqvvAEZ
	3JZ2tnRpI7Irr2tJ3mAIGXx/nfSo1SNxp8gxVPGU47LQGlPZX8kyPAsFDOB7yA2gMB9Ap+Th5kq6B
	tfkA5YmH2h1LhFa4tJqB7rKAAtXPUmsjyFtlFwZajU+nPEYpK8zFH7s4PJTqumhE4a1jIFyKD09Ef
	EJHWb9SlKrb9CPMOOcMuXONr2uAH1ZnzTH0q2wHZih5LjRRgNkaNghP3sVYpwT09IymoXw1SAYsI7
	flsPEplgx4UvrWaRwdYAKYGZnfW9MSR+5KnR6JvUO/szJOBAo4hRqIQ02oqdDsvJx+BkBs5Vbj5YN
	YANzBTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs6C-00000005ovB-00vV;
	Wed, 30 Sep 2026 11:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBs6A-00000005oue-2QiY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 11:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ijJfwiKLlTSy9rxP4IMNmmV3iD9aU2IeJcZz/YO1yr0=; b=P1a637SsAXEsW87SYcofa72ujk
	+DJut9T4PWOJ4SzCQyEEPUj/UjFtnb5pq/GAH934E8J6s8JO08P1qQBo2YIFoBPqN8cE6Y6g0e5rG
	3vBgZRJgINeAgakzMoPsbd31kunjHYJ6c6OLKVEshYz/U03B+RxXMILmqRipc5R2m3IvimJp+trUE
	O137ic4iwAbllI+aLGZ4yv6J3+dXFGAUQClJVOFAplSjrgqIyf4chqTSRryxG8VG8CqaEslnzike6
	C7VumVLYEaBde/Wa4AjCBbvrAZX+5eV127zRCisv0Y2vdgqFhcby16gD9fj0q4P6QwdDWYqhk/T5g
	3i1JmgFQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBs67-00000003h52-1B3I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:03:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3F0B91A107A;
	Wed, 30 Sep 2026 11:03:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09A8C60749;
	Wed, 30 Sep 2026 11:03:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8F3810328F7B;
	Wed, 30 Sep 2026 13:03:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790766213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ijJfwiKLlTSy9rxP4IMNmmV3iD9aU2IeJcZz/YO1yr0=;
	b=pr6gP+dMr69oYimKPOIdbp5KMj8d5ltUTNrztyVmewFeK+Il/fJwZkQVcY1nvsumKPbiFp
	H+ixPwd120YzUC2kNP+ksnghILPnhKRL92J8mbAFq2TrnUc3B16wIb7KsEtjPtsVQxw8Q9
	4/upitHqXbTfcvdntbX4OARxD27oUI9GIPuzJtCGPaoTj+zXGWoJdplv5vS9pAsh6yNJ1z
	KE3KLIVbSwaW4bGLL1nl7D/0JciPTA0k/hGlQf6fe88M1BXOItrDU0obTgAzs/Ba+Ixhz6
	CL4CHf+Nsc6ONlTiDttt0XVoOG9hX6Q0d3ROfYoslREjggy+K5FSmP7xNjL8nA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Sashiko <sashiko-bot@kernel.org>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
Subject: Re: (subset) [PATCH v11 00/74] Add HDMI 2.0 support to DW HDMI QP
 TX
Message-Id: <179076619955.542608.8005316063997157342.b4-ty@b4>
Date: Wed, 30 Sep 2026 13:03:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_120339_620071_1AB5AEFB 
X-CRM114-Status: GOOD (  13.36  )
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


On Tue, 01 Sep 2026 21:50:24 +0300, Cristian Ciocaltea wrote:
> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) on the Synopsys DW HDMI QP
> TX controller, as found in Rockchip RK3576 & RK3588 SoCs, by adding SCDC
> management for high TMDS clock ratio and scrambling.  Since SCDC state
> is lost on sink disconnects, the bridge driver needs to trigger a CRTC
> reset during connector detection.
> 
> To support this at the DRM infrastructure level, the series first
> introduces the HDMI version enum, then prepares for changing the
> signature of drmm_connector_hdmi_init(), i.e. dropping the vendor,
> product, supported_formats and max_bpc arguments, which are being moved
> into struct drm_connector_hdmi_funcs, by temporarily renaming the helper
> to drmm_connector_hdmi_ini2().  This lets the new signature be
> introduced under the original name while callers are converted
> incrementally.  Note the transitional name matches the original's length
> so continuation-line arguments stay aligned to the opening parenthesis,
> keeping the diff to the identifier itself and avoiding re-alignment
> churn.
> 
> [...]

Applied, thanks!

[12/74] drm/bridge: Fix unlocked list_del in drm_bridge_add()
        commit: b62e3db8cdc1680e1c3390591e872f485148541a
[14/74] drm/bridge: Fix unlocked list access in drm_bridge_attach()
        commit: 57889076afd1be890150c32ffde3b691fe5707c8

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



