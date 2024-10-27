Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165BAD13582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mobaSIAoCTzFS8IdkU952cZj7+uyOxNJc709mhx9JSw=; b=V7HFfWNmT6wOVGjgA3bkGlxxED
	VzPUCegcFJpJFkfli7kdmJztwubCA6GltvbxT/aXPCg/lOYXo9XblFfRAUPiz+n5VAL62CE6e5pHs
	mARRjkF6iF7D531Z2Wueo3lBxmA4NknwDwOfyEL4K4JDs3KwvSry251sw4s43qxFb7yn1ujbKUxTW
	eNBg6iQeinR10UrN0xHj1YTppoLaFXpxcKrZ4BiqNCmvDYwQ1Ozc0tHQvuu+iA+WWBP9DAZ8XGWD6
	RA682Jn6RIG3diwjleaW0UrioZDfjHgBXx0HU4wsCekvOhf5onLUPPunZsoHAErfM/YfNfDwKquVU
	K/FLoVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59XV-00000008njJ-1oHu;
	Sun, 27 Oct 2024 20:07:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Ql-00000008mUO-3E4C
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:00:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4314e64eba4so2904445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059206; x=1730664006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mobaSIAoCTzFS8IdkU952cZj7+uyOxNJc709mhx9JSw=;
        b=tazOWx2IoUmr238/r/JyI6tx/DFGk/f/7lz1vJ5Sw8CGzoUyBT6vw277WwVNZfGM8Z
         HmqaFWXucpBc99bTIgjrpaqlq0MNNDrqZ3cgn8O59HQqHnP48osIge/LVhFX8ARZmlY7
         bgEeAzjdNXryd52luDTRXMJbtupSmsz3ZkRYX/BR6U0C6IKFIu2xf7zaLjlMm7tWMqoX
         gHOycq16bjcNXLXgFaU0vtvofgl093TmNUsURJJIbvG8QmuOm8pwE1A6w5tZRdmja79d
         mi8vKTanYeWkjIU5HQwcqXKzEG3+Zz02urVVqBIfj6rSDDNa/nm5/PxRgNlXbVhi6woV
         P7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059206; x=1730664006;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mobaSIAoCTzFS8IdkU952cZj7+uyOxNJc709mhx9JSw=;
        b=CcDPtExmlwz1IcHw+9/1CFQgChtwuBkk/6jxTzYmBoW/SQ/M7blaL325Pre2osxgGS
         oOyIkuuW/3H+KKw8ZbDQHrHE/f+o9/SP10+2n5LwAN3IH/eINspcfFte6r8naTakhXrJ
         gMFI5eFNCCazAnrQ2OoSb0xnJnWOS5r2h1Zh6Qva2PKB4ZjMOddNrMNbXrC27caD/P0P
         RzZUS5ELNI02WLxsvo+ldSFcVZWY0Z/UaZGrmx/pONGTktFROuyIlqoykKD+tPzhXKXj
         9q20YlcaOkHgU6ZxG4udi/FvMEVsHMADClUTBs0Gz5OLWxalQNeWpxyzG1MjD8B/XMAE
         i+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW/M6DD7lxnye5VCyOe9I154dT8aQtXA7W1zua2s/lPgeS3fq315WHKmC2rOtDxkuIkhLMog5GrgL0mB0j6NET@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/uynV7oCl9hGqtKG8jzQKSbacZ9E2IfgUEU723iGu8zf4cr6m
	gjWRXw8xWn15Y3lSbixb8uC2AdfePMNmSloQXcDZEL+uFJXc8VpUn38636mnIeA=
X-Google-Smtp-Source: AGHT+IEPzymzHIjiOc4zVdkC5xXbX8anEIX0QF8UPHvqXkly7pCIAWv4SBr/ppPEUQlnckjyhxDKQg==
X-Received: by 2002:a05:600c:4455:b0:431:40ca:ce51 with SMTP id 5b1f17b1804b1-4319ad280e9mr20127915e9.5.1730059205991;
        Sun, 27 Oct 2024 13:00:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.13.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:00:04 -0700 (PDT)
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
In-Reply-To: <20241026-exynos9810-v3-9-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-9-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 09/10] arm64: dts: exynos: Add Exynos9810
 SoC support
Message-Id: <173005920218.11546.3963593817214010231.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 21:00:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_130007_959398_4D8520CC 
X-CRM114-Status: GOOD (  10.25  )
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


On Sat, 26 Oct 2024 23:32:40 +0300, Markuss Broks wrote:
> Exynos 9810 is an ARMv8 mobile SoC found in various Samsung devices,
> such as Samsung Galaxy S9 (starlte), S9 Plus (star2lte),
> Note 9 (crownlte) and perhaps others.
> 
> Add minimal support for this SoC, including basic stuff like:
> - PSCI for bringing up secondary cores
> - ARMv8 generic timer
> - GPIO and pinctrl.
> 
> [...]

Applied, thanks!

[09/10] arm64: dts: exynos: Add Exynos9810 SoC support
        https://git.kernel.org/krzk/linux/c/6c1fe47df5a79f1efc2d5c73e506c8d34692527a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


