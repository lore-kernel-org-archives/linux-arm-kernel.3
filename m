Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F234AC02187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vwdCXA8clqNZfv6cNEYqxDS+Or4qZ1J1EVJqPwpo/9c=; b=0jkNlQFIgR6gnpwOQADHQJ3akG
	AfWhp9/OPTAiVpOKp4rZMPF/mInh7YNUkRcClYfV1anr+YRbT9p9ufShoC5gHWJSQ83sKvS2bwOjZ
	TsBJ9oLS4VB9l1lD956fsEPUJ1Vt1QDvG7aXLFCUuztR8ywM7cKJzz9Sy26fVl21gWzyDOcyCJgVd
	2EU09KrE6u225a9ZdvTS5ge40P5GYlPhT3P3nRpiSOJMvNWhxigQHmSIHiDfyxkHav+RWT1cr60h6
	Ewec5VkWHpZsPFhDIFhlecUV/i5nEIqty9mx6Hv+ko7Bfm3jwpRG3YSoc+pflho3RKDtj4ye6mTCe
	qbfxgPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBMn-00000002gYl-3QTS;
	Sat, 18 Jan 2025 16:08:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZBLW-00000002gK3-1PGv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 16:06:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43658c452f5so4314625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 08:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737216408; x=1737821208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vwdCXA8clqNZfv6cNEYqxDS+Or4qZ1J1EVJqPwpo/9c=;
        b=TvIlTS/J1b7b2O0uMLT7kpZqcfVhE5ueAvpeAS+NjishtXBk9fdQV8y0g4VMKppV1N
         lzl1fgXHMXhGdevDBSdZK8T0vfoO7tKehHx4TflsBrk7ba3l01Z729sTnL9p0EWpD8wC
         KolNfywq/oyRUkFs4k+5PUDNoi5EoZ5jqANPI1nYVwkQ9eQcGVpBVnupU6AWnthUyCQ+
         fB7h0ODuOtMgMOkJ9q8PJNTSw33JM/YXNq21Mn4t//RzqcuQzU7rT6HVsNkWoRVs9lVC
         gpAuEVy1vSDoADqUvVlY6u8nMdwlHJgCG79LFosixyuiNUmJayJqDgYfj5DahwKM3hy4
         n9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737216408; x=1737821208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vwdCXA8clqNZfv6cNEYqxDS+Or4qZ1J1EVJqPwpo/9c=;
        b=rlF33HxNyOF+yqxA65Aoqfzy3jTKD/I/7564+rFd5aV9nIRt4cvFJXwlenLnnwI1wM
         Nv1jiV/J7V2MS8c3/+AZxe+rG6xiqwSIFYuCRZu9EoEcL17TuU7DOdOyJW2RbszhH3eW
         b1lpbTzoLUC0LkNDsVHRUVSau02Na6le9+bA1YX2sOjYvwKw95ISgJz8HZXxb7sgdOo2
         c4eMNFXhocEx9OA8bxpfO0oHqwhoCFBMgIntezHgx3Bj+S7HxiUGi7idjvjrpa/8CwSl
         S2aQT42N29RgfcK8upw1lTk4sFf8R0sDghxmYecIr8lrA/CHUSRwHgZqA527P8AoB+VF
         K1wg==
X-Forwarded-Encrypted: i=1; AJvYcCWR2CO8cx72V4IT0jLydl0QCHqyTU04DBHNtnaQ4tPw6vfxfbexfVZ7T4GbxTSQwIejzZKtYxVXF+qwg35ioGRo@lists.infradead.org
X-Gm-Message-State: AOJu0YzGBKbxzLKNmcn5z2guxm2TPZAH+TU9rNh/mBl6RHm8pBICDDVF
	go84AY+vzxUIBjRLOAmZcjPUVQQrEOUxS+2ISGZnlYP4aGq1PiPZ2vAdPSIXp9o=
X-Gm-Gg: ASbGncubHbuJiyzMrECLQ9uQcJ0BqsW+6skhNx/cVd5TtjS7Akrw+QLYbb2GSdLyAee
	ftSyaohcFlVCqwdN5Ds3mRnB9egFaTh1K3ouki8tOQuP3arHPsweuuc8OZyL63MOOwAtY8aLyWH
	RCzv/HR6BHVB1MW/n+sHsJvORzCRXs4PG0yTdTuPxS3XvD+BvkSHQcxXFtvtY64nn4BF5y2ACBK
	L8qskwKEh/2oMHLMY1ZcTAOjhBWK/B/62unwh84OfyNX2efsHhw6aj7tt5lR16URWTJV7T72hXc
	l3Kf8/4/
X-Google-Smtp-Source: AGHT+IFMVBWg/sRcSunUViba7PAtliDqmSrFRcKnOLFwmE1beALCtPs34+Tkf+oAZ7uLqe5eQ56YKw==
X-Received: by 2002:a05:600c:510b:b0:436:fb10:d595 with SMTP id 5b1f17b1804b1-438913bff64mr26793385e9.1.1737216408218;
        Sat, 18 Jan 2025 08:06:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c475csm133966725e9.20.2025.01.18.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 08:06:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/panfrost: Drop redundant Mediatek driver data
Date: Sat, 18 Jan 2025 17:06:45 +0100
Message-ID: <20250118160645.78473-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_080650_367628_96839A36 
X-CRM114-Status: GOOD (  12.88  )
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

mediatek_mt8192_supplies are exactly the same as
mediatek_mt8183_b_supplies.  mediatek_mt8188_data is exactly the same as
&mediatek_mt8183_b_data.  There is never point in duplicating all these
structures - it only raises questions or encourages bugs when someone
updates one variant without changing the other.  Drop duplicated code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac7..12ccc5a11c0e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -817,21 +817,11 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
-/* MT8188 uses the same power domains and power supplies as MT8183 */
-static const struct panfrost_compatible mediatek_mt8188_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
-	.supply_names = mediatek_mt8183_b_supplies,
-	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
-	.pm_domain_names = mediatek_mt8183_pm_domains,
-	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
-};
-
-static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
 static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
 							   "core3", "core4" };
 static const struct panfrost_compatible mediatek_mt8192_data = {
-	.num_supplies = ARRAY_SIZE(mediatek_mt8192_supplies) - 1,
-	.supply_names = mediatek_mt8192_supplies,
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
 	.pm_domain_names = mediatek_mt8192_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
@@ -857,7 +847,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
-	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
+	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
-- 
2.43.0


