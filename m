Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E4CC982D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f70EL2u57AlsQGuy6taCWBcjNOQfxHMXhBaDu9pSD1s=; b=pKlzkChxP0LP/dZ4sBUIWVdLmz
	Hpa1JuiIJOVORPsVsK/1WsPJ9W5rFj7wrNskYQ+8L84XeBeuzI7bA6Sf5TyShnaIwf5G5Ft3MyyhP
	cFJqwF09WY8Q8SvSCHulzcOenr7+cQr04rOj+7GzsEag4XCoVFOeSKPjewKcwaANVIVsM0WnhgUyK
	ZgeNgkAs1r+ThWbSDWMBerZmb9EVx2R3d9knifGRnq5lmg680CcVhiRgQD6CmlZ279+bDIPALjnrP
	o0JyPq8M3oNiF08zUnlPYROJJtAJ/YbEbUvPEysNZKqRi/S4h0vNdh0FNRS+7f4p3XVDuxmspSAej
	Df4+511A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrU-0000000DM9w-3L31;
	Fri, 18 Sep 2026 03:02:05 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrP-0000000DM6T-0Yvo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:02:01 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so108580a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700518; x=1790305318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f70EL2u57AlsQGuy6taCWBcjNOQfxHMXhBaDu9pSD1s=;
        b=R4xtu10GNZh0qsIS7+pBZL8pXsRhC5OS8blVx7nZ4DGFQgfKE7KKf+xi2M6i46vxLZ
         pMXFUbjWzDS1S8DUjoxAnv5kDzlOH2ZvnpD1WWqp0w90FCg+wRP/pztKd3k+brYFNkET
         S1C5mlui/Zl6VRbqb9raR+p+b+eE5q9SH8ejJufhIXVvCPVHInVIxS/wBE4xxgvtzUgL
         4VGz+ecjNwiyWTTI4yT9Vr30DuY7mGJUFbceXKN2gTxA1oBrncYgXKkRJz6FEnPEvZGE
         GRp/24euP2v0iSrCFpRC1JD2a9yNHhfoHctIyoWuV3DeGMSavhRbtdGxVphWvkmcnAAv
         yslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700518; x=1790305318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f70EL2u57AlsQGuy6taCWBcjNOQfxHMXhBaDu9pSD1s=;
        b=cMmFdbY34eelHJB8xckJ92wXVey+M14hXbhlSSD70xEc7XRcsYllpbl+RUe6ZXjSPG
         10XK9UMG4aT6pqVbs8yRkjU3pgPXRZZRDLJ2qR+dqlNMTjLtVFGwKwpnwalLNslRohCk
         sPC2QeQoCNqiCJ+iu3dWWYv3Vlz9w2oqCjiOS82Zww0/Q7bf3HBqUrNPZBlsTuJaut77
         GjZjcshmiyyC3NgE4rWUZeKKCsJ+cFTnDgeghBeAiyK0B4TCdaZ594s4C4/BdLqZxZhm
         RNGktxm75KWRYkoibG+fpHc318oSSU18KjHbU4IMB4sLEPc43iImepfGVn0tDZuE2TUy
         lNHA==
X-Forwarded-Encrypted: i=1; AKwUvBwgyvnEq0rCOiow1y/aWKkfqwmT3VMFvYQsy3ciSywczzXQlKE5zzAAm3fGAtozEZJUF2aQHC/FBCIO+tN4C1EQ@lists.infradead.org
X-Gm-Message-State: AFuF++nCkjWpZQ2FXHqos78p5rTumO6NlDHarZVB628OJCCS2g4qwPLM
	FdwyK5Sy0zUZTZkR5Q9Tv6jz9Nhn1ifQYdB3FA3OOUVwOaybBcbEvthW
X-Gm-Gg: AYBFou2yABdhcbVWzFQXwbjBMZFqUjhei6DmNk/7D7Zi5bzQZwv/PObgkYTzOodUfq2
	k8HHx9Ul0wlIJRttKClagwBBV/r57rCsLA2aIjH2zJcF87UdvHt/QMc4oO00+JFnEW8+b1THrr0
	Ml6XYDQUbc7VTu6PHS8er+68MwZXTAjvJ0OCIZwDSX+rHW7LX29oKYDhSAeNIvV670NXfgswxTE
	O+Bd9B7iTUG6FOPHTxlD7qBYoGoxyfelIu2+Rk8+O3xEL0XoHahM7iFYgDRw3s6jwZOHD5k9GzF
	KZMwU7YVSOV0Xc2qGBhwW/91yY8d527asNoBuOnN8Eg/Gp1M/jAvk6dY7pCgITv4vCcMcJdseEg
	wkmBdL3jhgffTO3qD0SGcJcq584He4DJ3j162wL1P5RHgNIfeFQ97U9zvMoJssCIA9TJ4ES6UIY
	2h0xWg1t2j/QdlBPYacuSdS/KCske6ssW7Zn2q9B6cYDhVuRD7YOjlR4wgy+2R2lhvZjY7jjQA1
	k/EE7FRrL+QrEsiQyMoUO3rXvN4Ss+kO/3kJ76W8JvKdY0yO1OCQOHzRv90JfY=
X-Received: by 2002:a17:90b:1644:b0:39e:2ea1:e2a9 with SMTP id 98e67ed59e1d1-39e54d8b0ecmr2306119a91.8.1789700518239;
        Thu, 17 Sep 2026 20:01:58 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:57 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane disable clearing FB_EN
Date: Fri, 18 Sep 2026 11:01:25 +0800
Message-ID: <20260918030125.315978-8-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_200200_184401_82C14E5E 
X-CRM114-Status: GOOD (  12.14  )
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

vs_dc8200_primary_plane_disable_ex() calls regmap_set_bits() on
VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so disabling
the primary plane on DC8200-family hardware actually leaves the
framebuffer enable bit instead of clearing it.

This bug predates this series: it was carried over unchanged from
vs_primary_plane_atomic_disable() when patch "drm/verisilicon:
introduce per-variant hardware ops table" split the DC8200-specific
implementation out into vs_dc8200.c.

Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for Verisilicon display controllers")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_dc8200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c b/drivers/gpu/drm/verisilicon/vs_dc8200.c
index f72da10295e1b..25b5906a1c5fc 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc8200.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
@@ -70,8 +70,8 @@ static void vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int out
 
 static void vs_dc8200_primary_plane_disable_ex(struct vs_dc *dc, unsigned int output)
 {
-	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
-			VSDC_FB_CONFIG_EX_FB_EN);
+	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
+			  VSDC_FB_CONFIG_EX_FB_EN);
 
 	vs_dc8200_plane_commit(dc, output);
 }
-- 
2.43.0


