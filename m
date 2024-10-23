Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89997CFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yIqSMQIbhgYZ5JV0ptgvT7eERweCUm7MDofNLmccWE=; b=w7I4X77nT+NLeYHt2/ExHamBPW
	V7dDqEhj3zx07yVWAVr+o5vHlNqFMLabBkz6lTueC4tBjOENhgcqW4GLKAEzGcBl2v3yTBG4wBXGT
	+mOvfMztvhhHEqjtWHlvmi9xgQ109VZbZhscdlf3VhgcoA9ZwdL0g9gBQWcHVMlnS14JMa0RlnZDZ
	EiUQcHnXxgw7M/0oqjTDzmANKg5Y6XdsywSvAU5Hgu0QE2rf5EyZa2zDBW/IBR2sPd3XOThAMqpQy
	SNCcv3dP/BLQjJrauD3LI9MKb4HAZj84tcDxW0TKLZoyPbHE/X+U6sdkl08bdITrR10bab7tiF85N
	QB1drozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3faP-0000000FRpi-0gyM;
	Wed, 23 Oct 2024 17:55:57 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYs-0000000FDIV-2S7i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:20 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so57700565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702216; x=1730307016; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yIqSMQIbhgYZ5JV0ptgvT7eERweCUm7MDofNLmccWE=;
        b=CpiyeSNXElPlRy/5fwRHrczjSKIiZVVxNhlcFoIUwWHUa9enwIILwK9+n6P0LTN45x
         hPB8OuYb8j5k/bfMHC9uySUhwWSuwh1fGPNp9BVhbvKfnTt8t2bykxmsrgkHo69DSMiB
         VMQdFoi5mSR48Zoow2pvc0guvRHd71g/Lv0zLjXiPWbxcLOlNfldBJU5eYbAF32wVcm9
         XCwwUzmyoSEmFc7r8Fgh2kqyCfunwqazcFFbir/CbcVmMaCxAFyAq8mFbwDbKokGk4Au
         6FwSE/oXS57eoKnmZnkqPPIaI+wueB4irZ2SYEaGIM2NZwJI4C2sYP45D0kqsJdUiunG
         KpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702216; x=1730307016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yIqSMQIbhgYZ5JV0ptgvT7eERweCUm7MDofNLmccWE=;
        b=SEgA7CARSGEKAtYKU99B9Au2CAk2IqSVBEsbGvSfDFeUBvrpBiA8L2yHTy+bQIC++K
         LtEhb0tXOJVAW9m8GmhBInAO8Pzt/78vSnx/mqd3KlJc/O5FM77o1ywat7m2+ZbpulvU
         qp2LVP9CT/BeamjSDmgdLOxJnEjywX0iTfy6cc0D//LWT2wucfjtD8mdicvnW/uFkXta
         nDPZXqIdH8pEs6otZzvFW02Veql5hzWisStiKxLZpOJVtu/xU7k+BiEX02B0d43Q/lT8
         HBuX+fxqEgoRJV9rFHEyf7c+OGsGqQgEEBiCXTxDhZDKtolVQzASmSljqwoxyew0y0rr
         YYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnpaO0CHyINjjxu2kNM5d7a4uaigcxWkZ3L1vW0s9wUxKrlMMxyhbYme+rN21UGb+x0xI5swQzfKkfCmSimjus@lists.infradead.org
X-Gm-Message-State: AOJu0YzDJDkWtqIgS+xyUmJEv98MxBf5E2Hdbi1d3gwubbTQ83Quvg28
	S5qGQETFEBLO0SLsQvd41G63fKormmU6F/HaYAL8Qujn+3asiHvOPdcIuF1/M44=
X-Google-Smtp-Source: AGHT+IFhoWS1TvVBeb/zedIzvkvu/wsYZ/e4vvOHGOZFIjQ6RHyIgZHgWxuLAsd/TW4PoufcpONuBQ==
X-Received: by 2002:a05:600c:3b86:b0:42c:b80e:5e50 with SMTP id 5b1f17b1804b1-4318408b348mr29910635e9.0.1729702215724;
        Wed, 23 Oct 2024 09:50:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:05 +0100
Subject: [PATCH 08/37] dt-bindings: display: Add BCM2712 MOPLET bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-8-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095018_691462_5CE6ACC7 
X-CRM114-Status: GOOD (  11.47  )
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


