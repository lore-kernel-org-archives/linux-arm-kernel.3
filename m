Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90AECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=; b=Jj3wjD3Pv27YctYdeqoeqQ94Nx
	U4MaMXwM5n6Ryk0wVp2dC2symRuOEPOxzDDZbEORvECbhnUCp76fq542UiHiCDJy/NFPIYKlz+4ZP
	BXANmBiSYPx9J9d69klGYXv3gavJVgVu5phtGfHwisG0lWSdbWJo8wLafisnc130ZxMdYe+O82Lva
	q0WJtlmBN3vRBmTpIGstGZPvrJoLJKwrNoMYIDers1AxphXhytua9HfX3uKDOXNu7gaaDAUwMUV34
	j9N41qCBv81G2LK9asX3LuUOKLBLk+qo2MHCOeTeC17/trpA0jYcsBkUu8eYYUvRNkv3wRd2RJLnR
	9/7DJZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlmx-00000006yFW-3MAL;
	Tue, 11 Nov 2025 10:39:51 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlmu-00000006yEv-3inV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:39:50 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-787da30c50fso26762357b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857588; x=1763462388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=;
        b=uEtjdJ1SqhKpTOFO2jJ6lc8iAWqrnZU1NdtphIrLg24Si9aH09obwI/QuEs+QGXqti
         /kbPyI9bjAIIrK44FK64yUW9D1LHE4ztCyYYbmXU8Oxc4Td1m7FKnSCfnH5+FOQxBYZN
         YbwNUtDrQ02PCTI6SSeq2aHHwffyAFNa/J3QJlDgAqnsJXbXkUaKcBz9bMxWGc6xk1jT
         4qzecmnqhTMjdoMBsnEiEw1iKzloo9ub5/Ggk3fkawGS0SHqjpxVe1+Xdu9PNagwf6JC
         OceDYaqpeCcBv933UmPlltRsKmbbp/txKG5CVGF3kRKlnmCh+TFB/YqtHgMAmLjB59gm
         sUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857588; x=1763462388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uQN8C80XsI1DNcTbyZlxKBoQDlYbpinBS57HXqp89to=;
        b=HUT3IaFTqJDXpMwc/om6gv8hHHW3adjLiVQoxK+lCoiSFSPzS86gc689uCM84jp48o
         nwki+jzaMd+5YF2+ep8zpDYpd6wtTEtpWpW1U0RVuLSZMsqbHn8HZu43dSrIyq/MuErG
         PLapWvujeFIpP5vY4TDKGUYIN/LDbzs1YQ3C/R+KU6uCV8D7XEKLiESlbeIEOdDwtTgn
         kD2vb2oYw/kdk/ISwouhZ4VOQp/nDOjcuJ91Q/D03/L/7qIf4iehed9JZ8tqBGdpR255
         J4haA2QSdxzYqWd/q826JS3/6jshR71rWgZxPvk+BnkuqnD3++kLSeMCVSG2ieXzJrzo
         EMMA==
X-Forwarded-Encrypted: i=1; AJvYcCWQOs7x4hCPIfi9OqwQP8MXvF7vpD57ynQXQBSL1+/G1IG1rM2xRWo+qr+goC91ST1pp6D1wZdYVWe0lcy+8VSy@lists.infradead.org
X-Gm-Message-State: AOJu0YzUTfbawn7+LiiIpiruXEPmOTn+8JtS9GAjBE5/iAGOfTMRxdDq
	Xv001GJJ1Ed0i+Dnma4jMJeSVW/3o81bIGOkRCf3aJ+hCvUQ50bUcztbRpIZHjIAEP52huNpkmb
	X2d7XFH7gb327YiZbkpe8Z1qk/1KhB/vpWgAEkK2g+g==
X-Gm-Gg: ASbGncvukRc4jjm897xk6bzjTrTIhFFvuEK6DeljWEdyD9tSaTWcwCQFwE2POEMdXvl
	lk2mewlePb8mktckZ2bxFGhRqs0PwEUZEVb+9VSJz3+mmgKLxU1eTWMUpjYOQku9c7g+Khjosdi
	UdXqcleLkBiXxHT2Syt+rq6LusHkXj7cb8y67uZtlAWXuVSVdhLBeS8NLL+QV/HQu+flG4CNrf3
	kNYh0zDlYXDeHY7pxBZ3+eAPnBy9DCIjdozBfvAcRst0ZhvctAR9C0+2En1psnT4AITHdr8giEJ
	Vb+uWg==
X-Google-Smtp-Source: AGHT+IGdKr3biW2aMZhYy7DvL1RF+7Uz2kpvCtGXfJ2OgvOVwI6zfxqRAu2DSnJi2xHuqa0EQrFVKg9nUpOsh5XjgKI=
X-Received: by 2002:a05:690c:55c2:10b0:787:deea:1ba8 with SMTP id
 00721157ae682-787deea2334mr150764527b3.50.1762857587612; Tue, 11 Nov 2025
 02:39:47 -0800 (PST)
MIME-Version: 1.0
References: <20251029-gpio-shared-v3-0-71c568acf47c@linaro.org> <20251029-gpio-shared-v3-2-71c568acf47c@linaro.org>
In-Reply-To: <20251029-gpio-shared-v3-2-71c568acf47c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:39:30 +0100
X-Gm-Features: AWmQ_bk198TBC3PdqVd9Oowwqb_fFWVruyMz7Lubn4P_lvSkb0elFliKm8IlGq8
Message-ID: <CACRpkdYRzuumaCv=a5UL_G8StQj10kBiRfkfrpWCk05zVfGYsA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] gpiolib: define GPIOD_FLAG_SHARED
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_023948_931586_EDC9F69B 
X-CRM114-Status: GOOD (  11.79  )
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

On Wed, Oct 29, 2025 at 12:21=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Define a new GPIO descriptor flag for marking pins that are shared by
> multiple consumer. This flag will be used in several places so we need
> to do it in advance and separately from other changes.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

