Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314A0C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iSnB+tiO7RJY6/v5TqZgypWMYIiKGFl49Mks0edXerk=; b=f7qgSrG/do75CJ00CtAft9qRIp
	P0VljqU/n9ZRp/Hnz29Bx0NzL7U/SUXq7lzEnNyvwUqft0t4pN4kheTL3+jOp1gUSP/aDUNEYRs4i
	aXzG0+tnnmevnbMv+ABcQh14LtTM/G6678GUlPMO7vnea50WCcKMvFSXLnhpNWlFQOHj5v/DMalMq
	2u5+mosDvCH0TzCNZfdaOMgcRBcEbmQPSKArQ9iHFTcPxHXlZn5hyHvkSNpShNE8nPLmixR1jcRpr
	Fu2Xb45o3HICebR6k7+s3YYFTlIT7mKz5MVE+k+N2XbtX7RwZSEFS0KIVLs56JUWeVzxZrpv1ze7W
	lWWmjLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i2h-00000009HSM-1gy4;
	Tue, 29 Apr 2025 10:18:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hu7-00000009Fdr-3I8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 10:09:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745921371; x=1777457371;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iSnB+tiO7RJY6/v5TqZgypWMYIiKGFl49Mks0edXerk=;
  b=HLgNUtG/amMU7GWeLMXkP/LjTeCfjRIfazG74R/6YojACJ4P/slApMBq
   bKdzp49hNxkOQXpAnasI4dskj0dd612b9MCT2bgO3URLKIkfESn5IJQjz
   2klie6VY9N+E0yfR3/zDws6T6MSQr2SkizYYodxzyNeq/c6UcnvR2L7cO
   NdwAJKpSD4cq/KCbPqYuJxA+4BMOuYiDcjFGVP8Ciidn7hgSNal3gnL4O
   7k2HSODTjGfXuHrCtEnENjpt+7ewTFeO4+8chv9IJa22WV1QcGoXdsWE6
   aZXciCDuta5NwfJi3OK+IgExjUickRtr+PAzV8cvcHv9l/j5WaC2UfmoL
   g==;
X-CSE-ConnectionGUID: 2oTZPV+dSOOsxLVCJYAMkQ==
X-CSE-MsgGUID: 8xZ4UqzESUiszoQuMgVlRg==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43779882"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 12:09:29 +0200
X-CheckPoint: {6810A559-B-22EE63B7-E8AF8A9B}
X-MAIL-CPID: 219F0D8F3AD959829E5A5445EFFD28B2_3
X-Control-Analysis: str=0001.0A006396.6810A558.0045,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 658B4160E51;
	Tue, 29 Apr 2025 12:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745921364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iSnB+tiO7RJY6/v5TqZgypWMYIiKGFl49Mks0edXerk=;
	b=pYPYSarCiS7YLzsLmIEXC7QY79PIP9YZfAi+DPC2mCufP2/ezomg7Bcpzre93c5Q5EMkIZ
	1WGkI8x+nprBZjyk0OaYhLFHZsN1NRxTDCR6d1Hd+6o4RXmAIhDbJOsLKL2yxcA+7Uy9L5
	Xzy9OVOLC/Rrtrqvj3dWfxSPVp0U3KdOWEnox7QSpHdoqk4lr1NuiNI+qGPs0BSeMYxPz0
	anJ4VMTsnJRMiTnYG9YbcbjH/orFmCG4rZI3b7RnTMwvWC5jtbHKqUkc6lK/n9R/mxvZUb
	9xdxcrLkZBoW19+TV0FNj2Am5UGkBcLvKAW/vMC/iP72f12vHcd91qUqYc5oRA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] drm: lcdif: Use dev_err_probe()
Date: Tue, 29 Apr 2025 12:09:18 +0200
Message-ID: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_030932_300247_4BAB689B 
X-CRM114-Status: UNSURE (   8.94  )
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

Use dev_err_probe() to add a reason for deferred probe. This can
especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index d5996efaf34bb..99e632d4a0e9b 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -164,15 +164,17 @@ static int lcdif_load(struct drm_device *drm)
 
 	lcdif->clk = devm_clk_get(drm->dev, "pix");
 	if (IS_ERR(lcdif->clk))
-		return PTR_ERR(lcdif->clk);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk), "Failed to get pix clock\n");
 
 	lcdif->clk_axi = devm_clk_get(drm->dev, "axi");
 	if (IS_ERR(lcdif->clk_axi))
-		return PTR_ERR(lcdif->clk_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_axi),
+				     "Failed to get axi clock\n");
 
 	lcdif->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
 	if (IS_ERR(lcdif->clk_disp_axi))
-		return PTR_ERR(lcdif->clk_disp_axi);
+		return dev_err_probe(drm->dev, PTR_ERR(lcdif->clk_disp_axi),
+				     "Failed to get disp_axi clock\n");
 
 	platform_set_drvdata(pdev, drm);
 
-- 
2.43.0


