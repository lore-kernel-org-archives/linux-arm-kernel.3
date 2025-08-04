Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAB0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMcsiJzRxFEvpRs2DK90GgzBuuZymAneKyL4VJaxXmM=; b=kXUHmUnxeYLVLR6pLqlxvx+ftx
	8IICTZWZcGdQpEZvZGDeOf7E1ltr+x8hoS8vKfzqdSAEZRGH7Zkln8VSA7ZQTKXcNNgtS7b18AAw3
	eqBu1cj7R1i/Gm5PH7QnxUlDo3X3IdKKrY9jVgEKfqDbx/dxjf6iHAnS3x/0S6bdjmK5+QpT6mTM2
	ciFWPFB0y6Q6wgVxaInQrxJr+Q05gzS4H5MvcDBUVupghU3fJ1YIu/BrZXxGK0DRYBH3WMoe5k3Ct
	rqzBNXOMgfrmFoTCeOgz8HfwmjrXU8xnC+Z4sOM29wWXaaDV6gQ4t1U0lb+JQbbalvUxOUn3LDePi
	AIS+kJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivxu-0000000AdW0-39tN;
	Mon, 04 Aug 2025 14:15:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivJ0-0000000AXls-0sxi;
	Mon, 04 Aug 2025 13:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754314364;
	bh=p8TNqT/5VVY0x4ZX9U/Edo2dC4tTH5VL+JaK2ksQlv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IAyB20mFKP98JZzTsGAMRSvNOE22Kp81k8/xPcNbRYq2C4i14IelZn/6BBbCnxxpP
	 QjqfD1A52AdrTAYFMswHe7aPfG0MkfSXA+26K7tY45mUYV7YNGSuRdTT0auUg6s8GA
	 SEAQKjFPF+hxNcNFSEdR1JG49ipPpRVQ2BzrEUm938wm5EEotzTuPhtduP8gM/xiKH
	 wD40UVMe4mhj/l+H337zPkXFTTdy/En9iNzrotkX1g+a4z3xaGWFy0xiQEVYHKH5v1
	 0YMyeujLL9XsnPP9CTy/GwYrmhn9zULywbMjvNMfuboOluPB0mupYvJrRz+Uhwp9Mx
	 Ep5yx0vptsbiQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:865e:547d:4830:837d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6460E17E09F0;
	Mon,  4 Aug 2025 15:32:43 +0200 (CEST)
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
Subject: [PATCH v3 5/9] thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
Date: Mon,  4 Aug 2025 15:30:31 +0200
Message-Id: <20250804133035.309990-6-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804133035.309990-1-laura.nao@collabora.com>
References: <20250804133035.309990-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_063246_394417_79107A8D 
X-CRM114-Status: UNSURE (   9.57  )
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
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 47124d33ca2e..e29664f1316a 100644
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


