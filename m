Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59BFC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 23:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ak3a7+5iHL+DI779EzdC6NLfZP9M06vxpEidoqxCeoA=; b=z6xBUX+5SKvrdt8jliIXkJOYDQ
	OMnxkQnU5iz3lsmo8OsRYITc6432eBO+MnZndczY9xYum7swNLawUPY8acOQA2CfZHNTfzRHb94Cx
	MhPYOV/drpGQr64RgbKn6hl/D+LbtKOcOTVPKCOEkOhhVjGjKrvyTa7u3ff7HWKHg4IdmSJ7w31HG
	zZyD6LfAoU3iraugb0cIFnNWf4Ng4mRsW8zo6k/nSGRzlIkdCsuBBdfzYkLv+evyFK61BeVuGCiWK
	V1QAUkl3hNdBvzgPoQyIUXhFJWt6fakTpHTMZ0E0+YmpIEuCbNpEZultv3Hr7RZeOui2EY920NiN8
	rVd2Tv0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnPEV-0000000HMho-0k6k;
	Fri, 24 Jul 2026 23:23:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnPEQ-0000000HMgu-0m9Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 23:23:09 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so832990b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 16:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784935385; x=1785540185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ak3a7+5iHL+DI779EzdC6NLfZP9M06vxpEidoqxCeoA=;
        b=JuuDqxOWsJk0jZ4J+R2smbu21zZiuL6Z2KfagRUAL2BQI2OOuIVPb7aEJ4ABWReNl0
         cKI1NpAduTljv7Ez6OXk6QJKts9lxPbj81SdQBAYrHICBUs2R2/eU+ZRcIBpCeOmwXOO
         AdzfzzgfGhvOx5Rru8rPlCDQu5vWoe1cpF/ZW8OoCqGMiFl+XjHUBes/VpBaypdZVMg4
         MPWhwLB3Xt8SS4C98TDle4w6z7KxHLPuabJGIHgGOyWgkHYYS11oR8A7Ootqr9BjT9hf
         OxKHrdGcbK2Hx7dmLR2Kf5WQbVnEDvTld8zreniXEkFicUFgiBL3p/iz5QvQvkhK5Ur9
         e7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784935385; x=1785540185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ak3a7+5iHL+DI779EzdC6NLfZP9M06vxpEidoqxCeoA=;
        b=S/2Kyh7boI4l7Hquyto8MWbRUIWm3zYUjqxJDCejPmk98PRGIGwaSsijMMCKSF0eC+
         10Js6YD69cFOcEk3+LLyFyCrkbk/IaiBORc+42bhCCemsgNOaq0BmCWtIWRkAqrAxWJy
         zOY4RnHVG8OsRbCK3HD392PJasbkc2n6GtLirFyGBleCYzHXfuySxlQNe5EztIufPQ6d
         lbh9kHIPL1NB5xMwv1FzIpQGgMeVmZLpwqqfA2GJKPRtpxUVd31kQjd0mUWGv6c4vBEt
         Nh2NP14wW0yAJLauNOlRcCDoa1YfOudT79joRHBrrv1tctFBMU8WPCGe2JCykfg3MLzW
         yyfg==
X-Forwarded-Encrypted: i=1; AHgh+RqsGu6Pz8Fj9qwOFt2OhjWrlvOC5Tb+qG6dXk01dJM+3ThrHY2Mc1YIo11fpQ5a1gtNyNF6QECOe6eNVgu6uVcT@lists.infradead.org
X-Gm-Message-State: AOJu0YwZfaGsbLEI/S9XWdcdqQfo1G1gh6LqZS1dcNvtsYyGRaOUTwfG
	Rj/hqyWm+OHxA6V+Tjge0r15sS2UDqYEn6m2DCTrJiO9Gv/OXOPYvLI6HqcS9Q==
X-Gm-Gg: AR+sD10a17st3XasUfmd/yfjvtwbSQ+I7DGEBsgCDVbgxilABNBuRQUhoRJ5tVe9CwS
	U0KLb4AXRTgg+NZdl41zsMh7YzI8sWiBkEtCMBpPXJ3m0snIm6GWKn6q/+whEQxC339IlT06itm
	WdtUD/8ajCA9X7fQqhv34rfq8KXcjggeqiKtpbLR2t8KmYDbDI/4DSSCODYVZtgVhrV/Q2y65Y8
	+6oHAXZcsL9V2dz2sceikfBhZTi6LF/wayUPj166JbMEVI6WIlJDkLXuPnqnZESna2dYatUgYxz
	QXJcNRy5/oQIuQBd9bmjDvCl4xPRTeZbWK6NgOpUZojWMfVnaaKQ61/r3+yiciVb/6dFkqyVwf8
	qi0Uzmez42XK5OzHp58hrKEGnOVvgAb15b7DijCqRCnpqVxhqwvlNFjSVEb+2/e0k/azoyjv+UP
	Jk6QrA6a5ri1/4R4CT+tc26B1Hw1oCgTXm9wGtruTrvn3L1JETGuwhtZHmTJKQzXzxHXTshLugA
	4zFrE0VF547FcfQbV+8CcGVkfSzQ60lDfV10aQTEIuormahHh72QHU=
X-Received: by 2002:a05:6a00:178e:b0:84a:2d5c:528c with SMTP id d2e1a72fcca58-84e5958d84fmr206478b3a.61.1784935385215;
        Fri, 24 Jul 2026 16:23:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm510545b3a.44.2026.07.24.16.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:23:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dma: at_hdmac: add device_synchronize callback
Date: Fri, 24 Jul 2026 16:23:01 -0700
Message-ID: <20260724232301.50237-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_162308_392574_971542DF 
X-CRM114-Status: GOOD (  10.89  )
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

Implement the device_synchronize callback for the atmel
DMA driver by adding atc_synchronize() which calls
vchan_synchronize() on the associated virt channel.

This ensures proper synchronization of pending descriptors
when requested by the DMA framework.

Assisted-by: OpenCode:Big-Pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index bb501c0baa7e..d587f5809814 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1617,6 +1617,13 @@ static int atc_resume(struct dma_chan *chan)
 	return 0;
 }
 
+static void atc_synchronize(struct dma_chan *chan)
+{
+	struct at_dma_chan *atchan = to_at_dma_chan(chan);
+
+	vchan_synchronize(&atchan->vc);
+}
+
 static int atc_terminate_all(struct dma_chan *chan)
 {
 	struct at_dma_chan	*atchan = to_at_dma_chan(chan);
@@ -2040,6 +2047,7 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	atdma->dma_device.device_free_chan_resources = atc_free_chan_resources;
 	atdma->dma_device.device_tx_status = atc_tx_status;
 	atdma->dma_device.device_issue_pending = atc_issue_pending;
+	atdma->dma_device.device_synchronize = atc_synchronize;
 	atdma->dma_device.dev = &pdev->dev;
 
 	/* set prep routines based on capability */
-- 
2.55.0


