Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D929CFA76E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuRVQNlLXzUjzmKQMOUQSA4iiMhuz7d5M7eAD7ONLHs=; b=nMIn5vFEi3pQIxwj9O46acrxIz
	9WwOLB4BH5ANYLjPh8KPUWgxQHHKXBd1ftByHh8cOO6u2SmnLJK0FFFh0PBhIxQYv57u/mw4X6GQi
	kzMZoIr2cz2MgK+z96TQnN943aWiyMzcbrYNqiY9TKhRSB746drU9nmsJbp8d5yk0tIFVbkDqrEC2
	WTmW9ydd0Ze1byCJSiI2OWip2oI+wvCxyJbYL++eqOw4HOQFUzUHknYFXntsWgPQYEiHRcKXecIOl
	bbCEJMf6OPxoFVQIhGZYCeRDXdN2gauaovSa1+qO06XDi8V+jTp+kM+q16ioEiDPfVUd90ZBOlPh3
	hzQWrcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8l-00000008I7t-04iA;
	Fri, 21 Nov 2025 11:17:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8a-00000008HyV-0Dl1;
	Fri, 21 Nov 2025 11:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763723829;
	bh=6YJLPO2KEF9QyWxLaPwxFzoKrk88Q8+O4pyGSdBlLAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nQP53C4aNcllaqDO3XfJj8E58ySqopLc2lmPgBcGShIjCc21m1Fu12LRDzy3GH8NZ
	 josECmRaXYjnYbHyPkukHtE7o3SdB7s/UUyS6soW6NTz7HRtvZytCx6rYPF00x/xv/
	 Mc+4LPNYo0vD1tYYw5WEHAW3PBCbuxxm6Qk17LM3Rg3QhYeRG71XPC9VAVqlKMq7x6
	 fH1atf8vkkxJUsxPwVZHU/dkfiL8uFyqfjqZlHiy2ER0C02UqyH70gncO564dyG0AQ
	 57zA88Ui9vqusQDk1nyfQYb0JF9XfDbWnP3UeU9JSC6jQSyMNOT11s3QorH4hd4b0D
	 Ntnw6WWkKMgKg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:c4bf:9969:6e1c:dc69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B287E17E156E;
	Fri, 21 Nov 2025 12:17:08 +0100 (CET)
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
Subject: [PATCH v4 5/9] thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
Date: Fri, 21 Nov 2025 12:16:38 +0100
Message-Id: <20251121-mt8196-lvts-v4-v4-5-357f955a3176@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_031712_251486_DF136213 
X-CRM114-Status: UNSURE (   8.62  )
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index d713c46c21fc..3e05b29f7b05 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -307,6 +307,15 @@ static u32 lvts_temp_to_raw_mt7988(int temperature, int temp_factor)
 	return raw_temp;
 }
 
+static u32 lvts_temp_to_raw_mt8196(int temperature, int temp_factor)
+{
+	u32 raw_temp;
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

