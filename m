Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA88DD68BF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Nov 2024 18:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPHUwl/vUW8J8XVjfD+XoYm/ASccvQmqH8UuCsEZ/lE=; b=QUD/MgSPdqk9c4Yrlmtp5s0zXg
	R8Vte8IqOUyf0m0hH6rzByLOHzeUskBQ6PmSsHpddSoH5cJ63atOOvurtC3FitHZSAqwgR0TvruMm
	TYAs6+cSR4bnWnMfhzQe3YI2fnYUB6y9DSLxCi/S8pLh3ZVZ4kumRgQ0R1lBSfrlKREeD5YGMMIHt
	nuUf02dgm3rrtxj+Ct6FLI3CrL1TZqKxbNh+qllh4cdvCWbMrSjzD5MLR7oUjVrvzC21DWj1c4VrK
	FmTkTsm2tHvZYGdALC8T8fdMiFgLBR4ok6hIvDoijHWsM/EgYu86+WpZuJrdhC2EI6rF+j+M9+pmc
	SUfbysPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNUH-000000062Xm-2EWc;
	Sat, 16 Nov 2024 18:25:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCNRU-000000061xc-41xc;
	Sat, 16 Nov 2024 18:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731781363;
	bh=5yLL8RBABIDFFVGZv2n5kbkq6Ay3LOmlFo5JVggJqLg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=obDQbAuVjSAgWb/fYXKu7UnT53UQHuJZrNXP58OgtW5qfw7iM46xBSBa5hFFjMG/p
	 pb4YEfKB2OJUnLL+YMOOBPAvb+dl3OogjrWUWZUIpQnB+hulCVj7HD4XqDOOPcmpZq
	 kQMMx9prBOzK29MeDzHYdwzc6ByIIWoQN0CX4HtJNk5/d8P11lGToLUFDbIc6/kDT/
	 HpQTaTiy1U/OcUpq7TOHgJS2e38LPC5xxrUAhrA0PwI81wjF3lEqWlG8xRiPG7YoLU
	 6fsK+qcmTuNlYavsyiXS/Y5fNCLioW1z7iDHrDPdBUh23GNA4o5K5Dqvvrr1mk4X1J
	 OP9Gz1mG2JW7g==
Received: from localhost (unknown [86.120.21.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2A03417E377A;
	Sat, 16 Nov 2024 19:22:43 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 16 Nov 2024 20:22:33 +0200
Subject: [PATCH 2/5] drm/rockchip: vop2: Drop unnecessary if_pixclk_rate
 computation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-vop2-hdmi0-disp-modes-v1-2-2bca51db4898@collabora.com>
References: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
In-Reply-To: <20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_102245_173763_BB9809D8 
X-CRM114-Status: GOOD (  10.19  )
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

The if_pixclk_rate variable is not being used outside of the if-block in
rk3588_calc_cru_cfg(), hence move the superfluous assignment from the
first branch to the inner comment-block.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 9ad025aa9ab0523c8807b331564c68da10c56c18..3e4c1cfd0bac6fa90f4cab85e27c2a69b86fc9aa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1838,8 +1838,8 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 			K = 2;
 		}
 
-		if_pixclk_rate = (dclk_core_rate << 1) / K;
 		/*
+		 * if_pixclk_rate = (dclk_core_rate << 1) / K;
 		 * if_dclk_rate = dclk_core_rate / K;
 		 * *if_pixclk_div = dclk_rate / if_pixclk_rate;
 		 * *if_dclk_div = dclk_rate / if_dclk_rate;

-- 
2.47.0


