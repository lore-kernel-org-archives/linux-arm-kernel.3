Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F0BFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XTPTOzgWIzvWPxNyi6nl7Pu4rXDNr+FjMwz85mVxP+Q=; b=ajll115Inu1TJMm71rOC4wG+K8
	0lsDNFhJYJsEPDMyUhRIUUyBuqz4rx7raA8vqfthrTkeyhwnGmzjTBV25/beTv2yAhoV7GqMTtsqs
	iTM2TLA6Ms/yKhWNJVe4OXE0eUvXhhGk6o82Oy3Sqp0UPHOcqtfX39253IkY56SFdx3fDmUJ4elDS
	MJDXfMY0y9EquD77Y5TZ0n51Pl61S1QU/aPLHQCDwMJZHy8EM3WOTs1CRRGG4oexuzOR1wJKaOzmZ
	tZfREP1qdplWI9Kj9JSgJhmkpPLnzjqwMigc8auxtqeA/bWS3VFNg1tMIUNZp1QH3cUH+PyxwZzzz
	QjfGVClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGz5J-0000000FYp2-1OHL;
	Sun, 26 Apr 2026 12:59:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGz5H-0000000FYoh-0PCx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 12:59:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b23fcf90b2so88944725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777208378; x=1777813178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTPTOzgWIzvWPxNyi6nl7Pu4rXDNr+FjMwz85mVxP+Q=;
        b=YKkJaYpy6JaJs/ijPVIo+Y59uvHFtws2FqMJ1A4+LIVNXvprff4B8tt3yElCGvbYej
         kIUkE3ndfl3Aq8o41lLWFxaVBBr0FfzUEnggcV9w/SAMVtHYaI4n7zX/YoL1PGa3ejct
         OhDBs7xgpcoV6wT5z8lcPiPJ7W7FphiOTi5fhFyODNVSlELEes0BwHH6buEbY09b7KP8
         7JiybpTMYKu3JeWG1SWVu3McRX8qCgGSOuwUP+lbzZbW51HhA/oB6mb1mraexJs4IOeg
         AkpFYZYdD18DQpthM7rsPJ7fRovgwU2oEAcOinuQa3PhKblk4ehlomp7P1+WkaFz7qet
         tupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777208378; x=1777813178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTPTOzgWIzvWPxNyi6nl7Pu4rXDNr+FjMwz85mVxP+Q=;
        b=KCI3mO/7TOKKJfHxcapBYuX2GqG17av5jT/uGYQYGYwbaYEwlBcezcDH5IciOO9YIA
         Lx0VjuN+SSsFrhsNSnI1+dilp7qW7Qa+MZjZJNrmfDe7C5+wteeghXfJWjHoO1Q75zhl
         oo6aUDR/RXF9O/Ag4kj9v6bfxYFf4GZn7T1FoJfsDU4YZKupVlBzoZE98eFXDEQvc0F/
         Dd2tk2wRm/M+l8rkMUnehw1tU/tXG4aDFiZOU7Q2+IeeTgd85zzLWFxSKrUh8Ib/Eb38
         1VblWJVKjNhT6aFW4eX39ZipAAKlYA21okbeQGJV7q3pdXfS1TPhEXMco1i2Ipt6kSWn
         GdMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6HB0Sxd6YDmu3LVyiIv+XqLrTai2AQrIA4Fzb1v1sx/aMq3mWUn4JRyQZ8jRpTBcJnmcWyYsfiPUsadqGf58e@lists.infradead.org
X-Gm-Message-State: AOJu0YwxdsATHmOUSKDfzujFe/tSVB5GybJlfhYZuC6/VqGF3Vb6yYVJ
	ImGxlaoURiDCqzLzp/8tQPkd+s86cUqeLltfRs/rh/RfK98g79ymXDQfmON891k+kQ==
X-Gm-Gg: AeBDiev2Op73ZMP2/fezqUdAzxf698iV6G8rv2CNSJFlnhlZxH7FM5bo0hAAFVVUmPi
	bBLlghnJLaVPrwO5Js0gqeEJl2WvvUdMteVVJZINeBj8u2ALjmFl161ZU84T+bAWdt/xso3HFDZ
	ZqYORxtA7NJ4Pp00JgISx5Tf7oDpxaGWFMXb6m6eKn/5+SbEUeDMMtWKvs1wt9GyIlo+0ZYYX7E
	agQNZ8RyRK6VVcm287RVLNf+kQgfsYl8U3LF7pDliV9F6ySyvb4khumRRGE+0OzyW7zJI4nT/fi
	KWsZgyPtpDHk64UIo1qpNQEPVZG0v8bbnfox9v+DVVgolTqna4onx2xH0FLjNNHfVV2pCWTg0oj
	u/xe4SxBib0YaxiFT4NJz/5Sq0AeW4R3wlLSLMW4NMOmxMYPiQu5474yR5Ubu9lnD4Xu1+MGxPZ
	rQ1g5sxvk97Z6Spn/yaDTR5sjpV3Xl576Rmlgy5cPuNzIspLa0UJ/Jqo/LRbKXKnlWi5VAccMmR
	2PF20qE8A==
X-Received: by 2002:a17:903:17cf:b0:2b0:6829:9414 with SMTP id d9443c01a7336-2b5f9e64c6cmr396098325ad.8.1777208378015;
        Sun, 26 Apr 2026 05:59:38 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20c6asm252710075ad.58.2026.04.26.05.59.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Apr 2026 05:59:37 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: sun4i-csi: Clean up media device on probe errors
Date: Sun, 26 Apr 2026 21:59:11 +0900
Message-ID: <20260426125917.53665-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_055939_182946_EEDC13CA 
X-CRM114-Status: GOOD (  15.10  )
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

sun4i_csi_probe() initializes the media device before acquiring the
MMIO resource, IRQ, clocks, reset control and media entity pads.
Several of those failure paths return directly.

media_device_cleanup() is still required after media_device_init(),
and a failed probe does not run the driver remove callback. Route
those errors through the existing media-device cleanup path before
returning.

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 30 ++++++++++++++--------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770..f6798cf0a2 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -187,37 +187,45 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	csi->v4l.mdev = &csi->mdev;
 
 	csi->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(csi->regs))
-		return PTR_ERR(csi->regs);
+	if (IS_ERR(csi->regs)) {
+		ret = PTR_ERR(csi->regs);
+		goto err_clean_mdev;
+	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	if (irq < 0) {
+		ret = irq;
+		goto err_clean_mdev;
+	}
 
 	csi->bus_clk = devm_clk_get(&pdev->dev, "bus");
 	if (IS_ERR(csi->bus_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our bus clock\n");
-		return PTR_ERR(csi->bus_clk);
+		ret = PTR_ERR(csi->bus_clk);
+		goto err_clean_mdev;
 	}
 
 	if (csi->traits->has_isp) {
 		csi->isp_clk = devm_clk_get(&pdev->dev, "isp");
 		if (IS_ERR(csi->isp_clk)) {
 			dev_err(&pdev->dev, "Couldn't get our ISP clock\n");
-			return PTR_ERR(csi->isp_clk);
+			ret = PTR_ERR(csi->isp_clk);
+			goto err_clean_mdev;
 		}
 	}
 
 	csi->ram_clk = devm_clk_get(&pdev->dev, "ram");
 	if (IS_ERR(csi->ram_clk)) {
 		dev_err(&pdev->dev, "Couldn't get our ram clock\n");
-		return PTR_ERR(csi->ram_clk);
+		ret = PTR_ERR(csi->ram_clk);
+		goto err_clean_mdev;
 	}
 
 	csi->rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(csi->rst)) {
 		dev_err(&pdev->dev, "Couldn't get our reset line\n");
-		return PTR_ERR(csi->rst);
+		ret = PTR_ERR(csi->rst);
+		goto err_clean_mdev;
 	}
 
 	/* Initialize subdev */
@@ -236,13 +244,13 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&subdev->entity, CSI_SUBDEV_PADS,
 				     csi->subdev_pads);
 	if (ret < 0)
-		return ret;
+		goto err_clean_mdev;
 
 	csi->vdev_pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 	vdev->entity.ops = &sun4i_csi_video_entity_ops;
 	ret = media_entity_pads_init(&vdev->entity, 1, &csi->vdev_pad);
 	if (ret < 0)
-		return ret;
+		goto err_clean_mdev;
 
 	ret = sun4i_csi_dma_register(csi, irq);
 	if (ret)
@@ -266,7 +274,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
-err_clean_pad:
+err_clean_mdev:
 	media_device_cleanup(&csi->mdev);
 
 	return ret;

