Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA66C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 11:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rw2C5p+NCRxOPYhwPDmfw0m5OTOV/6uLW/Te+FXI22w=; b=qu6ojPCzQTwsqHShiKY6ML4Xuo
	urxCMlh66tA/XpvvwaPW8VAAI6AQrTzgxsg3F5HZXGtAJjYpj5A2ysapyr3mnaRtLAVw7+3wFDj+b
	/cm29nhNKM989QFXYQWmzTFjRtotfcPxOLKjkyDbBBv5hg7jlLrAIOSXP8yk/QzpP6iT2pYg2X3WG
	Mgmg1g+pnK+aWdHUTi55VNhF1wn9HyHGFYvKElbRlebpfhYs/Gkj4LOyum+jPkb540I8IqK8SOqSm
	thjaBYHHnlsUClgxtj2BU3z6ZUe/LhDGZW9U28mTan/OLydN+TICLLwCFNu5kVDXEj/0p/Go3oSHl
	abKGMOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txl8B-0000000AnIo-3X1O;
	Thu, 27 Mar 2025 11:10:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txl6R-0000000An1b-41kR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 11:08:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1D5844B2D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 11:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F126AC4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 11:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743073731;
	bh=T/C1IUzTPhJ0AN1d10OTPlRbro4QgLVWrO1x971kKwc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GUmR/9NbSTYfO4AGJOaL2UTxlU5xFskKoFxRXOGoJ1n1d1wTswADCVBpv2Yk3VMjE
	 WtXe0j6ec08dEEaM8eMRA+nSjmYoaNN40G0NMxpzR0pp6ma5tgxf/gJ0f8fjyr+eWH
	 bVaOgFN3/lvetm84KkYjC/avYN65uEpJyLYpuWQhzXjefQEsLUCUx1sgik33aRX0Rx
	 YC6uxoS55b9uYsmTojKQouGQ+cAnyyz4XXbM/8lcr9oszIEZ3a4Xanpbp5sRicAlUK
	 4LygiR3HAy41A+dxUF2A1KoT7UyliQv3/BwQdPjOK7Je+xTohyqjm9kdAWv/XKjF9X
	 T2yRpxIMT+L/w==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-602513d2201so454871eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 04:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjX1l0Cp3bZS0KDIh4VfNp1GOVnUGAf1lAGFn1CwrmK17ee3rNPY2XbPj6q7Z5EDPQyBRgXsrIQLvVlZzIBfDr@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvbz12H1HL6Sx9laUFVxZ96CnR0si4Da3UD2sbppLp3vTLWPz1
	C/S5kYAP/xiesXlcGOIo6bhRWC94Ii1bW8lUlFVBfJShQS08gRu5Ev+w2Buz+aMDu7kom7bWQS8
	SGQCfA6Wh1Pp3QMUd513CT/j7wCc=
X-Google-Smtp-Source: AGHT+IEzurn8PX84DTZbLqJSvwaaZ/eB8XCLr0efqELPQTTYzC0Yup16jliPriSvS/8iQ71yl9XaN5ogWrNYP+wzo1I=
X-Received: by 2002:a05:6870:391e:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2c847f04c10mr1532382fac.2.1743073730142; Thu, 27 Mar 2025
 04:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250317093445.361821-1-csokas.bence@prolan.hu>
 <20250317093445.361821-2-csokas.bence@prolan.hu> <CAJZ5v0hJZBxU6SSq9C8gp2peETFWu0jbhrM82B5GvQkVXPR+9Q@mail.gmail.com>
 <3e6d7071-1ba9-484c-9dcb-c5da6ad1ffe3@prolan.hu>
In-Reply-To: <3e6d7071-1ba9-484c-9dcb-c5da6ad1ffe3@prolan.hu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Mar 2025 12:08:39 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jka2r9PaKsF0FE2qJaFfnVNGd8sZRE6Aay-Ugpzot44w@mail.gmail.com>
X-Gm-Features: AQ5f1JpUPqZNN73veAwvZFBlgl93lXp6y3hqKwdnBmubsLfvOeNP8EFhQHFKtCM
Message-ID: <CAJZ5v0jka2r9PaKsF0FE2qJaFfnVNGd8sZRE6Aay-Ugpzot44w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pm: runtime: Add new devm functions
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Len Brown <len.brown@intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Pavel Machek <pavel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_040852_039710_3AED85B6 
X-CRM114-Status: GOOD (  27.42  )
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

On Thu, Mar 27, 2025 at 10:02=E2=80=AFAM Cs=C3=B3k=C3=A1s Bence <csokas.ben=
ce@prolan.hu> wrote:
>
> Hi,
>
> On 2025. 03. 26. 18:38, Rafael J. Wysocki wrote:
> > I said I didn't like it and I'm still not liking it.
>
> You didn't really elaborate further, but now I'm glad I could understand
> your dislike.
>
> > The problem is that the primary role of pm_runtime_set_active() is to
> > prepare the device for enabling runtime PM, so in the majority of
> > cases it should be followed by pm_runtime_enable().  It is also not
> > always necessary to call pm_runtime_set_suspended() after disabling
> > runtime PM for a device, like when the device has been
> > runtime-suspended before disabling runtime PM for it.  This is not
> > like releasing a resource that has been allocated and using devm for
> > it in the above way is at least questionable.
> >
> > Now, there is a reason why calling pm_runtime_set_suspended() on a
> > device after disabling runtime PM for it is a good idea at all.
> > Namely, disabling runtime PM alone does not release the device's
> > suppliers or its parent, so if you want to release them after
> > disabling runtime PM for the device, you need to do something more.
> > I'm thinking that this is a  mistake in the design of the runtime PM
> > core.
>
> Well, this is the order in which the original driver worked before
> anyways. As a quick fix, would it work if we created a devm function
> that would pm_runtime_set_active(), immediately followed by
> pm_runtime_enable(), and on cleanup it would pm_runtime_set_suspended()
> followed by pm_runtime_disable_action() (i.e.
> pm_runtime_dont_use_autosuspend() and pm_runtime_disable())?

On cleanup you'd need to ensure that pm_runtime_disable() is followed
by pm_runtime_set_suspended() (not the other way around).  Also
pm_runtime_dont_use_autosuspend() needs to be called when runtime PM
is still enabled.

With the above taken into account, it would work.

