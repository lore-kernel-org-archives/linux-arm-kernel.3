Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4CC10AB830
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uP+LWbVeH5sme8wy63yLjMro2rk/77AqVdeM7AIlcY=; b=1iVf2uzVWBYf6Cx8/ousFI1RW9
	ER7NxTvaS/HyoasBuCQ22PAnpJ4IKE+CSSny1WXMK2XQs39/lxiKTPYqi1y7GGlTxIeIX0DgKLVvy
	mURnVSxhHefuJJnfoqWoNy5MjKXM60uet47wI8ZSfUH0ACYCQkguxmaeCPy9Z0Om2Fkctqa0/E3Nw
	DV9DV9HpJ0cLWQ/Ayg+CjMHft+w5ywSAwi1ouG1MtV65csQAyJroFOPAjqGgD806589zIPIt0Sq2S
	qZvxcXd9YSJ3hyVTFSTcuU7duLq6mVa85AFbpdI3eH2mTpv2TCD7iLrS7t7q9EkZQcbAJCVNVPvos
	24N8R9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w684y-00000007bO2-01Ae;
	Fri, 27 Mar 2026 14:22:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w684x-00000007bNe-1ncG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:22:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62CBE6012B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 14:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043E2C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774621346;
	bh=4uP+LWbVeH5sme8wy63yLjMro2rk/77AqVdeM7AIlcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MrZoXwfufASZTHClrPyvMAHg+SuRPbLNL5vTEshX0xlxE7T/Ic4So4RfBYK/aSzEb
	 I3NmZEdYeCmX0QzVrFfKKAHLnu4BJ/R5IN213WdpQcxT2ERkAyLB0EJJRziGMQ0bZK
	 lue+A4GwvM+KUdvllO7mdy/eBHK84TzeWm287Zm2E71rvhZzWfK7gTwwzZ9fbiubqo
	 pQLk+Fd1pz49D488kEG8zITMpvUKJ5cI/mQFYici1QgpKoKIbcU8xAcSwG+3leCVVH
	 ZpPIWaNwXD6QwIJi3sTwX/F3tEOYOA31SVaYaoJU+JZIEhHPVhxcrGCFNHYFPojSsu
	 SjK8a5w89vFBQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so22773401fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 07:22:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuf1EHmox1wB4qnL40U0Nv1SvoVMEWoiDHMXfZxriXbYCR9g2+nsVar+s62R52nHdfaDTLCkWFVmEClwx3QNLs@lists.infradead.org
X-Gm-Message-State: AOJu0YzIuvtexLvWgA2ZlkWPjiq8mQQ/vsnNzEZVuf4s7JSsxMfxmhf2
	8Nkr2ksfngn3SdnUQyvweSA17nbODh0rXu8nHIGRTTrPHx+F0MfaxqKwwoGH++2Tx71kC7XwPID
	laKVrmugWX/hBp+Yuc+HHPPOWkACRBfuwjhPKKpEmmQ==
X-Received: by 2002:a2e:a9a3:0:b0:38b:fd3e:c445 with SMTP id
 38308e7fff4ca-38c73065b9fmr9547931fa.3.1774621344588; Fri, 27 Mar 2026
 07:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
 <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com> <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com> <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com> <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi>
In-Reply-To: <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Mar 2026 15:22:12 +0100
X-Gmail-Original-Message-ID: <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
X-Gm-Features: AQROBzAei1HZMdE0m_cEQL4UZSB3RN84tkUjwRNw5_LUz-GA34rIY7vYZzOkmeY
Message-ID: <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Mar 27, 2026 at 3:05=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi=
> wrote:
>
> Hi,
>
> On Thu, Mar 26, 2026 at 09:57:31AM +0100, Bartosz Golaszewski wrote:
> > On Mon, Mar 16, 2026 at 9:50=E2=80=AFAM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> > > On Fri, Mar 6, 2026 at 1:31=E2=80=AFAM Kevin Hilman <khilman@kernel.o=
rg> wrote:
> > > > Bartosz Golaszewski <brgl@kernel.org> writes:
> > > > > On Thu, Feb 12, 2026 at 12:46=E2=80=AFPM Arnd Bergmann <arnd@kern=
el.org> wrote:
> > > > >> On Thu, Feb 12, 2026, at 12:25, Bartosz Golaszewski wrote:
> > > > >> > Currently the board file for Nokia 770 creates dummy software =
nodes not
> > > > >> > attached in any way to the actual GPIO controller devices and =
uses the
> > > > >> > fact that GPIOLIB matching swnode's name to the GPIO chip's la=
bel during
> > > > >> > software node lookup. This behavior is wrong and we want to re=
move it.
> > > > >> > To that end, we need to first convert all existing users to cr=
eating
> > > > >> > actual fwnode links.
> > > > >> >
> > > > >> > Create real software nodes for GPIO controllers on OMAP16xx an=
d
> > > > >> > reference them from the software nodes in the nokia board file=
.
> > > > >> >
> > > > >> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qu=
alcomm.com>
> > > > >>
> > > > >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > > >
> > > > > Aaro, Janusz: Can you please pick it up for v7.1?
> > > >
> > > > I can take this via the OMAP tree once I have confirmation from
> > > > Aaro/Janusz that they've tested.
> >
> > Hi again! Any chance we could get this queued? Janusz, Aaro: any object=
ions?
>
> Unfortunately the patch doesn't work - 770 just dies silently. This
> means that e.g. CBUS GPIOs are not working as those are needed to keep
> the device powered. I'll try to figure out how to debug this...
>
> A.

Hmm, I'm wondering if there's a race with consumers already requesting
the GPIOs after the controller device is registered but before the
software node is added. I'll send a version with software nodes being
registered first, then passes as firmware nodes to the platform device
API before the device is registered.

Bart

