Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7291E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=; b=MZjOvcdMvi4i5wmixXWAZcsKrz
	n2uJ/tJFbKjULm9zDX37qz0XaBCsmpqf3gTvh+zRyimToDy1RbDZqpGu5oDbjsdbtvTdOidyDgNbV
	DIqozP4UxrfzAXkD1WhgYAZoQsY7A6sKh7by9E8MgF4YBwp6CZabjEE0tGYWVu6xObz6SWqbyhLo5
	LuyPG8loPjJG7/e/TpbnsQo4xPwzeLjqpBiHh50Q63x6SiOmLA4H4csQO9b15HmmlLIMtqzVGg9rb
	j1vvolwOBDMRKVHjxrc7qBRuZqeZlsjM9Q2OF/binoSfUnvYEdxZ1Qsyzlk5fMtXzEWlEa2rTJLgW
	1HH91P8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmwm-00000001Aze-38Fa;
	Thu, 12 Dec 2024 17:25:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLluB-00000000wUA-1wgc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1303911f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020349; x=1734625149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
        b=XxeiyNlvvXBcI3KEAlCYBveh8yOFVCKubOQN1OxLoOyhdsi9NaZ0bRjAX/NMyE1AID
         jqHXI/t67EIB5VEat9jB9KFS80OdrOExbiJmtWKyJ9A+u8fzekfEevPAbifSx6QEC3dc
         dvOeCZl0YyOHezK6FeizgTnxBU7xiSHVTKdiUNUvppmTV3qSouMjpwv9xJAW8bVSoXU/
         ibnsUB3DrkwQW2oR4fyJQv9VLkTnc/dKILu9a9TEUmy4qWc4tWur9oHZwp5PGT1BHRJt
         Gq+e5tB44qIypDzDuZxUvBNiJHGN1ltlhK6vXOeIJVjZvCAWFqJtRcSbhdBNLINmwNT0
         W9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020349; x=1734625149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
        b=Vs1ib71Uh0wolvzXobS3eIaHj827/y9r3jwmHeNmq6mY9JFmyZunRZnmb586IPB2we
         oJGDZv1ghXYazu08o7T2nthuAtGELywPIkB3K2PIu5WuczmQ2Ohum4/maiSRclyAmEC3
         Nfz3ubExrgjkgelvEqE+hG8TtXS5HiDIh5M5QEav/sOjYGfDkzG4ARBxKiZ4V3ABBZxj
         jw3uzas6VEK04IH2xk7InZGbYDcUW6A762hdMUa7V/JK5cKrkMwEWWdOwObYFYJzKWnd
         Q9PHKM7b2KrVAae3OhKeX7QDbKlfCVaoSvmVL+D+oXJ6KIf4sVWhG48L2mBpUGKV6GXZ
         qohA==
X-Forwarded-Encrypted: i=1; AJvYcCVE08TY3NgttcfcH9IQcHFxrTwYQPWxLkLKeUWETb6hu34+l7yezBrvrxMZQh771zMbJsa/t/QSKvRsL2hNXQsW@lists.infradead.org
X-Gm-Message-State: AOJu0YyUYlnnTpkGu6NCu4FY1RxW/RSRrtLiHS2ErTuJQsgyKtug/ONE
	m7BZrZA78Mem4zAfH6kkTNOK5/5D0zBVULmKT0gOCuubOc5owOe3zXs+W/akmFA=
X-Gm-Gg: ASbGnct0kmOMIMAGotUdplzqtsBbIXRBONaWg2trDZgw0FhqBRN5U0Jpe0o06flXi8a
	TQwxfr8hEcUYLoW/0hnFLuZ3d0Roq6YCcAhenPX2mT3goats+Puai90u1NDSY3DW0aDb5O71l9l
	e5hP7JTBI9J0FfzgW7otXYXTkSWfjXWZCOIxMnONU5GygZpZYHyWZhZ6z/mL7nYwcqjt1NuHeu4
	80ER9aHbZmF/E0rbqxsa3jp4I8/FPIqMVo4vVhXrUwdCUso
X-Google-Smtp-Source: AGHT+IF5fGK4r7ZLa2m+qI5r0OgFGblEAcI0fkSDXGfPScJLkRcm9817axtMEaqmzm5LoWtpIkmCVA==
X-Received: by 2002:a5d:64ae:0:b0:386:321e:f124 with SMTP id ffacd0b85a97d-387887fe47cmr2895855f8f.13.1734020349363;
        Thu, 12 Dec 2024 08:19:09 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:08 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:55 +0000
Subject: [PATCH v2 5/7] arm64: dts: broadcom: Rename bcm2712 interrupt
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-5-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
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
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081911_517287_EAB2A269 
X-CRM114-Status: GOOD (  13.13  )
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

CHECK_DTBS produces errors on bcm2712-rpi-5-b.dtb and bcm2712-d-rpi-5-b.dtb
of:
intc@7d508380: $nodename:0: 'intc@7d508380' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#
intc@7d508400: $nodename:0: 'intc@7d508400' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
        from schema $id: http://devicetree.org/schemas/interrupt-controller/brcm,l2-intc.yaml#

Rename the nodes from intc to interrupt-controller.

Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 39305e0869ec..bd78af0211b6 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
 			#size-cells = <0>;
 		};
 
-		bsc_irq: intc@7d508380 {
+		bsc_irq: interrupt-controller@7d508380 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d508380 0x10>;
 			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
@@ -344,7 +344,7 @@ bsc_irq: intc@7d508380 {
 			#interrupt-cells = <1>;
 		};
 
-		main_irq: intc@7d508400 {
+		main_irq: interrupt-controller@7d508400 {
 			compatible = "brcm,bcm7271-l2-intc";
 			reg = <0x7d508400 0x10>;
 			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.34.1


