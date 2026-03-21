Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979201075269
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 03:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/RSF0E6FhLD8wutFoB7bxuZrdpYQYvN1Rthj0xeHEY=; b=ggDYlM8NoIgdsVFsjtxk/J5Duo
	NW70/JJq9aeGs07r0f++4RgaIYWdFxLVv9nMsUTFMlaoNoxxHosrVJ1AXYjb0pPedU3eLHM7Bsi6X
	BLvtQ6kjW+4Km/pv2ZxzdJay+XAtoQYYp//MJ8Sd6BUquumRvqafvWxZ6bKWChTdqDcw06hVxPTgG
	4O5pHVx31c5JJ9JD7Z5ohPfL4C9l4cG0Da2QWf3n70y96lWRa3+1AXjPDthKRIpM8CrqwzAU16SGx
	turfODuhbl3N5LjHSXZq9C6FBVOplIQJ4VNIj2Zg05cJI3rNYBEigRyoR9g4GoitWDN9OHsyuDEHl
	eRgtZSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3mjJ-0000000DwmA-3AG2;
	Sat, 21 Mar 2026 03:10:25 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3mjH-0000000DwlM-0VK5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 03:10:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-662b5bf4b10so4944783a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 20:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774062618; x=1774667418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/RSF0E6FhLD8wutFoB7bxuZrdpYQYvN1Rthj0xeHEY=;
        b=gUZ6IX3dzlRDom9PVSsNh/Blx7ktFRCY6FMYy/wvSxE9cC7FzgCmbsmPvSvnOZkMIa
         iA0u0c2OhTHlA8gaoSQYM3yejdTszLPJRquExGn0EagHE2JCZZDJFz9RZitM3trk3zmc
         UdRqTFWyAn9txBPFI/syLkmXzCsC/2sy4p3zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774062618; x=1774667418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/RSF0E6FhLD8wutFoB7bxuZrdpYQYvN1Rthj0xeHEY=;
        b=oS3rm1+iBr0Q/c3u7mN2rq+EFJsC3H3scWRahUDWzcv+TMFtgpFUEXZwPMkMLwniiG
         eNsF/CUTlDjcoedxarWFm8X+FeYQrnzt9OKrCuBBED02RuINZ+TzK0WZxkRyLJ0FSfb1
         OQEnNzw4YIQW1XpzhqEh3YEjJY0Ftg+ek9jggCiLrL/Fmknw2gKsIsoQSAUAtlAZUe0w
         M2D+uq0GljRSsShqNmZgJcHq86AXcr86B1MNB06Gc49ZIYRohXAsCQxqCWIkRCVVDcAP
         5yxtL19Y5SJq9pqqiN8uAkRInL5TXNYcFhFbLiwf98RdtytTGUuitVPOWUZyFTRMMezc
         RwDw==
X-Forwarded-Encrypted: i=1; AJvYcCWvhKDC/6/BDhrZn1VzGO2wNUWnRLP6D7dVO+j126XK1AbIqyPk5/zBkNFU9RUz3vXwSjUAYijddRPQCdVk3KOc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpx9OJjHvQgolEPDjqRMyef5LbZRqb+bXzanuUnGWnFoyY/BwW
	cy5pD+cuzVFMRn9lHlrpZUzh+SbPQqPKsHRlQrVVrj2wWPmoFwjWfpDMpppkUK3YCMJ33tEvUw8
	uypVg6g==
X-Gm-Gg: ATEYQzxhtTYi+6kfP53oNiy0wkXoOmkl8/wdqfuGiA9EqxobGTJBeSByV5y+5De/WY+
	rJayM0t1VwHacdujnqeoTUutu9XjpcehpgOONwz9oJnhNw4ZRbRJmhhl0wrZgwrBzJhCIyUwLfA
	C+BzSWWfy5IHjSw+wXupkcXP9oPmTGagy6Kgj7TR4N+4Cz/2E+I8S384c8vLlm0/N8/YLg6jBoB
	qc6jB8uLXQlGUNftIZi6obJhNpY5TOxWPApmlhiIDOpZoNphfSu7ReDrHSI9aTd1GZyS4J8fIXS
	B5Wrjltj/17BhuTydrE3azNxH55zDXi1gnSC2IJQm8psU6lyF0h3FOAEWMLprbaTYZhWfQneGqF
	pOtzO4q+vXG452b5w6yLF/73UBzE5QReOz3AJleg/NWH72JlCDSzQiWhZhRY1R8QiczE9KLctWh
	h8Vgy+KeNgkH299TgY40bEOuihmDIF7xnSF3qe9p+GMgLjTAT6P28PUdgkwdx6VA==
X-Received: by 2002:a17:906:494b:b0:b97:f120:80f7 with SMTP id a640c23a62f3a-b982f4f026dmr317295466b.48.1774062617637;
        Fri, 20 Mar 2026 20:10:17 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440e7sm221169466b.3.2026.03.20.20.10.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 20:10:15 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso21144395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 20:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUTkW9+96rQaXtB6fBQKOvuft/fPa98npLWRv6zbk/tVcf3LtM/GO/GGBFEt02nIJdp5TMv3vS6T9ad3yzotKGP@lists.infradead.org
X-Received: by 2002:a05:600c:8119:b0:485:345b:ccb1 with SMTP id
 5b1f17b1804b1-486ff031f5dmr63989995e9.27.1774062615176; Fri, 20 Mar 2026
 20:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <CACRMN=euZzwDpCQupzth-J1z9qWXPenmy_bu727+R-kt97zexw@mail.gmail.com> <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Mar 2026 20:10:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VsAi-K9WnkT996WExfividTRi-aVcyLVD4Aicif=D=dA@mail.gmail.com>
X-Gm-Features: AaiRm53JJySLwTXCCA6qh8x4Qo2JwYxEnfOViwtwDhVjyjDx4WswvOZrKm9fsCw
Message-ID: <CAD=FV=VsAi-K9WnkT996WExfividTRi-aVcyLVD4Aicif=D=dA@mail.gmail.com>
Subject: Re: [PATCH v2] device property: Make modifications of fwnode "flags"
 thread safe
To: Saravana Kannan <saravanak@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andrew Lunn <andrew@lunn.ch>, 
	Daniel Scally <djrscally@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_201023_203646_4B13D770 
X-CRM114-Status: GOOD (  38.74  )
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

Hi,

On Thu, Mar 19, 2026 at 10:52=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Thu, Mar 19, 2026 at 10:25=E2=80=AFAM Saravana Kannan <saravanak@kerne=
l.org> wrote:
> >
> > On Tue, Mar 17, 2026 at 9:04=E2=80=AFAM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > >
> > > In various places in the kernel, we modify the fwnode "flags" member
> > > by doing either:
> > >   fwnode->flags |=3D SOME_FLAG;
> > >   fwnode->flags &=3D ~SOME_FLAG;
> > >
> > > This type of modification is not thread-safe. If two threads are both
> > > mucking with the flags at the same time then one can clobber the
> > > other.
> > >
> > > While flags are often modified while under the "fwnode_link_lock",
> > > this is not universally true.
> > >
> > > Create some accessor functions for setting, clearing, and testing the
> > > FWNODE flags and move all users to these accessor functions. New
> > > accessor functions use set_bit() and clear_bit(), which are
> > > thread-safe.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: c2c724c868c4 ("driver core: Add fw_devlink_parse_fwtree()")
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Acked-by: Mark Brown <broonie@kernel.org>
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > While this patch is not known for sure to fix any specific issues, it
> > > seems possible that it could fix some rare problems. I'm currently
> > > trying to track down a hard-to-reproduce heisenbug and one (currently
> > > unproven) theory I had was that the fwnode flags could be getting
> > > messed up like this. Even if turns out not to fix my heisenbug,
> > > though, this seems like a worthwhile change to take.
> >
> > Reviewed-by: Saravana Kannan <saravanak@kernel.org>
>
> Thanks for the review!
>
>
> > Thanks Doug. Hope this isn't the cause of the hisenbug. If you report
> > it here, I might be able to take a look at it too (no promises).
>
> I don't _think_ it fixes my bug, but I'm still not 100% sure because
> the bug can take a day or so to reproduce and it appears to only
> reproduce on official kernels built by the builder. :( This makes it
> hard to say anything for certain and also hard for me to inject extra
> debug logic.

Just in case anyone out there was wracking their brains based on my
description of the bug...

I've made progress in getting the issue to reproduce even with debug
information added. With that, I've found that
device_links_driver_bound() is getting called where `dev->fwnode->dev`
is NULL. That prevents it from running the ever-important
__fw_devlink_pickup_dangling_consumers().

I can see that device_add() has started, but it just hasn't made it to
the `dev->fwnode->dev =3D dev;` line yet.  My printout next to that line
shows up _after_ my printout in device_links_driver_bound().

So obviously something can happen to cause the device to probe before
the call to bus_probe_device().

OK, I managed to get a stack crawl for when `dev->fwnode->dev =3D=3D
NULL`. It looks like this (FWIW, it's a 6.6 kernel but issue also
reproduces on our 6.12 kernel, and I see no reason it wouldn't
reproduce on mainline):

  Call trace:
  dump_backtrace+0xe8/0x108
  show_stack+0x18/0x28
  dump_stack_lvl+0x50/0x6c
  dump_stack+0x18/0x24
  device_links_driver_bound+0xa4/0x4b4
  driver_bound+0x48/0x1c4
  really_probe+0x244/0x374
  __driver_probe_device+0xa0/0x12c
  driver_probe_device+0x3c/0x218
  __driver_attach+0x110/0x1ec
  bus_for_each_dev+0x104/0x160
  driver_attach+0x24/0x34
  bus_add_driver+0x154/0x270
  driver_register+0x68/0x104
  __platform_driver_register+0x24/0x34
  init_module+0x20/0xfe4 [max77779_pmic_pinctrl
e09198e651272bc5df70245355346d6eb1ba3a8f]
  do_one_initcall+0xdc/0x360
  do_init_module+0x58/0x23c
  load_module+0xffc/0x1130
  __arm64_sys_finit_module+0x260/0x300
  invoke_syscall+0x58/0x114

It looks like what happens is that immediately after device_add()
calls bus_add_device() there's a possibility of another thread
inserting the module holding the device driver. That means that the
driver can start probing much earlier than we expect.

I've posted an RFC patch to fix this. If folks are interested, please revie=
w it:

https://lore.kernel.org/r/20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabc=
ead688d0d8c17@changeid

Given the stack crawl I got, I'm fairly certain that this will fix the
problem, but I'll also let reboot tests run over the weekend to
confirm.

-Doug

