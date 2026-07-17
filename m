Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0891C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVHGnXvBQpyTabWvxEW9kBAk5dj9pZG9taR2Z135E3o=; b=nZsUS17WXZZ38zRj4CbcBVYfgo
	BqidSHYTgQ0f6x7mHLpk4FMZk5aRyOjPAveeFOewokfFcr6kBUSzP4y3BuXgHY2c+Uqz9tbExxj5H
	jPip4wKeSNhgw7xYYJ3QYi2QkKNKmkSljFwhN9pHA2L0FOB7ZLTmeAVdli7SFcBwrM2Vs0AtD/JIm
	Y25NziyXjORaTzcOyJrcpA8MV1mX2mf27cUBiB3NCkCbj0v6gQUEqsXE2WXFOhlOTFz0cjNjH5vj9
	6HNv9QAw+J4G3AwDLaZIcADm1SQn9t8KuhHYpDLtgs76G70wrGW8xFpfj/g9QlgQVrgE9GC1kOVpX
	YbOJZvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldl-00000002lei-26C0;
	Fri, 17 Jul 2026 16:42:21 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklda-00000002lOx-187X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 16:42:11 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c15c42a45adso248110266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306528; x=1784911328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVHGnXvBQpyTabWvxEW9kBAk5dj9pZG9taR2Z135E3o=;
        b=KTLltafY0N+jgDIO7+QCvbjBwRcOKEjWclIyZ0FQklRj7cLyXhS0ocqx61Opjj8dLn
         EccU2EEX4PHPzBAKnWlQRIkG/ihHBlvGD/O7nhTpX0uE4JM/KPuaz/Pkc9MYV4N/UZzK
         cxE/CL0jSOa8dpDe07euzzD6/VfeQBqlppABpSOHBLOGbouQlbG9eYgjKguefq9UNwkk
         ZyyUi6XooRpedeAb44yGgP0OsA7SsQoiKhDgBzrz80bEWqE4faxonlqI+m5qPBQguy/P
         JtxgH2tHHRxRPXwqaKwzj3oh7zRiWW5KdyAGBkM+wzwBaK9UyqyZ8KIQEoLIvIB14yN6
         KeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306528; x=1784911328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVHGnXvBQpyTabWvxEW9kBAk5dj9pZG9taR2Z135E3o=;
        b=ONB+D+vHysdX5lLrOg3KXxNdo2iXQK2f7MXcHpmvUTbCYXslFQNZil8QrC8SE6brHM
         lCohyVy/rHbDJcXZmyTWxSIWuPyPHqUeLUI4e+vX/q+HQ/ZWPFdxyB333hIzgJA3k2YY
         eCLiQavBrrMcJFr9gnOHSCYjHdHJRyGGsumuQ159CXQpM/aTagkRDCFG5bp1BL4iQQPV
         MWF8OwzeD7ulAy0IcF1aBfibcuh1MMpmyNwn657w9YWitL7C9VgqQpECFbwmN1S6hYG8
         7SIe2w+/sB6G9tFeGN/9TAAGUOrbE3uSHUhg7SSJVVHRHINuGrnLQ5rEBtYAhz1rhqUN
         Q23A==
X-Forwarded-Encrypted: i=1; AHgh+RqqKLYsl3St2kqAVpJfDQ6n2KhW4BWuGw26dN5Cj3hTeJNTBhSkWd1D80ZBpTZ2TUzT/jyWmA+c5EcKV0cxFjF3@lists.infradead.org
X-Gm-Message-State: AOJu0YxAcvU2uv1EScnlO+Es9xXrTl8ojFSK81S4iIZBP+8nNgyxmZCq
	hR59x/KATFVC3Tbddl/4nRpr8xgRD60Mead/eVyVhVTnyhf3NnYEhIGf
X-Gm-Gg: AfdE7cl/Hlv+Uv+AkVgpnRrWpnIEAvkEZm+eoUANOBRVaPKH8AFOBafSvdSff53/Qbv
	Wq/4e3fbkJ9wFwUkAx2oP2iUcXA/yAiQHbHupX/FmJk7T5Lz8RpDYOFKgMjnqN2Iz+5NZAhBZz0
	HQX4bwMhupHpeB2aeO4fwTxSWuxMYfYuTpmQuUnm0LflHal8ktYmugjfn5bw4LoDnswO+lsm0Rp
	1zn2AgQpkS3OSWfyoSTak5Vd5uWGKiE4pE/Q5Q7nBkGuEg2r91Wa1d3/IsIRQ4mpD/SkFsGQO1T
	UUf3fvfB4aSr88uOiVO3+qCvRZ0Vb+TQmuHd6i4Dv/aVHahD63L3qYv+X3HJYexPBR0DMA0+gB9
	h0HYtGcNroQfVDLtiDxSL2621MtzSoWcMMKUEiCcV1PssFTay06tSkkkMasvR/42MiaUs8LRZRg
	==
X-Received: by 2002:a17:907:c28:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c16b4002a0emr155344366b.1.1784306528247;
        Fri, 17 Jul 2026 09:42:08 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:42:07 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 7/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Fri, 17 Jul 2026 18:39:18 +0200
Message-ID: <20260717163959.714561-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094210_327599_DD8601E5 
X-CRM114-Status: GOOD (  12.40  )
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

The mt8167 SoC has 64 MMSYS resets, split in two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
also stated in the downstream kernel for the Lenovo Smart Clock
in the ddp_reg.h header.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 41 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..dc3e882a9893 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -3,6 +3,47 @@
 #ifndef __SOC_MEDIATEK_MT8167_MMSYS_H
 #define __SOC_MEDIATEK_MT8167_MMSYS_H
 
+#include <linux/soc/mediatek/mtk-mmsys.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
+
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
+/* MMSYS resets */
+static const u8 mmsys_mt8167_rst_tb[] = {
+	[MT8167_MMSYS_SW0_RST_B_SMI_COMMON]	= MMSYS_RST_NR(0, 0),
+	[MT8167_MMSYS_SW0_RST_B_SMI_LARB0]	= MMSYS_RST_NR(0, 1),
+	[MT8167_MMSYS_SW0_RST_B_CAM_MDP]	= MMSYS_RST_NR(0, 2),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RDMA0]	= MMSYS_RST_NR(0, 3),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RSZ0]	= MMSYS_RST_NR(0, 4),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RSZ1]	= MMSYS_RST_NR(0, 5),
+	[MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0]	= MMSYS_RST_NR(0, 6),
+	[MT8167_MMSYS_SW0_RST_B_MDP_WDMA]	= MMSYS_RST_NR(0, 7),
+	[MT8167_MMSYS_SW0_RST_B_MDP_WROT0]	= MMSYS_RST_NR(0, 8),
+	[MT8167_MMSYS_SW0_RST_B_FAKE_ENG]	= MMSYS_RST_NR(0, 9),
+	[MT8167_MMSYS_SW0_RST_B_MUTEX]		= MMSYS_RST_NR(0, 10),
+	[MT8167_MMSYS_SW0_RST_B_DISP_OVL0]	= MMSYS_RST_NR(0, 11),
+	[MT8167_MMSYS_SW0_RST_B_DISP_RDMA0]	= MMSYS_RST_NR(0, 12),
+	[MT8167_MMSYS_SW0_RST_B_DISP_RDMA1]	= MMSYS_RST_NR(0, 13),
+	[MT8167_MMSYS_SW0_RST_B_DISP_WDMA0]	= MMSYS_RST_NR(0, 14),
+	[MT8167_MMSYS_SW0_RST_B_DISP_COLOR]	= MMSYS_RST_NR(0, 15),
+	[MT8167_MMSYS_SW0_RST_B_DISP_CCORR]	= MMSYS_RST_NR(0, 16),
+	[MT8167_MMSYS_SW0_RST_B_DISP_AAL]	= MMSYS_RST_NR(0, 17),
+	[MT8167_MMSYS_SW0_RST_B_DISP_GAMMA]	= MMSYS_RST_NR(0, 18),
+	[MT8167_MMSYS_SW0_RST_B_DISP_DITHER]	= MMSYS_RST_NR(0, 19),
+	[MT8167_MMSYS_SW0_RST_B_DISP_UFOE]	= MMSYS_RST_NR(0, 20),
+	[MT8167_MMSYS_SW0_RST_B_DISP_PWM]	= MMSYS_RST_NR(0, 21),
+	[MT8167_MMSYS_SW0_RST_B_DSI0]		= MMSYS_RST_NR(0, 22),
+	[MT8167_MMSYS_SW0_RST_B_DPI0]		= MMSYS_RST_NR(0, 23),
+	/* bit 24 is SMI_COMMON again according to data sheet */
+	/* bit 25 is SMI_LARB0 again according to data sheet */
+	[MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG]	= MMSYS_RST_NR(0, 26),
+	/* all other bits are not described in data sheet */
+	[MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER]	= MMSYS_RST_NR(1, 2),
+	[MT8167_MMSYS_SW1_RST_B_DPI1]		= MMSYS_RST_NR(1, 3),
+	[MT8167_MMSYS_SW1_RST_B_HDMI]		= MMSYS_RST_NR(1, 4),
+};
+
 #define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
 #define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
 #define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 2f3e0778bb17..abd96634b63c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -57,6 +57,9 @@ static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.clk_driver = "clk-mt8167-mm",
 	.routes = mt8167_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
+	.sw0_rst_offset = MT8167_MMSYS_SW0_RST_B,
+	.rst_tb = mmsys_mt8167_rst_tb,
+	.num_resets = ARRAY_SIZE(mmsys_mt8167_rst_tb),
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
-- 
2.43.0


