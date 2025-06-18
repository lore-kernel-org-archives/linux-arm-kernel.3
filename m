Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A67C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=; b=Jvix/DsJX4Ufu3lMC6ycxO1y1y
	EkZEA1t1JsY6iWTw1sqKmSrg3rVFh6RFoYS5J9BAqzzZqj2+u3BG9CeoM+1qLoNvatCc3PzFrS2Nr
	TEPNS2/kDzfMz7Em4PEYqnWCPJlnJMBSfdx/ad62P9uqoOJVjReG2c5+2bsYVLIEIgqOc7Qp5zf9I
	BHUrXWKGdEsS5eP8r2oInGFR34VZQCBofFvISaKNlBGj6q/kF99ag8pvWWDbOygg81c6PwhHcjzxv
	CuxsrQkdOHpJcbfO4c64GNKxLU8OrTk/PugYFw2rG8WjjFxu/27ClmiP6MS9qoDA+vji5F6TH5sKJ
	u9N9QM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRunZ-0000000Ac1A-2kAR;
	Wed, 18 Jun 2025 15:34:01 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt6u-0000000ALc0-24qb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:45:53 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso4201013e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750254351; x=1750859151; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=;
        b=k9z0yjJ03bhxlHMIhU27x/W1mLFoQciVtHJoUtfsOrQLRJnKUaPdoyfIIDjaZ5c2Zp
         NCRxucHjeiVyA5N5KJcgYwC/wv/kS3lBojQ0gRAkvPCnFTQNrp2Hh7XDrrRfx242S3NY
         Ic24qIcQ3LHy59gT9EaW3wROdgnMevyvGFIJGzK1IvyWH3BBMqdhJ2b2xguaGkXko9ju
         yFmmAsNEx+MwXdFEaoxOQ5o3/u0YuP8rTghnWJTiuOXOzhzWjYGAYISJDqjxT7FCZJPu
         EfSnKQsO4Ajiv/tfP2VUb5vT35HBZfVC9zdtsmhg52g99HIzSMHix3gcyA1lmU4nQevi
         fCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254351; x=1750859151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/gJrRRXdsw8VIK/TYIkdg/GMO90OUx2DtzMMD7n2LE=;
        b=KASXshaVNdRQ5R9IqdWZKzw0+B8i2hl0KOeWWewr5flgt9njOV/LrDjzSrJBvUML9t
         ebtvlQ82k+/+R067JldV6RIYPqQ65/9A7h6pean6UDaRMAyKqA2lQ+//+XGpCb3SAEUs
         hEikUpeQZ31/HWe9e3omfT34v8ZZXxb3H265iUl3pMgcLVOvrfFg6N02pn8erfPjo5tw
         fnFEFzRe70Sl1UyQ71EsaLZEltIl73Wrt4emBocR7oVbfRmz8KkZqNk9fheN4/ucx3Dk
         Hh+xhLcUWW7N6cGzteG2FxgmYp5j1Wh9N4Ce5Mnv0HNVFBdBUqzC6xaiM/3U99cL0Qsy
         xIkA==
X-Forwarded-Encrypted: i=1; AJvYcCU8AvkuiqD7UxXRrY7Hptv4KLv+HIc+BB1UY+aucf80t0IAdLURaC+JH42QuY9mkcHcasdWdHrgFCKuU7XJtGzJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw95UgORIR0y61tPSIv+wHqCyjjS6cGShrbMjqczOzBoEVAjDFj
	vkl+6pOiHqcksTAjwF6LKrM9iRsglk22+FdVyjTuBTiphI/OjO4+RR5T52iasn13wIShFAVMtdz
	SpwYI/H4eDKKfmicU4+cxiRkbY+ayjNcsbHwpp7zEsQ==
X-Gm-Gg: ASbGnctOgX9gmtEGsDOu8daPvlWUMd2QL1h9rTvzunG0PPH6rrEoCCium+x2O9fldzC
	gIWtSu6hUEkxM5eJcnkIipcq88W7ovyAVl1AUDM1Smu22NO2CwLm1YKN6M9+ARQ6hbzRnneilVI
	QX3lFWl8/5fc7x/dXOcZh5PGxxxxGbadAuj9WBaOaX9VA=
X-Google-Smtp-Source: AGHT+IHUziRG/lS1am2zFPjRrmYzIzsrLZlEENKDKAFZ3rfCXoeUyGuA1Pal15qAwexM+uRj2zqwrZ6IAzL5/+4dp/E=
X-Received: by 2002:a05:6512:3c9c:b0:553:2f61:58eb with SMTP id
 2adb3069b0e04-553b6f3f11fmr3977179e87.49.1750254350731; Wed, 18 Jun 2025
 06:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com> <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
In-Reply-To: <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 15:45:39 +0200
X-Gm-Features: AX0GCFswiuSIv0ost8RQF2yKzjiS_gJyepvrD4dGuyTD_K-1OJ1mJ0Mc6pZHztk
Message-ID: <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_064552_540223_5C75C3B0 
X-CRM114-Status: GOOD (  14.11  )
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

On Wed, Jun 18, 2025 at 2:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> I have a rework of gpio-mmio in progress that removes the bgpio
> specific fields from struct gpio_chip. This includes moving the flags
> into a separate gpio/generic.h header. I really need to either apply
> it myself or get an immutable tag from you with this change.

OK try this, if you pull in this to your tree and work with refactorings
on top, everything should work out fine in the end:

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/ib-gpio-mmio-no-input-tag

for you to fetch changes up to 4fb8c5d36a1cfd97cd715eb4256708bc09724f3d:

  gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip (2025-06-18
15:40:29 +0200)

----------------------------------------------------------------
Simple change for no-input MMIO GPIO

----------------------------------------------------------------
Cl=C3=A9ment Le Goffic (1):
      gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip

 drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
 include/linux/gpio/driver.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)


Yours,
Linus Walleij

