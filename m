Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D55AFC981D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 08:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tf5ULwJrTl2cI7z19tJ0FBIFsHUeLlxW6VqIecnfacY=; b=U1EEnQaOxcu2rKuV1/7YywgUyc
	cTV3rL8ybAm0KZiIrMy65fe4Ex4P+TLGD9ZpH86si2nCjabty1f5LBhJeT8PzlUaosWk3T8cVVX78
	vFH02oOqgmo2n9UpFPCa9G3nqi0wI1BVnypDUNcSoFj9J4uFxQpdoi8LgVyxfEsnztIZwqjGZKqb6
	GAURIAk6RqQV00oKiJJM9m6KzLNDLSlZhAI0DfYUipK8luTis2GJvha5F6XoH14FH2Kn7+S/mxQSi
	X7qXVM3lycdqbVRlaTcY5J+K5ZzDWjuaQvRn3mGwl84RyCKX1wTt10YUWStVQNoskHlBh4Um06Av8
	juZbZRwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78KP-0000000Aumh-3pk6;
	Mon, 30 Mar 2026 08:50:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w78KP-0000000AumT-0Jeu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 08:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 131C260123
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 08:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD31DC2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 08:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774860631;
	bh=tf5ULwJrTl2cI7z19tJ0FBIFsHUeLlxW6VqIecnfacY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xf92L5XvfS6DOe68A+aTIVoyPlxdhPE3UBegn5Kf6obJ/Wf7BzMALvcuIeBMoLGaz
	 d4giXxl1iaJYrSAJwJw2SE22at6710VnXhIlhRzG6MKp9msdUKsmHvhiBQ8GUSMijn
	 EL2pfdKbZ9LZgbz9Dd19d2NVzMSynP13HCUpOlWBwRxCQ29+1Q5sL56WYwwoFhZK4/
	 VCXxHqZL82p6W75XyD7El0+gm2WPUrE3V1Fz7Q19U+UqUirwHgGt6x3SN9Nm2ipY4P
	 mDyonlqLpQPjNf+h54ixGxFw33harvnWSUcL+8kVmLscG7ZW2FY3M9X8q4mbqfOeHY
	 kvBSTVvPncWyA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so755918e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 01:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHgdAtupDeDWUqi2DiwhyMa9eAMr9DAUzW2vdJSDI3SPbZst10wiDla3FoKXHj75QB/nBux/XkglMUnR97QmIF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc9/8urJBlNjpHDCHz0ZNsGxmG0yzskIbzdwN9bnwAlEH3rF7F
	EpiNQKUa5VPQpI3mjYwe2At6kQi4Sg4vKqwFDYXQXwbI+E4uuLcnBLttpu9Mmrll4JfEx712VaQ
	DBr4msaSsVxNTJJtbB6r5+x3UhT+Yi0n7RavSrvr8/w==
X-Received: by 2002:a05:6512:3b0b:b0:5a1:1885:69d7 with SMTP id
 2adb3069b0e04-5a2ab5fa3e9mr3943952e87.4.1774860630515; Mon, 30 Mar 2026
 01:50:30 -0700 (PDT)
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
Date: Mon, 30 Mar 2026 10:50:16 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdEL-_od0wJbwA1Q=GDFjm94Ca47FfNR-koDpjumQrMdA@mail.gmail.com>
X-Gm-Features: AQROBzAwfgAKKxJI4l4teSRtVg5dwLEFgmM7zFWj_0HkeLpVMZ1ljd0TW90H9VA
Message-ID: <CAMRc=MdEL-_od0wJbwA1Q=GDFjm94Ca47FfNR-koDpjumQrMdA@mail.gmail.com>
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

Thanks, I think I'll do as Dmitry suggested and make the exact moment
software nodes are initialized deterministic by moving it into the
driver core initialization.

Bart

