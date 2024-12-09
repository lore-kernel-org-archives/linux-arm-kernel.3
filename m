Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE46AE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oo6qi32xliB1emk1pVOMd7Vf50zlJGgzdLuk8tsoDoU=; b=m6jr2sDZQDow56pdohudYm3tz9
	ktftdnawpvr8LvdaezKBigsdPwQnbzN95BT5sWBQ96F7WXjqQAQ3lblc6iK9yVsT6hE7Or5lZdeVq
	/V7NAzZAb9YAyYhEWhpqIFU0PjmhaiixL1KtiCjllfyCrFX7pN5qsLlCN7GF+UDTtx3DSiJANxQOb
	gaCpSrIvgXypcAsF3vJZsDhgVpljhxHVy9v518WUQKnzTFbrHJpPhqnjR+5jlfio7wlfEE4KEc5l0
	dib6jMXhxijFVugIEc8j7UrnpUlTSFy4DP2DBPBkRMQc6Nlp4EtMc6wJ/2zD5PK0Zwl4p0PGzPxni
	vEKJUD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh9Y-00000008eI9-2bLL;
	Mon, 09 Dec 2024 17:02:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh7W-00000008dba-29Bz;
	Mon, 09 Dec 2024 17:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733763628;
	bh=mgTvb+hAc3cxs6nEMw1GnF2VZ+CANYXvQu+M3IdY9/g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LQQYN8soH/OC5ac9XKiI5FPJcjJxyYSnhmS0Rr8YfYhDkUaiGe3nYsof84vf0TINp
	 gnaFc128Abf3bFPphaGf8+JYhqREzl+UguyJcPH+iHP+dK8X6pwoB6cr3YAzabvIBg
	 xV+ZCpCzwhScCmvkMCntlNFSzug59VbGkcDMkHB5pqapt181SymqXdl/E57CPQ7Edv
	 GHtm6tg/8x+fH5OScMko2txVzObzENN98RZMaxo1n+hMLnkjeJ7kHif7OY7SLmI2Mk
	 WlUagobyYEMWc2UsSlTT/XwGZmM9Nq04q89ZtPhyYE0JVBx8hl6akkTnayYWkurQPj
	 TTzXQRXnFL29Q==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2916617E37C3;
	Mon,  9 Dec 2024 18:00:23 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 09 Dec 2024 14:00:02 -0300
Subject: [PATCH v2 1/5] thermal/drivers/mediatek/lvts: Disable monitor mode
 during suspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-mt8192-lvts-filtered-suspend-fix-v2-1-5b046a99baa9@collabora.com>
References: <20241209-mt8192-lvts-filtered-suspend-fix-v2-0-5b046a99baa9@collabora.com>
In-Reply-To: <20241209-mt8192-lvts-filtered-suspend-fix-v2-0-5b046a99baa9@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_090030_700964_27492AB2 
X-CRM114-Status: GOOD (  15.61  )
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

When configured in filtered mode, the LVTS thermal controller will
monitor the temperature from the sensors and trigger an interrupt once a
thermal threshold is crossed.

Currently this is true even during suspend and resume. The problem with
that is that when enabling the internal clock of the LVTS controller in
lvts_ctrl_set_enable() during resume, the temperature reading can glitch
and appear much higher than the real one, resulting in a spurious
interrupt getting generated.

Disable the temperature monitoring and give some time for the signals to
stabilize during suspend in order to prevent such spurious interrupts.

Cc: stable@vger.kernel.org
Reported-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
Closes: https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chromium.org/
Fixes: 8137bb90600d ("thermal/drivers/mediatek/lvts_thermal: Add suspend and resume")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 36 +++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 07f7f3b7a2fb569cfc300dc2126ea426e161adff..a1a438ebad33c1fff8ca9781e12ef9e278eef785 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -860,6 +860,32 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
 	return 0;
 }
 
+static void lvts_ctrl_monitor_enable(struct device *dev, struct lvts_ctrl *lvts_ctrl, bool enable)
+{
+	/*
+	 * Bitmaps to enable each sensor on filtered mode in the MONCTL0
+	 * register.
+	 */
+	static const u8 sensor_filt_bitmap[] = { BIT(0), BIT(1), BIT(2), BIT(3) };
+	u32 sensor_map = 0;
+	int i;
+
+	if (lvts_ctrl->mode != LVTS_MSR_FILTERED_MODE)
+		return;
+
+	if (enable) {
+		lvts_for_each_valid_sensor(i, lvts_ctrl)
+			sensor_map |= sensor_filt_bitmap[i];
+	}
+
+	/*
+	 * Bits:
+	 *      9: Single point access flow
+	 *    0-3: Enable sensing point 0-3
+	 */
+	writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
+}
+
 /*
  * At this point the configuration register is the only place in the
  * driver where we write multiple values. Per hardware constraint,
@@ -1381,8 +1407,11 @@ static int lvts_suspend(struct device *dev)
 
 	lvts_td = dev_get_drvdata(dev);
 
-	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
+	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
+		lvts_ctrl_monitor_enable(dev, &lvts_td->lvts_ctrl[i], false);
+		usleep_range(100, 200);
 		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
+	}
 
 	clk_disable_unprepare(lvts_td->clk);
 
@@ -1400,8 +1429,11 @@ static int lvts_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
+	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
 		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], true);
+		usleep_range(100, 200);
+		lvts_ctrl_monitor_enable(dev, &lvts_td->lvts_ctrl[i], true);
+	}
 
 	return 0;
 }

-- 
2.47.0


