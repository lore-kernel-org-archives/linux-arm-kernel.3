Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0145EBFD10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hP1el5xOJ6rC5eOpWPTnKPIlVHp2ZUXrZ+j7CVleAq4=; b=FSO0PxVmEohplRDXgoYXohxxct
	W4XHQIdAV4LH5cYhuxJupwE3h4+un2P5qwImBF3jmFiKxDIHnoTOqYT+EkqQX6w6LIsS3+9SQ8ewu
	LumHMmP33Cxo+xgr9tALxFg1OtBbNslg0dirRF0Q/bdrCMfgY51Xe0XVikQ0nz0m0BdlDgkfkgfn7
	GIlKj0V0zH7Ai+8JCDquL97FBUMV6hRGYZYEsTg9DYjWOJBVVCwRiad/O5IZqbCh3g2GvxLTVmFwE
	UFAVIMrIItTVMQNs9QYbEYhPUlr7kUB6zyM/pFz+m+durpFncgjOw/vSmkR0/Eneelm03eW/dnxoc
	KyGu0z5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCEf-0000000FCuF-0Us1;
	Mon, 13 Apr 2026 08:01:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCEe-0000000FCtp-3jmo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hP1el5xOJ6rC5eOpWPTnKPIlVHp2ZUXrZ+j7CVleAq4=; b=FX7xKQRl6o7zRvn6Stc5yOlSGO
	ZONlNCLGYZpGQjDCQx99ePo1LPlbMjee1C9bYsSOy09YTNQayN4Xfocjf1yUms2uSCUiaonKBwfPk
	YFWW04VSg6VT9TOdmdiozfLZEzadYMYDK7QDqGZSutGVHpv0jHLqU4iWdpEhPRgEqRkcdXiqQjFea
	e+DP0g1fgeChKzM4LsE+oXNT/l8NoEn2psH3qr8VtRX2XYiDZXUle+Ppixi0IQmei3eQ/TVYokfGL
	PFWe2Tbx6Sa/+H9uyP9vTUHbIONiuhHIigyQHtKiGD8aAEgv0GoQ6qUPhPqWycGTV7UcQP7eP7CFd
	rCW20jKA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCEU-0000000GL2A-2yMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3349E44539
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 08:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1314CC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776067278;
	bh=hP1el5xOJ6rC5eOpWPTnKPIlVHp2ZUXrZ+j7CVleAq4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XVL+C4Zlx2UQ+13koLXQcEPQGEYAoHM+f0LLebzDe96Dwb480JRfo4MTchku3dCTW
	 tBITlIPs0vJiPMM/IcM1utoDatp++soq+yU/OBW8rP657qOO/Um+Bw1vzea9K0/sMM
	 e8isoJqw6QJ1XzoI69f/4RW3I+sojwEV6MmZXeF9oM4HX2u4Rhj+wZUwDLBj9oNMVB
	 lfZPSCWll3xebdJ2uP5P3ykgSg7h5pa9dx0NBarNfmiVMFYgLOjEVZWyNj4jciBJ0e
	 SyRRNNrnhMnz0zgec1XVgwfnbVmeIRxM7mYfmMkuqdHzQ+pd2hcdHrX4BMM3Gwgie4
	 1zDEbHlo1Po5A==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-651bf4a4140so906833d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 01:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8qfTDicwnh7sdTQkbXlQjSeSx/8D16xCpWC9zQRuMB5kr303QTqxk/6/am3b5AuG2vk6SvwTgpOnAQK+eUpA5p@lists.infradead.org
X-Gm-Message-State: AOJu0YyoIl8/4h4eDX/QrxzskydEdWMTwrAE3IRvq30YEoGkrB4lcE96
	5ZWKVaL6yOLgOeTBW7ukDQjGh0xxfHPHzWhdfE7JkX0yAIIzu2BO9CQi9rM8fy4POowoIEv48Kp
	wQVF2rgluGCJYb/hZRBzuBXybeDYAQ6A=
X-Received: by 2002:a53:e1f9:0:b0:650:1d3c:2ae4 with SMTP id
 956f58d0204a3-65198a7ff99mr9464905d50.19.1776067277379; Mon, 13 Apr 2026
 01:01:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com> <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
In-Reply-To: <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 13 Apr 2026 10:01:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
X-Gm-Features: AQROBzBVbNkZQd5M-JIcoCwBqTnfC8gpTQhwy0nP69ggr9JlXF4NUsZC_rYcX28
Message-ID: <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Frank Wunderlich <frank-w@public-files.de>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, 
	sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, brgl@kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_090124_864119_8F23DFE6 
X-CRM114-Status: GOOD (  11.91  )
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

On Fri, Apr 10, 2026 at 11:24=E2=80=AFAM Frank Wunderlich
<frank-w@public-files.de> wrote:

> > Gesendet: Freitag, 10. April 2026 um 09:09
> > Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@kernel=
.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthias.bg=
g@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@colla=
bora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> > CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, lin=
ux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bartosz G=
olaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_dir=
ection()
> >
> > If the gpio_chip::get_direction() callback is not implemented by the GP=
IO
> > controller driver, GPIOLIB emits a warning.
> >
> > Implement get_direction() for the GPIO part of pinctrl-moore.
> >
> > Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> > Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::=
get_direction()")
> > Reported-by: Frank Wunderlich <linux@fw-web.de>
>
> please use the email i used for SoB in my linked patch (closes link below=
), the other email i use only for sending patches due to mail provider limi=
tation.

I can't fix this up because the closes link isn't working right now.
Is it the same
as the one this mail came from frank-w@public-files.de?

Yours,
Linus Walleij

