Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7F4D59D71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 21:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1F7YqMNzAqwIn112/2GokLvJbCjwVIONpW/K/Zi4rU=; b=d+T//4gk974qQKTMWnqradQhMn
	qUPuIwULuBJuXcQQDi5kQi+ayy4LTt1jNYPs+m65AUmXCNEp17uFEj1UZ/srEw4kHYMtVmctWyvrx
	xpNzEJ0S6pjIcJPCxBynfYBDiTAPudFi07UkFwVaqg5g7QCYaX3IHT4V+hLguYBM9PxSP9RXHGcaj
	Z/pxV90zaO8o56G/ORYmZ6GTigdA61yfLgxhw5bZYyLQL7ved5m2BjJooODiVEFNNik+ADvnCpQcr
	0xx9S2+aLHnvb6/M71rQRObF+jkKbNGM1VWUCs7U0P+CCfCX+3lO+Fa+Hy22KXBt9ZbYNaT2z8921
	qBpEPJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgbf-000000098Eo-3asO;
	Mon, 25 Nov 2024 21:26:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgW5-000000097JN-3Rue;
	Mon, 25 Nov 2024 21:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732569668;
	bh=6Wd648cisWtG0vCE1iOJHvoJC3FGxaahh4uPbeO3gns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X0LB0oA67iPFBkD/IcZaAnOanLZixkSywQoU7+CmLBSiXSUPZ9eo0j4LZF/9vfO4/
	 WEv9M9JcE75WfoGbjnIIcR9oyhcpbaFD/nya/N/K4LzP09g0nKXvnDpxGt8WU84rkS
	 XXT0b9qGS9emnHHWzXPRdPvdNHOL2ArUToPUY2EJJlPuw16CDiByN/bWedqZRmGbee
	 8VFEOuQmR9jqB4lMdPU+kziSlWFv33kIHxh+qFzMrHdjupMzV/HUtG7tiU08hd3KpL
	 PWV6rKv/IFCgZL9I2mw5s0d454OKH3ZfVMY8yFQiZv6TK9hT+Z2Dqp3+aPRt68/+CX
	 kTQVTz8+r82Hw==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC30917E37CA;
	Mon, 25 Nov 2024 22:21:06 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 25 Nov 2024 16:20:32 -0500
Subject: [PATCH 5/5] thermal/drivers/mediatek/lvts: Only update IRQ enable
 for valid sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241125-mt8192-lvts-filtered-suspend-fix-v1-5-42e3c0528c6c@collabora.com>
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
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_132110_000597_6476B0FA 
X-CRM114-Status: GOOD (  13.68  )
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

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 90f305fa6fb659ae9e3db0faf1a406ef1500adf2..ed72ede040f3b22a60fbdb44fb9bd4f2e29db6ab 100644
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


