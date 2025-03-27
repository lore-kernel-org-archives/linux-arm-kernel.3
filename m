Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1819EC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZToPlI/FynJ7ZUERMGG6lDk/FwjdT7zxTA5PIM/zCg=; b=IrfDBkaLoghATkHnV40UF605T1
	5+KE0b71enPhK2fCGB2Ha9Aal7Go69yc0BX//QMvVOL62NnXd6qcfa0rKldxfGOQAAHEVHZKu8IiH
	VwHR521cww1PPJSL4Hv/wE3vWmM8qoaL6y5S+WlXYtU+ZFPfWbQyO1Y06kBmvtzdKBqxOWvowGGKC
	VB4lYOOtVX46wXm4wvkcbht5PszwLc/FoCSCOqznnbMVgLqwbjOMcBS17zbWeX4C/zCbRDI2JTzsW
	XfYM/BZggltH9xM5IcxC3mct8ilyTv4Xvd1hpt1Ju47mjedheLZ6TwZvI0C+B/7wL57s33NVneZGa
	/KaWuYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txo1w-0000000BB6k-0CdM;
	Thu, 27 Mar 2025 14:16:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txo0B-0000000BAnb-3sge
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55A29A42A91
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 14:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBE7C4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 14:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743084874;
	bh=w4Ot+NJ1fIKId9/UtayH+CL2iXIxeOMvWpD9ZyZebd8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qPBGvvbOGqHHShLX8F9C4g/cKbUmTbutuWRAWAUycsmrAfTWEZi0ts/CoaFtJRFeQ
	 rBMNVZmn6ZTRyxeNQj+56TgLPjKt01Qw5jvnEMPiXxFAI2MyKlEz/2UloLoTq1Snur
	 7zkuQ1xSoH+igpsP0lbuq2F4SoF7xxs7XchKHntF4WhME1jiljar0hauKLsU6rcynL
	 EdtJyk//oD9vLvxdOxNCz1U+oxUQBu1MQoXq2wgz1GHrdO2Qs0Fl6TtYCjWdDqwRY5
	 SnnK9wpGL3yUnxuywctYmnnZH/anK/U1lzEreY2qX4c28uMVRGnCBrcq93qW9nastT
	 oAVr9QRmWTxwg==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2c77f0136e9so293432fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 07:14:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZSwY3nz2zMgFKJsLmp8ZZazu0gQBByBvB4XgNXAmKKShvpWfh871zRPJ7zbef2eF8evdunP7YiL3KEJmM4G1e@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9XaIQi9b0KnN3DXblu10ELH71bNu0SDveSAiFtHki+rgB6uSS
	N1cGGGjs6FAwppcWDNhnr4Vr/pYXY3px4VzSicsjEnxbr5O94R7o9/gFB7yXV5pLtr3GBx1R1oj
	Qgu8vjEj+e0s69HM6O3geoRoBYH8=
X-Google-Smtp-Source: AGHT+IH2NiX8CmCRjkXpYJdSzQ4DKgyG9QmT+eImwWOwgFfr6VV2oODH1uFOd2mQAceOPDnob8QqR5e86hHjoIxI1Co=
X-Received: by 2002:a05:6870:aa91:b0:29e:2caf:8cc with SMTP id
 586e51a60fabf-2c84823c035mr2075911fac.37.1743084874119; Thu, 27 Mar 2025
 07:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250317093445.361821-1-csokas.bence@prolan.hu>
 <20250317093445.361821-2-csokas.bence@prolan.hu> <CAJZ5v0hJZBxU6SSq9C8gp2peETFWu0jbhrM82B5GvQkVXPR+9Q@mail.gmail.com>
 <3e6d7071-1ba9-484c-9dcb-c5da6ad1ffe3@prolan.hu> <CAJZ5v0jka2r9PaKsF0FE2qJaFfnVNGd8sZRE6Aay-Ugpzot44w@mail.gmail.com>
 <d926d2c2-8cc9-4a71-b8ca-b5f03ac9afb8@prolan.hu>
In-Reply-To: <d926d2c2-8cc9-4a71-b8ca-b5f03ac9afb8@prolan.hu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Mar 2025 15:14:22 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iS20uPhqNOnkj36rTBGQF3fecF6Hq4JU4=wz4pSzrFyg@mail.gmail.com>
X-Gm-Features: AQ5f1Jrkvob9yUT0LQxY3y65ur_Gm5qICTEtJi93M14j4zS-Z_SGAwa0jOwyHms
Message-ID: <CAJZ5v0iS20uPhqNOnkj36rTBGQF3fecF6Hq4JU4=wz4pSzrFyg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250327_071436_091388_2C568B24 
X-CRM114-Status: GOOD (  27.00  )
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

On Thu, Mar 27, 2025 at 2:24=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.benc=
e@prolan.hu> wrote:
>
> Hi,
>
> On 2025. 03. 27. 12:08, Rafael J. Wysocki wrote:
> >>> Now, there is a reason why calling pm_runtime_set_suspended() on a
> >>> device after disabling runtime PM for it is a good idea at all.
> >>> Namely, disabling runtime PM alone does not release the device's
> >>> suppliers or its parent, so if you want to release them after
> >>> disabling runtime PM for the device, you need to do something more.
> >>> I'm thinking that this is a  mistake in the design of the runtime PM
> >>> core.
> >>
> >> Well, this is the order in which the original driver worked before
> >> anyways. As a quick fix, would it work if we created a devm function
> >> that would pm_runtime_set_active(), immediately followed by
> >> pm_runtime_enable(), and on cleanup it would pm_runtime_set_suspended(=
)
> >> followed by pm_runtime_disable_action() (i.e.
> >> pm_runtime_dont_use_autosuspend() and pm_runtime_disable())?
> >
> > On cleanup you'd need to ensure that pm_runtime_disable() is followed
> > by pm_runtime_set_suspended() (not the other way around).  Also
> > pm_runtime_dont_use_autosuspend() needs to be called when runtime PM
> > is still enabled.
> >
> > With the above taken into account, it would work.
>
> Ok, so which is the correct order then?
>
> 1. the way it is done now in [PATCH v5 2/2] (which is the same order the
> driver has been using before anyways):
>
>      pm_runtime_use_autosuspend()
> /-- devm_pm_runtime_set_active()
> |   /-- devm_pm_runtime_enable()
> |   |   /-- devm_pm_runtime_get_noresume()
> |   |   |
> |   |   \-> pm_runtime_put_noidle()
> |   \-> pm_runtime_dont_use_autosuspend() &&
> |       pm_runtime_disable()
> \-> pm_runtime_set_suspended()
>
> or,
> 2. swapped set_suspended() and runtime_disable()
>
>      pm_runtime_use_autosuspend()
> /-- devm_pm_runtime_set_active_enabled() [new fn]
> |    =3D=3D pm_runtime_set_active() &&
> |       pm_runtime_enable()
> |   /-- devm_pm_runtime_get_noresume()
> |   |
> |   \-> pm_runtime_put_noidle()
> \--> pm_runtime_set_suspended()
>       pm_runtime_dont_use_autosuspend()
>       pm_runtime_disable()

/-- devm_pm_runtime_get_noresume()
|   /-- devm_{pm_runtime_set_active() + pm_runtime_enable() (in this order)=
}
|   |   pm_runtime_use_autosuspend()
|   |
|   |   Note that the device cannot be suspended here unless its
runtime PM usage
|   |   counter is dropped, in which it would need to be bumped up
again later to
|   |   retain the balance.
|   |
|   \-> pm_runtime_disable() + pm_runtime_set_suspended() (in this order)
\-> pm_runtime_put_noidle()

And pm_runtime_dont_use_autosuspend() is not really necessary after
disabling runtime PM.

Also, I think that the driver could be fixed without introducing the
new devm_ stuff which would be way simpler, so why don't you do that
and then think about devm_?

