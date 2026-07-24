Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A4AC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 21:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLmtuzNiJN/NtKa2kUTnWgeyP7l+US/ugXSovTsy5mc=; b=jmwIQU6NfpN3tzfpI1zOwsVrR/
	XK0ohMVBAv3u2Ssqqk6Iz6LAxrZmoqi5bONQ932fdjoYuhMBnHnAm4D3OmU1wfUBXIfYTrv1oZ+C6
	zGeOLXK1tza3HUOXrv8twj/8VjAQNG4Fsjb7jSUUsBldrc1hbL3P+ZiOQ+9plLEwWo6VgeeHjmrWU
	tE95zmMWkAXonochNEtbEh5sYjk4c7o5KuIG+tWPdRgt6lqCUSYHZSfeTCXuHGC8IM5Eg7PhLtESw
	OPcO8ETHOE/tIbAqLnFHN2UmWrDC3RhPYoHXOiruo3DXiVRQPV5dJvawrDXRPSux86webJmECWuo5
	MkfjZZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNdt-0000000HGfw-0HrM;
	Fri, 24 Jul 2026 21:41:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnNdr-0000000HGfq-1Zho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 21:41:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5502D43C5D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 21:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313A51F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 21:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784929274;
	bh=eLmtuzNiJN/NtKa2kUTnWgeyP7l+US/ugXSovTsy5mc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=knpEx5vtRJ3MDi4n/T0WX5+WX2WN+Zwj6kXGPxVh5wOH3ZeVCovQskbtzoSjQdsK8
	 7hhjtf6Ba4GV9lCE63dlFDsHLvZkU++GIpTULvKQsFlnPDhJAxsVrCnTkOjE/F+jRv
	 Pn/qUFD1g8I/Qen/F1yNcnzkk7XuE0G8FWlCEfZB4D7BzdGK4kkknBhDwU1VSmKoHb
	 AGaFRHvSgLBHwOThscZ2bgFO7pgcmfse3HNfyjZw0reTkVRT9nGwRRzDBaUdUhOYjx
	 g1CV0/EI43bUSDBPWxHlTkSTcU1ZObZ8YYClertTrg9oLWAOwkkJhgrpvCwuc26NcG
	 HAPrQsKqE539A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so841382e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 14:41:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ror7RClk0iNoV4BnnVgd59MnBQChaUyEjjPwb99C1ofzkT5tOQ/tzkUYxslfZdU2CTk/UpbCZ/jPuckq37QAIkF@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+gkvXAlF888IoMtK7rloieZXiBZ6cG9Ur6U1KrM+TZDFRFYlx
	ChL2Yj7x9Do2G3HnAhDVqX/p+ISzeo1RteisNK/lAePFuWVHUWoOh4IRxl4VYePcBAILejRbOn5
	iApSm++vo9ruFMZNhowhZqkrRE6RTjTU=
X-Received: by 2002:a05:6512:2310:b0:5ae:bf46:2acc with SMTP id
 2adb3069b0e04-5b2b2f86804mr1934146e87.63.1784929272904; Fri, 24 Jul 2026
 14:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 23:40:59 +0200
X-Gmail-Original-Message-ID: <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
X-Gm-Features: AUfX_mz6ZxVMzIVDlYKzRcjHd5uCb1mkXfd8xMBGPfxdB1J27bvJ-Aw2H_fn9Og
Message-ID: <CAD++jL=prd1KDZQawqsRmW3qp1-cJ=18-yhp861CQirOOjE5Ag@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-media@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Mauro Carvalho Chehab <mchehab@kernel.org>
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

On Wed, Jul 15, 2026 at 8:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is the finilazation of the work announced in the commit 61e1fd2abca4
> ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With thi=
s
> small series we kill gpio_request_one() and leave only two legacy calls
> devm_gpio_request_one() and gpio_request(), where the managed one has onl=
y
> a few users and high chances to be killed soon as well.
>
> The series is supposed to go via GPIO tree (due to nature of the last pat=
ch)
> with possible immutable branch for others. Please, ack.

The kernel is clearly a better place after these patches than before it, so=
:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

