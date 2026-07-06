Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CD9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hr836mBCBDsLn0BsEM+M6uBiXoTgU1y1CRSCGWjay3o=; b=46MlXsBWUQ+ZB2WJ4Ks4Qo0vSz
	0tixsUerE3ZyXBKepErlddmzyZH10yOWISl2YsZl1NfhZObxKJE0UKdZCM9Fj98FoPjHY09KfwwRG
	jn70I9Fkn1iYQNjRjSLZZy53j8gEo/kxkTw2p6Q2hEzynB1yo8WUna+kF4x8g8E8Y0My1oVPUTfS2
	aDUPgkBDwTGeglaJLPd1H9cH5MoXkmgqZESfLf1RpLUZHKYOAgnPUIUYXu/xGzYXDWHQ+llhnoox5
	rK2H9/0Aj1396uByUvBA2iBBqrF/eESs+F6h2fBy9XxGz2mYa7QPM7hlTjr5PDgS+PTdK96nMq+u8
	vrgCR5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjum-0000000CgMQ-07M0;
	Mon, 06 Jul 2026 14:03:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjuj-0000000CgLl-401v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:03:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47d6c634f45so1104414f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783346592; x=1783951392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr836mBCBDsLn0BsEM+M6uBiXoTgU1y1CRSCGWjay3o=;
        b=tC+nD8IKWQLJrk/0+Jfgz/Are/CpqDhOHKbKsZbRrhPnribEZhLA7x3IQjt+0wvqiu
         Ho080zPwOPdy/T8bkyvu5vBzg+UgNyODAWTvrRHQg53QWqStAZjFatyeVztL5a0Q/v9/
         vh/nIiMnWcB0ve8S9aO+CpetPp2SbeCZs4A0E45S7rOCNvj3rZXJrtlE4kHU/LrdY91x
         sblOll1ppC76efxT5xP+c1Vw/Kc2AVSxGoJe7NhrWtTkXUbZrdLQuM9OKbEQGtRkKLfC
         WKBkYNam3107JgL+9UoUAWxKJpLoNwR5LJ0OzG53C0QrDOzwBHcsKyZDrUZgE3nGxHy2
         6vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346592; x=1783951392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr836mBCBDsLn0BsEM+M6uBiXoTgU1y1CRSCGWjay3o=;
        b=hDbeB5X2YF2aJUfkPJaR9sx+XbdtgSw93Y8EdiV81gpnSJ6y8/Xk9oFv5tsXxyOeDD
         n3ayQ4RuKKA77tmDosxSHTqCMAVRIb2DTR2HkUuNVW4aSpwYP7eDu/nyOsvSstsskZRe
         YNkqKXrVxzxzHcqEdQr30k0tg/XpxplBqRkTKhFLuiNuPOz42K6ltgyd9UHHd78u7Chk
         otaRPuwyhDxyBs0BZBSazMbPPD7HHQbCgUhJBjGt2zfsfCBXFQyaziMgWkYSyvtzICdh
         m7xPNgCXidsCSy3TrQ/MQ3+PXQphzq/hXbET2/OHFAY9fZrRuhc/Tj7oq5q0NZABIG7y
         zIDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOSG4Y3YXQE4gYxTgTrFbZkq+3uFYGBiYRXG8E6fArsnLKMOF7n+LWdWISDdnOKuOdNq8sIXLV1yT9EQFLLavA@lists.infradead.org
X-Gm-Message-State: AOJu0YxfeBBYR57hWg6T1hQLDHxrw4pU1rVZe4rcyphdu8TnZRXHmbM7
	eMjDXrVh3qBD5KzwLhn06FSgHFZldTZYDZyJK19atJx7WiQyFx+llx2T
X-Gm-Gg: AfdE7clVqQwX82IhTl5nvHYTrFK/PXSWkJI2quD23GUJjf5MERFFtHJQUW2IGpdJDsb
	0cparcXrsYhhxuvK4TkxKHrF4utuSG0UfkqS46JdJOMCOU7jeS1atA+x/Z0FmM+5WP7SONNXdjN
	INxfiP+T2cbyakSJx4TPtBRyKvE/a2xZxXsvuDnK/UDD0fjMlIoDgFX/GqFMpHvqqHgV17BNJou
	W9iAdRXtHLULHqDKFh9l05MzjlcweoAjiotlSHlrQHSQ1g9EfYjeHR/1hlpGqRKB+UgFsdBWnPF
	NUd6vydDv3rJEIwkDgAohRW/Gej4dhos2un/krHnsqqw4WbZljtKkSS/aHRVWrJyHmnk8KAJ8Su
	GLPh+5jP6Ht3kcNOKhoWnF7ZIYFiAAIJ7+nq5Zf2OCTSZNZ7+VGuxsZtFj+9rNxAD92leKRF+QK
	K+/adZMq+9EKBCGytwlV/VClenmzLDnxGsA/Rj8bmvqiF/cMPLZvP2q3T06rs=
X-Received: by 2002:a05:6000:4612:b0:474:4525:eb32 with SMTP id ffacd0b85a97d-47de668eb7dmr436784f8f.11.1783346591380;
        Mon, 06 Jul 2026 07:03:11 -0700 (PDT)
Received: from osama.. ([2a02:908:1b8:2060:bfda:c630:e88a:7a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm25653740f8f.16.2026.07.06.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:03:10 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] drm/imx: Fix ipu_plane_duplicate_state() OOM handling
Date: Mon,  6 Jul 2026 16:02:45 +0200
Message-ID: <20260706140246.41506-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_070314_140505_40CB0308 
X-CRM114-Status: GOOD (  10.60  )
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

If kmalloc fails, with state == NULL &state->base dereference NULL
Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index c7ec09e557c1..67f2da7f2b65 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -323,9 +323,10 @@ ipu_plane_duplicate_state(struct drm_plane *plane)
 		return NULL;
 
 	state = kmalloc_obj(*state);
-	if (state)
-		__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+	if (!state)
+		return NULL;
 
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
 	return &state->base;
 }
 
-- 
2.43.0


