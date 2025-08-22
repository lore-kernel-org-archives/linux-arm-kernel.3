Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B159CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTPM3EN3FE8PbeVayg8VM0ZnbwtVq0qQ7Hc+eOabMr4=; b=o51c1tLdfb/l5zo8EWGQijIxkB
	F2L3JpwaPqOfwsh9NSSaNM4lI5/aGlBcEUKpAJnb+FYkOKCqGfmvUPCrIV5d9g561yeOMG3KYGoMr
	5IG+WSd/KCregrTKIYldbNBBxtieDPWzj3an5WhtkASFL38sW+o25FXqWoQ4xOCZoLRDFIN5NGxsd
	CfbE8/GnONKhBceQekxgcKp+oVECnJKvvJBWbb6doYsbwnW3t0NzJSdUWiFbBlDbOxAeSBwwSSbkd
	3LSiUTtuRURVsEUQSVQF8x1Ykq9MwFV8rY7vl75HpALK3N/Sc/XpZ2iewLSBMsyJwGSjrlrD5cv4y
	/nMk1yQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKXS-00000001bso-245l;
	Fri, 22 Aug 2025 05:42:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdY-000000012S0-3HHa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:10 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 10D0A228;
	Fri, 22 Aug 2025 02:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822428;
	bh=obRw6ILbVFNGLWqlfWuGaYi5bJxVdKAwGemM4GC4SlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOLLriaP6/jChI6gjQBJ1yeBldYRk2mmx7WoSuOPaZpAN8JaTQVThWNzzJa7AIZNk
	 dD3iAZBZwMOSPXsf5dbF5qQek+HWimRQJZm8SLHAzi98LF1vG29QN0BD0vt5/yE/tp
	 IHPOKn+52oR/Qk5rkDewIluuMe8kICwEx/MOcSRE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 06/13] media: imx-mipi-csis: Use GENMASK for all register field masks
Date: Fri, 22 Aug 2025 03:27:26 +0300
Message-ID: <20250822002734.23516-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172808_984296_174D90E1 
X-CRM114-Status: UNSURE (   9.10  )
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

Multiple register field mask macros use GENMASK, while other define the
mask value manually. Standardize on GENMASK everywhere, as well as on
the _MASK suffix to name the macros. This improves consistency and helps
with readability.

No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index ce889c436cb1..50f6f4468f7b 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -57,7 +57,7 @@
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
 #define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	BIT(10)
 #define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
-#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
+#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	GENMASK(9, 8)
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
 #define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
 #define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
@@ -68,7 +68,7 @@
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH2(x)	((x) << 24)
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH1(x)	((x) << 20)
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(x)	((x) << 16)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK	(0xf << 4)
+#define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK	GENMASK(7, 4)
 #define MIPI_CSIS_CLK_CTRL_WCLK_SRC		BIT(0)
 
 /* CSIS Interrupt mask */
@@ -173,15 +173,15 @@
 
 /* ISP Configuration register */
 #define MIPI_CSIS_ISP_CONFIG_CH(n)		(0x40 + (n) * 0x10)
-#define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MSK	(0xff << 24)
+#define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MASK	GENMASK(31, 24)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP(x)	((x) << 24)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
-#define MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK	(3 << 12)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK	GENMASK(13, 12)
 #define MIPI_CSIS_ISPCFG_PARALLEL		BIT(11)
 #define MIPI_CSIS_ISPCFG_DATAFORMAT(fmt)	((fmt) << 2)
-#define MIPI_CSIS_ISPCFG_DATAFORMAT_MASK	(0x3f << 2)
+#define MIPI_CSIS_ISPCFG_DATAFORMAT_MASK	GENMASK(7, 2)
 
 /* ISP Image Resolution register */
 #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
@@ -655,7 +655,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
 	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
 	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
-	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
+	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
 	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
 
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L,
-- 
Regards,

Laurent Pinchart


