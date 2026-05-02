Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0922CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 06:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Szko83JYninv8P7/ry56S2EbzBdJ5J0YLPwpoWRzN10=; b=ZxeHmz9JeasgQFVhD8woaGF0gZ
	pb4kxjpdeNJPFnXKfKgt3MyxKb8187nUvbKqmQBcgPgQX9WE4KslZAJuT5jhBvyjGJJTZ0lws4ax3
	5pB/EtBFNsrjn+0Uj3tdZVPKFanF+MvsYPVrRBPwzZ+rubfjgme056LXmVbd/2M1qNy336XW/2BVg
	p6ScDn/m6mrvPUeOBV05VT0s1Dm2CAybRwcjOlfx3CYg5+/TauoMd5TZrm48tgkeRRV1XDuPOH+Lq
	rdMkxip16ImEGyCUHIJV1jiGJ22ttcOHHJCB4JV0yarmc5cyVeNqmX/jcp1jCCegx5c2LD1sksaCm
	12o+u7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ3ak-00000008PSp-48a3;
	Sat, 02 May 2026 06:12:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ3aj-00000008PS8-07Wu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 06:12:42 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ad9f316d68so10044395ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777702359; x=1778307159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Szko83JYninv8P7/ry56S2EbzBdJ5J0YLPwpoWRzN10=;
        b=mie1ifSfB7mYDwHQWCPMc7yHQbmEcHjhbYnCRALiazRGedn+UtWHtrTDVmRdgGdSnO
         g/Lzg0wXpklAR+CTTZDtdWzS+ROXIRV8bf1DqaRzPQOGIdBVFH94rbC3xgNF0s4nmceC
         tzycSx3pzYXZFkkQtOMxcE7p3rVXqMhIBZEzW+13YaMaeID1bX+I2a0gvrYWTlXxYg/B
         z29vxYKzs7XvcF3j9qXWc1Rj9ZTlh3It/xxK5u7bLayUHB/p0Qb4NCKRMPJCqIdEw/O4
         PVThGH/+Ii9cfq4l8w7ojKsZosHjX5LGSGkovqxnQYLr8C5QYOf67t8x7Sjc7YWas0Br
         hF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777702359; x=1778307159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Szko83JYninv8P7/ry56S2EbzBdJ5J0YLPwpoWRzN10=;
        b=oIzFTvm0FVMCFJDwVBB6kE5vnpJBLyLngSpgZS7UYiqd9a7iCvniKYdpkwA2w0DluE
         RA0983/PMawfICxF75KOl98i79GzjdsgB7KoB3wSZeRobaYNVDxvv5+VSCciIgBdlqbX
         KTeYRBGJaoGm5g1RZyxr1wH8Fx/Yb6y+tOU0RcX5BLEhJO12YzQKht6cnrtnn1PohfE/
         afrML9EVRhHpq2bhACMj70fapx3NJQCsO2gCxG12HYh3LDPNWF4RvyWe4DWa1Mb2JWWX
         BvmdwjiWeuXRydkGN3lB/f3cBymqxMdpCdCl0FmmyWUZAa4ry1fTI9yZ7RtkCOBO3lF8
         VTTw==
X-Forwarded-Encrypted: i=1; AFNElJ81xPiQtNFRs4wrrGSdtkxA1W0PpuktFmfjrvRra4EJi5MqCGkXDW66sdZNdmHjhKlHEQba7esZWsXx9nkPoRMd@lists.infradead.org
X-Gm-Message-State: AOJu0YwLr1TuR/SL2fzUjgp8figjXrm2TR0c50VULtDnJcvrYJ68Otrn
	lwcnUh9TQ6OXqlM7pJDW7NToWPcSdQaBNHIpN5QazSH0MgewZpGoWNc=
X-Gm-Gg: AeBDiet3OW2Ck1gIp+5igQL863KIalvGO+3XOUtNqOBkhgQuIPY6rq0Kjms+8dV9iwU
	g/tKm8X32fN46jdqHWar91kCQnRjdBQAPB4OTDrUfRsoGT+zkDrQrhOwOeZRGATaxD8C1ZYKzy8
	cKy1RuOYLCuK46LRJqNgUyXEqm0Fm+im8VDppgrkT+Zh5Xp9MfsfUZhQj42azhqJ7pB+l9i4+/Z
	A1owmzk2JNefxPoe81QlDnvrHo5pTb9JpwuoVfrxmWzThai++YfPel8QwZULDvMLnPAcOQjrbWH
	UXHyAoB8FOzN0l6GZzPDyhPc4Z6E9budSEi3mZoZFqaYae3Y1BYJ9MIyhJbVrxaYH8iCviuagXI
	PA+Nm/wxe36+4CwxeHQdz45q0uYo+rlB4c/HfuXpQ09/TiC8d8BZp1DM7VJrcFgqHlBsN0gsQZN
	8zTZyp6XbswTkBzf5rcIM6IBFkfC+V8OWiioqWEug6c2qTErviJ7j+aJ8GEkYCkoRZjcjjyQnNT
	A4Nmqgi6g==
X-Received: by 2002:a17:903:3847:b0:2b0:9101:1b77 with SMTP id d9443c01a7336-2b9f2586e79mr19418775ad.17.1777702359380;
        Fri, 01 May 2026 23:12:39 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae54860sm37981415ad.72.2026.05.01.23.12.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 01 May 2026 23:12:38 -0700 (PDT)
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
Subject: [PATCH v2] media: sun4i-csi: clean up media device on probe errors
Date: Sat,  2 May 2026 15:12:25 +0900
Message-ID: <20260502061231.50473-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_231241_114552_70E5AE51 
X-CRM114-Status: GOOD (  16.54  )
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
Changes in v2:
- Fix the remaining sun4i_csi_dma_register() error path to use the renamed
  media-device cleanup label, fixing the build failure reported by Media CI.

 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 32 ++++++++++++++--------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index e53a07b770..a504a1c78e 100644
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
@@ -236,17 +244,17 @@ static int sun4i_csi_probe(struct platform_device *pdev)
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
-		goto err_clean_pad;
+		goto err_clean_mdev;
 
 	ret = sun4i_csi_notifier_init(csi);
 	if (ret)
@@ -266,7 +274,7 @@ static int sun4i_csi_probe(struct platform_device *pdev)
 	media_device_unregister(&csi->mdev);
 	sun4i_csi_dma_unregister(csi);
 
-err_clean_pad:
+err_clean_mdev:
 	media_device_cleanup(&csi->mdev);
 
 	return ret;

