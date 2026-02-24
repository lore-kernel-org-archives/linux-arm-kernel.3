Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34A5EFB816
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSAr9mSRqnuP5eB3wK8k9lFdg3CWfDNXCKT4AlbOSsQ=; b=op1i2gnEDJYqjV
	5x47u4Z7JpWC8LwipjMblYKFDBEXMIhGKUEI2OI2LcrlJgLbN3RRRvDSQhO+6DosBukb3N5/A3PGO
	g6KypK07zbfc06rq96/poJ7CszAKXbg2sk6BJpZQBStgr/DTC2SQzIN2xdKQyJo6as02k4KyCgdRA
	MBtTq59+DxFH4ESo1lsA9znwjAN35BZ85KMJCOW6JgWe+6L4IpkxHM02MDiotF2GENgllh8tIYpPq
	ktx1mPtvdvX03aXkQbkRZQ22Okw7gx/3RE9Sgg9GiAmtDN94A/Eng8fsUZLKYQ9yumnkyoQ5YmUDt
	L8Er4YXp0vYgX3P5YQPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo5t-00000001fRI-1ydw;
	Tue, 24 Feb 2026 08:48:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo5r-00000001fQi-1qHN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A020360180
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:48:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559FCC116D0
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771922914;
	bh=pSAr9mSRqnuP5eB3wK8k9lFdg3CWfDNXCKT4AlbOSsQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=JDEhm0VfnVUPk4ssXWGGTWkmR8AaLG/WV5ab2r6Iec9YoFnPShCISi56VKMt/f6UZ
	 6xeHK+go4RAUmZuHmLXPb4KI5dSLN50rTA1kHXvimJeQSdaG7LT1XuTQnooqqWF/+9
	 JgYsUhUdPdEaCpsu48pxsQc48kDO65rIfJRzFaO8/WD/nyNiRRwmQuu4/NACY9gINC
	 rUz82hfyWz8Old8fKM785fql9ruesgiVvQvF7PRbdJTsZuhCw8xyVcGqBhGJU56wU7
	 nZ/QT+ZAP+8BFmqoTsomsiDlHZi+ELZoplJnEWwJSslToxaQRomhPH/pAhKBNc/C2u
	 NJ2IZzvUWcISQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3871126dcceso41333501fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 00:48:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCi+C5SaJzea6cAyClY0CAsYHMnW5wDBWGDd/UylbPLnoK2zkISBEOgn3Uoc69Iqt921Z5AWiVr8ZvTMvBZEXb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Pj8e1kj2a1fMgHRPs6yfCs0w/me/xDFicS/W6yFbejJs9T5y
	VfuZnuDrfgt2BSDeu/14AGqcnlKOOe1t89IDxmKPWzvZ7dRChxCqKdbYFmDjIr6Kx1WgJYhftV/
	dCy8fFKgofAQG+aNJ9mJPt68U2tixbzc=
X-Received: by 2002:a2e:8593:0:b0:386:fc3d:e42e with SMTP id
 38308e7fff4ca-389a5c45cf9mr29961451fa.41.1771922912741; Tue, 24 Feb 2026
 00:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org> <CAD++jLn6vphCXZpK3xKa-DcNwaXF-A2ZpDyFBboZSdXtUiGekw@mail.gmail.com>
In-Reply-To: <CAD++jLn6vphCXZpK3xKa-DcNwaXF-A2ZpDyFBboZSdXtUiGekw@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Feb 2026 16:48:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v66GN=UuX+-YDPByQQqYOjzi7cBi-7xA8Dyg_QLqqyueeQ@mail.gmail.com>
X-Gm-Features: AaiRm50zQM5-YqlIe0QYE5rJvFuQ7BPplM1zTgPt55qkPUD18Dv4CxcuzPCa7n8
Message-ID: <CAGb2v66GN=UuX+-YDPByQQqYOjzi7cBi-7xA8Dyg_QLqqyueeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Linus Walleij <linusw@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, James Hilliard <james.hilliard1@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Tue, Feb 24, 2026 at 4:43=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> On Mon, Feb 16, 2026 at 5:09=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wr=
ote:
>
> > After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> > gpio_chip::get_direction()"), a warning will be printed if the
> > gpio driver does not implement this callback.
> >
> > Implement it for the sunxi driver. This is simply a matter of reading
> > out the mux value from the registers, then checking if it is one of
> > the GPIO functions and which direction it is.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> Patch applied for fixes since everyone likes this patch and
> everyone is unhappy with the warning.

I was about to send v2 with an updated commit message but didn't get around
to sending it out. Would you consider dropping this one?

Sorry about the delay.


ChenYu

