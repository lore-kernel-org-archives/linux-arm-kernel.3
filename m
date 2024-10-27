Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE79D13582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HZ8JFZi2Qkm6YYcM8grPf+xKDycxiruU8bzTj89xR0=; b=QV6b5/VwfTjSHVHc2Lpc6iFZr6
	rltrVQe/X54OpvxeFiEN2iLDKykSAzSprqmo1XXowVFCs9GbZPRpYfVZ67epXXPUjoE7G9mOrvVhd
	VJ+MEt3baAgz0PF8fLc/zHAID4rkw5gEHNGphb07MtoNiKSNyg9elkbaF/DuV00PFsyvLQgrHVtRQ
	/LQHqRQ5Pxs+rRpUuT7I5zSTGiWJJP/6wciru7tv2i6sGq9ElN9VIMXQADVm044bI5rm4TUX3E4je
	NyMhDfmC+0gCr2C80a//dxvlBbmko132u+njd++6brEHUqxNRTW96EEUxEWZgHq73hG08sSEBKYHK
	LzPTxEkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59ae-00000008o1w-1JJ2;
	Sun, 27 Oct 2024 20:10:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59TK-00000008n8j-2l9p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:02:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d4fa7d3baso398530f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 13:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059365; x=1730664165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HZ8JFZi2Qkm6YYcM8grPf+xKDycxiruU8bzTj89xR0=;
        b=Ed65HrlC6Azl4B9ObfHnaHJQzw7bllBfy8oMiJ0c7LVKpfoqrb8xKfPrlvROqEPTaO
         0S6rAz6w0lBy/x7tzjEf4+i51AUjDzSIuYND8fAcHVYz/wjpKJMKnfgaQHsKxxr+4Bkg
         V0wACTMTuFikXO4TyyzTZXsqr8efNsrLuKK0RQjmmROtR4lcR0X4F/AxPU9guC77EN+z
         EODoqVWPdYJxzm5Ti1/gNAtHqbpEJ2f1QdipIi9NCB5NXI54fGgT5z2tapgwVMT/3RA/
         iJuLMV1MictRmq04olHrHRm/oDuISWg27A8aU71vINkjMqcujjaeyoltPjrZhhslzG47
         5nyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059365; x=1730664165;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HZ8JFZi2Qkm6YYcM8grPf+xKDycxiruU8bzTj89xR0=;
        b=K7F9j8rP1VnvBI0UZgbl4GYQfWSPZXM0lo+OTJR8q2JFQZmQjvksx5+dHA12WBh2zU
         98aCx4AoRVFUSXKYyjiFeW8M/9ARj4jRrV0mD0jgGrEHsAA+UCl0pDXqK4WpFekHoT5U
         EQJe0f9plXy0ITpg/0cCsQ271SgMxrYzfkVYcUiUUOYqIelHW2DTo42MpWH62Zff6ZVv
         GBA4JetliJC0FSSeJbFLeWpgSHjEk3cbRAc6FHiheHcDFnyqjWQ7If+lx/IHUp5RwZn+
         vIJxbKo6lro0jGIRzs4UPmmEKcKI93YLpcj0+c3+qP8+dsjQZrBWcMORAgdkVUoOacVI
         o0ag==
X-Forwarded-Encrypted: i=1; AJvYcCXAa85a0CXPYyn+5t9TUjT8UB6wmP+T0byHko5XBN4jic3epK7qlfHNpoeIwSWenngEthB7oKnFSGcih4vZlTwZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl8w/2pfeaHK3OLRQw5X5wT2y926fzCpv6YCkaSs0q4ZEhB24y
	WWCiaqvhlPfrOuRMw2DCBAShvfNgjqaJaTvwG6K8furwSNTktu0nUsGTGL4flCA=
X-Google-Smtp-Source: AGHT+IFgnBiCHLNXbHaeTelv/smyfonWFdeYQPVBe7DCFjNAD+D14LCW/y5lKgfEzzsZaSmBZVCK6w==
X-Received: by 2002:a5d:6d82:0:b0:375:bb30:6525 with SMTP id ffacd0b85a97d-380610f07a3mr2058258f8f.1.1730059364812;
        Sun, 27 Oct 2024 13:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70d50sm7526833f8f.76.2024.10.27.13.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:02:44 -0700 (PDT)
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
In-Reply-To: <20241026-exynos9810-v3-4-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-4-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add
 compatible for exynos9810-wakeup-eint
Message-Id: <173005936184.12757.5255123384293459280.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 21:02:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_130246_734147_632CD586 
X-CRM114-Status: UNSURE (   9.31  )
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


On Sat, 26 Oct 2024 23:32:35 +0300, Markuss Broks wrote:
> Add the compatible for Samsung Exynos9810 pinctrl eint block
> to the schema. It is compatible with Exynos850 EINT controller,
> and doesn't have a dedicated IRQ line.
> 
> 

Applied, thanks!

[04/10] dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-eint
        https://git.kernel.org/pinctrl/samsung/c/e830431e0ad0501c2e6dcb3c65dabc053e3ce5e4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


