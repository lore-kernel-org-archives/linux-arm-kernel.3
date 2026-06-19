Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCFFCD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b07NeBKHmWEsMBrslV3njAnQXC0YyuL7comfc7gkAqs=; b=Toc1/ZrlrGBaI50ilv5ZssV/XB
	mYmJu5bcyDVjvmdfu6MDcnBlI7OXwvHl5yd+He4glRQlUOwWA4Dwl7qIRVmVYsZFVdG06sW+1aInU
	Z4+Rk3kGKV5YEFih6Ftsx7c7jUOgCJMTiIPnX28kIeu8GB6FCsueIRLY2F/1IgldTxnbt50gZN2ZT
	eD9X+6aGyY1yu8UucmCqNARUNm38RtHTHu2GdER+wXTbvMaVPQRKNIVw8e8ltRLzP3Op7KTlZEvcb
	3sVGO3I9UTBYgzOkqx6/UJQPGKCCnfaSSeo6d0mYq8gNfBJzk04Zk9dNKhQNTpwuJUlGVQCUMXv+a
	e3EtMsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTtf-000000027Zn-0l0i;
	Fri, 19 Jun 2026 07:44:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTtd-000000027Zb-267Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:44:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F50E601E4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311FD1F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781855052;
	bh=b07NeBKHmWEsMBrslV3njAnQXC0YyuL7comfc7gkAqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D4KlcMZWcEbII5o06cTlozauqpbocsERRnGTgzKHEJV6aSKOMbSzUrQD8DbLTwfxG
	 Otfrd9/730NY49a3WLOuASWRZ3BY72X28GrB/Oj7Uoat7XK4ZjxL14U2O6I5MQcu5m
	 o0rXWYiK5SmKwhdEhPpkNoTjIIWH4LnIYCnZylfr4jI3mtcM3VWTWbtfoG3h6sMiuy
	 mJC4x3k/YfXEayDyEdHsX4QIOM6DXAvU/Q8wABxoOq+GJpSM4pIKRrMIe7opmczwbL
	 XKmvnbTspGK/ohhzgFixJVPkRqP2K3U63L7ZnBQp4QR0Kkze+NzPA+wMJ+pSo4vsrd
	 8RtZm9mSbQqpw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad4d262fc1so1513307e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:44:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/K344oe3Ozfh4bTdfPfWcTNrtFXp3dSbwp8UGv9GObTWR7I2bDbcU5KLd7wmuPEvgRSWWshtMgGCe/QBsn7uD4@lists.infradead.org
X-Gm-Message-State: AOJu0YwpX3rjs91oQSrM6252H6IE1wI720gGYpgcZNdQ/ImZKiyCjZhG
	/1tnn5z8Ncx93w5WBBwBsAcK0lqchPrPGYEAalYfcnCOBlejh8zDGQOgn2afvkpYtz8fwwIbZr2
	/ilQnAq3FAIi16ivdRYje0ddBLbdjsHw=
X-Received: by 2002:ac2:51ce:0:b0:5aa:5f11:ddb9 with SMTP id
 2adb3069b0e04-5ad562dbb2bmr842962e87.40.1781855050988; Fri, 19 Jun 2026
 00:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
 <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
In-Reply-To: <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 19 Jun 2026 09:43:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4eByc6A4ovjvvOEE83RPA7AUcL5Cyvs6KXezVWSj1Hg@mail.gmail.com>
X-Gm-Features: AVVi8CfR2bmTpQpCbDzuwjR-h7T2akz1CHyf0xAarqe_ynmYniODNtWUzZ11GCQ
Message-ID: <CAD++jLk4eByc6A4ovjvvOEE83RPA7AUcL5Cyvs6KXezVWSj1Hg@mail.gmail.com>
Subject: Re: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
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

Hi Runyu,

On Thu, Jun 18, 2026 at 5:11=E2=80=AFPM Runyu Xiao <runyu.xiao@seu.edu.cn> =
wrote:

> I agree that marking these memory-mapped controllers as can_sleep is too
> broad if the only sleepable part is the pinctrl range lookup.  That would
> make consumers treat otherwise MMIO-backed get/set paths as sleepable,
> which is not the contract I want to change.
>
> I will hold back the at91-pio4/stm32/sunxi can_sleep series and look at
> the pinctrl core direction instead, specifically whether
> pinctrldev_list_mutex can be replaced by a non-sleeping lock for
> pinctrl_get_device_gpio_range().  That should also line up with the GPIO
> direction callback case discussed in the other thread.

Your replies look like those one would get from an AI agent,
because they are repeating information (context) that I have just
provided, just with other words.

If this is the case you need to instruct your agent to be terse in
mailing list replies: it needs to quote what I just said with >
markers in the margin and just add the word "Agreed" after
it.

Yours,
Linus Walleij

