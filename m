Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D9CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J60ARZeoH6yHHNV1eYD4xYcbRcMiyJ2+7xTBX0Mu1kk=; b=ClsLWmvRUoOVfyB7MBm39iJQI+
	1l6Y9PcO3CUfjFgYs6I3E1klD3vWfMCwek+wDusRygKNuF9CbZLYrJ+pUeKCAMsTZpt7jCWZVuElQ
	eLPsLJQXPe32lBnm1cgflYhn2zC6jplED1wyLao/dleYN/UV8QOVUOP2ldQsl+OKssFto5w/B5j/K
	ZvmI8DIe4+MYazi+Xu5ro2fZ8m6rqvFqDs64WnZh2uhFi3Ozr2PdNLck3m/jwapif49xZsoSkXiGV
	QvBB90kl0uFAkAq7usTAxdinu+hGMNCo2JzFofaJYD96mLK0RRQfUrgI3lrjtAZaDn6FB4tVR3QBH
	sZFVtQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrj-00000008Lco-0TFO;
	Fri, 17 Oct 2025 15:59:39 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrg-00000008Lc0-18yW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:59:37 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp8dy37Fvz9t9f;
	Fri, 17 Oct 2025 17:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760716774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J60ARZeoH6yHHNV1eYD4xYcbRcMiyJ2+7xTBX0Mu1kk=;
	b=obDQn2Py2SUp9/20BiYE6hxzoR/hpzBb+6WjHyeoUma5diVDMdHg+lKkr3Fn9KWoSBDdhf
	sk00/195YjqLXuWJPWz0PXxLT9ykvWfxySuxgAAzwERVzHI1d5Ww8qGOTG4+AqAAGMruiq
	Qah6G+jhSSI1fZ0qXPXr5fAUN7pxJicwsLeDS56HJg9zxOx/8W2OgVILIzsKBQ2+C0GuXg
	HqAUfGUvUa3OugT/QTTqjhiOd+jFKpnwM5jNEcjkwMqCPoxAsJdKzDxIH2KZ2PT1PhOtGt
	1S7o16GZiUu1OgMSVstnFv5mmooPTZSVl7gGfGgVK02prc26wjlJxEgLwGXQRg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760716772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J60ARZeoH6yHHNV1eYD4xYcbRcMiyJ2+7xTBX0Mu1kk=;
	b=rnWa754RRvqAhRhWDfyzuzZs8RL91LnZBt/EjMHA6VzgKJKb8g2A6beVHFMZXaOTF6vYnQ
	tTeFniD30BU3Hr8n2wArG+f/Opjv2/bBmQvKXFhdipNQyfWrZxHIHbcAmxc2ZyI14lbznu
	YVBHRTx9NWzGGllt/ghjFpDDGnVM+ysQmpIh1M3TpWuX7Mj+PAw3lFwLfwCJKFscZFGAgg
	bUfL1FzZySvILeMLM6btMeCJrTKE8h1lBj3TEuS6t1meRcWL5aQANlCFRU0hXqAD5SRYqe
	TeGtO7pfJ0VSBk+w2A209/iB9kpv29rLHye9cktGV0A1NjmS5VNFsXQd7nA46g==
To: linux-media@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v3 1/2] media: dt-bindings: nxp,imx8-jpeg: Document optional SRAM support
Date: Fri, 17 Oct 2025 17:58:37 +0200
Message-ID: <20251017155912.109454-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 15328b960a1f61f18bf
X-MBO-RS-META: oz5spw445857wu1tgyok8r1xu8tr74oq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_085936_450651_000672AB 
X-CRM114-Status: UNSURE (   8.00  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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
V3: - Drop description: | and add RB from Frank
---
 Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
index 4cba42ba7cf72..7340989489da3 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
@@ -55,6 +55,12 @@ properties:
     minItems: 1               # Wrapper and all slots
     maxItems: 5               # Wrapper and 4 slots
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Optional phandle to a reserved on-chip SRAM regions. The SRAM can
+      be used for descriptor storage, which may improve bus utilization.
+
 required:
   - compatible
   - reg
-- 
2.51.0


