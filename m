Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B1BCC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 23:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wiNbuPmyHWvBDHH4TW2Sjy48ZttxSv2iyqaxH8oE7rE=; b=iEdTekfhvD7G/+sCK3045WqhzY
	kzGx4lXmzDWD9TwEjMqPp9MzSnD554G8EGFN2uQ+/iksBHC5XuIoQhQsBIRif1HVD4Oy1MmEEHpzE
	HqkBbe1ocbGlT+d6WVF8Of7RIz2FVqzh5vg66yCjXVlad8Dfj8IB/eWnB1fbSWdG2vd70KcXsnqFM
	xww2nI1M7ZDkBjwMDr8pMgJbLquPa7etIvLUcq0Q2ss/2asyhhf7r9KI3CMaJmbCFMZkyUYXzicIN
	hRGkUlJobNng2Sm/5srcrsF7a1lmdUEaNDC8812bHc+u2TShzODZI9Gv+2HT47zjQiUUUqw6f8JDZ
	s4yWskFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGm44-0000000EEV3-0FmJ;
	Tue, 13 Oct 2026 23:37:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGm42-0000000EEUn-0Tu0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 23:37:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98C7A43C69
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED7E1F0089D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 23:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934665;
	bh=wiNbuPmyHWvBDHH4TW2Sjy48ZttxSv2iyqaxH8oE7rE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QoqZ6dxeYqGlPOIJat6pK5YMTTV3YTmEo3O5ZvSlYHMd2jbkMyWMXEc9EeCYwxXYP
	 SNs3OR9kY82yBuz2xQG6HyB61dkjVXw3q52Hur7ulfucGANvW57mi5Es9FXSum4vLS
	 R1jE9ExOCHairEE2iK/vBAufAtYJ32IiD7MzbDC8HEY1Q75YaIW9Itet9MFtm2xICF
	 pO5Xw+NEd/IPnTqAEgI+KkWZxoeHZyhriOz6yzoTntwX/gzuW7CsY4V7t7JJiZraCM
	 6A1HdIJIs1USLZvuza6wmhZvm6FEe+/6/5l4vZ+fP+RDm6A60MToCoTzaDRI+L3Icn
	 XHy9Y8rJ1ulDg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a9cc82ef31so3390991fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:37:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwu+gZGjc7/HL8kkC06aL8o+H4rNgsdWcOh7V+Jbb5JeYL90Pocwt1EJqnZrkVHEgVDT+rZxnWkXhWY+2CjYqLx@lists.infradead.org
X-Gm-Message-State: AFq9FYIV/U2sR/uX761u4cLCWAAPF+KkMp9id9SJpcYexoj3XM7WYfbh
	ZVBSIQ6qt6xm+xkED4oNQ7woBEyOQjthVkU7JMPgfPz7F/zLjQ+ggmedx7o9VHZCch3tXiM1Ptm
	+0Yk/EpNvUwnCEPJpw9iAsrbvQZDiStY=
X-Received: by 2002:a05:6512:3b24:b0:5bb:7829:741c with SMTP id
 2adb3069b0e04-5bcde35ea87mr4836395e87.1.1791934664181; Tue, 13 Oct 2026
 16:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261011061722.3159941-1-make_ruc2021@163.com>
In-Reply-To: <20261011061722.3159941-1-make_ruc2021@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:37:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHiKZ0OuD4Yb=+YoB7mM7KVPCNAzy4qRuRq1P3LEQDLQ@mail.gmail.com>
X-Gm-Features: AclHuK9TqHDzu3p9JgxKkHBWbUqRTWvhKXq68f01GBj1YgfR4EN8Zm8P75JUKC4
Message-ID: <CAD++jLnHiKZ0OuD4Yb=+YoB7mM7KVPCNAzy4qRuRq1P3LEQDLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Fix fwnode reference leak in stm32_gpiolib_register_bank()
To: Ma Ke <make_ruc2021@163.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, andriy.shevchenko@linux.intel.com, 
	fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, stable@vger.kernel.org
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

On Sun, Oct 11, 2026 at 8:17=E2=80=AFAM Ma Ke <make_ruc2021@163.com> wrote:

> stm32_gpiolib_register_bank() walks the "gpio-ranges" property with
> fwnode_property_get_reference_args().  As documented in
> drivers/base/property.c:
>
>  * The caller is responsible for calling fwnode_handle_put() on the
>  * returned @args->fwnode pointer.
>
> The returned reference is never put.  The function calls the helper
> twice, once directly and then repeatedly in a while loop, and each
> call overwrites args, so only the last reference is even reachable
> and all the earlier ones are leaked for good.
>
> Put the reference as soon as args.args[] has been consumed, both for
> the initial call and for every iteration of the loop.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_nod=
e() helper")
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

Patch applied as nonurgent fix, look into Andy's comment
and see if you can follow up with a thorough fix.

Yours,
Linus Walleij

