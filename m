Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A940ED78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoO0W1lzMLcOdS6iQBTqdnnGTSDtRuJivefn0QP3emg=; b=LiigePTTPwA0zGgm2rihVDx9p8
	0dy4zufLkQ2nex1oOc3rAITA+C8QSZzIN3GOr5b4pxgGWYkdtfOyUAkOqtC29T/bYzeza59d6oluJ
	CqbyS4pSv16sb8PYFyGTHidjBlUxnSGdxbGjGJ2vbOO8kJz8dKxyZQzJrbh/n8aCJ3ZsSUK1VJS/D
	5707og8cde7jCjTaxprG8u0F9AoCAmfxL7e/mOnfFM8MRFy+JHRfZIA8Dx0M4I5lq+sn+THeV36Km
	zfFX87xxrEctDR6057XbfxV1yxvGB26T+gNtA6RI57i0CT1utJOAj41ftzUeYn71/8vRh03I+KOVI
	+6JVqo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7cA-00000006UcH-20gT;
	Mon, 02 Dec 2024 14:41:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TS-00000006RzR-0BbQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434aa222d96so54811205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149948; x=1733754748; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoO0W1lzMLcOdS6iQBTqdnnGTSDtRuJivefn0QP3emg=;
        b=JRUw3Qt7OXs/9LJVKypGj2YToCrO0VFPBEzlVzbVllFxyebW4nwrqb4VYGBV2NhDaZ
         5PIv0Xr83AxgoII6nMne2FRLZrxlX6kIxLSKOKjPSwoxeWHbuhJjxO9dcQV/Lt6CEzst
         14/EJo6wLQ7e/4FcEAOYoD7KXZvnNN3dlceXaqHsPIDzWsDMu4wGalKBud/IBmSGecoi
         MqjGcNem1nS3FPYYDfbxOje+PNwtihqEZGjdSjtluSdCnt1AmRg8387toOGsMw0XTary
         V65nuKOuFFReM3m3eCZQUOPT42A6bSUzo01tRS3b4/OmNpF9TC/75hIsN8E6zltcd6j/
         lKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149948; x=1733754748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoO0W1lzMLcOdS6iQBTqdnnGTSDtRuJivefn0QP3emg=;
        b=tV9DXzZ6GB1oqoqAjIPZZPeBzIQ81CEVtXp9vkhEIZCeQjTnFS4gpeFsRlCTaeh6An
         h8kK3r1tBM/g4EFBi+w8ro4p6elJzUc42fL1TF5QqAqvUihR07ofrBxgE4oHHiYWaJcx
         FFW/wmQxk53+MJhB7ZC7BLtc68JOA/nOqhvbXTmRs2XoEFp0rHQPp9d88LE2M57nXxC+
         sk1R/Wa2g++Q1fipd3igwmkuY17T1wJpXoKlQesovvgX5326T0cn/bzjba82WF55/BPh
         P+FgNRbdiUpIJC3g3mogJMQHcBNzyDSawWviYkL/RNtLODu9hBf0ok1qbiv8waq2bGlH
         5ReA==
X-Forwarded-Encrypted: i=1; AJvYcCWWW9KC5PLDdi8SaZAH1FgblPqWK/gmjq9fK6PToYzIEjDV21lJn8CQ8gmZacbL13NqjHNIINrZbvg9/NayiAvH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx04I9EpO9EJa3GB6aIhLWU16vChEBdyES3YkkhziNGcdcx3tMd
	6FxWvGI8HkCEbLjSro97gCgZS+g0jjARy0iEMDDi7J0C/bXztaOzkgLc3LKMoZ0=
X-Gm-Gg: ASbGncsxV3n//ayeAgRvMBJ6g2M2jOs3iFvf7Og5D9QyRmQD6eCc5afr4Ok6FiS1cra
	eOqEx0KeyDA9qIxL+NS2WDJaDkJxOe4enDpzcU18f0dgWOBXLlmTXy2AiNR+K4EmXw7NVDofBh+
	0vfDtlvmssWbdE7QFuNZ1vNGQhAKxA3dkdyN3ycu6kJO8cwkJwDxF97hybOww6kjFEs+acfRWvq
	aHdmGTrpPoSG+Y5f0uqSDzrS7tfSJav3P9w/qUpoA==
X-Google-Smtp-Source: AGHT+IE0KkUbbY+W4pZJfpChMoM/Bgrd/vrm1xb0nOBeoKJCjAgqt5slzwSLTSLUpuVmedDgVR+CWQ==
X-Received: by 2002:a05:600c:3549:b0:434:a923:9321 with SMTP id 5b1f17b1804b1-434a9dbb626mr248858685e9.5.1733149941245;
        Mon, 02 Dec 2024 06:32:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:31:59 +0000
Subject: [PATCH 6/7] arm: dts: broadcom: Add interrupt-controller flag for
 intc on BCM2711
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-6-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_063230_100276_35FE7BC4 
X-CRM114-Status: GOOD (  11.17  )
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

BCM2711 DT was producing dtbinding validation errors of

interrupt-controller@40000000: 'interrupt-controller' is a required
property
interrupt-controller@40000000: '#interrupt-cells' is a required property

Fix them by adding the required flags.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index e4e42af21ef3..313b1046d74f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -51,6 +51,8 @@ soc {
 		local_intc: interrupt-controller@40000000 {
 			compatible = "brcm,bcm2836-l1-intc";
 			reg = <0x40000000 0x100>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 
 		gicv2: interrupt-controller@40041000 {

-- 
2.34.1


