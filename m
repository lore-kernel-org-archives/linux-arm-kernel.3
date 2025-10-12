Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F97CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftu6zu8GSme2+XDOtZSOO4FVxV/p+JAxG+4qy5/uDJg=; b=a1cJUjlj7rEF1CAdmyAEIlwB5y
	IgP09Lzkly6FvLFvR/blzHuErlYgzX2aExbH4cEFbxihT5Ndpf02ogA7CYi94m/zS6cznXSvmuN6+
	k7dN7gjuN2/31RPRHaKqfNtYQsSyDNC/F9zbNLPBZq7QRp8skC+pMcsjNv4cshezv7h3YCsDDNPuB
	Ofv4NpLrqxeP8uPO/16BkpwNrGPMUjpKQluD9yIgB0OZzAVdU3zq20pmQ4G9e1doIScLRY1AORqNS
	nOYKZANDnBHtImEHtPXlEf5MBvu+8Xewm2QXtNlM2i5w1znRbWwijSuNW+rE9wXZFfRyLCGAWpE3q
	iYqIYPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fV-0000000BfWt-3y0E;
	Sun, 12 Oct 2025 19:23:45 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fT-0000000BfVL-0Wvq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:23:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b48d8deaef9so637318766b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297021; x=1760901821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftu6zu8GSme2+XDOtZSOO4FVxV/p+JAxG+4qy5/uDJg=;
        b=PJYPg+JbvxXVw1ldwW74PRLYWBde4txSktDwW3mcYaVAFArYlHJ1K6bs/ztQ+BgD7o
         q4K3q9VkttfGCd0V7lJH8HW0kwRz5Pv7eAUqSlFOpfKpZ+P/L7JcOi8jmdPYOrIKGoum
         CQB+Yh7QWHo83h9uBA74dUOrG16tDJ9fzjsZEz15wN9bIu6HwQKrGeIw5vHqnfMDmOJr
         4+AQIVa8VK/rgAEkG0fOafT0J9NgCctRUKeQEaTzdoyxz2ja1mToB685QcQFAKhXKBFJ
         XKkYmgi/d8kEkDoriPg2TtmCpyf3vnpcgoOS8vF12qcxLwpHuZjiQyrg2JOkhPEl9d2n
         2TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297021; x=1760901821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftu6zu8GSme2+XDOtZSOO4FVxV/p+JAxG+4qy5/uDJg=;
        b=MSI5fAIByznHxLr0p7kva35tOMoyWTCM0NzKLC3YhKg8M38NFyJXzPVNZz1Jc0rLX+
         Dp8Jjw1FxFalApXe4oEZ3m0ztE5EmqrITRUXms0ELkEx2wBsdr2TKo7PFrJCFVUKB9sq
         9CztScfbyhbW1Sa2huedAEHsnaXgXBlyF1XISddLrB7YdlF+YMha835ysu6NCHCVqsrZ
         xuxkUtLfqzlBWXG8DacqeQrcTCKUqrn/f8uY6mjxNB+Jj7axbBaevtmK59qAryfr26ih
         4F+KcAkH6/FZafGTvf99laWe18jf0/V7tDPvRz2lQBlwjR6uTnQEHYZjWxYYe8iMPIsv
         6H6w==
X-Forwarded-Encrypted: i=1; AJvYcCXVWCIgtzzk5c67WeJm2trF23wQwU7RjAE7aXQTtVLNNedZxOoASVkaq9Bv7b2qvhjcFfofaTcruziVWIdyBXUo@lists.infradead.org
X-Gm-Message-State: AOJu0YwHiEB6bpssGn7dpdOl3Fer2APCD+XrJfBjhsIEngbtiMniF14D
	v2DPmaXNSW0ElSDheHYRSGjEfH76UYvztXDiZE52pprdUmWXW9K9aOzO
X-Gm-Gg: ASbGncvL/9Viu13KMqNhOZi+UIWvACeav9mwqh2mE7y3tgwUdN8PCXMCRO8TYGjYAqt
	dsgiETonjsII0OFaMK9rEGVpOu8QQuvu3n6LI46botaJf4X+I7qY17I3L4Q9YzdpanTNyozXrDv
	3SasWOfNUPKbWVKiEdRg/uP5OvFNpNc73wB/mPETylXjyvN+z66ELWJ2DJjzc7UYnCksII6hOmk
	vapQTKPgikvgMMVEJuPZraiuqQgJnnJN17O/UuyH6S5+0ENexReeaDYLk2GA4o46izfipMUXXUe
	qhqAjhKxpHL4i5vH+wEkKIqGEm97XNOKu+Gyem50l6svcmWuovUlVSyr15K3sd12XD/pb/uRdGV
	uVONXcASCgKO/gwsDrpZJZR/xA36BAyP15+5yqjA7hkChZ9PNrHURCwSZqukQR8775sDXwB+zUs
	dVz+WHeKj/6ls+2Y12JSZ4hg8BanYOJPU=
X-Google-Smtp-Source: AGHT+IG0sfEJIgIhhCJn3/nqxzgHPFNNqWX+VjerNb/aGPJmXt/GeMNgqqdE+ygKI0NpsjQeQpcZAA==
X-Received: by 2002:a17:907:2d22:b0:b49:3ee4:d4a6 with SMTP id a640c23a62f3a-b50aab9d96bmr2151162666b.18.1760297020857;
        Sun, 12 Oct 2025 12:23:40 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:40 -0700 (PDT)
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
Subject: [PATCH 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
Date: Sun, 12 Oct 2025 21:23:01 +0200
Message-ID: <20251012192330.6903-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122343_180225_310ECC3E 
X-CRM114-Status: GOOD (  12.03  )
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

Properly define macros. Till now raw numbers and inappropriate macro was
used.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index a1c1cbccc654..b5badfa2c997 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -39,6 +39,9 @@
 #define DE3_CH_BASE				0x1000
 #define DE3_CH_SIZE				0x0800
 
+#define DE33_CH_BASE				0x1000
+#define DE33_CH_SIZE				0x20000
+
 #define SUN8I_MIXER_BLEND_PIPE_CTL(base)	((base) + 0)
 #define SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, x)	((base) + 0x4 + 0x10 * (x))
 #define SUN8I_MIXER_BLEND_ATTR_INSIZE(base, x)	((base) + 0x8 + 0x10 * (x))
@@ -242,7 +245,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
-- 
2.51.0


