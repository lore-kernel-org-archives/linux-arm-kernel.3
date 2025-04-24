Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA3DC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=; b=l6eRSKKElW5/+xsN3Mbh/6io2R
	cUPkWlIqVqsKGzLOF4/P42nGYmLp3gCW6gt1K5XqYrnWbVz4pSj7oMzE3IOC4Hh4WpU2obE39JKd2
	/BsXOFK9pIlp58J5y090Xq0G+m8w5nRQUmkv0fCWDtsgzIkgKQY/Yqa2evQaojbBeb3jbZZdYgpHS
	DlPkf7/yG1xrSdUUNqzZTheTggT0Puqo8jUQGZcvYeCB0kBfecNd+9nyWKaHbFYlqrXRUebbK/SlW
	uN/QU+oThDfkE/JBWbR2WBjoGn1PxYG/asBmUtoPA6eLQ+M9SmITrMOPESAVzXnEUab3tjTOzLrEo
	VBVOvgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82Eq-0000000FCBG-0w4Y;
	Thu, 24 Apr 2025 19:28:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81je-0000000F5di-309D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:55:48 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3106217268dso13555291fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745520945; x=1746125745; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=;
        b=Ei68IhC+cqrzyvkU4+4HR6w8QqjQRnw8rYx0m3V+18aa55zpS6nsro4OycF4wMfzU4
         FoNjKVMtucVuPLFCCBUuEWeB2wy2WM9ntfR6r0ThRkMDdemppBIwelzKvK/MmPXHTcq2
         PxRSTqP2HCjJKugTTFwHfxgYXHNXyyVoaiwZmxblrCt3qHuoMKH9URDQEyu48ACGQESL
         GfkGJv62ZnXq3aoEAGd+AzwJaZiRfcho3wCNCCNQtJfqTzRYI2pyUwN/kPflGktVnf/G
         zTthaNOw692txbVRgsrt7j7KiUSD1CIOHcAFNwQMQe7LwPEfG4Quy4uhvpP++pgMC6iJ
         MwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520945; x=1746125745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=;
        b=MypqsXf1YUVTwW94iAgS/p3EIvU2hAI+f4knuIo+ttIFIFvMHFv02mUjyAEoinOVE3
         yZRp000WHSh4Y56YQNxB+U3jOZT86XqzztywdwPmG55xfI/i4rHjqVfIJhxSJqBPHu5E
         lq6hlfcCrs28oNgzhJlL/4l9HJZFwxOGmW1Zk0WicOGuPltMUXW5Zr5RSG3/9NB5d/0L
         dcHxWpXwDM85W3oxBtnoDen463L0Yv9fQfT/3KTxVDF+5zMVGKg9UOKt3PMhhQl6gfRV
         bIG6ca6MSf8Ff3yfvFM5JwnDPdRI8KI7RMf5aWcurt4ABCXwdwkUiWas0mF5i6ISm8uy
         X3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbM68UEReEYRrZodMUHy7EKyLm7syC6P0fcwqs/GCZzQpDIvIeUHATHBqwifEEcI93b2ok8VjaGVyHgjdk9mr7@lists.infradead.org
X-Gm-Message-State: AOJu0YwFuV5KNUqOJm0kkO+o6d8ctis2t50yT1IQXRB4heC2N/Fwj1bL
	wP8RG7h1e5a+LcNT/Fkw5cdabAJ02TjoYmQ2IUNDaF1y3nBUT2c5VozvZRZC7RHLOscgGfNHbZJ
	RzJYddio8ssvu1eTBS45nS6tg8xeyq0dVI0nqTA==
X-Gm-Gg: ASbGncvfongyqJop5NMjZZ7QV7pNsTaUUAygUpb91O90ykVZ7kBKuhol4b0ioMhXk5t
	HaMS6H3HeaYREUHMGFHS9DNlcJjmZtUsETLZPgOSbV1fW43sd3LUcNOcCGZgYxhwGz++Vhg99bJ
	Z2d74XedJzXK6igJ9C0JkIuuZ6S7RCv3bKMLpVrVgPHJP0zzbShHMPVA==
X-Google-Smtp-Source: AGHT+IE0c8VGEk3/LwHw0m2axs8IZ9HjpeBp8o188g75mkoErRBNX5c5KptrxgTjbE1qe+vTvqn/BpVZsaupGVwBUJc=
X-Received: by 2002:a05:651c:210f:b0:30b:bfca:bbf2 with SMTP id
 38308e7fff4ca-318a7b0b7f5mr2808701fa.7.1745520944675; Thu, 24 Apr 2025
 11:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org> <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
In-Reply-To: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 20:55:33 +0200
X-Gm-Features: ATxdqUGQRJTk1Y9jikLuWRcOSvqi5BIyaHo-9YdHMReWW67MF95w4__wq5ceBqw
Message-ID: <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter callbacks
To: wens@csie.org
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_115547_006437_C9DEDFC5 
X-CRM114-Status: GOOD (  14.43  )
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

On Thu, Apr 24, 2025 at 7:43=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Thu, Apr 24, 2025 at 4:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
> >         /* AXP209 has GPIO3 status sharing the settings register */
> >         if (offset =3D=3D 3) {
> > -               regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CTRL,
> > -                                  AXP20X_GPIO3_FUNCTIONS,
> > -                                  value ? AXP20X_GPIO3_FUNCTION_OUT_HI=
GH :
> > -                                  AXP20X_GPIO3_FUNCTION_OUT_LOW);
> > -               return;
> > +               return regmap_update_bits(pctl->regmap, AXP20X_GPIO3_CT=
RL,
> > +                                         AXP20X_GPIO3_FUNCTIONS,
> > +                                         value ?
> > +                                               AXP20X_GPIO3_FUNCTION_O=
UT_HIGH :
> > +                                               AXP20X_GPIO3_FUNCTION_O=
UT_LOW);
> >         }
>
> I guess you could also drop the curly braces, but otherwise
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>

Right. Linus: can you remove them while applying?

Bart

