Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D20C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=btJKmFZ71PTN81h6iDK1kwNhJfje5OxrPXb/BOZ4f+Y=; b=C9f3WNwvVu/LnFIwHABMgj0SGp
	LEd0Za0+vR/Z5NUhXAgpX7HR3EOSfAZKVJzS/cPA4ikh96j2f/7msMdhx2sJJiMabnQjqOIWZy7TS
	TqDl3q/uSnkcnL4g18X5n7rFFcCPEocY3vsH9cRelO7AKYmSHnjs9vLCorQlcRDUKGhBefQQlz/Gk
	3l8rTogucPKhILGpJ4Bv6H4JKZqGLf+fj7LPUWPuP9CaF7Ubw+hqQuyFx4vJyt9Sy1fsCOYhqTvHY
	kaSms9Cn5U8CXUwv8838hcumi1lc5TUmpt8wHXnoBlQ0JsVHr3veO5nC7j79pf9G2wp2/L4h7xz4l
	2qbVMcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7bn-0000000FMnC-3ohc;
	Sun, 23 Aug 2026 12:47:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy7bl-0000000FMmA-1kA6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 12:47:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-698ae9da373so500509a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 05:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787489248; x=1788094048; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=btJKmFZ71PTN81h6iDK1kwNhJfje5OxrPXb/BOZ4f+Y=;
        b=llQYeu4Thkk9U1ZmkkrYWuQq0kErWBQlApWXIvTwa3vMcGnkhkr5b3o+UXR2y0aq+m
         GG8qaT5YR5cDjBlbR5k76G3JkJqX3eBgdUkP+z7+mRRllJ1JwLM9WSi5ZgCGkonyAJ1A
         gjE9c9BUNEYp05UDbnXRg4S2BC8QKSv0sCZsZoM5FCuqSlCfDvyoYR3Oi4pzOCPwWyRo
         eB9WrszvDFU/zd4h2QBM55h+vPkdFbA/3vVhmjidSe/hxjsStgBa2BPXAzyPtXv1oFYO
         LfQeruibOsjGLxCCQVNiQJTgp3DeYVW76l7ISc1eysYd96pQMg3hLK8abh23eRK1jmRa
         0CQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787489248; x=1788094048;
        h=content-transfer-encoding:content-type:content-language:cc:to
         :subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btJKmFZ71PTN81h6iDK1kwNhJfje5OxrPXb/BOZ4f+Y=;
        b=NomPzvUfdNpC6f0KJENkeXt4RVjtoGvkeq20F8PQP8m0ZmCL0kziQHpIkJb0hBmF6I
         PkbppZczG99HPsoNT++Ky2Lq1F5KRy80Lc7YnfCxhYq8U7SlcaW3G8JmlyADGnSD9JS0
         sd4emMNhNJkUzgK9ZXiiO5vJf0BoJWxVEn80hYQudpeiG0AmIA7/OGU6s+I2F2eOOmzj
         /Gl9Q04KmkvGox3yZk7O4kHu5plN0vg2CR7V970AznROZQwBRz3mCibScdryp8ee7o6E
         QU2AjEW55gsFkpDAYGnVAC93wfGhguVqTNBMhRjQ2ks3GY7nIyXG64I/rMKrGVc97J4f
         ldFA==
X-Forwarded-Encrypted: i=1; AHgh+RoeP70P7w5wT7rkGTd4ttWkgoMKEJQHcIQce3PenatjWLr8m4UhIU+gr1+iLrk/igpfKZ53ofnF8Sfif6LqcFoS@lists.infradead.org
X-Gm-Message-State: AFuF++nD2vJFYME2H3B6ytd0niFaFAv6IiWm7q5MfHwlxfWanubAO3rn
	X23bBRDN47X4TpBis70PUqirryjhbjym2EjDABCzFJRF5VqnXmLsmf2n
X-Gm-Gg: AR+sD13XwXUOqU7Oj1pW0f4k0OLLO1TIu6UJ0OLkxFF8VaccuEvZFfzQZoZta1gcgPO
	GBmQx2yqw481S1gPZj0YAC1uWHnhcu//zTkOrw0MqsJz+MXXLJMz61wzmHG0XqzvoWpj0MIGwrw
	Vl3IsybRHCp9eVS6oECBOONcdb8DU+Lj3853gclul6gPrihhiNQiJ3raMR4R3YatFjllxsb/Gaj
	s9kP0hzFFryfyZIvw8pQSZIcvL7HPVOWo7oM3W32xAHV7DTZ6CikXolJGnOiBpmNT5cEIGS8mNg
	ABUX0ArKWNDi7tKbVv7D+kzUMpkNJ0FhBCJMY7e71USGIxo63NWPpujX95PnO2HYVqIko9wo6R/
	rua9pZ3IEz4/dviqGuywPPdYYR0SAnJ/kvEA7XXZ7EIWnLYl6SkmL3IjLWbuMo3tslAyk4FD2Qj
	qnaDYpC/QYnj4AKrNHbXNbx0lEqxDdP7XtbsdirANPktCtM8XIHmHWpY8GYkv55qOj5Df5YOQw8
	Grzv6wgXyqzaN2NJOKvN7i/XUo=
X-Received: by 2002:a17:907:d0e:b0:c20:c5f4:e19f with SMTP id a640c23a62f3a-c246a65fe29mr1194669566b.4.1787489247274;
        Sun, 23 Aug 2026 05:47:27 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f809bsm881373866b.41.2026.08.23.05.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 05:47:26 -0700 (PDT)
Message-ID: <dea8a038-577b-45da-bff3-703e9099b7e1@gmail.com>
Date: Sun, 23 Aug 2026 14:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] drm/rockchip: rk3066_hdmi: convert to
 devm_drm_bridge_alloc() API
To: heiko@sntech.de
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US, ar-EG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_054729_469150_9BFCB0DB 
X-CRM114-Status: GOOD (  11.31  )
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

The function devm_drm_bridge_alloc() is the new API for allocating DRM bridges.
This conversion was missed during the initial conversion of all bridges to
the new API.

Signed-off-by: Hüseyin BIYIK <boogiepop@gmx.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index f28d6a883e09..39c65ee07caa 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -703,7 +703,6 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	hdmi->bridge.driver_private = hdmi;
-	hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
@@ -747,9 +746,10 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 	int irq;
 	int ret;
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = devm_drm_bridge_alloc(dev, struct rk3066_hdmi, bridge,
+				     &rk3066_hdmi_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	hdmi->dev = dev;
 	hdmi->drm_dev = drm;
-- 
2.39.5


