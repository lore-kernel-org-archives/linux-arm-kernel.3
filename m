Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA24CCCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=; b=gC4Um/xkKg5LvFD6HO66ZDMjPi
	dr3xYuWbLvw0m7fBwfwA33WR7iWzL34e3Fdh4zo1/U7AXa1yWQwjORLv5GDGvYzqnQ2vSMRBCNA23
	CxPhJedRUhFiS5p7pPmHQK7UwHfUxdIirC65cbzCUpquUOvuyU6U2fWJTx71v0hXUpPP8QOPDO6Ve
	+x8oZvHhuD0/QDVyqfIgJDgIivJekKzTUUZqpTLUyQVjPnGO2/YPLsGaUMyVw46oz2RzRK7E4TeQY
	23amKtG+nu1b+PSLvol9mejCXYdywY+RL/8ltF9EyNO1DHuy55VDxa2LoapH9W/zqlFCu6jWXZM2U
	KnbrX5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYyg-0000000316U-1hae;
	Wed, 22 Oct 2025 13:34:10 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYyd-0000000314h-3p28
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:34:09 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b6d3effe106so30840766b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761140046; x=1761744846; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=;
        b=kkzvjn0fp40GvTLkyz3qIGxSbMDpZfkDB7nXRGVdnyqsUaAmK/bGsfbnjyjhRhiaYw
         pjIMdF24DaIcq17YH1uZuzOvRc5i4xgoV/wAKkPUDg50MwTEGoT9c3kg6NgfEHZ10g9E
         3Xf7/dSOfsuMLEBUGMlcHWQeVrBeEbwmVHXTk4Of6hrHzW7SoQtcaHZ7RKAhiot0axsW
         7+8wUje6so/WxG1g+vjh8X7TTCuIXo8B1MMiXiW7gQ29R0xmSqbGE3H8KUDPOJBHRjZ7
         53Yru3Tv3W83nuRQbMsuoEsJtj8DvTKVWAHgJHvO3io2DVJjGIoxaOpftIMdgq0otrCL
         mvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140046; x=1761744846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnDab3MvBR9d06ZmEVci9R2LEo8WZZltTef4oKgMrxE=;
        b=B99Wz9WF+1BJFkS9f8vQpDW/7gQwqau1sQpHGEHJ8eI6ofGl8b7o+5PNYrvjWnTozr
         NXX4Xk7gLvgIMX60uRVOuHTbmsQMF4+zCArj/g0x2KxGidBFdZ0IVJoQkrvvCu4xW4Yv
         1CgUN+UuS1rSvzA/e+IFZ0LS3JYHrrYkUZOjLx3AsVskPKGC8DJc0LUs6et8iTCzW+Jx
         4PdWraVh6mBWZXqk3M4hiMv746E1OHhaGEYoyhB5OyuWepmCCR7XutnfdU1NRJlyR5lN
         KoWUH42Afd2VUpApRy0w/dCFkrmtOnda+GRQbsrbLl4QYzBXUF53CsPflw1UNPlL0pbk
         TaBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzVgzJ2Kg8IjuRa4EkZbtH54NW4jGbIR7IK8vOAXE/SmtWn672x/0GswTRrPWL6nrdTAZQd3RqhB0ZyhQZ6wbk@lists.infradead.org
X-Gm-Message-State: AOJu0YxOKGQdvJZaf3WCYMwCiPZ7rRTAldCR2QAKBcij6sMXFio5WQwU
	aV7+6DQGMo1aKEpP+YPPmeqt5OeHDdhYIkCBdpBYz9zgDzzKKH2lPhBOm5hsCgFEA+8PrsvNipN
	gcjCaNg3osBevteduP48684pPzsiwCQQ=
X-Gm-Gg: ASbGncspeP3EkX0gdNOUDqrzr2XrD4lgGeZYe3cY6h8d3CsevpBmobOi2b+RWfjDLMK
	dCBvj3aWm/eOg7SkjQm7r/8wG4A0dyVXldWKeKkUBsDaGbC3tmY8Zivmt3B6T/hj47BZe6K1UCB
	ip8CJLejlXEq2pbC0SRNz06uddOW1GNeBUN0a/wk0dnYGvhBYmLhDtTCJVxk5Ry2ovxXZf5Z7yj
	I35Ddq6z9W/gss6jHoAzKt1H3KHh65ZBHMGN1jb2nKmkdUbDryTWONEybZcDISmKn4anW0e
X-Google-Smtp-Source: AGHT+IF+bGnEQc856DkdZpIAOaRV7nKVJQZfv8gn2VCNIJnjHmyCsahfWQqIidtzCF/ZoRQsNWSOtm7llM7J7h8TBP8=
X-Received: by 2002:a17:906:7314:b0:b45:420c:81c0 with SMTP id
 a640c23a62f3a-b6474b36a46mr2340985466b.36.1761140045360; Wed, 22 Oct 2025
 06:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Oct 2025 16:33:29 +0300
X-Gm-Features: AS18NWD8eeQXjXIPK4eXDVlSVPojwJxWfrcwXD-jC0yt5VNiNWjvrq9EAmjuWt4
Message-ID: <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063407_951701_A3262B8D 
X-CRM114-Status: GOOD (  11.48  )
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

On Wed, Oct 22, 2025 at 4:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Implement a function for checking if a string ends with a different
> string and add its kunit test cases.

...

> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const c=
har *prefix)
>         return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
>  }
>
> +bool strends(const char *str, const char *suffix);

Why not static inline as strstarts()?

--=20
With Best Regards,
Andy Shevchenko

