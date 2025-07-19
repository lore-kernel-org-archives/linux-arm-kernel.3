Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DF5C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esvGyu8JnnHIYbCLir0OmV0T51s3+8MXKXoURIZNyTg=; b=sTuZuZQrztjf98yPe6Z+XNWmaF
	nbhfoXzTZ/fG9JLQgEQq3YLihOAolvUaNjKp51ykyZV21f7ZGMPQNNCJhgmKkQ52T8AHGqNT1L2Jg
	z5JcVcQJqBmNc/2F9LU2HGGuwDSdQrxywDTSW9BcY2jNejrywgzfgI2bz7DCcpDCo4dF/N7Zi8PIC
	p1i3RyKeTfWGKbfIe2wkXyhmqdgWhUI+QGe/VC23i8YclqicoXszsWbv70cOI16vrMSC2t1jGtaBi
	SbXfCW1HgHahoBgqJLqXpaOkEFCLbfA3hAKytamTY0XbpwugD5TUPtHLKrvRMkFhFqWKydmlvSxUk
	ST/cQuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud9gl-0000000EOcM-1jc8;
	Sat, 19 Jul 2025 15:41:27 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud9eH-0000000EONu-0Vjk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 15:38:54 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-32f2947ab0cso25213291fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 08:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752939531; x=1753544331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esvGyu8JnnHIYbCLir0OmV0T51s3+8MXKXoURIZNyTg=;
        b=kO2CpR45O934Zrfy3ef635wtpiRDWAIbmnDdMn18QM986xflAnZACkrjhgtlOA6Q0q
         dZTIsvccyGsJClqsb5y04fe3uR171QVNshWl5WhZhe+eJuipLK1yV+N/e77PIbMkDr4c
         cVIp98tpgjBg6I9qEkp5WUCwXDeTg3pkag0DWT3MBH6aSwWJX33/9klgWJ8ZRxQJhgVK
         DkFl7MrZ5HQm8868G2b0P3mdOc1/OWhhPXeJA6eeOdFBcvrsV8z6u4IQm7ehueqgnsXs
         D5d8VB4PFnsHld+UjuDs5X7hGgDrILr1zRILlenrNkvEburtrnVgEbiHw0apHoosThXl
         pq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752939531; x=1753544331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esvGyu8JnnHIYbCLir0OmV0T51s3+8MXKXoURIZNyTg=;
        b=V8AWwMog9/UK3o+oheNepixmd9jZmkb+R6Mm5Vyg2YxoyRxSyzJ6WIJajjWysjDSLg
         ywizFdDCQVV/JgdSXp4BqTTE73HqNVkcj7RpcJTIF1fflRTTuBa1n1FcFQaYP6gisdYz
         x7WEXPfwnyx1xcipu9ANqfE3fvEqAc/Vvxq9VeWNGbAskwgsNfy9ABzzbYJHzQHPDdpQ
         uiwwDT7YaWXWJs92uj1EO98Y9tfarTd7JKwxM6pG9bB6cfs9tj6nvz64N5WXnZPb1u/U
         XmB2/2rDrW+toxJDSBD7PqIXblXBq/XAdCd6Np6fw806KVAakrKwuA6XTFmSR6SoFW0w
         Q8uA==
X-Forwarded-Encrypted: i=1; AJvYcCXLSaIWpNqKYQIwbRI+xpXufb+zWQMIwMgrqfaSSdzk/m8V53e1e2tx5teOW9kHhgr4rshwCjwnxe/6BB3hVVu9@lists.infradead.org
X-Gm-Message-State: AOJu0YyBW6Vq87aTW1v3Xpl5wfC4Jr25lO6x1K6KgiYqQPIPL8hcKK91
	VUt5Vo3IAnUG2u2WpMYrgtbAF7RTJy+S5uKa2qb35Vl+Mhus7Et8RLJbMwqX34z8Ahoow3P3I4H
	fPNqbwkJ634COSD0092ybElX2Q2oZc++FGcFwKz436A==
X-Gm-Gg: ASbGnctBZO+r0LTTmpbgGr+40Wg9ETfXVwcz+RL/eJpef8vM+i0wA9u0tL31aik0k+k
	Rk+LvR7sFU/ialGrjUwIHroOPoeVPQivGVr0FXVBcZZLdYYiyJew97609uKwJvBXkk9kgYL0/Uq
	divT6rcQ0PDq9ae597Zf93SiYcnbDwasD5oSXpDWcllu+dQhSd19RVIE/TFOq0su5kVKu1jSdy2
	1pCG9A=
X-Google-Smtp-Source: AGHT+IEwlbXHvry/qY2RXEOh6vpApFq8XZg4BSuHABf7Sre3nDCz/8jjYq1SEUpJJI5MtznrxVrRAdQS9Sa5qhK2BeA=
X-Received: by 2002:a2e:b911:0:b0:32c:a709:80ee with SMTP id
 38308e7fff4ca-3308f65a482mr33857141fa.39.1752939530816; Sat, 19 Jul 2025
 08:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250717125758.53141-1-brgl@bgdev.pl>
In-Reply-To: <20250717125758.53141-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 17:38:39 +0200
X-Gm-Features: Ac12FXzPHOlu5REnsZeyzyWx9zIDyQpFtIWVYfIb9ILC5hC-cRqM0O4_7jyb6Vk
Message-ID: <CACRpkdY1G1WyWABbJV2=sGzZLLRS5B+P7ZfJfpOXUTwxhwr+jA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ma35: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_083853_157653_A536A34E 
X-CRM114-Status: UNSURE (   9.01  )
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

On Thu, Jul 17, 2025 at 2:58=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij

