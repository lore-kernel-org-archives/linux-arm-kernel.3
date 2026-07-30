Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 577D7C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 01:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npvKufDrxCamAC0XxJBTsSoLK/Np4E9Y3fZVXvjDxtI=; b=LyeNzw3ebToglI5pdbonjouS/L
	ZnfnHRaawwKlTwyAPwzP5KrZya8DVLsQ1Il3Bmz3bYFx7Oz16rNCrL7Vqq6BSFFjhrxNX+C3XqAmo
	QzZKSPLrp5ReHDPzbzRlkJksSYUYHVb4JYQk6SXKV5UeNpjjbhqmW1WyivOPbKPFh4lm9EppaB0ll
	JxtDA22VY/lMtFowqW4BLsLHjrq6+t9Nwo77Nx2OXnJWCBDKXzyAlTsYLZ9wOwmpX//1SBqR+i3PU
	EQ5NxRH914OmUKcb3agxRyywrJt4j4di2HVwlJyvH/aGNBor77sSbOCS6FnPY/y02yMol43/F3Awo
	hl+ccP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFg2-00000009GTW-2kyD;
	Thu, 30 Jul 2026 01:35:14 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFfv-00000009GL1-3Bv5;
	Thu, 30 Jul 2026 01:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785375257;
	bh=npvKufDrxCamAC0XxJBTsSoLK/Np4E9Y3fZVXvjDxtI=;
	h=From:To:Subject:Date:Message-Id;
	b=o83+M00J3uvQhdLB6dqcF/TPFjUtN5FlxqHWNVzw7vsUaIXnKPKJcuznXtMfGUCnh
	 4PH9VZts66qmM4nriHkPK3M+YK+JhZ81ZjRoHhTvquF8b+ov8b0aY0To3fiP8b/eLu
	 OpLZfM9uVHthgxWZlUguPyV07j97u0r8TapNSyps=
X-QQ-mid: esmtpgz16t1785375255t1b5f5b3e
X-QQ-Originating-IP: pEB+rak0qFIvtoH5ex0k9x33XVmBeGbaXJ7neXht+5c=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Jul 2026 09:34:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14627087560788875138
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
Subject: [PATCH v5 2/6] drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
Date: Thu, 30 Jul 2026 09:33:45 +0800
Message-Id: <20260730013349.51-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260730013349.51-1-kernel@airkyi.com>
References: <20260730013349.51-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MjA5tsjrlPcvo/9ZOREPP3pvjBCGzJCCX27w6ex4OyK4RDbEmCqTKIHl
	6itxEmueeqMuJtckT03Hl6uwHKJ8ErZ1BTRX2NJcpPTBrZnVAx3ex/GH/R9l3hSgO+/z4oI
	D7ediTBLaPELIYlHFRWiuEArlVHPC4yQcAfVKznJb6N5ZwQNpaIqJygm9R4PubJswDBTYmg
	ag3wIVKsFRtPJrZE4wLq9fiu7Lh6eErm+m6ASq5cV0aRY/+rWgzaJbicwr4XYYboVByzTKn
	LZIBKNoUQawfwWDz7MpkQ53BU4ynUIzyQU+LzSSyYzZ4pdQyOrDsuh/vtjxm5zTJLFZhKe9
	gs5iuBEX3GVQyOzw6vb2Q7E0WYPI5DY93eiNaJTfW3qlZDMAOF0TvFyz0C57I7B0lAdTw86
	eQVTMy5dmasZ1NoVDsVGGdCgu/eIyj1nmawP5U7GQxekcPLP33Ld0HsyTdFPV5o5auHoFtl
	qDyYWoF7racwC63xPCpdkO80koQa4pUcbmaDT9JCyZLUTJse8hewPKJSKMchrqN5EdRZV0d
	sUPM0GJw/iwcuoSD0yD6TbDW3FBaQn93I4kT1SprfsOdzClnO8D3/g+iEcPPcdS0xQqnlEL
	vEiSUq5THYOzWBMylJiv/fYZqtaUIgb3l6eDPV/LYn8niYGTnUsjIEnTY/dwlEFshY5qBhJ
	PsE6wJWTmJOnFfcgyvE/89xqZ6IXBldyCvg1s02BuJxmmmVmN43qIA3kWc0j+rjkO9DgT+A
	92EyTK7qmMK8ToVqpXocyOp2ssCxZ8kwHjR4P1fulu5UhIypp+2wkY+xgrBrnDLvWNVkVMt
	x/li6sL/Cmt9oJQW4CHiaVcsICWsyhVCDyxgR+dTT535oSedpg3MP/WccuB3d5vZ3fj3dBP
	6vVNyyPPS8iqMzxQpo5oUdklFLgy9mH2XG08pDRU3Te9V16+BxdVpR7tlnIXIjLTudetLU6
	ycFzf9b0vUqbgBxSaNOMZpgK2m3fqvdlO/aTMGUE6Vj4e0t47XcZS9ODxy69p+udqzU+LhE
	317egh0A==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_183508_601699_A289D4A8 
X-CRM114-Status: UNSURE (   9.07  )
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

Suggeted-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
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


