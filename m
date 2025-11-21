Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C31CFC261
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb5H6bOiJt+kKwZkwdh4mcW49tcTKT2eToWtlOQFQaI=; b=elq+N3adPZvl3rgUTdUWeMMLYr
	sFiQ8VBlOFwc+VJLh8R3tRfVGOacQ/CbPYKfAZxhiNuv21bRM6hOOI0S0Qd6OBSk7VtUM7ANUHw4r
	8ex4SVkCETs8z1Y4NwEXOLAxNERyguxmE38diL++LHTvorc7ZG+QRMlDDQJM7ovkXv8wwtrYvfQ3a
	3M5VdMmL8vplHi8eSq+IlE1qC6R13kTYMNO247T2vJat+tb12JDyOiig0XlURFz0Z1+Ue1cLAYV+a
	ddpZrIKCS91sUqXrj40b6U2Tyf9WBUHrquVmdUW81/Mgjh5eYzaElz6IYyxR0XkUUq+iNy29vA6tR
	u/gYD/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8j-00000008I69-3Rl7;
	Fri, 21 Nov 2025 11:17:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8Y-00000008Hxl-2FsW;
	Fri, 21 Nov 2025 11:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763723827;
	bh=aVbakoBQyckYSlNSPoWjsMEdNHC32xZLNcs0IhQ7uVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mGdYFJ5pC42qGlbSkGh7F1UNEyLUdSu2AD76zGYpcM8TPi7OjhBfod+R+mmnNK55X
	 HUrE3O9865qSvBbPwlbSnux9O1THbew5RHoCw+OUuPzMzUxhWYh3LARrJcbzddN2ni
	 6kxy/wODGvp9LrmrF6nKKWlo8Iwl1ZvPIc/C4o8+qRqItUTFOSkvSAHSFp0iK4CZNK
	 nxtVhkac8m3TDw8ag+qoSy8ervZDQ0b4KBONwy7p1tBLBz+tguuTExpMRJ42/Oy8xW
	 0gDhXEqIlAjjjSvtMT92cMomjLEvdrxu+2RixJd0phvAy5eFst9EmLaOWXp2ndJXN2
	 8JowKthHlnAag==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:c4bf:9969:6e1c:dc69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DBDF517E13E4;
	Fri, 21 Nov 2025 12:17:05 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: nfraprado@collabora.com,
	arnd@arndb.de,
	colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com,
	andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com,
	bchihi@baylibre.com,
	frank-w@public-files.de,
	wenst@chromium.org,
	fshao@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v4 3/9] thermal/drivers/mediatek/lvts: Fail probe if temp_factor is zero
Date: Fri, 21 Nov 2025 12:16:36 +0100
Message-Id: <20251121-mt8196-lvts-v4-v4-3-357f955a3176@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_031710_748856_0C4B3FEF 
X-CRM114-Status: GOOD (  10.44  )
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

temp_factor is used in lvts_temp_to_raw() and lvts_raw_to_temp(). If
platform data is incorrect and temp_factor is zero, it could cause a
division by zero. Fail the probe early to prevent a kernel crash.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 1c54d0b75b1a..b49441d82ffd 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1346,6 +1346,11 @@ static int lvts_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	if (!lvts_data->temp_factor)
+		return dev_err_probe(
+			dev, -EINVAL,
+			"temp_factor should never be zero; check platform data.\n");
+
 	golden_temp_offset = lvts_data->temp_offset;
 
 	ret = lvts_domain_init(dev, lvts_td, lvts_data);

-- 
2.39.5

