Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C644CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Czacv4czTyoltt/AnMN+6IUHG+NujxotRkdbKUYJy0Y=; b=d8broyFH/uTP7OT7nfQG6b9H7F
	aQ9kl2E4wcEkrwq5xozSDZjXsdY6E9sx5dJKX4/3QRVVA4WmHUMvgeaC61xEEV9d46HXeyhgBTzB1
	qSsBD0MGm7gPOVuFwXEkgeV4dCz3LpAxjIyzGKQMaNlA9pwYfVBaqFdnOdTWq26u0XslwabKGHXmy
	qXnXSW0RL6hCyKliIsI4rPIZu1VmjsdKrsVZgtfyzhXxJpd8XnmBUcQ+VMU2FyyWq5kMSu5FdML6Z
	Rq+a0rfU08Vu/YxhJ3GiGNloNOzXxCwPgC8JT5Ek6o3eYbY17vYCY/79wLWITjGLQw6DxCSwORQLc
	wTybp/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoM-0000000C6LQ-3J0J;
	Mon, 20 Oct 2025 06:56:06 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjoH-0000000C6HS-32fD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:56:03 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b6a29291cebso8809366b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 23:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760943359; x=1761548159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Czacv4czTyoltt/AnMN+6IUHG+NujxotRkdbKUYJy0Y=;
        b=Q/G/hNzQ/Q45+4ys5h6r3PsUcOYwdQ0UJSAzjCOCAfYODTg0J7kRsVD16Qr0h6tdom
         IQfV6EH3NTGiWuF54SFBRXEd2GcSOe+E88YGmmcmlM4j+3H/aeZoPcmKQbyjAQK/5k+G
         xvVYHdWCoqaKvc0JGcYFSlEKtf0F8W51JNy0thovgiKVUXRuclJ04d8dwUZBdhIkihIk
         VjN+toorfjgToQKjet87W6DcyywROhdaIZQtIohQYZOzSqMdtzkjj+LbTjMZYZVBtxyR
         Dgj+/0ji5U8rC2A8Kt9ZS89PSUHn2BGsgjYWdoIiDgQoRviLdte8NDff5wu9cjt26yrH
         b25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760943359; x=1761548159;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Czacv4czTyoltt/AnMN+6IUHG+NujxotRkdbKUYJy0Y=;
        b=h4jZrdt/Ue+FBcYgZIoXnFE4vsk5lzAN3bFK6RI5z7LntkzA5O4SLyYYJEwQd6bND3
         LL6jK5nKdbOcQbeI+IO0pwEFxfd/IJJil6d6qP5q8kbUHygl0vuDbNomzaZj3SIFD1Rn
         +A0MU/JMaBbryG3ptFDv9I8O9qA3Xy84lyG+kQqWAFud/D9o/uUwGVwjWNV2GxNHsMBc
         ZpeLIKQGTcyvcQwxQvZGfj3wCdgGk2/odiTQDrYZiBHYxgFAL/I2EPtEEEy4P5rmcDQq
         47PflT0bpIOiMRDNuB/X+zK6QdD1yVeFmZCSr0ieSox+jrfY5erCHnEyWA6Rahv5D9eW
         owjw==
X-Forwarded-Encrypted: i=1; AJvYcCXtSpl7tn4pD36C/yWBDztNAgxJyUgFth/bviF/lRI9ntBSDUvq3QETVZI/gtEBL3wPYsredyaeG+K8BUjJJ7af@lists.infradead.org
X-Gm-Message-State: AOJu0YzwpJH8DQF2afCcTYX66dIGxk3pDhbUvygVgSzRNdm9hcOxIXzx
	e16e4RInP+vZ3Kf3ZuFgjZWlb99K13pkR3P9DeB8IZWxy7o3tYR17fRBDbR2+zVRFLebCe0m0mf
	aK8Rz
X-Gm-Gg: ASbGncvux0ds6kdhBGueMeA0x1j2xdQ+49PBjwvDE9JsBf6i3QlhfQCOUkwoGIKKQBk
	tj9xZjMOQYUv2EGhxJLVKpA5ELkF/LTFbOxbZMxUn6eQofGpWu59DL0yDx1MSZCFhY4FV6NlMvK
	NQdiRhe9Af5WFGVFfIjqF7Yjj9ldCYQJPFnkqoEaNCHvYohwmytq3fO1AP0xjc1ancQdCxHKjJ6
	LNL0PYXUEWdlLstwKDbnF9x0qyOi6QwHipvsDYElwgzwg815DG1plkVOKdh4OqnmMSRuT6+XESw
	6jIq6zQwyAZotJ6J8whE5RZI03vNYIeLmakvmzofZtZ2ySP4s2p7/Yfjvq4S38qcNTgPjGF3z5c
	yW2vy9ZV3ORh5hu1W3DIXlOh9QLVnCrL/H6SXFpoUq1ejuDbT64F3ybdS3vOPlc0fetHh+0dO98
	AZSl7wtg5rgpCcejT1UkgUO00y59A=
X-Google-Smtp-Source: AGHT+IElilp8owkCzZnU/XdgVG40znc7ITwT4r+CN9LxeRdB7kJwCrsiR6HU18MteHFSt74cs5hlHw==
X-Received: by 2002:a17:906:9c83:b0:b3e:c7d5:4cb9 with SMTP id a640c23a62f3a-b647395aab0mr764832166b.5.1760943359427;
        Sun, 19 Oct 2025 23:55:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036a3esm711731466b.46.2025.10.19.23.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:55:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org>
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-5-321ee8826fd4@linaro.org>
Subject: Re: (subset) [PATCH v6 5/6] arm64: defconfig: enable Exynos ACPM
 clocks
Message-Id: <176094335744.18498.3151941406927244021.b4-ty@linaro.org>
Date: Mon, 20 Oct 2025 08:55:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_235601_801349_7B7221EE 
X-CRM114-Status: UNSURE (   8.55  )
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


On Fri, 10 Oct 2025 12:46:35 +0000, Tudor Ambarus wrote:
> Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
> implement ACPM to provide support for clock configuration, PMIC
> and temperature sensors.
> 
> 

Applied, thanks!

[5/6] arm64: defconfig: enable Exynos ACPM clocks
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


