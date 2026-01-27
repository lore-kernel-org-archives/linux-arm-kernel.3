Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248DCD19515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOm7lxyY1Tc3UFUw/xoRTNbb5KRa+LpVsi+cTsx+qLc=; b=ROS5lEikBKtmVgTz3oiOYvwOxy
	g9l5+ixE1/Eq/doRDbXy9qs/TadenyRiThAzmBgiLe0s2znFEFgbgkYnHBK4n+6HVvDApyPZg/kvr
	0YECzh0xu9O5+YZLINxkmwokKzWapXVXQv9UkHr6rYqLWhJPtSX5Xdk0858kTGC+47/82XtpB20iY
	XKZdh9f1EHXDq3IF0F0XP4cqh1Dwd0TIllBMQAsL94eMrL5ObA7RaQFExZc6ibOyv4xzqv6TBTGFv
	NCmQ2vfRF1S6/hlgzFQWFzsDpweT5d5VJDJHrCG+nAr/e+xy5Xj6T0hAQY4aQF88VUJV9SZrgjhou
	DM4ZcgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfZO-0000000DyAd-1wYV;
	Tue, 27 Jan 2026 09:41:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfZK-0000000DyA2-2Ze6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B059E41AD1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92666C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506865;
	bh=eOm7lxyY1Tc3UFUw/xoRTNbb5KRa+LpVsi+cTsx+qLc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=VqQqBU6oOkBOQIAHVVW9j3hspWpF3dWPTc8PDMc0z3BnutT6XrF0gEu/A5aHeC7y+
	 87PKqdGjSaJQjLG7RR+OXStps51moVlqUjIpIH9q2HdJ5VP47dOngle4zLGm+vUKl5
	 XKO5jetR1+UlqoX++ljJOtnH52HD2YahKoo2RC9xSmqY7zKiv1iSXvJMmkd2LmxfCU
	 Cxn+ca0RzOokoptk4L1xJT8n99P9A/NLJa6a5eQ1HcFmiW2DUia74m52P7lItZXV3U
	 YNmbhhYc44wfhiuUmBiVkpfajXXKCCBht6dlpN74+7gaAVuHjnNziquOJmGtspaZam
	 9bnqesQ55ImeA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b76844f89so5210477e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:41:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9tYZaPSi2BY+4ds7mDmTjE2LbBnsjpsNwa/oCkndWPiKtwllhs4fBe5E3aBOv499tAI8VHp4nLe0kfK0t55rp@lists.infradead.org
X-Gm-Message-State: AOJu0Yyok1rfiQrxSXqaaexe2yzPwAWrOMitmFvvXfBslYdgnHnavQaV
	2wil8dAjLcSW5msrv7k5caT0CMqI+5YBcaWmZEkomQ1m3pgbSpYtJuRe18zjpnJgQ5q+hLe064E
	pK+f/U1xUyTtHNNDOntmsXJQQafBsvHHZUdxHYocLBg==
X-Received: by 2002:a05:6512:1315:b0:59d:d659:661a with SMTP id
 2adb3069b0e04-59e0401fc28mr534674e87.13.1769506864295; Tue, 27 Jan 2026
 01:41:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:41:03 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:41:03 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
MIME-Version: 1.0
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com> <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
Date: Tue, 27 Jan 2026 01:41:03 -0800
X-Gmail-Original-Message-ID: <CAMRc=McPYmbWJuK5CJp3Q1guWJJOHYJvn46RWGs4T=QTPuSyzg@mail.gmail.com>
X-Gm-Features: AZwV_QjxuGgyv_lskuObHAVoLkrg1Z68koiUm97tVl4rp42X06QqGdyJPsB5dj4
Message-ID: <CAMRc=McPYmbWJuK5CJp3Q1guWJJOHYJvn46RWGs4T=QTPuSyzg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: codec: Remove ak4641
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peng Fan <peng.fan@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014106_674420_FE50FC8F 
X-CRM114-Status: GOOD (  10.93  )
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

On Thu, 22 Jan 2026 13:44:57 +0100, "Peng Fan (OSS)"
<peng.fan@oss.nxp.com> said:
> From: Peng Fan <peng.fan@nxp.com>
>
> Since commit d6df7df7ae5a0 ("ARM: pxa: remove unused board files"), there
> has been no in-tree user of the AK4641 codec driver. The last user
> (HP iPAQ hx4700) was a non-DT PXA board file that instantiated the device
> via I2C board data; that code was removed as part of the PXA board-file
> purge.
>
> The AK4641 driver was introduced ~2011 and still probes only via the I2C
> device-ID table ('.id_table'), without an 'of_match_table', so there are
> no upstream Devicetree users to retain. With no in-tree users left, remove
> the driver.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Yes, please!

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

