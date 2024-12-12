Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8249E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=; b=T0DovH4mnWX2V97ar+x0aloqgn
	4kIUbczbBpYPdZaCmkFSMifP0++ZRjwbvM13W9ZZPGaZh2+TdJHFK4ssDRqTLJ4cE4bPRmtxBXOZz
	tXTioP8vF17CCEYS3VQpR//pyPyiJFMN0E5qmvHQvv8KMz7G9wMVxijlitpasMm3LdHowwjgx/jKY
	K+12kvvlj9WjCrg0wuT3AhOdr+VcmbclqLx9TCYousgQ7yqjOt+IBRLhOfoqbUSmtraE+p3AxhoaG
	h0yHvm5AJCEANeLyerYjzT4vem+2RSR9S9YrhznfJOxCt83ftiTIQnCoOS9AwjKQYD2aSCavJfiYw
	HauFUXjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmys-00000001BJt-0GgE;
	Thu, 12 Dec 2024 17:28:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLluD-00000000wVx-0Jrh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 16:19:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434e69857d9so5318955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 08:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734020352; x=1734625152; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
        b=LjlH6V2zfdoxW6q3VJpUj3iNoquJi0dG9LdUPwHVT4L685HbfPnFk/6HxRq/uRsGKJ
         EVE5bWrY05X823aYvg6tj2qLBb+O/MQzdV1q3bFpkwj+QFHUOcLxQZzvVtH6EH4Y1zMD
         OqIB1KuikzJ92ubAtD90GhjsYT5MdklDENaR9qM/ajBWRNgJvzPgFUW+8Bt9ZkjeUj+J
         EEQprQ1WP1gPYdXzjS8N7NBa2reAR1gN9O3cTvzBMeVzTyMwdqFAJ6AwcORGtR8nFsUP
         ElFGXDkLF1afsJ0wLA90fQtFgAKv2CLjc97UuCHJOtj3ge9yHHWoX9ZdVt84q8G/PTD0
         i0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020352; x=1734625152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
        b=pGz2QWvY6/Tg7VQQhwqYag6Nde9PsFuqt1OaiuWfD7f+ln1/pHlAPWH755vGwUaV85
         hD/rcNm1clUbNhWCyoyEBXghqHhFh2OgXlzCp9jgfrPRZUA+9/LSGut2zVdtSUXmHnDd
         zTQ7CaD5t6iKAzp3rNfV1na2mdHpPotvW3FrW1IqF3BJc5/DJf5E+3jYRJnvsoM5EpTC
         E3SlaIt0FOMrInzQWj8Zu3aanTJ6It/C6Y1IqcVeVRHaFnnvz0+IBKneuGYF3DjD0ihn
         YbBjlx8QZ2xcCk4leL/RNO1hZ2tU3v1K3gtm85Ipui+aGhYhZKN/B6e1g+KrcTvio4DK
         /AkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgWyd2fKmr7dJFWzG9uqoWhc9IaAPi9NZ6tYYdrEr2ulA/iiFEeo+UyV2EzyQl/NyNg+zKoboDDyhUZtZyySEw@lists.infradead.org
X-Gm-Message-State: AOJu0YxKl4wBG3cx8QV8YRhy+7y/ACawoCiTX04/+6MiulPXu4Ru4CtK
	9niKZjb0NLOfRegQW1vYBDeDX72C8xVvR9NOD8cHyYZdCpjpejFBavmKImG5/Fs=
X-Gm-Gg: ASbGnct98dbaxUCfuzZAFccZteoFySHVeYwp3Wdkd1Bc06iy/MYmIZ2cxPMI0bADLOi
	a3t/hrleLV4+yCnz3Ymg43JrIRcjmTJPmYtB8G3bXxy4toygaEHY+VsdwfyXQMfhcr9aXNcfJZg
	uJUtkDINXG1+RF7RiCJZa/KSVufsBTPHN8+FwangFHUwWZIOXqWAYjp/cBL0JJmkcbzI3hLPHuw
	ti/3pyWb7oyBLMRPIreXfAQ4Su/S+nVxm8Muo0Ed0kw5Vfj
X-Google-Smtp-Source: AGHT+IH8oJmO1yg1ubSZ+z90KdtGpUstGhHd0JFOT72Tqf8VNjDPTT60N6GaHw5YeT5mJn8XmnjWIQ==
X-Received: by 2002:a05:600c:c8c:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-436230dfe7cmr29162515e9.7.1734020351732;
        Thu, 12 Dec 2024 08:19:11 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4361e322328sm44336105e9.0.2024.12.12.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:19:11 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 16:18:57 +0000
Subject: [PATCH v2 7/7] arm64: dts: broadcom: Remove intc controller on
 BCM2712.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v2-7-35986e04d0f4@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_081913_180734_0C4560AA 
X-CRM114-Status: GOOD (  11.96  )
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

The brcm,bcm2836-l1-intc controller isn't used on this platform.
It is used on 32-bit kernels for the smp_boot_secondary hook, but
BCM2712 can't run a 32-bit kernel.

Remove the node.

Fixes: e1417095a139 ("arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index f42fad2d8b37..9a426aa27c74 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -221,11 +221,6 @@ mailbox: mailbox@7c013880 {
 			#mbox-cells = <0>;
 		};
 
-		local_intc: interrupt-controller@7cd00000 {
-			compatible = "brcm,bcm2836-l1-intc";
-			reg = <0x7cd00000 0x100>;
-		};
-
 		uart10: serial@7d001000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x7d001000 0x200>;

-- 
2.34.1


