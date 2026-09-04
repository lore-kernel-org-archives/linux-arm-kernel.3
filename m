Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DA1C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 06:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opFAzeC6yLs6Vrjv44QhUvB3fomfpvweq22z4f5Cs58=; b=uShDqxBGrKIEHg00+/GaJclOo9
	lJ6519zGm3uB2lnFo1oOUworfMKGgOskTtic+vovOPElVUvMP8gJp3cUPSOdGA4Asddl4TLdazSiw
	YJ+IXeUUBSCgMHyRpbrCumjEFTYtWmypZWK9wjXMYR+DBTW1OJtTU6R4SMjE1qGaIriuI1/smfedD
	Zxa5MFbMA2ejqejk0sYuEqREIanpsaPkuN+5adaFYEZYXLz4ogMJms8zx1+hFT/hnrulqMtKlHZ7q
	tEhF2mhpGXxG6FkSQPRIY51tQqEOk08y8elEi1ewaSK+AsyjR103jyzz+Vc4NRtS7Ek75n0CJwBdb
	l8XaO/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NoV-00000001Chj-39Jv;
	Fri, 04 Sep 2026 06:54:15 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NoS-00000001Ch5-1ipg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 06:54:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-482f9309813so589082f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788504850; x=1789109650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opFAzeC6yLs6Vrjv44QhUvB3fomfpvweq22z4f5Cs58=;
        b=VprHb58VJCwHlK3hnccMnobGZrfipWtLDu1obeiAS8HmfNSNCgLtzUowmQjd3AF4b2
         JP7jNEZIcBwb9p5rGhIrs0x7TV+G06E+A3qypzpcAbsbG1/K89HLgzggO5+PVKhTNGcG
         ohks5tXXTKriLy9TZR6OwS1Vn2gln50tYHGExoCQEWxU+P4HjOeGmYy1U6kTnZQmUFNp
         q3G2DAMNQFQrHTJawBBQ813YhNvFkCdWgiUSbq0NhWqmGcqJPs5VTgXrNrmWGflbqE0Z
         Tg4r72zIDOqWr0In/Eaq4qL+Ua6ZRa25tzGNBEkpXDiBV67sGnh2K3SM/zWhlnReSGzN
         UHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788504850; x=1789109650;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opFAzeC6yLs6Vrjv44QhUvB3fomfpvweq22z4f5Cs58=;
        b=mj+MgVloOhWAxhLLZPWAE9Kn6CgsRNpJ1i5K3ptIIej+2IGXUYLSSQwjn3o64uWf7i
         x2rUfXFXlH/pBSVLU9xH1r/TrkOVwcp6TXxSiD9BWFbJxN1lzCKC4oA8FctkQ8RWa02X
         dNYwNYJYnXnjGogC4lQZhNypgW8fgHj2z9Ek6dgzReGF5UlWwlJ1MMxmaf7ln5KRv9nZ
         crqwr1TktJIu7dh4fpRSTUmcvMcYeGRJWSHK2NMSwYzB5OZWOPSl9WlyUu8b1eJqcz6I
         UqFiEun5gzVyun6Oa4nvB/KXPqWRssDLlXr2Kn2PLA99PjTzVKNkZAt0Y2WihR6IHmGZ
         Q9mg==
X-Forwarded-Encrypted: i=1; AKwUvBxGB6RA7P22VTqXUbKTtCIbJ2tjhaciHJsh2j/xI7ub1Fijgim1vNFpHgU6dDmJJabRGqp2tKA/TC5p6fcw0DJ4@lists.infradead.org
X-Gm-Message-State: AFuF++kxc8voz+zaql4QS1z2DtwAAYOgYFAqSDcUxT7CJC68YsNa0BQZ
	auonGvlWN0DbuYYvOS5/l/DFI9u5xsHXDIDJawHDvSnJWSos8uY68q+DlrHSdLPhQgs=
X-Gm-Gg: AYBFou3cNJAlU+1fhDKLmb6E01IDHoZ0QAbK8fTuqZE96yjyvn/uafxYedmS9vlgH5E
	nUeRtoZ/5Osqg/q/dpo+tSANSm3ro9tp+uBVPmo86VoNDfP+s9aftOw6dN8AzoKjrYDJOeau6bN
	QdAHqFy9zxbaSCMCwnndOhBAXpbIKaHVN1MB0XSoKcJwE/ckoiqpSqxXBdKuTLcl27n7RE2E+FF
	iI5NZXd1S+AXlh36Dj/Pb8bOG8EVqyVbYHbRc1WxIa2Rv9otreeXcs2ig13Iud/xjsLTX4G/5qz
	h9cHjbEb+6JF6Vd/eTSHyNt7jeCIP8EhxBtP0+hHtD8yvcWmriAtSnunCpxSsXoHVKgOsFr1lbh
	lxbzdDHDOGZblbJamP4bcBfEYcJztfF/MCs9mVt1CsrI3y9x+FVyYhAg3VCk0idZkDjokCwtGUg
	m7Io3rzZJoBAI2Tqzl4viIw28L4XRpt1DrdR63TDRGqwXD7qAuwg/QBALKj60owZCwY8J6dTApd
	wOdi6U=
X-Received: by 2002:a05:6000:4a0b:b0:485:8c16:5ef2 with SMTP id ffacd0b85a97d-4858c16610fmr1044275f8f.44.1788504849840;
        Thu, 03 Sep 2026 23:54:09 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm4347121f8f.24.2026.09.03.23.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:54:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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
In-Reply-To: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
References: <20260904-cv75-v5-v6-0-e918514cb3b1@ambarella.com>
Date: Fri, 04 Sep 2026 08:54:03 +0200
Message-ID: <1jwlt1ld6c.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_235412_890127_933C5E49 
X-CRM114-Status: GOOD (  21.98  )
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

On ven. 04 sept. 2026 at 14:38, Long Zhao via B4 Relay <devnull+longzhao.am=
barella.com@kernel.org> wrote:

> This series adds minimal Ambarella CV75 support for early bring-up with
> a serial console: DT bindings, RCT/CCU clocks, pinctrl, PL061 GPIO via
> gpio-regmap, 8250_dw UART quirks, ARCH_AMBARELLA, CV75 EVK DT, and
> MAINTAINERS.
>
> This is a single unified series. Please apply via the SoC tree;
> subsystem maintainers are Cc'd for their pieces.
>
> Verified with:
> - scripts/checkpatch.pl --strict (0 errors)
> - make dt_binding_check DT_SCHEMA_FILES=3Dambarella:pl061-gpio.yaml:sysco=
n.yaml:snps-dw-apb-uart.yaml
> - make CHECK_DTBS=3Dy ambarella/cv75-evk.dtb
> - arm64 build of new drivers/DTS
> - CV75 EVK: console via 8250_dw (dw-apb-uart); GPIO edge IRQ
>   (gpio-hammer / gpio-event-mon)
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
> Changes in v6:
> - gpio: convert gpio-pl061 data path to gpio-regmap; keep PL061 irqchip
>   (Andy, Linus). Add write_data_after_dir + girq helpers to gpio-regmap.
>   Ambarella layout uses JEP106 periphid 0x000e8061; no AFSEL clearing in
>   the GPIO driver; Ambarella skips unverified GPIO PM save/restore
> - serial: restore 8250_dw Ambarella quirks from v3; drop standalone
>   8250_ambarella (Andy). Commit message clarifies Ambarella IP with a
>   DW-like register map needing only a thin quirk. Binding under
>   snps-dw-apb-uart; DT uses ambarella,cv75-uart + snps,dw-apb-uart with
>   reg-shift/reg-io-width
> - clock/RCT: document #reset-cells (Krzysztof); soft-reset ID header and
>   reset provider deferred (no resets=3D consumers in this series)
> - arm64/Kconfig: do not select ARM_PSCI / HAVE_ARM_ARCH_TIMER (Sashiko)
> - pinctrl: no Ambarella suspend/resume claim without validated PM
>
> Link to v5:
> https://lore.kernel.org/r/20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com
> Link to v2:
> https://lore.kernel.org/r/20260806-longzhao-upstream-cv75-v2-v2-0-6b09707=
c5fe9@ambarella.com
> Link to v3-A:
> https://lore.kernel.org/r/20260813-cv75-v3-a-v3-0-cfdd20b1b4dd@ambarella.=
com
> Link to v3-B:
> https://lore.kernel.org/r/20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.=
com
> Link to v3-C:
> https://lore.kernel.org/r/20260813-cv75-v3-c-v3-0-9352b3fd6026@ambarella.=
com
> Link to v4-B:
> https://lore.kernel.org/r/20260814-cv75-v4-b-v4-0-622e63153d97@ambarella.=
com
>

No change log ?

> To: Arnd Bergmann <arnd@arndb.de>
> To: Krzysztof Kozlowski <krzk@kernel.org>
> To: Alexandre Belloni <alexandre.belloni@bootlin.com>
> To: soc@lists.linux.dev
> To: linux-arm-kernel@lists.infradead.org
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Long Zhao <zl020895@163.com>
> Cc: Lee Jones <lee@kernel.org>
> Cc: mfd@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Long Zhao (13):
>       dt-bindings: arm: add Ambarella CV75 platforms
>       dt-bindings: mfd: syscon: add Ambarella CV75 secure scratchpad
>       dt-bindings: clock: add Ambarella CV75 RCT
>       dt-bindings: pinctrl: add Ambarella CV75 pinctrl
>       dt-bindings: gpio: pl061: add Ambarella CV75 variant
>       dt-bindings: serial: snps-dw-apb-uart: add ambarella,cv75-uart
>       clk: ambarella: add CV75 CCU driver
>       gpio: regmap: support write_data_after_dir and girq
>       gpio: pl061: use gpio-regmap and add Ambarella layout
>       pinctrl: ambarella: add CV75 pin controller
>       serial: 8250_dw: add Ambarella CV75 quirks
>       arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT
>       MAINTAINERS: add ARM/AMBARELLA SoC support
>
>  .../devicetree/bindings/arm/ambarella.yaml         |  24 +
>  .../bindings/clock/ambarella,cv75-rct.yaml         |  64 ++
>  .../devicetree/bindings/gpio/pl061-gpio.yaml       |  32 +-
>  Documentation/devicetree/bindings/mfd/syscon.yaml  |   1 +
>  .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 239 +++++++
>  .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  MAINTAINERS                                        |  14 +
>  arch/arm64/Kconfig.platforms                       |   6 +
>  arch/arm64/boot/dts/Makefile                       |   1 +
>  arch/arm64/boot/dts/ambarella/Makefile             |   3 +
>  arch/arm64/boot/dts/ambarella/cv75-evk.dts         |  30 +
>  arch/arm64/boot/dts/ambarella/cv75.dtsi            | 177 +++++
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/ambarella/Kconfig                      |  13 +
>  drivers/clk/ambarella/Makefile                     |   6 +
>  drivers/clk/ambarella/ccu-cv75.c                   | 296 ++++++++
>  drivers/clk/ambarella/ccu_common.c                 |  60 ++
>  drivers/clk/ambarella/ccu_common.h                 |  25 +
>  drivers/clk/ambarella/ccu_mux_div.c                | 234 +++++++
>  drivers/clk/ambarella/ccu_mux_div.h                |  35 +
>  drivers/clk/ambarella/ccu_pll.c                    | 421 ++++++++++++
>  drivers/clk/ambarella/ccu_pll.h                    |  70 ++
>  drivers/gpio/Kconfig                               |   2 +
>  drivers/gpio/gpio-pl061.c                          | 342 +++++----
>  drivers/gpio/gpio-regmap.c                         |  24 +-
>  drivers/pinctrl/Kconfig                            |  15 +
>  drivers/pinctrl/Makefile                           |   2 +
>  drivers/pinctrl/pinctrl-ambarella-cv75.c           | 561 +++++++++++++++
>  drivers/pinctrl/pinctrl-ambarella.c                | 761 +++++++++++++++=
++++++
>  drivers/pinctrl/pinctrl-ambarella.h                |  50 ++
>  drivers/tty/serial/8250/8250_dw.c                  |  34 +
>  include/dt-bindings/clock/ambarella,cv75-rct.h     |  15 +
>  include/linux/amba/bus.h                           |   1 +
>  include/linux/gpio/regmap.h                        |  13 +
>  37 files changed, 3439 insertions(+), 138 deletions(-)

That is a lot of stuff mixed into a single series that could easily split

> ---
> base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
> change-id: 20260818-cv75-v5-9e2039b349bc
>
> Best regards,
> --=20=20
> Long Zhao <longzhao@ambarella.com>
>
>

--=20
Jerome

