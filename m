Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA4BD149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjqh1NzzsNxf2iCinOb01EHYKOcZAWco0gW1TtgVpxE=; b=yteHNgkcfJhawrknw8ticHvCgN
	EOUR35rZeqGUxQFpclltkixDtu3gyZzCxPiDe9HD2dX3HO1BhsBtyf/P1rtmBDBaYfAzuzU7EuEKH
	LInqmvE1HNb/r3BwpCsVdLyDqp330cvKGHjAcC5A2v0v4XIHXEt+xUZLmn0Fc1uhsSU/MV61IziDO
	xZrRyMyyPcDLgrZh0luxEfoMEqz/P/jS8E+TthoQZDdce1TKY4Y1Qf8L0tX5Pdz6LW12pPb2uL2ek
	qZp72dxbQXCcqwDS7LuE8wpWpwceFJRkMzEhYVLeHwZ/v83obvt3SclB1Ts28XWZtwNTJY5xol0D8
	RJRNOw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OP4-00000004fd9-1GCY;
	Fri, 25 Oct 2024 17:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvH-00000004Y0O-1tmA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jjqh1NzzsNxf2iCinOb01EHYKOcZAWco0gW1TtgVpxE=; b=KsqbNcLAvK7W+Pvoz+uftp0ESP
	0Y+DHpSnsGgKm4/agXPvccQrH9iSRmOvDQ8i4qRqOz9B+o0O34vv0hM+rp1NJTfHWYW172cWNsEwF
	imazNQm82sHMIofCnCzMetBX7KBgtGo/qzJ0aeI1bJmighDVO332ygDJ3VVs93eZj9l5IVkm7kk7R
	e38180U4KB6SFK1qTnWmrjLRqA//b9K0EkyivVDEmCI/ffETQgEiZSRGcEV9tMusTzaz/aPmI0tWo
	zep8/G2so6Wu/XTuRIuKVMDlfuMFHLYqplPK1a+H7CsmQ8yW1T1M9xBP9KMu6e/YXCidX7EwpXH/G
	8YDCpAnw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvD-00000008znZ-38SN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d50fad249so1615231f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876582; x=1730481382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjqh1NzzsNxf2iCinOb01EHYKOcZAWco0gW1TtgVpxE=;
        b=fyxDwLKNyMMpS5hhPs3mugVsxtPrrW+94T5/NSGz8iNSQ8UqC2IljqPqE7xd3L8xbT
         cH6/xN7J1bOUfCYYoQQW/4VYa2oVFGVw1WsRRHRQDhMMXjl9GjNd2Wqs2TWRlbG4PAgM
         hZoY3XM3gSoK+9qIwFjIfQ+LmhJDutAPswbdIqjNYyfGrmifI3y66cP6obNvXMN0dis0
         697sserBnDRDmCtSelLlV/TB264z59u2DQK67w2bkHPp662e2t9hQkA9BMWDK43Dov5b
         POouxaCNfNjnm/Kkdv4tAg834CyuKdnzJyaVyA9vBwGfrVCv9rllOkqaM29acoJC4vXx
         tajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876582; x=1730481382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjqh1NzzsNxf2iCinOb01EHYKOcZAWco0gW1TtgVpxE=;
        b=qJS8eJx/xsil6TXaWFz6ibVMGh1ytRfy5cN0xA/JMi0g2i5u1S4CBcoXnpazWALzod
         qFu/E1KK+aS6dhvtG9zMJWJbAx7hthW5o6RRiXVq9JJ2cpfUyg3PxzX5cMv6q2Baf/Tr
         QC5CF1oJZdsmdd772tC9qcLkh6N+dO1wZn9Pj7YEXH/cUoPDCgXQgiOd3j+LesHsGsFE
         ymlK0YtiwqlNaA5S67yDTtNWfJip/u+8jNOieuETboF/bMnz6vxqw+X5jbw9ZUxtVXB7
         T22Y+jlr0mcj2XkJtVMcaTMX7K10fV580XtAQaqavIxmCCzvuQaBLdjfyVt18h7dwcV9
         Rt7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVl1z1W7dhmTayYGsKQuLi7QzjOOnNaNhlx/QftIZd9C+gy5qjdTBH8TVkApHvEgMDVfNu5aGxXNwLEbWVKDDVr@lists.infradead.org
X-Gm-Message-State: AOJu0YxUTv6/SZLbiXRvndM1LTftkczqyk9Z0DnzmwWMkOmZ03yqxblq
	5Yn14u1U7PUsYnvNBtqTUhd4xdsfw5UQj6oxv/USoEM7Oh7z9i6L6qOJgLJIcz4=
X-Google-Smtp-Source: AGHT+IEQsz/ieGCoAjrNeStjHY3m+yeckCVb8DDV3/P3RxReILzsgdvSRPsp1dMVqLFx8R4lAqslJA==
X-Received: by 2002:a05:6000:b0e:b0:37d:4fab:c198 with SMTP id ffacd0b85a97d-3806115a9bfmr105090f8f.26.1729876582551;
        Fri, 25 Oct 2024 10:16:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:53 +0100
Subject: [PATCH v2 22/36] drm/vc4: drv: Add support for 2712 D-step
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-22-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181624_276391_156EB9D5 
X-CRM114-Status: GOOD (  16.01  )
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
Reviewed-by: Maxime Ripard <mripard@kernel.org>
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
index 7c2dccfdb58d..a353b51243a5 100644
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


