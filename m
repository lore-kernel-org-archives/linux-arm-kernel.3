Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA2BD149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzwKuwbOKIs7buN3elcmt1B0UWigEPFh+7jf57NrLvk=; b=k4J5bquMG1LJGMvAXLcp2eCu4V
	FpuLanP001x8s5bn2Y8+FxDsVfyZP8wUjTFtZQi3nNIJwv+5ZSyjaAbYk4FfGTitqu1CvceDlN7MW
	bTboQcvbAPtZylxJENEY/iV4oTF4N8hiMqt8uebLAAC7+G0mOJlR1Bz4HN3qAeWUuMcYHIRZRLhwY
	WSZzGgqb8AvVP/rLelH1TyAvv/CU9KFuwzkgcMM9bKnWb9SmgwmEbdOjLNEM8gEAD8yESNHjTgeMc
	u9yP9F/xJ+iorP0r8VerK3eCXq2BhpbWEyIZS0AkZKf0urGdWLQqIIqbW6lIfZol4kuLX9f/+O9kE
	UxJ38Nlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OrZ-00000004lZ7-0Q5v;
	Fri, 25 Oct 2024 18:16:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvH-00000004Y0B-0TO3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4316cce103dso29105365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876586; x=1730481386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzwKuwbOKIs7buN3elcmt1B0UWigEPFh+7jf57NrLvk=;
        b=j265e8Qxcul62Dk9Eg4Nud3rBrk348nuIHqv0Jbz72BZmDLE5u6WY3OA9Kfu5mqx3I
         x3SFBYj8DiCW2KXGi8BVqJtmJTTQo7rxHMzh9ufMsgD6rvI59sVptQ/+gY2QOq/tTwNh
         eY3MnaMk3xz9qNjhkEm/dIqf3sR9YTAD5fxTh7jd0nFqfvPC7rniCk+/DXHC4c5+r2FS
         Hb4nPUgn0jfZ/LY+I+Kx9Foreoo/y4d3sAZj1gV4qIeq3Tfue2U7Lc8PtH/nSAdqj8jr
         QwhgbI7nEYrbfsXwvqLvBGOIZY+d1n0XlLmq81/13rkrWkXVjBqPOHRM3PGeSX/vvYpw
         ABmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876586; x=1730481386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzwKuwbOKIs7buN3elcmt1B0UWigEPFh+7jf57NrLvk=;
        b=u5jGW3JBKK7K6qlbjaKwuaq0QiN0mB1oegIlOm9Ru4+J4QSjFfcso2aKH9MwUM+eNX
         +llsFUYXjbyGn4xr1nk6UEGf1M67e10ix9THMLa6K/PZmmV1g+UEYIgIlT66uvCeRonT
         CN8yxobxckxibbB7KA3ac3bKPF6PV8BS/3GbvAa4NO/SZHYvq969GFxjEAuyYKlHU778
         Bca5vYTZuZYvpYWK7gf1Ij65AVKLAftb0rKN+LawPt6rQQ7xSmYoGEO/1lgnxB0WKa50
         xbHcplFc9usP3IvVaftSCaoM1hFacwgxUn1rDBNAcoP1y6kNpWJHSBU+DpTsiLoQyIna
         kLMA==
X-Forwarded-Encrypted: i=1; AJvYcCUlW2uIYpiFiQhMdoznhNgpapkHdTrjbacYsuBTt2OoWm5OLyYDuRc6+50kSTGMblPAo8A6LpaeDYg32h1LKLvp@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ3YmqJ3FGzOCngCI1xaeWK9aoKJeLrAoGu030kmx/Y5JXHxnZ
	iYA/rt/pHJypN5TyHJR+1+zet9O7Tp3a3klJvruxY1Qd/pgmq1BRkhNt18bhR2g=
X-Google-Smtp-Source: AGHT+IH7L5gaDfJvqohyrKgLBPDvmZg9d0+cQq0c6/lsK6b6rkJJPh7+KHzVz4tGoS7jUbr1/odWlA==
X-Received: by 2002:a05:600c:4f86:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-43184157850mr112895305e9.0.1729876585617;
        Fri, 25 Oct 2024 10:16:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:56 +0100
Subject: [PATCH v2 25/36] drm/vc4: hdmi: Support 2712 D-step register map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-25-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_101627_298257_15D783B8 
X-CRM114-Status: GOOD (  15.28  )
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

The D-step has increased FIFO sizes of the MAI_THR blocks,
resulting in changes to the register masking. Add support for
it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 +++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h |  9 +++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1456966732ec..b9fc4d981cf4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2123,18 +2123,33 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold */
-	if (vc4->gen >= VC4_GEN_5)
+	switch (vc4->gen) {
+	case VC4_GEN_6_D:
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x10, VC6_D_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x10, VC6_D_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x1c, VC6_D_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x1c, VC6_D_HD_MAI_THR_DREQLOW));
+		break;
+	case VC4_GEN_6_C:
+	case VC4_GEN_5:
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
 			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQHIGH) |
 			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQLOW));
-	else
+		break;
+	case VC4_GEN_4:
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICLOW) |
 			   VC4_SET_FIELD(0x6, VC4_HD_MAI_THR_DREQHIGH) |
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_DREQLOW));
+		break;
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		break;
+	}
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 0046bdb7ca32..27158be19952 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -987,6 +987,15 @@ enum {
 # define VC4_HD_MAI_THR_DREQLOW_MASK		VC4_MASK(5, 0)
 # define VC4_HD_MAI_THR_DREQLOW_SHIFT		0
 
+# define VC6_D_HD_MAI_THR_PANICHIGH_MASK	VC4_MASK(29, 23)
+# define VC6_D_HD_MAI_THR_PANICHIGH_SHIFT	23
+# define VC6_D_HD_MAI_THR_PANICLOW_MASK		VC4_MASK(21, 15)
+# define VC6_D_HD_MAI_THR_PANICLOW_SHIFT	15
+# define VC6_D_HD_MAI_THR_DREQHIGH_MASK		VC4_MASK(13, 7)
+# define VC6_D_HD_MAI_THR_DREQHIGH_SHIFT	7
+# define VC6_D_HD_MAI_THR_DREQLOW_MASK		VC4_MASK(6, 0)
+# define VC6_D_HD_MAI_THR_DREQLOW_SHIFT		0
+
 /* Divider from HDMI HSM clock to MAI serial clock.  Sampling period
  * converges to N / (M + 1) cycles.
  */

-- 
2.34.1


