Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09B2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=; b=zGfDy5ebv8qIp6e0d5mfjFQm9U
	IPNhtFccIxOMmtm8QQJy3Bh2FaLdDZWwFaQB2/XRJcHnDSJT3JkaXhHSsBX0VNXc/i0syjdicTNON
	LthF4Dvdx0/nLmJoh+drHLlkGV9ru5i2Q7QgJKfenzXJdQ17ADSt/SR22ROa1WMhhyuiq/RoHJ4U4
	kJkqVY8Yp02kM737TopfPhv0El2+EehcQYmPcis1Cz9IKYfslMXucgGgY0Z2vLSUb40ivXQKY89wp
	MmwvstUZ2Po6FKOIrvn29qEQavOihSWQG0QGBZzUmuAEOqbHwBNnhfxYzPX7zwkCug48LzNB7aqDu
	GWyqBqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5lh-0000000DnOd-3oFU;
	Mon, 29 Jun 2026 06:46:57 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5lf-0000000DnNr-2MUU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 06:46:57 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-6611669cd16so2950389d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 23:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782715614; cv=none;
        d=google.com; s=arc-20260327;
        b=qZwPdbEH/65DyNPPyNsX0Z/fV2XloPvNsFAJyAN2+wIq5Ybe6YmXNTEOaxl7gm6RI6
         OgGjgtbBZQmSLxZVbdzDspWOrhom+u+h1MqVQ2h7LT1d3OW/mcdM9aBDkvkaC5EG+qYl
         fH6NPhLsIejxOU7rLqzER8ngmFDP7yqkXdrURVNnOw/2faX3//mUwhRX7avzZ+e8kEfk
         Y3OG/i6ln+3Dep8WaT+FvCuzk8Q4L0NagDHYk8dfD/LFGQ/qMguaIzSGbDfVdvuwN0CZ
         HVLXn6a7oj3Qsx6yvgHwl38n3GUnlCLagDf/3zOyV/ulGQ9lmbVJvx1Ws89QxlN0NCiP
         uJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        fh=aAv4gOmOxDEB568XrutlRgVhxIGwpZ3t8N2c9CwHp8s=;
        b=HGr9YdEug9E78M2GVO1RTTocUwWBNVAIsmopP8lpzTnUDWEIzyBtk1JkN+Pw6RlPPY
         YP0hXRxw4fj9A1yU3jsxgKCwyQo0IWcHN7n9cAjqyGcUwmA7KgBR17w9J0yYochhiRpm
         XC14NM98NyxWp0f4cN6hT8D+Ool0mnhIF5k/Fjiwln96sEhDiI3sbRMNTMC0St5WDP2c
         eyUaiBEa9fmnoGHCrfgwb17zinHALFC12dXoYe6Rb0yzlzj4OJhioTX/VvZw6x5+AKE9
         HlvWm+NnQn6+JLxYuVb5gcUNkjHlhUJB3Ems9jX4lgJkA/UKvJVvjFS30P2GaJBqOJzb
         nbkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782715614; x=1783320414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        b=NCCINsrev5W0J+6R3Bn3ngLA3TEO779M4h3M5+I9XaQM+7WJI3aCKWeTeQKPvCNpMw
         oslOfjizmowAiLzgj8jyVklrv9YC3EdaWrVtL1C5zQWQAU9E/yUWfHSzMIjGWiACAr+s
         A7MGzlXhcRDdv2f0P3pUUu7uGaODj/xxtwWH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715614; x=1783320414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdLfLl6UogJFWv6j1WTnAMUaWp/TzmRrbHb3NuUWZmc=;
        b=pFNLsIbwY3ADmTH66nkuUul0ve3IuQOxzKdEcTlCYiXPAbFAbkJW9IBK8ASrzS1fqX
         3vVSjF77SzqP6ghbpYzD/4P2lcFje+OQeVOQlrtYIu0/DzmQX7yok3qgx1j1jc7Dg92F
         a1d2CBEnrEf9LuURW6MGLS2PzHkMIX//nvuHmLBWyfdF813q+hpXrdHq8aPgeZVzjfw4
         ub0PPz7Qwx0k7PT+vqhvXTpSWXGor2SSByVFyVeTshx2Dl713GtG7mKarOvX3XLb023H
         3dZnVOogFTWLjthKWtpEZEJfYzfJV4dKE0c7MYoeyb5M4Scuu8m55lN7+IPn16ChqnYn
         292g==
X-Forwarded-Encrypted: i=1; AHgh+RrLtJVqsz4VZEf0moTThmFudkCJTi64FlC+Ty4coRDZzm5QCJeUe3QCDknbLIfglKc0LmtiawFQG7qf7mix273C@lists.infradead.org
X-Gm-Message-State: AOJu0YwEueRzy2i9PEJBJB38+Vl6Y/SIuaQVpJk8j//z1rzcKyFswKZA
	L5jJor4jtIXhP5ATicbEgu+gqmhBqKCAXOTNQUdNp5XHnN4mK22HZMo+vcDfiJXAcXfFhLeT+Hn
	jxcS/cJVE56SxDRKks0QSYsPGJ5gL5kZzMzkPLv8a
X-Gm-Gg: AfdE7cmxzSeMcUI7Ef6f8v+H89jhiN2SpESlhhggjkyQM49jJEvhjW7ZWdMX4v+k+qX
	WK6Sg+i4aGEGG2Zr1nIWLeDwMuCkGtpTR1jpaNICnV7btBa8a3MKK4X+g5wYF9Tlpumr2geBodt
	sWJUenB6obaehTIwwXYPmcr5IAZLxOPmNs73Jt2hrb8gVed8aKc2WD7/YZ7DtqvbSdRFWFpvAiI
	UH6bIgbG6T0ArtDZkZX5icaEUUBkfnQeqmjmzaFXpv1iMIY4fFOTzclzOwLkrDQB3g50hMtLs5D
	vmVrbcJtIBCKmm5/ItwEruwyaBo=
X-Received: by 2002:a53:d24b:0:b0:664:ae6a:f07 with SMTP id
 956f58d0204a3-664ae6a108dmr6236222d50.81.1782715613698; Sun, 28 Jun 2026
 23:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-8-wenst@chromium.org>
 <CAMRc=Mc3DqGb2MsvM4tjcqFuRraAO+EftO1UrtNFvR5dMRXmVA@mail.gmail.com> <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
In-Reply-To: <CAGXv+5HQa9BH5wyVwKNxjXLEZDnE0sbeQjgNxwmAG+OF8bbz=w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 29 Jun 2026 14:46:42 +0800
X-Gm-Features: AVVi8Cf2Jr6SG6fphp7pdwOmuJjdBOlHCbVmzmc43-YAOHTJXjsvshlXzGC6cxU
Message-ID: <CAGXv+5Gbf8+=hMZcK0pYraC1t4qmDx_WVPkr2RhWdm3bq_LZEQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key connectors
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_234655_651407_9B1A4160 
X-CRM114-Status: GOOD (  37.91  )
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

On Fri, Jun 12, 2026 at 4:55=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Jun 11, 2026 at 6:11=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
> >
> > On Wed, 10 Jun 2026 10:40:41 +0200, Chen-Yu Tsai <wenst@chromium.org> s=
aid:
> > > The new M.2 E-key connector can have a USB connection. For the USB de=
vice
> > > on this connector to work, its power must be enabled and the W_DISABL=
E2#
> > > signal deasserted. The connector driver handles this and provides a
> > > toggle over the power sequencing API.
> > >
> > > This feature currently only supports a directly connected (no mux in
> > > between) M.2 E-key connector. Existing USB connector types are not
> > > covered. The USB A connector was recently added to the onboard device=
s
> > > driver. USB B connectors have historically been managed by the USB
> > > gadget or dual-role device controller drivers. USB C connectors are
> > > handled by TCPM drivers.
> > >
> > > The power sequencing API does not know whether a power sequence provi=
der
> > > is not needed or not available yet, so we only request it for connect=
ors
> > > that we know need it, which at this time is just the E-key connector.
> > >
> > > On the USB side, the port firmware node (if present) is tied to the
> > > usb_port device. This device is used to acquire the power sequencing
> > > descriptor. This allows the provider to tell the different ports on o=
ne
> > > hub apart.
> > >
> > > This feature is not implemented in the onboard USB devices driver. Th=
e
> > > power sequencing API expects the consumer device to make the request,
> > > but there is no device node to instantiate a platform device to tie
> > > the driver to. The connector is not a child node of the USB host or
> > > hub, and the graph connection is from a USB port to the connector.
> > > And the connector itself already has a driver.
> > >
> > > Power sequencing is not directly enabled in the connector driver as
> > > that would completely decouple the timing of it from the USB subsyste=
m.
> > > It would not be possible for the USB subsystem to toggle the power
> > > for a power cycle or to disable the port.
> > >
> > > This change depends on another change to make the power sequencing
> > > framework bool instead of tristate. The USB core and hub driver are
> > > bool, so if the power sequencing framework is built as a module, the
> > > kernel will fail to link.
> > >
> >
> > That bit needs to go away I suppose?
>
> Yeah, instead we need
>
>     config USB
>         depends on POWER_SEQUENCING && !POWER_SEQUENCING

FTR:

Somehow I remembered this incorrectly. It should be the following instead:

    depends on POWER_SEQUENCING || !POWER_SEQUENCING

and the dependency issue mentioned below then goes away.

ChenYu

> But I ran into a dozen or so drivers that have "select USB", mostly
> input devices:
>
>     config TOUCHSCREEN_USB_COMPOSITE
>         tristate "USB Touchscreen Driver"
>         depends on USB_ARCH_HAS_HCD
>         select USB
>
> Kconfig complains about unmet dependencies.
>
> > I see Andy has some suggestions but in general I like this approach muc=
h better
> > than adding the pwrseq_get_index() function. Thanks!
>
> Thanks!
>
> ChenYu

