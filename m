Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01283C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6nEKYCSxHzR+fxa6fgAMtM1SGB/7w2SLhsaNK4l6sA=; b=iCqWnDAovpBMxnGqQUfLEPa2pM
	DvKYAVPoo4b0eF+S5FdguLrmEEl0lF/aiT7jk0Zi/mHW6sxSJtxB6yRctb9ZhgOKYblpTGTSqdvZ4
	76Pt8SCuCYF0xKnAfBcaFUBRqoflFrSuZAlpFnFct3irAZrzZSSkDJCA1R5dTNRm8YV0iM4+Zy5gA
	cge8H2wt+OlA9SoM2QgSKowyRmkST9P/9lkDMTRMG15nCuT6HtNkEeqMWA7bxI7Xy1qzU4iRGQo5X
	uxahX/YaA2z02rxfcAlrZv6UghDqkj9yfPtmhsaeMFQPumuoEfp+RS1CC/HP9ZQMtoBSyzarqY7Kb
	ynbI5d7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlvQ-0000000GfJx-1NKS;
	Mon, 21 Jul 2025 08:31:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlhA-0000000Gbys-0nPc;
	Mon, 21 Jul 2025 08:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753085782;
	bh=q8mKnBTCCePugtAir380orNmiIcDnGjP5CYqxoIUl+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b58vOpxCJr8+i+lge8xanHGfFxvfWn4CgwCTNPoFz2ZquIosJugqnFZkjK5dbn9ey
	 EomNAso/pDJFEd01yZd9i4RBGlnidvRcCevfhR1kPd3l8au6MxZz5cT25BKSg3sVza
	 jergPtzp+gr4p3QLHKi2AyC80UlSUfBHpt2EidnNRnLGAMyH9CcGZNzlGgRvmumRSx
	 nM44hh1FyeB1vqAQiueF88rep6ph1GO2fYqm1MvJbhNIjOy6WH0c6hSyz8lkCxd/os
	 HlbyaO5cqpBYl6Lip7VH2eAuhKENOQ3q3IHnelsm7tPUpCwkBCHB5Tmte174L94Qqk
	 993Tl4krQ7hnw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4487:69c6:40a:81be])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 827AE17E0F66;
	Mon, 21 Jul 2025 10:16:21 +0200 (CEST)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH 5/9] thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant for positive temp_factor
Date: Mon, 21 Jul 2025 10:14:55 +0200
Message-Id: <20250721081459.16278-6-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250721081459.16278-1-laura.nao@collabora.com>
References: <20250721081459.16278-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011624_371711_A18D6954 
X-CRM114-Status: GOOD (  10.97  )
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

The current lvts_temp_to_raw() implementation assumes a negative
temperature-to-raw slope (temp_factor), which holds for the SoCs
currently supported by the driver. However, this assumption breaks on
MT8196/MT6991, where the slope is positive.

Add a variant of the function that inverts the calculation logic
accordingly. This ensures accurate raw value generation for temperature
thresholds,avoiding spurious thermal interrupts or unintended hardware
resets on MT8196/MT6991.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index db83137c7537..3c34956e37c1 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -296,6 +296,18 @@ static u32 lvts_temp_to_raw(int temperature, int temp_factor)
 	return div_s64(raw_temp, -temp_factor);
 }
 
+static u32 lvts_temp_to_raw_v2(int temperature, int temp_factor)
+{
+	u32 raw_temp;
+
+	if (temp_factor == 0)
+		return temperature;
+
+	raw_temp = temperature - golden_temp_offset;
+
+	return div_s64((s64)temp_factor << 14, raw_temp);
+}
+
 static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct lvts_sensor *lvts_sensor = thermal_zone_device_priv(tz);
-- 
2.39.5


