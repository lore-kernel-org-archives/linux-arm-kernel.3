Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EDED149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLIH9tyCJziS0oZVp659ectLCUh/04IQKJ1VKaLHRLQ=; b=n3L5b+OsanqIZCXDXkP91dTzgf
	bb8nNFH/FiVIdUOx2zxTRl9U/iYHNJ2y8MJtZY0+n6e4QMDJL/Nr4bxffBlnC/QHwnUu1E66tr4ku
	PfVoXHG3HqcJe0PGeJSCZBC2r+RMxthqf3qDGOwPIQxx5TUJV+yupAuNKCSjBjseKAcTCVInNa2lj
	1cx28tTDnfiFFK6WogxJRbOkn9IB0G22eFnt09TwYPmk4kkgSKfaMLIiwgNX9y+q0roiADYeBdPkN
	zipxKIbOZRSnqFAdx+HFZnEmwuOGh4QbZ6yOqe1loBlhYlEcnVmrfPjmoh0/1WLpp5NUZ0BPDm9Me
	l1zhqWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OiE-00000004jti-0VGL;
	Fri, 25 Oct 2024 18:07:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv3-00000004XqU-2ttf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fLIH9tyCJziS0oZVp659ectLCUh/04IQKJ1VKaLHRLQ=; b=E2SY+13m3jLz+ZeeUzypInWomO
	7lOyOxCOlMRzIMyWH/XUbVWAdmm7A7Ylga4A//eCYARiiVuRvc1DHmtNBookqIJzHhsDZqpjL1qck
	wMh6YVWRkbGQu5xaOs+gm9ZKz0HktxIvLfEpNamrt4r+JLSNKkbtA0vYtTWt7wy/gRCVNSgcx5Jpp
	fFYASI8U9nb4eyd555yLj10uqLmk/0oTnEqgV9IOF79E+s0U5ATHYqr2UawgL2l7bHFIm9vrPRThj
	NW/8kdRvVlcipxSPdIpHLW8GyHV9o74Bd+73oTiAVs6RNHHwMKEPzVzNlTA1D/M3ZOj1drsqs2Zc3
	3d2gCPSw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nuz-00000008zez-1nkM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:11 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43163667f0eso22136235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876568; x=1730481368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLIH9tyCJziS0oZVp659ectLCUh/04IQKJ1VKaLHRLQ=;
        b=WnYsu+tUvPvnHfdn7nikAm7C8iGkcO38doFqBQn9zVLmro9RD5R97kycDt751P88CT
         H2OkwtbEzUzB8kPjkDgbESfCmu4Qw++R5gWJsH1Ga7qSViH98u5aFTxUholjPg1e06++
         Yy2DIzqvHZBZTl/W4n3wC/Rek4EJ/PI8DLe7PN70bI0cwSexrzOHbYx4k6+rSXKhRQxx
         G28xSKGiPzKSOFiRwFAiPLf6hSjfiv2xLrIkzYNKRa3fAuV4adVnM6/cD/2T3Z8TDppY
         Z2tzRps4D5iUll3I7QBkOAcEZMbSmh+pVouVFQ1PUQ0+s2ixoxvxJxaVBs3md7dQ1jSH
         yZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876568; x=1730481368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLIH9tyCJziS0oZVp659ectLCUh/04IQKJ1VKaLHRLQ=;
        b=OrTmbBuI++235C1I5XdmN7+vkrOSjodkd7tAAKMbgE7/1zQYXlPy/oXvf5LShPJew+
         hWpMT3JQUhQ7J2fAxeT1FWzOJqdlgW2STf8cC/o/iQo9xtYnQe1z0upt7AlI2aVEcslN
         r5Y5wNpLYjq/Z6XDLg1BJeBKv0XCQjchTj76UruwvngZe7XITLeMqXvIdvOiZ4WDO5Ms
         ZZQV2KTCwQek0lyqjAm9GqrNC9fVOUF5H1AUcBv0uBgj6IASHLLlTEx3nrRjOuY3CHMT
         Mb0s5BGrSvJWI740z76T8OoTjvW3pM6X4u0pCtX+4SqhmxytNr792/NpooEm3wMcNRAi
         Vs2A==
X-Forwarded-Encrypted: i=1; AJvYcCXjPt4NlH7up1Spso4/zzpovlo1DT+3sIqmQog4TYvMPM55px7rRhT2iNKVr9tbiyKkw63OUtzzfDYpAIWLldN2@lists.infradead.org
X-Gm-Message-State: AOJu0YyjChhWmsAC3d6YtO13THjwAZSKVS3kvhq9Ll/IT2nKlEkDEnE5
	mG7aKdedZzTXdQQqnNvSgtjV2VRElgX9Hqxo/AoX1B8/acsxB1qrdK0ZG6zsPck=
X-Google-Smtp-Source: AGHT+IHeSVH8WqDyVkxiZojUuOptC1WUDDZpkGk6AneCSrSzoFw3bb8pQ04irSZpkbra+Ogj57FSIw==
X-Received: by 2002:a05:600c:3b96:b0:431:50cb:2398 with SMTP id 5b1f17b1804b1-431841e13fdmr91410915e9.2.1729876567815;
        Fri, 25 Oct 2024 10:16:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:07 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:38 +0100
Subject: [PATCH v2 07/36] dt-bindings: display: Add BCM2712 MOPLET bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-7-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181610_382673_043DBF8C 
X-CRM114-Status: GOOD (  11.44  )
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

The BCM2712 has a MOPLET controller which is basically a TXP without the
transpose feature.

Express that by adding a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
index c9c08042cffc..16f45afd2bad 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2712-mop
+      - brcm,bcm2712-moplet
       - brcm,bcm2835-txp
 
   reg:

-- 
2.34.1


