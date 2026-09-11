Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455B8C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=; b=uL2vztAlC/LJQdkICYlf8nBl68
	iBp0Ha8qv1Eek5AtkMs83mAC+MQlBqdiGHw8nfka8B/exPtuwEnljuvRTPnPr3dAvMW/qKAsvj5fn
	e/hXtk6u/NVNGXaaHvfAvKYDwBPcyIRk5fp70G/WrcndWCMoGS00ubbtS+l86G7VvnbCAzlsfW0W3
	dCbATgbyD4zV34Nm+Cn+D9iSchyGox/rb0oO+pOxW357okfwO05ds48m//rEMewDdVjgWOwP6lC7t
	xFiuFSDH9SZ64cX5L62v1rMh2VhZyWHDx9qz/KPxs99vxNpzco1d9JOt2f+oNugh4ocQqCEsK3zB5
	GkJd0CvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50n1-0000000GgfA-3ALF;
	Fri, 11 Sep 2026 12:55:35 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50mv-0000000Ggef-21sO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:55:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso9103955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 05:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789131328; x=1789736128; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=acIYA3Ghq0EzEh7FhlpSG30Fl3kMU/ZiAe/wbqKt+vbuiNJsDl1oP58u5PB0KxjUmc
         hqEiKyD/XQ8syhydOK5zeTi6M3EkjrC5mh3tmnxvKyMrmQ6hEygXeuF2NG6gnb+N0arb
         at338cz8nGDcREjzpOWN5+e0mT7wLpRUyNigAkFmVvkbxr6DPVF5LlmvzGJJIO4TQ5OX
         GtItdl0g/O6laSFcpXLkNxreyj9K9e9nypajPt7iP/adkrUrOeD9b05bIagSInckUrIF
         wo1nq3WVEjbBuLCSrRTg290hald1U9OnkjURbUTxVc1ZLaghyv1u8gQR++APJciuUQSs
         51og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789131328; x=1789736128;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+ZHt1Hv90ZffrGNuf1k0Rp2yL5IB44JRHsPcN8IeA0=;
        b=bVqY88DaoohnCy0x2CMlWp+iWjFSGqN//mXivBU5Vmw2Q5VRo+cXuzNgS/0YQ8RxnX
         jMApqctGORisiqb1aMrrbL5ZtuGu4pM5CRfznMe2R0TeMchAxt6u0VQmBGBv03QAObqV
         F1G6UaU19NsinbYOSOk816vRCDBbwe31fZ9cP7ad4A8mUcCz6EHiwW6gdZe+vewscyMG
         YyXu/Cx7Gqip1Qy0EDULSyQ3KoWGbEw6dYcc/18zQGnCjtRvt0RyU/xCcZU5BOh6tGoy
         JdysVjXp3hCcf1zTBcjNnsZ3Seq5736HBeufSG8PJJT1losTs9gVHOj7ETsD/ZP3MCAT
         LDBA==
X-Forwarded-Encrypted: i=1; AKwUvBy3o0En4625k/iSU+a9MHjLhQNiWc0GLmwONhQrkZPSrFIMJmGCVTPkY1JevxZQQhyrZ2qf08DiGE4gBAnbvAci@lists.infradead.org
X-Gm-Message-State: AFuF++lH7CgNsY4u2fAx+XntwDhPpQX21BgazL07cDjYP+HPPBJzdDe2
	H5BZAPw/P9xspVg2JH/FdlNpRJ8OPiGPs1YNAYQLK7OWhfUQBLlfj6WLsCX4hMjccVs=
X-Gm-Gg: AYBFou0u+Y46cohY1i6vhz762XfsbFQ/oppPw7OlANRTPrUgU1jewZDBmJ0jxa+ezpn
	OspR4zxzQrSzNsRpKs+uLep9N1FGTD3nz80YDZYXjdldxSM8rCMKJOb3dZGndSMUAfFBaWjz0zi
	Fr3nj4YFTQuDR+nGzuGTApIANd0CO/H4RZEvEvTgm/MlH98FoIpAvGMKQVbV0Bd8t8FtktW4x18
	upRTY+lezPJQblzczsWzKlc+J1045ONRCUSoP5aiEEY7x6oD5zrTuiws0+mwcA+I161H/+k8X4Y
	2OYoqxDYuROap8zYwq20zXq9aE6s7JUxTHe3Qdbn/MWAiW54odJ4BotO486dofcjvb5QCRB5ZUO
	CscgmF5uld16v+3mD4Qli2PdsuYjWfWcIDfQ7xMvIJORfRV8XibaTBHFIItJ8OmH4tkwf5IaUDc
	pbCQJEGikJBCZDU03sRzfQtvf9IdNc5n2gF+pEnCNgaL8I0yawjlu9eqpQkJx4Uv54HFZ1Hkaof
	cYF3h40DAbXjq+03Zc=
X-Received: by 2002:a05:600c:3ba9:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49e619c0558mr56438145e9.20.1789131327727;
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a34cacsm41600045e9.0.2026.09.11.05.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:55:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Long Zhao via B4 Relay
 <devnull+longzhao.ambarella.com@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Long Zhao <longzhao@ambarella.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvi?=
 =?utf-8?Q?nen?=
 <ilpo.jarvinen@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao
 <zl020895@163.com>, Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/13] Ambarella CV75 SoC minimal bring-up
In-Reply-To: <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
 <1jwlt1ld6c.fsf@starbuckisacylon.baylibre.com>
 <46d21889-6b52-4c09-8f77-7c08dba93777@kernel.org>
Date: Fri, 11 Sep 2026 14:55:25 +0200
Message-ID: <1jld986j7m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_055530_265882_0A5DB388 
X-CRM114-Status: GOOD (  16.52  )
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

On ven. 04 sept. 2026 at 08:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/09/2026 08:54, Jerome Brunet wrote:
>> On ven. 04 sept. 2026 at 14:38, Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org> wrote:
>>>
>>>  .../devicetree/bindings/arm/ambarella.yaml         |  24 +
>>>  .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++
>>>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  32 +-
>>>  Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
>>>  .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 239 +++++++
>>>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>>>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>>>  MAINTAINERS                                        |  14 +
>>>  arch/arm64/Kconfig.platforms                       |   6 +
>>>  arch/arm64/boot/dts/Makefile                       |   1 +
>>>  arch/arm64/boot/dts/ambarella/Makefile             |   3 +
>>>  arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 +
>>>  arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++
>>>  arch/arm64/configs/defconfig                       |   1 +
>>>  drivers/clk/Kconfig                                |   1 +
>>>  drivers/clk/Makefile                               |   1 +
>>>  drivers/clk/ambarella/Kconfig                      |  13 +
>>>  drivers/clk/ambarella/Makefile                     |   6 +
>>>  drivers/clk/ambarella/ccu-cv75.c                   | 296 ++++++++
>>>  drivers/clk/ambarella/ccu_common.c                 |  60 ++
>>>  drivers/clk/ambarella/ccu_common.h                 |  25 +
>>>  drivers/clk/ambarella/ccu_mux_div.c                | 234 +++++++
>>>  drivers/clk/ambarella/ccu_mux_div.h                |  35 +
>>>  drivers/clk/ambarella/ccu_pll.c                    | 421 ++++++++++++
>>>  drivers/clk/ambarella/ccu_pll.h                    |  70 ++
>>>  drivers/gpio/Kconfig                               |   2 +
>>>  drivers/gpio/gpio-pl061.c                          | 342 +++++----
>>>  drivers/gpio/gpio-regmap.c                         |  24 +-
>>>  drivers/pinctrl/Kconfig                            |  15 +
>>>  drivers/pinctrl/Makefile                           |   2 +
>>>  drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 +++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.c                | 761 +++++++++++++++++++++
>>>  drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
>>>  drivers/tty/serial/8250/8250_dw.c                  |  34 +
>>>  include/dt-bindings/clock/ambarella,cv75-rct.h     |  15 +
>>>  include/linux/amba/bus.h                           |   1 +
>>>  include/linux/gpio/regmap.h                        |  13 +
>>>  37 files changed, 3439 insertions(+), 138 deletions(-)
>> 
>> That is a lot of stuff mixed into a single series that could easily split
>
> Well, not easily, because each split patchset would rely on non-existing
> CONFIG which could trigger warnings.
>
> Contributors follow here the correct and documented process of new SoC
> platform, I don't get why now only this patchset has to be split...

Are you referring to this or something else ?

"""
one patchset containing new arch/foo/Kconfig entry, DTS files, MAINTAINERS file entry and *optionally initial drivers* with their Devicetree bindings
"""

No problem with that, I was merely trying to say that mixing 4 or 5 trees
in a single patchset is pushing it a little and it does not solve the
dependency problem you've mentioned, it just move it.

>
>
> Best regards,
> Krzysztof

-- 
Jerome

