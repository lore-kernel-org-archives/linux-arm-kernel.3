Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CC8EA3C55
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0WH9lGOckCnnnF8Mv6zjkFujLjP8ZUz3x4kFehgvEE=; b=mn7+HEDaJyWmqUW0gGWFwZbxTB
	RBV1OOQqlG2KkPWl8Czm1kveBlBmyDniw13BO2by9eq5c9ETHD1ZPoGEwu90M+nSW1obyRjnckwpD
	XKJhIa4lBh71k89x3xtD3Jma7syEw4e/E8x4lzbFdbKbf348ogHborUyDQpKdfqSqclq4g0K4/kfU
	kfpRB8heup4yCG7DouK3xexm9B/ryiAxj1UWF5xhbhxoMAzysqkITA2dgnu3LjIKNtSa6TM4pTC8y
	y7MVr3Ea1jZ9GiejFGemYccRoQ6+Epx7QW8GejO2sX6DHRDiJ6Ze8J3tbn9oqJDeu5MrlOpl3XiX+
	Pf7gZlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoRz-0000000ANJf-2bDd;
	Thu, 09 Apr 2026 12:25:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoRw-0000000ANG9-2YqA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:25:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED39E1A324A;
	Thu,  9 Apr 2026 12:25:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B32575FDEB;
	Thu,  9 Apr 2026 12:25:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E36F9104500B1;
	Thu,  9 Apr 2026 14:25:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775737525; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P0WH9lGOckCnnnF8Mv6zjkFujLjP8ZUz3x4kFehgvEE=;
	b=UK+Mp0n596fEF2LSl4OaHplb4llziHSl0dNJZl9G0O26/et05Xh5FsLRMy6daE4EM10vhr
	fc+bXhhgRIg3GuGxvLiq+g4bXDCOArDQ7zwHbc3725kYkNYN7rCbs5IswnWNPnbtoHjL7t
	HpAhoerydkfXYBJ3U7sfipgzsHFpEpHHxNn70I6m9MdVnf/akCVAYZ2AMyUqJLQwOLnAv9
	/PAoTmi2xSpqbMBevH3k782JkSSb+FQKw3zuR/IKrDdmT0uNQ1WrTzPGJAJ4iaq9MJaWt7
	pkeQBGey1ZYn+Iz9qMEypOqfQN0g5hSpAr1RWBkCPmwJ1o7o7soWiWWFu0SI/w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, victor.liu@nxp.com, Frank.Li@nxp.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, inki.dae@samsung.com, 
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org, 
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com, 
 heiko@sntech.de, andy.yan@rock-chips.com, 
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, kernel@pengutronix.de, festevam@gmail.com, 
 alim.akhtar@samsung.com, dmitry.baryshkov@oss.qualcomm.com, 
 nicolas.frattaroli@collabora.com, dianders@chromium.org, 
 m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20260409065301.446670-1-damon.ding@rock-chips.com>
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
Subject: Re: (subset) [PATCH v13 00/17] Apply drm_bridge_connector and
 panel_bridge helper for the Analogix DP driver
Message-Id: <177573751271.595263.3995995529848304885.b4-ty@b4>
Date: Thu, 09 Apr 2026 14:25:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_052532_774854_5FD0B9FD 
X-CRM114-Status: UNSURE (   6.18  )
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


On Thu, 09 Apr 2026 14:52:44 +0800, Damon Ding wrote:
> PATCH 1 is to add a new parameter to store the point of next bridge.
> PATCH 2 is to make legacy bridge driver more universal.
> PATCH 3-10 are preparations for apply drm_bridge_connector helper.
> PATCH 11 is to apply the drm_bridge_connector helper.
> PATCH 12-14 are to move the panel/bridge parsing to the Analogix side.
> PATCH 15 is to attach the next bridge on Analogix side uniformly.
> PATCH 16-17 are to apply the panel_bridge helper.
> 
> [...]

Applied, thanks!

[01/17] drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
        commit: d842ed8f3417d848046eea2c40de78a1993eb3df
[02/17] drm/bridge: Move legacy bridge driver out of imx directory for multi-platform use
        commit: ba2db93cf3d569a4525a02cd0ed5ec5f979e3afd
[03/17] drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
        commit: e123c3c5212200c8c443fe0804e7dfc8e9d5986e
[04/17] drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
        commit: af917a1b95c2b7e58021b4bbe22355323362bbf8
[05/17] drm/exynos: exynos_dp: Apply of-display-mode-bridge to parse the display-timings node
        commit: 1b7cee81d8147d341c0240fcc9cbd129b95c0043
[06/17] drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_connector
        commit: 312a86806b742dfd6fc543d8ec02ab15ee68c1a2
[07/17] drm/bridge: analogix_dp: Move the color format check to .atomic_check() for Rockchip platforms
        commit: d3bdde2e0c123ef406be81d1378749362a1ecb30
[08/17] drm/bridge: analogix_dp: Remove unused &analogix_dp_plat_data.get_modes()
        commit: 4226b19edf240b054fc979557533c4a8c47a5535
[09/17] drm/bridge: analogix_dp: Remove unused struct drm_connector* for &analogix_dp_plat_data.attach()
        commit: b943aefce6ad0c6119cacd6adcc67225b2699e7f

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


