Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8299C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqL1+pxbQbl2lD+yMbd0BnhFooll2P4VKDlpZNXroxA=; b=GfXPJo4yF6TMvNERSb5V46YFRM
	pOthnwca/Jjp/cpLfIC38C5/flwbW/UF/SN1P3S7+jdUXaXcdkgaARo2qfLaPWqX0kZQCJ1mrEJGj
	e6uYoMgYFHrAl/mR14AbQ4xg3aAYpt/oW3cWDUTz+a99RXD+vXzlMd51l8Rb3Bu6OTCax0Da8sijS
	zR1o617tvHmq/Ep1NJpKKhXdc8Z/KVU8yR92vdE5agoy+G3qG2s1U7N2kD+kywteFW12C6/Vh6QGx
	I226SwCykPmZLOMUHVZzS82lStQtkVRYjTimLSN1RQfS8CjSNVpayvT8FCDbgvUKQHLrs8NKXSiHZ
	+qEQkb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8diN-00000002Bw9-2TnT;
	Mon, 21 Sep 2026 13:05:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8diM-00000002Bvx-0wBj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 13:05:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EF6443DE7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 13:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737761F00893
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 13:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789995945;
	bh=eqL1+pxbQbl2lD+yMbd0BnhFooll2P4VKDlpZNXroxA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GytY8D3g9KdWyEtZtKTjUOE80hf8ad6hTWTO7J8PIUu0jHamYH88cX4PcpnIU4nuX
	 Fb8JSRH3Z0LaZ3h+Pgb3AsvbFcuues6Bk5RIOba2lut9pliLRttQMlHxKmbOKAH2Yb
	 Nh31eBZsWGEI2G7idQAW6xUecITXNq9iS7i2sMvQYIN8j20/cjTTq0TQ6EdLNUZCxP
	 brZjpAm9BYFp8WBMt10OoutEA4CgYr68ypEaveyMCAvHgvpTrPjaxrgg+a+wjsUKDl
	 ZZdNaF8bHTM+FswX6m4wAozccXVphUzMTrQ9GpTxAviLX5rpXaGuogEyWTAZoGR6sv
	 p4hlu95urNk3Q==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso25832021fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 06:05:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzuYzEoetiOTcUEd77MKI+/pglF3iaHA/gvHaw2icWxcR6kvqPsnyTLo5E2uswTgzNnvkEqHAQnFOY6N+Uy8CkZ@lists.infradead.org
X-Gm-Message-State: AFuF++lOuGfnRBRv8ktYJCq3RL5x/G6m1iM5Euii/Iki2m9ISPDQSHAB
	Ag4CktOCt6PDPOexFnrnSJL51SxTXSOm238by0mT//n/DnA4HoAtukycEA2uuioo3LK8Lp1dc10
	gkO7iQ+6OH3totk0muwgzkG9ZCQRtGon4ccX6dLm4dg==
X-Received: by 2002:a05:651c:b13:b0:3a5:fb20:4e63 with SMTP id
 38308e7fff4ca-3a5fbf54e10mr22033851fa.17.1789995943840; Mon, 21 Sep 2026
 06:05:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 09:05:42 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 09:05:42 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <3e3a7197.9e4e.1a0c3e88117.Coremail.zl020895@163.com>
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com>
 <20260921-cv75-v5-v8-9-282ff5d98dda@ambarella.com> <CAMRc=Mf7dtxvxBUF1fOuKw0mxdhCYPj=J4ckySPZUvcZ7a6cbQ@mail.gmail.com>
 <3e3a7197.9e4e.1a0c3e88117.Coremail.zl020895@163.com>
Date: Mon, 21 Sep 2026 09:05:42 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfSSHuPxOrP95aW5HXXE74f5X-yjr-KNavz_=tU__H33w@mail.gmail.com>
X-Gm-Features: AcwNN1XpPns_pQlHseY9Ez4-fOhLH2UhBc-jukWmFLjbznkNpQwaq4oL4Cj_puk
Message-ID: <CAMRc=MfSSHuPxOrP95aW5HXXE74f5X-yjr-KNavz_=tU__H33w@mail.gmail.com>
Subject: Re: Re:Re: [PATCH v8 09/18] gpiolib: regmap: add gpio_regmap_get_chip()
To: zl020895 <zl020895@163.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, longzhao@ambarella.com, 
	Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 21 Sep 2026 14:19:49 +0200, zl020895 <zl020895@163.com> said:
> Hi Bart,
>
> Done, sent as a follow-up:
> https://lore.kernel.org/all/20260921-gpio-doc-followup-v1-1-618738124f4c@ambarella.com/
>

No, don't send follow-ups before anything is picked up. Also: Michael Walle,
who's the maintainer for gpio-regmap was not Cc'ed on this so I'll wait for his
Ack or change requests.

Bart

