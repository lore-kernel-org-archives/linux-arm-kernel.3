Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB81ACA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMbygbPZ6lp27UzGsQQZR6ABSzimBNrHU3kdVj894r0=; b=gymuJ7eHPs3/Hjha14OcdPypGm
	+2BdJhRMp8lh2X5sCEGMNJJqnV7TFzZS1A9M5rIeWxx6zqGUBELcCJ5au7JSOLsL3tjO5NHx4Pu9p
	3b/k8hhB3hXQWzehIYlUjrKHZopY3ZvlMTyN0bLdQT0kWNpo38irqxfTfW7ENxprmikAoa1JNYRDn
	Z66X/9PiegBgSVnMLhqGyveRjtvd1oOiuLZTl2PYilByPaR8jrmTSvDUkT8bx96Njy4d018rwAcHg
	EIW/paqJY2rNd2wfe/BlapZ4AhYMBVTueV7ox99kVgxP7jUU8vP8Dzf2ZQlPu0wbi7icJ9y+0oLWs
	X2CAQ6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urm0w-00000003fGY-34W0;
	Thu, 28 Aug 2025 23:26:42 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjPc-00000003COC-0tZf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 20:40:01 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-336a766a721so8194031fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 13:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756413598; x=1757018398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMbygbPZ6lp27UzGsQQZR6ABSzimBNrHU3kdVj894r0=;
        b=yjsOUH7N+WWTeRMpIcr8j5pdKRdpD5vMAGuEO/eg/JjRe6Q1Fn+rh2HY6FMpvFpQgO
         YP/WmT+3Ls3w1XT8+zegZM5zCtl/Nxfrmq7/Uy7u+cHaiHGVoL77DtnCQbuo3BPW5QIb
         Y6LgAid0SlKboM+2TYB1oDbK+gSATSXPbts3izopNzHvLDroTeK1B53YzmrgayYisy55
         NUpUBL4BRjuA7qWhH0v8nWgxzf5h6pdmDAvKjOb3ZDDdvD+0fFigpqzLG+Im/RAyCeXR
         EmJXs2KDHOUD3O2hwDJ+Wm5io397ETHjDnVM5XQUXcdv40koEQ8elil7SLmceDa8bVZu
         YAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756413598; x=1757018398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMbygbPZ6lp27UzGsQQZR6ABSzimBNrHU3kdVj894r0=;
        b=h4Vt39qQpg2LwkTk2/DzNce/mkGDmsX3jgJ2gLZMgQD0HqUGNS2K+Rmh8uDP++9KVg
         GLcvIHALWGedld0Xh2pBRjQlevyCCtvB0D3DlA5OqDykz4Zut7YZ6p0Z+4vRlnNYHq2B
         wEcUuxdz8rPaI3opm42ogju0ukTQVzLg4qOhia4vlWG/C0wM49qqp5impkfJwarRFLrf
         Hs7cp1j3QsHH1rzsb27ratkmuFk5Dnzw2KDsVNSnD9ESKgSCto1wliRQfPXL+6izzHLf
         LF+ByLS9/USa2NKhuB2AlP0yzR3n0nNiWBobAUIHVxxERDt8KYDdUVMx4Kll1+nxI+aA
         MHJw==
X-Forwarded-Encrypted: i=1; AJvYcCV5/AQDD7oMXKN+8GXy1pchigGl+cQAe9ZUyf3ilFDgYhZ+G0jUeZ5SSolt7UJhzRL+FUpwDmdY24qGcofryVsX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+56xO+GG+cV1V+O9eB63baWFJ6QefgaR7MT5asmuT7OavKgu7
	Aj15fJ0sA4gQAJkFCQ2tO/Er4GB1xPgkWfdev1Y/9oGSqFw2ZwR7d/Uku6E9kQQ3RH4xDsK4EuJ
	9ha7+NTYG0Oqns+ZZW5q9JAr20lacvmj+Ku+J5eGf+w==
X-Gm-Gg: ASbGncuSGKIFlQTljhnQUmm/TMg5N04fzSl8EksMA2S0QxBBCRGBMVzw0Jyk6GqlnGS
	4NRvVLkVCfBXdKAuLfRStAqpBv2YvDxoiCS8BikCek00w5A4dHsFiMqEhZ1lwfqyXQwKNg2ZM22
	SdkLAT+0IzKERlhQQsN8poveAQMroIn2kMGJ1Tt9qD9BGKIO9TcCaGKEYRxPo0LWnCGaJKRCvn2
	cZGL4CyLFBV2hmXLw==
X-Google-Smtp-Source: AGHT+IFyEWOuQG1fDf1ksdaTJASZAGtsBlaDN9tGze2bxNvZnscAfatszOqEDWcWQi8cu6lP0CXjxEkjw09XegfiPKU=
X-Received: by 2002:a2e:bea0:0:b0:336:af88:ce61 with SMTP id
 38308e7fff4ca-336af88d0efmr5543851fa.40.1756413598261; Thu, 28 Aug 2025
 13:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:39:44 +0200
X-Gm-Features: Ac12FXzQsryYs9cHpNdLp9yIX0je4QdVRt-NW8EFXmMKnqh-BUifcsfX0FEg61k
Message-ID: <CACRpkdYBZTLpEGS+7m_B8MrFtUvh+0yaS0bsen4jkUcf0C8gjw@mail.gmail.com>
Subject: Re: [PATCH 0/6] gpio: remove references to gpio_chip::base from
 debugfs callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_134000_247764_C96B1C4C 
X-CRM114-Status: UNSURE (   7.75  )
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

On Tue, Aug 26, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> We've stopped displaying the global GPIO numbers from core GPIOLIB
> debugfs callbacks. Start dropping it from drivers too.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series looks good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

