Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF677CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/z69msUpA/80CVvB55jKs61WbtTlulsSCUcz5uDX5Y=; b=cTaP2XWHsvgRhp4K1F/ujowgDu
	qFPBnq74u9hz/Ap7/+oJAbwL095Y1hdkTsmeWlBA1GtD6sCWRsUZ1rUROn0SXGTY+mLbP440D7aw0
	YmJJO56klAqU/ky3TatqHGP39J0D4Ra0zACjeMW48/Px/6i5zD1d8l8AaMY+F/hUPe2UrC3HvExkP
	1iC7LDJy4fTAWyYe72FAaPeVE1uRrENK/MWxiSL92HuGVmZRaRJxN16F43W3/etET6im4HZF+HjK5
	hxnRseso1uIkYnJbCfKDBnU/Ve2bI0fp48+GIn9F4nD0PGJ1PLp01lpz6ugKnpukKDEfvwwfKvQ3z
	Fv0677PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKcc-00000001cPy-2JNy;
	Fri, 22 Aug 2025 05:47:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdb-000000012UJ-3ZDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:13 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 203891F17;
	Fri, 22 Aug 2025 02:27:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822431;
	bh=VRTtx5007Mrf2c/UANrM//Z4d9wC/+So/3DGJzjRBKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dMogZGY/nZUOaEsCRcqbzClbt8PkYZKH3PJ9WyTUDPolbwpr59ihsqHXRfmi6px3p
	 GQp5oeySG/5RViiRA7s7fqVW0GOm3q+AD0G2RHih+L2z/KhZ51P0l1eWgSK3+tC11t
	 gfXTl9LVG5H8oLoA1Ciu0K8+nnIH+kgUk8NGgP7E=
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
Subject: [PATCH v3 08/13] media: imx-mipi-csis: Log per-lane start of transmission errors
Date: Fri, 22 Aug 2025 03:27:28 +0300
Message-ID: <20250822002734.23516-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172812_047705_45C48871 
X-CRM114-Status: GOOD (  10.95  )
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

The CSIS has per-line start of transmission error interrupts. Log them
all, instead of only the first data lane.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 346599b7a517..77f1bf05b520 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -99,7 +99,7 @@
 #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
 #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
 #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
-#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
 #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
@@ -240,7 +240,10 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT 0 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),	"SOT 1 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),	"SOT 2 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),	"SOT 3 Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
-- 
Regards,

Laurent Pinchart


