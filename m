Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DE7CFA459
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsBVoQZ8zap5DslrzzzsVJMIsK4Q16E87oM6AvNUOjA=; b=b6GPNycayxH2NzOG/cXbYSDkkk
	fyBi1zJeKeEQpUvngKD6cKYFpZQjVX15fU+kRbr7B70sBEj4hAIL5bWpFcYrooe7uEyFvI+vFm3GH
	sipcgI9Rfv4syHRi1v4wTQKCEpJTLfYwlEu9UuZHM5aKH792k+jr+IntOf52c90B5t/ZTfe/UBxbY
	t3foD8bh1hSgEW2SZMx2g6ZiVLDu8y7prNGI0SHq1bfvTpU0vhoQk/SFi2naMa7vnXkaIo3U1R5J6
	IgIsST2TXS0uUmnOYnYwPQlTk67VTZrBmhn5F+E2ycmDbsb+0oac3zOS7qjo+NexGm7+NMhlM5wsP
	81Fppm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fFf-0000000FO3y-2dWI;
	Wed, 23 Oct 2024 17:34:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYq-0000000FDGr-18WT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d518f9abcso4769582f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702214; x=1730307014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsBVoQZ8zap5DslrzzzsVJMIsK4Q16E87oM6AvNUOjA=;
        b=cA6fHvDmon2zxoC0GIoefIfPdjrpHXao8SJLDVEF4RTRIEMhbNlewuhb4a5DClKs90
         OoWv0KD+PXIuhesqsZbMcrhmJnCENwbW2PVFH05buzAk3zEipWL0bbxUS4u0pOueuTND
         OPNJim7h50qiofFx/yZXbwTeD+nsFsU5oopW0dWHPiPePi6O4+m+nfmVjDssy0aFXlf+
         rSXuv6qxA1w0rSQ8vlYmEvyD/urf7eGEome55HcK/0NiVuLFKjWfSKzPlvYz2+zuyBRN
         2et5FrH5HeyfCsDzwSubTF0g7qtZT4aWBHXsDYUw2PbROupd7qhxeh3dxdCiskLUXCVM
         RvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702214; x=1730307014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsBVoQZ8zap5DslrzzzsVJMIsK4Q16E87oM6AvNUOjA=;
        b=Y1XgitVJwu6s3AzzdDjwxswgtSWLq8aMZre7LujxiUCMZ4syw06yhvSgShUuAmyIQb
         sZwRn4sAYhXoAowTgxBs1UxjSTQMlkt6rIgs4ARIUSX3HP/YtxpbFoGfnhU/M9BrIKQI
         WVRYCJsZP3dNM1LeUYonLH5fKFxp22YlHthQKUnNijTK1Ps5Z6qwZlwd73IzMF2Z1GNh
         uFeRp67c9fy1Py6ncL4LDlnEpKIBLn642Q5+O+CLO2eVS3aV6fqscYlY6RGqQFS1IIUS
         GehWVS3vdH9ll89XI5fLd8D4wmjnMnqh5yKoo4N27AC63PftjSdg9yA/le/G9zbhMobZ
         /zjw==
X-Forwarded-Encrypted: i=1; AJvYcCXTm7u+zCrOzi303iCRQ1XhKHtVGdIkkAaTtjFV04A1cDw5O+4yLgOAhY6E2V4tvVpqoDqi17YSemob3YoMlZ0D@lists.infradead.org
X-Gm-Message-State: AOJu0Yxce0D/UyJHZrSSwW6cbYYcjwh9AytTu2iSt4nYX3xjavvOvOph
	S68K24rNDNr7GoIEVKj2RHFFqy8nNiYdCXPyAjUyWvfq5cTSsL1LqdJaX2jbVrI=
X-Google-Smtp-Source: AGHT+IEPMevLaP10jHP2kjP5QjuvQyoeAseVICs2i6vuIJvW5BstXAY25poTAtlyrCUn0K4+h2nj6Q==
X-Received: by 2002:adf:f6d1:0:b0:37c:cfba:d16b with SMTP id ffacd0b85a97d-37efcf84673mr2298249f8f.44.1729702214024;
        Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:13 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:03 +0100
Subject: [PATCH 06/37] dt-bindings: display: Add BCM2712 PixelValve
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-6-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095016_348773_F17CD74F 
X-CRM114-Status: GOOD (  12.64  )
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 has 3 different pixelvalves that are similar to the ones
found in the previous generations but with slightly different
capabilities.

Express that using a new set of compatibles.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
index 4e1ba03f6477..6b5b1d3fbc0b 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
@@ -20,6 +20,9 @@ properties:
       - brcm,bcm2711-pixelvalve2
       - brcm,bcm2711-pixelvalve3
       - brcm,bcm2711-pixelvalve4
+      - brcm,bcm2712-pixelvalve0
+      - brcm,bcm2712-pixelvalve1
+      - brcm,bcm2712-pixelvalve2
 
   reg:
     maxItems: 1

-- 
2.34.1


