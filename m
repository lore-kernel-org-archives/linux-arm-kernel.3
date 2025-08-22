Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA64CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agdn/RAQDJQQoWnCyKzSd4rst1Gx7C8Y3yrv42mmj6M=; b=uyC15NuHrnW7djWB6/1zcmjtbN
	rSuKLKOrfq0LBFa6ZxFs+nxbqoOWm9p/EpVqZKG7AqQvVVTZa2Bn6fcNWFuJciNMfiOOvfQTIAFo2
	VHoy93wETc2SCC4DIY+SkR/RUPSz+8EFTTohBlh6SBbD6JhRU3rqovDANyRyj5wmQrT3o1S/WuF7N
	UkXw2/PgoBQLx0/XOsfhWnNEfK4xxRqAwpmIPu1ptyUyTIfd7e12n0509VvO2e3K2okyXjLZ3IJ4Z
	+F+aKqcTb+7tHZRHSXcQFLcaQ6iKF1dEz1Ix0u142VKZfTVDl0kG2CiERbfRoXPVrLHkaKl/SjeGY
	8quo+uuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLaH-00000001jw1-0W9O;
	Fri, 22 Aug 2025 06:49:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFda-000000012Sn-1G3e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:11 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 91405E45;
	Fri, 22 Aug 2025 02:27:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822429;
	bh=+2uWvTejnO4/xaa6TvzNFbU4t/8EQu/bspQi8hgNTO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgoOF8xmTKrMDrwAjbKOYsxnvJwczW2j/2HxaE2Al3p1/Kto52r86mry7cEJeTzjl
	 Ga3ej6rzjn05u/PDMss/iKmuESWjYADz43NRM/XFTtTp0XYrYRrrR23X0lWV7+guj3
	 xuW54gMrSCjJ7hKhY/aYgxyvN7Pdw/FPjuzBUY44=
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
Subject: [PATCH v3 07/13] media: imx-mipi-csis: Fix field alignment in register dump
Date: Fri, 22 Aug 2025 03:27:27 +0300
Message-ID: <20250822002734.23516-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172810_482157_3C18A907 
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

Commit 95a1379004cb ("media: staging: media: imx: imx7-mipi-csis: Dump
MIPI_CSIS_FRAME_COUNTER_CH0 register") forgot to increase the maximum
register name length, resulting in misalignment of names printed in the
kernel log. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 50f6f4468f7b..346599b7a517 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -892,7 +892,7 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 
 	for (i = 0; i < ARRAY_SIZE(registers); i++) {
 		cfg = mipi_csis_read(csis, registers[i].offset);
-		dev_info(csis->dev, "%14s: 0x%08x\n", registers[i].name, cfg);
+		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
 	}
 
 	pm_runtime_put(csis->dev);
-- 
Regards,

Laurent Pinchart


