Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3216DCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RvDvjixk5xDNrFQLv4PeECHMMHurHSG9SqBUI6Nr4E=; b=Kuyrivz1GqVG3PIJdX1RTrRgU6
	2S/L0t1sPKtrS6iJpyumn6GA03Ec36aGELVZTV1elJRENoIfs2K8qKKR1kP4S7PkiGj7KgkeucYy8
	oY9EW0Tvp66DfjOsHIVCtNGQXVPGCfby+zKNEOZHoajZm1W9Frgc1rhSvTLoJc7BAjCpKs9lrK4Mg
	HJnHEyB+JqcmTosIFhmH228qZHyLaCt5yak6ybU1XoGwuK4lRhr/4VwpEj29caowBmhLYNPUyLy8t
	+g48sKTH4VHZmrZ+2IRjy62W1S2cXAAStpN0wEbJyu2tpaf4ZPLIMHhPOYGPj58p9WzYzExqqi/Gm
	hbFr38XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHxb-00000007g1k-3zxL;
	Sat, 30 Aug 2025 09:33:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usHke-00000007fC1-3x28
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 09:20:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b7f52cdf6so457625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756545599; x=1757150399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RvDvjixk5xDNrFQLv4PeECHMMHurHSG9SqBUI6Nr4E=;
        b=N8yi2Ba1zAeT30OllH8j5dR8KASeWcFQwtDshbdIYJFbT561/MpanUdJzrGwDcfTGH
         pZ3yOwzX1GGArTIC1l8U9EZ3/cpvBPuc0m62AhJRujdfHu8yv2g+JNgshYOZ1O4Fs5g/
         UNEDA+Jlhd31j3RvSHtVMfJZ8bKHR302Ri3ho6uDrP8d7C9qRcRiHGu0jRbEp4QVGML4
         B9CGHZ0Zr4NpK+/YxVBbf111KThNcebpNo9HjBQmgpshqd/1ha+CfPPOnlbJg4HCkTl4
         24shOtuHKiGEz24k8TdnRSHfn/6I7MQkPlr0c/sfgNzU4qub34bxowV5ZH96mSZt6Fda
         47jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756545599; x=1757150399;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RvDvjixk5xDNrFQLv4PeECHMMHurHSG9SqBUI6Nr4E=;
        b=CosEe2QC8fsaGZSorW1omm5CEWFs2Q8kJfQkm804wgRIjVKGM3wTEQfMUsBfM3fdb2
         j9sgd59dyOwRN/3f2lb7Ny82JsyRYl6p9/BTDZqEshQN5iYu78MUpJGu0GzRW7aojhMA
         RXleNpdfqixR9ebpdb+0fV5TtQeiJPF2S70Bxiqtee1vdgThb0mamjRTTbXT1zKrn8u9
         Vi4PAunHt2fGh7HGHoSEVcbPWz2LWV2y9B2E98PL/Y1WTDgKR1KkoC79d9/sgGw5DCTW
         7kRr3ZyetbQy+OrT8eK7678LtKPT+4fU+1EpUED65hOQX72v9Z3KJBHjaDoHPJQIxPro
         kZVA==
X-Forwarded-Encrypted: i=1; AJvYcCXVf5aA3XBDfnpESMNwgF64tEa5N0JRdyHcu51/LR8swClew8YX4C8xE4VrI7m/tHm+MSiPbKM4BT7/ukvG9eBa@lists.infradead.org
X-Gm-Message-State: AOJu0Yy72Lo9n6//+eO1AERVtNrLpQM5BgYiT8+L0KKEIrAmux8riZQk
	c4s2r7l8nGEcKDdWVuvoY0qmyGPpMl9W+f4XqMR+vwseIV8g+CLmce8odmdQdW+g/rw=
X-Gm-Gg: ASbGncvwUTlei21x6vlzvBLmUJmkF9K/XR1e4dYC+bcG/+5zF10T8Wi7MGA3XCazRA9
	T8gd9Yjn0NxqyBmY8Wca6QD9aLAjQuM2L/UHD3KylfdF5rhX8NZBm14nCqqFqZRs3NP4TfS2GnH
	uNmJKK7TuFpkB3qhiccQyaQXkRnEF5ce6FcceegbU/16BN2aOv93m8ETceLKueu4+6NNmB757vC
	oJxwQItrxJEPdbDCn2H3reNUEXVus9as6iWsjtiFiSO3KV/CTFqekaFOWBEv1PEVkoIoUdb5i0h
	MnV9mULG5lErmom9ouwBB+1bHIV7zTtWmQ1vJmsg9M/1okZeERDaRa/eT4x94rdxzdR78qyoZiz
	Z7O6eiDMg61JQtCjzjOwJnL7p5MiL2dzlIhUv0ro=
X-Google-Smtp-Source: AGHT+IFR+X0EgGj5F+ZAPuNA44QJat2dgEsfyiD1C0mZqTk+bdaBYGDrDIoBDhP+GQBrz8+tvaUhmA==
X-Received: by 2002:a05:600c:5287:b0:456:2137:5662 with SMTP id 5b1f17b1804b1-45b81f120bamr19089785e9.7.1756545599375;
        Sat, 30 Aug 2025 02:19:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b8525a94bsm21186815e9.15.2025.08.30.02.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 02:19:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, linux-fsd@tesla.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250822121423.228500-6-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
 <20250822121423.228500-6-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/4] arm64: dts: google: gs101: Add default
 GIC address cells
Message-Id: <175654559768.10738.10874618252730969524.b4-ty@linaro.org>
Date: Sat, 30 Aug 2025 11:19:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_022000_989004_F77A9D0A 
X-CRM114-Status: UNSURE (   6.63  )
X-CRM114-Notice: Please train this message.
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


On Fri, 22 Aug 2025 14:14:25 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
> because GIC interrupt controller does not have children.
> 
> 

Applied, thanks!

[2/4] arm64: dts: google: gs101: Add default GIC address cells
      https://git.kernel.org/krzk/linux/c/a75d45adb261cbced86701d2512098044a6d310f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


