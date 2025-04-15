Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F87C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=; b=WMgbnzW2z7LUpy4e1jnnamFdfP
	UitIphVABom/IzqieXchOvI4JlvbtGdzWmq6tGHQM2dhs7xX4IpxPEApZ+BI6rY+uOrnNrNegayRh
	ucd7JOkMUnnwfbnmwQGz0V5pw/vwlwfzt2b76jnJpnb7jLAXkRT8OhR93sJRVFzEiW43yG1fr19vR
	Fq/iDjgiSf4mctIhbmWVxRTgGozeHW4Vywe9HIXmqlmGZnHS2TLZnC/MPA9PMVF+KdlRIFHfw+/iR
	Mqvnw0fQyMWSVYB2WGE8sckzIBfSoKaCF6zdmkitqcNAgWZcEBMY4HjjKYI2+DGjob7QHeHEZDLlz
	G8MISptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bnK-0000000526L-2caj;
	Tue, 15 Apr 2025 08:37:26 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bf6-0000000502P-3gmV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:28:58 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54b10594812so6143462e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744705735; x=1745310535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=KngNytidwi0ykagiOFGAPSFxQv9YCIUIsJSWWO9LoLkXZWW8rPCdzIUW9GhijLtrqR
         igJtcGwHZAZ+nNHQfGKDc0BO0MrwsK4mFVzbKQVVB2gCBhPX11W+CpIVWdu8lShi6PwM
         Jh/wFsTGjizOqn1GaLlp17+zj6oDk25opTHiiApUxcZULo6vEEJskj+4JM8WMd/n83Uo
         KDjahw56iIYgTjszzpEkxo5yid2o4qG24ng8mMxOV0u5RiqSo9GDqZxkw0pK5pJyYoaj
         dCHObQ6VYw8X5+vXl01hkasQJBiExAq+JqecSjD/whLQKke+xmnmGK7G9ZLERTXCZWhg
         BkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744705735; x=1745310535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbC+rbiQeXAmTKOdQ5ekU8ntNo3bts/iVzbE7GMiRTY=;
        b=fW58dgDWP+TxQezlDlUe0R8kQa8Inbxg+zvmNu4d/zGj/8Xd+dl4oPJ1n2fBL1TK44
         1u7t3fKiYLiuXhjFzH5mFeKnjbN8xt7osrUExia57v9GGDlTdvHnZNnd2ynB+tFAlqWd
         p6ahHmz1J6g07lSGbBzkKevhNn/L0/43rrPkx6VqDSzBCU3PITS9EbYV/2c1lEyrTram
         8DAFqXnvAvwCvP9LN+rqpTiQvOQs2R4o3RgeINMcmJYClQnfm/QnQpUVslcuYDlj0CgY
         aYceb8MsOVvqeA+ah5vtTWfUyBpg0JDArtEi8bWHAU0PvMUgm09sTcLIo/ik6NvZbSGq
         vS2A==
X-Forwarded-Encrypted: i=1; AJvYcCVWszzpYg7hyPjc24MZzAYGu78DNA+wn1BJ6f8gK2PwImOYwGY0vEliGwabDJrYPaGf6AHf9Hrw4VZRsC+ABF9o@lists.infradead.org
X-Gm-Message-State: AOJu0YxKV1NzTD2y593LuqtHrrz1YRy09LuBavbtCfLM2DWmu6yU9U21
	FnFKDtMN9uSyb2/YDEiz8CD2bykAtzY4E/li/1AlF8jy9p09xOW/pF+tFiW341RTj3Tzt7EIExm
	WWcJu5BMDIK8kCSMKwPwb/Xz6/3ACZ1qOVOHL8g==
X-Gm-Gg: ASbGncsQnHnU+Hx8cFPVybBpQi+FjqxXOolJ+ftb4h5Sn2gGyWQFplmr2LO4pqTdk0c
	Q4NfGyW2N+nZ0zZd6/wxwos5zR9ZGqoW66lfGpz080NGLvOAdIVHLGXRWVtIoHUHGeCZNJOViUi
	7msMMJMDSg6eQgklZubgMwFQ==
X-Google-Smtp-Source: AGHT+IEBR/Eqg1kLWWGKh12iJhnCpJzO1zCgcGoecoiMf/umaHeT6TJC5jiC6GTZwtMV/nPtynCgaCpBpVXSKQksMUI=
X-Received: by 2002:a05:6512:3f12:b0:549:5802:b32d with SMTP id
 2adb3069b0e04-54d4528b940mr5354403e87.3.1744705735088; Tue, 15 Apr 2025
 01:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org> <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-3-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:28:43 +0200
X-Gm-Features: ATxdqUF6Upkgm7Rf-JBAXjYSrKlpy1hvmNwsxlcKu33EviWPUC1nvmMY22JHIys
Message-ID: <CACRpkdYbcbcbLz5K4H=dKdGfao68LgacASLnVF-bSYAsmhL6iw@mail.gmail.com>
Subject: Re: [PATCH 3/4] ARM: scoop/gpio: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_012856_913571_0383DE20 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, Apr 7, 2025 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

