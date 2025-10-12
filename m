Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409C0CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9pllFFRdLbfJa3CzMw9MDenjUagmZAUwkBtCn+ZhPI=; b=OM4vZRQTQ21DxUe4qtw5M4JlVX
	+bBBfpzpH/5L2XRiOWotl3EscC4kS7TNIEjycecRVSqNiMwk0XcKr2egNzWBzv2TLaP9gmovgOW/C
	U/7v2sUBysWCTxW0LI4lFmkVUwGlB6V6PTmLHxJs9hJNYw+I+3AJzi2yr1SdyJgKlut3Xm+o6cIKR
	oS9iCvOzI6wuvz6PkFcnq1zhqeAOom5LeDjWEJTVusnUsb6muHeEihf+IkCpvyNecm8apkK843An4
	gSgJ4LfjnxsvZebiY1Y7OderewVQHWv1Y/ikyvUH9+DUslJLy5RfoDJU+Kn+yJLbFfv7g6bfMttBi
	RyfXOnTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fX-0000000BfY9-3w79;
	Sun, 12 Oct 2025 19:23:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fT-0000000BfVb-30m9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b3d80891c6cso703896766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297022; x=1760901822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9pllFFRdLbfJa3CzMw9MDenjUagmZAUwkBtCn+ZhPI=;
        b=kjfr/pX7wQQIPskNEnIyZQ/Q8WxgEVW4nCr9MupZ1/EaxQ23i0TB9MaV6HRRY1s0i4
         XYnwBFHL1T8hHCuW0uU4sXuWYNrnBeWHxLrQQaCxPd5awG7Z/EIgYFRANiiBnvNhjJ5P
         8pCgPTK6WaNjdapkDwVUkEIFL/cBxIlr3lbDs156ye6hIye8HAi0MsRmWw5dHDeOIC1m
         9eVYaROjMcDZnO7im2yxZjCuHJ4SpjJk71Vq3wRZ4G7CHTUuzkevnzvib+ngVY27+A8b
         BD5Lg4ZkxMbU8sS4J8vriJiqiBeky++irX+eZ5tZTNqMiaY9vdaqL72FVT+65VV4NVs1
         TumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297022; x=1760901822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9pllFFRdLbfJa3CzMw9MDenjUagmZAUwkBtCn+ZhPI=;
        b=jgXLD4RlFToP097YTosjPDgO7I/mIm8lCYjt5zioPsduNAagl0GCmh1Cwl8boQ3N8w
         ldmVPv0zAdrv6eExrpQWxhe8QDTlMnmSUm6ztFl6KqsqmawyEaa5KOtFfnVT6Wsw83hY
         btF+7xt01Sls5X9BjPQG49z/aZKMZjpn0vPZqoAfEctRoxeOfy9zD0w6lTzkTZVEOfnO
         6KuBfbPhi7gXrPfWveiRFvP3wYjCQUqOkXIvS3YPWbpW1CX1RKbF2gejGdiAwFTuc4pL
         tjm7fBGBOQXzS+Y4oh0Wumpze2DrFsE2qlIpHMcI8YNr6/tNLCI/Gs7Nqrx//1DYRlNG
         XXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiQ0h9DFcTK3cSsTAo2xGloyRb2zG0mO8A7FD3FTKCJhQfWbmRzDW1la/NFPzDJnhP3SvLZ3O8P483Z8JqpT4u@lists.infradead.org
X-Gm-Message-State: AOJu0Yxek4PMK7ZT3SQXwaCU9MN7qxAQYRLxfigkTA59Z97mOOVpLT/2
	ZhkRKkbhzofxcHm2ys0z63Jx2yiYFCfA3H/Xz6H+wYxOSHEgyb0Uf8xL
X-Gm-Gg: ASbGnctSXQ1QbBE/i+aWNviNqkH9IanSbgjQ5KZ9jlwdtkMd7xWqfpxtjtx1QrPneFs
	JzLGMv00lEHvjpCDZMALz/Wos1vUEffW9rtoLM98uvn1DZnyiYE9NCEFbXRyfDuk77jMQ7y850Z
	tXIwi9DnN+8wHYCtpur2PPrQRj2lZ/8IFm9HcfBWUYEkb881iT8bGd7MqEoEe3zWzcGmk679c5E
	wZ3nSq58BRWR4fbZZkzhvLUTo5OBZKE6DDQ6+qL6o9bCYg/C+h+lNw2iOcZv6Vz+cWku0uBzYs6
	yRGt8oF7mzRkY4HG2RlKH89JVxbsjAvrI88ylFUvkyI9WPCA5TEK+ZouvbPdZLcQFKMOos1sc/d
	nUg+yh0uawexy/ESxIHws+cBaiw3LXtLDskqfvAxxX1vnuLeFQfiBd1yN4xAvpOn4mR5dcMDbZV
	HNJICH6cFEyEuDYztInP+l
X-Google-Smtp-Source: AGHT+IHSovbe/H5UYTgSA1JPDJbOFUPVXMxcZWI/chJwYDsAxjOuahQb+OA171YuZ238MSsvaekD/g==
X-Received: by 2002:a17:906:6a16:b0:b23:20e7:b480 with SMTP id a640c23a62f3a-b50bedbf4f1mr2357634066b.18.1760297021975;
        Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:41 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
Date: Sun, 12 Oct 2025 21:23:02 +0200
Message-ID: <20251012192330.6903-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122343_761447_ABF84171 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

Those engine versions don't need ccsc argument, since CSC units are
located on different position and for each layer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 31a8409b98f4..f7f210a925f8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -790,7 +790,6 @@ static const struct sun8i_mixer_cfg sun50i_a64_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE3,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
@@ -800,7 +799,6 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
-	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
 	.scaler_mask	= 0xf,
-- 
2.51.0


