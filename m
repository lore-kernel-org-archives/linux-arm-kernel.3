Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F8BCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmZzYFeRtHhCTqoukOzpWHGqKe1b+6GRRn1Jw/JtbH8=; b=GX8vbcudSijmWi/BAXlA1kZn2O
	QKBEfUFwSk2Jpo5fRNFRllT98V/+0DixhxY600CxTUB0qua+bVTKwvUoGQSE6/NtI2BbipBflNwLg
	cSj9dwEOd9V7ejPYwPAdKb7QtgvENTDGwIDQ6QeFnrrLwEm0EW//skoWdAAZ5J62zi03lYL25GPBx
	o/8G98njFQ+8iolgmUE520AiV4UAWITI70S1pchAVgPfTkskG63Q+Xa7z3XZ1frwuUEJckzgV6pSh
	p5papMx4wi1NcBCUrd0hH1LL8OzLnXapIiIVYIF5JdibXWc1PbNj7P0igA4P8XtdQFEEV3T/61f2X
	m3FBGWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgQm-00000002WQG-2rvH;
	Thu, 28 Aug 2025 17:29:00 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ureCW-000000022OI-48Uh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 15:06:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55f39a5e85dso1196405e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756393567; x=1756998367; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmZzYFeRtHhCTqoukOzpWHGqKe1b+6GRRn1Jw/JtbH8=;
        b=F5htl56qHWjwrz6pf1wV+7cuz0rmNKSLHmQmPwfmpELPzCeFeszixF8krzrt7U/XHS
         5YlVQOgIVFXqMPhqWhRgTGtfH91M36jprozMP0vMoT1FRIkzdad/Je4JDEBhPxKBg8zg
         VdvuUzXfDIKDChyJarXmwc43bqLCgDFyCqLzxiOubaLkMTe/xRfWfSBLv94Z0Q5+KF1q
         SLHw7Vsy3tHkQZkyyJqK2dsvJATSpAcE3hXUCujJlhJlcULBkylRh5Wl9R92reE3zRNg
         xidwN9a1OXPaEnCeDfdqm80Vh9wsR+HiCLiwQ0hzbKKJyrAoTMegzWZNr+2A3r+Lxg5d
         cqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393567; x=1756998367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmZzYFeRtHhCTqoukOzpWHGqKe1b+6GRRn1Jw/JtbH8=;
        b=H5GkCKP/n5GcPPiVeNmo8IToDOsBW16WIhgH+ZduYDaidoKUjayTCuJvgzV9yOV/Rw
         4AEWOxiCaxVevpbnw+4oZeX/TRGTsdRbj53XBhUroDdcOLsjo1YqzscJilUhklXMrbd/
         dwpYl9MXuQWe/NhrqkmPg7gMN3Zw9ajlUmEAPO+877LAAkHIsbh//c1FnBqSgQZZJOYW
         Rb3Rxvb4CCe1mTgu8EKjXQH2V11NY85GjEsvBnvDyXdg7CNvIMDjFu1ejG/OC/I9+LDc
         Lm/ySYmy1w5VRYgdzWHSFLbC1gdHCfimVmRkNWUDcV6yZuadcHMmwfZtWI1A8uzGBmTh
         PJHA==
X-Forwarded-Encrypted: i=1; AJvYcCXmoTJbV3dbFs9tRyWa7QExBV8UqHpgf72uuBNMu7DO4rsjgoCPS23VpA89Mw//4bXmHZ6V9OykeZc0JTP9AOgJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxaBdrQ6Y5hsLwEfU3VPF3FRDuyVCKOOMFC0F4RDrsQVcSUssjH
	QtX0+NoYfJTeIRBdSU7lUwrUp8Z6OBJetgmBhqRZ8b+3tn6GKOJyaU0v2wtlcfbDVWRLFbZo19f
	9kTiJ9kz9Ay7SylQon3hWYtR1Y9xrlgQPJ28jH8A2Vw==
X-Gm-Gg: ASbGncsa1IrzVjc3He7qZUjtNLpW3j/lZ1b55SSTWcishIWeS9g0Nn9Ijzmezr3VfMY
	RPahCoAAnY15Aylxjf49MiYoHWpKxrLXZNYl3fWXa4m+qaveJOpp+e6CoVL3gl4A6dMgU3zU1Ge
	ahi+ctyLLBW/RfQyPbRSJfzULidFLMR5fhOSCRfFDRSV0VrZtyDRfbjoB1DKQTb+71XSGcuwmwK
	9xBLAB450JeWErqh+XPp9GryMcej83mm6jFJ4fMCv7ske2XIw==
X-Google-Smtp-Source: AGHT+IE3iToga29hoCNxE0T8DagXuUfkGuMta1TYBW4jpnncy+JoEDrvVPvrustOmHcaLq8T48+IshbcHhnVTj991MY=
X-Received: by 2002:a05:6512:a94:b0:55f:5704:806d with SMTP id
 2adb3069b0e04-55f570486bdmr2169702e87.21.1756393566910; Thu, 28 Aug 2025
 08:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com>
 <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
 <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
 <534ad082-08fa-42c0-9c24-f0c11af7d5b2@sirena.org.uk> <CAMRc=Mdn0_yPXyYq4sbvH4P9-h71vEc4arLPBfSk1PiEFaB7jQ@mail.gmail.com>
 <1804d9dc-8814-47d4-af88-c819c3f17bc0@sirena.org.uk> <CAMRc=MdKgqa+vjhHvD2+Tjw5NwBtFv-0aUivi5UuEQd+n4KxmA@mail.gmail.com>
 <aLAYoDyz8Xie4Dhb@finisterre.sirena.org.uk> <CAMRc=Mdd3fmKjFAfbUB-AAhx-5_CR+c7f36pePkF1k_2LDoORw@mail.gmail.com>
 <aLBggd4rGHV_5zQ7@finisterre.sirena.org.uk>
In-Reply-To: <aLBggd4rGHV_5zQ7@finisterre.sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 17:05:55 +0200
X-Gm-Features: Ac12FXx5n8TdDo5k-Gc9YU8HcEZiyD1aufJb5T8PdE3CuzVh_XFc9j0GLQlkpOM
Message-ID: <CAMRc=MdgorsPpkkRF9amVhqPgzb5QBwFY87K-fZ04gONAkGCTQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
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
X-CRM114-CacheID: sfid-20250828_080609_130391_715B580B 
X-CRM114-Status: GOOD (  17.80  )
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

On Thu, Aug 28, 2025 at 3:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Aug 28, 2025 at 03:36:43PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 28, 2025 at 10:51=E2=80=AFAM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > It's failing prior to putting any output on the console.  I was also
> > > seeing an issue on i.MX6 so it might be all i.MX boards, same issue:
>
> > >    https://lava.sirena.org.uk/scheduler/job/1697667
>
> > > so it's possibly all the i.MX platforms failing.
>
> > Not even with earlycon? That's weird. There are no smatch warnings on
> > this patch and I can't see anything obviously wrong upon visual
> > inspection. I fixed all other issues but this one I can't test. :(
>
> This looks like it has something:
>
>    https://lava.sirena.org.uk/scheduler/job/1747304

Ah, now I see it, I confused two radix trees used in pinctrl with this
change. Cooking up a fix.

Thanks!
Bart

