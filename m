Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD84AC9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=; b=wznokK+V+6AJHIfaqVDkD5SH5X
	4vteObbaSCC+Q9l/ZE2Bk3zIa83fr12kM9FRBFMBV5CIxR2yS/YAtV67TFOiyuswpr/SjQjci8L4V
	NHGeivaJsp58+HhjElb6Wx0FZN9fCC9CiyY0ZpmhtzaMUQMGF5m1uVjkEscVR5PeYpg6Dv0tdY/qy
	z87cVYFLt+bwvC2wDQnL2qXQEwfFZoApxkaC77gYVe4zkb0dek3MX47M1OEpGQ9dGEkUqqCrw4Erz
	95S19JPUVSTRGtFGOMA3d6qfNBQZ9DZtszESLy0F843q7ZTjp6f6wnKKEPPCggf4gM+MDu7e0O6HT
	wNAuEsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIor-00000005WNK-0Kw7;
	Mon, 12 Jan 2026 14:22:57 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIoo-00000005WMt-1W6Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:22:55 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-5eef115c781so1572216137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227772; x=1768832572; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=;
        b=x5hPGwz2OskdB7ZNc2bRvE8Y9rVU1EZtd+qk+cTts1A0pAgniD+NT+wo3G2Urkb5ho
         Bk+dngUyM5MP0PJZPUmPME/lKWgvzCFB11Vs0YIt94t67lV6IAMwCJ6FxbFbHbr9JT47
         /DGRpk2jjRPEv5Y/0cXfYz4YqgdiX6W0gghgVBH1jYfsK48PY00N879UR9GgNZlK3QlV
         TVAbacPuU89NHOFvbDsxa/79/DYaNOPtDDcz+UZYM2y0pWSa8fGJWvUnvjO0SYJC+gYi
         pQqF0T2THYq4/AkHHj2vPwBkgm5no6mI7e3APx1pFwtuVzkhsCXJ846VW/S22byLqSrj
         HuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227772; x=1768832572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/R2fMo2K7fslFxoihMBkpzJzSmjn8g0vMl/pHIiNkKQ=;
        b=NUwIvDcf2PHYp3y8DXTS2LkO9vNytDNAZpGVRzgdNakbIp9RwNFPsbhMYLmS6Wl6S/
         hWTi+q1IxWLEJXqy7lI35wvtn/k3Uu5UnG8YkSGmObdy06i8Bfaw+mEFrVdQCFMI2OKQ
         bKvuwpiJIWRi0ZNtTRU4TFmvK//0U5h3Vr/yru99yzCayUlUCPRzE28t/9Gs79qAVctS
         aC8/q4tifmJk1MckAzHuvP+Sg6Z4y9ZU9tUFyRcikUG5dFkuW6RjrB6DTizm9wP7w3e4
         UMNa05ZTgM3fQn0eYCz3WmB6yEzl6ouzKa1jQ1/DN4eiXxE7YN6NS7QtN7/msKIgiGGW
         QVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqXMzF4V6+POaD4iEUIzyHLeBzjU9s1QCvbeW0YHdAzMy9rky8xAtwRX3q12DPtR5daUX0hbiSUhGuAAO+FOiU@lists.infradead.org
X-Gm-Message-State: AOJu0YxkLKPBHQK2vfbcIhDgivQsc5ZAzqGHRzLvvb+472LnYQu8Aogy
	KIyQBMpDZ/294FhgVKKtc7kcaLRPuRal0FYpCmY9kZWziiCHBzKfpJW5oW33gqv08h18vUhKWa2
	XXuyCBoPQwovAqdfUwPbxjsuXsVP3PRutoTptVyW23Q==
X-Gm-Gg: AY/fxX5q7153xuJojwVnvaK0OQpWnayFa2zUQ3L0ltsNWvd8BrHuokBpq0//6dRnR7s
	ABrz5vQQ4/io7pOj7UoC6MfjxCe10y7bGrWiDZT0ApDbxtVVmstY5yqyTuvDccNHz8f624R6+CV
	LM1XeiafNscNMANwVgsBo6AVbbWplyrgJLisVlpGQ4WhisGZsdmR55rUQgpoB2CitL9qFCJNP04
	sUUsuVqOrylN11kLHAVYU1JpYem3draUlVdJtUSCI7hjVCNUsS6iW7aYTJtCkMWwfYpY3XH/Ke0
	2vDblTEiwFik7tej4Wm0eeQpxAGe/Q==
X-Google-Smtp-Source: AGHT+IFa3uP73sKTwXvKWrh65KpYYLhONepO2yhtiz6R2pvhmfRlUTjI4ifsl0y8t5/reFgRMiV/Pdv5o+0tykFNm7Y=
X-Received: by 2002:a67:e704:0:b0:5ea:62ee:1b5b with SMTP id
 ada2fe7eead31-5ecb1e924a9mr6520896137.10.1768227770485; Mon, 12 Jan 2026
 06:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
 <20260109-clk-samsung-autoclk-updates-v1-1-2394dcf242a9@linaro.org>
In-Reply-To: <20260109-clk-samsung-autoclk-updates-v1-1-2394dcf242a9@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:22:36 +0000
X-Gm-Features: AZwV_QhvEXr6GUxPXZ8zhrOsq2grsq3qSCluicx7SScTHv37UQRTS1YD7I721QA
Message-ID: <CADrjBPq5R25QDzqzeJ274DTCpAPfjBFQ=c1szVzYj7rBOC=y7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: samsung: avoid warning message on legacy Exynos
 (auto clock gating)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_062254_428257_66F3E373 
X-CRM114-Status: UNSURE (   9.93  )
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

On Fri, 9 Jan 2026 at 17:27, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> We currently print a warning message that the IO memory size is not
> compatible with automatic clock gating for many Exynos-based boards,
> including legacy ones, even if not requested to enable automatic clock
> gating in the first place.
>
> Change the test in question to avoid that warning.
>
> Fixes: 298fac4f4b96 ("clk: samsung: Implement automatic clock gating mode=
 for CMUs")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@=
samsung.com/
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

