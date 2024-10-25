Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFB3D149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3D0msUfHXMuv4C1SeqQ0nPQBde1GE17PCvfA0szIc8=; b=0RMCeEWu6ILORpfTfFMLvzCkZr
	3wok9Nh28yIze0l7L1BTs833QCxn42+rn8rpticisTc6YN/lvIlqQjDlkrC+XURFrt0P38CkO9gE3
	Neloo/ORSpOBEgJoHpRfGzbgnNIFLLxwOzhkr2uWUl+9vudnkR6EXpLniFeWskBQYmB4ofkijTQ9p
	xzYEv3wmWVx/LBrVkKrgUn1L8ou9AYyrhDE04Dnb4xy50V26Icl8Ar8EtRw4FVNvXX+hMEBjFafMb
	V0KhLbtZBHycKac1vmgqAceoI/gFuqJJqjhGhZ+yCbfurHU2hen9Oa2eMJTQIYa4PekijLZwW2Ria
	P21R9dCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OgY-00000004jMu-03pQ;
	Fri, 25 Oct 2024 18:05:18 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nuz-00000004XnM-08Bm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:10 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1498655f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876567; x=1730481367; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3D0msUfHXMuv4C1SeqQ0nPQBde1GE17PCvfA0szIc8=;
        b=Iv1nq95uEUvkOQF+rg41Jb7VOiosc+LOgrOl8LlXrmGW79sBoOXQnU3ilcKJM0p3pq
         P/b8TbzFOTu8qaoKGQPkif9RvguaKvT2NWt/Fh7RMoeehOavQOs4JPOMTrI5Kl3MVMZv
         7nPlziEduib7ODP7G6wUA01PL6JopnSm9eWhFdcc8rOqEeM63CBOWncUFEj8i37fIsmX
         AeYfvhh6HTy38hVwKpfGjQDPBX09nklssyhwbhdzFYce2VVMue7RYNmdpV1oDhemMkyq
         f98kqn3TbfvRLPMKXkzKqU87gFihTAZ/G/stjp9Vss6ssvHhVq8EKocgyp0HYoiLaNIa
         tl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876567; x=1730481367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3D0msUfHXMuv4C1SeqQ0nPQBde1GE17PCvfA0szIc8=;
        b=of6ZmgjnZotTTrm1uqJzgZaboppeVsRoT2oLUK/4e1pRKVh7Vw6/rImYTBxEp9UI9Z
         K4WcwpGciqmtHZ3FO3Svw7QS7RlQp8JnOQSUsYXFlver6DxiPd7SDAbFyMLFczGL/p/c
         BKm5MElox6zFWJZvw5HlNCFLoUCvTrQ4tEVtE2G8eTS9ReTiLHlNV+VjJoSHda5prTwA
         eruPlXBmrfFae8n3b7GLGeg1h0C4pu2BYaIhffHHzeEm7EuQpuR0V0iqC8vREPgcDi88
         nGHsygScR3JT5DDnKcMyRORBXbqhdMFNso42a1LUJZuMOiMo7WywML40Rx4fBzxZjvwE
         aWog==
X-Forwarded-Encrypted: i=1; AJvYcCWTBoMpVaNwVGaNNL/vFiyLx6Lb6AbC76CWr9c6rpSiRaID8O85HlYByDI4xY8O9/AzJSXGiihxz0kcke2z7Sp/@lists.infradead.org
X-Gm-Message-State: AOJu0YxDkVpjbUEmthJZNIUsxUQ06UmkVTTwnrANmlXLrXIGfb+NJino
	CanoWdmImNyXfx/Knoqi5ptNSxDJbBKgiHZf6PVCPtgKdJwYaZYe7WcvvSsHEvw=
X-Google-Smtp-Source: AGHT+IG4wS89LpASUknXmvnY5DCWRnrRky+UYDTB7/8M+xpU5UpHS3oldLC31P65rzLuem6Jwptv4w==
X-Received: by 2002:a05:6000:c90:b0:37d:511b:aecc with SMTP id ffacd0b85a97d-380611ff90bmr97416f8f.54.1729876566840;
        Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:37 +0100
Subject: [PATCH v2 06/36] dt-bindings: display: Add BCM2712 MOP bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-6-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101609_123205_69777275 
X-CRM114-Status: GOOD (  12.53  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


