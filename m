Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF6CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TSOPNPRMnaPF9/SoAjj6vePNuPPSdtRMPFR+ZByYRMw=; b=Xb0HzQLB9LaUQC
	s8XobhGUZe3EGxm92Ze6GJ+oNTe8Vrv4Cl3SSbw4FwVCuSZgQAjHkryhFTDfyGzHCW0nbp1HojECf
	8cgwznh+4qr9JU2eIUMH3qcnDesXk2AVjNfb7EoYu3MNEOrexAz/IQOumJl3g4t4VMi3JZHVHRLOO
	PIHtPUiXOh68NBk47GtqNRqKiXadpmptcFCImLYOpn9cgu/8yvQSTP9tQo1vOCll5FeMjPTN6fPOE
	6qTEGVnyNtaO4o33ica+DNJNJl/UHwgSEChNDksl8dQRTXYTbKKrl8t3x0PsQ0eaSWsfOH/tB712y
	oRPRV6TP25e9/Il0FjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7Vb-0000000DHFu-3F4e;
	Mon, 01 Sep 2025 16:35:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3zR-0000000Caif-2moW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:50:30 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f7039a9fdso2184038e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756731028; x=1757335828; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TSOPNPRMnaPF9/SoAjj6vePNuPPSdtRMPFR+ZByYRMw=;
        b=MycnVa0794YESWf/84p79mCJX08v/7TQBvw0p387uWbBMpCtSsdoIRewujH6N2MUVZ
         u2KAfZdMVlJL+hnBE/OZcjvk2tlALljLyH5PWB8z09/n3tokVmX4WFNO9W5UwluWawtH
         E7t/XRzzVLTrT4burBe9M2cqe1Sx/3AfAexx3FQ7S7jPD3boHtnbRr3XfqGGPv0KCDX+
         ii+q8qtM/kpctTD7CbuW0/LyrhBlV3X8Y0LMm3IhwamGkbLunY3Z/Q9OMQWFfc+WPxYe
         RepLFd49g87pIN05CLtDYGuHKO/N8MvN7b1guTFnI3JS2IXQWD9cE3vQ2GaUxU16gA6x
         i3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731028; x=1757335828;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSOPNPRMnaPF9/SoAjj6vePNuPPSdtRMPFR+ZByYRMw=;
        b=PTu7LN4snNF63MfYceizkVmuj1TERWWZBY2oHy3tVAZlEjn3cOpr3K/7HDGm85rHYa
         L5NPWKGuSmu1Ohxn2boTZ4b1Bd7UlPSTRikJX6iRgPSEy6snP0HMDr30g4243WQAIrXA
         oiRmmY+JE7a7bs8AD+Y6qF1aKA0yqM5H5GNVnWsUPrs6StDhlHjIwKDg5lIy66Ge+ONb
         3O7AcyK0TLhNK835r2nfZ4gDP9Fk+Ik4R5zVCNi4BDMJNIhsvwexVTwFnXV4Wbpzolzx
         ydFCOL9cJRdGigAFTBy6Ahx3OKMSW8P3qiReKXjKDKL+lREM3xWPWGzrCsZs7vMmsdg+
         OtWg==
X-Gm-Message-State: AOJu0YwrVGeDnmu7wmePrHdhCqNcNQNa8qPqyO3xQtcmIWXrHfURJ8pN
	EgPf41ft1Q2nyfAxZj0e+2JWlD0MO/P5YmZKEW6rQY3Hb9LqMq92F/cWIGVs12sEUXVpSObmA9v
	Ty6tk
X-Gm-Gg: ASbGnctYb24oFR0o1Z4UJ1By7fTkA+DXRz2UmRprS4fSmebEJ8+QYpagAy5oQfW9BZ0
	vwXWiFY9CD3/JnKGatMWT3+bGXqzBuOV4SVzrK8vznGg8NNW/nhwY/HSi+4n5WNPHpQvzGzEVLw
	hZfMIj3bayzUFH82y8q2gtsaZCO1MO6WGuRA9MXkfIGF9dfCVSmg56L5mAwTyNqbOQ14fVr/Nfn
	CJnmZrqBMUA65QnfSJPdjMWG5HpV8SfmKCIWxVlPFxBd50g8ONILFC3Jlk60c3GwARUgSPSCUo6
	dyIMb/PYqS9/R5Bfom1DKhfDKDQj2VtHVizXsRutOwnDuvzAu18DyMu8wB14f8mp/GFnte/b5db
	sGQ0vizLoWaUrdJDu6omCY2i1Wd/sZHompdcy73OwdYE=
X-Google-Smtp-Source: AGHT+IG+d9eG4TUGw4cyLZemnp7opu5l2a0O03fjPPaFBRo7zOx782MStPiUsVHtqUcD9VMK8iP8kQ==
X-Received: by 2002:a05:6512:61cd:20b0:55f:770b:855e with SMTP id 2adb3069b0e04-55f770b8649mr1123524e87.52.1756731027725;
        Mon, 01 Sep 2025 05:50:27 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6774bc3fsm2926155e87.59.2025.09.01.05.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:50:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/8] ARM: dts: broadcom-bcmbca: Fixes amd I2C buses
Date: Mon, 01 Sep 2025 14:50:25 +0200
Message-Id: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJGWtWgC/x3MPQqAMAxA4atIZgNNRUGvIg41TTWDP7QigvTuF
 sdveO+FJFElwVC9EOXWpMdeQHUFvLp9EVRfDNbY1vSGcOZtZodqGf2VkHzoGi+BGzJQojNK0Oc
 fjlPOH7ELcghgAAAA
X-Change-ID: 20250901-bcmbca-i2c-dts-1df63defc310
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_055029_733503_242273DC 
X-CRM114-Status: GOOD (  10.06  )
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

This fixes some of my own errors in assigning IRQs to the
32bit ARM BCMBCA peripherals, and adds the I2C bus to the
32bit BCMBCA machines.

Maybe the first fix patches should be applied separately,
I don't think there are many users so I think these can
just be applied as regular patches for -next.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (8):
      ARM: dts: bcm6878: Fix PL081 DMA block IRQ
      ARM: dts: bcm63138: Fix RNG and DMA IRQs
      ARM: dts: bcm63148: Fix RNG IRQ
      ARM: dts: bcm6846: Add I2C bus block
      ARM: dts: bcm6855: Add I2C bus blocks
      ARM: dts: bcm6878: Add I2C bus block
      ARM: dts: bcm63138: Add STB I2C block
      ARM: dts: bcm63148: Add STB I2C block

 arch/arm/boot/dts/broadcom/bcm63138.dtsi | 13 +++++++++++--
 arch/arm/boot/dts/broadcom/bcm63148.dtsi | 13 +++++++++++--
 arch/arm/boot/dts/broadcom/bcm6846.dtsi  |  9 +++++++++
 arch/arm/boot/dts/broadcom/bcm6855.dtsi  | 18 ++++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi  | 11 ++++++++++-
 5 files changed, 59 insertions(+), 5 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250901-bcmbca-i2c-dts-1df63defc310

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


