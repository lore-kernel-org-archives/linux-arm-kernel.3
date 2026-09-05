Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61140C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cvLPMe39R/AaBDs2Mh5u5mXzrtCLtGEuv4B7IhLgiQ=; b=mGGpysoi0dn15XAXqX8BLHCjrG
	VMevXCm9Pehc74eSmjf2f9UIc71QeGISntQMGTxDk3t3sSFrJbOBflMPye4K0eNdAM+9tghuFH9TU
	7LoEj/QpCD8aHnVDoiaso0XVvItBMXt3XZrGSG8uOyN0a285+vdnej3yvAdcZjAs1d/2g0loS72RJ
	X/EnYaB4iEOotSLqExC/4/OmxL/tt7iUkQxQb+eaKTe1hrOTumRrnfCssGWIgRtYDFhoutCksCL1b
	1ecAIzmUV5aN1t0/0liDoDZPFSjItcgtzoAfnPvdQVQc3cUubp2aJCFWkJvnmIn+A7JQfLaMycy9D
	r84tzkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNo-00000004CnH-484f;
	Sat, 05 Sep 2026 15:32:45 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2sNj-00000004Chp-2HlY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:32:41 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48584dc164fso1951608f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622358; x=1789227158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6cvLPMe39R/AaBDs2Mh5u5mXzrtCLtGEuv4B7IhLgiQ=;
        b=L0WNk4c1igDkp4k4qbatTAoWGWDsl1jDIKYFAf4SL1Yo5qw+s1WwSsG5tTFNTtjJLz
         8FkQAUEGdIQoJgZu3eJkUv/tDV/0BRE++KuZiK0YQzIGYdaSoo4OBw71DeoUWl+XLh/6
         dZ8Kj+JMmhPvaCu+/rjuRPE6cVSXaWPczppg+4O+8bIK1dMGDwu8iXDW+AsS3pX7uiKc
         sB6UgaaCIajtYT1dJfhPzC1Gy8jRv0Y3PQrepIZCKCGk5vvRN3sSGZjjwpuJiAGF4lvs
         Xy7/rYwJplT0OW7LP+DJskObstXip2PFYZzNG7DoLvl3wocu+MW44KY+IjzxqDosfJLY
         8qCw==
X-Forwarded-Encrypted: i=1; AKwUvByyQArXMr98KxUGmVFauaPVe32WhG9KFzg+UbBeI9tdIEU1xI5kyTD6bDtKKUUnj/ywVu0vUUD0WolMVtH/B2Qt@lists.infradead.org
X-Gm-Message-State: AFuF++nqbZ5/r8TeMKvHkvZW4SUeXGvbFoaVvmTisHTV9cIDTIGfl29m
	tlPZISNFzYGYw7D5JTVpS66d0dsNGxg7Qu7J3zL5fT/z/nO35F1us/8e
X-Gm-Gg: AYBFou1Zpsi10lrO8OuYwFw8fkff+vnJulQJZitACzkl2BnqpYXwSYs+p+Pm8maxvah
	Z4kk+cei3ItE8QXedtgyvbX1n69fTzMnP80PeXr9nrRU0anbdfkfx2B6XQJ1pEhyKec9YQQXmJH
	BKWIoBWhwTW14DkNHl6b+ck8A6yEDWXF+oq/g6nRviAPQOIaW1IMDOzDsskO6sPegUbEA5WzaI1
	Obyi66DAqXxPwA09OxskpVmrYmO9B9qXFdqpiuS2b/5gxKPoijNfJz2Q4l2U8pdV4pQrfhQbxnh
	xM9ZXcko0WP8GltBzjTBTQ7HRYCfL01+cWoiT5K8GG83gGOYkli08y00T1ocC/1UTFjmf0Z5Lcu
	GbfyYjFPVgc6XOgEAmA9w6f4iqz4hLltY7Mvw6XPE/9tgKXYDoYbjdOgZhhcio1v4x3MKMdQH5r
	qmCvF4+BDRpmWcTyWoJUeqFnUWgtjTZU1N5GUkc1K+Dgme3ps/ZMEOEev2Naco1pExJ5E0QMs0r
	cmDL4+h8DQikKyTW5/7la5XrMy8vHJ7V5zj
X-Received: by 2002:a05:6000:470c:b0:485:8a46:705c with SMTP id ffacd0b85a97d-4858a4671b8mr11204628f8f.46.1788622357649;
        Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:37 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] mmc: meson-gx: enable the bus pipeline clock on T7
Date: Sat,  5 Sep 2026 16:32:32 +0100
Message-ID: <20260905153234.133217-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_083239_598059_D4533F79 
X-CRM114-Status: GOOD (  16.19  )
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

On the T7 SoC, the bus path between the SD/eMMC controllers and the
NIC_MATRIX fabric goes through a pipeline stage inserted by the hardware
design to help timing closure. The stage has its own gate clock and,
when that clock is disabled, a controller that starts a DMA transfer can
never complete it, hanging the storage devices and, from there, the
whole system.

Add a dedicated match data for the amlogic,t7-mmc compatible that makes
the driver claim and enable the "pipeline" clock for as long as the
device is bound.

The clock is deliberately not optional: the hardware cannot do DMA
without it, and failing the probe with a clear error is preferable to
booting and hitting an undiagnosable DMA hang later.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..c0f1e929fc13 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -139,6 +139,7 @@ struct meson_mmc_data {
 	unsigned int always_on;
 	unsigned int adjust;
 	unsigned int irq_sdio_sleep;
+	bool has_pipeline_clk;
 };
 
 struct sd_emmc_desc {
@@ -1204,6 +1205,15 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (IS_ERR(core_clk))
 		return PTR_ERR(core_clk);
 
+	if (host->data->has_pipeline_clk) {
+		struct clk *pipe_clk;
+
+		pipe_clk = devm_clk_get_enabled(&pdev->dev, "pipeline");
+		if (IS_ERR(pipe_clk))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pipe_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson_mmc_clk_init(host);
 	if (ret)
 		return ret;
@@ -1322,12 +1332,22 @@ static const struct meson_mmc_data meson_axg_data = {
 	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
 };
 
+static const struct meson_mmc_data meson_t7_data = {
+	.tx_delay_mask	= CLK_V3_TX_DELAY_MASK,
+	.rx_delay_mask	= CLK_V3_RX_DELAY_MASK,
+	.always_on	= CLK_V3_ALWAYS_ON,
+	.adjust		= SD_EMMC_V3_ADJUST,
+	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson_mmc_of_match[] = {
 	{ .compatible = "amlogic,meson-gx-mmc",		.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxbb-mmc", 	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxl-mmc",	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-gxm-mmc",	.data = &meson_gx_data },
 	{ .compatible = "amlogic,meson-axg-mmc",	.data = &meson_axg_data },
+	{ .compatible = "amlogic,t7-mmc",		.data = &meson_t7_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, meson_mmc_of_match);
-- 
2.55.0


