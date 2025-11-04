Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E77CCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBzuHGqFjGOh4IAWV5vCG99JkAgbQed0TO0fNPxfrBM=; b=NQ8MStX142FJdMU6mcli1LIePO
	dg/tQLZECHeK1idXmcJtqVftkNMaHiavO1AL4cc6rFMGToC8MnTpveTP3wWEREizfXZPVtEoDRnav
	qisLGamJV9FKM1/LymJg3uOjqLLAupHfp3ZzmAI+Zcq5xC2B9EsjvKp11lSysZhwWJpQKPHPrzEg1
	pz3j7Ah26veIeKAhnwsudwYuT00ISRjpEo4CDm5X9zDTiFKFR0jvI9AxuiiR39Sebj99a+KjmLsxI
	lrxKZX64LJYKn7VavMmaMRCxObxQAh1dvgqfi6oypOe0w20o3ddz6fgbnIcAO3z9y+fzxpisBYGdw
	d9Wq0P0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTt-0000000CLCX-2M7z;
	Tue, 04 Nov 2025 18:10:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTq-0000000CLAC-1oTO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47756a07b34so5039705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279804; x=1762884604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBzuHGqFjGOh4IAWV5vCG99JkAgbQed0TO0fNPxfrBM=;
        b=monE+EWn8HGI+5u2+CbaJ5r3OLsv2/XT1Ca/2Z/BM2s9o5Ij8B4DhRVuahoLutKovj
         7TgGmGgY3AcKM+F5Ap6yvAVpptewA5LfAsGGwhAacy3F96XPDwiq4G8LMhc99sjxa9tK
         H2kJq7WLD86c5PbtlaJwfpRzvPhcKG1/B021A+iIEOUrzr1da4KGMcsMfIMTxZVEj7Cf
         WGWcny1lpbi6tJQbv7B9WiOfXVuXeGGcGT6NRtfGBtitkSL+xTV/CGecgWCUrLrmuviy
         OjILJKLAh7/EPt/ZyH5Hy3BNTGq+Y79AY3p7kyqL24ux6/obq6C+5HGxwt+E1SNWt++Z
         dLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279804; x=1762884604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBzuHGqFjGOh4IAWV5vCG99JkAgbQed0TO0fNPxfrBM=;
        b=gZddIpEBDupLMds0xVG4BKmLO4QXlYt2vP5kD7CgScsu06vHvqarW9C1W6mrXJc9dB
         vyu24MG2qX0s+IP4HlNb5ZFA+s5GLl2t+zVVHUs7J6oQ6HKeMlnmLJgl+OjfT7YdGpwy
         L7GBj5gClevQqG1dvMdulmN6+Owwd8VZaqTMJOKXvgDskV6OiveryeLfrKPGE4M1287B
         KNOYJS70GZ0TwFExKCNCITSimPxa9PHFx0Gx6J13PAtauxOQbh72tJLhk82b2fWem7rC
         bnl12zTmbbrd90EPl3cVkYgvitFewUoBIhSfbuTDDlPSbcEY4AfljdbmpNLdZdLUCl8J
         PpzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxLcITaae31t+SeTqg9C/yZUhx4OXZKNf2I3kMDCAIBJrpYeERGWAHeajjrX3yXjqPwnqQ/PjFraciDAHTe1Tx@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo/8q7rk+y9PrMqlTb+FfIx3O5OIgcJKb798CX9UQ/xH+C6ESz
	A8dobpFJ/5UhJBGqKTht3sGDXlq0YliACmWMzQQok3yxaGGgWNq/sBYb
X-Gm-Gg: ASbGncuwLZx+Z3iw2woYoOHjYhVw+7HIMIF3n+brdhUU0wP3Fz+fy2L81Z/WY8rKRDR
	DwtAQAvQHr9UMKoRI/4UtfAfdFmTDvfNewFlEtUpUv2zGHFk31+VcrsaPgFM28cCkojY8Hi+sup
	16OQH6XN/herQXJzwrEldL5rr5fhxP2UnIF0kiZ5OqbQ/fQONyL3BsN+VWpHYOGdzFvD9irkNZf
	S9qaN+05gyJJWU1EsuiwFr75KyNenKSAayz+VjRzI5vhbi2i2hdjWr7mjp7HhKokun8jyqotX7z
	evKPX56b+5Lv/DWZKwRnrxK96j/jaHczxsdesVDOu/mXs+ugEvbDg33b4Y0Dq/6sXezuTXpZ2qX
	UrYGK+IoJmUMns+feVCqn46Af1iZFmHT3v/7xb/7/kpDrlFyXUMyrF21lh7EdwjsZSL4ja0B7zc
	C/LU3teRbP+SM5M9mdHg==
X-Google-Smtp-Source: AGHT+IE+aXaz85+OcD9Vk61BR2+xCkKdEVOqbAdpjmknpg/EVMyrQo0hoti++4WquFHkKitI5cwjxQ==
X-Received: by 2002:a05:600c:4e48:b0:477:54c0:6c3b with SMTP id 5b1f17b1804b1-4775cdad2admr2728525e9.2.1762279804193;
        Tue, 04 Nov 2025 10:10:04 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:03 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 02/30] drm/sun4i: mixer: Remove ccsc cfg for >= DE3
Date: Tue,  4 Nov 2025 19:09:14 +0100
Message-ID: <20251104180942.61538-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101006_488980_CECA4211 
X-CRM114-Status: GOOD (  10.16  )
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

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
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
2.51.2


