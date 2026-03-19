Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5778C109022A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxGTi/5Xx5PdGJt9NL35Mt/XtcJEWxm0Lx4wi1HnrhQ=; b=KHLh6Vo0bjRyaD7O06PBx5lFqZ
	RHqu6E8eSbK6KGdsyMKaK/gVYfPwZseLMkq/eIEic9MowPe0iG/Vxp3oj3OgMFxw0i+cn6vSRq4k8
	ohmIhhNqwkelLCSx4CY7kYbYq+M9ei7yZwBM9IfF1heqPVVThzfUrTse4Z0KNXYpqidaKHzL5Voud
	NyvPes/QEUlxGnQRjjgj2ehdTPmkt6tStia72XahJn7yZ2xVdzrKAuYCoe++23B3qdfk+4ujGghcH
	I4WbguoLug2k0jnM/YBzIvUhDDKQiwdHreDNURz2pXHASF+mjNU5524CbgvVoYqcW0UHM/RDtDEJX
	ioItjprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DiF-0000000Ai0D-2uvr;
	Thu, 19 Mar 2026 13:46:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DiE-0000000Ahzt-0Un8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 13:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CD6D641661
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB37C19424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 13:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773928017;
	bh=UxGTi/5Xx5PdGJt9NL35Mt/XtcJEWxm0Lx4wi1HnrhQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RraZJbN88Ks8DyjKajp0O1uqXjUvV/1IDNGLb5SwiZjsh57xT+v9LdvPXqjsBBTke
	 WV7OzqWRBzHg1fsqtrR8VgugefS/JgUbuNA0UjhYi53rTxGjVS8SuYMrdkuHzZ8iE7
	 X+U9fyOCQTyqFPTP49q13kJD5q4R+3Icp+EN/MuqlbFePiI/hyA/4QuZ6gI6Ts3nei
	 2fqve9j9ehtupFKkbXrPR1kjMs6LV+u7Y4REpKWFEjJTlIz3mgzaUSijGh1DH4Asxe
	 jcdKIh30YBkWcMMdGFY94apubaArpC+e/+9GTSipO9+d7XzDNCAbhnGHcLyShhgWM2
	 QN4Xl//0s7T9A==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79801df3e42so11872677b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 06:46:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXd0/jYhuecLqiUfB23w9a3NRP/TAzc8sqlQs+IafHYKYbKdkWysoXg0a1hJiTlCF+H7it9/jArKMDc5A94favl@lists.infradead.org
X-Gm-Message-State: AOJu0YwGEisdBgHqZIAzScwawuEDl0K4KcWCa0OP4ke+kST7jVAvIUlq
	Bz8iloTyVLaE815PgqzemAvaeu6QMEgT9+LWiQ4weOfLqSkfXDSZX+bV4hrrmDzD+DyABX4J0/i
	yHJGTeW2ZZuo/I4kg/HHXIPad8OL9ttQ=
X-Received: by 2002:a05:690c:c247:b0:794:87bf:76ef with SMTP id
 00721157ae682-79a81a7fa9fmr36687377b3.7.1773928017113; Thu, 19 Mar 2026
 06:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
In-Reply-To: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 14:46:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
X-Gm-Features: AaiRm516XK6SGOveArWTQJh95O__heoY_pg3ef3DdbKvndSSpwMl-PSC2QgvGk8
Message-ID: <CAD++jLnVNT=_rrykAx82RE8SeBsBBdN6gFMcDUYwYj0KOpF0Ug@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_064658_195037_355186E1 
X-CRM114-Status: GOOD (  13.92  )
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

On Sat, Mar 14, 2026 at 9:10=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:

> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in unitialized state.
>
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
>
> Tested on Orange Pi Zero 3.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> Suggested-by: Chen-Yu Tsai <wens@kernel.org>

Should this have a Fixes: tag and should it be applied as an urgent fix?

Tag for stable?

Also: is there consensus with Andre that this is the way to proceed?

Yours,
Linus Walleij

