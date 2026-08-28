Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AF1C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 08:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJlSQp8r350iMwIMlHz6kJOY3IIHWCaiqptCoWQnTWs=; b=h85m78UMk1ilKRcIivSxR37rcW
	rQ8NHzi0oxOMGiz3e8TXLUziDQOht8g5fVufdgYCUG4Btb8eMKdUwfuxbQB6wRfs2GOHhNdwVhPcL
	1lE3DITK7E0HKZmg3UL1uWLiHXhKWW3ANg0cC0AXX7/YTsmfFKE6xa5uRwULzt5Jjr7burq7jPclk
	5sJfbLN22hb9URVRyDJxOcVtIZMbmWv4O+VD8+fXyj+0aR7LhCfwSSRtYtZbpt96hJOXJm+0VjEaI
	cvM8Q0ilZ58GFAY4rVJLmg7zEm7N8F3LtQrwzjtAe3QwrRny+e3tQG9pb0JRVSGnPWvYBtXMHLake
	TgagAAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsI1-00000005MU7-1EaX;
	Fri, 28 Aug 2026 08:50:21 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsHu-00000005MKI-0bXX;
	Fri, 28 Aug 2026 08:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1787906886;
	bh=RJlSQp8r350iMwIMlHz6kJOY3IIHWCaiqptCoWQnTWs=;
	h=From:To:Subject:Date:Message-Id;
	b=tg7cmklPEYOt+mqx25lhJ6o2jvzGdCRUvXl+huHhoR8aTpA0R5qa3bMAaP2TeyWnJ
	 5XB/mlSj7fh0WijA/4Tv1ocvXJeMow3ZfecyiObm8aeWV6z/3J8jgsWGvEfwOynvpo
	 wUUC18FESG22PyZXAA2VacQXTbN7+a+r2QZDJHKk=
X-QQ-mid: zesmtpgz6t1787906884t06858467
X-QQ-Originating-IP: CQgLeaWy6Yzh+F2VVlpNXaKxG2UNi9frWcgW6uV9yfw=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Aug 2026 16:47:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17473043343536338628
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 3/7] drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
Date: Fri, 28 Aug 2026 16:47:33 +0800
Message-Id: <20260828084737.565-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260828084737.565-1-kernel@airkyi.com>
References: <20260828084737.565-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MsL7hwqo9bYsqtOmy7L4wpqq4xMtXJOga7qDApU/Hu6EnmSH5HTiBc4l
	xABnqDS4Q6Mv/H+0OxQXq+Ns3cZjLJ5W0Ao3nOUOjeB+QR6+hFvMBgbgSEHn4Gz8FVttnof
	WQQSb4m1TuXYbA0VIopu2oOqBzVTT3+pz4TUpI3icUEFVrTwfxp6T4vPiY1wWAaJybnooFr
	e/UxV5amN7mHuwPMQxt58uD5okqSOT9zNWe7vSCC/YDdgsXCtyYq2VRkZ/3sXp6bLf5t56D
	Quy0hT/+RqcIzs01FFlFLJSOJLPjrmdh4x3sKQc+HyLebWt5wcOzkv6PN78geHBh4+jgmIL
	r/eNqGeWKHjRPE0C/WqobLe1IxSg4mhuytP1+o8Ecc19QEb0ibEVE0nPARn/tXL+PYjFH3O
	J1gh26XRLBlbVq3XbR1YMM19QHR/vZe2tORtjf+Nv7BhBQ3gcdfbusbc/jyXFEA1bvwfwU1
	fC6AH82+d2igOPRDGQJljWyU78lQyVAuAWOnYfFZ13dtnve1Q6LPpw79wi/dx6GGly9kJAR
	qPVWFQ+GomO6tnEZXKb+LrM3ig4p9TlJQGB/nKft/I0X1u+D2HM2oJ6sWPCi5PJQxyVLZDS
	E3nTVVzvmiNu19EGgs05wzx9o4oWEj+nPDVYbRJy6/jnMYY4CQvYtdpWnLkZM9GQhWoh0xb
	AB8H9Ieu6e2UiNDP8v6OVskTe+WbDRlxJcV3186QRB30Nw6AkadYh7tuBgv4dCO6/wu7txV
	b9XPuHMl1n7SOpDoBoDpFTgVRoUdEl8D/iHm1HZOQRCAnIv2Z9D/0nwbYYwCAjqP5799sII
	Nsu4htAIoUC3n/moSkCqRGxNZIMsmwJWAM2I24b56EvLQsD+3EN1QyZiQ4HIMbaDLkOdXLc
	Bv7G3ljBeNfv2O/V1bBI2VPqY+BXKNwqWCVaKll+h7Wjton4AtwNJpiCBASDWvyobDd1VGx
	77xwcUIcqJr7+HoaRp1pMZtFrgF1zFhyEY1JksEA63743E+uE0dE4Xz8npHp3hErVra0IaJ
	jENHgl8Nu289gt72z6
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015014_604180_5BA46996 
X-CRM114-Status: UNSURE (   7.96  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The aux-hpd-typec-dp-bridge module serves as a generic TypeC
DisplayPort HPD bridge and is not required by any other
module. Therefore, it will not be auto-loaded.

Given that the drm_display_helper module houses DisplayPort-related
helper code, add a MODULE_SOFTDEP() within it to suggest loading the
aux-hpd-typec-dp-bridge module beforehand.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
(no changes since v6)
---
 drivers/gpu/drm/display/drm_display_helper_mod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/drm_display_helper_mod.c b/drivers/gpu/drm/display/drm_display_helper_mod.c
index d8a6e6228773..f0152d6b0b2d 100644
--- a/drivers/gpu/drm/display/drm_display_helper_mod.c
+++ b/drivers/gpu/drm/display/drm_display_helper_mod.c
@@ -18,5 +18,6 @@ static void __exit drm_display_helper_module_exit(void)
 	drm_dp_aux_dev_exit();
 }
 
+MODULE_SOFTDEP("pre: aux-hpd-typec-dp-bridge");
 module_init(drm_display_helper_module_init);
 module_exit(drm_display_helper_module_exit);
-- 
2.53.0


