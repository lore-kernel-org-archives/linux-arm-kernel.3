Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62691C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 16:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=; b=EtCJ1M/4rYR2nYXwSHVTIM1fxQ
	pXTvq8HcAgAXT2Aj2676Pe79MFRfhYNBqt1LsfIiLS8jsBUizaqb6I1QzXvnPzwWMWP0MgQYyZLRI
	lbI8fXq5F1RQTzCuMre2HN8PJAz/0EXhPXB5a3NNWKvd3IaoqxLVrUOdH6vtrf0ztoQFIKrxh3Xwh
	2bNAN64VRdeAGHKlnhnUDMzaLCVvu63A1035kDpefVMcTw0WvXih1QZxwhRcCDE1oM0DoMhjwBAur
	OY3i3FlNQO2Tft4Cy7KS+TI7sMJ7b8j9JNYAZuNDSi49MFiH9xnB//4x5UbrHoQI/MDNXUgAICfJn
	6cEItiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udA3a-0000000EPuY-0BW9;
	Sat, 19 Jul 2025 16:05:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udA16-0000000EPmj-2rr5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 16:02:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3143548e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752940947; x=1753545747; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=;
        b=vH1Mxiz+XXpBKkcespbtnXykg19cfuR+Lf1BX4YhFxwkmJozTDnXfo8N2YpNf1Yd7D
         bLH7H+2H/8oGihuQ71pUnA6o7KXkSKRMAGSU1oM2jjZPya97wZ9cwY9EsXW26e2swsrj
         DSlMMI3s3GHwEsB7Xto8OB8A5fGjbG9XnozKZUAwrMPJ/banp0QnbWdwzrOiuDoKm1Bp
         t5d412gGZojTz2oY6Z2oY66/Ks0qRjYTNJVpdC9i9glP51ZEfGkdO7bcU2xKpIdWeNB3
         EoM4lLUCbqECSR3bQ0vRsnjwsMB0Xi06XsP3USnyMmxFUc3zYcXBy3sKL3MgM+BvI/Bs
         uxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752940947; x=1753545747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJxRZr7iN1QAKs2m80VW48YbRh0uObEphOGlhuo4nf8=;
        b=Or1NJqVmFBhPr5vqNf7Sioo5AO3RBNZws+ercQ3wB+cP3hNlaPee/pUXZcQDImekyC
         2BEWvso+P1XXeVygteXCpqSyQgOaj0DYior0dQnm9aDnKoeSC/aDGlJYuZPSfBF3d2CL
         n+Ma5Pb2LTuh8SGr4j5cgdfZBFzH+8h7oBETTl3ixFKe5ep9Hb7b0SRFxleOZbO5SfHe
         VyXLi+WF3v7QrEiSuK5+CfylyY0VmAXlSXn76qx1yQQNOxyIpauBMTX1gqxeMVpypPZJ
         ubPlBL6PUAdz1wV2pEG2FplgVCyeiN9ERHaN2QsqaIaOdtkuK1Pye8NjGk7Z8Ya6l4/h
         HD+A==
X-Forwarded-Encrypted: i=1; AJvYcCUgA3EkYOt/JKID94hwvOYI05qQOc+vkg1wnuKXrXU1rEhp5CRxbQUapbgsBvH8u3082ISfl37Nn7jipbPzhCQ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx489BsrpBlivwnxvOtmrm4aYwMYxW40gT3wB0mq78tp7Dc4bh+
	fLWbyS0UrjPnOEqyYibc5jJ0pRM8iiEZVW9si0xJRjerXNDXJB+ot9ftoPMGDwDMmA7a/IRwXp5
	dzEi8/7lXtd07dSgvyKGxLW8EuaaMu3mVcVHJ6PXbnQ==
X-Gm-Gg: ASbGncuSyfEU1unbPd4TiDUmNKWgaj88XFuOvimK8rfAT/EjBn3Kg0CyqA5azN3uXx+
	JKus6h4mu3CX0UfNCzp8tjWQSxOZw9a7E4rlTQKKw6g1CxMidJqy1QE2ZH7Rq/BwaWVX08qAdbu
	bURdBMZ5YNw+gN1xt6z2zMxD6CuDa423NSr2uk4lmBP9pgoss+sBmh8ESA+3YK3yIwFXA2jNPm/
	qnLvrw=
X-Google-Smtp-Source: AGHT+IEoUxfZHhjopPDobqn7dOjOmBm5Yh2lx21AMKQLkwO7yH4BlU0K80uOKrtvDizTOqyz64KGrJ56htRl33CUOe0=
X-Received: by 2002:a05:6512:3406:b0:553:241d:4e7d with SMTP id
 2adb3069b0e04-55a23f6dd82mr3887668e87.42.1752940946812; Sat, 19 Jul 2025
 09:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Jul 2025 18:02:15 +0200
X-Gm-Features: Ac12FXztrlt_TII82ZBIkZmMLTzLg24otRAxfGOCzM7K4BljVaj3bGcukozw-cQ
Message-ID: <CACRpkdZN3qAJdvDkzvr0_=7grNHWFQ6M+_b=BvREq+PyosBmiA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_090228_729676_C3010AAE 
X-CRM114-Status: UNSURE (   7.92  )
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

On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> Bartosz Golaszewski (12):
>       pinctrl: pinmux: open-code PINCTRL_FUNCTION_DESC()
>       pinctrl: provide pinmux_generic_add_pinfunction()
>       pinctrl: equilibrium: use pinmux_generic_add_pinfunction()
>       pinctrl: airoha: use pinmux_generic_add_pinfunction()
>       pinctrl: mediatek: moore: use pinmux_generic_add_pinfunction()
>       pinctrl: keembay: use pinmux_generic_add_pinfunction()
>       pinctrl: ingenic: use pinmux_generic_add_pinfunction()

Patches 1-7 applied!

Expect qcom to follow early in the next development cycle.

Yours,
Linus Walleij

