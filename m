Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A335CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=; b=kVCcXplGsE1M7tJgcds/U8TuPR
	gBsNNFGPFSdB12qYOJTmiQ1a1zlPSaWWj+xcdKfWlsMOk92aW1nI+gpPkTqW5NEkl5AKHQL9HRmk9
	mcyUY4kIe4R9cnxVfPONCJymqFUR1JlM/5LlOBnSpSdGgAtMHb9h6Jdomw73p6IedI4jKFXzTuzph
	zilC7SANs+FN/vtxKBzaqLB0KvHA8LQcTrXHlmWvgSKDDVeJESKGgxjyW2IgqNqP+BoqtZR7pwvJP
	K83vk6ex6igaehTulIqDSizIbtu7oQ0mkT3lwCh4pNOonDzbxiMvlPg1IFHZhcwWfzZVOOlNST24G
	PMjrK0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLogS-00000001bL5-31WZ;
	Thu, 12 Dec 2024 19:17:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3L-00000001Rzd-3Sb6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:36:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-434a2033562so7042135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028606; x=1734633406; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
        b=f/aZ4kwTrU/sguaQIMiZXKO+/YzRxNY/8KgtuO++lQq6/PaZVBDNEq942NW1ABMCZY
         k4+XhXMTqEpAlXNYiiXVehV1ifi7EJvPON7VHwF851xBPKYvOYgIAyOKM93vqQQPdUT2
         e685GBrMMhPb9cI8wKP97V3LClQk96rnKAMG2GyVh6gichrEscJv6kzcdKeldGhVv8cS
         7/eC3t7ndU50hBJTKhpLYLEi5Fq7FD8rDJuaUkIkZV2jIFrjM7LCkhjDvlUxm88vPcQ1
         JmDNADqP/ojBXmZOvK+UQGtR82a7LgW8dtVf0RB+xmjSVi18z5R3vmxI7GZ6azBYHmFz
         6AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028606; x=1734633406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qoOTheHNyDXx09eLZAAbq+8+9HV4ZRvdNqNlfNALco=;
        b=q1WK8mvZ/hdBoqoslu9VCoEOm8iZkLzPLcba5bD3AN2t95IAyb203nCcpn8m6g7/4j
         R9ZmXfQ3NcsQLlN/byoj1DNMG+x1GTiNOcyMiozNfjPgU6CAF4O1N3rwKBiHhD/C6ja4
         6BqNlGv1HxlVlPsv9XlGuSxJAnoOKQ/dV9jDNYzgU6aReJh8AJK3MPlEnOpCw0/TJSzq
         au8rIw4mBWmy2q1m6tSS/Yq2MEzVNkNtDEQmiA5Ba8gzEQBE/a0pwatqiJ5Tl0u0HtOH
         VIicsHBesRukMU5SOnVPim+3Cbrd2CVs0HOs5Tpc9y0+s6UvWDjVdZfya8ppYujao3+d
         cZkg==
X-Forwarded-Encrypted: i=1; AJvYcCVtlk6uPUMauKYTZJgJkTDAHFVM970G/pMEgXH4+HeI0P8Mm+TexpkzigbmM8WLaHi+K717rxvBbgZViaa/rXYY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0yVZj0TZD9rYilCB+Rb3uhQgnrO2E5lKfLLJMEqNtvB49dE5x
	mYk1YIlEipTGa5KoDSBi16xP8hQKHr+w69OtXWRZCIbApXpnrH5VJZhBt83T1LI=
X-Gm-Gg: ASbGnctnHiN1f1FqG66/s/+PLLh0QqdOOuMfG6MObF0uni7LNA8CRC/spkMWgAwyXNL
	RHGk9JvDocUtcTiiBX38+e9yaaN9XQXQhVKdBIgoYa3L2eJ1XYuH6BlLZpHMmyLyAM/luekM++v
	Rfr05zmEE7sBovhDMcnZtBiNRKBr+ZgOygeSy7Fc+eUVr0QLCdeh+qdzL/qXGGqFJ7RWlbvqIBK
	oAD+fnYjyDP/WJHTgEZIg/EPouSjgJ9uUb2V4+vkGHMR7pw
X-Google-Smtp-Source: AGHT+IGL4E9j9A1tMS6SuUyiiajyBjok8IwHS0bLS9tymQ53Yae5HQb0IhaVfgk6fsEuOcpfD85mUQ==
X-Received: by 2002:a05:600c:1d2a:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-4362285f769mr38353035e9.24.1734028606518;
        Thu, 12 Dec 2024 10:36:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:32 +0000
Subject: [PATCH v3 5/7] arm64: dts: broadcom: Rename bcm2712 interrupt
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-5-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_103647_871033_A91D5A5E 
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


