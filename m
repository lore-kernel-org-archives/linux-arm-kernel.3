Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27975CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=; b=tF3hkw8UtsiHXZKHHCOKube9Ih
	DD4HLGD7OJowDWQE2cxhoiZSELU0zgDi7nNFCydJnpg9uAHqjstV5gGCDA0Tc6zzPzhPcLKj/7WAZ
	6zS89Gxe4CoXAY7obUWHwmsdY2h1aEPU7gfJrx5OzIBzDIkW1Rdko0X0MGB5bg36AINYrrvLIJprP
	bHQVexqMR1xvkWKExwQexJ8+VKugX/ao07ZN8spJ9NtZ1jsJEg9/83KHN798fYhAeqDNluKmyCxSj
	EBDix1uxOdDvs405KHZJQqWs1QciOPZ68i2iog5WYe6iDS/iM+Bksw0YfMdyVBUBc7rsm2ngHYttC
	O2IQW3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWPg-00000001cMt-30eQ;
	Tue, 02 Sep 2025 19:11:28 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utR7h-000000004M2-1MEa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:32:34 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so3016137e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819951; x=1757424751; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=;
        b=bIb99jIuxGXypJjtjjxkpWiXAZWKZzS06y++fmfh7HYtxnymNvWCXHr2XvQKdsXvN6
         2oqm4cBOn0uROyyi7cvdGJA23zD+/yqwfSl68WHHCKwcdl+wPUC0S+9NCJ+Yq6NVHCD7
         rIBFE8mbIPPoeXa6GKy7jGlXCFIQH3Blu1A9VYsEUEQT+BcIsLEKo2Egu2O2JeRq7QJQ
         +PEyjlQWvXsHBi4IY9xERzwt99La+llVlQyh+acGeHR8QY/5cUkD2fXCoNX0lToP2ktC
         j4j4dvmec6IaiJlFO3oEiouCvEz1loKoLM2z8mQDiqVHc+jmygLu6CU5B+mquaqBjRPa
         kBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819951; x=1757424751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnoH1+ZsxBYCzbeJtuEiwBsgC/lAs0DmEqE9uy46sWE=;
        b=VXA3nGuJoyQ5/Eq0rDPCIgXI6qRpTm1VBsomY4wQdsmVaWpL+un/mj2qOexaK+EbRL
         kkzf408psT5S0m+UC1CE6Rg9JL5esA1RVb9DzXePjYAXQPybt2w5XL68EVd6Mu79i2oJ
         VZS7lalH6wr+KoyXK8p5k/FRp8xZEBqktpzuuFGPswqS6F2n0BshlBQ+lF3flGUE6E1F
         nwpw75jbc4ZGjgVh0YLhHJ7f3pBkQJI7iYnEnfZX3NDlpm0ooTn8VNL8SaGZfrxUoLBz
         jFlvPtQzeoki0QHBsUnR16Jwaaqr4/PZ7j8nV3yHKeohZdXI5ZgZMeWnjCT760mk++mL
         xeGw==
X-Forwarded-Encrypted: i=1; AJvYcCWlxUO47mDwlPDkO9vQ9W9nPzy6NdOtjcVKC7KVGyOZdx0BxSHibb2AehsNz3p3S3/PjMZFS8Sm2AV+AHKArh4N@lists.infradead.org
X-Gm-Message-State: AOJu0YyCKzNqumIiCGUEHdXvj22cUQWAII0/Wvu0J3UC6QEqKbE9ifJZ
	Hv/olbn3Ni3bdHrvam5CPgZ5pPyh7lbBkYgFcxa0vZ5SsQsboMV2grDv7el73wAUZeiiZBmpHEq
	WNAKXqTebd7EbGYXAQbEyfS9Nza7E+xVAtVC5ECt+xQ==
X-Gm-Gg: ASbGnctx/0okHnDMrB7Va9UCmrRFnHxBdIEpY8/j8hhtizrCVEpbk/d51RY0SkCIFgD
	97XjbKapC2+eXK+DzQAG4wF8h9NdXs7+0rMbIL/GKamqrrDfqrfpfiI5QEXQIZSucCT2401O9IQ
	EuuQ5lFeJn1PbvnOib8wjmSWFbYlI8dFoNAyBjIVufKo0mQmVxgsOFKWI9WRv2/jQl3W9SQz75Y
	SSg53vaJVSREqaMkJEXeUqOVmC+oaDD5QINcdo=
X-Google-Smtp-Source: AGHT+IHbC8qI4AC5+0YZNljCnPe19ZYxRaps+B2CcXld1o2mGtDbXzoveQoI0IeEbDNxVlYlEUG/+tn7nGWqsyLzmeE=
X-Received: by 2002:a05:6512:3ca9:b0:55f:55ad:2263 with SMTP id
 2adb3069b0e04-55f708b6c5bmr4286185e87.16.1756819949961; Tue, 02 Sep 2025
 06:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-12-bb091daedc52@linaro.org> <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
In-Reply-To: <aLbt2euqYQM5xXuZ@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:32:18 +0200
X-Gm-Features: Ac12FXySKFnql5rdsxfRBFF-2EejY2a696V_6zV_jaWq_9WtZl4uQNoHEj4w7YY
Message-ID: <CAMRc=Mdnp8T46Gi_xZintgc9AZGCGiRPYc9mR32Xwodxy7DLqw@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] pinctrl: qcom: use generic pin function helpers
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_063233_363634_8EFBD342 
X-CRM114-Status: GOOD (  17.91  )
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

On Tue, Sep 2, 2025 at 3:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:21PM +0200, Bartosz Golaszewski wrote:
> >
> > With the pinmux core no longer duplicating memory used to store the
> > struct pinfunction objects in .rodata, we can now use the existing
> > infrastructure for storing and looking up pin functions in qualcomm
> > drivers. Remove hand-crafted callbacks.
>
> ...
>
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
>
> Why not simply
>
>                 if (ret)
>
> > +                     return ret;
> > +     }

Because it returns a possibly positive selector number.

Bart

