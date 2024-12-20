Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A362E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=; b=dV3ivuBhdlTtBlde0yKVpmkJFA
	DCyhjQyL6cADvPFyGXUa1rlupVuonZeJ/pNSNN6Tu0LYIvbofSpPyxV3S0ToR+yCkpUuLgy78lLNl
	OLFQFpCnNh/q1aOkGaQoh7X7lQgAVkkqGv0rHtlZkZENoEuTr5jRcGGPakZWUEIclCjeKFkVi3NnT
	MEcnubzYo2w0MLUCZS94Insmxrkr9LO2r7njYSSbAw9exCTufFmYHIYNYd5q/j2h04R++cIMXXmgy
	dHuiyDNqZ8P8M4jZhC6YCoBAcVZ2A8i/FPEh4aIMMJC3nMY9xyiqPKbMUl+JDkaMkuXqe+iEBjpY7
	adbQDP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhXt-00000005mC8-0R4m;
	Fri, 20 Dec 2024 18:16:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhTE-00000005lM4-1J8K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:11:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361a50e337so15585975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 10:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734718286; x=1735323086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
        b=CnpalBiLNtsx/F9uARM0sj5Ia+JUyzYmEDGHLRdPbIQw1CRUic4Dbvv9odxUM0XWbs
         rfdyx9Y3bHmYCtAhKlKMlL/R2SBBI1wbvTmQsHjRLd1le0YbyFNNSOUbuDtYZ6eOdfYu
         jyhfvgCxlinL6xEKpDoRF6ri2QmJuz6Q2uMa6YqsP50dtDeY6NoDbircjLBVPdAQpb2U
         KISiy+U7wR0Yj567nYay9SynPt46bnKLYCBj5BFrh+YYdmsgL5yWeKXFRLKiILlY5urs
         4iiWfcOiPpHr5aamOkH9M8ZrmvNDij3Faof3WxkOq5ONZaLAc35TnbtHQxxKOHE8ZS5T
         wrfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734718286; x=1735323086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
        b=GayZ5xoQv4NGYrxTzxIpFM07M+ihIEP4R2F2V5BGTag1MwBXQ+AoS7ATUIegVw/6ay
         wZrjMMZheJi67PeCT3+8Lyt/X45nFH+Qt8pAjjc4+KY0fQXnE3xPQnbl2kZrChFuqOhL
         Z/u0pdakrIP7oiylFOW4TRyavnD/XvHcEpiRkGqRkJEJQ4Rkeqt6umVLVjwtikVQaQkF
         DzSsG/L4pMQSNyRlTw88pkpX1Lm3D6ju1pCuVevC5B86xF0HsSpJ3V0NAc1p4xE5aGee
         ViLI0YmQApplb5gf2ben26KUL/1AvyVZle28xmt4EqgriAGAoi1+sB0o4k4vq7EE8izR
         kTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGeyBYd9NvWL5JUdsfx6nDkUGJx/tPGs9b5SdpaeZTGMRuChtdFNE3juepxxcnbF04sPsiEvqnOoXFn+540/F7@lists.infradead.org
X-Gm-Message-State: AOJu0YwNfpSAb9Jt6XQnEBS6d0nKzpAXkshMJ8IO5xN08KWbfjzZIb4G
	H847DMn7wqLwbptBiJFMHsH4Gr2hNXN6BhW63c1rp4xATsQexKlkymBq7fBjXWc=
X-Gm-Gg: ASbGnctnJE5odS49+LOC6Svm5lF6nhPq1iOi34M06GMVYmc/MrKOICm+BGjZyMeR01A
	44fQzYCiQcxSO9R2b6QE6RH8HXrTqRo0A9YUtr377DmtK88jAr42jyrigM2r+KDRYKt6zrOhheZ
	sYZAaDQk+7Av/9Tu1CnB8od14Vg8gbOFZ72RdlYdLWe6MUrojINGnd1sBnCl5ZFZjUjq/fiZcom
	pnsclQpXUQK99fXbosmFSkO50kSHF9KfVi9ipfMw0uEFSN7
X-Google-Smtp-Source: AGHT+IGkUJ6wiQ+PFzhrRg9QEs0JFLnzOAYHhAM3qA2cpb4nCgeQZdE914UHndE0hNBgPmIssevaTg==
X-Received: by 2002:a05:600c:4586:b0:434:a902:97cd with SMTP id 5b1f17b1804b1-4366864364dmr37590895e9.12.1734718286362;
        Fri, 20 Dec 2024 10:11:26 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366127c488sm51460075e9.27.2024.12.20.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 10:11:25 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 18:11:13 +0000
Subject: [PATCH v5 3/3] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dt-bcm2712-fixes-v5-3-cbbf13d2e97a@raspberrypi.com>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_101128_349093_64AD907E 
X-CRM114-Status: GOOD (  11.62  )
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

Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
base address for the smp_boot_secondary hook on 32 bit kernels. It is
not used as an interrupt controller.

Drop the binding requirement for interrupt-controller and interrupt-cells
to satisfy validation on this platform.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml  | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
index 5fda626c80ce..2ff390c1705b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml
@@ -34,8 +34,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-controller
-  - '#interrupt-cells'
 
 additionalProperties: false
 

-- 
2.34.1


