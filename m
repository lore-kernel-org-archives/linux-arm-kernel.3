Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B693ECA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=; b=LiorwYwU6tDddR3MWYb9Y4ePvA
	RDzltELMhtW95OtCALQzMQnovdEEiGBRpoiuY/HVFOG6wIcCzSmijacDMk9orOjTYQWqreeLYkZxg
	AsMUonk0uhoUuhXayqyq5Ip+mHXR+h6MN+FCIdOXaI1jfrdiD4h9EI/tuQdYe6PZfzR3/PMeb+r4w
	Cc4o4XQxjzIPbuwvdupk/zfWblaGRIBSGphnyMCV88CRw54mT+7KUitK/JcU5/EStB8+jxKp7JSnH
	2Z39E0oL0KROP5cCyDVgFn9hRkPaE7+buATkf5B3Qzv2DEOxIneL0a65XAZ7TFk04BGG2SmRBb2b0
	CGJqtA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiSZ-00000005NLV-2SyE;
	Wed, 03 Sep 2025 08:03:15 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti04-000000058Y0-1NFC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:33:50 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-337e714b3b4so16052371fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756884826; x=1757489626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=;
        b=to/mP2IqkPaLzuyWnJid4pdOwfvSWPQialH98vnEHCwFh1L1sY0ZuOqHhHxycS1PW3
         P4YwQq/+X6SR9rs5GQKSHuJYM7A5uIlEbUBtZ6i+AEVbr6nWR9gfmNW8UH8eJ2ueJd4v
         3w1mUnzD1QGov5qBItHknOhNdt/BmPCiVWKP7m+0267awnECDBaq5V2t20wS/ac0LekG
         qJYMu/KPdEJw3ht3+Ks/CjwsNFMiLxbXH7YPI2mmbnvYmsx1aZXvWPgQ4PpeaOUKAQKP
         ZHidbEF4UkWAfjJGhtEC40jIrQSxQZjexMXfE9ggKUqD5I0uyQLH5GKHeBlukpCFmv9T
         pY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884826; x=1757489626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=;
        b=Dh7AbtFFNXBFtNpTm0rVfO9tDU3qnpedIS3cwqSWNb32CchCSRLw2+xiHYvkQfyyin
         I4wJ3xpgyhaY5CsNZkYUnhgB9ddiXEFDhCLVc+BWC4IQRnCtqdADBieAitVwXbGkKIH9
         lg2bPBC280UTpPHOsBMUZv4qIxZoHshow7ZXpHL+WL+nUjB3Sq3IMmeti6/XWegHbJpq
         VXsZG3h50vBW6JMNia7ZmIu7QlylVaQfflKQQSFGGSMpuOcW4mYZAdonBGpgAPTGD74u
         hasMlMxyw00X25qaU1wWdz6MFjb9kZpV1vXXUV2EImLMXS7+F8v0zmMYuYtE4FCvReAS
         FknQ==
X-Forwarded-Encrypted: i=1; AJvYcCVULybKYl7UliztfQtgkHkmJMuQW7NoSvWgGjjk8mSObPsXcIWFKDauIzQp2M2EaS7LR191VzTGVyDL918vrd/B@lists.infradead.org
X-Gm-Message-State: AOJu0YwgSF+zmqHqp9w9LzQa4GQWcjMQgurA74fpIu24e3OEuJSAMe0V
	QWEMtUP8+I9W4++gC8spqiZtKvuhHJ814FjI1OdWHcCSJ47NOrKs9L2jHOPX6EPOS9mce27E1Zx
	QXd6an+iZaJxJJUDom0aCTRqRTrsh8NN6g2QltwW0yw==
X-Gm-Gg: ASbGncus0EIl/Q8E4CyWcvPKc0AArWMmZTnIvOS3KJS83JU5uYmVln81cZscljnaGj8
	sG296xSuVe+JrlZgBFse9cjKZ/r0aCS4d45yhynqOtvy5R6S3Z9p5Y7VyvMwPobZSw/ZWpNTsbc
	8ZQ4RyFFvKMsYWv77bbSIJP1VFY6iDo3i9TtWogixWLPPXqQt/ufh7L6ePTpykVTVCuCh8Wj5WA
	MEq8LIOTvZVeFRanD9gcfODp454I9T0oXumIcMW0IOpzKc+pw==
X-Google-Smtp-Source: AGHT+IHQMDojBvXdcYFr83Du1enPEHK0Ti//rRC94x6rK+6MbJgsPNbFLU1zOeSW5BOM5GJv9hHYWvwxYnse2nh/rU8=
X-Received: by 2002:a2e:a58a:0:b0:337:9e3b:895f with SMTP id
 38308e7fff4ca-3379e3b9b47mr24730131fa.0.1756884826262; Wed, 03 Sep 2025
 00:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
In-Reply-To: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 09:33:34 +0200
X-Gm-Features: Ac12FXwfTFesdkv2AsVGJLh1I6xBKdxxPYffotwRnf3CookQp3k-WXkxYMLzaTo
Message-ID: <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_003348_548643_9D8517C8 
X-CRM114-Status: GOOD (  20.96  )
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

On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The strict flag in struct pinmux_ops disallows the usage of the sam=
e pin
> > > > as a GPIO and for another function. Without it, a rouge user-space
> > > > process with enough privileges (or even a buggy driver) can request=
 a
> > > > used pin as GPIO and drive it, potentially confusing devices or eve=
n
> > > > crashing the system. Set it globally for all pinctrl-msm users.
> > >
> > > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism t=
o work?
> >
> > What even is the "generic recovery mechanism"? That's the first time
> > I'm hearing this name.
>
> "I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=
=B2C keyword).
>

For some reason it was displayed like that[1] in my client. I see it's
correct in lore though.

Anyway, what is your point? I don't think it has any impact on this.

Bartosz

[1] https://postimg.cc/7GFtxzzR

