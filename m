Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0252C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArReOYHVWGkqiCjvjPG3jfbqs328VtcGm9nbHTUdsqI=; b=ItbOoP0Cisnib6mU7Uapm9PMtV
	hG8JWXQ9XyG3AR1HLHzUFl3EnlyAuPGZmAX21Sdc7v8whs3NeV1oKxKVMEXLsD+T5MiLJhN3isl/V
	Arx2JFNwGoNgbkEumufEUDhnqA2Y5vUdYAHrY0jCEXxNsdg+Fwge0x0VzApZqZ9tgUMTs2+EMyY9J
	Wfpga8jpdP16vFT/ayuOkVIgvhGt31fv5zt9fZA2j4BRv5oso1ffEjO4Gls80QgjCJD0cMW7lpkiC
	drzfOG6fwgSO58Bu+UHQlZgCykttH4cCgTrOfPX9WuYQjI82Knl+p/YQJfZbcGM3ktY4C27x1nOKW
	ujn+WQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63a-0000000ATX6-0xCq;
	Sun, 09 Aug 2026 16:07:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63X-0000000ATRV-1ViD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4954dff6536so9179655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291642; x=1786896442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArReOYHVWGkqiCjvjPG3jfbqs328VtcGm9nbHTUdsqI=;
        b=Nlkx+DrC0FB1/EHEYqpwd8bQhNoDXh/qGch5Bb+HaGdlPcBzWox9EuZromhb0h1nla
         KO0D8srJ+u524Go8s3p8cXuhMOvRMlam+c2Vt6RSDX59TBK+j2otdN6dL6sOU+IqUqJw
         TxDXfQTqQ/HNtB92XIWLPiocTHOuAKx0UU/UrklI7ssaLZtW6hr3AJ1ou/U5L1FSohnI
         W5ikG2enDoX427U5ZYfn8fG1jJAQbh4HbS3Vl2uD/BnElz7coIeBKqeqE1NGEiLQEeVB
         494A4xLnMzGim7N7YFe98N/F7yj0Gcp0YEoXQXImXwXt7pPU+NBYudt+LbUbkdfrTuZT
         CP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291642; x=1786896442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArReOYHVWGkqiCjvjPG3jfbqs328VtcGm9nbHTUdsqI=;
        b=D2nhQPgLkVj/EtlaEI4O44JJ3Bn6qYEnf/feUdhoLnoNswSFOx04a440HBC61vJ9iL
         ohWcdMcMZZvSHHpduTbkjfxq0xMlz4PEzaZfjVu0QPMI6FefylnygOiAu6EZqKLkcAqV
         DOHeaeOyUQ4DO0wVr0Tg1BmPOXdKchIWQ8nwF+SvIJNDs/mWADgqjqziiXzsDsC9oYP8
         7GC05yNvohgbbH/NewvykNVEceh4Rt/Kn5HmNtZEmddhVaHYPisyRRTLgafehyc2Zdlo
         gAquROMTHpNdLqLNkvezFjkLrU6O0fRTOdR6FbcAiIZCkZ64VAd7RPTp7P9Mo4MkEBam
         XEUA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6CtYwPbRVoAW7NzuEApfWzG5aFcHRqnfJarfzgJmX5qCRTJewDZ8QHw5E78rpnIxs0gb4+Ay301ICPy/J2Pu9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9fX6SXgoAaNmzfYqu0ca9da5APmGhhQnEAMbE7t8rIH7ogyQj
	XF9bgRmV8iebi7iZdN8VCt6pRPfW0BLQfvR/PrpnuxfohdGRbenshDFM
X-Gm-Gg: AR+sD11YUsderd1hT7Co2jZU+MFAvzpqkBpKZ51TyNo1Hg+mTd50psP8oHK/rNc1l/S
	0Zr+V7xmkb1gl0u9W8ZvP7ykuUZKRnm1wWqLn8JEvtoUdsHP5DCrDdihUC44EN2i9k0YE8O5mMW
	KsSfJbMbJvlibE9GDP+nWCSFx2tiiYbxDMd8+vo+34bw+NwXM6JYF6Ds5c7qussyCkiK1Pos085
	1qreXwkGZgtTWo+o4NgA7cygeQajekO/rWvosqYtHisTEuwQpdkJ7c/3IXKpX/uR/2Zlw6TQHEy
	u2l9Qxw47a6WS7RW1GUji3gWpvX5C9r4QecMGknYiCE2jN0pSwrBT1Fl3kH6itvgVe1H7KEkRGb
	+gdpnf7P/w2swipoZrUyKM+ncaGXxV8NG2xeOAjJc9wwGY1o2Gmp9d87FenqNl8o1/aZDQj4Qwf
	2ff163jvHbtPn4RpXm145QPFOdWuw/w8GzxXq5YvifIGJVgfSyKQGh/BFaT3BxuyouUg2uMztwZ
	RS2
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr315410825e9.3.1786291641636;
        Sun, 09 Aug 2026 09:07:21 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:21 -0700 (PDT)
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
Subject: [PATCH v3 8/8] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Sun,  9 Aug 2026 18:03:32 +0200
Message-ID: <20260809160643.33991-9-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090723_459737_03042A6E 
X-CRM114-Status: GOOD (  13.83  )
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
 drivers/soc/mediatek/mt8167-mmsys.h |  3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 38 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..27793462ce0d 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -3,6 +3,9 @@
 #ifndef __SOC_MEDIATEK_MT8167_MMSYS_H
 #define __SOC_MEDIATEK_MT8167_MMSYS_H
 
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
 #define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
 #define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
 #define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 2f3e0778bb17..02649225e8a7 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,6 +4,7 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -53,10 +54,47 @@ static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
 
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
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
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


