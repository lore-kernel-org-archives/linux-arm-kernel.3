Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6DBCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVAB3SPxcLA6cClsIyttHLnupSB+I6SCJnu7WODswL8=; b=Hp0XnSCketZDMIAX056SxVImbj
	ps3NTTxFTWIJtxIwZ/g4hsTz7JzrUqjEcodl9PpUpuKDsHKURZHqKyRqTe6ptZ7VAOCpILiX4yGQc
	tMLHmpIdanfom4sit0o5gF4YWt0NBjnoMWmK7QzGGsgB+WlJ0s9Emr45W4ai9k5AT4qiNVSzvhoF0
	8H1nFQIBwiVBDJ/3usDk/Ppj4Cf3hdz+qCNM0nd7Cv5fSXABv6FG4V0TlRuUVPa1EFkoFi8kG0VIo
	TPnpbg/zMTrfOufBZSSEHQVu07TkjygUUBEbtJSFWTDmZHjA6toC5WFFbJemTI475qsSlhNSQve0O
	HCQ6sIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlvi-00000006GF8-2X1Y;
	Wed, 03 Sep 2025 11:45:34 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkog-000000066rV-1UKd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:34:15 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-336ce4a8bfcso27107871fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756895652; x=1757500452; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVAB3SPxcLA6cClsIyttHLnupSB+I6SCJnu7WODswL8=;
        b=JA7UgdpaTgIzJKgcgnZkBooPvwyHORNZScfPe4+UZDxOU16qKinMnWx9XQDv8p3x/5
         0caUiaf12Koc6dEMRR9qezb3QXvnJUxs+6iMGMqTcAqTSmqovz4d6GW7B3OBXGMkDIYM
         KJdiuoGp3HaTrJ8IqnJcafYvfhBa0/W+GNfasM3KMKiLQFxJKVMlRy2xjTtevDgBwiTn
         jORzbUtGqXDtzxqhEnyCrrfxvl8JSdReoqtxgUTZQXPNdAO0UN3IqWVTQr3b2VJ8P2IX
         hpMH8MCFUIIKjlq7TGxk2mEewQjoe4P1+/2TQya3rqMON9Yle5evhJpOMPM2+aG7pBbj
         yDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895652; x=1757500452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVAB3SPxcLA6cClsIyttHLnupSB+I6SCJnu7WODswL8=;
        b=IYPnfQqC80NzOStEGLG5/Zmka/Bq4Gy+RaHHQXR859qWHnWazyDMF0AxVKnfZti4Hi
         7Ti+qYNZPon3zS5Q2UR4CjvN9FUKoGNSjuR7Fs5qmhO7NrYr2MdLhDvldS4M1itSYVQn
         g7er3xV4H6MW87LeiJCpZI9zVawGwGbwkRKTRmYtAM0QXDv1pAxW23KCOrNCmFOahjQo
         zqx2Er4w1Hbju3rXuvP0swp/dANLcxyiALwJOMwYRkT3eF0Kmp6aiNhXwdxR0pGqcs3C
         dMixfPNibU1uDqXkFdApM6om/Io6Tjpachi54SHktqR+cATQ2fT/Eb7uF7Ld45JAwpve
         8dCw==
X-Forwarded-Encrypted: i=1; AJvYcCV0WseIjeIPEloWl7dOCV+nET4Eu3Kr+4Fo2/v6u0pWWjbcgc1djw6NZWHwXxMi569UqYkh4l7On5OMbu5qnIT+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+nvp4nJ0cDkyR6QDGjQxHkG8N2N3pmJ5QCjsMa2qVlpJ8P2ny
	uzHHMW5UVXUpZYrnYQf+ndwiBr0UMVjleFz9CjpsRJNS057xtshop8EfLYZfER/m4gQc+2DeA75
	GwOJsr67H07osfMQ3sNNuZFNbpLvMPt1C+tHRYVcwsQ==
X-Gm-Gg: ASbGncv5H04gux6avQVJfvb80OaYEZHvOt+aNCPE3aGI+KmVkibZF5OArx9w7iofOnR
	HFxuYtl1DHZSebD4YjmWhtcVSxrt9SVzNDxVc/qUsoP0kkd2Q9HMJehvCdmAuOX26DlCADtwphA
	beY1aR2ojyg1TBThUOMFyM4cR+9O1jQNWq/uhKblkZZZ9RZoo6M4EYgD6q7q2CBFCfHR7FxZwyS
	9dZcG6G96VP7XtjRWlM4wtKCzj2k+x0vQeAyQ6KARlnuLKCLQ==
X-Google-Smtp-Source: AGHT+IGoaflavucoSX1WEgopzKKcdrinu9KA/FkcvAd1RueKhs+WVyWiixXNe2xfLOG4W6BWq8swdn67NOOrJeNUBug=
X-Received: by 2002:a05:651c:40d5:b0:336:8fa8:e03c with SMTP id
 38308e7fff4ca-336caf36f96mr24077381fa.31.1756895651781; Wed, 03 Sep 2025
 03:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com> <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
In-Reply-To: <aLgW7J-j4nn0u8uo@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 12:34:00 +0200
X-Gm-Features: Ac12FXzivaaUXd08fTdsNp_v1t2v6QHg93m25vorvolXWMo4UMb6c0rxngkBDGg
Message-ID: <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
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
X-CRM114-CacheID: sfid-20250903_033414_525619_9C71959B 
X-CRM114-Status: GOOD (  21.87  )
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

On Wed, Sep 3, 2025 at 12:22=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > > > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > > > <andriy.shevchenko@intel.com> wrote:
> > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wro=
te:
>
> ...
>
> > > > > > The strict flag in struct pinmux_ops disallows the usage of the=
 same pin
> > > > > > as a GPIO and for another function. Without it, a rouge user-sp=
ace
> > > > > > process with enough privileges (or even a buggy driver) can req=
uest a
> > > > > > used pin as GPIO and drive it, potentially confusing devices or=
 even
> > > > > > crashing the system. Set it globally for all pinctrl-msm users.
> > > > >
> > > > > How does this keep (or allow) I=C2=B2C generic recovery mechanism=
 to work?
> >
> > Anyway, what is your point? I don't think it has any impact on this.
>
> If we have a group of pins that are marked as I=C2=B2C, and we want to us=
e recovery
> via GPIOs, would it be still possible to request as GPIO when controller =
driver
> is in the strict mode?
>

Yes, if you mark that function as a "GPIO" function in the pin
controller driver.

Bartosz

