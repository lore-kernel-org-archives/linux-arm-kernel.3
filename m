Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA5AC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 00:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQHNxSVz1pIvC9J9zXNprPkcYmsCSrcreiGGSbxSirQ=; b=ElKjHlZXfyQCosxGAYw1CtMAB4
	fgrM+dItsaiCH2dQB8WJWNQV0Zxo5MpGPrvDLwZALJirhtZYaavX6+KQZ5XfJ+TFqK8BHXLxZmpc5
	GoYkU6H9uZA/BRqH7DGbHfb7GoNaC9KFmsvnxoyKKVNbifSn6UR/MDU4mbjUOPO8bDT/R7YGsg2oQ
	TXhVXBcs2xRe5i8W75pRLiunhIpq6sSY8JlZ3Ydm/jNxPedt4MlcQiJjI4KXAi/ONQB144QIwt2js
	HqG5bm894HRra6diJM7tlfrLwbG71LkVCshf9XAJKFUNam2rq3iEtBaFqgbjBz1xDX9jaQMVd4PUq
	99cvGf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ7G-00000003Aor-2sRm;
	Mon, 09 Jun 2025 00:11:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPuq-00000003ABw-3Mdy
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 08 Jun 2025 23:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OQHNxSVz1pIvC9J9zXNprPkcYmsCSrcreiGGSbxSirQ=; b=jkuJNbmv3BXC0SU1w2s7Q2v+ut
	p5lnlUehJaydTOM45UxLI86UsVGOJ8cW4+1PATPVZPuijU+4xoJj6uVoA8rcoSWhM4PR+F8Wk2u/r
	0lwo+pQCo1ZZ7ZpF3coCwlCkc32GEU0fqSEjQAYwpxpGv6fDOamzfRdh7BaV2TGafdcwkkc3WkzA2
	ZXE9f7RPMdFltEmlJsgRiYano38lvfkwzE2HShmzr6ANji48OyjvHAeTRuFrhhEWJ7yfe6XyMUq0D
	q971T32BTGOIgTk+kz7j9g8GrifS/I2+Vtw5KkovlreDE4sSrXMgCROEUPKqtkSZaMpRcrlfj1u2b
	YLW5zlew==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPun-00000001YkU-0vZL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 23:59:04 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1E711352;
	Mon,  9 Jun 2025 01:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427131;
	bh=FGSupA2QMdrbodjciF/njqy3XB34wNaxowFmiu2URbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EdxVyBa2GRVNUVv9i8L9gxt85YKfhcJ1Qxd0yLQkMeEGHaYKapbdVNnccYbeE2tcm
	 gecbK/YTwpb/de+R/36+aGsMa7lCHwRvvKfDcnVm/9a5jZ3Idlj3SGPg6HuxFJ15NQ
	 FDSUnwA7tSPECs2bA5EIr0AtVqJNwNvv5yTrXBfQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/8] media: imx-mipi-csis: Log per-lane start of transmission errors
Date: Mon,  9 Jun 2025 02:58:35 +0300
Message-ID: <20250608235840.23871-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_005901_478452_069B7707 
X-CRM114-Status: GOOD (  10.32  )
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
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index b652d59851c2..e27467e6372f 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -100,7 +100,7 @@
 #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
 #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
 #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
-#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
+#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
 #define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
 #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
@@ -241,7 +241,10 @@ struct mipi_csis_event {
 
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


