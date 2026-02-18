Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D2BE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 18:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0uK3LnBVqJtacrpaTeNsmEDEPVfCDtIQ6jE7L3gZNMs=; b=LeDBsn+H8cyn7ehN55MgENNyJu
	JQjWeT73yhG153c7b17tZb5dTKRBI3D997atwRSH+Duu/Xl+4bN3P51T54s3nBOODyEZDCcZZye+G
	EdrgWvZ/vIkJu0ZZiGrVELTKC/+7aIF4j6jQ6cEgYzBlHNvUF6TZuMTr7+EaE+jMCYD4BRj0GPgco
	cCLio8IbnE84r/GDmBLOffW5pMKfHUnFhINgV7KmBqR8n1JI0L31oIl3NixhTcHV8YGdgjiFihh5d
	7M8Dzm2VkfXRzJ2S3KhlDwqudPJmfH0meC6HtjvGn4r0U0Z83GkfGDZx8LIYJ6fCB93z2VFTuW1nW
	dzfc82sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmOA-0000000AFwx-3Z2N;
	Wed, 18 Feb 2026 18:35:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmO8-0000000AFw2-1gWN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 18:35:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so1266175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771439702; x=1772044502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0uK3LnBVqJtacrpaTeNsmEDEPVfCDtIQ6jE7L3gZNMs=;
        b=ku6EwteLd0H7bqP9mNXf4RkTMxnmQfI8rOmbOk3mLKFujAPiy5XTknI1l3FFXFHF87
         Sy8ZC9qo4RipwggPsH0To7tml0AX+h27d5tbOO1dX3Jnwtc5+Kygl/ZFt92y5BNgEg7v
         IcQ9mzn3tGjQHZc0Sl3qd32ylHU6gq217/6EAuuyDF03Kdq6UZ9HXihz9PW1Ml5FbXpS
         hnfpi1/rmq+xLjVHPcI1S0vkb58Qbp5i/5cO6pg8nZ3G8QmdV5POO/g6GRiCZMzPi6HE
         C6osH9wFTTeArLX6jtIWIgi4IZ5WCw+SGX0Q+isx7wkLYm0B3UE8VVJ7m71r088RAVqD
         O0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439702; x=1772044502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uK3LnBVqJtacrpaTeNsmEDEPVfCDtIQ6jE7L3gZNMs=;
        b=OmnyvKUtfc9GNhxDlXergkCc8p/Y94VboOYNL5LBjbeANfxndiyYugeAyNQ8fMSjHN
         aIKFknxnijupU3pu7TOsVSyQoUl3vUL9eHMwACpTNGYzGr/dfc8mTC/vh9xkHljjFLFK
         Toczv027tJ2Rdnoq7OyZ/J2rT1KWmvlY9NtoD+zhHykr6zQl7yp62uTfIqOA276cpBXi
         4Jh+44VcE8pKjfN/m4VqNemne/Tpya3C0PomhoS4ezQO2KhSDWe4XQWU70HEFKXneDem
         J7kihnd1ysdFDfPGeYtNKGzmaPYr8qHpe8Og1WiRNCcueZEtnk8kJxijLU5MGGDyr5ZD
         HeuA==
X-Forwarded-Encrypted: i=1; AJvYcCV7RykGHB+esaw9cujSP1bQ3qxqBNSc17tCTSGVL+rhhDRWDAzQkbM8r5UbfrEG4Rorm4DRJtk7DTF5fC7srPHl@lists.infradead.org
X-Gm-Message-State: AOJu0YzMl/mavEw9Iz5Q64HsFeBJBGpFfSzNm2se2fKmoCytTzBHEdy/
	uZcAGbrjreyfdr2Z2tpWyKsniLYa4fg3zG9iqrr74rpmff5AoxryYAOT
X-Gm-Gg: AZuq6aJJjN4+2jAGokk1Fr+nL5TMmkvWqYjddYptcHMNSzVfRIArLoTiSJft+2d7oEK
	D8TOi2Dp9hY2L3O9DK4re6bgx5i8rZTuTgDbVCp+3mwcM+lMAma6hRu4JUqMfkXp4uT2jNjeSEF
	t9t4f2skFh2Zc+rMkYbCD34sPNb0GtRs4oUp8GU8fj/8GyTRNqIh80EEEswUBX5DAvQPgzipwve
	n1QTVCV1qJPITVSjqLnCZMk8s/6gVpPXJGcSxfhrT1lSqB5DPGlXeuh6uuyYfnECwLsNG6H1y+6
	mabZt6jzQZtig4/3DZEPIWxa9BEzp9gdhzzfbmYsz6d8ORdge1yj8M/EyYCqAjxyrAiLjFo1vbb
	wz2YZoEvOJfJsf+q/mMffVWcnE8jEYaJBEUIkVTdJ3MUyAcwIAaqtzejdJIpSXZQtr97avznWNh
	A4vDeQ6RiDwm/vAqmlcQzkdLgqEc8WvmMDrmYnM1gBg7pMM+oO6BHHR/m2iCcxQ+gZ7HmX/d5yN
	dIogzn8YKDk6Mek
X-Received: by 2002:a05:600c:458a:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48373a58babmr277783835e9.30.1771439702159;
        Wed, 18 Feb 2026 10:35:02 -0800 (PST)
Received: from jernej-laptop (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm640635785e9.0.2026.02.18.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:35:01 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/sun4i: mixer: Fix layer init code
Date: Wed, 18 Feb 2026 19:34:54 +0100
Message-ID: <20260218183454.7881-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_103504_449589_AA4F2C08 
X-CRM114-Status: GOOD (  11.49  )
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

Code refactoring dropped extra NULL sentinel entry at the end of the drm
planes array.

Add it back.

Reported-by: Chen-Yu Tsai <wens@kernel.org>
Closes: https://lore.kernel.org/linux-sunxi/CAGb2v65wY2pF6sR+0JgnpLa4ysvjght5hAKDa1RUyo=zEKXreg@mail.gmail.com/
Fixes: 5fd711adc0ba ("drm/sun4i: layer: move num of planes calc out of layer code")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index ce9c155bfad7..02acc7cbdb97 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -321,7 +321,7 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	unsigned int phy_index;
 	int i;
 
-	planes = devm_kcalloc(drm->dev, plane_cnt, sizeof(*planes), GFP_KERNEL);
+	planes = devm_kcalloc(drm->dev, plane_cnt + 1, sizeof(*planes), GFP_KERNEL);
 	if (!planes)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.53.0


