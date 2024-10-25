Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7C0D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvy6mw3HkfOGNiDeKKmifz1sEp4TpAMlLMBCwtNZJJ8=; b=1+SRMxZbyktQuvMYdVaFk6U281
	cW6mmQIlGcf7yfo4ACV4CvII0LS5Bdd7aimyf8VNelXX+5DyrYCYkc2ch0zIecvlVEBX/8uW2nI2p
	vjsMSPAVDxnkVqulbWY8vq4pIBnhPRMA2j0miIPwiKq6fJnbmqicwrjV1icmmb3fN+kj6Il/VK+cQ
	778SOYcY92YDP76XI1M3YeISPIsTds/ZsurAz2xJmWi7ul9FPvmOz4uTzxiStg1N1imDu3tF09lpR
	IIAc6DR+Fk8bT1vYQa85FtJ/GJhVrDesioxcUQ78HuGT1k2NElSXIo4DeCxTMWiEiMNwZr9QzcRLC
	hb/90+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O1x-00000004ZoO-2PAM;
	Fri, 25 Oct 2024 17:23:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv1-00000004Xp6-2RDg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uvy6mw3HkfOGNiDeKKmifz1sEp4TpAMlLMBCwtNZJJ8=; b=h2cpTD2krSFmMdrAoc0ywshhQ1
	zLGE9dIXwWdp7cRo8vsgoBcW1UFO7DqX15F2cfa70AAWT3nMi+al/yISDXVzf8bKLVhGOROOE2BUC
	8ZpIiEt4XRUEs0jWU97jkzgVzGjYmvTZIIdF2NslOqV7nsCCWzJAy5q26yqOavhnsZ38jYCTRM3TY
	gYOqzQCjKzWMZb6/L3oGyhCjmABZJEBDEayU3BYoTbLsiC6pX8aTcyuP1lQXpn03d35bMQEi++pFx
	zzgmz545QYFNmiafUGwADgMWK+xMgQflu8EVIOYUiyVMiLgN30+leVlnMpTdm9hqPMsKJfo8T4hnM
	mQ7MQBYg==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nux-00000008zdf-17lc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so1467690f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876566; x=1730481366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvy6mw3HkfOGNiDeKKmifz1sEp4TpAMlLMBCwtNZJJ8=;
        b=FHVFYkDk2HFlkPKG/ZbMjW/+0cMTgMBWKaTlFBWDSjwCNb6D88RNzzQfuokT5GWg8e
         /cTB2KtnMescbIO79wkFMSktSIHE9X7Ts4h9M808kepIBQCQuh9GN0HQLx0X6sz+Bfwa
         sgef6NECimB9+lMvZLb8Ax2dAwxnekyXI979CBTYG5aOI31z5FtaJH1h98TI85B299Oo
         L1i3DHsOaSnVCSSD++cPJESxGT/uPdG7zRZy+K/5zA2ZaAOYwWPgUwPPlHYUXTCN/ahU
         WgEcv5+396h+PWeSP+E1l1dcQzSB5jmeS1TNLDkGa6Xv2gYl4IUVEXIxXsHeh9Zz/6Qr
         zzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876566; x=1730481366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvy6mw3HkfOGNiDeKKmifz1sEp4TpAMlLMBCwtNZJJ8=;
        b=uB2tc8hxCJcXWPK/nGIPzVqQhpp6vtTvMjAzg1corJZvjXwiQM1h/CGpjpMTqGkGh3
         ckpUbywvlxTamlTk0kPVaPPmOzsy3yK6m2E7sAgJltdeZxNeE7g/ZurP9qeqJtvJKU1j
         JZKCNF65nvqFeFS4jNsqvo317lOFRlBQdTHKqVGPjxdT2lcyS8w/3sciczt1IXPakcXl
         THCt6vJ2CloprAckEGLftRg6xNMwD8ASJ3XSsk3Zu7Pykxc/BuHTWpIFnoOZ8bNYrxkE
         fIDoZSTBpZPMZP1ZgrfrvJ+beCQlyNRNN9g+SNbc5rOkfiZMrDuJgwsdNM+L3exQLDYr
         8pUg==
X-Forwarded-Encrypted: i=1; AJvYcCXLMGIPPjYoOGNJ4VcSKZGCvjqF52cIhAa1I3cBhN0pndDYIsgCagI+x6cjyEWIsuWcrKRBVqOmdrwreF8kAKvI@lists.infradead.org
X-Gm-Message-State: AOJu0YwpFyZnB3XScpvVexrUKn4WWloAU70s20vq06OP8yFIH9W552AI
	NMFBLCH0L7qfp4o5tQcn9PUXdWnt12W33/fk7kJ+YVf730ns3n180GyZEZG4b4w=
X-Google-Smtp-Source: AGHT+IHirezA1gYr0G/DUtQrSt/DP/1VMOY/GWyL0+CDPDCZHRfOmDWirKI9sgtwCb0jA2Kn8vQ++g==
X-Received: by 2002:adf:ea8d:0:b0:37c:ddab:a626 with SMTP id ffacd0b85a97d-380610e69f9mr139123f8f.7.1729876565769;
        Fri, 25 Oct 2024 10:16:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:05 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:36 +0100
Subject: [PATCH v2 05/36] dt-bindings: display: Add BCM2712 PixelValve
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-5-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181607_637339_179C6981 
X-CRM114-Status: GOOD (  12.61  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


