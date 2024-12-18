Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0A7E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=; b=rb4r3+p++Q+yQSYDJR5szLviVd
	doZ5KOD/iUHyoApWLEmabjgoxVCOMGc8RlZVzgJM7b4359vXklgonwQSJa7UZJRd5m47RBwf6j3pr
	VF7CjTx5O3OoIkg7yShaxQ6Q7kHTLvDkGSD7XAS8trQ9UEfq4FU8d4hzJ9/5x5YuiC+l/bkOe/egD
	ts3qWnWqc47H3/Zs9O/TT3A0R8+1AKRzCJUOu1s6WgG/rg6KfRXe1I6YXCxeH8GgKrCU9R0bY07GA
	Dc465ClN47lc0oUI47TN5gjrTsCKiaKMEmg2UBjCDntjvNgWfORmwywYGoRzrnC8DS1I+XqIKMy2c
	KkZnFuvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvQO-0000000GvID-3Sqw;
	Wed, 18 Dec 2024 14:53:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvM2-0000000GuD9-0oat
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:48:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43618283d48so47706745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 06:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734533329; x=1735138129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
        b=Y8MdA75SK9JrnY9WuZUnuhFgOoB/j098uJKIfyl+j7InDv4zHeJwFX5S3Y7BLgjFyc
         ld9+5sNyjv+pf+/YtuUJi1K6uHxFzSRxzQYxp86SrrbzznRmsVUyqtBFyo4eocDX57hq
         j8XyqIT92IEEA8BmqVArd17q+GlfW2uE49qKmH4jpdnsCYB/kMaqg0tL30o9KtyuO3tK
         mArCOLUUmtbDthEekOWQcMuVcMg6k70SRW8ioBBQrfhr7xJTtf1PoaJmWxrii7v4mJS9
         pLjxHnMO+PLo/8lwQWhki1sWwqlXz9yRCBbHS/qOzFHs4SYj3YtRq1L7wKtIWC6t64rZ
         gLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533329; x=1735138129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdlpFNH3uxbIb6jb7BUkFAfn6xTxvwPpL6GXsJonkco=;
        b=C9DIsgdxFa/cwrFrbeFU4SkfUPo1K6g1uRMuajcuw/H4iYVE3k3Re8zdZ42BSUF37d
         /f0CAadz0e+/B8Tf/jQ8mGeWKEXlm7CE8VF6GXH6w5E4ZcLxXNJqVBYRj4svkb3XSI0z
         /3dkXK5QnjzNhZspA4uLLSALjo05wsPgh8Qd7MI0hj+mGq4GEsVIT0owtUQaqLRaxFET
         sgGs5eh0rd4TIlYONzp20G8LTK2JSDG87geZk0S9awxlu2vS17R7VBImwrZaLb98T3ni
         NfZbJNMNzQ6CktbvA1/n40v7czeCCInE/Re2lqQZTwt0m+1TFbTle5a1GQPsSDdZR2Ye
         Qwfg==
X-Forwarded-Encrypted: i=1; AJvYcCXMqV7TmB9nOLaX/5PhMlBm7ENEea45Kee3dDjZjxliK12aqcmUWCNQ1zKy+Kg7YAO8luIOANkpunKkw+nRtDH+@lists.infradead.org
X-Gm-Message-State: AOJu0YwT0bNEvgroA3+WT9/O8lxkS/yYZzIzE8u7f8oGOy6wWBcGloy0
	ovZjTPomgj4H4KKE6qKmg31zA4H6MJ3l3yRW8v5v0eQwulzcDE9AygvkBYRT8hc=
X-Gm-Gg: ASbGncs5De1hM6mmuDofq1Jip2JLtddxanKYVdhhqYs/u8vWjpti/OCj4Qaze+A4v5K
	ncvdIf/CBOKvop8GBGFbivdo/x5TKAnRk+PPbalYtBw8v04/al5O+g3a0ReFsjLJ6IvXHyfkfgJ
	k4/tx9J8X7jxZN95NtLDT7OeSHEEJp4Dk3SFHj7HP+nHNcG+kFDX4N2vPSRjz5g3QWaXnprq3p/
	shgg1q6TgE5k/Ce0Xf+P+uvxDHMdDwHoWOiaR1Y4zPTPLJh
X-Google-Smtp-Source: AGHT+IFUOlaIMq0ju4X1pMuz5qrQnXVsaODM2WgRs4TsUqex3ceWQT/oN7hnGqCDlfDO4YNtuXpslQ==
X-Received: by 2002:a05:600c:198c:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-43655345207mr24910305e9.1.1734533328637;
        Wed, 18 Dec 2024 06:48:48 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c80613a9sm14165163f8f.101.2024.12.18.06.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:48:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Dec 2024 14:48:34 +0000
Subject: [PATCH v4 3/3] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dt-bcm2712-fixes-v4-3-54cc88b6c229@raspberrypi.com>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241218_064850_247081_E8321B6A 
X-CRM114-Status: GOOD (  12.01  )
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


