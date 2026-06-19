Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D80CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5VtAymxlLFEtb0U6jcGmlhzLhg//OIMtC8T2ioCYrc=; b=PbWUHYC4Kb/FEgmwTffP527svg
	aSv7FGZG2h95MJc7IrmHNH1buBTjV2DpqmmdiAt4RpIQssV+0SmdHG7SsvSF+t5r3ix5woBjbyUCb
	NjmtcJzfsP5FRNkjwuHAdXCU/B1WQHe3r3LrgK5NCQNJUinN5YeaEZUCNIg7o/wxo9GZqk8949eBj
	kBV0BWTHUOElQ/nqHG3ZDhblt/jr+i88v4B7LpSnXEkSuy1OeQWm7lahyTOkVZp8KwdA8R58Neq4l
	fpR+3Rwo80kJXwQMbto7FbtlqcQ+Cw3HRUgKEMSzNhnBLIWk1zqVvSEs24xyTwsThyACaE4JL+ql8
	43Io2wCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waV6l-00000002CY7-0bR2;
	Fri, 19 Jun 2026 09:01:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waV6i-00000002CXw-43ua
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 09:01:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EB9244265
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 09:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289ED1F0155C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781859708;
	bh=Y5VtAymxlLFEtb0U6jcGmlhzLhg//OIMtC8T2ioCYrc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cFZb9JqSPtnh8VwXU7oKlMKiSPgRJmzZnIAd1QeGARdtrTOXzyFwBw8CQeMAKb/mO
	 IlRLx9yBLuddW8AgBZ1+jHzpLszyAp1IVF1qhFE4LghsaJ+Uj1VwzjXYaJNo+kh5Zf
	 KwrUJc13uiSw19BaVUia2ZfmmJuSAPBeVHmrqPfuFI9XfZOBYbheQpi2tVFzNLz4Lm
	 3nukAGpY4S488Gaxjjcq4nYc8JVlj/PtPvSsjP6HJ87/p13zr8/xTgBkJnj1W3dO0x
	 Ub60SWVqtpNCO9W+l2i1MpAFEXa6NrSPAEwIwxIY8buLyQHmPvhtl/EzH803l9LtcT
	 XzezWFVGTNrnQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so1847070e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 02:01:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8J+hOSf5Hg3lsjL/kp+y2G8UkXjLBtrD6IICr3E6ELUr7fLTs1xWQe8Ef0wAUzVPH8LyR2lqk03ETNNLtQrx9d@lists.infradead.org
X-Gm-Message-State: AOJu0YzUjtv08mHRQvYjcCq5ZVKSAh/2tHuwSLn6LNp5KlmqKB0C3RSh
	al/9SalfVULKi5bZP9YjqEMeLqY+9v28HeHy/A2iPQvWcFXuES+ZoCTDtXT70t/z6PJ6XVcv3h9
	AVPy1o3AekscswH5zkOBKxN8az5lrnGrXQ0OKEq5WwQ==
X-Received: by 2002:a05:6512:32cd:b0:5ad:5454:ce36 with SMTP id
 2adb3069b0e04-5ad576e14f5mr699548e87.14.1781859706741; Fri, 19 Jun 2026
 02:01:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 04:01:44 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 04:01:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
MIME-Version: 1.0
References: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn> <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
Date: Fri, 19 Jun 2026 04:01:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=McwAnoYXBB5hhTko5Om9=khOuxpVAvegSFQ7-VexNQMKw@mail.gmail.com>
X-Gm-Features: AVVi8Cf8K9ux4cOtecot2S0VT6T3CGese0FIUj-6Z9fRYnLoXRYWJS40QkJmni8
Message-ID: <CAMRc=McwAnoYXBB5hhTko5Om9=khOuxpVAvegSFQ7-VexNQMKw@mail.gmail.com>
Subject: Re: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Antonio Borneo <antonio.borneo@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, 
	Runyu Xiao <runyu.xiao@seu.edu.cn>
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

On Thu, 18 Jun 2026 15:15:30 +0200, Linus Walleij <linusw@kernel.org> said:
> Hi Runyu,
>
> thanks for your analysis!
>
> On Thu, Jun 18, 2026 at 7:42=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn=
> wrote:
>
>> The path we are concerned about is:
>>
>>   gpiod_set_config()
>>     -> gpio_do_set_config()
>>        -> gpiochip_generic_config()
>>        -> pinctrl_gpio_set_config()
>>        -> pinctrl_get_device_gpio_range()
>>        -> mutex_lock(&pctldev->mutex)
>
> That would be mutex_lock(&pinctrldev_list_mutex); would it not?
>
>> If gpiod_cansleep() returns false, a GPIO forwarder or another consumer
>> can choose an atomic carrier and call gpiod_set_config() while holding a
>> spinlock.
>
> I see the problem.
>
>> The local draft I am considering marks only these controllers as
>> sleeping:
>>
>>   pinctrl: at91-pio4: mark the GPIO controller as sleeping
>>   pinctrl: stm32: mark the GPIO controller as sleeping
>>   pinctrl: sunxi: mark the GPIO controller as sleeping
>>
>> The reason is that all three expose gpiochip_generic_config() and can
>> therefore reach the pinctrl mutex from the GPIO set_config path, while
>> their current gpio_chip registration does not set can_sleep.
>
> But that's not the right solution is it? These controllers can probably
> just write a register and be done with it, they all look like they are
> memory-mapped? That means we introduce sleep where not needed.
>
> Can we simply replace pinctrldev_list_mutex with a spinlock?

Oh I've tried, I've give it a few attempts in the past. It's not a "simply"
case this one! :)

> The list isn't gonna be huge and all in-memory anyway.
> If it takes too much time we need to think about putting the
> ranges in a better data structure such as the maple tree.
>

FWIW radix tree provides some RCU synchronization IIRC.

> mutex_lock(&pinctrldev_list_mutex); could then be turned
> into spinlock_irqsave() or even better
> guard(spinlock_irqsave)(&pinctrldev_list_lock) in
> pinctrl_get_device_gpio_range().
>

I recall running into places where a mutex would be taken in atomic context
in that case.

Bart

> This would mean we just take two different spinlocks in seqence
> and save state in each so it should work just fine.
>
> Yours,
> Linus Walleij
>

