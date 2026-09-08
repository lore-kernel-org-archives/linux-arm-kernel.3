Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462FAC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=; b=fXlRpIHq2Mzj+Bn84is7UxQ2c6
	S6dlmIVtLw6IfWgc6rLluWJ9HzJnvUyOuYhRcyMeUtfA6hC3JTOezVzYJQgWhlw6gOY8Eug7UZsWa
	9KFn19AoqvuxWbQl1NO5ULS5SazgrBiwCcVV0CxwpmD1/mkjQtlAu/ZqucL9Q5dAa/L4LqeQKuXB6
	YoGhaMs9kHCF7TwPEk8sCHQx46/M1rxICLJuTcWeFHfy9/0plz7nxv6NAFkao/MI/NwLoI9JGrVc3
	6eOR2iFbMLZtb5Vz1P9MOalKQ6t+TWrVsRchZi2GgiHOTX9UjwvhcVplg90nRdDE5g5PW1Xtf9mfT
	adBRuQJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsK-00000009sH3-36YN;
	Tue, 08 Sep 2026 17:44:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsB-00000009s6K-3lDI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=; b=YuMsa/WJkCC0iw9a7PjADGsdiO
	3KYd7TiunBsl04b6sGwHD/hwrH9UCv5PyKEDzmQ8Kfwi+Sj5kf9rKdJvowGaH9aohuqJZqy00P9tj
	4GNBnvp23HmSLYYbVYqJT4CnpICdvzOn071bBDe5rGSQxwXEXTjQzrsJW519gFgDLyMyW6mQ6urFT
	4KJXiVMzEfbDunpQH0Bgl8ovCUr7gmegpe/beu1oYrKyBPX1BkI5ejZ1d+L0yINP/LgGehCkdAn3z
	vHvljqj/fqzSbwJwHS5ij7iG2nm5hv2a5tzNSJSIMJDuulbQwh0tc/qCxU6hnoG1I4MrPJSO5dDfV
	edT7AnAw==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zs8-00000000B0h-3oGP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49d05d51553so27596975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889479; x=1789494279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=;
        b=lT6pbO6erhLxo5qaoSGiWU49369Ubyj4eyRyAVQTsUYX5X53ojWcgZBWMPa4a6MT6b
         29WX0rqAJYCzGjdXr+UZlBwCV/Xhd9awDdl6PuRurZIoX/SpC0oEbg1wVAywuggCGIZn
         S4IuIJ+Y3tiNL2wqQ9v2SjcF/cseeZqlXTmOO6tPAOMbD6ecPrEKKexmP037f9o3Pe9L
         Lkus5k/uYhzYdrhLbBNWzrRB44UM5fiQ7Ymwopts2AawUag/eQ55VZsWe4rOQF/I+GXT
         R27HM1fSwITEyiBQkIL2CaaqSrIzDejcNCg1XqMjdOf/OkiFIc1K+riSpDWu+NlVP9IO
         F37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889479; x=1789494279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=;
        b=Maly+fWF0tHByVJ6+4/m2LH22QsNTeZYXUOs5eKD1LHgn93i+DxI0q6KMQdgHaTqOz
         u1lVpbJNHRPPXUsGvKim0R6RKSa17DfptRtCQwiZFmO8CckftvteKncg1pcw5fyP2BbL
         Z3CHo8gG33PuI8qCEMMQY4L1YrhYL23c6lZ+MBrNvXNaxeBwHzQ/vvpu+plisTS2NKur
         HayMRiZQNbj4uVIJ+KN3GpGhtSEM+gmYuf2F6ZjCWL3BuhMZGib6VAmknx+31ZchT9Hs
         0mn/w4GSi9/xtTBxnDKQ1ZQp/N0euyxoT4X96ZkgyOxs043kSy3Oi4JDPCZyeiSW1xpg
         YbWA==
X-Forwarded-Encrypted: i=1; AKwUvBxydi3ve2QpYNN+UAqZOo7yiQLe/gM6YYwQyEvVaOGWGSop0ZWgnI9M3McwNs3EzmQA81CduNCFdAQFyI8O73l6@lists.infradead.org
X-Gm-Message-State: AFuF++mhxCK8RBOp4nIrvLY7k/VmtQNhvH8ohUK8usSYbzyXb97/6BbI
	FSRnZe/Unwo3O6tearLECBuGmgPl+kXMnh7yyQQ+L4S68yu5GmJKyaVu
X-Gm-Gg: AYBFou0A/4/Vx9SWyLUEbF5Hdj1iq3HvEgEHx6mHhjrvdP9aOSN6Q9jUZAwGgP0DLcb
	xGAGokf7NRA5mxWqFUi2qWqSZUmoAGqqnd9abSvUQ918pU6BYMyR3kDXq22xsXHJQ93uSq6qXl3
	3qmbubsPCmTSR4WmvvISg22vUeN5zw4Gjl/nNFBQ8DVdHFkoL36HJB+fgpJNeZxUgWm6X7zFLaP
	V+qbgAw4zi2rrP4qdSkXdriX+0CIIwx/si4AZlp6AAe2D1JbkO9fBVR/XDZO9w0+v6govrhK/j+
	x9+vaXJX+OPg/u+yNgQwB0P7RBaIuj2GTiRY49uo5Y0peBqgF3SDg0XitQx4BQ+gBa89iKcEMYd
	ng0sptGUDrjGICuJE1lxk+9Sp+Mm5ROHjVTboY/ynEhcxtrlkvymdCC6eBKIy/FEf3TLu8o57nG
	E74ALL8+k+GSjVHteWKjmKGd3q4WNsqWUM6I5BrYi/woi+/N1MW9zgOBSU
X-Received: by 2002:a05:600c:4ec9:b0:49c:fc6e:a3d2 with SMTP id 5b1f17b1804b1-49cfff39708mr256750925e9.17.1788889478855;
        Tue, 08 Sep 2026 10:44:38 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:38 -0700 (PDT)
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
Subject: [PATCH v5 7/8] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Tue,  8 Sep 2026 19:38:34 +0200
Message-ID: <20260908174259.9009-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_184441_019044_0A4C7A1A 
X-CRM114-Status: GOOD (  13.57  )
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

The mt8167 SoC has 28 mmsys resets, split across two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144).

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h |  3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 38 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 001379373507..5c7cded5cfa4 100644
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
index 2f3e0778bb17..015dc5b86478 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,6 +4,7 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <dt-bindings/reset/mediatek,mt8167-mmsys.h>
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


