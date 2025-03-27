Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6275DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29QXDhidZ4PVOYXAvqKDIutplSGkI5NqY4TxF7CkPec=; b=o5LTK8jrPKC0nzd4nL+DOsCu7M
	6FGTx0s+3T4eZ/d4uTTUAn+6C38sVcEytWV2WLOVsE476NOoHqrVLt83QK0S1+U2m89hblkMH8auk
	+G3p+cCuUCrzXWXUxw0M18sSEFyB8escoitWDS10mYi/qcnVpEXOVVfa+UkfBuOBOZPxSd2LeVgo6
	bVrCCWIrwhoz8v3KtCdPvMMCXe7QBCfkimZMt3Eeokn1jv6vi0hZcisQqs3e/2aKpb1EN3KdVx/mf
	8EOZLxeKe7DWwefXwH42GJXZmv+k3QKEcZS3V8QRomuFALww5WujHUVKopy6z5SpkmosFQzhiVcu4
	PdYskRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqXS-0000000Bagf-2PwT;
	Thu, 27 Mar 2025 16:57:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqMN-0000000BYgQ-2WSS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 16:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A968944696
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 16:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62E9C4CEEA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093938;
	bh=wF9ipZcNB/0eHsPWmPL1B2OKg5FK6fHZ9xznjO7EbCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WVuSy4pKVl72ZFebxsmUTMq6wLMOKaEVPncUPbMxg72hU2WizApwScuKQhGsn+X2B
	 48yjZdBK/jzjI29x3+htNNhForhzjM0n57X0l0nJtPFE2HBlT0D2lbHPXBq2WXx0V/
	 p2lXAX9YGwkQ3pH6iZU3rhWEOvP7kPyAEw8xgY4REFZ/QyJMFSjDFfnWvYtsTqlb8+
	 S7w93u1XY4Jzi1yWxn3vVPMwpbtXMdqcNk3A3oO8FMpmkbAbW5OUE8XjW9LFbZjd7M
	 VuROKfpIXhOmgiuAw+KJiOac2V0KNhL7t8nxBorz1CVdDp/uJKybOG41atMcvVSnER
	 ZPkrcXvxYSA6Q==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2c6f6f75a81so582276fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Mar 2025 09:45:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUa0YiwtG4MJ0BpYP6CCTIdJvYWiC72U5rSjwCOh6ayVvpttavVOQ2BWbisQdwrHnOzwzEQjQ9c4mNcZ+cNTw5o@lists.infradead.org
X-Gm-Message-State: AOJu0Yxccf+frrDPJKIfuF5pwYuYrJyg6Dqy8bLt0ptGZZsYy6sGvLOG
	9NhkEfOzslwmlJTVTnSK3jO8J3a9/Hwac5nzN91VsSvjS1MBEI/IJqqy0flMc4XT9Iznkz6Cws8
	5AB/jlOZRlpaf0Ux4x3I5iRvlKEo=
X-Google-Smtp-Source: AGHT+IEdHzMes6epfYuSawV3mY3iFmhRhmu87zpi8OHs6t+XHe19Js4YCvurVJX69p7//O4r9UNp+Qm5gzHXegJPAmE=
X-Received: by 2002:a05:6870:218f:b0:2c3:f8e3:bdb9 with SMTP id
 586e51a60fabf-2c84818f575mr2572277fac.28.1743093938185; Thu, 27 Mar 2025
 09:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250317093445.361821-1-csokas.bence@prolan.hu>
 <20250317093445.361821-2-csokas.bence@prolan.hu> <CAJZ5v0hJZBxU6SSq9C8gp2peETFWu0jbhrM82B5GvQkVXPR+9Q@mail.gmail.com>
 <3e6d7071-1ba9-484c-9dcb-c5da6ad1ffe3@prolan.hu> <CAJZ5v0jka2r9PaKsF0FE2qJaFfnVNGd8sZRE6Aay-Ugpzot44w@mail.gmail.com>
 <d926d2c2-8cc9-4a71-b8ca-b5f03ac9afb8@prolan.hu> <CAJZ5v0iS20uPhqNOnkj36rTBGQF3fecF6Hq4JU4=wz4pSzrFyg@mail.gmail.com>
 <bcf363db-8fff-4fb1-b29e-300f7b8bc090@prolan.hu>
In-Reply-To: <bcf363db-8fff-4fb1-b29e-300f7b8bc090@prolan.hu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Mar 2025 17:45:26 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g2cjZwJYjd7Jt-dDDaxjCPwmkAzRZM1HDT4tod7RiUUw@mail.gmail.com>
X-Gm-Features: AQ5f1JpMAgH4hDdx8tpla6GgEclU1a-D6wPVXKpe8AogK9pUv3F-grNrK0it6P8
Message-ID: <CAJZ5v0g2cjZwJYjd7Jt-dDDaxjCPwmkAzRZM1HDT4tod7RiUUw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250327_094539_678458_117326D0 
X-CRM114-Status: GOOD (  28.87  )
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

On Thu, Mar 27, 2025 at 5:11=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.benc=
e@prolan.hu> wrote:
>
> Hi,
>
> On 2025. 03. 27. 15:14, Rafael J. Wysocki wrote:
> > /-- devm_pm_runtime_get_noresume()
> > |   /-- devm_{pm_runtime_set_active() + pm_runtime_enable() (in this or=
der)}
> > |   |   pm_runtime_use_autosuspend()
> > |   |
> > |   |   Note that the device cannot be suspended here unless its
> > runtime PM usage
> > |   |   counter is dropped, in which it would need to be bumped up
> > again later to
> > |   |   retain the balance.
> > |   |
> > |   \-> pm_runtime_disable() + pm_runtime_set_suspended() (in this orde=
r)
> > \-> pm_runtime_put_noidle()
>
> Ah, so basically what I've done originally, just calling
> `devm_pm_runtime_get_noresume()` _first_ instead of _last_, right?

Right.

If you want to use pm_runtime_get_noresume() to prevent the device
from suspending and you do that after enabling runtime PM for it, the
device may suspend between the "enable" and the "get_noresume".  Doing
the latter before the former prevents this race from occurring.

> > And pm_runtime_dont_use_autosuspend() is not really necessary after
> > disabling runtime PM.
>
> It was done this way in devm_pm_runtime_enable() already, see commit
> b4060db9251f ("PM: runtime: Have devm_pm_runtime_enable() handle
> pm_runtime_dont_use_autosuspend()"). I didn't change anything
> behaviourally there.

Yes, this is fine, although not really necessary.

> > Also, I think that the driver could be fixed without introducing the
> > new devm_ stuff which would be way simpler, so why don't you do that
> > and then think about devm_?
>
> Sure, I could quick-fix this, go through all the possible error paths
> and whatnot and ref-count in my head, but it doesn't fix the underlying
> problem: in order to properly use PM, you have to do a bunch of calls in
> some set order, then undo them in reverse order on error and remove --
> exactly the thing devm was designed for, and exactly the thing where
> it's easy for a human to forget one case by accident. Thus I prefer to
> use the *real* solution, devm.

Except that you need to enforce the proper initial ordering or you may
get undesirable results on the way out.

Say you call devm_pm_runtime_set_active() after
devm_pm_runtime_enable() by mistake.  It doesn't do anything, but
runtime PM may still work because the device gets resumed at one point
and if it has never been in a low-power state in the first place, the
"transition" may just be transparent.  On the way out, the cleanup
action for devm_pm_runtime_set_active() will run before the cleanup
action for devm_pm_runtime_enable() AFAICS and so it won't do anything
again, so the device's parent and suppliers (if any) may remain
reference-counted.

That's why I'm saying that it is better to combine
pm_runtime_set_active() with pm_runtime_enable() (in the right order)
in one devm_ call and define the cleanup action for it to run
pm_runtime_disable() before pm_runtime_set_suspended().  Then, the
mistake described above cannot be made.

