Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CEACFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FUFXgI6QaPA6jQr/YtcQOxmD1Pid9zdxxQkfAdgTGE=; b=1JNIGwaFv/GoklWZ+Sf54pxWo6
	eVvkBSUQx2Ic4QFPqSq/lh01rE/8ZZf+53bSi+eP1MzvRG3TG/gWeZs9rCSKsLXcFBvuj/BHjivQz
	wLqTkL4VatLWyZ1OzcTcKisXXi9fu6PmxVoh/AZalIftHkyOpgqdjRDMvAmfUNIuXmcoeLkS872qu
	N/pgBdisPT/lxAf6vRhs4gr4gE67DC2fr+RU0qvbsozfIJ6s51NuRiNG4hk5J71HRZhGxgIy4re+G
	kLrpAEjypA/M7kCsQt08lkCYfsrw1jomce4fAwHT9ClTPCOi2zW+kyms6iZFjf46GzxHB2RoRpQHf
	HrhnNgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fdM-0000000FS8d-1sQR;
	Wed, 23 Oct 2024 17:59:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYv-0000000FDKc-0xhX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4FUFXgI6QaPA6jQr/YtcQOxmD1Pid9zdxxQkfAdgTGE=; b=fZluZ4RfD9kEDLYUJ4WsP1HJuB
	T0Pm4sQ4p+G5fIIp+SiCmog5ciqZteOdBu46xD8CBx4JGBzuD/jSnizSHF77nRJmXV/FZGFtTDAeP
	7Ur51fkRNbwUY1HZHnPRuzZzAJa0boxWhdkVDuDNbjczz8WxYiOxPDnOuIodEbQolHyBmYH/q2/bv
	A2RC5bmWcAK0F0ROFdbMvQtnL9lFzdGGAOTN3Lvwpc12pMQwpPKn39Xo9xwDhmDjqmGPG5mfX7TWJ
	aKmrhm7Oizga5XwrEyk40+4SCUlQ5JlFsVHidU8tPC67wR5XxjWSXmMuBfUiSDUke5rRCJHfD25gf
	pws3ThCw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYr-00000008TAP-0orh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4315baec681so73397705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702215; x=1730307015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FUFXgI6QaPA6jQr/YtcQOxmD1Pid9zdxxQkfAdgTGE=;
        b=AidkMrNg8Gwaf0iHa9bBib8V4GUCjhW4X2y2BFDIl8X4XKK/NRK2o7OxMP2be++3wU
         liRJuh2IabePP+PzU7k+S8p6srhlQpstD6xVAorO4SjbeyUe9vZ2euzWyVkU20iaE9Tq
         gCM3EaAiO7Lk6A65kZZbtIjCgz+LTtOx2szU63X+/F831Ju7PO3ZDyF3LxwAOe+4ZmaA
         +n3/04tQS/oKIQHT7OQ2d8qgwXQnjlKcF5k40hor7ArUr9/+IqRvoTFQ53Y6HAJqi/YF
         aN25ZnbIsTvQ7yikw3GV3kWQ+bzH8O/mL+oBsfWJoqj6ElKHetQ13jEshOdGOtAUqVeU
         av3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702215; x=1730307015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FUFXgI6QaPA6jQr/YtcQOxmD1Pid9zdxxQkfAdgTGE=;
        b=ownUb0jrSbpSkZ7saKJP/rWczM1E8keQhlj/J5t1F9GlXWioRAmwbhEWpQKLmpsybM
         yTvCnjgayufiECWKkTLj7RjIafDTYwWI96gDW0axlnZs4ImTh4Vh4NwBGizUg4JgvSVD
         eb39RmOpo1hh/OVe/0SumIvHJ6kwtCr2koj/Wt58J46Z5cNDAS8kNlQbAfwKt66kPPfE
         jm5+H8gIwgorXsHFMkKHqOwoNUpSdUfvh/MAXrbB/YTDI+LdajlCXhxQpjioLngV20lq
         QncavKSu5ZmIz9JmT0Pz5E7PuJZPKNLM0Ml5snSJ8AvXV+2bhukzqjeyouYp/SPuKdfy
         O06A==
X-Forwarded-Encrypted: i=1; AJvYcCW12EFEN7RY0hZUCEl00qZhCb0nLZ8PxF8wIO4tJRgLZsSSiMZRvbhIZpqD9VF/smfgsvi2zWcv6ihdu+VVPBLi@lists.infradead.org
X-Gm-Message-State: AOJu0YyZUdomOs8miqmGJpbio8P89JeTUraMDOB2nEyKelvtvgXMpOrT
	fziBZiKtniL/QG5lOMyUnSpXOvgbBN7PNEF2jCY79W5mGnIXaOIKbtgWN+7KFs0=
X-Google-Smtp-Source: AGHT+IHIUSOHmyQPqkYRz55BazSmKBq/h2kF4iw8nhK8CZovAtLyhCKZ0YMIVAUaEiQvYpcstK2LyA==
X-Received: by 2002:a05:600c:4f86:b0:431:5df7:b337 with SMTP id 5b1f17b1804b1-4318413e293mr25123795e9.8.1729702214888;
        Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:04 +0100
Subject: [PATCH 07/37] dt-bindings: display: Add BCM2712 MOP bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-7-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_175017_445189_E229F615 
X-CRM114-Status: GOOD (  12.35  )
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

The BCM2712 has a MOP controller which is basically a new revision of
the TXP.

Express that by adding a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
index bb186197e471..c9c08042cffc 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm2835-txp
+    enum:
+      - brcm,bcm2712-mop
+      - brcm,bcm2835-txp
 
   reg:
     maxItems: 1

-- 
2.34.1


