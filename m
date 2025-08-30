Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB8ECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yz+gNr9wnP1FuUv8NASxp4fC8wPUaxLjhsHiXAOzrk=; b=hM+DGjxiMWKQSBG+8rEMhk9QJN
	3JiwFhDcyxdzoOx8E04MyRi6QgDTZTq+c3C2KUdZvmGxayRpAfAum1VtGGwqD7ZORLikEP+OaOOjx
	QJnTCNaURFNzzonlbSCLaxgd7hrUNkN7Jn8t8G3HRYhe/FEU2LEdCQTBhGjHGDgM4M1Mdz7X2o3Mm
	QUapnV8VjGJJbez9yxcXpdyBoEsg4ne/J4I5OyQ7iNppDAUsFByoQVEgAM34P/fauETXHuAmmKblN
	dDrVoUsFtg/WiTZWcSgG5yc5P+P/U3lcRY57Hcheg7/t3sLz7obeWP3b8lfJdhzBlEKJXBxSsESSH
	FEf0YrRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGrG-00000007bdo-2VTl;
	Sat, 30 Aug 2025 08:22:46 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGoW-00000007bT6-2kdp;
	Sat, 30 Aug 2025 08:19:57 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afedbb49c26so433552066b.2;
        Sat, 30 Aug 2025 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756541995; x=1757146795; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yz+gNr9wnP1FuUv8NASxp4fC8wPUaxLjhsHiXAOzrk=;
        b=km5GhV8NmTzJ2syzGIXxhr9e/NFAh/mnG8fZFQwlZ9AYqlDaZyiS+NWHHiHObzX+fZ
         UQUbUcJeh4sU8elf75kaX/6xHf/DKOAD9zDg+3XHB4zn1KiSJR0Alc2r0W1VTErA/+DG
         Yc5QBNzUKvwPESjivm3Tfk47+Pn0vVhoP2u5rlzx/ynSXV7dxFqwF/ASe4tyZjLk8wc6
         ikDzQSJqcBT0yqoeUHn+iIX/dJJeP0TbEytb+KFoEaWkNanGPXJHmIATO++buc3Ssnmf
         9YREQfKr9T9dJ3hqLF3uMYhj+ltr2E/0LoqE6WbTgLN+23hjv3g4ke67AaACR47GsywD
         74Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756541995; x=1757146795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yz+gNr9wnP1FuUv8NASxp4fC8wPUaxLjhsHiXAOzrk=;
        b=HPDc8kfGjTIdqVew+/KvDjsJ9hcUc1/RTZSksKQ1B3TBzDdsfh33bsFpUKA4pp7i1y
         91s45Y2qb25fWjnt0/9Z3OxFMhQ24WwbgVNolUSJ/t56Yu7V8JPlGZ5By9QQGQe8FGh9
         vPBhV5XJ5L+GKQbFbWl4YBqp0PMYFEZaV1S7ywfUekF84sECjDnZ/dys/7fhjDuGdOpQ
         ryVzX+7PRcX4IDCHzCSIkDjvGCG/Wd6dn4UNodYCUYJb3pqKWFKPklix5j+Vma4ITLUt
         9PQTvG0GVK3EcHIIuBIuQameINq9uaDIcckDakgscnQf6P+2UIPFVkLh6v/4wIhIlC8t
         wusw==
X-Forwarded-Encrypted: i=1; AJvYcCXVEKm/uw3fIzshA23UnTzyXsstffmzTE2r+i4AbI35w7E+mMyA6w7Gn93+CwgIe/WYJ8x4TdC/meeAe+xzFm8T@lists.infradead.org, AJvYcCXxzOm4VnKGgyP8TRM4BQinMH1IqgfQyEna9tQOJY7/lZ4RqIjdUPk0jYsXBoQW7XYqiyLGOhwAMv9QgyyqHks=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm7fCgjBGstFUTqskDEgLrJ7YJlSxM2ZgtWX8ky7N2vjwTlCM4
	KbqpH2og2+wnYoO4WT5VeIGcGGyN2D/SmQ5PTOfef4L6NO++txpuOMfGODqXimIjqeJy0ijTRZt
	CjMAS+tf5aGN+MJIenQnjj2rMAn2/RUc=
X-Gm-Gg: ASbGncuEcLD/vhl34c+8Y+6PyMl5b+kfjCK/OaiOlD0W9tag18HawS/TA2oTwm1/TzS
	v+zupMI2Ts659i7V4bU9KkyhCGZgWK+OOOExrWNJnJGA7sxX/f251JAWDa45bCS0rxQzShgiNfy
	2tKRfOLVjbGps8NIym+wbJCGsChjvAMuXWERhj7nLe/ySy+/TMaTxsn2U487Ns5+vZWauioVX5p
	tBQjG5v1HIAZz/kYg==
X-Google-Smtp-Source: AGHT+IFZ0wex4nlRzxOc5BG8ARrUjGz7n83ilxsIj2vkPtuKrq3/+IPw3T+K7YRUGhLq8JMm7BCY/eJH8jBRTGRUUSA=
X-Received: by 2002:a17:907:d88:b0:afe:764d:6b24 with SMTP id
 a640c23a62f3a-b01d8a6a72cmr138313266b.14.1756541994858; Sat, 30 Aug 2025
 01:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 30 Aug 2025 11:19:18 +0300
X-Gm-Features: Ac12FXwW6CW7deBsm3Aef2wv7I2Olg4IsebLLUGVz2bUvR7gVeqwu6XUXgRk6VE
Message-ID: <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_011956_704345_38E26C64 
X-CRM114-Status: GOOD (  28.34  )
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

On Thu, Aug 28, 2025 at 7:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Problem: when pinctrl core binds pins to a consumer device and the
> pinmux ops of the underlying driver are marked as strict, the pin in
> question can no longer be requested as a GPIO using the GPIO descriptor
> API. It will result in the following error:
>
> [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already request=
ed by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f100=
000.pinctrl:570)
>
> This typically makes sense except when the pins are muxed to a function
> that actually says "GPIO". Of course, the function name is just a string
> so it has no meaning to the pinctrl subsystem.
>
> We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> other platforms as well) where we mux a pin to "gpio" function using the
> `pinctrl-X` property in order to configure bias or drive-strength and
> then access it using the gpiod API. This makes it impossible to mark the
> pin controller module as "strict".
>
> This series proposes to introduce a concept of a sub-category of
> pinfunctions: GPIO functions where the above is not true and the pin
> muxed as a GPIO can still be accessed via the GPIO consumer API even for
> strict pinmuxers.
>
> To that end: we first clean up the drivers that use struct function_desc
> and make them use the smaller struct pinfunction instead - which is the
> correct structure for drivers to describe their pin functions with. We
> also rework pinmux core to not duplicate memory used to store the
> pinfunctions unless they're allocated dynamically.
>
> First: provide the kmemdup_const() helper which only duplicates memory
> if it's not in the .rodata section. Then rework all pinctrl drivers that
> instantiate objects of type struct function_desc as they should only be
> created by pinmux core. Next constify the return value of the accessor
> used to expose these structures to users and finally convert the
> pinfunction object within struct function_desc to a pointer and use
> kmemdup_const() to assign it. With this done proceed to add
> infrastructure for the GPIO pin function category and use it in Qualcomm
> drivers. At the very end: make the Qualcomm pinmuxer strict.

Note mainly for Linus and Bart:
I agree with the patches 1..11, but starting from 12 needs more
discussion. That said, I hope Linus can apply the first 11 ones to
make it easier to continue with the rest.

--=20
With Best Regards,
Andy Shevchenko

