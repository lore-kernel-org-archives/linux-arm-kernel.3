Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42107E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDkiCgWoLJt/6Jq0UlyjloWQpFVWbD954PXf8Lx4jZc=; b=UHou9MDqverTmeclp5qGNG8IGB
	XYH0hjcvN6XC412lUxx8Tveq66n2TTmMgCOf+OLCrqLmLDBfZqGQaM6RfpA7EeaiKYPKIYd/JVVhC
	c5+i0/QbAwflIteHn9PRTwkZEaC/XpiX/ChsM4wRCFyRkHMSvNGvmcqu7jOmbOWmC8YNJov7B8lS7
	earESsCA1/kAzFKQoh8RxtDaN7RlyhwTa+dEkUj+MsnrPMhIsI/OUlklF4NkukTlp3AjS43Zu1A0c
	r8rhGqsuNErvAHGRKOZjy7H9v94ZJ8ju1aLEqFPOK+kNmdfpYGF+EMHFYaQBQ8Bp5wklkbe+gMegK
	YlyHN++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhDc-00000008fQF-2hWI;
	Mon, 09 Dec 2024 17:06:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh7p-00000008dnY-08FB;
	Mon, 09 Dec 2024 17:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733763647;
	bh=aiDivIqNPWrEAznb447RKc5XOvk3UR3b13+v8yLgwj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OzJBv+B3JvRHA6tIebLfaKSSfSWFPJ7NCrG2pDgjkcaGBUtZvAg01CC6Km4ZsNAqJ
	 pYe9sEl5n5Njz/65mWU+o9pZjfpUHvmv0/sdVSPDFNJ1kSLNJMPXoBjOta9DQ739m2
	 8qBn5ItjUBNNYd1k9DUVwi6y4K6ps36Obu1OocGqu3zkud+7e9eQPpaIURwUjrWREa
	 Y3EmbdUpohdfabZVZ8W4PWwhTMGFzfnyNMjQX+Ja0rT1X2f3JNsxqy6WO7jew1BiIh
	 ndTwmByfpM8p3hTol2FiHxHA1olXDPWEzM6OujSV8QiAtli1tkhf0YLQFRAGQe/P8a
	 xKHRLY3/wViZA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DDCE317E37C6;
	Mon,  9 Dec 2024 18:00:42 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 09 Dec 2024 14:00:06 -0300
Subject: [PATCH v2 5/5] thermal/drivers/mediatek/lvts: Only update IRQ
 enable for valid sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-mt8192-lvts-filtered-suspend-fix-v2-5-5b046a99baa9@collabora.com>
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
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_090049_214871_2EDCEA5D 
X-CRM114-Status: GOOD (  13.24  )
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

Only sensors that are valid need to have their interrupts enable status
updated based on their thresholds. Use the lvts_for_each_valid_sensor()
helper in lvts_update_irq_mask() to ignore invalid sensors.

Currently, since the invalid sensors will always contain zeroed out
thresholds (from kzalloc), they will always get their interrupts
disabled on this loop. So this commit doesn't change the resulting
interrupts configuration, but it slightly optimizes the loop by skipping
the invalid sensors, avoids potential future surprises if at some point
memory is no longer allocated for invalid sensors, as well as makes the
code more obvious.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 38668b5b34c7375d3a3b0dcf8dcc965a254776cc..088481d91e6e294a31fac7ceed7f3ff62ee3a98d 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -346,7 +346,7 @@ static void lvts_update_irq_mask(struct lvts_ctrl *lvts_ctrl)
 
 	value = readl(LVTS_MONINT(lvts_ctrl->base));
 
-	for (i = 0; i < ARRAY_SIZE(masks); i++) {
+	lvts_for_each_valid_sensor(i, lvts_ctrl) {
 		if (lvts_ctrl->sensors[i].high_thresh == lvts_ctrl->high_thresh
 		    && lvts_ctrl->sensors[i].low_thresh == lvts_ctrl->low_thresh) {
 			/*

-- 
2.47.0


