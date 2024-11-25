Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30790D59D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvEDmXInw7k4V6ZIy6bOKah2Z8Zem9ZP67Oc6LWBOsA=; b=QY66S6YGxMPOb1O1useV1P7Pbo
	wfRkLWXsVKihaOdcLgx7fRlem+5QYSJLoys7ZVgC21+81+VpK2EM1NrTub+vs4B+1U4R2hEJKNUO0
	77B/JY8XbkbqOXSmtLb+24EKHgRLIl5853GIF1YfGniwb8Y57kPnXOri+gpPIIR9WdoAoCtTnRDc+
	LkuCN96DQpZ9UfAVf9Qu7VEOu7BMPXbKdHhiRQjCDviu1voaLxu4crGCT+V/YtCkBveeUJad2e2Vb
	v2s5zHdVpn4Nzmq8TmXfG9t+/F8v8PSu3TefSfh4vf+LmckBeq0Jd1Rqh4gJn1+nOE5324CzOGSrw
	KwSCPK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgXu-000000097e6-3cnF;
	Mon, 25 Nov 2024 21:23:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgVx-000000097HI-396G;
	Mon, 25 Nov 2024 21:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732569659;
	bh=FBZhGfXq740tghBOe86Sm0AbQxcn9ttlyDFHCVd6tP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LWUeujpItmYU/qaCrHAgaYxz2Xh9WnYwZHTz6fgk8ocjuzyR5cbcHofkRMNfJ6rpa
	 CTLt1LZD/WJuAqjmzyHVtTz6Jg47COr0YoM8j5TlcH7YWupoQ/1pMuq679o0idWgEJ
	 aNMq6+HEDXoLVdiwrLIRwUYOvmia8RvzFKGd2qUDQaKy0C0UZy2FPubyDKjCNhNaIB
	 bId1dam+ltlgWt2pR6KsppnAeRULXNMslqj2kI3O/ISNI1IO3JgaKuiyWLPiTlu+DD
	 tklPadgf9hLSe8LkqJLibvMSo29J4+GU4A5bW2NM48Yb8VsuPHsoeIg4BS+LddVB2q
	 Q4OJAWQsNkKHQ==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F32717E37CA;
	Mon, 25 Nov 2024 22:20:57 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 25 Nov 2024 16:20:28 -0500
Subject: [PATCH 1/5] thermal/drivers/mediatek/lvts: Disable monitor mode
 during suspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
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
X-CRM114-CacheID: sfid-20241125_132102_757978_9E14ACEE 
X-CRM114-Status: GOOD (  15.77  )
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
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 36 +++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 1997e91bb3be94a3059db619238aa5787edc7675..a92ff2325c40704adc537af6995b34f93c3b0650 100644
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
+	u32 sensor_filt_bitmap[] = { BIT(0), BIT(1), BIT(2), BIT(3) };
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


