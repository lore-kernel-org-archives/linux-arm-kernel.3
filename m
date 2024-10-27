Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1780D1357E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrID1a50St1Ycn5Lts9W6gCZe1RBkf5yJjuRsg44rCk=; b=FzSqfuvJtxuN4ZcC1Oh8fnJGV1
	TYN3XQREXabx6EKONfO+c7WaAJ5fBeflyyEOOfn0FzWtw/HdSVd2ApZd4QinTaM+wEBG3kqVHzLYz
	fEnhPYX5mwmVv34CAJyB6SNWtsJDJkryQ5OuunUyFdBUIdva8hafO1Dv05ENi+iuWrHGD3QK7tuAf
	/Ii9GVRi5+S98rnMFbc1qKPkxF65lmgf5jz4TJJNxU5bYrCi0R2oXDgiFD1W6+bOexG3M8mayf2O2
	jqF0OYt5THfzqegS33nCDmY4/047Z2nQmAcUi3tXaG3Ga6tPRfo8WzneTmADzFeQGM7t6FDYqFCC5
	qqqpnslw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Pb-00000008mJP-17Lr;
	Sun, 27 Oct 2024 19:58:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59MW-00000008m1m-2mR5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 19:55:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43159469053so3858435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730058943; x=1730663743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrID1a50St1Ycn5Lts9W6gCZe1RBkf5yJjuRsg44rCk=;
        b=rDpOrrEYQZnb2JRkNBBmtYQg/4L0T4jRZRPQ/Duh0HHu2yI0MWGNopRoVJ1BwB5wTU
         uSlYJJvV2LExf97l+4GDFohGY/3v4Mkl660mLe+Z+/Ov92euoymijkdbgn29k1e+U96q
         xbBcv5GiEwx/tmD1K9zwxNB1HuAai/jreQEZruq7ZdB6ikIgdQBh4gteEdv8UB4w0GOo
         GvQOGfh7u7qsdd4oZnkPpgw2jUW2+pnbRpaCWcPgSVIhvE4o7gKmXxonOfhetuHvkdQj
         NXWwKEOXV5BWMEwbiQQZCvNljcQb+A4RrwvNdvl5HhamPwjJ8cWRiTjUjmUaUudFMKsA
         hH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730058943; x=1730663743;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrID1a50St1Ycn5Lts9W6gCZe1RBkf5yJjuRsg44rCk=;
        b=k4t/ilp4MKy165P0qxr9feTlSIbmdGkngdmNleJA9t8vgJ/5VP3iJmxH/znw3pRsxD
         LQp1BS9SXByI5n+stcE7HTh3NnI+MG4WdmJZjw6uknp6Yq5TyJCbkpq30q6wFW2zoDaI
         gnoZt4aBWZv7DUKSIyMH/tjf44pHfSxQZ4ATmgV268k/vbOBhUY+QHIGraxYDaCdLNL5
         Jm/xAQYXARSf4NaYCBdV6EJK1o4A4GVoAQEZKigJdrygaigKeCHlrdgbwIhPX0yWLt33
         dhfgdaWw15QOq9Czu5urxQgKpJAPKR59+ZmnWOiHoknJFsPJ+4BozmHf1n892omFHOnx
         89bw==
X-Forwarded-Encrypted: i=1; AJvYcCW4YdBsdApi3n1PuvsH1qb0JUCMjXJIx9qCr9oS8cfkBKD1XaGnLpbiC5scgT4k+74S0jciKdQm0kGUyHIajZjC@lists.infradead.org
X-Gm-Message-State: AOJu0YwwhSvjMoPLaoO+uJf1/osZJcbLlKTQ6DoccOKSZ3CwkdjFyT10
	3nPwpP+E4goKtF6DvIwHE7ThbzGA5vyKCJUIfYEDAe4PPV/JHuncgdl2KZ7se3E=
X-Google-Smtp-Source: AGHT+IHc71/Uo5nrRKd2jkrxoO6lYSPPb4FmrPnFvYMb/0szUHabwFoYr0d8c9FeBg/k25ggkV87cw==
X-Received: by 2002:a05:600c:511b:b0:431:558c:d9e9 with SMTP id 5b1f17b1804b1-4319ad24126mr20600575e9.5.1730058942688;
        Sun, 27 Oct 2024 12:55:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431934be328sm85548215e9.0.2024.10.27.12.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 12:55:41 -0700 (PDT)
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
In-Reply-To: <20241026-exynos9810-v3-7-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-7-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 07/10] soc: samsung: exynos-chipid: Add
 support for Exynos9810 SoC
Message-Id: <173005893911.10219.13567628318408023660.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:55:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_125544_734613_E1F32500 
X-CRM114-Status: UNSURE (   9.25  )
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


On Sat, 26 Oct 2024 23:32:38 +0300, Markuss Broks wrote:
> Exynos 9810 has the product ID of "0xE9810000". Add this ID to
> the IDs together with the name of the SoC.
> 
> 

Applied, thanks!

[07/10] soc: samsung: exynos-chipid: Add support for Exynos9810 SoC
        https://git.kernel.org/krzk/linux/c/fd0b3581666860610ac770d4b582df42e0065c58

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


