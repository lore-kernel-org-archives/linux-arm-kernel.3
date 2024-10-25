Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BE3D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7a7/HziehwTjKT233D/IuQwrsCio9lv2e2bEhcrly0=; b=drFl7xnJEP7ikS9YiBEuBeNV9h
	G1n02fJWZCtoFCBnX39kvWvoediUt5r2JAFBjYcmGn2+taXVIPFlKcd4L9Z8LloVBW/a60+DLxuWZ
	MZKuiQduiyZPaj/Oqg95AzsLBVdy1GOstyxveHc1Xf6+x+SaY+SckEdRuWNG4BKTDDg+f+OzzABSb
	7Tjg52qb6JbRAM7o0FXK8g4OBFp4EsaOuwLGgvPCAg97LkRC7qqDGm3OsgKIbBQ8Ye4AOQ/JWTx38
	BZKY8wgWudUizJ1hJN2Iq+syON3XOBcPeQ09uS2bKUkrRX3WpQJRPtNWTIW2V2mvd4aWGlikUckxm
	YndQjOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O3W-00000004aCX-2P1T;
	Fri, 25 Oct 2024 17:24:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv1-00000004Xp2-1pts
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=F7a7/HziehwTjKT233D/IuQwrsCio9lv2e2bEhcrly0=; b=OXOypOP1KknIrcX7tEwNEhj29O
	MkcIZCxnG61MZh2pxKL9jWaUG/CpErXVZOhZcrzn5OQcQ4UpJ1MP1YwxQv7ufy5z4tf46omy5rvz5
	BZKCZNPTM3FAgWaYtKP/Je4TjaSkbBE6jdB9iLSQLXkuGeZBkeH6vNmMHYmg759OAVIpUY68YXUKO
	5cqfnno9w7KkGF1cXtWOGWegDw/VVhuiW0mudHQZtonrY4d7wIclZZy2sWogeRQ0jy1n2ETV1BYM5
	1ljKbsMnzerjcNk6deSO+gNheO4E9QpvILMREyZVKrh4R5ya6LbNOFoKo4Y3K9dHdeTf8YBGxyrme
	NSc7QoUQ==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nux-00000008zct-17p7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d495d217bso1930614f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876565; x=1730481365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7a7/HziehwTjKT233D/IuQwrsCio9lv2e2bEhcrly0=;
        b=a91umWzkUfhPC/CDrqlwnR0OgihSl7DFwqTOU2F1W7wiMgmzLNCNp+qCds3HqbCzEM
         MpkBX1GNYK6BqYIhPaTqrDDqg2yGyKx9skUAMS1aFJM/k8IKVHOu4phbONXtkZSvQq+H
         BOr8CF5QmKSLjQPwiVHrxdrIX/uLGfMc7D2vCRz2X/lCLUCnwGMqRGbqlhj71//b4qsT
         pxsWvk+kfJJRkDcfGO0ebWkLCRT3R62jo0Lrrf1P6MfhjaF6W3NEQC17mg1p+SLwd1iF
         7k+i/wpJSISQJo5PNijeNkkvhex0HHZ0MOKOnS8B+7Dk9b+ey0X5eRQvXIyilZzGxz69
         Ppag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876565; x=1730481365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7a7/HziehwTjKT233D/IuQwrsCio9lv2e2bEhcrly0=;
        b=PRp97mUZiYKYDJhk4OWb7//fK3m7kg0ieQXpIjUxsBRVQ6j0R33hoXI5Us2+WsTn7T
         6QhZZhSMOyiI7Gmw0+CuQmGGI37RLgav6GhXi82ZJVJLU/+7TsCixY0b5xdXQJmc8QcH
         bdto+jApkdJdIoswAP1f1+Tq6ANY/zm1Gpyq3YPCbY1NkvH2byhT4gI+u0TDKwC7sSwo
         uPaWrZXnAKXwSyFTCkQ+JWrKNmlFlk835MN5yiAkbzSVTuwSMp/pHsDbmX14LxWvKbUs
         veuO+0r2SVOpHhd1FXPNuqI+1bAJ+VmmyKCAlH8P5q99rOuQqcBY+Z7ybfvMMa+KPYP2
         bjuA==
X-Forwarded-Encrypted: i=1; AJvYcCVPjAm8cHegXS3k79MBiHpzoMVhBrhmnEM5MgJD45lxq0tF0VShlubynLYGcYPQDvTqt6mrmcTg1MdQae2u645s@lists.infradead.org
X-Gm-Message-State: AOJu0YwT0eBceFX90mfLVCEAv6SJGqFXD/h6Irfkd0YenNMrnnOfcrfX
	nghgktim/FHf/BbMyCMtSgVRmAvyP9xjUrErd/YC8A4+Ai5X1PlGCgFrikuFMOE=
X-Google-Smtp-Source: AGHT+IEFF/mt9prwLkoO/wBDShJYk4RCDN1nX+/N8QkdDrkFHXlIdTeqdVrZSLG6RmWbSoiHWDwtlg==
X-Received: by 2002:a5d:4106:0:b0:37d:612c:5e43 with SMTP id ffacd0b85a97d-3806101335amr193017f8f.0.1729876564669;
        Fri, 25 Oct 2024 10:16:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:04 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:35 +0100
Subject: [PATCH v2 04/36] dt-bindings: display: Add BCM2712 HVS bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-4-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181607_610236_8AEF0350 
X-CRM114-Status: GOOD (  12.82  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


