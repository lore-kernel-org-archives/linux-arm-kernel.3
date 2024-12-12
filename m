Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359F7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=; b=kd4IvPyN5i01sa2Lxhs/V4t6mc
	imWlnIsTIbUY8on/J7QYqTvDmLhhvkwVXa+YEd4beGL71XfiBtO4Jm/OYhCsQkBiqReOOQERPQHcF
	p12GDeRdhn4Fk3MOs22gq+753PIkkD/dmjDf7+PADCDBCC5MAdT21WYFV8qrZzcQjnCht/pyAtcYB
	k0Ocy9jok1vhOgkAhqcwK6KD/bYQIxj7fo/9HeL1h/n+yV6zFua+PQGIkloNwpWCoadye36SXI/Tf
	w6+v3qYEeD5mzzz9hyRh7NCJwl44ZCm66+e+4DdHb6oIa2SDeRyQl6LtC7MizbVLn0ZIsQUiFol88
	7XoKJt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmxp-00000001B8z-1VNx;
	Thu, 12 Dec 2024 17:27:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLluC-00000000wV3-3EOq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:14 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-385dece873cso419845f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020351; x=1734625151; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
        b=lOqGiHekqoZsi07JpbVRMXuBuE2rbacAvG12cFS2oQDMC0dlOBMQi5qlLqPOejNqdh
         Ky+nonT1wV8BhQKznp0KHg0QwfDiuQDqK0ZMw/pXC5M1olO7j8ID0V1i+W/IRG+LZKQp
         8uCxXbcsM+o+f2xECt+8hNnn5RKqq2IMkd7jp/fBStpFJiv4gVkZ+X9qdAm4yfvI6DEU
         bg22W4xVB2X2W63at53vZdUVY5HIHu51GIQqDkCLqNj8N483y75+MzNZ3pbpuj/ufJVW
         CKpg4fgKgpJgGfHqXL+xm/u/Nf9CMqFQVy3Oxu1zFtELl8x71+BJkhS7bilCQML7Wgky
         zzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020351; x=1734625151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
        b=C2pT/bp5gIbLp4xvCnvF01M3OS7ckktvXSVgYqz2Ry/xVp3D9lEeUBp2V+umZSEjAT
         HrTjvHWOH/vUSXguxQibZtptO7LX28ViNt40bzPscF02m7xPB2ClrvHebySTszr54AoK
         AHvCNXXjA5ndu27wjkUI/95CETjMdf+JhxVDUVH3FFpDeuDwawjan2OJIKCnrPlPwaYY
         bLWXgQ0MUGDghdW1ZwOc0KOuizaGZyvkVVUYHdPe4v3gTJzsE9GV9wW1WjqI05KFiY0D
         wL/HrQUsBVuulX8craR0jt5n++JQhGdbrfOVG1QRM4ysBSWfxHUvm5KQMIWPoEulF6p7
         FK6g==
X-Forwarded-Encrypted: i=1; AJvYcCUZXz816NL0oJLcq599bCI2uAckRy1TwlS2KNuHuWVINLZOYbvnAmir8w1XvnfKZ5klsJ4WPERtzw6vs5gWiH0u@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu879YoJ8HBSdnDkH+TeMkNqADHM1dOZ0sOv1iMBXuW6TPE5wg
	p15+49cx5pDOT4qIoRkak/ii4AlWdw3jdiYrguagoJO6LlGJbXN1FwAPJ/nEI6A=
X-Gm-Gg: ASbGncsZOpA9x1kUXiRdoDXTfeI+Qt2Fq6rlWWf7w/SAZ3WwRYYi7JthuuvOLZ0VsYC
	C2F366UzXT0Hc9wT+WTg410UGhcckceabn3SkLzGglK5stEQOL3X2t0gnJVsOIQse8MLSJ2UpnI
	Vwvcjgb7joN+V0BVwe7T69B/Y0UVzMvfkYNEl+AHdZTNSijm8MWL6rwLeUB9stv5XzDq5u58+Ca
	rgg8RwFW/CkAG62fh8GnuLbSQkOOAlvSAcOf/n4ij9AkRZc
X-Google-Smtp-Source: AGHT+IHSgOEfwH+piApFqEC2IhYZWJ+1L5bPpX/eXc0mgxxp6hdmD6CIHtNXbZfUGagQsK5T5vfHeQ==
X-Received: by 2002:a05:6000:4026:b0:385:ef39:6cd5 with SMTP id ffacd0b85a97d-3864ce89425mr6133942f8f.1.1734020350544;
        Thu, 12 Dec 2024 08:19:10 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:09 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:56 +0000
Subject: [PATCH v2 6/7] arm64: dts: broadcom: Correct hdmi device node
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-6-35986e04d0f4@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_081912_827545_B95AF97C 
X-CRM114-Status: GOOD (  12.67  )
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

The names of the hdmi0 and hdmi1 nodes had addresses that
didn't match the reg properties for the nodes.

Fixes: f66b382affd8 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index bd78af0211b6..f42fad2d8b37 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -352,7 +352,7 @@ main_irq: interrupt-controller@7d508400 {
 			#interrupt-cells = <1>;
 		};
 
-		hdmi0: hdmi@7ef00700 {
+		hdmi0: hdmi@7c701400 {
 			compatible = "brcm,bcm2712-hdmi0";
 			reg = <0x7c701400 0x300>,
 			      <0x7c701000 0x200>,
@@ -381,7 +381,7 @@ hdmi0: hdmi@7ef00700 {
 			ddc = <&ddc0>;
 		};
 
-		hdmi1: hdmi@7ef05700 {
+		hdmi1: hdmi@7c706400 {
 			compatible = "brcm,bcm2712-hdmi1";
 			reg = <0x7c706400 0x300>,
 			      <0x7c706000 0x200>,

-- 
2.34.1


