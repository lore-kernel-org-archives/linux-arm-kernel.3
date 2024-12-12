Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9968EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=; b=ZmjvrCLsdpONkDafK3ypZPRSF3
	pgb+MFS8ILaBhSwcdW+BK8ccXFxdQs9eCDiD4Ww05hZDHncELXhZoo7LPAaaOiFP3gDZ/q3UgHe7s
	SIAnYmW5I/RWSbtxNTVB1Y9px8/Zw1EebzTvLQ9/6Ari/6/hcMWwAkDGk0KmSIx3afRBDWj5AKesW
	W4rtn7jXYtePI6TDKMp7ZvHTXDqcMni9UfIaKDYl0qLEjM3+XnqW7fh1NLmykSRs57j2vlLOfe/yQ
	EuJ7Exzv4Ygd8KV1M87BFSVbS/0x8xJFP5pKC5xP56foWECNNBU2u96OWSbQ2lelRGO7fLgC8CX85
	mclt3qoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLohW-00000001bZ0-2bdK;
	Thu, 12 Dec 2024 19:18:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3M-00000001S15-3iG4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:36:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43622354a3eso7034615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028607; x=1734633407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
        b=BaLJMmgcT4YVcwna+acdWpAMTmH3refxN6Tm6ywW6nkYx/BOCQkWDJPwljxKxypP9V
         YYUq+EchxNTO8ddn/6WzhUh6JY7IKAaMibs6BjWNnFkragjWKzpFoqw3zfkkIklKsjNm
         sIASmj3Y7u0083ngdIdVV9VELJfyeq2Va/yJsjK0w+aN0GQ/BwexWmio1bXwGuOiv2Gf
         qntDl9SGGclVncz1VOc730LDGk0khye0tgMX3uPY8tDCn2zOWwT+zezpj7q5Jmoh+MhJ
         WF2MY/7SxV6zjl4w0F2BWwvjoNFgnQnyqLzLeCmrk366UQ49jz/NY+lirZd2oFArKJrU
         Bg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028607; x=1734633407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDsnxHgs8pPYbt5Sxgc7PD1JuNe9FEImA9X5O9hYyxM=;
        b=btJV+WzI9lzIobNmJYwbi0eMgvfFZewvflCu+xi2ZjSovogG2yQ63IEdpSZjCCbnVH
         iHFroIryV3npTF8hujVMDBEu40PDD8QJflRhw3iZ2FxoEZ+mePac3jURf88uTN2ltuH+
         0HWo8yl8QmS0Ses1/bSRa21hX0/0nMK51SeevlBidxA19Hd/lNFpryT4xJ0/ZxY46i7m
         K1KEsimtCDmR5z+Rh8xPAm9tsYJY8McS1bBzy8TTYZp6Jiu2ftJmmPJIm871ryN60eet
         GVb/aWWyAAHusJutMNmxeMUlHpZL45QNB11c7rizl8JPhty36xBgQDTsBOqa86iJIYXW
         05qg==
X-Forwarded-Encrypted: i=1; AJvYcCXwwetEcSI/teP2Kf53a4b+iEIo0IbLSXHdD/yvI2XUEgjtj8fI6KmfzfrZbcDwdNF4JYOhscNmyJ6d6qaT+fu8@lists.infradead.org
X-Gm-Message-State: AOJu0YwjsQKsuzFvyQW595u6i9UpZACokwdv9iDjqY4lZ70XgBTA/mMT
	rXcRVVzgZCdIzfC0ypiFKuTMXKXRrlt+aDWVrs1EZ0WjxB4ezHO3N5bl4CLkZV6+wCqaSBxuI5f
	meAk=
X-Gm-Gg: ASbGnctRxuPh9/kRTneDXRJr3Z8Po/dIocKMVbrLYVqd0i04pQJPxHhhXyrhPVPXC0x
	nasZP6ntJ/Zvb9+UvK7evqwK97Zk7eeQn37GsvEuhUfYgzy1lYmNqLvP1Ezjs2kX3RlkawnhQWR
	x016V+ISZx2Qpkkd3jX0jy1zyPX4RGw8Qc+M0bLRSyhB0zfEMqFmev/20zsEy7piH3Ay04ccad+
	TLL0LkJtVFgwh9vwKqUJWzYiMo/mudYp3xFJoPcTUXUMCc3
X-Google-Smtp-Source: AGHT+IEu2xL/+FXU63UNRhzK1AOzvmFc4RtXIaDc5vdsewo82JD1gWWmf7YI8MTxRmnxwh6YKbXzGQ==
X-Received: by 2002:a05:600c:19cd:b0:434:a07d:b709 with SMTP id 5b1f17b1804b1-4361c441bcdmr59652015e9.29.1734028607573;
        Thu, 12 Dec 2024 10:36:47 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:47 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:33 +0000
Subject: [PATCH v3 6/7] arm64: dts: broadcom: Correct hdmi device node
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-6-44a7f3390331@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241212_103648_919357_7DAE383D 
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


