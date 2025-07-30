Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DD7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUhUpt/sdZ3Qtk0o12ia/SX+2zZ4RKWh6/9apKRow4M=; b=ZhBXlG028WLAF5AE8xmgFS/2pk
	chJz7hnhyro6GYImRJQkwxMNKI9kxy2FqODjCCK77sojC90OFt231Cc663V1mOjBwuNgMiuNqq/SD
	5a5jz8CSnxny/V+Q9d+Av5TIU51WlCtL2xbOEF4qyAvtHyDoisdtCXAHaTvN+DhBF8ITgf3yJ1sP3
	26IEY46MywM3twtPfhVcEbfc2erTJW4XVPCKi7ZTvplsyDaGCwvYLNEGpuqx6MaKuR+Lsyg8NDLsE
	dSWPUHbVyUF0BJs8BLos+wdWCeoo56FJxYgSUavK92hvdDAz0V8fHjgAZOPpNwY6/sl2Q6Iz0IJ25
	HSVydgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8sB-00000001rWp-0zPE;
	Wed, 30 Jul 2025 15:37:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8dX-00000001q2e-2tvx;
	Wed, 30 Jul 2025 15:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753888954;
	bh=nP1axPdaA35vSvt1B38Z0AIa64RQJzj9NXJaUphLIvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bVk3+IrwCjpypp/ItF8K/65hnCBurtXPGXIEfNlEVRoGrzR/OOWNQWMbvw16W0VJF
	 H5B6zG0J6np7C4u8X/Rex2mOL3DpS04e9Rns79GsnH0nSCM8i4YtMXPavjl7tsoXA+
	 TdQ0/6odoHFsrBkCZWCiyT2gcduaZ2gT0AVK0W6p5ybgyReGtNBsAvf3r5DKEDbLTB
	 2sFfRgAjVqdK5No4Olk5+SAxUwUPNZNcaWHVFESeA5VZ6Cp5XUlC40oV3njVDhs0YD
	 qXWepfb/JH+607wZFvDNBi65Tim/oSLQUctp/O68KB3c5zqX1/qxBKmfsta2aP4JEB
	 Vm3VhscvFJyGw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:41d5:bfd6:7c6f:85ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE5A417E130E;
	Wed, 30 Jul 2025 17:22:32 +0200 (CEST)
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
Cc: wenst@chromium.org,
	nfraprado@collabora.com,
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
Subject: [PATCH v2 5/9] thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
Date: Wed, 30 Jul 2025 17:21:24 +0200
Message-Id: <20250730152128.311109-6-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152128.311109-1-laura.nao@collabora.com>
References: <20250730152128.311109-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082235_872668_DB973302 
X-CRM114-Status: UNSURE (   9.60  )
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

MT8196/MT6991 require a different version of lvts_temp_to_raw(),
specifically the multiplicative inverse of the existing implementation.
Introduce a variant of the function with inverted calculation logic to
match this requirement.

This ensures accurate raw value generation for temperature
thresholds, avoiding spurious thermal interrupts or unintended hardware
resets on MT8196/MT6991.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 6e4a35ecaf34..750345465f00 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -300,6 +300,18 @@ static u32 lvts_temp_to_raw(int temperature, int temp_factor)
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


