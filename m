Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD78CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nduGwRgCS4jl5SzExLMSPPD9EivCrI3lCOm2UzUncAk=; b=I/dsB5GFA//2PjEYABHC+yjBxC
	Zta6e9fy4WlgU2r83NVFzAiUyUo9OvqxHMmJB9lAuDrQG9IEpSiip/dL02hZAyOfb75B9Yhc8Gk58
	WqDZ69IfkHfcPMblPebALueAUsW/mAI+6oP9TgwxbTl19ofyXjBZp4wqWxXmo5gURUdZcDjXnbcnY
	7PtRfU62IFQdR7Yk4PMeZSuTn+nrjMrDB6LBks5mQUHAtOIvkCfNowtnycf24ndwKLD+NZSlZnTOx
	QcIei3GHa9JQnqhfcMQSRawCRaCosHTsK6TOk3X1F9+ch2TUDjG9v1T/qTHds7SJkG1qiKIN1LUt/
	cb5C/C0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAP-0000000BYqz-48Vm;
	Tue, 19 Aug 2025 20:42:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR7k-0000000BJ6u-28bB;
	Tue, 19 Aug 2025 18:31:57 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb78d5dcbso797311266b.1;
        Tue, 19 Aug 2025 11:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755628315; x=1756233115; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nduGwRgCS4jl5SzExLMSPPD9EivCrI3lCOm2UzUncAk=;
        b=IyhBVW3i1f9UP5V1Wl0ZTNNpO61ceNl0MOrgm4tJGlK52wGPPhq7fcvN+PJdYUrcEi
         r4WXLWOLjOMOm1Qlz1bpSIAUm9Dj47Gjk7Bk9qJpVdKD9TTQ+bNw1N3HmkVL27mTOcLJ
         MTYdWTz2x2cU0ujmr3OF2bbwmHGRJ7gsIgn//rPvU0RXybqUKWyQ4eFZpenAylh4s9Is
         pgJ6qM/jUwkC4j1x4rrZP1UDYMSssySiaQOumu9tJGmkdVKETLAyrAlNRnWD6Pl4af8F
         rJdxDEgxxactL9fw4tv+VbNzskovs9eIe+kZu7iNOkIP5CDQMHlNZCRIKZA/WwSsFEKd
         0Qyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628315; x=1756233115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nduGwRgCS4jl5SzExLMSPPD9EivCrI3lCOm2UzUncAk=;
        b=D5sQV2nwAH+Ubvt5VVQffG6XP0eQFr1w2C1i9GuSFlM8RP9PXkpZdv/EzU6D+uOOQz
         w0VCjmotZGES6mwij21iiiSXr7n0GM/9q7apvdoTBwFIJyXikpZO6zX3Ro21bZAQWLYZ
         Gd3LUXU+l9QxuLAwid4zkp+t/R+Vj5Mk2891cSVwp0ZGnQ+vXjgivodMYRhwn5flIrTa
         NR0btNqnR7N//fUw0AsRuYLeNB9crDjd7F9K7Myz+DlYnGGfy7HYYH6YF6Fgp4pa+st4
         7fyQ6S+Jv1yblug80Q6BemwWn0LTJlYbpL8QFN0GcLHW99m/GTpjPOdaA1uacd1haJk9
         WveQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCv8lzmHeOaU3TomQZuQlZUFMEoH46OGJT09LE2x0UF9BzblPLXAwpjgVJ7/LPHQznS/75zJBZppiMuvB7+5Q=@lists.infradead.org, AJvYcCXqVKDcqHr/bNlQAcR3jhsDNnJI/DRrH5zThoU6fi4u2ZTxNNURyV1iJKfmGZLUG5QxQTgBNApJCXEaznkSc5TV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7W+bw4RAzTpoMV713B43UiTW/98NEUm1tP2wcU0FoUTBfJCDY
	MICzA528H1ahg6REPjFmv96m2nhapGl3jDjsahKYF473myJgYLniNthUo0VOXDagdZ5XQtP2dY1
	9OrRgiHvm21Uy8KVGSwF8UwwpJZQ/D2Q=
X-Gm-Gg: ASbGncu07IARiGX/hWaWxpiWoO6ahcuZ13Z9p24xbDWWftFNWBCKhkPcApeY9h0V2cm
	UxIDKgr2dQrutKce6p8oLoxpl2Qe4KtmXttJKjfWnSSjtUQsw5rbXKsf38xUk2n7uqXjosIGKcu
	Qsc30SNWRKlLfhGBcCkBC9jooBzJGiuhr13ZRRw2wkGYPvH5NWVxkjrd5G3ThTOReqOADMRh1Be
	0H5ja0=
X-Google-Smtp-Source: AGHT+IF9qpemszLCjKdTIPsWz0t4GcsgIaQduXYK/rUO4127Ry+Cx5d3EXzVvEU87daLwDxw0y5nugBK0Rk2QA9qZjg=
X-Received: by 2002:a17:906:dc8d:b0:af9:1be8:c2aa with SMTP id
 a640c23a62f3a-afddd1e42e4mr344769166b.45.1755628314808; Tue, 19 Aug 2025
 11:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org> <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
In-Reply-To: <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Aug 2025 21:31:17 +0300
X-Gm-Features: Ac12FXzsYRtjNObv84CHy6T-R0DRBoqbq7I0xmmsDobIVB43mAqIdnnlLv2k1FE
Message-ID: <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250819_113156_550002_7F0E65C6 
X-CRM114-Status: GOOD (  14.86  )
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

On Tue, Aug 19, 2025 at 4:02=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:

...

> >       devres: provide devm_kmemdup_const()
> >       pinctrl: ingenic: use struct pinfunction instead of struct functi=
on_desc
> >       pinctrl: airoha: replace struct function_desc with struct pinfunc=
tion
> >       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
> >       pinctrl: mediatek: moore: replace struct function_desc with struc=
t pinfunction
> >       pinctrl: imx: don't access the pin function radix tree directly
> >       pinctrl: keembay: release allocated memory in detach path
> >       pinctrl: keembay: use a dedicated structure for the pinfunction d=
escription
> >       pinctrl: constify pinmux_generic_get_function()
> >       pinctrl: make struct pinfunction a pointer in struct function_des=
c
> >       pinctrl: qcom: use generic pin function helpers
> >       pinctrl: allow to mark pin functions as requestable GPIOs
>
> I applied these 12 patches as a starter so they can
> stabilize in linux-next.

Hmm... I'm still sure that we don't need to have a separate flags
field, but since I am on vacation and will be able to look at this
closer next week, I can't look closer to it.


--=20
With Best Regards,
Andy Shevchenko

