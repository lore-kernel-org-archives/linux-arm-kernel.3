Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1B6FF60D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMIhVteMb80TWSjLMiIOxuPHfEl/B2WUUWeUcY+ePX4=; b=2DDnde/KKzv+tvvI7mjBvpL8L/
	rcYjYMgRw9ZQsRI1qjXGZBSNmCBfTBXaKtmpsQEEpp6/KmXqhhOt3uGdeafQd9h1eiKEmcn1/kOVz
	hn9Rkra5pSO/nPgVvCKj4mgl+xynFLRIhcbLvXAvMPWNjZIKg85vXjoz0IW3PWYPNA1oAu99CHUAE
	eRTAYAEDmtEzGU0dbb6QWWFSSdEZWwzXNCzjNzr4xMDYeEsLusuO/F1WitO2kjYotgko1lNrRUdhi
	emfF7hxd2J+z33HUf9iU1VooxxFzUJivgtt+I/fkH4AzjMhXY5yT5D6BaOmcIosgWWFz4ZU4+UQjO
	Dkb7JW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UwJ-0000000Cdxl-2by0;
	Tue, 31 Mar 2026 08:59:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UwI-0000000Cdxe-3Da4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DABF060103
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 08:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E06C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774947549;
	bh=IYGobMEXU13zxFV94JS8/SK88BkSPNQBTubyddj5Owk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JGmq4onRjzaV5h7DDEpYNFw0IK/0JsivWpE6ODmyTBf7wNGUo3rFHRFRw90gAFgZW
	 IGxaEi2XTGciKsZQCP3ZMgk6uh6IFJq8QYN2X/4ZmGj//jbaHCyjBpj7nseP71ms4R
	 c/VW+9CDdGQfYi5TgudkKNgkCoQXINArPhD0FaJpHeouZ/wGlAD6kYemj/Fg6BgLYp
	 5+D3bf/q4bUF0Pr/r6Wz5YWdg07Xi/zOJhTtcRMyCDeKtmumiqAFD5Vtbd7pN7mjBa
	 5Q6RfXVbwjj0F9WYidHi6OA/xLlmnWJSsXkAGAfh+tyQhV6OJ7pltYzzvXNbAFJtdl
	 BJg0+8DiVSSBQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38c620f1699so50834361fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 01:59:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGuKIkFKpH7Oi9d6k5V4TA38/m7CdIa1ZU2LjeDdqPbSQJwmk/xUEYv2K/m3FHNGp4aDmL3l0qAbP2nSroX5+n@lists.infradead.org
X-Gm-Message-State: AOJu0YxjpCopu0uGbLm35bJH2pn7GAyAKrr4ocqD4ZV+xkMOcW6FX+ZW
	pBc91UHrvjSRwdF76A9CV1UyAfVW0daVFuf4dHNzp1DXpkVV5hFcYQU7Kya9Re9T/Yfxq7NTtBS
	EWUhBhXaLRZ6GMFt7fbWry0RSHcSKRHjy/dkyPEnBPg==
X-Received: by 2002:a2e:a593:0:b0:38a:8602:71aa with SMTP id
 38308e7fff4ca-38c731af9acmr51553271fa.16.1774947548197; Tue, 31 Mar 2026
 01:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
 <acrcDTPpXZ_5A4D8@ashevche-desk.local> <acruxMNdnUlyRHiy@google.com>
 <acto3TE1AR8iTzF0@ashevche-desk.local> <DDF494E5-C188-4A86-AC02-265B6169B591@gmail.com>
 <acuMD7Oly4XWW4n8@ashevche-desk.local>
In-Reply-To: <acuMD7Oly4XWW4n8@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 31 Mar 2026 10:58:55 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md-eJW4NUo7cVGDArg_MO53vfueHVqCzxrfUWJ5-MGjng@mail.gmail.com>
X-Gm-Features: AQROBzC64iVV0opSN20lxil0szzNnss6IuetV8sn6EmP7LsMeDIFMQJ351z-AI4
Message-ID: <CAMRc=Md-eJW4NUo7cVGDArg_MO53vfueHVqCzxrfUWJ5-MGjng@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Kevin Hilman <khilman@baylibre.com>, 
	Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org
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

On Tue, Mar 31, 2026 at 10:55=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Mar 30, 2026 at 11:52:34PM -0700, Dmitry Torokhov wrote:
> > On March 30, 2026 11:25:33 PM PDT, Andy Shevchenko <andriy.shevchenko@l=
inux.intel.com> wrote:
> > >On Mon, Mar 30, 2026 at 02:46:45PM -0700, Dmitry Torokhov wrote:
> > >> On Mon, Mar 30, 2026 at 11:24:45PM +0300, Andy Shevchenko wrote:
> > >> > On Mon, Mar 30, 2026 at 02:40:47PM +0200, Bartosz Golaszewski wrot=
e:
>
> ...
>
> > >> > > -static void __exit software_node_exit(void)
> > >> > > -{
> > >> > > -      ida_destroy(&swnode_root_ids);
> > >> > > -      kset_unregister(swnode_kset);
> > >> > >  }
> > >> > > -__exitcall(software_node_exit);
> > >> >
> > >> > Why? What's wrong with the __exitcall?
> > >>
> > >> It's dead code. Always was, always will be.
> > >>
> > >> Maybe split in a separate patch, but I sometimes feel the idea of "o=
ne
> > >> change" is taken to extreme and adds to both developer's and maintai=
ners
> > >> burden by needing to keep track of extra patches.
> > >
> > >Why does __exitcall() exist then? It's also used in other places.
> > >I think it's generally good to have a possibility to clean up
> > >after run.
> >
> > The code section will be discarded when the kernel finishes booting so =
it
> > only increases image size on disk.
>
> Almost true. Interesting microblaze case, where it's not discarded.
> But I can't find where it's actually used on any architecture.
>
> > >A bit of archaeology:
> > >
> > >The first time it appeared was in the bcc2152647b8 ("Import 2.4.0-test=
3pre3").
> > >Then somehow spread a bit (but not much).
> >
> > And it shows how useful it is. Maybe it had some purpose a long time ag=
o, but
> > at present time this code will never be executed since it cannot be bui=
lt as
> > a module.
>
> Are you sure about definition of __exitcall? As I read init.h the macro
> is defined when it's not a MODULE.
>
> Anyways, if we going to drop that, it should be in a separate change
> explaining all these.
>

Sure. We must drop it too because the initialization no longer happens
in an initcall but is called from elsewhere so - were it not dead code
- we could end up with it being called before the init function.

Bart

