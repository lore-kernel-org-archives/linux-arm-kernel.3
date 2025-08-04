Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C84C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4XCFDuyzG2Kj32vyv3guZI1OAmo+uzMJ+3n3ZjD+y4=; b=zxuXMxz4ZXMzHPaDVWgsPETi4U
	uNMZApKo/MX6llMfpNbJrQzjOxqXHvWVTJn4csSAO7xKIrClTMizCf7yhUQzvoMSptk/0wni3Lpkw
	R3dd8ZdAAGnQtFkFqPVw2QMTbWXn9zviFuWLJqCJnFciQzImYWDBobcZaZyFJZRlsqU8T5n2CxtSD
	eiUywpG+YYsYZgmL3im+PZz+vEHwrXawJYepLuG2RMDwyjrp5JQVsKfkmybkWkYo/4pZE1QXB9nga
	SWaSiChv/Vru0NZXcAX/mvFA2sH0P8IVopsIogp+C8ki886oeBvAO2yIWdb1BQ9/gl4Eii8IF4/3+
	UpOjrenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivsq-0000000AcY9-11go;
	Mon, 04 Aug 2025 14:09:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivIw-0000000AXl6-3H1e;
	Mon, 04 Aug 2025 13:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754314361;
	bh=odWRAl94AI131ZH9bWkD5WdWUHexg4q4fcoXkXOB/Gg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ndgqcUqVYcbUD2NXFPt0fYbaY2jrSG3jw6FJeKR22KyZkaHqUiPIPyOBmxhxVbNFI
	 a9m3XKnyXFfMcBs0ON06R47cn7fpGzyLUCSxH2qi+hwWR/LPJMrNz3TZkS5GNNqScc
	 2ApT0K37PeP1DwbRlXA95qDgUeXu88IFAExhwIdMsXn7HtHzye3vPHtxEQOtkNbSWY
	 TrmoGjUKJxXxx3HRwhZfjLrqXoxWOnwnhpabMKX3lHWNd7gtF9SVowqGCl/jBKj56a
	 5SHvLLsTK706WyjOwWV9NwCxoGboMvEm5MGcRD9/cG2Z0utmLOcLCU+werVpqifoAY
	 x9iVRcrMoAeCQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:865e:547d:4830:837d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07F5417E0F3C;
	Mon,  4 Aug 2025 15:32:39 +0200 (CEST)
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
	Laura Nao <laura.nao@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>
Subject: [PATCH v3 3/9] thermal/drivers/mediatek/lvts: Guard against zero temp_factor in lvts_raw_to_temp
Date: Mon,  4 Aug 2025 15:30:29 +0200
Message-Id: <20250804133035.309990-4-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804133035.309990-1-laura.nao@collabora.com>
References: <20250804133035.309990-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_063242_965520_75D02BB2 
X-CRM114-Status: GOOD (  11.15  )
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

Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
division by zero and ensure safe conversion.

Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff configurable")
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Fei Shao <fshao@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 05aa8895ccce..8398af657ba2 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -284,11 +284,14 @@ static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
 
 static u32 lvts_temp_to_raw(int temperature, int temp_factor)
 {
-	u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
+	u32 raw_temp;
 
-	raw_temp = div_s64(raw_temp, -temp_factor);
+	if (temp_factor == 0)
+		return temperature;
 
-	return raw_temp;
+	raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
+
+	return div_s64(raw_temp, -temp_factor);
 }
 
 static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
@@ -1346,6 +1349,9 @@ static int lvts_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	if (!lvts_data->temp_factor)
+		dev_warn(dev, "temp_factor should never be zero; check platform data.\n");
+
 	golden_temp_offset = lvts_data->temp_offset;
 
 	ret = lvts_domain_init(dev, lvts_td, lvts_data);
-- 
2.39.5


