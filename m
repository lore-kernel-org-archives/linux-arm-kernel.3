Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE59E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=; b=cDnwXMjDSE/+nnnYfJFAI9uHFa
	NM7hLPtXOnb2s95I0tq0sFMQN/+Swdoz+5vAMYcrVNwi46TnA/xCCdWB5nt1vyp4Hk8Pa06QnUC0d
	ptevuR9KoV9c2Nu7Nlg2UDHwSqg5qcYJjW7wUigw2sIAHJoZxsqTcwpKu8DE5jGY4dhqyijfSiuph
	Ua/8fCHp7x9hvtMUh2oJhHyFKYbN+MWtHBc0UbIMvZPGV3Y2cT6PS6ZuRl+47mxrl4IUJT4wW71Yw
	Sg7P9rNS+PbXZXN189zldqIJOyjEdVJhgOS4siNF6HIix70fUrweRvG3gOb010P+EBLayZni91jXy
	nr/kC4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofa-00000001aVl-0ifK;
	Thu, 12 Dec 2024 19:16:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3K-00000001Rya-3cWk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:36:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-434a1fe2b43so8961305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028605; x=1734633405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=;
        b=j+WRepbRrXAItCn0hmZD3gsNIvyOpB8aEjuwusOG2hJNwWHqCiGAcwcKV86sXpbU9b
         +L5ksBsXviB1kgpSZaU8JkZgsXD+jcHCvTK6XgaWnvYpKgiwD5XUuHZoBc/eAbx1rmz0
         MyRZ3J8246LJK4RzCwJ5M/YHyAgnGamcC4BftaL6z7OpcCJRz7GH3UbO8Fn8Erg2sTyg
         XKX4FQ7QOnwH24z8nrSE/yGvX6reXSvI581SE7dEALvBe6sXL2gq361mjhX4sEeYSVIk
         DVAxzmX121SZmY2RMgw2Y0hAQ6nSLOHQR4acWGXj1LRUJNrC1ztfNN9SDJByB1Z5uKFr
         1P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028605; x=1734633405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMHTsU0ZjvRQjwquvG/Hg5h2182Nwlr0NKl2ofXPRL8=;
        b=csI1jNnmKK+yTUTklAkwXQIz2WMQh0Ht2Kgb9pFvf5AEYoglm9ecjvhdu25aElRetB
         Gr8xohiLnLbKFtsabOU6vFcHczoFTwowDXg3fPuujWRnh4xFFFujymNhRTCzryVN3m00
         f/RTHC9UHbP/OQT1tsqUSnOVljjEh2g0YXj2WFSyG+32KqF26i/Q+EPkHVLD5U/S8WTc
         oHya3pkDOuzJ7fLHdPIQ+i7ipUDBX7jjmxNg16hEkeKtRBVQEvGjahrGyqPwChH3LTOV
         I9UggImtlA/wU3Gh2fvjGWiXGFNsK5DddApie0cN+EUSKfTdhJKhkAjyeKHIL7UdpqKO
         tRow==
X-Forwarded-Encrypted: i=1; AJvYcCVabDa6Qv+6vciDxYsnsZABW9kO0ci2PnFYQ0b5Q6rOVlDtUZHlUTka/pnUtdM/s6Ef+Yh/MkilwkYn1LI3PkzT@lists.infradead.org
X-Gm-Message-State: AOJu0YwWnIXz1IZBunQhM+ZlMW5j2+02meLDs0mYS+0RVJ1NsxiecMo1
	ETHe7dB8qystZzKF1fVlTODeltsYJAPVQ5E5DbJSEYW+l4SEGG69c6ZKT0guZew=
X-Gm-Gg: ASbGncsQvOyW9stV8+DspWCNC6ljndBrxwBJfTnVbL16OfgSw17/LuXZART94pTk6ww
	zsynfHMCz22RIn5zFiq15nnix9Cs35A8xdGTd/jtzbXpgblLGLUHwT+sQbYyNn7B/GmpH9S610Y
	9U9N5w0xTm9nzW5EmFBmuWANgyTzCDayVczAg9whgggtqm/IWG9/hmcMpeg9WUpgv2NKxLcIJ44
	b0VmL+Bq/BGSP8hPuTQRNXDKJEZBNmUtAlwwsc11Omr1rPC
X-Google-Smtp-Source: AGHT+IG4dP9KmyH272DNzwrKy7iYqqOHD3rxD7Qawn80ZhvjM1j+yRssRbMddmKcTh1pYEKJi0HQLA==
X-Received: by 2002:a05:600c:548a:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-43622823c62mr36013125e9.6.1734028605564;
        Thu, 12 Dec 2024 10:36:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:31 +0000
Subject: [PATCH v3 4/7] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-4-44a7f3390331@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_103646_900717_D343D6F6 
X-CRM114-Status: GOOD (  12.12  )
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


