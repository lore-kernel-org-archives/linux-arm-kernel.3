Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CD7CFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAjOVOm4fq5ab1k5/gNzUlva5QRzYnK+y6SB2b/LE7w=; b=n79abPeNsas5FB2D5nDLeU/Xem
	tzDSCpNqEyxyACFdfRVh2AZFi0PjebWXUgOHpRtEdcHN0iBBdLmaWoZlwMAQlITIRbbjfIT7OsMCj
	DULNSB1IA+Oi6lzssuuZ9k01jjNyqf9iy8gmI6jwtaztFReI56Qtkm3S+PrBEWujZz8UdhAaewbGf
	AZuJg6YNGPABWJiXXNvyQVbDuUx5wco1bzpfQ+bOdVlFFYSY2reFMLV+g7WMWMDJK4w3wx4RWEZ8A
	fYZ3FiTSG3OQo1FchlwOIeylBp5eD7Y5UQbisfQNlA3g0wGFcLpYlCO7pOQA5E51PNVTGyu9iRCS3
	K4zEhlyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fet-0000000FSOy-0jNp;
	Wed, 23 Oct 2024 18:00:35 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYt-0000000FDIu-2inZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:21 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so85339835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702217; x=1730307017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAjOVOm4fq5ab1k5/gNzUlva5QRzYnK+y6SB2b/LE7w=;
        b=JJ9fCeuhy82UYgEAftZ7B29q3bwLCzFR3BTC5RtKeZioVFAJRbtf80t6tVw9QAg3QQ
         ShF6hqldL25SmDvzDvXzxZruEqbGTkT05moA6O2rhWdqXJvJFUiQAN5NjnINZyAyTMDp
         vM7OHR6e1erNAk+MVjmtAJlCgfp3rt3qQFys53107EX1H1LD7XKE+cCUrvX0eACkTamH
         1TAyzPNWWV5J8y3k7thPFE43rzZqyethhcKsz6NQFikMUx2mS7rqlG0ZTfFBbX9nHj4V
         uYbNm1iRapYzdWz5+Ff1wY+5ESCDa7oqJMI6N8xVTCJmzZ6NZjRVdoEj25OsMuptOVPB
         eyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702217; x=1730307017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAjOVOm4fq5ab1k5/gNzUlva5QRzYnK+y6SB2b/LE7w=;
        b=C7Qaz57+sPs+pStY1oQLmTNNS1kbAoLs9tfgENgj1Go0u7ZMsrqMwgMy2apYg4o6JA
         Z0GFNUzmfQLHNmqSA+mO+PM71ZpqvRy8QdpxkIVKRIDuFNUEcGL1IfLFpIyyfqqTG/SX
         kyeP3/4zsivILfcNrTycuHPVi4NNXI/jwGiqUkv/4q9EM0GybT/Rkt84eC13LHPYRkQd
         cNawrfu8z97Iape7tg7IYaUThHanAVwVIQRYctUjet5FPIugQtgGvU5+ZTCTauLP/vpR
         mPkGaqB2THvcW35600XRXLhLhdluKyCq8QN3tFf/gjHwcVrwbHNjJ6fRu+/OAg6i3AqD
         b8UA==
X-Forwarded-Encrypted: i=1; AJvYcCXOAKFcWrPZmCqb7RASGUDOLUIeYFxSc0uhzSxdylykFWwQQLmoSV2lszBvFfIoOgWZ9LnsjHPFDKcXkwnl9gJP@lists.infradead.org
X-Gm-Message-State: AOJu0YyMkyyHovQlNgj8OlppjtbakVO4+yH7RGlTO+6HjcRM9KnGEkJf
	lv9b/EADcA2y3vx4k2SK68D+MSDe2E4HKId7c30adSKJrsvVE22kM2bvwnX4Zkc=
X-Google-Smtp-Source: AGHT+IHVp9QeS4FFrjIcAc7te/fMFNp+o2nMTjsFY0IqZ4kCDK5fJrYCjN0EL5R16sqRCOtTkRC5yw==
X-Received: by 2002:a05:600c:6b06:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-43184241fa3mr29032185e9.27.1729702216599;
        Wed, 23 Oct 2024 09:50:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:06 +0100
Subject: [PATCH 09/37] dt-bindings: display: Add BCM2712 KMS driver
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-9-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095019_824888_4C60A0B0 
X-CRM114-Status: GOOD (  10.87  )
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

The BCM2712 SoC comes with a new variation of the videocore display
pipeline. Let's create a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 49a5e041aa49..2aa9d5d2afff 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-vc5
+      - brcm,bcm2712-vc6
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 

-- 
2.34.1


