Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94FDFDEE47
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 20:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=miy/V1Ssd8oZVcXvrSSNRZJTWkLzXKYl4wR7b24pcBU=; b=CvUrjYhqzrLthbv000a2EY6cs5
	3J5afq+eFbXrj0+8oUBNuQFsVHocYoBrdr2hdNCxjcMnuf2PnqXScG2JJZsfgXhPUZNidugXOuMZR
	H71iqV6hSJBbvQNt7b4NdJFtXKYMe/Jok3b/0e4zxsng7DEPNAPuGrhDFB2K95HUanWQhQJ5qPton
	PIe7SupR9s/C2sBd2ldgRYOXoVlbENibB1b8xqS7UFTI/y6SuZnkEmE1uiaWZ0+U+Jk7I+X8eg4C3
	ErLxJGj4qE0zVVstDTBq/mhO6NI7pWKMRvGi64CzKiJsjS2cHH5pJhPvLiaHlryJq2GfH5Tl9gu/r
	YiHdzcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG0Jr-0000000CGtH-1xLH;
	Thu, 23 Apr 2026 20:06:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG0Jp-0000000CGsu-1jy1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 20:06:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so90427895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 13:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776974795; x=1777579595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miy/V1Ssd8oZVcXvrSSNRZJTWkLzXKYl4wR7b24pcBU=;
        b=afSKc7ch+/5xoHTfew88GMeRZzrjEbKMvu4CG8t9vLTDDDgK2GlwzNDmt+NggZEIn6
         bwkcYyd53ZALLuHLCNrNgI0vh+a2DA9Ftr8OgKXD+WejU2nz7se4ejDyix1XNwrIUoZO
         Y5HaY4rwyrWYYHT6Sp7x4Fpmydf4vYsfdHp7jSaQIahXf/LwxEi48WoVqaTkbIex3wAm
         vJgDeC/QJ5lz+o+vyW8MtQN+NkOoX5gtWXvc0q5tvAofgpZ6XzcaheAluyYfc5VWtBGQ
         i0XJtucWx78vsat+c6L4ARoBZvWgVKKiBDe2vOH81IkwsgHWUYqVNntoKf62Mcmqf+Qj
         bZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776974795; x=1777579595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=miy/V1Ssd8oZVcXvrSSNRZJTWkLzXKYl4wR7b24pcBU=;
        b=r4srrfen+dMdO/j62IDdl9aAOdRyd4YRttA22SmBo+N51LcUwXT64VvmwQSUka0JSd
         yp+FTNWroplBgA6RMdU/W+WGFUvKLZyi9aQNIWcV3QPcpCkwhiVtF6VyxpcDgYyot8MD
         eQi/0mRyUgoXCO8xkuYgMnPMMzrecmGSPw6ELdBFVKk6v2FqY5arKXMVVn7+9uYXxdgH
         /M0yR6H0ncsCMCsQ4ZpWShRRUOM6jNB0amwcsOt2lgrEVhNAdq4gjbL7laUg/+u5JemD
         j1FdhlpHZkbAStKxMjlUrWHP/NoYUNMg1AUYs/s+4bRDyGYxWOyrkbetuwSei8eViKUk
         qDCA==
X-Forwarded-Encrypted: i=1; AFNElJ8leuMRpc7bFQKC7/8zZaYgRFBVYGWcEo6BPQgWMya/e3XX5Tle/XhttrYuYLUcY25i9DNWLV1+CRfGHXc5w6xE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/m4W33DQyOfK/QOP5aT1ghz2xJj3J9KzR5uJliixl6K8QpL4L
	6NIjKRhY156wLM6EpUy8gThLrJXfuaqoCe59KHdjGzGH8xrDGPRx8MdV
X-Gm-Gg: AeBDieu6oYd1WRBgSPey+WLgtKZL79IJYWbNSOwPndHpEv1b4saB5008aOA/gQbpXxQ
	6/1tO1g2hNczXPq76ze6AA36na7MsGhxlKnBaordCkf8B6xXF6kh4jzGzFqBeCAo0Xlst0yB2cK
	Wb7AnK8IHcZIiIYgBci297CeseRnFIRaH/4UnR1OxSGa8bXLv0tHroBheddjdBnZuAVR8lCLjq9
	hZ6KeE0sTwirndXEPT7JiMgyFRfEEZ9/AQWzVXTxofV3OOY6RCfJL2kIeqF0kWrcUnHdkkNcZf2
	RrHjx1iZcIpBlnWKMqYK/TmN1dt0EnEbIwtQoRUxOJlVp6q62ci687mtJduM1hv8m+d1ReG/+Ku
	HO+Q6xbC8Ce/5ELgUw8+UrSIRje7tbE8U/p/3LbfiCarXa2dKYNy0st592Vm1J5tBaLBByxfpQ8
	eW8QR3sjIoU9lg7YdP4YQV4Dh/3z6ZS2M1yAfl3VS9XKFtmHZzUgTyi+Qp5bjZXL/hTOCMpcc=
X-Received: by 2002:a05:600c:468c:b0:48a:56d5:16f2 with SMTP id 5b1f17b1804b1-48a56d5179amr182114795e9.7.1776974794828;
        Thu, 23 Apr 2026 13:06:34 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:5f44:38d2:bccf:b54f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75ab25sm167658815e9.11.2026.04.23.13.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 13:06:34 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Hoegeun Kwon <hoegeun.kwon@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] drm/exynos: remove bridge when component_add fails
Date: Thu, 23 Apr 2026 22:06:20 +0200
Message-ID: <20260423200622.325076-2-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423200622.325076-1-osama.abdelkader@gmail.com>
References: <20260423200622.325076-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_130637_468007_0E26133F 
X-CRM114-Status: GOOD (  13.49  )
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

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
Fixes: 576d72fbfb45 ("drm/exynos: mic: add a bridge at probe")
Cc: stable@vger.kernel.org
---
v3: add Fixes and Cc tags
v2: devm_drm_bridge_add instead of drm_bridge_add + goto remove_bridge
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


