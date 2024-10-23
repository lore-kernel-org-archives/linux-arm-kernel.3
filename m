Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81EFCFA453
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRsyBqkiezxBnssjhK1B67iF/aAHVHcHQNujZZby09I=; b=GLX1RPOL/K5MucVIlCaqBvjZ4T
	KPvPqg8fC+aj/VNf+r1xOyYsstFe+zUjrBUkUKTom0/FppQmZwtYsgkAGb7+MlOPdDQwUEj0BYCfG
	kI6CjjRZVgUhqruDJ68xKqMKCX/hPwIDWg3Aui4bxhfLIzOc8X26nQ/ts2u+1vqoON4Adtj//g76T
	FJONebxRyMfdxu09KY1gb5sZ0HRLLfpQuxKqLGYxv6zIb4LUes9Qw6v+MGVGgSM/yyNmyqHjjo9Z1
	FbK1RtXEOja7XNthRyY8jXsJqcYBW3ZCT8tqSuj7rSDrzJCq4XlyhQ6xoHPJVStIlp4Z7qsNb3ggy
	pFUTCqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fEB-0000000FNvU-3nPs;
	Wed, 23 Oct 2024 17:32:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYp-0000000FDGE-2JSy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso70102945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702213; x=1730307013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRsyBqkiezxBnssjhK1B67iF/aAHVHcHQNujZZby09I=;
        b=VJYMh1tiCbkxdLFYTMTB8Df3j2I2GPPXwD4cB5MkHe2vOBIi/4fKMM8OGzA+sOkshu
         UCfF/lf61hG2aCEWPTPO/Wu/BVps3eV+UlvLyl/5tTDxkRHcNiCHucUuzyr5felJL8wO
         qA+j1c1uuX05as7DD3gQ15r+Vab/STWX0uYRKFIYtoKktJ3lkVzHptord4H+hojI7/tH
         w6EUl7DtQtqyJBGtUDC/uDa2zK8DyEU6OKyneZlxgetvxq8ufHlJwpJyuarDCIodACm0
         DKeCRbB9DH3XiDupxEpONISAgut4TOUPl0Nqx9G8zUs2kIEnAl8EhaTRbk+oy7Mp0SDZ
         Mz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702213; x=1730307013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRsyBqkiezxBnssjhK1B67iF/aAHVHcHQNujZZby09I=;
        b=Z6Mehc/UIhaUuib4h0zZExlQbx5qs/mg4E7OHlRPl+5DSvo1Gwh9jLNZG4H5/a5dT4
         ryhln0Scjdv+grjtB4I8IGdhsFA2rKenjb+cBaG40L0qzF1iTxRu32Ct+7EFrFXIkBKH
         nKPw/Tzw+wmjmatussHazIP2A3HXM+wJbEqSLLpn89XrVVh0TTx7EOqndDidzTdsstDK
         tVzpXabkwMall8ois/3UCKMJjjv+IfJmY3ZNkIf9fHbxv2KkHZnYqHci1xppRoIckDb/
         7LQAGed03xjsvk9gwl8g11qwBG32nx71Tpk+t5ZbNo7UHaB9hFjqfDHwU6wWi+5eryO3
         tbMw==
X-Forwarded-Encrypted: i=1; AJvYcCVCd+oJtv3bkJUm+JDWOgGIZXYUpsqs+9cjra71ZV9wQlUulhCd6rd5RF3aYYLA6khFmMFJrABFM6bdGxTkh5wb@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlw4C1y+Udzq9UDcXq69PuKvYRbnue2TdCIhFpTtRiA3Vxn67W
	E4jZ5oMCGluLBEyoeymU8nPJrcS8uBZD8qtvojtn5zQ4DgsvD9zUSdqMrjpP0U0=
X-Google-Smtp-Source: AGHT+IGDZgGkDPQj1asKApxHb+1RRVP4pBKwGrn8gf3ud6Z4Zj4ffcb+iWXuf3VXHoFcZCsz0HsC3w==
X-Received: by 2002:a05:600c:35d3:b0:431:1575:2e83 with SMTP id 5b1f17b1804b1-43184201b28mr30823345e9.10.1729702213156;
        Wed, 23 Oct 2024 09:50:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:12 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:02 +0100
Subject: [PATCH 05/37] dt-bindings: display: Add BCM2712 HVS bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-5-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095015_644799_A7205F3C 
X-CRM114-Status: GOOD (  12.85  )
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

The BCM2712 has a completely different HVS than the previous
generations, so let's add a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
index 2e8566f47e63..f91c9dce2a44 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-hvs
+      - brcm,bcm2712-hvs
       - brcm,bcm2835-hvs
 
   reg:
@@ -36,7 +37,9 @@ if:
   properties:
     compatible:
       contains:
-        const: brcm,bcm2711-hvs
+        enum:
+          - brcm,bcm2711-hvs
+          - brcm,bcm2712-hvs
 
 then:
   required:

-- 
2.34.1


