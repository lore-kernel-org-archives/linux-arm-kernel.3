Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CB9CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+I06WX6uvgXsj2pG0cG7jPbgC7g2G/YZnXLAPs63BA=; b=JYFULfpI5jstxPnWvATfrSzkKd
	ABvRPT2RGjkpUtpvbqbgUEkoWDBgLRBkmntLi6UqrLj8jSi46zYxIhXCcmvvvtuaYHWzHeuv4Bjs0
	DeSuXQJ+xyWQZEdR5/3Rt//lUswzOuWVZbf4Tt2cr+6I/YSEp/Avcu8rr2cUppOv0mWGEWS9RXBMt
	P7HGTESmViT2MvZV0uv5+dvzvcKZcDmIxwPFQGQjVOUYzMf/fI9O/7LtYEl8oUcQgm7H68C87EIej
	cQJTOC66LPv2A4HO7zIoj/Ra1V6wraDW23Mj4GZ4ruuXoq2bgthfWITlEq80H1h1QNEzGWaAiGiYK
	iN/TPi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPhF-00000002ITf-3qAc;
	Wed, 07 Oct 2026 11:20:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPhE-00000002ITY-0FDB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD0FA43DE5
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A9F1F008A0
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372027;
	bh=N+I06WX6uvgXsj2pG0cG7jPbgC7g2G/YZnXLAPs63BA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HI+ikhRSvKZku8MmsDlBqzGNw59T4jYp0Jw8nQ5X18KF4HbdJTeNTaWRKI3tTduXn
	 Uqe2vdMzX7bS2HxqXqxuZnK2M5TPsBueP0MvVMcrixJJuMKZ8D/lgZJK8d00s3f2IE
	 8LAamNwTHuqqpE5Z87nKexMVjxFrIy29OQeRRuKAf8Z5lCyT78P3StKOK9PgPD4rT2
	 sar/t9oM3Wt88ftfEgtrxWuWbeYguninBqBW2yVTZ10ieTpzjcoz5BfB/bZ/LDEz6n
	 xnAZ/BMmCnDRa/cW+g6C5Sa20b82hECP1D+R0yeHw2sIYNz3Fl6hZSZr0HdcLSqrji
	 Nwh3OuthhwqUg==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-475920b9ca2so515616fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:20:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDk0Tgkhft+SFHbSjnncaDjh8MEdrBSTz7o9s+GmlRnLldt3NT986vNBeOCzMUShUd79KB4hHUto0+DQpbFtin@lists.infradead.org
X-Gm-Message-State: AFq9FYI6oWGo9zFAFjdqfv1QRc4XYYKPieAY/q7q3ceUe7kGYSq7V+Fk
	J25/E03XiEHK0ZN/u/92BsPQbgUwkLsjmVtmznubDUThS95bF5mceDemH7vn4uCWUhzRruGIHcv
	bA58j6mfzUGNK4aCEFuu2TW6uKwJH6mM=
X-Received: by 2002:a05:6870:912c:b0:494:5ad9:dd0e with SMTP id
 586e51a60fabf-4a2591cc842mr1730209fac.3.1791372027081; Wed, 07 Oct 2026
 04:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20261005111502.159855-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20261005111502.159855-1-alexandre.belloni@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:20:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLnuk5Lb+peZu=njvqCMkZ7Kskog6-KC6CPF4TWZ20UA2Q@mail.gmail.com>
X-Gm-Features: AclHuK9m5JjEJQsk3_xr16bnFnuTamplu6auBCr5yRDhyUtfMaO-VORIR7NkSHA
Message-ID: <CAD++jLnuk5Lb+peZu=njvqCMkZ7Kskog6-KC6CPF4TWZ20UA2Q@mail.gmail.com>
Subject: Re: [PATCH v2] rtc: ftrtc010: fix cast
To: alexandre.belloni@bootlin.com
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Dan Carpenter <error27@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Mon, Oct 5, 2026 at 1:15=E2=80=AFPM <alexandre.belloni@bootlin.com> wrot=
e:

> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> The hour and minute registers will rollover before the multiplication to
> convert to a number of seconds can exceed an 32bit integer, there is no
> need to cast them.
>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://patch.msgid.link/20261002105946.8rdteIpO7uWGEcTlS65F8iSi4gs=
RoXi2kgq8FTSaDPA@z/
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks for fixing this Alexandre!

Yours,
Linus Walleij

