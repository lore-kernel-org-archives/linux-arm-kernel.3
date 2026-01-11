Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B32BD2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+d79xd9yqvRmrQPfl5lmYyYKsLFvY+V7qFJpUXpDIQ=; b=N1iUEoMy8A5ec0b+Ii+Vs9PYxj
	ZoQWhJV6BM1f90L291cBrZ4rqSiHH7ZrYiR7T/8mPvTko9fYQaSMHYsFMgu1rjL0E37WG+0/v9tcv
	Vcv0O77aWEpuLWiryaJQA49nvgDuLPfgq75T8ieWV9fS5rfvzhUmrGkLbUmf1xtL446ESyYzsQdHU
	/JPR4r7BnPX3tLlFVCug4okTcuxm6WcNCYcpIgLg9P9Be4ovOP2Y9Jcu+1EtszJmJQghwEs3aW0Qf
	pdv6UTm8wZOKU+L2UMwGxpax11Cy0w+aZVmZ33Uc+xCURxY3B2pLQO/lKL/JUVnCN+HGWQaedSOZP
	45GzPwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevg3-00000004GNt-2vCI;
	Sun, 11 Jan 2026 13:40:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vevg0-00000004GNR-1uoy;
	Sun, 11 Jan 2026 13:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=r+d79xd9yqvRmrQPfl5lmYyYKsLFvY+V7qFJpUXpDIQ=; b=Hcrd9zPyybMr4uH+A3fob1JzfN
	aPppAsHWr5B7l1FXPQXLcpE4GdBQAgGot+eYqhI4o+bTbPOXeYEfA+RZH4Yq/BpXzHLVEa9G8px2G
	a9QfdtqwI4tBTmPk2hZGVqb1htEQsC6zXTt2scQv5N9apN6elVUpiMRqQgSqL/+ldeeboYuQxBl2L
	q8ZNSQ+89ubr0YvykuI4lIHaP6Ami27R9DeDU5kYIyLJqEsq1MEh0glSg1tHoc9FwvCv6Xb7ViURj
	MTxQfgub8TYqQLn5BA5blWBib6FEaM4Zo0bbycBlfzPdoNwIwAyhBvvIsI55fDd4sjog56eMTG2HE
	SOPCyuiQ==;
Received: from i53875aef.versanet.de ([83.135.90.239] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vevfa-001qdb-UG; Sun, 11 Jan 2026 14:39:51 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: dw_hdmi_qp: Switch to gpiod_set_value_cansleep()
Date: Sun, 11 Jan 2026 14:39:49 +0100
Message-ID: <176813878524.3696030.14477314053977335785.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260110-dw-hdmi-qp-cansleep-v1-1-1ce937c5b201@collabora.com>
References: <20260110-dw-hdmi-qp-cansleep-v1-1-1ce937c5b201@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_054016_608694_43402BA0 
X-CRM114-Status: GOOD (  10.38  )
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


On Sat, 10 Jan 2026 23:12:11 +0200, Cristian Ciocaltea wrote:
> Since commit 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as
> sleeping"), the Rockchip GPIO chip operations potentially sleep, hence
> the kernel complains when trying to make use of the non-sleeping API:
> 
> [   16.653343] WARNING: drivers/gpio/gpiolib.c:3902 at gpiod_set_value+0xd0/0x108, CPU#5: kworker/5:1/93
> ...
> [   16.678470] Hardware name: Radxa ROCK 5B (DT)
> [   16.682374] Workqueue: events dw_hdmi_qp_rk3588_hpd_work [rockchipdrm]
> ...
> [   16.729314] Call trace:
> [   16.731846]  gpiod_set_value+0xd0/0x108 (P)
> [   16.734548]  dw_hdmi_qp_rockchip_encoder_enable+0xbc/0x3a8 [rockchipdrm]
> [   16.737487]  drm_atomic_helper_commit_encoder_bridge_enable+0x314/0x380 [drm_kms_helper]
> [   16.740555]  drm_atomic_helper_commit_tail_rpm+0xa4/0x100 [drm_kms_helper]
> [   16.743501]  commit_tail+0x1e0/0x2c0 [drm_kms_helper]
> [   16.746290]  drm_atomic_helper_commit+0x274/0x2b8 [drm_kms_helper]
> [   16.749178]  drm_atomic_commit+0x1f0/0x248 [drm]
> [   16.752000]  drm_client_modeset_commit_atomic+0x490/0x5d0 [drm]
> [   16.754954]  drm_client_modeset_commit_locked+0xf4/0x400 [drm]
> [   16.757911]  drm_client_modeset_commit+0x50/0x80 [drm]
> [   16.760791]  __drm_fb_helper_restore_fbdev_mode_unlocked+0x9c/0x170 [drm_kms_helper]
> [   16.763843]  drm_fb_helper_hotplug_event+0x340/0x368 [drm_kms_helper]
> [   16.766780]  drm_fbdev_client_hotplug+0x64/0x1d0 [drm_client_lib]
> [   16.769634]  drm_client_hotplug+0x178/0x240 [drm]
> [   16.772455]  drm_client_dev_hotplug+0x170/0x1c0 [drm]
> [   16.775303]  drm_connector_helper_hpd_irq_event+0xa4/0x178 [drm_kms_helper]
> [   16.778248]  dw_hdmi_qp_rk3588_hpd_work+0x44/0xb8 [rockchipdrm]
> [   16.781080]  process_one_work+0xc3c/0x1658
> [   16.783719]  worker_thread+0xa24/0xc40
> [   16.786333]  kthread+0x3b4/0x3d8
> [   16.788889]  ret_from_fork+0x10/0x20
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: dw_hdmi_qp: Switch to gpiod_set_value_cansleep()
      commit: db8061bbb9b23534ecd69bccdfbd70f5c9543189

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

