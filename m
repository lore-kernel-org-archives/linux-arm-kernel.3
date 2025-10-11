Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CA1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 18:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vdgUFtkm94mHMBHalEL+1YJRTb25XyzuTOkQ6dZPhg0=; b=KFEdGc/e5SmsSec1++f5bFp/yR
	anz0qj/jFzFX39CGCMN/KLPzoaLHhdiwHEDPy5XidVZUDjhE83EP3rPvY8ohgQedk26xiAjr7L8xx
	5qHlYbDZJS0+HnH/Edn6QkHmRsf4it0gpMUpXoKTQ8Ly7eRZ0g1UKQDWQh+Q4Z4w0Y4FvEReaP2Uh
	UkBf1Pw8WJzKmqvL/mj8rdU/SdnswQh2fx25QuFmeOEaRPdfcsMsfR3SFZ1O4Y0L33kztZlfqy0DD
	zswwMsZLBi9X24WMPEFQFoPdmct9VJMSx5l7DROoPnulh++t2FQThTJui9XvZtqeJNX04kQ+IjceQ
	lOnOb6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ePf-0000000AU6g-1HOH;
	Sat, 11 Oct 2025 18:33:51 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ePc-0000000AU5Y-2dAb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 18:33:49 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckXLY5pVpz9stX;
	Sat, 11 Oct 2025 20:33:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vdgUFtkm94mHMBHalEL+1YJRTb25XyzuTOkQ6dZPhg0=;
	b=tvieORiUSpm+Ij/BMeA1PDJxzh9FRbKW4uZQKQkqMh7ZEGiLU+LqEw39F02RO9zeWjc0Og
	GOXipSQ3M5UMIqxVePTTKGMY2KbYSEKXSegulyMejZ3yfe7TB0fBn3Y0YfPq8QD3N+JdO3
	6VM486SZI9folujOv1fLvpjxsTG8xs8rQO6e6a1uzcd8BYOXjpyx+e1wo3KSzimfHckUhv
	Rp5VBYY97WvJPr1t4KByyhQeXnBcKZ+FRkgTiMJnBTi+vcB97Xkv/f2emuDnl6JFzUHarC
	MDPxOvilfdm+qWScvCl7qiuZqEWrpK0OoaZj1nPdmEIN00I5sCvqDkPWU5G0rA==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vdgUFtkm94mHMBHalEL+1YJRTb25XyzuTOkQ6dZPhg0=;
	b=QBi/+FcS8hxT72VHRf+1mvhqm0ZKUlL0BLSASB8vkTCHXSOoS5+wa18l8jctHiWDTsYSv+
	lT5PQTGmyzJHyme8ksiBgN0aQ/mxelnXw+91JLvpO8RMsMWLp8hjrPVXrTBkXWtGddgTKm
	n4aQ45mkIuXBEioFJ2vOEGIu2NlkYDsGXYZg8K8dvLPPKKh8ZTt01P/KseRomdJWDIR3Xg
	j5HP8IppXQ2TTsJ9nS/adjStX8VLYjU91bd88nBPcoBiCtRSRiQCnfmACVkoLzRioza7sE
	YMTxbofk8MKP4Qii+dEp9k2APyfXkR8NnBGdOBmezuxPxbIFUIz+axSyl4LkaQ==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] media: dt-bindings: nxp,imx8-jpeg: Document optional SRAM support
Date: Sat, 11 Oct 2025 20:32:25 +0200
Message-ID: <20251011183306.163564-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gcxiegt8bjoymzjuz9h7zp6547zejcc5
X-MBO-RS-ID: 44f7b4e555e363a6778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_113348_815063_94BC817F 
X-CRM114-Status: UNSURE (   7.94  )
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

Document optional phandle to mmio-sram, which can describe an SRAM
region used for descriptor storage instead of regular DRAM region.
Use of SRAM instead of DRAM for descriptor storage may improve bus
access pattern and performance.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
---
V2: - New patch
---
 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 4cba42ba7cf72..e3170647f44db 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -55,6 +55,12 @@ properties:
     minItems: 1               # Wrapper and all slots
     maxItems: 5               # Wrapper and 4 slots
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Optional phandle to a reserved on-chip SRAM regions. The SRAM can
+      be used for descriptor storage, which may improve bus utilization.
+
 required:
   - compatible
   - reg
-- 
2.51.0


