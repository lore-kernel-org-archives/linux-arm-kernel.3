Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B3CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qq79ok73NgzUNSPN3ElH84ehBnROIulXyA0yyA4cddE=; b=jlPdcaikTHevs9YMKK98DXlKL7
	vETG6x87aoMdRrysgaWnrWyObE+GQzn5RQNj4k2x/hEE3nvgrFLpjFwzxJ6/0NLzC3dcadxWsGA9h
	E5gaUb2hJ95tG6Spjt2ACLv3ZHqH1nrn2GshzlYz6V/+Ni1bZqBsksWt8stV85nwC0jsZhkIBkcZv
	bEgR/izVDKVDiHOgR+8DUk1EpynyNbYriesEytV4a+Axwv8pUrOfbYrDnNw8XNh0ERSApHwLaYdH0
	KAy7NDqOuEiPjlo1Nd3NxggcLlRf3UYj3gQ1hncycbNgF+erUxNcXCRyub9bz8E0IN4Q1MRGTM6hV
	ude9Ln3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYp4-00000002EUD-1NkF;
	Tue, 02 Sep 2025 21:45:50 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utV93-00000001GmJ-2CxN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 17:50:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so2241310e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756835412; x=1757440212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq79ok73NgzUNSPN3ElH84ehBnROIulXyA0yyA4cddE=;
        b=bz9Vu4gQaxLWhNfXi7RN4eZv0CiNpElVD+5pPPE2ZhNnK+HXFO6UHpo2AUDFyuy+y+
         W4CGxdqZx2sTc41lokiFD0Ny0bsy4iV0rtBHqCBIaftFeS8n0EjKQJ89Y0PcLI2UE4tc
         lrEVoFPlSV377ZBolPlhwB7JKwDKYlE/fcoT76RR/jqoxQFTVoGuqM9eV21gjLUjvEdl
         EJdU343aQvRbpIhwrw1oh+SuCZyPaQTdLlv9eLrKYFbQJnHW1jXpv8iF9BjmFq/oje8t
         53KzjqkYPN+91MYrsK057d0eDrC112Ty0ya1NWxs4duA3UwRpuoso/VJdHHjLVLToula
         IDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756835412; x=1757440212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq79ok73NgzUNSPN3ElH84ehBnROIulXyA0yyA4cddE=;
        b=FOzdibV0u7xGTFgRHa3RXLKN+eNN/rIYd+G6U9Dx8V2G46ZKUBq9qD/eLKjJ+wJHch
         C9qIsHBuDjlPP3YPpITdjSJpx49dSRjwab4E03ilbazNyDSTLhf+7l3HwAPObNL5vHO+
         nX3qzUn5oNDPnfyUS/Mg4OcAsne/OyPIB49XpbRmDR+0Lv0xEpTenNRpGg5uj0ljF8xs
         118s3/SCRIyzmz/J160EZew7bvLJoNsqDR84CnO5xt6IMZeuS+z+Xa5Anx+ed1LpvRcD
         p8vWb/CBa4ZDKiseaYt76+KaqsU4ipZjJxSf8vQCNLnN0Gc8L8lL6nvZBmswMZ6eh/pz
         S6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXyvuxddfdK4X5Y8fxxi6uSAbrjugzK6beNfJBOLlL/8k7/QNimllug1w7DbkGrzoth21oFJ67z3dQzJYivtHq6@lists.infradead.org
X-Gm-Message-State: AOJu0YyfKAHshZdrJe/tIpiF6PHl0UF5HGI3hIpJDzUhIxJ+McrQLTMf
	z/jHSIsUqQKHUefmY69YbmBMa3AG7kb4Zds3RT6QC7MgC4clv3eomURZe3p9qKtbqVzDQDqMbWc
	6b1J28sU6gThPUNeWQII50Rz/7Bu45ZeZ9aFzX2kfTA==
X-Gm-Gg: ASbGncvht9SYBWhi8SXoyIAtvCBJlrqrDKlmfxuVUPYrvoHBKfDsJzwqp28UamrQjG3
	qurxcmw7Kj/8Th8Nn0nmjDYDj5zI9+F9EPqz//7gIDoMlp33ur/ppJXnUdqR1+KClMakAk7C4iX
	7tM5STMjZ9aE76TIbHJlm6ch9UsV+XOueqPXxIZxBfzQykiMCpD7Pp031yKYXKhVIzexwicyLOX
	tQyhb3oBzUD/qLKUYj0ugDSv82n+v7cuW50H4ebLF7qt1rYJg==
X-Google-Smtp-Source: AGHT+IHWxMY/UX5pahdxyPomER2R5wCG7WJNOYIC76WLDnRgZXryLWeY1Ce628zgGwqGftmJqN1QawcJ1KuqTk6lVI8=
X-Received: by 2002:a05:6512:3b12:b0:55f:4f99:f3c9 with SMTP id
 2adb3069b0e04-55f708ec830mr4334057e87.32.1756835411674; Tue, 02 Sep 2025
 10:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-13-bb091daedc52@linaro.org> <aLb_pOG-yc-CHoiY@smile.fi.intel.com>
In-Reply-To: <aLb_pOG-yc-CHoiY@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 19:50:00 +0200
X-Gm-Features: Ac12FXzmJRg8_mGsvbk9kTYEAk6i5wfrx-8rp8gdl4L5LHxLn-6rA1BsDeyDmdo
Message-ID: <CAMRc=Mc-NEFawz11Lr5JGStoe=PU7b91E-MVB3xkdBr_JoiStQ@mail.gmail.com>
Subject: Re: [PATCH v7 13/16] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andriy.shevchenko@intel.com>
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_105013_567818_8CA35785 
X-CRM114-Status: GOOD (  31.69  )
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

On Tue, Sep 2, 2025 at 4:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:22PM +0200, Bartosz Golaszewski wrote:
> >
> > The name of the pin function has no real meaning to pinctrl core and is
> > there only for human readability of device properties. Some pins are
> > muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> > them as GPIOs if they're bound to a devide - even if their function nam=
e
> > explicitly says "gpio". Add a new field to struct pinfunction that
> > allows to pass additional flags to pinctrl core.
>
> Which I disagree with. The pin control _knows_ about itself. If one needs
> to request a pin as GPIO it can be done differently (perhaps with a new,
> special callback or with the existing ones, I need to dive to this).

What? Why? Makes no sense, there already is a function for requesting
a pin as GPIO, it's called pinctrl_gpio_request(). And it's affected
by this series because otherwise we fail as explained in the cover
letter.

> On a brief view this can be done in the same way as valid_mask in GPIO,
> actually this is exactly what should be (re-)used in my opinion here.
>

Except that the valid_mask is very unclear and IMO it's much cleaner
to have a flag for that.

> > While we could go with
> > a boolean "is_gpio" field, a flags field is more future-proof.
>
> This sentence is probably extra in the commit message and can be omitted.
>
> > If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> > to it can be requested as GPIO even on strict pin controllers.
>
> So. this changes the contract between pin control (mux) core and drivers.

Yes, that's allowed in the kernel. The current contract is wrong and
the reason why we can for instance confuse debug UARTs by requesting
its pins as GPIOs from user-space whereas a strict pinmuxer will not
allow it. But to convert pinmuxers to "strict" we need to change the
behavior.

> Why? How is it supposed to work on the really strict controllers, please?
>

Like what I explained several times? You have pins used by a device.
User-space comes around and requests them and fiddles with them and
now the state of your device is undefined/broken. With a strict
pinmuxer user-space will fail to request the pins muxed to a non-GPIO
function.

> > Add a new callback to struct pinmux_ops - function_is_gpio() - that all=
ows
> > pinmux core to inspect a function and see if it's a GPIO one. Provide a
> > generic implementation of this callback.

Bartosz

