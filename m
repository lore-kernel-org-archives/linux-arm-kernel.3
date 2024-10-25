Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4894BD149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=; b=2gPB0eW+NVu+0FcD8uXLq1ml5v
	M3robCqzBSbVCmook4Mzg3Q+aU40rfVD+WH7e82VDCTnVBxDco+FTR0Z9lev5V58kzS+4u5/KJo+O
	pABY3CIAYo/I9yhrllIUw9GZKSxOgRG4zkFuv/WLTbmenxi4GZ67frf8cJP35E9YEatuclYYq5Nt0
	FJI+eWYyF60NU4Hbz5H3heZ0TMmZNaNCygWrhVisclVNWrf/s6iajbWcKyfTS4PA78EmFE7NSaJYS
	Ys8xd2CYzoIweUm2BQr9ByI/Ic17EY0VjAFCl7GCkuLgRhZp7L3IcV28NzlY5jD/kOQHpxNt7Ldxf
	ry7mBXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OUG-00000004gWF-0qvQ;
	Fri, 25 Oct 2024 17:52:36 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvL-00000004Y2b-2Nyy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d4ba20075so1501452f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876589; x=1730481389; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
        b=YyBmZZq6gYLLC7RwNmgpILkagipamnB08mG1uUphKN8m0kpsu79Ck4oXqNvcWharv8
         3qrHHlOTfPWJ/7DGGH3QX+GfsULP0VPl2E+cmNTlzRE69wLeWD8ozsUXY4cmeU6FSvNh
         N5cMg4Tid2+63HNCXe/pU9C+0jyZMCLaRe0owA5slF0T0d3RriKcLsBzI9zqD+8eFE+m
         QivlnCQiva056zQ9eu0JlhI91U5YAnlVAy67BkFI16RUpQJey+UP4gsAI0KxTbratTNT
         WHBeI0rXNv5WKe0qXMZYNkPJNnpHSYB/FOCtMlN/AgeDEJ5zgeO/3eAWrZ/syIVZ0NU0
         +kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876589; x=1730481389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HllG+0A2vmKjdDSzHIHJZeNfO9C2BUneILRyscFdw0=;
        b=ia3L6biEMln/AD+TBhwV/aC65VjFyErLO1yTdZpnS5pmufSl3xeED25IHy5NUluJfl
         Cx54asz9rPcgQ6Alr6dfXh/0F7mBM3wDaccXNgk5qo1SSFmlLGi/OQNcG2LYwX7w/cCZ
         CitOIrMISANwpieMm7eyYCvkNK5cPpxY4nZH3ysc2PnyFuMPDZdyIx4Ih0P8sssEuCJS
         NXbpAIPkJqJjTraPDuKeHyKv2FRTJJo91KzvEMSoZ1+RuHYGejwa0t5ujYIp3lKamTAO
         SlWjNuFto3NwVLwc27R++qKdojJb+BYb/M93eeCx3Bc/OD2VjuFkmoNEkx0QoOmvbtPA
         T4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWHyummiq1JCugmN38410gGCdSU4xLrMJnwVubR++JuJfsNu1WNexZCIKX3LMF1v76f1lv3skoxFtKO/ialpd1q@lists.infradead.org
X-Gm-Message-State: AOJu0YxrkZXM4T4AvgXnX9xLfpRZYMGIES+niO2HvMg/tZxZspblSIjw
	PwlHcnZ4zT3HgkiF8gZGwZVgM5sqRsn40bRu56aUHGLRmD+nbQvbxw1KgEorZLI=
X-Google-Smtp-Source: AGHT+IF1bjTItLZYzib0RmBwDucZt/dcZd/G2s0GqNKrDbIpCMPlI0IgZqsUCGHdxbWn04sHiWM6eQ==
X-Received: by 2002:a5d:440a:0:b0:37c:d1b6:a261 with SMTP id ffacd0b85a97d-3806122feefmr91002f8f.59.1729876589515;
        Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:00 +0100
Subject: [PATCH v2 29/36] clk: bcm: rpi: Add ISP to exported clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-29-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101631_618844_B3DCFB69 
X-CRM114-Status: GOOD (  12.16  )
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

The ISP clock can be controlled by the driver, so register it
with the clock subsystem.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index a18a8768feb4..6d5ee1cddded 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -118,6 +118,9 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 	},
+	[RPI_FIRMWARE_ISP_CLK_ID] = {
+		.export = true,
+	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 	},

-- 
2.34.1


