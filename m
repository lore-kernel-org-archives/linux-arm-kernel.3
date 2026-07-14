Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB85DC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH7pV3dzD8txMH8in1lzIVd6sxUWNu5LuUwhK8rbs1A=; b=knl2VufoAkdORZOIouFKh+Xh9x
	FraniO/kXqU1NtRiLX+fi7/GVcvIL70ZjgYGK0aQ9bRh1cx/a5wxav6T/dcXMd15F5uJg/b8s3ANN
	0cAA8sHSs3VPZS5XObazD6zJeJjDcNX84OdSbB3KF7czOhywnlH1qL/JakvYCoqmGAhbLbE8uZT2E
	+kH1XhR70I3INEZ02xAXNHGnuVPsAXJUIIFXd/q/7ckAV3nsuoTC3pjPRQnyK6T/s4pkUqsyvEerj
	Bfxo2o8kuFHLGUbKE00Or/uKN+3JRJQOxvvs/42VHhldOrERM5nE/pUM3LS47jLh8PFP4yNwnhlYu
	aVXkIaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje9j-0000000CO9f-118V;
	Tue, 14 Jul 2026 14:30:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje9a-0000000CO7S-3ZaL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:30:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DE2A4E40DAD;
	Tue, 14 Jul 2026 14:30:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 154B360346;
	Tue, 14 Jul 2026 14:30:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D39FC11BD1904;
	Tue, 14 Jul 2026 16:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784039427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oH7pV3dzD8txMH8in1lzIVd6sxUWNu5LuUwhK8rbs1A=;
	b=ZujtwIKDUTMvkl70KweYLz2K10Skoqn+1JVhtGLX7eGVBLXxyAHPsXDAq9AAMQ9XMTfmKl
	4HqUN9Sdjcaw3IUD8hfpiOFSvMJHBzHJUE3orMcW1vPqqt91aWy6UqLMU6jo8Ar5soJLVm
	eNxpqrXJUb+3LCuhY9jemItjiSS0C6pRMbugaKKWRIGQslBYUKFwrUF+MtyAnJCGeFREC1
	GBhyw1iklLBg4oy0rDbCTQmmmwU57Nyr5Clq4t181+XqohE+37H2Z2joDYdpPtL0JZoDyq
	csH59Bi7My3zoz6CWnkdCHiqHGol3Z1fPF78rGjhD5hahBIYAPKHgqMbRSRzHQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/3] drm: remove unneeded 'fast_io' parameter in
 regmap_config
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, imx@lists.linux.dev, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
References: <20260705163536.1850-5-wsa+renesas@sang-engineering.com>
Date: Tue, 14 Jul 2026 16:30:13 +0200
Message-Id: <178403941344.13050.12493561230026073506.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_073035_057609_A97683C4 
X-CRM114-Status: UNSURE (   7.90  )
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

On Sun, 05 Jul 2026 18:35:35 +0200, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> drm: remove unneeded 'fast_io' parameter in regmap_config
> 
> When using MMIO with regmap, fast_io is implied. No need to set it
> again. No dependencies, can be applied directly to the subsystem tree.
> Buildbot is happy, too.
> 
> Wolfram Sang (3):
>   drm/bridge: remove unneeded 'fast_io' parameter in regmap_config
>   drm/imx: remove unneeded 'fast_io' parameter in regmap_config
>   drm/rockchip: remove unneeded 'fast_io' parameter in regmap_config
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


