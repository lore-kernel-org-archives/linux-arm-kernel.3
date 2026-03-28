Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E5110F3DE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DQZ2bL5acF5SP04nBfqwQ02XvmmlMibNG1GQ+PID8A=; b=eXk7JHx7UL3XG4
	3xoVOfoNHsZGA4lZ1AGymsgHKlH6I2ODon+9MTxpUwwXAqmnoaRfXgBw7HA4I1Re5Ny2AFraYq750
	AxIR5CJ9taO/t+okwYwW8xTJ6+fcl8mqDKOzyoa5IqNVFq81E8q8Fl52uRE/4oQKeIpfvCOz9vlfV
	ZffiMnYSUM80wbbJFQY09D+YWjYKu89QxzZMBvFSclRp/BVQdpH2UCQRWGiEwlw5yyNi5FztF3KU1
	fNVbRWZffZOupNIcGLarDjqodCd9qJlAgMNJ1zuTJQw0Jo941Ex/VOZTVGA+anNPjF1fucvxqeZkk
	O4WQlV5yXp/6qnQ+wGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6VZM-000000094eL-21cs;
	Sat, 28 Mar 2026 15:27:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6VZK-000000094e0-2szN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 15:27:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA48B42B68
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 15:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA44DC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774711641;
	bh=J97nhqd19Owfth49YYD2VgMcKu6wbx/SAYjRjMlEcXA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=pnHh0nkCVPcpbfiNfnvMoco9eDS98jX96HarYWrCF2/AJOT7b+Ed9gRKDkawik6qT
	 5LuC9Mbn4/Tk7ka4Y4/jjhGE1LwHv0uYyhd0uQ6MTgU3a12kBAK7F747x2EiTzgO9p
	 aiIyNEvjnH1KyiDcGUdDj8eQlfchLir+t2PGI4xLb/TxyrcwIfPDQaXxnH+vw5jXD6
	 OsLCN1A9NrRNxMdErpcb73Uy57yYo8TdSQRZWPmbl4OrMw01kP0pMDUCsQnAp5CQ+W
	 7nSuzotUTedBJb6LmQIRcAME9zvmiHjOx1pguMoE7AOlkA8ivcmaWXQZZMnrgJaHXv
	 Ad7MdKL/HpgGw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-386b553c70eso24613331fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 08:27:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmC7PS1ABScpq1CsfiKO3K4oNcoVU3+73o9AYzZHSEwCcd840BqgIo0XMC0AE+e6UtLJxGV6bUTk+ydGD3HFob@lists.infradead.org
X-Gm-Message-State: AOJu0Yyblh7kYo2/MbAZC2MEF7Ad/Jt5Je0s2eYKFCqVGk5QUGAR3CEx
	C2OkixiDwuzQjMviCoeHRZC/CcCDiOZA7k2Hn/s6F63bD4vm+RqyMSGG7HeLf5e4L/bmdBugQsv
	NUSN0m0GBHQoBgf1vfM25nTDi/MGUlE4=
X-Received: by 2002:ac2:482b:0:b0:5a2:a1aa:2b8a with SMTP id
 2adb3069b0e04-5a2ab92b48dmr1928277e87.31.1774701460967; Sat, 28 Mar 2026
 05:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 20:37:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
X-Gm-Features: AQROBzAjNUlKB5AcxIrVhPiEv-8viiXBsmIlq5_4UPHivayPQSg3rbcnxOKBQII
Message-ID: <CAGb2v67844OPwE6VJ0PAs5LsmCa2h0FvXOBUomZ50dM5tZ0Zow@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_082722_770290_2531C421 
X-CRM114-Status: GOOD (  31.50  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 21, 2026 at 7:03=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> The RTC module in the Allwinner A733 SoC is functionally compatible with
> the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
> changes.
>
> The A733 supports selecting the oscillator between three frequencies:
> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
> which frequency is actually used on the board. By defining all three
> frequencies as fixed-clocks in the device tree, the driver can identify
> the hardware-detected frequency and expose it to the rest of the system.

No. The board device tree shall have the exact and correct frequency
defined in the external crystal device node. The operating system can
use the hardware-detected frequency to "fix" the in-system representation
if it is off.

> Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
> specific modules, including SerDes, HDMI, and UFS.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 ++++++++++++++++=
++++--
>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
>  2 files changed, 52 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rt=
c.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index 9df5cdb6f63f..b18431955783 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - allwinner,sun50i-h6-rtc
>            - allwinner,sun50i-h616-rtc
>            - allwinner,sun50i-r329-rtc
> +          - allwinner,sun60i-a733-rtc
>        - items:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
> @@ -46,11 +47,11 @@ properties:
>
>    clocks:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 6
>
>    clock-names:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 6
>
>    clock-output-names:
>      minItems: 1
> @@ -156,6 +157,38 @@ allOf:
>          - clocks
>          - clock-names
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun60i-a733-rtc
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          items:
> +            - description: Bus clock for register access

> +            - description: 19.2 MHz oscillator
> +            - description: 24 MHz oscillator
> +            - description: 26 MHz oscillator

No. There is only one input. As in there is only one set of pins for the
DCXO. The inputs are the same as on R329 / A523. Just use that list.

> +            - description: AHB parent for internal SPI clock
> +            - description: External 32768 Hz oscillator
> +
> +        clock-names:
> +          minItems: 5
> +          items:
> +            - const: bus
> +            - const: osc19M
> +            - const: osc24M
> +            - const: osc26M
> +            - const: ahb
> +            - const: ext-osc32k
> +
> +      required:
> +        - clocks
> +        - clock-names
> +
>    - if:
>        properties:
>          compatible:
> @@ -164,6 +197,7 @@ allOf:
>                - allwinner,sun8i-r40-rtc
>                - allwinner,sun50i-h616-rtc
>                - allwinner,sun50i-r329-rtc
> +              - allwinner,sun60i-a733-rtc
>
>      then:
>        properties:
> diff --git a/include/dt-bindings/clock/sun60i-a733-rtc.h b/include/dt-bin=
dings/clock/sun60i-a733-rtc.h
> new file mode 100644
> index 000000000000..8a2b5facad73
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun60i-a733-rtc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
> +
> +#ifndef _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> +#define _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_
> +
> +#define CLK_IOSC               0
> +#define CLK_OSC32K             1
> +#define CLK_HOSC               2

The DCXO enable control has been present since at least the H6. We just
never added it, as we would never disable it anyway.

If you compare the RTC clock trees of the A733 and A523, the only addition
besides the new gates seems to be the LOSC auto selection. But even that
is just an illusion, as the A523 has the same registers for that.

One could say the A733 RTC is almost backward compatible to the A523, if
not for the two fastboot registers the A523 has at 0x120 and 0x124.

So I ask that you try to integrate the differences into the existing
driver and bindings. You can tweak and export internal clks if you
need.

> +#define CLK_RTC_32K            3

AFAICT besides being an internal clock, this is also fed to GPIO for
debounce? We probably need to expose this on the A523 as well.


Thanks
ChenYu


> +#define CLK_OSC32K_FANOUT      4
> +#define CLK_HOSC_SERDES1       5
> +#define CLK_HOSC_SERDES0       6
> +#define CLK_HOSC_HDMI          7
> +#define CLK_HOSC_UFS           8
> +
> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_RTC_H_ */
>
> --
> 2.52.0
>
>

