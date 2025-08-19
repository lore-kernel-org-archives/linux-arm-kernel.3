Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190E2CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mI+27DCsZb1xNev2FOWjFwDPtlqZqOZA1lWdJsmrtJA=; b=3UIpclrp6Jpe1W8TiTBCH7Vm6z
	JBAeaBTX5cxFZfCMv4hC8heZSlnLl4ycC9MvemGzzuxJtw57v8i6hC2KdxuYXrCc4GFDUjvrTEmMO
	rmkZqKD9VPNpsEqX6mUEm5aEMWQAALy0IuoJFmGPaLrQGSSENG7c5c6O/m4ycqT0j81VmoZdeTMwc
	ums9LHgsQ2sgnZl962AHDwT1Kn+VBtCGNIs5PAx1HOgu7qaoBOeBkwMAO23kFt8jm+gzvOJdVlQ0P
	AL4CpPvAF5Hc107f7LYuaOLPHLw8NYPCds7+RW/iemMgu5BQdCvBnTUg8Zs7vYbwzGKH6E+q0E5sU
	z0kxKmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLAh-0000000AO7g-3kR0;
	Tue, 19 Aug 2025 12:10:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJPX-0000000A6Zm-06bd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:17:48 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55ce5277b8eso5288329e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755598665; x=1756203465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI+27DCsZb1xNev2FOWjFwDPtlqZqOZA1lWdJsmrtJA=;
        b=Iw2qKKYkzasIHXt9ZxX5SHvukMLHaCT3cJkbjysMLaphKo0qT/mqoKAule5fwMaRRM
         Am3Lyedm4EgmZRgj2dwhl1rfisUQ7WFwqeiqjaQqVUR7GW4vkPP6SrLlzOLo+xWKLkYQ
         V6uQOXxwJbm5q4m+3J3jPyTrL25jgOe9WwrLGaWjOyzXVtLybJ39TMsKrZ1Iq4GxLW5q
         64CKnvhFKjgGbS0k9Wlc/H8pKxJAHj42HYrYZJxyQWpbQ+oCXR+tBsSOYDbyszQA2Hcc
         nO/4poCjOB1as8JHFo/pxQreJEJn4i33CsYScGHFFdw9VLPzxwstYgKbs50NLHChztCW
         3QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755598665; x=1756203465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mI+27DCsZb1xNev2FOWjFwDPtlqZqOZA1lWdJsmrtJA=;
        b=pEj62rc5JmKgTVcSGkiqJFGlB3fvtJtNUk5UT3VDgz3pbW2dHhK1UXTL+59SyFUrM9
         qBT28PVwXunJ68XXeoHQkJinTDMXM1Y6b+iOEJ9cEDZLqXxcSXNXdiEE6/Twh71nPpFy
         bbV6XvaWSrkU5645ULcSJ/m3MtstGxG0UHkIOWdGUiZcuEa9gCJduhTYVXDVjen/eIPu
         b6ZD0hHRsRSHtxS/qvCNU7CJid7MkkqhY0AeqpFOPybymovmb2ExKTopbKb/tl+Chd7b
         i3tMcMPvDw52IbVY1yTPjIea6ukDV7CpF+ss/rudsiLVc4/LA0Bla8PWYaR84dRAaRM6
         cYEA==
X-Forwarded-Encrypted: i=1; AJvYcCWcl1SbCf3r+ZxYsM5kZT2rZG4UNrh9B0sb8hq4/sA6Bjnr7920oVot09zVG0tTKY5mvb/tATonRJbj2smFLQIK@lists.infradead.org
X-Gm-Message-State: AOJu0YykllOpb9n9YpNZc0tkaW8Kc3shLAgfKCxLB/JM0rgCpEostmiY
	le/fxmQpOtJiHR3efrJqEK5NozcaJl2grQC65V9KqmjAarr2jJmxG31OwGpZhQVnjz3UKQoFVU5
	SjV47iERcsD+CNuIUBwifrZ5MtAFUjBX99i0v7qwX/g==
X-Gm-Gg: ASbGncuGtvGhtQl2gY0ro99ZOtjdAt1WaEzlD8HF2SKH8rzUTQrYprMS5lajR3aXtmW
	HYwG+5ulHQMHkpUXAeu8h9Kt2ua9gD1+Lw2iyoCsWppY7faRRcp6TZNsgfWgYIQB83+M7XJIvm+
	SGyBTBRzUy4PKueSviHH8WAXv+TjahNjr1qYKYdHCmaZoG6MbNPpLbKiWBUACQ3DOUaJP+t1r/g
	fMLGN6wcm0h
X-Google-Smtp-Source: AGHT+IHiB13v6ofDRBfj238q6m/OnZ2UwycLVlIeVJlojO24mSwpVb7ABxP+Y2+pth6WAptkaxKZGGCv9O4q9eeKwRE=
X-Received: by 2002:a05:6512:6286:b0:55b:8a28:3cbc with SMTP id
 2adb3069b0e04-55e00869ba0mr639574e87.51.1755598665286; Tue, 19 Aug 2025
 03:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org> <20250812-gpio-mmio-gpio-conv-v1-1-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-1-9f43e95dea98@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 12:17:33 +0200
X-Gm-Features: Ac12FXzXb3piolgH_vHThrJa6suApvy9Xnpd7N8-_ULnt_2vbNUV0h72uiLUeAM
Message-ID: <CACRpkdat+HR6DC0xC-XzQ1V08QA6zqcp-PGPFfMoCWo5Y+efug@mail.gmail.com>
Subject: Re: [PATCH 01/14] gpio: generic: provide to_gpio_generic_chip()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_031747_059976_6A7BFB1A 
X-CRM114-Status: UNSURE (   8.61  )
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

On Tue, Aug 12, 2025 at 11:52=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Provide a helper allowing to convert a struct gpio_chip address to the
> struct gpio_generic_chip that wraps it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

