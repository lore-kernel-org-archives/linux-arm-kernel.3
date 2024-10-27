Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18DDD13582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Csvf9O0MpQSu0xWQHq784TkIJuAT1HW0rk5HORaFsHs=; b=RkpiJYBerI50NxnBf/xOCzhINX
	9i3rYibQhEWrIoxSIIjGzPItCed24y8VIB+Xtwjg0jHloDNi/Ix9f+bBElAXpR1QVklEJGjMvlR40
	Al5sap9Zfb3N7x16vvfGLh3XirbQGlOjuvD4rENQ0SO5xWB3FOi56HQ+I9Sj+J8oxk5qhebrmCc8A
	gp9A3Y/7MbKyxWOHHYbhm0Iavn7Skx9x4wMul8fe0PTkTVaEUmHhTD39ALwpqqRNLwOzbVP9j39A5
	gM3mFxd2BCVNDowkHfJr7KveT6D4IWMvud26l3TFTuCuDemRgt06L8uWEuMyyH2SNvYmGs+KnB/uU
	eqCw9J9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59cD-00000008oEf-2bor;
	Sun, 27 Oct 2024 20:11:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59TN-00000008n9B-2tmk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:02:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43159469053so3866055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 13:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059368; x=1730664168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Csvf9O0MpQSu0xWQHq784TkIJuAT1HW0rk5HORaFsHs=;
        b=Z6IZe1CD5BCkyaoIvbYnhBSraqR9pJIhGme59opEi4R2XKOYlS7kq4BmaDq8xkUzgL
         Rx+QW6ToItxMMxGyt/03zW9q8X/f9J3dO41JRk4EDr8mlNAr2xpklAEO8d4dAC7avWBj
         GzBV/nu0+MGqXMEOah1DfnDJt1v0wtDP32ehIjaZw9LE7XEnl4b2HLle65ETfGoZxZ6u
         6gyHuktgXxsELbU2jbH3RBpRh1XRbCue348I9c3/NIP1YcCqyxH7Hw1huHGD3miOa5US
         Ah00g92XoN+fU5NC2GOUh8sXBRLzOm1hysEQmgSNtoJwTmyMJFml2ANyc6wDeqC8Ar75
         AdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059368; x=1730664168;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Csvf9O0MpQSu0xWQHq784TkIJuAT1HW0rk5HORaFsHs=;
        b=jX2aZ4opqw5ESGTz1BjYNtTU7zdGQnikEZ5aEtdzYbXEYpUj2GJSsQ/OMiL04g2Exm
         7hhT6cZ3ADMkIQy63OhRfvEQc8aB/Add+kY0Wuq+UeCDzd+/SmRjWHk5S51zz0qR0dpy
         Aurn4M4alY2dHMIWaha/L/kSyW7Bi93dwdxTZ2nDP0BHoavtPvl4dTdasohjTo3Hkj8r
         KuYVlrtzjK1o0u3rbBgOXqhpaFYtlFOXJSUNHnoJ4sGMUUgfv+iJ5uZ3LZIiVHdhVbGh
         zBgKjvuEO2AhTGLLl9JD6ZlxsbXwoN8tVm64V/EH7pR4CcEK4JBUI1KaypLU63yyA+8x
         yUlw==
X-Forwarded-Encrypted: i=1; AJvYcCXOAuhte/zk83Z8XlNSYtH/kr54b1SXoCuZLcjSVple9JBoh3xSxZYEJBCxRzmLRSfNFybFoMNgz8X9cGfOI83S@lists.infradead.org
X-Gm-Message-State: AOJu0Ywumv61WlNf6YjftmG6AITWRUwqRaTveOPQlJA2vTtjbR45NMRK
	MBT2hUw/Hj/9rTNoDU0kOk2G3lYsMWRQvlafVR+dWo60S/5EKjzDQ9egJ7jEre0=
X-Google-Smtp-Source: AGHT+IEoeV+0hduSOZ3GDqRLImZT1Snj/R5T8mVeRbeOUEllrJtpvHsIEDIvx3ThNhrHN69b2ydTMA==
X-Received: by 2002:a05:600c:3b13:b0:431:55f3:d34b with SMTP id 5b1f17b1804b1-4319aca248dmr20598455e9.3.1730059367800;
        Sun, 27 Oct 2024 13:02:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70d50sm7526833f8f.76.2024.10.27.13.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:02:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-8-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-8-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 08/10] pinctrl: samsung: Add Exynos9810 SoC
 specific data
Message-Id: <173005936499.12757.14415579231294539195.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 21:02:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_130249_768589_DD5FE8DC 
X-CRM114-Status: UNSURE (   8.25  )
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


On Sat, 26 Oct 2024 23:32:39 +0300, Markuss Broks wrote:
> Add Samsung Exynos9810 SoC specific data to enable pinctrl
> support for platforms based on Exynos9810.
> 
> 

Applied, thanks!

[08/10] pinctrl: samsung: Add Exynos9810 SoC specific data
        https://git.kernel.org/pinctrl/samsung/c/6d2dbd4cec8939ad2b813b8052eb12406db528d7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


