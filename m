Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F45CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olee1rr9nLhphfZIFxDNoMLGLJzNwbgY6TM9tcztPYA=; b=KHY7sMagQkn5pse2sWDwPiVL2b
	gM9dGf38cWA8bbv3vCqQo0vfVAHEa7hSjzlh9EtIjk8OCwqeJjmLWHMahfCJtqcNiX/UXONwewvY4
	g8LLpcLAza25CfwphnF+N0XwgrAmxC5dwL5EZjcPX9F5H9JWFWCjAc7tkig/azxxBxVAoxsR63VuQ
	GjkEuRvUkHVd8hec1Rp5mVXU491YfxrnzjF9hG1Z9cQGOotUYMsz8fmomDucOazCvny/djZ/y5+L0
	6B8/es/s022aTF6Qmv8I4JclcLhao8d3Ge7xEHWeyvAwU7ESp2yQzL3iTyliFVEHkGVafsqqyGiTR
	X+URXpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCwv-0000000HFSM-3zkk;
	Tue, 21 Oct 2025 14:02:53 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCwu-0000000HFRH-1NLe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 14:02:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-57b35e176dbso6947516e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761055370; x=1761660170; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olee1rr9nLhphfZIFxDNoMLGLJzNwbgY6TM9tcztPYA=;
        b=hR6Ke8ptV8e1oc/8lnaOjrXKRTdmyI2LEfrcKH5be1GkW+sAChIc8L5CtRxldAAIQ+
         FkTMz6Wb6VXzM4jgCRwy1y9Td9b41fYBjk2ApgQiIJc6wwQjmW1MsQnV0+MqMzUfzZGd
         V0rZRUh0FXujLINFAZ2ICsejsnW40Yp05pdZ/VMkt+k++4AQhwtX0RrJUxU/5sM/z0h2
         Q+tWPI3kCOABD0s25URkTfFrIhOOdxL3VxWQNaFcxj9UHA3BiFMU5XyaLbz6sn/AFV4O
         D/ZOEeD7r/HR7za1Nj0E6a3SrmXMKHp8znbxswtvJ15WIiXRBl226NLcDqYNiKbxeM1/
         NUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055370; x=1761660170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olee1rr9nLhphfZIFxDNoMLGLJzNwbgY6TM9tcztPYA=;
        b=QcDhFRm222dvX8zCPJ3YnM/X/Dyfw5pl271/NkvgHnX6JRAtKMeebx+QE0Roea5Zr/
         S8dvzWwfTUVKuy+T3GBYFLec9J0ms9opmNHFEovpzOVLcLH1qAWXOrRUGaU+wmmZJcEH
         t/+DwBNkq6nayOISqgFnVdbKhlGz4KGBCCbtU71Hyn6RmQ25POx1EqRomAPNYVwSViU0
         gcWfK54zR5Iyfl3iG51e3U66q/OnNgUEwH3dnK8ilhvHp9kSTED9GbWzferqCE+3xo5q
         yFsjoyieJg0sP+rEBT1um0iHjxGhfCTj7Kahe2cilLc4rq95g4zCpGnx4jXvxONhI2Ru
         orJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKmNG9KO7FaqM3KwFUpcXMJlYcB7OJEDYqn+i1LwieyOnxtsTPbPzqwPstlRigZopUX/AVmz5f64EqQ1M0nAia@lists.infradead.org
X-Gm-Message-State: AOJu0YxJkbgWx6kloAfRokP87lo+ko+CQMG+kxLNCY9AUXVNhxbLdBsh
	S4BaNJZH6pWfiWK8HLj9+KlNPF1nAZISGUC0l1sw10vLih+Z6gS5x1LBdjZVwDoz7sctZWGqqti
	ck3w/kejxt62B7Lt4I2TrNBgzAdxr8VusOheX6BGIDg==
X-Gm-Gg: ASbGnct0EkikZC2+hx/SLuuGRBFn1xNYF7rJJq0ifizsjJ2Tjfo/DJIDYZmwr7GMKOb
	S+MbqK/16Y5Ks4nHp6rrfFQvdhyOU0U1MlQ3aIkB0bCN18SsyXr6hztRJQPO3tU0chbmBvWpW0x
	6VNEDrXjL0V+MOZV71WJJ66qkseJgZu4HVf6cGSDKKMwa4d9HP5lmn2p6oJ3RXgFIy+kKbY/mV+
	Zw6F5FQ4wBs1oPL+FHJWdwM37ETdWEiipuACFUAAfMmyUuFWi9FT+duhQLlk5/g4J7rpeqNuXmc
	EG+8tIibKQwqcjnVEDLyYQz9s6ymvYQKsZcAjA==
X-Google-Smtp-Source: AGHT+IFewnoDUUuQMPn380MpZIQ5EUIM65WgPCeHb7zg5fIb+1IVMdwP1nt9v2GuI358+5/Q2YgeRh0HlDcM36QCm+4=
X-Received: by 2002:a05:6512:3e26:b0:58a:fb2f:4183 with SMTP id
 2adb3069b0e04-591d853547amr4735531e87.27.1761055369735; Tue, 21 Oct 2025
 07:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
 <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
 <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com> <ibdmghl5dg3oda2j5ejp35ydky4xkazewhdvskm7p32vstdegr@36pj32b6dt44>
In-Reply-To: <ibdmghl5dg3oda2j5ejp35ydky4xkazewhdvskm7p32vstdegr@36pj32b6dt44>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 16:02:37 +0200
X-Gm-Features: AS18NWDZ-39d1AWC8agc3FHYO9nz9oO2X5fy-6ifkN2xtLGPNmY9-qcvZ1gXQ8w
Message-ID: <CAMRc=MdmPOHJ2SiO_A4zya3uZH+0VjC=EQKxc7wY3vk56kgMbQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
X-CRM114-CacheID: sfid-20251021_070252_382633_403A7EF3 
X-CRM114-Status: GOOD (  30.38  )
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

On Tue, Oct 21, 2025 at 2:53=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Tue, Oct 21, 2025 at 02:22:46PM +0200, Bartosz Golaszewski wrote:
> > On Tue, Oct 21, 2025 at 2:20=E2=80=AFPM Manivannan Sadhasivam <mani@ker=
nel.org> wrote:
> > >
> > > >
> > > > And with the implementation this series proposes it would mean that
> > > > the perst signal will go high after the first endpoint pwrctl drive=
r
> > > > sets it to high and only go down once the last driver sets it to lo=
w.
> > > > The only thing I'm not sure about is the synchronization between th=
e
> > > > endpoints - how do we wait for all of them to be powered-up before
> > > > calling the last gpiod_set_value()?
> > > >
> > >
> > > That will be handled by the pwrctrl core. Not today, but in the comin=
g days.
> > >
> >
> > But is this the right approach or are you doing it this way *because*
> > there's no support for enable-counted GPIOs as of yet?
> >
>
> This is the right approach since as of today, pwrctrl core scans the bus,=
 tries
> to probe the pwrctrl driver (if one exists for the device to be scanned),=
 powers
> it ON, and deasserts the PERST#. If the device is a PCI bridge/switch, th=
en the
> devices underneath the downstream bus will only be powered ON after the f=
urther
> rescan of the downstream bus. But the pwrctrl drivers for those devices m=
ight
> get loaded at any time (even after the bus rescan).
>
> This causes several issues with the PCI core as this behavior sort of emu=
lates
> the PCI hot-plug (devices showing up at random times after bus scan). If =
the
> upstream PCI bridge/switch is not hot-plug capable, then the devices that=
 were
> showing up later will fail to enumerate due to lack of resources. The fai=
lure
> is due to PCI core limiting the resources for non hot-plug PCI bridges as=
 it
> doesn't expect the devices to show up later in the downstream port.
>
> One way to fix this issue is by making sure all the pwrctrl capable devic=
es
> underneath a PCI bridge getting probed, powered ON, and finally deasserti=
ng the
> PERST# for each one of them. If the PERST# happens to be shared, it will =
be
> deasserted once at the last. And this order has to be ensured by the pwrc=
trl
> core irrespective of the shared PERST#.
>

Ok, makes sense. In that case this series probably doesn't affect your
work or PCI in general.

Bartosz

