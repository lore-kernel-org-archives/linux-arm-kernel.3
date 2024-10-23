Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D46CFA455
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UraO/WfabHwA0kcDmdostvPDiMjVW2AKFSzHSQZmNBs=; b=UM+2CP2jSobwFaKYEsF67lfzvf
	vqxWVOJbfYkXTfpEF8T8KwKynL7m3hBc66GpiPrzcu7T2cj5lCuGdndUetKBvTqpsxLbPugxk4DOJ
	H+Qvb+XwLdlEpfbYpdLGOAWL8Sev1K4HylJAW4dHPcbNksLEyW8ah259AUMspDocg98cR8VTWqWpg
	romPJvWwxeV1tH053yNz/zs70CUKrQs4e1xoFIeSkkS5vF0FH6UrXd61Jf5mO6EmdIZ6U/INqfhEr
	Fp8Tz/w6ziAGDQNI3lXgxdywWj9I2l8Nwr96+kLfhw2pAFTts4kjsaTTAQJ4MaDfJy8FXISlmAz2c
	PmV2lepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fCh-0000000FNnu-0B7T;
	Wed, 23 Oct 2024 17:31:27 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYo-0000000FDFu-01rL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4314f38d274so95856605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702212; x=1730307012; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UraO/WfabHwA0kcDmdostvPDiMjVW2AKFSzHSQZmNBs=;
        b=UeEyI0GiAa2AwdTL+F03Vtx9lbQ8gP97KTi87M/iq6s2pfMqcrpEb/17EN/Ml/8iEl
         LkwCITnclUf7sJCSBsKIc4AygLMEgM05BxXdbbv2BKNMtflEenjS3qiQ7V6ogiHp4c0l
         fz9RceL89sINoNCVuC+/wc5CTrY8cVQKoHDFijwKghGb1bip0IYEmgAeX31P3iQ92DnQ
         a65ZIH/BwxU0P7xJn17vmHSqRoASXYurX4BuikQhRJnPDe/VlOOqevrs4Shud3SbZ9Kz
         ZjLVMTRVJyYYgG2nZetaX3H/aj2B1DiRixxbXogS9IJ4bWthY725/bGO46d8QNdroHPa
         0hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702212; x=1730307012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UraO/WfabHwA0kcDmdostvPDiMjVW2AKFSzHSQZmNBs=;
        b=bxVhUoihKJVqtyknzma6QaU+IyQ6pRbjeFA1uA1siZbdf81CVDnvZMmHezw4D6tA3l
         CyfRHmc/gCIhDAjWJCT1O1X0uyWwYkZ7wpnl+6HpOoIOvfF/szYeM2iWnoPHt7ZrRJZX
         aEPWJt8/ZyEJjdPhf/fgQTSIqFCNq3JLCG+/8EvbQsVgpCxEcgqnzlaLFIh2XiHgwkuC
         T3Pbd3M2Wr7sHR9Ay7JFNqvdkWidBwmJ8es78Qkkx4iZqb3ZtZYB+/UueflWJAtGpC40
         G+XE6UHqPyA50Bt6s7aoB9ePZg3HFG0Cpjic5esx1eOTYB3sypMW55rkKB3Qzn9/OWmD
         32eg==
X-Forwarded-Encrypted: i=1; AJvYcCVpwAR9tJTnMa/HEYiwvv9RckxA3/eVAD+nwwx4+4ksj6M/W8CqTxawg778XfF3snKSWLMbdj7DoEEIlOVwYtPR@lists.infradead.org
X-Gm-Message-State: AOJu0YynXS1EomkQK/Zet1oSl5HCMaXdcM925rvHy8UdliLm94qdUlgS
	O1bQGaOm8COdV4DxV1xF2yrO3ctKxtOUfOKpBHnpbFrIKVKlTOHbZZy+nw7ZY44=
X-Google-Smtp-Source: AGHT+IEZ2TQIiD2rD7dtSbDNYkDUqcAgoqtisqjGeExVyCYGMYZ5lugyYr5OzlQS2JdAABbh9QpYMg==
X-Received: by 2002:a05:600c:4ed3:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-43184213763mr34326675e9.21.1729702212298;
        Wed, 23 Oct 2024 09:50:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:11 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:01 +0100
Subject: [PATCH 04/37] dt-bindings: display: Add BCM2712 HDMI bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-4-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095014_487114_D8DB3C4A 
X-CRM114-Status: GOOD (  11.59  )
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

The BCM2712 HDMI controller uses a slightly different HDMI controller
than the BCM2711, and a completely different PHY.

Let's introduce a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 5b35adf34c7b..6d11f5955b51 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - brcm,bcm2711-hdmi0
       - brcm,bcm2711-hdmi1
+      - brcm,bcm2712-hdmi0
+      - brcm,bcm2712-hdmi1
 
   reg:
     items:

-- 
2.34.1


