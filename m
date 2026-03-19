Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1881A1091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwNvoAxpSBA3F4YxfMu4dubOKf0cPSpjGd1s0V+Fdds=; b=Wyup79+777uu7lcsFiHGXY4E9R
	kBC26YUuOSSFjmJXv6ms3sRZoGxrHmYrtF3+4Ed5JxTtP7kjR/YPZ74/AWkBMYio5n32lwIq2dNj8
	CbD+4+ewoiyD2W2LA8gTFqFT63BXCf6ALrV39eOwDrDUsz0uT6+Nzjd2owvaLmq03HKyCZx/47sIZ
	lG7dUyi2SVwum9HFFR3eXzdj/zOosfgx9w1N8rVaHWx0Ao6xvV6lTALmXgKxlsfrtBDwuetmTJtuF
	tsHPImNHMtup2SDLSnMj6LEILbLVCpEOO24w6r5F46k9eilGyqllyeAvPMXDo6IIao3tcuFOmnTP+
	vjs+d5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HeG-0000000BFhH-2NmR;
	Thu, 19 Mar 2026 17:59:08 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HeE-0000000BFfl-1b7T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:59:07 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-38a3066b68bso7510701fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773943143; x=1774547943; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwNvoAxpSBA3F4YxfMu4dubOKf0cPSpjGd1s0V+Fdds=;
        b=Hyz/1aBeHKDJGfYd2mdRAXk4Ucuv3rh0xLDAqiizgmHDoIJ6tNlzF50fz0oOEYOxJQ
         NuW5Pg90F+8c5CaC6hL8P/M9UWlAw8KCo5EryV6Foz4oW4t11VohQHfbOfznHzv59F4Y
         FaO6i+cpDnwvaHhupnnd+lEnJnZ0M1Pi6LOdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773943143; x=1774547943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwNvoAxpSBA3F4YxfMu4dubOKf0cPSpjGd1s0V+Fdds=;
        b=YqSc4aVIbPQbwnHwN5CpTPU33bMFspkjILvizldvY6tMhffl7fzBm1mIZrWIIJKlNI
         GxW/4cxe6xISjTrUMF4ekz5KB0Jizrv2/IpOr2tyX0xKflnD1S3yd/jzr3SIH2pYss4S
         OPAmMa1rXRmrX19xF5HAf22AO6YV0k6aNB9YKdsMg0Yisdrt4AD+c7gHEA+G4Qh4fJTN
         6z4yKuETtbr8xPYvlgMxFvKA4F+X5VXWD3we5PrCS7HZVPXlXseTzjBS1rD74liOYS1x
         he5m5k8upWfsGRaUenZ+7rieNxhAoI459vqv83OFCRKDVA2RSmIWs7rtUPa9YRsCUXll
         ArDw==
X-Forwarded-Encrypted: i=1; AJvYcCWFWDLQ0wWHB+j0/YHVKCZKFI/QjJ9bse0SzqiwnHprB+P6bvX6mCRNsb2K66X4T+Vc7Y3yHojE5WWz2hBxyBgu@lists.infradead.org
X-Gm-Message-State: AOJu0YzynWkrU/lBzOeej+8oLvyodOcKdM+p21vu75/vSz97mg9GIBqA
	vxkvCoBbas1vbHrNNwrxe5tvuEfs721KC4ZZYAXmWS0nKCOoPUFJr7a5kHNY8iH1q0Yy+shyMtU
	19EEF+x/R
X-Gm-Gg: ATEYQzxarDuLCfJoSZuZEowTz6EaWPKGEviy5lWScK/F10GPbbZccjqo4uDsH+Y+MVn
	XKG7mHPCel/Dkf1o8aojdVtKqNK39H9iN2CRKu1Lt4E0brKaWPUYXTFmNt12G+lQfFvxHIJqvmD
	MPfeaW9bC8VxchPsVoDDfgDwk0p6YgFu1+gfopStgNsNzvW16C9OyrRoAxQ4m/GtqZux4hUYG8h
	PSXRaVLv4XhWfeIUdw9gHr4bkhn48bNwfBS7p2kAa5SzGjGI6gcqpIlGcuj11OCzyUruJXs+nCk
	KbexYi2gP8LddqvYbBJDP/1fqg9LT0X4SYgBz/UKMIoPsGpivXFJm46NyAxad73NXPmG+hi5M9C
	eKCtgp+rSeUBmtvF0nepJ7lcGl6+OTOjjyXFEdwQeSyDnW52Q3jnGdFVxysEaC2IvjRA3HYkXSk
	EbHAAbji56o1JErYDukApCOqMbS+LtE348gUt75PvVc4s/ogRItw3paYo5jMfIzQ==
X-Received: by 2002:a05:651c:551:b0:38a:aba:9c0b with SMTP id 38308e7fff4ca-38bf972d34fmr1399761fa.27.1773943143354;
        Thu, 19 Mar 2026 10:59:03 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ae8570sm419351fa.42.2026.03.19.10.59.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:59:03 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a27bfadca9so1334742e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:59:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVNnnNWHYsNHV1eTUCFrsYagUyY095P6un3RcyPLZimCWEpY6z/6+X5GPKXMnOlCaVynjWjn/6RHjSBaLMBqkQ@lists.infradead.org
X-Received: by 2002:a05:6000:18a6:b0:439:beee:43b5 with SMTP id
 ffacd0b85a97d-43b6423d90bmr470716f8f.3.1773942745211; Thu, 19 Mar 2026
 10:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260317090112.v2.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <CACRMN=euZzwDpCQupzth-J1z9qWXPenmy_bu727+R-kt97zexw@mail.gmail.com>
In-Reply-To: <CACRMN=euZzwDpCQupzth-J1z9qWXPenmy_bu727+R-kt97zexw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Mar 2026 10:52:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
X-Gm-Features: AaiRm51jE-pJGKyYKekSNJEdkSVtbmzl88hjmcc-VHWIT0EUhGVU2WYljuGhtW4
Message-ID: <CAD=FV=WEWMdh+SuSE-5P81g7NhV8KH_4u_FxcRdBFRTAaASqhQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260319_105906_495292_028CD2EF 
X-CRM114-Status: GOOD (  38.45  )
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

On Thu, Mar 19, 2026 at 10:25=E2=80=AFAM Saravana Kannan <saravanak@kernel.=
org> wrote:
>
> On Tue, Mar 17, 2026 at 9:04=E2=80=AFAM Douglas Anderson <dianders@chromi=
um.org> wrote:
> >
> > In various places in the kernel, we modify the fwnode "flags" member
> > by doing either:
> >   fwnode->flags |=3D SOME_FLAG;
> >   fwnode->flags &=3D ~SOME_FLAG;
> >
> > This type of modification is not thread-safe. If two threads are both
> > mucking with the flags at the same time then one can clobber the
> > other.
> >
> > While flags are often modified while under the "fwnode_link_lock",
> > this is not universally true.
> >
> > Create some accessor functions for setting, clearing, and testing the
> > FWNODE flags and move all users to these accessor functions. New
> > accessor functions use set_bit() and clear_bit(), which are
> > thread-safe.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: c2c724c868c4 ("driver core: Add fw_devlink_parse_fwtree()")
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Acked-by: Mark Brown <broonie@kernel.org>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > While this patch is not known for sure to fix any specific issues, it
> > seems possible that it could fix some rare problems. I'm currently
> > trying to track down a hard-to-reproduce heisenbug and one (currently
> > unproven) theory I had was that the fwnode flags could be getting
> > messed up like this. Even if turns out not to fix my heisenbug,
> > though, this seems like a worthwhile change to take.
>
> Reviewed-by: Saravana Kannan <saravanak@kernel.org>

Thanks for the review!


> Thanks Doug. Hope this isn't the cause of the hisenbug. If you report
> it here, I might be able to take a look at it too (no promises).

I don't _think_ it fixes my bug, but I'm still not 100% sure because
the bug can take a day or so to reproduce and it appears to only
reproduce on official kernels built by the builder. :( This makes it
hard to say anything for certain and also hard for me to inject extra
debug logic.

I did finally capture a ramdump of a device in the bad state and
managed to inspect the state of all the fwnode and fwnode_link
objects.

The problem (simplified) is that I have a pinctrl device:

  max77779_pinctrl {
    pin1: pin1 {
      ...;
    };
    pin2: pin2 {
      ...;
    };
  };

...and then a client of the pinctrl device:

  client1 {
    pinctrl-0 =3D <&pin1>;
    ...
  };

  client2 {
    pinctrl-0 =3D <&pin2>;
    ...
  };

At parse time, we get a link between the "client1" node and the "pin1"
node (and "client2" and "pin2").

In a normal boot (where the bug doesn't reproduce), when
max77779_pinctrl finishes probing, all of the links to its children
(which don't have a "dev" associated with them) get moved to point to
"max77779_pinctrl" (__fw_devlink_pickup_dangling_consumers).

When I detect the bug, the max77779_pinctrl device clearly has
finished probing, but the client devices still point to the child
nodes.

In the debugger, I can inspect things. I can see:
* The fwnodes for "pin1" and "pin2" clearly don't have a "dev" node.
They also don't have "FWNODE_FLAG_NOT_DEVICE" set.
* The fwnode for "max77779_pinctrl" clearly has a dev node (and a bus).
* The fwnodes for "pin1" and "pin2" show zero consumers.
* The fwnodes for "client1" and "client2" _do_ still show suppliers.
* When I look at the fwnode_link between the clients and the pins, the
"supplier" points to the node for the pin.
* When I look at the fwnode_link between the clients and the pins, the
"c_hook" is non-empty.
* When I look at the fwnode_link between the clients and the pins, the
"consumer" points to the node for the client.
* When I look at the fwnode_link between the clients and the pins, the
"s_hook" is an empty list (next =3D=3D prev).

It's a bit baffling because everything looks nice and consistent with
half the link being severed, which doesn't seem possible when looking
at the code. The code seems to always add to a consumer list and
supplier list at the same time and remove at the same time.

I've started to run out of ideas on how it could possibly get into
this state. If you have any, or want me to look at any other data
structures in the ramdump let me know.

-Doug

