Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C73EF3D318
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+rLnJ3aJ6D+F+fZbg2d06YcvZPxOEiVrOGPvy9ur+c=; b=ig2Zlb3qeoYYMYZ/Jic2ROjr2t
	Q8zChlyIx83Va1JXGdcTcnd/0gGlNmW26gKuk+3SHRgi+EnbNi6NjyO+R/+iPuBBFBfcQRu5qPKi8
	PwrzYZM09OHzOlhQ9cRxtRaQ0B7xKIhFY42e09IvlI+jdhOrFTMvtRRciSntZ32peir5n8+ScgDnC
	zrk8kZy88Nk5/PSTyyBosxKjEY4YrUhfUk6ybcY2iN6HH5vN7hVoXG++qSTrmk1vsbwxBqJE/Ul/g
	FENGTKQUGKvJGziikq30/WuBU6EbBrS9eXrR3s5Rk/TFAhaB1KmM9ehoUngU37SEDo1UTLjj1oJyE
	XJX4ibrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAmT-000000028Nu-2XTo;
	Thu, 05 Mar 2026 15:38:29 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAmR-000000028NF-0KN0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:38:28 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-826c49b7628so5212967b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 07:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772725106; x=1773329906; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+rLnJ3aJ6D+F+fZbg2d06YcvZPxOEiVrOGPvy9ur+c=;
        b=J8mHWCkqlam2c7O9G37hWOEVUkF/thLl+MZbHUo6EanCJqLhPGLiHQ4qliITopFLLL
         jB24Z7OAYt4TC0S3ZUNfj6U7jOE3KT4dllQEK6aSlBESr3FuIB4VyTi1lAu08R7AJ7+8
         5KnltVhkz5S6vwM0oYlhLsGgO0B0cFVUEAC8RIbD1ED3BszeHA1w8jU6EBk4Ww+PteJr
         C63gMufgWt/700uOvNUKRU5Uz1VLSfUsd4YfGHsR16xQRIoCib/l8Rcw+eAq7KMRKB50
         EVGZs08Y9esnCrUrUp86fGSUdmBkTW+ISIhJjz01kvCtwmBv8SRXWt3BvThCZ1+TIBQy
         FAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772725106; x=1773329906;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+rLnJ3aJ6D+F+fZbg2d06YcvZPxOEiVrOGPvy9ur+c=;
        b=QQ9osQgt+4zzW98I/cruY2+btnH+rPzApdw2IM5zMDDZAH6ie4QgfC66YNcFUxg9A3
         prlUbvpMQkvCNJtAfRbO1ndLOT6rt0TLa9ES8SFSFbjs5gfdfH5WA0sdEb1ZoMU/7fEh
         GDiXWy/HSmEToiSrEZGpXmIqoRRIxnG71yMk3+QyIJ9v0XyVdQmbh0U6wRiATCqlhLGV
         eKjHDrx8h4w0mnchxMkFGOAv0RDLUKcbIRQE2gpZzRCpuWIYpBZHEMgbZ5kaKSU5lq5U
         Koin8+KCj63nBYwrdcHKYgYh5Pu58iwJSWCCV1tEFeakAH3RVr1nfcqEYxRmKcTqKOKK
         co3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWDa6P1dzhrs7mcS2SEudBRBFps5QTlSaM1a3dTloRbluQxO7JxB0WKeldkgEvMArEai/iAgqJu8BPeozHhBlQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzdF/0bISz/n9fgckYhSr4+KMDfSaAKlCtNVdxDKFnx4Qrzcozb
	qppWEmU7LcZNq/nn4I0ePrthjux+sj1qj/OILcU3+70ra1XhzzbFjc0u
X-Gm-Gg: ATEYQzzkan5rG0iAHUoTj47/RS5I6g5taOi6/w+hOLq0FZnS4BdSjFLWLyJAittWvc/
	JAibKcvThgDqgpY5ZV6W8QoWEBLak4Xx84qno6Q4mi7zWw3NgdAxXvyZU0SC5bCcdsmihc5u1SQ
	eshM75wcoRVKD9gHqtvUyi/RRtcZdD87+DMIb29qhqMirc8yhu1jycOGjg07zBtr0mnqk8r0Lje
	hZjIsoEkSeQZj/puhfBMGr9VM0gu8LRLOslKQb8ZG2x/L7Ko2d8sph0oGS1BMI6vkyFzelaTUM1
	12HvLuE8bdyTtrMR+98SOrnns3BvYcA3sohk5Midx5u3qKIYZZT/KZi8Za5BEUtcifzPOORTQjd
	CJrR3BLrSa2cj+cgsaQYmlzPXU1jQnwiMkVZmCxX9qMIdt7FSgE4q5o9Q/XCdGfBF8h0sPbiPfI
	4x1ONMW3BDE7VPtn4DUA==
X-Received: by 2002:a05:6a00:3d4a:b0:821:7d7e:41d5 with SMTP id d2e1a72fcca58-82972cce807mr5929465b3a.52.1772725105728;
        Thu, 05 Mar 2026 07:38:25 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2::3a87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8297d3d6aedsm3376850b3a.31.2026.03.05.07.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 07:38:25 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 05 Mar 2026 23:38:21 +0800
Subject: [PATCH] spi: rockchip-sfc: Remove redundant
 spi_unregister_controller() call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sfc-v1-1-6fbf6df0e899@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGyjqWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNT3eK0ZF1jA3NzA4tUy5RkM3MloMqCotS0zAqwKdGxtbUAik9DnlU
 AAAA=
X-Change-ID: 20260305-sfc-307708e9dc67
To: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jon Lin <jon.lin@rock-chips.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772725103; l=1268;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=abxR5oIsLcrkxbLIHiQZCFRJOUOd6Ae6V6Vg+uXUVjY=;
 b=J6tc/xqw+Xy5g7gTlKOpBVM1cXwg5atz100uVzTGIdf5HIjfSEWQs+6wpbxq6GRY/zxwHcmAr
 vgb60XU41OnC3/BsuE0mAYuLmktzO9OE35d06KPi0QWgA3YedwXJ0WS
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_073827_144373_C52E1888 
X-CRM114-Status: GOOD (  11.03  )
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

The driver uses devm_spi_register_controller() for registration, which
automatically unregisters the controller via devm cleanup when the
device is removed.

The manual call to spi_unregister_controller() in the remove() callback
is therefore redundant and should be removed.

Fixes: 8011709906d0 ("spi: rockchip-sfc: Support pm ops")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-rockchip-sfc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 2990bf85ee47..19e832f045d2 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -740,9 +740,7 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 static void rockchip_sfc_remove(struct platform_device *pdev)
 {
 	struct rockchip_sfc *sfc = platform_get_drvdata(pdev);
-	struct spi_controller *host = sfc->host;
 
-	spi_unregister_controller(host);
 	dma_unmap_single(&pdev->dev, sfc->dma_buffer, sfc->max_iosize,
 			 DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));

---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260305-sfc-307708e9dc67

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


