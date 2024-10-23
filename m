Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB0ACFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWOdbW9r291k0JLZ0WclOypLE+F7cuj+vNJzDbk38ZI=; b=EmKgRTEVGggFTEpGDoxsBsEtwq
	qdeDdcAANhcp5H15Xm0qFw4CtKNM7R2zT7Mdeiasd+bQ6rnbA3FXaqSyO19QFBLtm2nXCRYr28KlP
	DEpag10Hrs1G9FIvCFJmOvlKjGaEh46CTjPej2xiYJC8A59zeXJFL8+Xhzfn/hC3bKnAiVUiK+JMo
	X1kiWZ18UFRqHY61Oobww+QgLFDH/e5en4efY++1SmpmYdSFlqYoYA6L06i56JA4hUgCA55kKo9dL
	0szWXRmM4YZpAmDr1N2bldATKlxuu+cOfISoo2s6rmlsMAWbj0Nh7lwVLzuYpP7rF/kmDcYj/eZDF
	+mZ5QzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3grv-0000000FdEv-1Ovq;
	Wed, 23 Oct 2024 19:18:07 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ7-0000000FDSm-2eLO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:34 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso42937565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702231; x=1730307031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWOdbW9r291k0JLZ0WclOypLE+F7cuj+vNJzDbk38ZI=;
        b=B99VgAZapA8Mfq8oWpEtz6bT230iqRWCYlaNZuMDn/n1s4TB8g4vqaNbs90weQmGgO
         CJjyaOCZyvRIFAm2GRhZToarmFP/76wj5eAoVue9qRi7kV9ERsaMQXxpq/n+oKbfOBeK
         vpf3goMos8o1LF7LPk/Tg/kv10X3r5TEQu5oyF60Vxe9pffzkJxWvd5mTtre5BHTVby0
         L0tIrEX3oHYmWi0eKP1clLv+7EVYGurd9HXxqAzGg1chZ7b8Wrhq1na4FwNr1HnqZhFi
         BGV29xv8tzp0InMZKT25DmOqbOfRGtp6GlUdpig42Sv+GHEjb+WYsgjO3Vkod60gJKEs
         Ypxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702231; x=1730307031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWOdbW9r291k0JLZ0WclOypLE+F7cuj+vNJzDbk38ZI=;
        b=qHUNgwXBe0/DXa7uFvxVU0q/8iK4z3aEcC9bWjENGy0/lJus41Cx8x+Y5sOhrTfspV
         hiNgIhHwP0jxgat/hliEyVzn0rppCDIYOJm+C6J5AMlyRz8VBzGlv/6ak2evHDMT04kG
         L5IKXuAMS8q5hkHNnXBZhDApf1FqClUSZmngMceAjlb5ZlBnGuBSai9qtpvsyPSG7I4C
         xUIn0Ac/QKQlrTCc54ujjOggU3jKmQRVqAX9JajsLeq23GDsoVthaWCHKZgxo1MyPS0+
         U1MhYKVOuGJIEn8euuaMe93ju+TCjKK7HgpP0BV5pmoL69MefNFH/ICLIysTwKfgGUiA
         Su2g==
X-Forwarded-Encrypted: i=1; AJvYcCXNLIeVT1WT69sWyHG1/9a+n9sHkZGWSHx3M/cMk/M9Trvn3HiB/p3MQea6/kDOn6+rrUdZmXxwT5UjrNongSpf@lists.infradead.org
X-Gm-Message-State: AOJu0YwPokMUqHq1vNWF4berKWtnqiFbI00PIG6kf+WX8NGk3g8HLfaf
	TEeOf7gqPNplf9AMahT7s77Qco6y5Ydk5yVOq/Yd3OJAfdBZ8k8dHlH38FsbDWA=
X-Google-Smtp-Source: AGHT+IGFlT9aIT0ELBQ3fGLuocjkqWYAz5lioaoVMV3JghaR5fVi3lzSzAvTX/9JlAsFJlj3SG7awA==
X-Received: by 2002:a05:600c:4f10:b0:431:5bf2:2d4 with SMTP id 5b1f17b1804b1-431841a2ee1mr29394055e9.29.1729702231586;
        Wed, 23 Oct 2024 09:50:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:20 +0100
Subject: [PATCH 23/37] drm/vc4: drv: Add support for 2712 D-step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-23-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095033_722286_5A2E8C63 
X-CRM114-Status: GOOD (  16.16  )
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

Add in the compatible string and VC4_GEN_ enum for the D-step

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c  | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h  | 1 +
 drivers/gpu/drm/vc4/vc4_hvs.c  | 4 ++++
 drivers/gpu/drm/vc4/vc4_regs.h | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 94e01ce2b1ef..fb91e771e345 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -466,6 +466,7 @@ static void vc4_platform_drm_shutdown(struct platform_device *pdev)
 
 static const struct of_device_id vc4_of_match[] = {
 	{ .compatible = "brcm,bcm2711-vc5", .data = (void *)VC4_GEN_5 },
+	/* NB GEN_6_C will be corrected on D0 hw to GEN_6_D via vc4_hvs_bind */
 	{ .compatible = "brcm,bcm2712-vc6", .data = (void *)VC4_GEN_6_C },
 	{ .compatible = "brcm,bcm2835-vc4", .data = (void *)VC4_GEN_4 },
 	{ .compatible = "brcm,cygnus-vc4", .data = (void *)VC4_GEN_4 },
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index de2107e593c2..e3983a44e35e 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -85,6 +85,7 @@ enum vc4_gen {
 	VC4_GEN_4,
 	VC4_GEN_5,
 	VC4_GEN_6_C,
+	VC4_GEN_6_D,
 };
 
 struct vc4_dev {
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 5606ded928e4..b698f7070510 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -1532,6 +1532,10 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 	if (vc4->gen >= VC4_GEN_6_C) {
 		hvs->regset.regs = vc6_hvs_regs;
 		hvs->regset.nregs = ARRAY_SIZE(vc6_hvs_regs);
+
+		if (VC4_GET_FIELD(HVS_READ(SCALER6_VERSION), SCALER6_VERSION) ==
+						SCALER6_VERSION_D0)
+			vc4->gen = VC4_GEN_6_D;
 	} else {
 		hvs->regset.regs = vc4_hvs_regs;
 		hvs->regset.nregs = ARRAY_SIZE(vc4_hvs_regs);
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 731b13742ef5..df44a4a4009f 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -527,6 +527,9 @@
 #define SCALER5_DLIST_START			0x00004000
 
 #define SCALER6_VERSION				0x00000000
+# define SCALER6_VERSION_MASK			VC4_MASK(7, 0)
+# define SCALER6_VERSION_C0			0x00000053
+# define SCALER6_VERSION_D0			0x00000054
 #define SCALER6_CXM_SIZE			0x00000004
 #define SCALER6_LBM_SIZE			0x00000008
 #define SCALER6_UBM_SIZE			0x0000000c

-- 
2.34.1


