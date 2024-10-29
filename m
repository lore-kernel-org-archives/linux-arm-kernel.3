Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30610D2AB1C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4RV5zlTOUYZMKhmx1UYpbwnBm/HWX3vXyjwC0A2b/s=; b=NTTYGCSfRnS8SjI/G00ePNlQ3n
	hh9DG1AxS5O+jVL723SSzMKx1CBl9XqHpr/UnA0DvWP0JRJ74DaS+56t4FuCsDwLHk0DR6RznL+19
	X4wsrGyel/IDCb/fZ6NMnjHCdxtShca3b+ZBOHPrmLQFhwVbRVBxCsw+K70M8VA/ajsCDS/lDtMQf
	mlx24Vkb38s64Co9xs57IGmXdgSaAb3mo8uBwZOr0ngwYY7YeIEenmOCrybN8ku786SgeN0OCJeuZ
	BvTqxdHdtR39bEZunYwjH2E6Bce3Mq5H3SB2HqY7V4qnmP7JHcoZ8x4tYsEXV9+hVHGuraC9ZhZvM
	awfkQrzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jZ1-0000000E3N7-312Y;
	Tue, 29 Oct 2024 10:35:03 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5j6I-0000000Dyhf-2krR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:05:24 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539983beb19so6213404e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730196320; x=1730801120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4RV5zlTOUYZMKhmx1UYpbwnBm/HWX3vXyjwC0A2b/s=;
        b=t7UH5NcP3dMxFsEjM54+Q7jHgAhw6CT+gmtYJyAZ5wjnOzheCThrNwkp54vj4UW7kX
         nK5eRJQSXtyvc/C10JHT7EsdeFZYDL6nCUvMl4XywCY6H/tMicN7Wxq+fuVpEE+76rdk
         vGwoQdGIT5bwMPLYuM/LY7Q/HTaTDi/rFJMLcgrxB4jHqoTpQMkyKYHLbVqpmB8ey6Qb
         hVM3IWUugbUybMrxIhjQ+5hi1SJJm7NIRVbpBLE/muQTZBjjUBGRqSx8NOypf7hAr+rj
         0PPUAHrTepSAfSh89cOMEEx5LTQXX283dGVn33VOn9d6XUqBX8i25NBQZwtmwrUUMVWJ
         GW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196320; x=1730801120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4RV5zlTOUYZMKhmx1UYpbwnBm/HWX3vXyjwC0A2b/s=;
        b=fz4D/3ARLBOLA67QaJsuThhbz3rlaJtRVfsMtjGOqXAo7IeJGLIWXEhuZ8TWuEEzuJ
         +ZQA8AV1NX2mwc+UUReckAB4e4ZWIGEl6dbU+BVOArvB5WspXRr4UpSx9PDKkBMsxUWF
         fRHb2BFmRKRBnNUY/RwqCmqKZCrZ54qUzcFRkUzn6Kr+9qZOfWblZW9JAO0Mncy3FlR5
         ObakufhTiT1BrDH6fAGaAO10QAlkDIq/NtiBZlahWCuqlwkktFyiLWDbgAjPfw+78QLQ
         sab6f5IP6rjaknJeC5NZ857+rIzBl6MHkAPLLmwbYcWkdwzc5j/Ie5qGh+2NHoJKni5W
         +MPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuMKBviMg9/nFvo2ek5dAjb7tg+HrQ7rSrHJ0D93T4pMI4ubAbqu/5n9/ni/Pv5MwJKmLvi/XinOjI1NV4TRrP@lists.infradead.org
X-Gm-Message-State: AOJu0YznmnXm9qxeSXZce0QKG+tWSbZ8g+cVKCTShS8k5MuM2z85z8jZ
	gQPNw0650BuAoGjJ6KppbCL91QmiIhGIgRHT4RbV1IbViJpcmY3P7IgCjItyJOh10SfiWkWRATo
	nONLrRqJMfpqspbGd8hzll9DL5ZF9yQPz6TS4/zZmL9v7zxK1
X-Google-Smtp-Source: AGHT+IHRjlZ5hUDjfU+PhK/6e3oqa7R+fo3XhjKnYIjv7VyxU8Q5LEQEqbHbzMAmS4KxgFa0+3jWkOmL3SAGQgEfxvY=
X-Received: by 2002:a05:6512:3c98:b0:536:54e9:3a63 with SMTP id
 2adb3069b0e04-53b34a19727mr5084956e87.49.1730196320370; Tue, 29 Oct 2024
 03:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241029074901.18977-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241029074901.18977-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 11:05:07 +0100
Message-ID: <CACRpkdZCeQFzqbSN_=jX-_406OyxOoLb3b0R5NX3SjacE5JZSQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: drivers for v6.13
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_030522_722683_445BA8D3 
X-CRM114-Status: UNSURE (   9.66  )
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

On Tue, Oct 29, 2024 at 8:49=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758e=
dc:
>
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tag=
s/samsung-pinctrl-6.13
>
> for you to fetch changes up to 6d2dbd4cec8939ad2b813b8052eb12406db528d7:
>
>   pinctrl: samsung: Add Exynos9810 SoC specific data (2024-10-27 21:02:08=
 +0100)

Pulled into the pinctrl tree for v6.13.

Thanks for sorting out the Exynos drivers, excellent work as always Krzyszt=
of!

Yours,
Linus Walleij

