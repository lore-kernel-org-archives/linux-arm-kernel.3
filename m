Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681A7CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgDS3ViE9NSujWIMzNrIZdzaFnZBEociQgn363+PsFA=; b=ZJm68gaIt/5cLtzNNo9zMBIN37
	7F6UOGN1gu9+mXeuAi2FA+Q/mPOcPPqHkUCtAZIt++B7wokqzoDjCIqYYPiA+rwVN7sIpdKn9JLaW
	1p5Giyp9CBjyrIBCRyOi30zBs25wyQxtp84d5SLUF/HtDADM6I+qF2lXMsHdgqm1jbDZzGW1mVQg0
	qX72UqxEBUPVYpNiiNwPoM8HKU9VQli2k2hq40tmBbsSZ/gJ+gARlQd4stXf6UkilnHchfySt0HZy
	LUZ3gTal1YFnzFHKlMRz5twmfMvNgsSgmbLiVFzsXFTkLzBgArHazkrxNf1g0MLWWMADKC4ynMqN3
	9GmhU2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwH1-00000000fT4-0HEN;
	Tue, 12 May 2026 23:12:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMwGy-00000000fRw-0lub
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 23:12:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488ad135063so49185685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 16:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778627538; x=1779232338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgDS3ViE9NSujWIMzNrIZdzaFnZBEociQgn363+PsFA=;
        b=l9XdBbeHlXY1JC+EfBt6M0bZp23Ndu6wpAXpT6RkDs0VDXDpaHlAkJCS82/brja2X6
         UKjvJeU4JXheLuZpBizkG7sKn5Z7c5E21bZoI9J5L0zHBIDqT1czVSU90YOxfV9Rkt8e
         kof3cu35JfNXt2fLah1ekbVR6gZBA08HDhC/YXSlRJmgT1wrbQpHkmTG8tWBmlCsncdx
         WR+0FDx5yuCeyUwjQ9D/aW/0U6ws0XcpQ/EqXGx+zhYz9csEEPsrcM+BMy7z6F4222nK
         vEMvZNsJ9c47dK0+K/5Dw/4hQ7oJbIbKsjZw/3Z0fUu+CquiVVGmwooyiCecyGqi9eFF
         Uvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627538; x=1779232338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgDS3ViE9NSujWIMzNrIZdzaFnZBEociQgn363+PsFA=;
        b=ETcrCRhZkwoF4MU5gZ8+tneCCcwGMAQlox5dj7gCAFRDJQFlB7b/AYfZDdr9Vdt42r
         b0QkLDsN7+oOaM+1lj7848S0scR8F+nxYRsXh9I2EKwJJZcvXFciUmsoAts1s64yxqzh
         GzlLUGzxPttatbCf57cZ4GtBwKjEMPBpUWz+IaWNx+YLt+ihd5VI9B6v9bEWAw4oW/tL
         iW43/LqSC82ZE0MZV1kr7g5Ay9L+wmv7B8tRIAsnCCocGLSbLALKjco+jphWyZ1Nt0IF
         ZOBxXTL2fAsn/OI0MnvtE9NSaaMLScu8xRTXKkUAeg+ptXsJ4xo4mS9QJxHWrqmb3Ggx
         nzmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9bBD+TvPLFcM6MNqtvDhw7/fYpi1qrj321N6mmKiy/na2MiyfwTEu0iXXDLvcQ1qyY3rJmEnHCam05RegXrqHS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05Q2VEJtPuqx+xqz1xZuhqqjOhUlsqH5lMN8oV306Qjw0VxGG
	46BahLFyBCL/xig7s+fJQE2W0J5YYT7MMIjqhk2kwhakt4MsZT5qqW4OCW4alnKVqBw=
X-Gm-Gg: Acq92OGNujedZMdRe8CiPNW3qKt3h73+PjimLfwTdSOKJyVqZxk7XZkmGNnTQQYWOyf
	0NPljKB8gRMDGT9pomWHYVLhmRoemBepM26O+imHCkxSaiKKjGIMDn6XYo9wcheM4vejquIcQVa
	5B7GWWe8A0eaGAep2hMja+rB0WBTNQlbM98lXCR4DKSMxtrnrZIJED/0+Xa4UX4+1TPksByshkR
	Q8dqVNgX5Z/MiQ7FyEZg74x1UT7lFysoYXorjM8UiRge20XfhQHOnwK52kS9UHazSXSgS0c7kDs
	wYLkPCkcATyCHCVPRlPq6PDb/NGRCzR7ZVsA4VJb5ju/BE+bEouafcWzG9cua7p3OyvbXquQo30
	qda8CmlMlgUU7kU/Io0rF0JWZeUHoC8jP+/JQIfH+dlRYU7G/UF4f4ZG5p3cIUuynYc0mGUzWvc
	s+NbTqCvFwq+dUfdAzFqQp9cZeSS0e+YCWMo7yZW0Nl5NpIIudTtKv7g/nNVfhJcHB7QOkQsajs
	dCKXf1PIBud4dYs
X-Received: by 2002:a05:600c:3144:b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-48fcea18dfbmr1307925e9.29.1778627538335;
        Tue, 12 May 2026 16:12:18 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm20712305e9.14.2026.05.12.16.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:12:17 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 00:12:11 +0100
Subject: [PATCH 1/2] dt-bindings: firmware: google,gs101-acpm-ipc: document
 Exynos850 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-acpm-firmware-support-v1-1-3858d097e433@linaro.org>
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_161220_240131_EF2C1F6E 
X-CRM114-Status: GOOD (  10.35  )
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

The Exynos850 SoC incorporates an APM co-processor. Communication with
this hardware block is done using the ACPM protocol, which handles IPC
messages for clocks, power, thermal management and PMIC control.

Dedicated compatible string is required for the Exynos850 because
its firmware utilizes a different initialisation data base offset
(0x7000) compared to the existing GS101 implementation (0xa000).

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index e68f9c3ca5e2..511c873280fe 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -22,7 +22,9 @@ description: |
 
 properties:
   compatible:
-    const: google,gs101-acpm-ipc
+    enum:
+      - google,gs101-acpm-ipc
+      - samsung,exynos850-acpm-ipc
 
   "#clock-cells":
     const: 1

-- 
2.51.0


