Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBE8CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKaHqbWa1DGn2bAOlpukBKvkS4gSiQZLv2LORE7il94=; b=rb3c3I4REBfH4SR+hCAFXHyk2b
	HQIE8omrJATX4V6ufBdAwbIspdsREKbYjf+HvgH/ed2vOW7/MfkQ6acIgVZ5fwDAGQ2d3936OEpI2
	6rje0auY45bzYL2wP7ZEsFWocgxwcaAYASUxyIouy1UXvQwEqSHaTsDgEla2d1+O/Q8kSoYshhiP0
	U/Lq9CwBUCiZiJHwLUaNzLBPtoYATxblvEH5djDX0f5fyAUXwOfx1/pH6s3/3rGBZ8heHOH+lv/8w
	an+MkJVaEgRV0cZ+FmCK6Locgdjni5SgZjYcj8Q6LkD2lr4+T3WS/SU29Tiwxi93xAtcRSDnYK++8
	dtnKIFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Osd-00000004yc5-1OGV;
	Thu, 16 Oct 2025 14:22:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OsQ-00000004yRO-3MYQ;
	Thu, 16 Oct 2025 14:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760624564;
	bh=+dPsIauTA1f8zOMGJpFbkv4q8kNFRDtCdLs2hhZkUls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZBHjCxwThfWAKQcXsT+wepgtFfMCgiSomug5E+nQhfzlVqvyxmRExg5yAwXakI9+P
	 /HNEglVL/eSqFnuBpDppXfPPY1+clmSSEF4jlNMBgWbcH6+h/Oi75kLadRjXn1ZLoQ
	 ZTS5w/w5D+Nh1Vpi5u/WVz2EfNlkX6XGKpXdj6ExWpBVB1BoUrro0mW88W712YNd0A
	 gf066EumVZDjySqOkOborEGob0sA6kqu0rG6bN+vEoWjx10yU6T4eBZQjM+jDvp/mv
	 aYSRjve3TH8VlUCKKLtLdqDIgScv3EtOocyhlDGSB195Zd+4ataT8bTBsYRJ0Gb0tf
	 9vMgviSnf2Xxg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:655a:5eaa:d2ad:4ee4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 725A017E1412;
	Thu, 16 Oct 2025 16:22:43 +0200 (CEST)
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
Subject: [PATCH RESEND v3 3/9] thermal/drivers/mediatek/lvts: Guard against zero temp_factor in lvts_raw_to_temp
Date: Thu, 16 Oct 2025 16:21:52 +0200
Message-Id: <20251016142158.740242-4-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251016142158.740242-1-laura.nao@collabora.com>
References: <20251016142158.740242-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_072248_380309_8DB551E7 
X-CRM114-Status: GOOD (  10.77  )
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
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 1c54d0b75b1a..4ef549386add 100644
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


