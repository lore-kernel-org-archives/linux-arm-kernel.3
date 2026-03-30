Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CCA10D14A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHtCIKj55eWGE7GRtpfrjZZg4gF/iBOryNVSD/NH+Mo=; b=kA1scSd6y/Iqy9mYmEx1x+7Oxb
	lEPquI+NeuxJ/URuekP3fH7lMUPujewtbyRo8fHozjftpsQ+yWG/W5CShkiddLC0UABCaxEDUm9ye
	YZjaNledsC6HP5BsokCUIQ0dlWTup/WO0v7atBIDWD3g6lsm0qqYTPS30VyD5X0/M38xCERB30tI4
	kncQef16jfV2E2bPv2VZt/Uw8ExWDCPw7ZV66vJC0ZadEIfZadbZ5QSzMgdMOMhr8Szouhfw5mInE
	gEyYHNUNLUuG5C6jnUTVwkwXq8lSd4a+7/QOiXS3DKeRvLeHtdaOXW5lYJ/bmtCNNYotjupX9jm81
	kgYoT6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bhk-0000000BFsg-2cr9;
	Mon, 30 Mar 2026 12:26:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bhh-0000000BFqv-423C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C29F4456A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 12:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71654C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774873609;
	bh=AHtCIKj55eWGE7GRtpfrjZZg4gF/iBOryNVSD/NH+Mo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cewle8kPhz/ya3s+FO5WMYymxCjawPAP+TTgf+1eMEvF3NPyddME9vK5ylZL/pKd7
	 tQeb8LjGVvbSO/yUaYq5aVRkG7zJzxl5dVxcYOvmy0/o3l0aUyOp2HlJhU9Hxdybbx
	 lvTGq9AeVEmGIij76A8LMpR+UWqBzzrxkjafi7fytYKkwuHmcWtm1HjueFDjPpZ8CG
	 3DtRR7IfPdzsQMSWue+bzSsLi8UCt25ulv3cnqheF6fPfQb6VXt2nfwY6SDfFFnvfF
	 Qqkl6HXoSAYMlv+IrsOxzZHCmyKf1R/GOAqYkXqFUj2vAzHbK+TY/nf81mpdF60V0d
	 JfSuW2STfuGtA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so5265008e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 05:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGWwLhAfBvtcpQegWwTzMyqI9nAoMfFfRZzyld/u1XAa1DZ2X/GDr1SrJLOfROb2KeVIOu2sc78kZzo7M8JKhc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw58ykQG2btIWpQNhigCLN4lm8soditNe3Tve78Y8aL8bWHIp1S
	95/v65FaTJTZbbAuKn71EroTk7ltvhk0oKmx/TVO+fH69EkiL+WPbZw7Diwqz24w8AxtaXtItKN
	9EQ2RIFtASHJnLZuM3tkLolnnnFAFmNIuTnFU0jF0mQ==
X-Received: by 2002:a05:6512:2302:b0:5a1:4017:18d1 with SMTP id
 2adb3069b0e04-5a2ab935ac2mr3963243e87.37.1774873607983; Mon, 30 Mar 2026
 05:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
 <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
 <7h1phxpzml.fsf@baylibre.com> <CAMRc=McosSU39SERKtjmhJdTv2cPi44PG=bYqAcfQLDX4QB0Tg@mail.gmail.com>
 <CAMRc=MeYMe1gXjiYuQJpNWchp+V1uLkuRuyO3ohQjfAcg9q3MQ@mail.gmail.com>
 <acaOlGcGQEZHQ_mJ@darkstar.musicnaut.iki.fi> <CAMRc=McDdK8Y7wtG8WObjD6WF-2ftKBDwKbvj=xL-NMfeV=bPQ@mail.gmail.com>
 <aca3ajb_G3gD24S7@darkstar.musicnaut.iki.fi> <CAMRc=McVPskF4pMQSz=hR8CkyZhoPmCU_yJFT66vgTCPJd3-Vw@mail.gmail.com>
 <ackRzly0mXHReI7V@ashevche-desk.local> <aco3YBCQsT2BN2_N@kuha>
In-Reply-To: <aco3YBCQsT2BN2_N@kuha>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 30 Mar 2026 14:26:36 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mf8+CPU+azcZ-Q=RiAQs8rh40Ex3kE7xhUWAWNDnR8KKQ@mail.gmail.com>
X-Gm-Features: AQROBzBzoMQj_yi1O7GWL1v5KyhSCqt-LPe-BXFuLUoNwr5idSYsB_NYvCAw6-c
Message-ID: <CAMRc=Mf8+CPU+azcZ-Q=RiAQs8rh40Ex3kE7xhUWAWNDnR8KKQ@mail.gmail.com>
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kevin Hilman <khilman@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_052650_094105_89F122FA 
X-CRM114-Status: GOOD (  18.31  )
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

On Mon, Mar 30, 2026 at 10:43=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> > > Thanks. This makes sense. Both omap16xx_gpio_init() and
> > > software_node_init() run as postcore_initcall() so if the order is no=
t
> > > right, it will fail.
> > >
> > > Cc'ing Andy who's a reviewer for software nodes. Andy: is there any
> > > reason to run software_node_init() as a postcore initcall? It only
> > > allocates the kset, can we move it to core_initcall() by any chance?
> >
> > Good question. I don't know why it's chosen like this.
> > Let ask Heikki, who is the author of the code.
>
> I don't remember why it was it made a postcore initcall (I only
> remember that there was some reason at the time). It's probable
> fine to just make it a core initcall.
>

We can't really make it a core_initcall() either - kernel_kobj on
which software nodes depend is currently initialized in a
core_initcall() which could have been the reason for putting
software_node_init() in a postcore_initcall(). I think both
kernel_kobj and software nodes should be made available earlier.

Bart

