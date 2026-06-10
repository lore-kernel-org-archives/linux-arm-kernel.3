Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132F7CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw2wxypqiSq6JjCrHtFlLbVO37xmRZdL4EKtYtLIJ4I=; b=qBiDEIdofo5zrQxVcD8ZwapZjd
	74MqBGLPtwL3mdTcNxEHuU5mBE7bmjPL0pC+XPlEiVbm/mDNa4sqP4B0qaaQXSOvSmE+j3kaqRGz8
	h6d2xFom16+q1WfkNXDjR8qMaO1IS5Fx74b63lTKgnXtZkBK+AOpjD06UPdo5nYiFQVQXY39QljkN
	4AcyNzPD8yIqP+qMRK5H7UKH3IfoSryb6WNt+joZyFfrPH7/09Dani9mfnLQkjfxIPqnwILGzdeFZ
	df98Ee0Hbjfy0ldOelDOjNc/6Q2BGin9UbtpBI2j6sOwb1oNWP4VxedtTvHFbiWzBf8zoYKkuhRQ8
	G3wXx+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXI1G-00000007dXa-1A7a;
	Wed, 10 Jun 2026 12:26:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXI1C-00000007dWo-24V5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 12:26:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so59475565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 05:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781094408; x=1781699208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2wxypqiSq6JjCrHtFlLbVO37xmRZdL4EKtYtLIJ4I=;
        b=M7JJ2bpdWC4TtYoRVaDboMwPu0md9Nny3XwiYBDJo5lk+d2RIc3wONMbAW0uc7LeT1
         JkRP8Kvd2+kq+jmm+IpY+Pc2FFdLi1ajZhsr/LfEiKOJcC9H9PD1GMp1VVEp1v6/JV4P
         FV+3UfQ2FhCVAPKHgpx3EVirRmsIImy7M8f1raK3QyamS7vUC5cH0uVCwF48qHXf6eXo
         vjI3dKFeg9nHnzSarz8MVHZrAxl1g2444pwtfynHi5vOxkq7mh2x/hsz3jH3ofGYN8zB
         9jH80Qm25fl4Biw3Eayv6RSJwfck/T5nq2Oie2hQHeRbAlKrhDTctDMTX6QMUlXLMaxb
         EZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094408; x=1781699208;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw2wxypqiSq6JjCrHtFlLbVO37xmRZdL4EKtYtLIJ4I=;
        b=gRDy52ztaI5xRrKJ/v5nCNU6gPLAFiXPF9idAmZvlZgLtW56TXgDDUnyjLfSDYGEdW
         p3dgr7qOd7D7678SNqxCpeOmp5F7tRaqIXObSKw4Vr1levespPvTA8F+Fdg77YqFxyl2
         F82N5cE1Pz2MSEXOKammy2JyAHOkFa+c61auJGNGmt/VHCtH6SGMZlAkY5uJ2VgS7gtO
         /QbknT2scW05hWUVGnw5/1RESCeMOhut1NJGGOQAFSmVtBqu2X3RqPDJzZv0bw3wPfzU
         CtKQkcnDHGPRV/NRCj3Ynb3amkIetQ4jbmVCwQouFy9Ni3JY8Z1R5QD7MGj7MoasE0+Q
         WikA==
X-Forwarded-Encrypted: i=1; AFNElJ9XroVSQYRBwwKdqbe0auPM5lhMgevojzBTQ9z0vRTPgtFCGVWFbM/7KpghEa32AgtSZtVINZlvLJRUw5Td1fkS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf6bVz3+HRbMRbwBfe6ye4K4ahj0ZmGe8j0oLEjifvXd0iLrrE
	Acqzzo71+ax/APaadHhZlW4vBS1aMc1Ffc3PFzmOMvEboaC4Kj/66hL5Kkaje7NVIgU=
X-Gm-Gg: Acq92OHSdS/oONF8IC0QXqnDqzaLdX0INHo6ZZmtP8XHtzicdCni0x/y6bAwmoTqAVi
	0LG+QO0l8IZogg2yObRa7D61Uhjvq/GRhEAaSQdKsDOZ7hDmErWG8QkXXlQG7iafoRZp4H44tFy
	tuYCO6SAMuOsjuNiqn1nWVv71aaZ97R+HgIu13YKXMXzBcAoaN2NfugFob7h7VcN4sTnNmKbUf9
	YdnXcL+wpexECkHAVL9JnWZoroSPFZFWyYnbLYTV0/2Jm9GaesWt7BSeRxrbp04yIKuu+6AFLQD
	7QfKcJZEYxn7VHBRGpJRQBJjPO1EmpZN5HqOSeb2CTRSSgyaom8Jp90Rna7tE1zqqW5oMlqcHdc
	qVom3sN/lf9cO0PsCso3izBB6gTpXwdkFNK3Lsq3vNo4RhN6eKWsJaH+58EPiHhbyca4Uk1S7ll
	gnk4lFY4vn0zpx/ilIpC/blUVw8h+5Beeo
X-Received: by 2002:a05:600c:4ed1:b0:490:b4cb:3866 with SMTP id 5b1f17b1804b1-490c2cf67f7mr331756785e9.10.1781094408066;
        Wed, 10 Jun 2026 05:26:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc39def5sm547623695e9.5.2026.06.10.05.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:26:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com> (Jian Hu's
	message of "Wed, 10 Jun 2026 12:18:54 +0800")
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
	<20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
	<1j7bofd7dr.fsf@starbuckisacylon.baylibre.com>
	<67fcf9bc-0ac7-4812-aa7c-4d42d8f1c162@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 14:26:45 +0200
Message-ID: <1jpl1yfunu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_052650_860354_76FF49E7 
X-CRM114-Status: GOOD (  29.51  )
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

On mer. 10 juin 2026 at 12:18, Jian Hu <jian.hu@amlogic.com> wrote:

> Hi Jerome,
>
> Thanks for your review
>
> On 6/3/2026 10:29 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Wed 03 Jun 2026 at 20:17, Jian Hu via B4 Relay <devnull+jian.hu.amlog=
ic.com@kernel.org> wrote:
>>
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/Kconfig    |  13 ++
>>>   drivers/clk/meson/Makefile   |   1 +
>>>   drivers/clk/meson/a9-aoclk.c | 419 ++++++++++++++++++++++++++++++++++=
+++++++++
>>>   3 files changed, 433 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
>>> index cf8cf3f9e4ee..625e6788b940 100644
>>> --- a/drivers/clk/meson/Kconfig
>>> +++ b/drivers/clk/meson/Kconfig
>>> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>>>          device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>>>          controller to work.
>>>
>>> +config COMMON_CLK_A9_AO
>>> +     tristate "Amlogic A9 SoC AO clock controller support"
>>> +     depends on ARM64
>>> +     default ARCH_MESON || COMPILE_TEST
>>> +     select COMMON_CLK_MESON_REGMAP
>>> +     select COMMON_CLK_MESON_CLKC_UTILS
>>> +     select COMMON_CLK_MESON_DUALDIV
>>> +     imply COMMON_CLK_SCMI
>>> +     help
>>> +       Support for the AO clock controller on Amlogic A311Y3 based
>>> +       device, AKA A9.
>>> +       Say Y if you want A9 AO clock controller to work.
>>> +
>>>   config COMMON_CLK_C3_PLL
>>>        tristate "Amlogic C3 PLL clock controller"
>>>        depends on ARM64
>>> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
>>> index c6719694a242..f89d027c282c 100644
>>> --- a/drivers/clk/meson/Makefile
>>> +++ b/drivers/clk/meson/Makefile
>>> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) +=3D axg.o axg-aoclk.o
>>>   obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) +=3D axg-audio.o
>>>   obj-$(CONFIG_COMMON_CLK_A1_PLL) +=3D a1-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) +=3D a1-peripherals.o
>>> +obj-$(CONFIG_COMMON_CLK_A9_AO) +=3D a9-aoclk.o
>>>   obj-$(CONFIG_COMMON_CLK_C3_PLL) +=3D c3-pll.o
>>>   obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) +=3D c3-peripherals.o
>>>   obj-$(CONFIG_COMMON_CLK_GXBB) +=3D gxbb.o gxbb-aoclk.o
>>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>>> new file mode 100644
>>> index 000000000000..b7b3ca231a42
>>> --- /dev/null
>>> +++ b/drivers/clk/meson/a9-aoclk.c
>>> @@ -0,0 +1,419 @@
>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>> +/*
>>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>>> + */
>>> +
>>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/platform_device.h>
>>> +#include "clk-regmap.h"
>>> +#include "clk-dualdiv.h"
>>> +#include "meson-clkc-utils.h"
>>> +
>>> +#define AO_OSCIN_CTRL                        0x00
>>> +#define AO_SYS_CLK0                  0x04
>>> +#define AO_PWM_CLK_A_CTRL            0x1c
>>> +#define AO_PWM_CLK_B_CTRL            0x20
>>> +#define AO_PWM_CLK_C_CTRL            0x24
>>> +#define AO_PWM_CLK_D_CTRL            0x28
>>> +#define AO_PWM_CLK_E_CTRL            0x2c
>>> +#define AO_PWM_CLK_F_CTRL            0x30
>>> +#define AO_PWM_CLK_G_CTRL            0x34
>>> +#define AO_CEC_CTRL0                 0x38
>>> +#define AO_CEC_CTRL1                 0x3c
>>> +#define AO_RTC_BY_OSCIN_CTRL0                0x50
>>> +#define AO_RTC_BY_OSCIN_CTRL1                0x54
>>> +
>>> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
>>> +     MESON_COMP_SEL(a9_ao_, _name, _reg, _shift, _mask, _pdata, NULL, =
0, 0)
>>> +
>>> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
>>> +     MESON_COMP_DIV(a9_ao_, _name, _reg, _shift, _width, 0, CLK_SET_RA=
TE_PARENT)
>>> +
>>> +#define A9_COMP_GATE(_name, _reg, _bit) \
>>> +     MESON_COMP_GATE(a9_ao_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
>>> +
>>> +static struct clk_regmap a9_ao_xtal_in =3D {
>>> +     .data =3D &(struct clk_regmap_gate_data){
>>> +             .offset =3D AO_OSCIN_CTRL,
>>> +             .bit_idx =3D 3,
>>> +     },
>>> +     /*
>>> +      * It may be ao_sys's parent clock, its child clocks mark
>>> +      * CLK_IS_CRITICAL, So mark CLK_IS_CRITICAL for it.
>>> +      */
>> I don't really get what you mean ... Could you rephrase ?
>
>
> The AO sys gate clock chain may be:
>
> ao_xtal_in->ao_xtal->ao_sys-> AO sys gate clocks
>
> "ao_xtal_in" is part of the parent chain of the AO sys gate clocks.
>
> Some of its downstream clocks are marked with CLK_IS_CRITICAL. To ensure
> those clocks remain functional, ao_xtal_in must not be disabled and is
> therefore marked as CLK_IS_CRITICAL as well.

If any of the downstream clocks are critical and marked as such, there is n=
ot
need to mark this one as well.

You should only mark the clocks that are actually critical with the flag
and let CCF figure out the dependencies.

>
>
> I will rephrase it like this in the next version:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ao_sys can select different clock sou=
rces. One possible clock
> path is:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 ao_xtal_in->ao_xt=
al->ao_sys-> ao sys gate clocks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ao_xtal_in is in the parent chain of =
AO sys gate clocks.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Since some downstream clocks are mark=
ed CLK_IS_CRITICAL,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ao_xtal_in must remain enabled and is=
 therefore marked
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* CLK_IS_CRITICAL as well.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>
>>> +     .hw.init =3D CLK_HW_INIT_FW_NAME("ao_xtal_in", "xtal",
>>> +                                    &clk_regmap_gate_ops, CLK_IS_CRITI=
CAL),
>> I'm honestly not sure about this. It is correct, sure and the macro exis=
t to be
>> used but ... It does not really help readability here, does it ?
>>
>> (I know that was a feedback you've got on v1)
>>
>> Other than that, this looks good to me.
>>
> Ok, I will use the original clk_init_data for this one.

Well my comment applies to whole thing really.

There are surely ways in which the macro but the way we statically
declare things, it adds a level of indirection that makes things harder
to review IMO.

>
>
> [ ... ]
>
>> --
>> Jerome

--=20
Jerome

