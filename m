Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2F3C55838
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/c4A3W/yWJ8G63KpRNdKLfab7NwGTF+mRH1tOy5r8yk=; b=Rr5peK2y4lKDcSBQwmJ9XIbcMr
	pqpAnf8ppMEb+rHT+a4ul7Iot0Hl0+2nMJ/SxOWxkT3cP1gKvkPQ8q7mVprI8e4wEwCshx7jAs0L8
	EKb79iG62JNlZ8FhWTIJ7YsSIjH90D0thjwztOGZpfStv9Pqif2vFml74tKJd+RrOxBnzYcYhdfAP
	JJ6k1f0pyrvktUWOZ+h9TUfWeviUV/6QKZPQuPVnPujaUk3YEv5XYHyLVYkDGRMnVxDyg0+kr+FHP
	2JhcDVI98RenEovPp8NUDH4RTdVRjMzNvBa0TsMk3po6fwaOSYcZjeDUYpuhINY0miFpAsnv3TYz+
	s9pRDjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvG0-000000001eI-3xJb;
	Mon, 03 Aug 2026 16:11:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvFz-000000001cp-161Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4955de8797cso13815145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773473; x=1786378273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/c4A3W/yWJ8G63KpRNdKLfab7NwGTF+mRH1tOy5r8yk=;
        b=TYeCO+j5Bq1bmbKc6Exog+jqah+zyAd8iOY13ORZTIvnMPhXOdUa+6am93dmxNpe+x
         L5ggPxwCYhevr6iq+Tug7MJ84YiqLjbeTkKfI++wqBjiZALz8Q6l/wnKD2Uo4ioJ4Xqz
         hIkQaFX1avZBLnSS5RSoNSqmyfkwKCut3zbkxE23D9+q+ALfaGj4UaUKDxeuMv1SJxy6
         4nVHt72ABZwfG582nCtnPNaexQe0Rxw8OYyms/nCodIBMpPXeZcruQjCgpqqyK0Vo5o2
         9QwStMkRwm2xhfCmi7jj4QsYFLjz9MYY1pM5laxkJ12rBE6q2Ds64cCYVbnyG+b4v0PU
         w32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773473; x=1786378273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/c4A3W/yWJ8G63KpRNdKLfab7NwGTF+mRH1tOy5r8yk=;
        b=WJbfk/9fOW4wp52kA2PyuPKQ1Tg7+u5uXkx2d3FmaJGXJd4Z++iO19lpSO/Ws64IBs
         ymwM4Bq620oVYqbXPrcIx8laA18o8apkKhzltJlXJawwqYxSkLV/WMjlHnnAGaPuum5k
         QNCGxcMj9gCpJU8rko09r1s4m1ZhitN8A2y4y6AF7grol41SAYNkJzqk8/oT9Nf1hfmd
         vCEMPuHbBFuyLkNJVsgySZuc9BZs2SYnWWp1WwYDftI4L1srArQyUii+lgJzUvP0bSDv
         HJUPAzeI435MwZ/gh4f5BeP/yGpNelnXUfn6ktQ92ap3+5/EhYv+FF4KIhpq/V5mhfZO
         OjlA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4v9XGYAPGjzd5VKOhGY13a5qYPjd5TL5ZsIkxfcseF72JYZbhawwA5hIosDgcij8jOR09BNfqjyM/yhP7E9dC@lists.infradead.org
X-Gm-Message-State: AOJu0YynxN9moPA7Cd0hg9qZzgSPNEoYd44YgJPQFOYq92dnbAdG0Vt0
	b2gPVImgyCmimfGCZUi5EtytGi09tPIE6nEzjSbBuwBDzv1q9iPRERGUNR/gxg==
X-Gm-Gg: AR+sD13fnJfMMlOltIpgw68B+hr8icxzvmFkdcrYlhWAb7/ovjz/7ihgaqSMNSranAI
	2MTYr6ZONok1935XyDm5oHGWT+u5NJCL8tffCt/sDFRJJoyCn84aMrjvgjj/LILL6fllACAuHp7
	AJ15uLky71Li3lyEiZVcv5zSot5P54Fc8BHfOmLz0V/X/qNBPxE9m/70vFIwt5Qwvr3qxFZ+9+G
	dH6z/h5F9nqNWVo/7xuu42tpUZKp/hIu9M/mJy02WTq1+1yOBH5ELmPhscbrnAq6BjdxY/HUXCJ
	sCcrVpZm9O6RNDqfJpFVBlxCaMJD40BIis0FZ1e7MzVht0+jYBz8FP1Y09PHCiXfrGtVI2QE2dJ
	Am1oZQsIeG+i66x0x4ddlGXHD03l3R/kzvaPjIQYxnyVo9Pu2giz0xgDc+DxEeALNfctp2ZlWfz
	JQor2cormHl/uIwh3dOCiMzv+oMXCKjeQh66fLj5JXAWRyqJJ1pTZBEK42YqOuT1nH81lJdpluU
	4dGegEqrC+RMEEyXsRnfo5t32MfBkrbxflYSBvYSvG09TjaEeXVVYTkp9moBYo14wLGTJ0CUzAP
	n0Fi/pWU2LDWPcnv/pHXapnLzSB40LqRH5yxaT1zA0IcIYb+lBgevholzh+uYpztsaJMfTX54bV
	ReaYi3LwU0/ApLRfRRX1W+OMg0EHRnIKcc420XUs+Axq+oi2Lki6t66Cx2xMXUmVdJ3DTGHD8Ii
	vS+g==
X-Received: by 2002:a05:600c:4454:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4980c64b6cdmr249435305e9.3.1785773472786;
        Mon, 03 Aug 2026 09:11:12 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:11 -0700 (PDT)
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
Subject: [PATCH 01/13] drm/sun4i: Fix V3s YUV scanline size
Date: Mon,  3 Aug 2026 18:10:39 +0200
Message-ID: <75ad4947981f2dc33fd42c05ae0b0cedda7647bd.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091115_314245_04628AE7 
X-CRM114-Status: GOOD (  13.66  )
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

The VI scaler line buffer on V3s can hold 1024 pixels for subsampled
formats, not 2048 as currently claimed. Since coarse horizontal scaling
is engaged only once the source width exceeds that limit, YUV layers
wider than 1024 pixels are passed to the scaler unchanged and the
output is corrupted.

Use the value from the vendor driver.

Fixes: 2586de70c15c ("drm/sun4i: Add VI scaler line size quirk for DE2/DE3")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 4e4226295010..b6cd7352e76c 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -785,7 +785,7 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 		.de_type	= SUN8I_MIXER_DE2,
 		.vi_scaler_num	= 2,
 		.scaler_mask	= 0x3,
-		.scanline_yuv	= 2048,
+		.scanline_yuv	= 1024,
 	},
 	.de_type	= SUN8I_MIXER_DE2,
 	.mod_rate	= 150000000,
-- 
2.43.0


