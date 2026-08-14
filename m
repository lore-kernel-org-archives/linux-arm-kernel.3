Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA967C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OUSt8iKsvLES1DoWZPe2NRZJAWICuOCKAgFaBxq4B1Q=; b=M1ycZbzuA9m2yHw+bA4BYB7CCN
	UtOSumA6qg0T18DRsvzUH0SArB6NeP7pdhOd5PfMp/c5fbGzGGamIsQtyxYCT3uyDiG3rXHyD0J5g
	rEO26baWdgbITOIHqiJT7m+vIno7zTYWQj/yCtw5mPQ9BIOzL4ncwj/B6JHgYtxeGTuGpVOG8boYA
	RVxD1N3HoJBJA2OkJKvOTL7IJOl0OtG8WKRnW4g59P53krDWUkC0n5593KjFzer37hX7S0YjZAUuM
	dPT1EQzCFpqkelik0PR0+QdYH/GfNqitlg/2zbI9OuVkHOhdcdwqOp9gRWkdbws1kOpXPuNae/hov
	n7XP0utA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wus9M-00000002jhf-293l;
	Fri, 14 Aug 2026 13:40:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wus9I-00000002jgw-2ThE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 13:40:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cedda2ce6fso7228385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 06:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714840; x=1787319640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OUSt8iKsvLES1DoWZPe2NRZJAWICuOCKAgFaBxq4B1Q=;
        b=MQLoNjWHds5NAAtY6SQUpO++a4fEHlmr74QJE/+Jf4mbr/G4UqB7ahV/crdSOKORsK
         37XDC4WFzljO3mADkkeRCRVyRvylM7XnliDPRWIFr7/QH9gtrzuLICYQrwEUCFPko3wC
         QrFUCFpcQC67kZAZWfe+/BvgHhUIwf5EKtFJI+mVbW3do4C9wwNZpLprf35GQTfWwIQm
         oXioRI5T0h/ZXtBeUvCUcXPMzZrLODgcvcNwLntqohmmFyMqRDqcj8pM/pMgydP2NW9K
         Z2ezyiUCXDWN2bF67UlOt5AQxkL31JObvRHw2onXx8xySSfb1RVeZl603HI0nN4lwDIb
         K9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714840; x=1787319640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUSt8iKsvLES1DoWZPe2NRZJAWICuOCKAgFaBxq4B1Q=;
        b=ZLe7bzHlC8s/JWzW5W38tYF99S0LkW7tQpl5Du79w9m3vJ9fyjy7iVOXjal/1cLkN5
         sYvDytccL3yT5+X8wVepLEpOZc8cSWs26QCgPS8iK7HOKUmRrEPYZzXGi8oKZ3triZAM
         S2UFETs+YWU1kpbVmwE6VzD6wfrkleYTTUuG7bs674W8m/l4MZoG4dabyJs2I6JP5pgX
         bOGoSYXs7oBVxqqTeT7/0P8HIFlwPqe3DDf2DXUmeS/NsEwLT/jKNGZhiwLcGHGF2ieS
         651vn3/imJsuONyfPg0n5saqADkU14EGi5s3Gnku8tupLpiQeShZo15NKlV1hFz71JGh
         46LA==
X-Forwarded-Encrypted: i=1; AHgh+RoncTLHp4ENRgdFBb7nrgjsqaf1kTnlcCMnI/Uwv1cY+wuD2XJRuUukKCq1Ii0ORcHHRQhA/suOJ2s0uDcaRUsI@lists.infradead.org
X-Gm-Message-State: AOJu0YzfpKgXxH9M3LWm0NQZ85KHEwru2lYESpBcRTyr/aubDJfBI5fv
	yYtlWt2V7watABs2gTfWf6AImt2qrsXhQs0pbLPUqqilN0zTAUl5NIaQWGGPiSC4+I0=
X-Gm-Gg: AR+sD13aTp/z6w2H7P3eCpOJ72n4qNOVYm8r9+N6lluBeFzNH9wHo9n8jEnhq59CYIP
	FiVPDbciFeTzfDRizJlXR0WlTXEopwEJTMbxUvRKnaGBq9tfsiI4/ZVq6hmGsAuUcXQoKA2A4xb
	7OWcOpDqzCQ0Bfh1NYx5J8KgbP8u84Li93OnZYGDX+XznhFQWAzaisGWpfpP5KPTlLFP4gNSZYe
	i0F7V79OT958s/6EopS9X1tbvSl6JPc0qvzDD/jEDTx80yntjSikLCa2S1BpJQ/PvpiKnt9lHZe
	uNzc7XLwJ/yWtvMbLQ+PcKxtOmlUl0iBn4SCRl4ZAONYKFRJqLybfaBHLNOCwpZEQSgpSsvmE6V
	9erp0fZ3FSNbROIpo2NawKNy3zrvb/t9ssr0ilKZ9x1W7k20mBSRpIQ40TQYazYw/6ohiHTYsPw
	VXgao/aBIgeS5nqC6T8AtuzfpFv9dErxTUwsxey+/Urvqu2kV9+eosPDepeXK4Hx7LiCr04ymg8
	cKSqDJt
X-Received: by 2002:a17:902:da92:b0:2cf:9f0b:b562 with SMTP id d9443c01a7336-2d3b0cf922amr67711065ad.22.1786714839447;
        Fri, 14 Aug 2026 06:40:39 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb2a085sm9837125ad.42.2026.08.14.06.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:40:39 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] i2c: mxs: fix DMA channel leak on probe error
Date: Fri, 14 Aug 2026 21:40:33 +0800
Message-ID: <20260814134033.1386874-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_064040_635054_B04A713F 
X-CRM114-Status: GOOD (  15.51  )
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

dma_request_chan() grants the driver exclusive use of the channel until
dma_release_channel() is called. If controller reset or I2C adapter
registration fails after the request, mxs_i2c_probe() returns without
releasing it. The failed probe does not invoke mxs_i2c_remove(), so the
channel remains allocated and can prevent a later probe from acquiring
it.

Release the DMA channel on both post-request error paths. Keep the
adapter-registration unwind ordered after the existing controller reset.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 62885f59a261 ("MXS: Implement DMA support into mxs-i2c")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/i2c/busses/i2c-mxs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 4e07babea9c3f..a5c8b44ec8142 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,8 +849,10 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 
 	/* Do reset to enforce correct startup after pinmuxing */
 	err = mxs_i2c_reset(i2c);
-	if (err)
+	if (err) {
+		dma_release_channel(i2c->dmach);
 		return err;
+	}
 
 	adap = &i2c->adapter;
 	strscpy(adap->name, "MXS I2C adapter", sizeof(adap->name));
@@ -865,6 +867,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	if (err) {
 		writel(MXS_I2C_CTRL0_SFTRST,
 				i2c->regs + MXS_I2C_CTRL0_SET);
+		dma_release_channel(i2c->dmach);
 		return err;
 	}
 
-- 
2.51.0


