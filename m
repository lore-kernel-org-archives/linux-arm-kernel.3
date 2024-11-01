Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D339FE6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ngedgEzPtFUspqedLiAiTsBOM7mquusH+8XohKPtoA4=; b=2HzIrJR4G3IfZKXUj6USHGA90R
	1iGeZXxfOg0PijAzRkNBkgPmY1mncL6BIVdfkRyITyw7LG61nLKLk0DBpe+hVuWlmAIlTeJE4u4C0
	JXiCv8UQZ565MZHqiiE7Nw0iDqMc4kebOCNJ9TFDJ+D+/Ev9F8ClXRXbMdjSljAiaQqhLb02xtOIi
	VZlY3uApqaBatjiASGD9Z030DThcbBkYsjc45vx+yrx8PxpWjFb9XRCbVAvKGrM6FGiIAFmS8ODk+
	x0AGzQNV3XCcyZLlDK8PqHozoAnnsRk9wBdhpUX3hpV+xsUNDyYPO+TVaKz4htPBdtjGP9b9P5rwR
	ki2ipaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tdp-00000007VxX-3Ond;
	Fri, 01 Nov 2024 15:32:49 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tSa-00000007ULy-3btn;
	Fri, 01 Nov 2024 15:21:14 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-3a4e48b61fcso6838815ab.2;
        Fri, 01 Nov 2024 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730474471; x=1731079271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngedgEzPtFUspqedLiAiTsBOM7mquusH+8XohKPtoA4=;
        b=VYelO3je9BP4ALsa90ac5jQNQ14nccv4u03D371NGoQpwLAC1uQdyzL9uWPO60LYIR
         6zJohmxrIgxvmDzMp74IFALk26fvrxoLb40I2b4gaxo5HuhJb4EjBRpnQKDuoUVWGM4p
         RPPN0EsM/L2jVCcA8y8+w75Dm25werBqq6Z+h3gW/V1ebCDBPcsslm79tZZuVWxRgHkD
         ENWEIx8LEJAXUHHTze+QtYRckTULDr305oFLcyNXLIE4mjWBZhDJAT0BJRLC50w2r2eN
         kL9iO7/GYP1KzM20nbOZQj04qKaVunui3BtEiTP2fMSckcdYobVmsBgwBgmDt+XlVVdv
         eu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730474471; x=1731079271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngedgEzPtFUspqedLiAiTsBOM7mquusH+8XohKPtoA4=;
        b=LTPsE225eEJKcTwpzOH3nxnnIbjBG0u9oUNn4CvtO+6WyYc71QuRcwgOm8SyVgh+Tt
         wFsBuQ3SiAmOOdO3p7wU6B0PsNLZHxPzYTX2tWXgc5i8bAIY0cspTvwzPj3tZAXTyS4P
         Golf5wlL9XJiX7e/g4xTFNF61VHRAXj1GeCEPYsMq4pKvz9NXEoVdgAtEo31VPTuT32K
         Wo5hmpITPs9lAaE66elbKBVGoRT7UQoKdiUiqeF5bardB0suLXg8aMGFQ4pdrYU5WMNz
         KkWGFsGXMMYJyTGyFOMOu58h4B94vBlULyJlGofRssrXXmIv78s5es+pNm1sB7Vr+72P
         SaOg==
X-Forwarded-Encrypted: i=1; AJvYcCU58ubu+PKLtwLeTji7nfyUFhD9J7RJUNRMCXM/Iw0H3/RSs4esQFSl25IflLBAX+8JfARJuUrea0Mkg6xOpTye@lists.infradead.org, AJvYcCWD8/uDvtbspIFUcEFIhw3qw2JDYg7c2x4EY2Q1il3a4F4Szhsgzn8lOpyipLkkR4QqHYvhcCkij+fWKaNieuI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwszWmJ8tZmMi7f4iqvp1dvVI9tDIiUahZl48ju+p03TwWaiqsD
	eLOzL6IrxEWlwMa+9JkQyUCZkNUnMYRBoiRUz6se0j08/pxK2os3
X-Google-Smtp-Source: AGHT+IF2U9BgKTbgcIgkIdNNc5MCBypK+I6PPlj1q0iCr1DVpME5Hw3ZQRMs2YqWQEHPBENfAh26jQ==
X-Received: by 2002:a05:6e02:16cb:b0:3a6:b0d0:ee2d with SMTP id e9e14a558f8ab-3a6b0d0f518mr32706795ab.9.1730474471110;
        Fri, 01 Nov 2024 08:21:11 -0700 (PDT)
Received: from localhost.localdomain (host-36-23.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.23])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6a99cc4c9sm8890215ab.46.2024.11.01.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 08:21:10 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com,
	kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mwen@igalia.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/vc4: cast calculation to __u64 in vc4_dumb_fixup_args()
Date: Fri,  1 Nov 2024 10:20:46 -0500
Message-Id: <20241101152045.8469-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_082112_927627_6148334C 
X-CRM114-Status: GOOD (  10.52  )
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

From: Zichen Xie <zichenxie0106@gmail.com>

Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
unintentional integer overflow"), directly multiply args->pitch and
args->height may lead to integer overflow. Add a cast to avoid it.

Fixes: 3d7637423be8 ("drm/vc4: bo: Split out Dumb buffers fixup")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c133e96b8aca..ac02afc3acc5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -69,8 +69,8 @@ int vc4_dumb_fixup_args(struct drm_mode_create_dumb *args)
 	if (args->pitch < min_pitch)
 		args->pitch = min_pitch;
 
-	if (args->size < args->pitch * args->height)
-		args->size = args->pitch * args->height;
+	if (args->size < (__u64)args->pitch * args->height)
+		args->size = (__u64)args->pitch * args->height;
 
 	return 0;
 }
-- 
2.25.1


