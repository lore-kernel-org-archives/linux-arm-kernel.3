Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8587C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=; b=qN1JRg3KbrFi/ZXct09p89R/Ft
	KchAK2f25uH86ZHhZbiMs2ShnamaXrK2D9B8T+BMKTLwRXRuLhUpPapzj5xQESGiMX2ZFYD0UE6/x
	J5aZfiMoirGVz0ThJHM4QDrNw+8JSX9yHxEUNXDQ+77VWxPsM+UkLm+Z6qZhs2tciC/BySpjvUdqf
	eOQBp5Jahi0fwy/VD4ezKo8mK2Izopq2WiDIQwOGCoTcyWFARRfcl/1XvNkRnVPg0tudky3p7fTc+
	RlLrfN50ABr2sL+nAvqqwdNwVZFjf5D+BsHn4QX+7vUYsrEDFsYxRvPKawX2xvPVOvRUdLZupgX+m
	SZ7oexNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBVA-00000006uSU-3Lfm;
	Tue, 24 Jun 2025 21:48:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9WS-00000006d7u-3U0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:41:37 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-32adebb15c5so42782241fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794095; x=1751398895; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=NdYRmjCrDyDAQC8IQ2LfOba5Mf51RQ0dWEAPsczrP+CF0xD7b7+pRc/HPwhQSKJN4L
         7MM9fJzKvwYjj/JdzBcYYAZYvw36CEpRQ9VGA+y/fGKbuUHkAKypKgRcjK4Q4XkLELN6
         6+oUqQXE9BuqseIVVJOJ7kGahwAc6rA9PBUg7A+FJsHqP/+j/pCrHUbgnvGQMea7aUKm
         fvhVgqRFEDqfHzsrgTmSjV1oXPGvjmt7pVfZwTqQkiBnChdTA+OOZ4xWeHJaWhghJkPV
         wixRo68J4F0mDWoRS36LikjUtRszYzAIGPT/V6KQbdOfMZ1RNiD9MD8nBEwZhofS9+KU
         2Jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794095; x=1751398895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nLhiuszQCMDLT7NsBho1d/3PYZ4meNwMxat0ECG8J0=;
        b=HiUIEjR/2xllfx2OvkQP1qOsb0b6JxRXv8XtgEVAugG7CkbDmBnAJioW48KRvMBqn6
         XGi5g0Uw/G9HML5v0zeEK+2DahdcF7VLSsKXlhblrVcNHV+RHTm3tY8YTk8D/WZ7qNjj
         F0WQsduJoMD37lslOfE0xk7beaGaYHqKIIah1KVMUjKBAal+78j2dvggtTfQE2DY6dAC
         4DoeXLyTGMQ4mmkNxq6XBmlUF8XxP7DoAyolAyn65yqHA9On7UFCT2lvyE8kzaELP64S
         I789fpgZznTGe97O6A1lplc/FzeHtvx+vG+bM1Ow24EN3UGNXDF8f32uq6x+I1NBtb/b
         gsHg==
X-Forwarded-Encrypted: i=1; AJvYcCUS08A70vBlvvAdQzxxbMbQMlAi0dRbkRF4K5NzYx64kl/a2N0gJsMmhek5t5JA2hNyNoUxiWHjY1/lQoqXuW5R@lists.infradead.org
X-Gm-Message-State: AOJu0YwrmPqDPRaWF/W7mWiRvHxdAoi83v0zwIZF/FPL/7KiBTJf6pmQ
	3LSYOapbLex8lP8uaOwjG63g5cAWN2SUa8N8GJ0FLd7Z5A/7BmftzIO6SCwkslLkcHn/7j97vlY
	UORsyeUa9cLlvmyoouUHMhFtLJIvXR4lJiZgpuYhitQ==
X-Gm-Gg: ASbGncv0u4v8uYs077qrIb7Gr+ynCIzCc5PuYwVvtQoX62oanH86suNOb9mFzmDoeoe
	oxQEmBSggsOYvbRG21yxuypd/Wjg5fR7xiVM4Q3aCo9Kfu3uM4WNGf6lNRyS8uV3sl6lXu6SP0c
	8KZ/mmc6dqfx0iAXJFcLhDskLFlZuthdYefAUegO/KhZQ=
X-Google-Smtp-Source: AGHT+IGgAuc3iJtRYb+OK2rDM3TlkSrDgGEbgeVIFtkTDVdAbZ8WB/KP/SQ/rIDTOfAZi97Vwex02jPn22o+QO9h4sI=
X-Received: by 2002:a2e:a4b6:0:b0:32b:8778:6f06 with SMTP id
 38308e7fff4ca-32cc64fe7edmr63161fa.18.1750794094847; Tue, 24 Jun 2025
 12:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-1-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:41:23 +0200
X-Gm-Features: AX0GCFu-CBprmbPmDb8uoIG_yV6pNxQGi2vFucZMy5qL34U2BG3ecQIKj4_p--o
Message-ID: <CACRpkdbG9WSuErEvcNGnt6bSqMVk31PuLGykaLw8XToVFnAc-Q@mail.gmail.com>
Subject: Re: [PATCH RFT 1/6] gpio: mmio: drop the big-endian platform device variant
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_124136_868605_42B9CDCE 
X-CRM114-Status: UNSURE (   9.63  )
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

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There are no more users of the "basic-mmio-gpio-be" platform device ID
> in the kernel. We can safely drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

