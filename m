Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA10CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPSwHXJiuPboMvGmzdZl86YoheXT2JJemMGGCNbTXh4=; b=hLg5PWh53Zx29GK7hMNpMN5Blk
	9ysm5Dsflj09P+3Ev7hj4Ytx4g8G2XCUt2RmdfyS1KmSy1gjVJxlZruDhmOszHfhsGrVSCv3HhVKz
	kSedMs7rPghShljFXL0PBzdWx2OP5oNZld9L/uZDILUFQa7oY0CLom/Pjc72ZjVdyPJGBdAkSA5uH
	yiCBrhDRGPZDRoehYFRU5BiP5YBSwGAK2q6w115BKJ0T0jw6hB7OrCr58bcvAPNwn1Q5WAm8RyhRR
	BPxMrZt5DU+1ZJOkcCcs7h+2dSUn3z7puIbPVQBauWrLHBNifxnWU3Bw+qWMhIpo0vwVWyw2wS8he
	Z8oo7T6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogRx-0000000DFbR-3Q5W;
	Wed, 20 Aug 2025 10:53:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofbY-0000000D43f-0Bso;
	Wed, 20 Aug 2025 09:59:41 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso896843666b.3;
        Wed, 20 Aug 2025 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755683978; x=1756288778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPSwHXJiuPboMvGmzdZl86YoheXT2JJemMGGCNbTXh4=;
        b=YzN27j+V4ME6RNAJ7ZeGQBnfIQr0jjrG0tL9u60PgF/us/B/VoEmj5gayw6s+0LPCr
         vKpr6OctWqH3uoIfznnAwRCEaKvpYvLny01rcOxOTn+klP6QkA+XiTJv9YIvpPblXow3
         v3EO98Qr6bVg2Qq0/snDGqQfwS6nHYSvedrBUPRrvYMZ8J88vGm/V9AJq1NBUyK8cBFP
         HGCmHrQzJ3PDdpXvw8nu5cb9jfKJkCEhKKlrb7Jk9COujVrd0P8ilE6yLte0ibeyHP8V
         hcUV/Hmkh0j9tcMg+/nGqqVsx0kfwegc/rDkZXKo9VygQLkF6WNMeKIm7IdXvpaMvAxg
         /dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755683978; x=1756288778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPSwHXJiuPboMvGmzdZl86YoheXT2JJemMGGCNbTXh4=;
        b=J2czjpinbJFwyxVDXigTYWQMmh3xRcC/NwJ2Ismm2hi+6Le4PewLWwhMjJJRTsL/i+
         Iw31ISM0yXMsdNWgk95LChRdeIZssgJK4u5CON/KrQXGoITSg6L5Oc8N9DwBGBMtihXq
         YifNmGybJvjmZWFw3QmMeaytCV1I3mjYEMv9w52djW41uBDPcXE/PTbTBFFKf+Agu0SJ
         atJf3wAWA5/gmdBHx0UOarpxpPaCD3DP+SD0+pGrr8rvLqr+9kkW4jCs0Nl0oAh/sNYH
         chpW145V8cTLNwkl9yXk4egRLMGG7honHFMbOm+wVrq/TQZjZQBNhpTsWJVCKBeQPkXy
         G1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVxtljx7XUC8SzgqU61QoHEaIrjArUMpYS5ZwxGCk2Y1+HYzSR91awJ9rp5chXlhiSun6HTqtNxSFmQWsDpOHr9@lists.infradead.org, AJvYcCXgJ5MjRXzARG5FS1i2N7J+6tqDi0AnEJ/VTj/IAKH/LpRKzl0QTZjNvBh60FGFMOfLuAcobpP8G0U8F4W7yEA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFRJ1gjisrbL0EEftLAsX1uL/GIDOCYDJl4Rjn5Ml50tDCEkrc
	HnE9KEQqTySzydkjr07Veikf8sDFnT/sHwKI3uf5uj7ghrGjTaPQErl7I5yEjabyHbS72zB2fJr
	KKM8F4g3VsVQNJoAyeVQQCDCoQO6D/hc891nHG80=
X-Gm-Gg: ASbGncumxYCfGWFgoKOX36otxJp18qjugxMz+5QmIF6tIhTQKMKtkuNarZFp0Fb935M
	pcYwJnnf7u1WZowRfXhZ1wUYYyev8jBZIGEMf/PXyM1TGrSS5o6to2ImzVZKJ6aNGEg6MObW/e+
	ZifykSH02K42h+N3CPk5465n3bU+DdQXYOnYeecpXnxehput4MfKbG3MzvUiiSYr9AtoATC9TmO
	AO2yUNXkw==
X-Google-Smtp-Source: AGHT+IFLILsumUxXGG8Le22U8VXLfiB3UImn/sKCUBHCwulcrWRoCPLLCjJAWxmPAx6D8QUNkGdtQmpTps7zJUlvWzY=
X-Received: by 2002:a17:906:fe01:b0:ae8:fd2d:44b8 with SMTP id
 a640c23a62f3a-afdf00e1d0amr167565066b.29.1755683978222; Wed, 20 Aug 2025
 02:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com> <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
In-Reply-To: <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 20 Aug 2025 12:59:01 +0300
X-Gm-Features: Ac12FXycXziPzAbLNx1s7hMXfLqQ2mmNzJaOepqBGK1kK3uBfF-tyE-7OZscDUk
Message-ID: <CAHp75VfNhBrukJ46ahY77La5Ywkeu1xiC_eUbUj99ZQcderHbw@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_025940_083939_A5495410 
X-CRM114-Status: GOOD (  21.28  )
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

On Wed, Aug 20, 2025 at 10:13=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> On Tue, Aug 19, 2025 at 8:31=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Aug 19, 2025 at 4:02=E2=80=AFPM Linus Walleij <linus.walleij@li=
naro.org> wrote:
> > > On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:

...

> > > >       devres: provide devm_kmemdup_const()
> > > >       pinctrl: ingenic: use struct pinfunction instead of struct fu=
nction_desc
> > > >       pinctrl: airoha: replace struct function_desc with struct pin=
function
> > > >       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
> > > >       pinctrl: mediatek: moore: replace struct function_desc with s=
truct pinfunction
> > > >       pinctrl: imx: don't access the pin function radix tree direct=
ly
> > > >       pinctrl: keembay: release allocated memory in detach path
> > > >       pinctrl: keembay: use a dedicated structure for the pinfuncti=
on description
> > > >       pinctrl: constify pinmux_generic_get_function()

At least the above I'm pretty much okay with. Can you still have them
being applied?

> > > >       pinctrl: make struct pinfunction a pointer in struct function=
_desc
> > > >       pinctrl: qcom: use generic pin function helpers
> > > >       pinctrl: allow to mark pin functions as requestable GPIOs
> > >
> > > I applied these 12 patches as a starter so they can
> > > stabilize in linux-next.
> >
> > Hmm... I'm still sure that we don't need to have a separate flags
> > field, but since I am on vacation and will be able to look at this
> > closer next week, I can't look closer to it.
>
> The qualcomm 32bit platforms fail in next anyway so I dropped the patches
> for now.
>
> Both you and Bartosz are on vacation so let's let it rest for a week or t=
wo.

I will be available fully next week.

--=20
With Best Regards,
Andy Shevchenko

