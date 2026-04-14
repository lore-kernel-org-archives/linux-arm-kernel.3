Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEB3F9D0EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R0CQZ/qrW+yRPLga1sILnx+THT1hscnrJSpkR4Elps=; b=x6zkZQsPOMh9pRpPORPM2sslNA
	B7LmWsnyp7wp961PuWOlDobppB4CttKPzuAwqU3PXgLcytPffFKUxahYHEI61H5ZgHUIwu+tWadKn
	7u83/a81qG8JUVifyLHI0/egJe8jikRBupq4zIkbPJ8gC+LOBdNNOfgH6X77LTNonBjTtCn4iTPMg
	pckTV5BhfaTeftoIOeIj1w1OsJiiZxsAe8JBlzMZYfH3hieOCsaUst7bN1t9muwF3bl7DYpY8ScRG
	LzwkUfdSEX9SkShdi3ZsILKzRKuCuDl71qug45IqpOL0zh1Qr9TG3pbOOBT2V+tcwWsTVrGxT7vD5
	PRB4OhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wChyv-000000004xT-0Yje;
	Tue, 14 Apr 2026 17:55:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wChyt-000000004x9-0hF2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 17:55:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso55841725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776189321; x=1776794121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4R0CQZ/qrW+yRPLga1sILnx+THT1hscnrJSpkR4Elps=;
        b=syhCsp77dPnoorxJbpp7SN94wj4t/T8SbnlS+c3TqIHh42eI/wZxoZSO/wW8/+Cbww
         4vm5mvW1xYcdX4Q6JWBCRiXiyIQrFqjsnL1+9VPfffQWTxxEewlwILcTOlspun1qQOWe
         8fmBdmRG00RRV7WpOhYRapEVbkX4HxuDNMYTclYoKX05EcVA1RF87tDGkGmM2KlZH4nF
         OVr0Q+V8xoDIRmuotUSpFyOlcRdfqtC3l/AUFcR6zCOG4wGD98eue4UVRZjJ8X13eUup
         wh8iEPhNPpJQOIZ4n1HBk9Dhum9gdn5bkrwCD1eCw09Xnss1o3cavmk9r+afoANB8g1w
         VhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189321; x=1776794121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4R0CQZ/qrW+yRPLga1sILnx+THT1hscnrJSpkR4Elps=;
        b=c01aRX8xz382zhOqLTz1hv4u7T2KTxXyRxA4ocJutk7fmaGGB6PYJ5HWjlXQd+FtEn
         /R+TMBKs2lkdR60WXHdJ3fc7ZI/hvik4idCnkz+DCgOhW61Rw59Fv8Ksr1t5oCzRFTNf
         ETN4uW6PbANRTKSjA8g99vudSs5qOA5mUrPpPPKF1kR1aQUmnbmwdrxCcL2KP4hf5Dxs
         RKjr9A78MGX9W/KUELpI9+1rt673+BtOBnCVxc18BEJjKBHuqaZwn/dWxDBUeIuDhGV9
         VW4XMxBeixgPsSz7pqEsppZp8CKN9Fbc7hu9CmBKCDyijTWvdMVNa7D3twZUxdiS+1db
         iWdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NKTxFdLGTYA8xQtBCBG4sGtz51eva+dG7ptpqeBRCPI1WfHEEFH19DfB4BTO9pYLM8nBE8IMrJ6zC+SqibhUF@lists.infradead.org
X-Gm-Message-State: AOJu0YwbR6JEmypDdGrMZoFdqxVAUtUFD10JlybyRFT0cqRKIq1lv8Y4
	GSqngAXLzgCaLjZcQ5memQ9pUBbk+Sb+Dn+QNeD/+eEGbeoC7wHtICH9
X-Gm-Gg: AeBDieuGcYYhCJmfjfpx/AOPEAUCPKKKWEcBh4c7oOJGCA9x005lN6K7n3+WjQIJenb
	AssY5oSYzgtgj/w5toc4T44qWT6P/+WZkU48eJO2jwd5QBfYTKcr0GSX5KihqDLEhXimNw6IkIK
	YcyssIKdDZlhTE1HHS9cE1rjqfms8GxRI0fM9ef63RQEK+oD8+EkTYHWavvU/0VNNDIRttU1L80
	IJd/mAR+xftQjFtVFt/JrMdHtOXZ7ONbr6a2eqRMxUJviLAvnXqk3niDiN4doK1QLWBzCS1LoNG
	I1S3KYAM/yEqhdH9rAe61bdw2chjeV0Ox66TBROrVX3xaBn40WQ2+DeRIQ55cyXSH8EE/mWBucS
	QDVYxTwnoAx8DWv9JFBLws9gDdzrknszpB9cUR0FIy/dItcf0kr5ImjehpKKm5l+RIMUI/kEecZ
	vxIOMx1+r9IyxGD4jqqSi6duz+5tJaHifd3npwvi4zxM14cTn1/bH5RJGWWane
X-Received: by 2002:a05:600c:c088:b0:486:f4d2:eac6 with SMTP id 5b1f17b1804b1-488d67e6776mr181720905e9.13.1776189321058;
        Tue, 14 Apr 2026 10:55:21 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:cb49:f403:bb20:cc84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1df12sm150436425e9.4.2026.04.14.10.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 10:55:20 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2 2/3] drm/exynos: remove bridge when component_add fails
Date: Tue, 14 Apr 2026 19:54:15 +0200
Message-ID: <20260414175417.144625-3-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414175417.144625-1-osama.abdelkader@gmail.com>
References: <20260414175417.144625-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_105523_253754_CED179E3 
X-CRM114-Status: GOOD (  14.00  )
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

Use devm_drm_bridge_add() so the bridge is released if probe fails after
registration, and drop the manual drm_bridge_remove() in remove().

Check the return value of devm_drm_bridge_add().

v2: devm_drm_bridge_add instead of drm_bridge_add + goto remove_bridge

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 29a8366513fa..e68c954ec3e6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -423,7 +423,9 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 	mic->bridge.of_node = dev->of_node;
 
-	drm_bridge_add(&mic->bridge);
+	ret = devm_drm_bridge_add(dev, &mic->bridge);
+	if (ret)
+		goto err;
 
 	pm_runtime_enable(dev);
 
@@ -443,12 +445,8 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 static void exynos_mic_remove(struct platform_device *pdev)
 {
-	struct exynos_mic *mic = platform_get_drvdata(pdev);
-
 	component_del(&pdev->dev, &exynos_mic_component_ops);
 	pm_runtime_disable(&pdev->dev);
-
-	drm_bridge_remove(&mic->bridge);
 }
 
 static const struct of_device_id exynos_mic_of_match[] = {
-- 
2.43.0


