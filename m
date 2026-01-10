Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E95D277C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 01:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mRvqRARBlLlFVSu4cS3ROES8gW2l+6tv55cSmtfsrs=; b=a/UxANWvUl6lHqkbsPbjqjtYos
	+5bcLUyQByKfN/A+tFlR7h26OMRpN3d9ZtMmvTHZ+tikbuLLpEs1j7BJdQSXg0XZyVrXHzgzYWUOf
	doHhc5d40zTW37WcQKUZyga4vV2680SjZJF2rSWvYt50gkHJyqmK3BVCQMx24cMSTNHfAvCuY4fEx
	mS4xRB1xkGIXofZ+lfsVQ/XjJbBBJAbdJwwWsTPTg4rPhx1L0CeDjfraSodV+eV6sOxQQQsZAq5oC
	m4Ps5Sh8GdMTqQKHMRWmYHehIpVX2td+wUgS5Uh/7jThfqn9tnQTVk4FHyp6KmKd17gZyjPGnn2Lz
	via+IIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veNS4-0000000392s-04Mm;
	Sat, 10 Jan 2026 01:07:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veNS0-000000038zJ-0RES
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 01:07:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so33519825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 17:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768007250; x=1768612050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mRvqRARBlLlFVSu4cS3ROES8gW2l+6tv55cSmtfsrs=;
        b=ImbzUp6HLG6E0sLrrOAPLhJiUYP9Pxdn9puJBDHRgtx/gc0NkCqELTjc5bcpmuKeUl
         +k2fiVoY8Zld0MY+5rexugMji3kXfwzccOJoF/bZAvCJIe61gpqNRHyc5sc7JsU2Aitm
         jOnGItCOk7e2ZT8jLTFZ8jiT7eWTIzSyCkD311glthQ2acALE/uzwMInLFYnXYyO2TzO
         EIkh2bt13c+eWwgH3dXE7eGPXsxygnjkgOuCGU86tuemodULiRW5C2g05pPJ2IfLSCME
         YvN6Lrk/cRodcYUmlr4MPo6jyMLhI/+BLnomTFFs4splG9Zgixa1nFeWwkTK8zdS9kzx
         85XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768007250; x=1768612050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3mRvqRARBlLlFVSu4cS3ROES8gW2l+6tv55cSmtfsrs=;
        b=ukyyYAFVXgG1WQVL0+eMJ8htMbk3m+3NhBzCyw1x4z2Kmft0bgHMYrh3bepG8ZSZe3
         ZiLZ7dekDdy98lxV+BPARXIpjMe6GoI2q49mrtQyvhpErW61cmP1ilZm8M0inHyXyTQt
         t8Q41QxWCeVYaiEYXVOHg6PbHdD80ZC/9cRVpFoou6z0MHAUNGm05gwi/2hI2X7WL/Kt
         95jOzo9YEkvVHTUUK2B4HpQvWiqtf29DScmR8cq20zpEMov0Vl1gU8/Y/MY+ZKLfxE73
         He7XEk/zodZ4PKXI503jX3+0xf1mHywGFTTaaTrRatVZSdB8+zUGfPE5KlmrIO6vqpla
         xl3g==
X-Forwarded-Encrypted: i=1; AJvYcCUnQs1EUEWeIklZtgaTguOxPKB19mT3Up9fGiwDUCgqywjPP/oQ/aLSofQrVeiwKGrU6C+Pguux7qPowoXEyX3b@lists.infradead.org
X-Gm-Message-State: AOJu0YxLRa3acDf9M0xUjCbbw75RHaXIOETdzUMjzvIPsnq7i020GPDU
	D9COW8sHa+o7T65Nso4wTb+Y9kzlkg2+UWwsNuEVmHpIAt9MlMSsYxLO
X-Gm-Gg: AY/fxX58c9fhXZfp77avptKrC6oLokhXHapQhC0pU7Vi2I/+1SF2OHV8BxrnP0RowO0
	zDTM6OJpzrLc0xewD4HpEHumBjMOPALGGejs7I6HpKVJXD+Cp19PxYiSD0lzmjKOasQFxUxjUn7
	mL/SP4ZpXwkO7urNXlpJnjmQlMgvX6U/zmGWpgu2yPOpsqeqS7JQNnXUghiooCtgYcQO70yClzf
	HwUqimNE5aUbjYwAu0JF8+2iRIMBO8HNQuQ5QArxFXGBdWzU6QmaMHQVmyUxJocWjTIy9oGKVNW
	a80nOPeDHHUS0BSnZ0DGS17nzT+PfIhPDVbGuM9h/yOEd0jSXpRTJ97//Zl0mdSX3ZtugzChz5w
	+Kc7gdAlKDhVRBhQL3mDtw+PkBosa6/ydb7hCG1uWBnRHZYeu8R3gSS00/34m1bPh8zuF1eFEjJ
	qlCkJKk8CphnPq+c5FvsH11+bT9aU765DR7U/ImG5fsO+b2zrrqfhGiNJTzS78inUJdQD5+kM3A
	oJdTt8=
X-Google-Smtp-Source: AGHT+IEruxoVLQw+uvAQdMicgfFRe8XyeFbrLqGms3k4V0pLxVUBHW1PFuUJeUnVq2ysNptvW2pOWA==
X-Received: by 2002:a05:600c:83c7:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-47d84b52e31mr128613185e9.36.1768007250459;
        Fri, 09 Jan 2026 17:07:30 -0800 (PST)
Received: from stor1.home.marco.cx (ip-178-202-227-016.um47.pools.vodafone-ip.de. [178.202.227.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8717d9e7sm71779475e9.8.2026.01.09.17.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 17:07:30 -0800 (PST)
From: Marco Schirrmeister <mschirrmeister@gmail.com>
To: heiko@sntech.de,
	ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marco Schirrmeister <mschirrmeister@gmail.com>
Subject: [PATCH v1 2/3] mmc: host: dw_mmc-rockchip: add rockchip,disable-runtime-pm quirk
Date: Sat, 10 Jan 2026 02:07:14 +0100
Message-ID: <20260110010715.1610159-3-mschirrmeister@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110010715.1610159-1-mschirrmeister@gmail.com>
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_170732_158672_067652AF 
X-CRM114-Status: GOOD (  18.59  )
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

The FriendlyElec NanoPi R76S (based on the Rockchip RK3576) suffers from 
a persistent bus-reset loop on the microSD (dw_mmc) interface during 
idle periods. When the microSD controller enters runtime-suspend, the 
subsequent transition back to an active state causes the bus timing to 
become unstable. This forces the driver to drop the bus speed to 400kHz 
to perform a full retraining of the SDR104 link.

Investigations using the runtime_status interface confirm that 
preventing the controller from entering a low-power state stabilizes 
the link and eliminates the reset loop entirely.

This patch introduces a new 'rockchip,disable-runtime-pm' Boolean 
property to the dw_mmc-rockchip driver. The property is used to:

- Bypass the 50ms autosuspend delay during the probe sequence.
- Explicitly increment the device usage count via pm_runtime_get_noresume()
  to keep the controller active and prevent it from being suspended 
  during idle periods.

Signed-off-by: Marco Schirrmeister <mschirrmeister@gmail.com>
---
 drivers/mmc/host/dw_mmc-rockchip.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
index 62c68cda1e21..d3e5c06d80ef 100644
--- a/drivers/mmc/host/dw_mmc-rockchip.c
+++ b/drivers/mmc/host/dw_mmc-rockchip.c
@@ -538,6 +538,7 @@ static int dw_mci_rockchip_probe(struct platform_device *pdev)
 {
 	const struct dw_mci_drv_data *drv_data;
 	const struct of_device_id *match;
+	bool disable_rpm = of_property_read_bool(pdev->dev.of_node, "rockchip,disable-runtime-pm");
 	int ret;
 
 	if (!pdev->dev.of_node)
@@ -549,8 +550,13 @@ static int dw_mci_rockchip_probe(struct platform_device *pdev)
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
-	pm_runtime_use_autosuspend(&pdev->dev);
+
+	/* Only setup autosuspend if the DTS hasn't prohibited it */
+	if (!disable_rpm) {
+		pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
+		pm_runtime_use_autosuspend(&pdev->dev);
+	}
+
 
 	ret = dw_mci_pltfm_register(pdev, drv_data);
 	if (ret) {
@@ -560,7 +566,20 @@ static int dw_mci_rockchip_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pm_runtime_put_autosuspend(&pdev->dev);
+	/*
+	 * For boards with sensitive signaling like the RK3576-based NanoPi R76S,
+	 * we inhibit runtime PM to prevent bus resets during idle transitions.
+	 */
+	if (disable_rpm) {
+		/*
+		 * Instead of nuclear option (pm_runtime_forbid), we use
+		 * the "soft" way by incrementing the usage count to
+		 * prevent the controller from ever hitting runtime_suspend.
+		 */
+		pm_runtime_get_noresume(&pdev->dev);
+	} else {
+		pm_runtime_put_autosuspend(&pdev->dev);
+	}
 
 	return 0;
 }
-- 
2.52.0


