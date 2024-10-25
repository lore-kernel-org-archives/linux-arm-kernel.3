Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E381CD149E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLNEe24VVIwAaP5agwCiuxY7rB4nwlR4wJvUVCZVQ/E=; b=B72iuGuAhNPL1X3/H62enXJMKf
	DbVOhlHel7BstShLSFtv4bZcErsilHVY1NnyYle4CzBowSruI2wp2OcuVFzsCxvZEhZEyp/gx3lyT
	6raRbEXFzcEEDfkZWb8kj/ghXijZECzKYTKCedc2ho9Zd2bGRCvsaeqdn8Cpoo7Borg00Mfejfacs
	xBCp1GzCF1GTIk+iFCDfwri4kCw1yXfTxf/XytvsV1+a5vVvrs+g42froGY82UQNufRIGukWG4bvS
	o+PSW1sTiUwzQcqAxSOqA8BQYLOR50tlXJnjQQ57lUy1+LG9He1j5Bp910RvixLoElKEEY4CgPCmF
	jyNAzKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Q1r-00000004zQW-10Oa;
	Fri, 25 Oct 2024 19:31:23 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvN-00000004Y45-077V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:34 +0000
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431481433bdso22310075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876591; x=1730481391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLNEe24VVIwAaP5agwCiuxY7rB4nwlR4wJvUVCZVQ/E=;
        b=WhVkMMISxe7Sau3Fi0ytK0XYjNEAUgq7GzAY3B7hCaoQtFwveS+Katp27LVEfhmqom
         hg0iGqeygiu8DBsG0rn6acD8sVvLcRkIRM7a5WUciO1oTG6eTzhVLU0MUosz1KIJ6QwU
         U8M7PVMw/p66kQ7IR2deam6ZYGFWReKjXXB4RQIrH5ieBwqVGXFjVCNuGXM255A+dpMT
         987EYclosgWxPKPXZzNZYyQ6brSPxZx47+8ZF7WTIQ6htSE2+5g5LzGBAoxAlf6FaUHS
         bN38e6h289iIkh7rjuWRy0t9l6oC8uyKiBWpb6BWHARayBoryFKFhyV0AXVBNNzp9j75
         TrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876591; x=1730481391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLNEe24VVIwAaP5agwCiuxY7rB4nwlR4wJvUVCZVQ/E=;
        b=U0QDTeqxhYdZ3d3gWYXv3rzEbCQIagzh1k6Y2lZ3AvC6+npOrsIPVyToXJoJDQosty
         yv4DJ5weW2Nef6e/eK/FpIoN0/lq5IK6/4uPf+zUuVGraJnZGg1C7nWI+0RlbNpFpSYK
         M5ivYiqoecqwVVBmmbRC+jvXVuYNWhT3fU+uuULyVcWzipb4I5/H1qClcjGjseIb6u84
         xyrN9zFLXzILJGGTUbqo4kbqYYLWpLJkxPN0RYFWEpsgfC2isPqG7zrJEFrfzLcgNQTQ
         efMnD86G/i83y8JgFbOdcu8LhaOX3yS23YZHJp70cN04ToOGZdrPef1mdGQvYq9YPz9m
         +l9g==
X-Forwarded-Encrypted: i=1; AJvYcCWhUrhjcQQhopJBILmMo28fyDs6xzNuK3SrMNrjO536iW/vIpnBSzQCjBWBSWpKdBeac8xRCnTCyXr4qrD46Phc@lists.infradead.org
X-Gm-Message-State: AOJu0YzxB56GiK/bsdNAzHOCdnDZIDejkCoBbw9mK7jASZRYoCOajxqe
	O8qu+4pYmq8RDz7YVA9SwU3hmtbNBYIbeWdwODC50oLXgVImwHUfWu+NGsqn5Ow=
X-Google-Smtp-Source: AGHT+IEf4KZxMhq0qk7/lCgwke2nZYw7jfKwbBRjQajizbRblmsymhNJTGNxxKLe3CTSVhp57vlUig==
X-Received: by 2002:adf:f411:0:b0:37d:4e59:549a with SMTP id ffacd0b85a97d-380611418abmr124517f8f.16.1729876591324;
        Fri, 25 Oct 2024 10:16:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:02 +0100
Subject: [PATCH v2 31/36] clk: bcm: rpi: Enable minimize for all firmware
 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-31-35efa83c8fc0@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_101633_114789_1F5C77B3 
X-CRM114-Status: GOOD (  11.18  )
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

From: Dom Cobley <popcornmix@gmail.com>

There isn't a reason not to minimise the clocks, and it saves
some power.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index d374538e7108..9f716b2223ae 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -111,21 +111,27 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
+		.minimize = true,
 	},
 };
 

-- 
2.34.1


