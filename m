Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C0EC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 21:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbyAPqpVVDj73MIxAp+O7++5oakcBtgyhfQ5MUfv9wA=; b=Osyw5x0i4uPb2DWS/FayOUEJ2T
	4iP3VN6cbpHQe3rfDKEhH6sUf5extyLz+pMyRN4LHsxMqX5SAvQyGf/igXjpVBtzywHZLUL8YZlqS
	Gk4QQOSC1r77usSbIbILW3aOTSM2YSFa/lGWrk5/CBUUHJ9mC/KduYVYuqoNGmcfO5gnsJ1w/Uk3K
	Zs1dpGc2Ror4eATJNoOfO0ZBqVLpZa3OkOfuoa0zFsiRGdDJQ7vGhJp3MAPqemSYi7CFHdYgo12HF
	fEKqcN2/bKhQir+SDRuW46x/wmRlaP57bkHG7LYSCtoCAcs5DdPxj3arkfoHz+d9bT3awmPTDonhb
	p4U858Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfl7m-00000007v4k-2aUO;
	Fri, 03 Jul 2026 21:08:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfl7l-00000007v4e-3nkF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 21:08:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CAD6600C8
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 21:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89ED1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112916;
	bh=dbyAPqpVVDj73MIxAp+O7++5oakcBtgyhfQ5MUfv9wA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EGXs2KfkB6nffTeSTIc7TeXdSbtG5TyfFfi8HXXIRrPak5FSAKTk7rkk7I577+6EA
	 XAkMgJxpdzqmXZkmnNsGvx2N9WGScxDCphG6OYj2t6ThZH9EcQ8f5fjcZTP8j1sLXW
	 TOrnfpT+XU470zk2ZLlFlagIJYPh4fD+yUzKtE57X3R0L6OiITaWOOjedzDTL6r7Eb
	 FSZWQxseQkMVZnLRwT1paLKKO+6OSBQVd7P1TOKt50YNnOjMxqpVCsW3iyHvPcRWHv
	 h57mspi005fZDuk2+rZ+jVqmON8FCpvMMcw6+i+YvG0iQZj2aE5j2kirc23Snsg6Fk
	 5TqHhW+WxPnXw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeb78090edso797694e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 14:08:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrf1283jajJ+bLmSCbguc3nvGjFzc5iBreUxFESDWQMFcPX2Pq9lCTZ9drVKMFF21rdTFFeS+UVyknDnncBWTTg@lists.infradead.org
X-Gm-Message-State: AOJu0YzAkYIUX/zaZ1ZMObzGV51/c5ZZsOh9lPsFKQifa2WDJ1M9eVzT
	xEKIaG1SEXbNvBlLTSLjsMNal073NBLhdRYX5a3MequwCwe056eI8QyerD7bbiXHHEZtff9TD1e
	UPa9mvOIzf/VlbBbIe9vYJKu5+oc5rA4=
X-Received: by 2002:a05:6512:8348:b0:5ae:c62b:fc60 with SMTP id
 2adb3069b0e04-5aed50bb897mr70686e87.54.1783112915808; Fri, 03 Jul 2026
 14:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
 <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
 <CAD++jLmmHXBC9ni0pcVoB2HNK+osBzgirxH7vLHZaANmoe-tpQ@mail.gmail.com> <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
In-Reply-To: <DJNY3N48KALQ.1JASSQTBU3GTN@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:08:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLn1SASRCLjSGsf7JMP9Oo=ij43iM6K8g=wWtZf__Xe3kA@mail.gmail.com>
X-Gm-Features: AVVi8CfoqwVpbv66dchFn3mu55vZSee6bMlCDU3AfTg-A0SyKBJyg13dDtshHOM
Message-ID: <CAD++jLn1SASRCLjSGsf7JMP9Oo=ij43iM6K8g=wWtZf__Xe3kA@mail.gmail.com>
Subject: Re: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe success
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, Jul 2, 2026 at 10:34=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> > I actually don't generally agree, but you are using this driver more th=
an
> > me now so let's go with your minimalist dmesg style for this driver.
>
> I get from where you stand, but the info level is somewhat strong.
> Documentation/process/coding-style.rst agrees ("When drivers are
> working properly they are quiet").
>
> If you like this log line we can turn it into a lower debug level?

My actual preference for the record is not simple.

I prefer noisy talkative dmesg when the platform/system is new,
and new stuff is being added to the kernel in every release in
large chunks.

This is when things could go missing and cause regressions
and it's nice to see a "hello world" in dmesg.

As the platform matures and get full support in the kernel,
these can be dropped gradually, because the driver can be
trusted to probe properly.

So, not a simple yes/no position at all.

Yours,
Linus Walleij

