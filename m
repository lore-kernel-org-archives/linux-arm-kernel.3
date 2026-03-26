Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0978106F30A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ws3b7nGQYOK1DBD702AysYih0+ywSwzRoWrb12H9ynA=; b=h1jMBUf/5ni164XH5GA7ctf+uC
	epSxyBVd2skACQn+NF7gSZ1CeRyYp2CmFq2yhUDy9ITDyg1WGVb2EmjUDexzs7nzx4Zvo0ebVu85+
	6tQjo9zk+z15wlllL7vC4RMDuQEPZhiHGEPkI5gcC85MY4aORlaTbtWcbVuYWsrfH+bDuxiA0T1C3
	d+GtuOz2p2kczfVA9I+dqnagoVY+9xCC/dlpSmFwjHwlzFsYT9O+dNgj9AFrLHaUr+fofPbtl3nul
	zg0yTKtSOltU7mn+JMboAxxAcM1RFMHJKPzkdLcK4UvqrPE1/qwgtAuKbMlV/7PnQBBwdEwJlSItM
	RYpefvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXE-0000000557D-0DxV;
	Thu, 26 Mar 2026 08:57:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXC-0000000555v-0xp8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:57:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7698742B60
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CC2C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774515465;
	bh=Ws3b7nGQYOK1DBD702AysYih0+ywSwzRoWrb12H9ynA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hrENcQnUCVFut4H2CjFtupt/v5/t8iwY93KKgBCnC9lsEdhsTTIRx8TObUB8ZdV8+
	 1HJDRKOgaBzERjfjUOPA2l3GFBfXVCqf0YBz0ms3FVxCTtVfXoboUk3qRPVMTURaMd
	 2E2FksweraGMeA39MfH/i70+HXHgD3kiBcE+mRqopHmaBNfA1/ERdMNj7C2KE6Nadv
	 /c1248MBHAn5c13p9yoIY6dCyUfLvsruQ0rqghhBpIWjydscdceAXxabAmwIAWxop1
	 ZVWoGCS0D91Qy4cpNM4Pn1TMvNeH5VSe4+AFCX1mXVqC2OJulM6dvgbABzRMROwQ69
	 SpiTYKDrNvbTw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a1443780c4so1603599e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:57:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVhL6gWmuTSRDD8pkx9mAyr6rWBIwnmnhoSb1q9JoCz5+dLMH34aF/RV0BwKDwg3Fgo3RKOd8qkmlGL6kTMsET@lists.infradead.org
X-Gm-Message-State: AOJu0YytvDjYhjRIY+7ZbfEMLDS9QRhJZTjLcoFUAhjufJVe+dDFzGZi
	KPG6+0o2YaEZacN+xZp4atQNzy3nxKMryDwqpwgVxm30kMDKBS5Kk3ZfTKqLvM5+iHnoq8EvxUb
	UoCsUUth6I0P4w7lLg7idwn28MLQQ27M4qoVcN1hhoQ==
X-Received: by 2002:a05:6512:2305:b0:5a2:858a:10f1 with SMTP id
 2adb3069b0e04-5a2a5050bf5mr375160e87.1.1774515464043; Thu, 26 Mar 2026
 01:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
 <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com> <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com> <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
In-Reply-To: <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Mar 2026 09:57:31 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
X-Gm-Features: AQROBzBNLLHxtCNy9V7o0C4AT9cPhp-QyPTFtDSpHSqNAwoCTThHKHlTXbXXZok
Message-ID: <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_015746_305269_98A3D9C7 
X-CRM114-Status: GOOD (  18.83  )
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

On Mon, Mar 16, 2026 at 9:50=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Fri, Mar 6, 2026 at 1:31=E2=80=AFAM Kevin Hilman <khilman@kernel.org> =
wrote:
> >
> > Bartosz Golaszewski <brgl@kernel.org> writes:
> >
> > > On Thu, Feb 12, 2026 at 12:46=E2=80=AFPM Arnd Bergmann <arnd@kernel.o=
rg> wrote:
> > >>
> > >> On Thu, Feb 12, 2026, at 12:25, Bartosz Golaszewski wrote:
> > >> > Currently the board file for Nokia 770 creates dummy software node=
s not
> > >> > attached in any way to the actual GPIO controller devices and uses=
 the
> > >> > fact that GPIOLIB matching swnode's name to the GPIO chip's label =
during
> > >> > software node lookup. This behavior is wrong and we want to remove=
 it.
> > >> > To that end, we need to first convert all existing users to creati=
ng
> > >> > actual fwnode links.
> > >> >
> > >> > Create real software nodes for GPIO controllers on OMAP16xx and
> > >> > reference them from the software nodes in the nokia board file.
> > >> >
> > >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualco=
mm.com>
> > >>
> > >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Aaro, Janusz: Can you please pick it up for v7.1?
> >
> > I can take this via the OMAP tree once I have confirmation from
> > Aaro/Janusz that they've tested.
> >
> > Kevin
>
> Gentle ping.
>
> Bart

Hi again! Any chance we could get this queued? Janusz, Aaro: any objections=
?

Bart

