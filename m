Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47365CD3441
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 18:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eCj1BWZYB7gGEOn+Wx13DHnnjxCeosVlhuQXfG++jWY=; b=O13lBioPaRynoe
	lsy6/9oWZ9UkHkl6Zjr3e4oyAkWipIt2R7aDklHiqJ0KNBE/M7yr0CCTtI7+Lx7mK6D4mBeht8n/1
	8PRhfrJfmnlcHuaX8cm+hlp7JT7ohysmW5+PNfTiYs6vzYxO8Qq/EHgLE9NQB+drzMrITjLcHU9wr
	q7U9kqrCmVBf71juXSJGabiAR8pbyKpl5RGEEgfw+/NZ7Cqq+8kaT2jSeSK5fACcYA/T3gn1rklKJ
	4CCFsbXe5ejmYWY/1Bjh81HQ20CFS8oV/riw7BWImM/x6opDjd3t/vvaKZskgXDWOJvIYF0EVdOss
	euXphGiTT37POdFoii2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxyE-0000000DxuS-1dDy;
	Mon, 04 May 2026 18:24:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxy8-0000000DxqT-3fUP;
	Mon, 04 May 2026 18:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777919071;
	bh=QU7SL1QwNw5+61wyMBcr9whxuxJvm5FGKEXwj4K8srM=;
	h=From:Subject:Date:To:Cc:From;
	b=gWNFkj09J1eugOZKxCVENq5RK5mZXKvDRSMIv1m7ttiWTrIbLK//ad/ghL8XGKPOL
	 egG8JdSHR0INOAol42yGxns8Qg6wK7lWUOl74yAZr77oKTWyBvVbJ+ZiAYJTUpxMO+
	 YoBHkNdB7sQRHMG2sJ7LnqQssESO5eZubN2JAQX1PGSRho22cachLodHjW8uC3H6dt
	 iCqIF8qZv7OaK3nd9Fg9GaJtAqO0rUHFs7lcMKxwnNeWxjTGJgCSIkMwVAFZ3xLCUc
	 9+sAtgC4Qsbv/Gw4IoSGFPDfBIJjUXA00srAvM2TIkrce+Kpl+wOiPjXx8q7i6r6+I
	 zd+7AckoQ6KKg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34F1517E12E5;
	Mon,  4 May 2026 20:24:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/5] drm/rockchip: vop2: Fix layer cfg done timeout on
 multi-output setups
Date: Mon, 04 May 2026 21:23:58 +0300
Message-Id: <20260504-vop2-layer-cfg-tmout-v1-0-730226a7331e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDswiX/Qq5Qu0jjqiDWSRKmId
 zfV5bd4b4fAXjjAM9vB8ypB3JSgHhnY3kwdozTJoElXVFKBq5s1jmZjj7btMH7dErHOK1UbMop
 yCymdPbfyu7av9+2wfAa28f+C4zgB/ZcY3HgAAAA=
X-Change-ID: 20260504-vop2-layer-cfg-tmout-73617a0a103c
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_112437_090219_5A8767A7 
X-CRM114-Status: UNSURE (   7.54  )
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

On RK3588/RK3568 boards with multiple active display outputs, start/stop
transitions may trigger a timeout during overlay layer configuration:

  rockchip-drm display-subsystem: [drm] *ERROR* wait layer cfg done timeout

The shared OVL_LAYER_SEL and OVL_PORT_SEL shadow registers are committed
to the active configuration at the vsync of whichever Video Port is
selected by LAYERSEL_REGDONE_SEL.  When two Video Ports race through
atomic commits, rk3568_vop2_setup_layer_mixer() has two issues that
cause the wait to poll for a value the hardware might not be able to
produce.

Patch 1 fixes passing the wrong target to the wait function, since the
expected value was already overwritten with the current VP's new
layer_sel before reaching the wait.

Patch 2 moves the wait before the LAYERSEL_REGDONE_SEL switch, so the
previous VP's vsync can still latch the pending configuration.

Patches 3 through 5 contain only minor follow-up cleanup.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (5):
      drm/rockchip: vop2: Fix wrong wait target in layer cfg done check
      drm/rockchip: vop2: Wait for layer cfg done before switching LAYERSEL_REGDONE_SEL
      drm/rockchip: vop2: Delay old_{layer|port}_sel updates in setup_layer_mixer()
      drm/rockchip: vop2: Drop redundant zero-init in setup_layer_mixer()
      drm/rockchip: vop2: Use vop2->old_layer_sel directly in wait_for_layer_cfg_done()

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 46 +++++++++++++---------------
 1 file changed, 22 insertions(+), 24 deletions(-)
---
base-commit: d4c14903bf5e28e740516c4fbb7db01e0dedf3af
change-id: 20260504-vop2-layer-cfg-tmout-73617a0a103c


