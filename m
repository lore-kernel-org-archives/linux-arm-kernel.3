Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710B8CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 07:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qg7VWjS0JkeDUM38Rnu5q8oeFtV0qmFaVpXseuYx1QE=; b=nV+hifB2uAT/08PYXSA2UIQAaV
	2i0gYQhMNsZPEt+dy9IVTI2VEh/lLO7tR/FuDOWdi0v2aXirX1PaxCob55u3VtMxFo2G7D+Q38tq2
	SJ03jPdZn7PTaPKuSaDHThMLHFuOYIbSX/dc1GWrkPrN4m2xEbtMg6vOWyTPhFXSEQ+du/V98V6o3
	GPVqHzbrpXI3d6+hlkIDhkWmyEf7RRoDQOvm9mLh5HFuCoL9Fi74wwD+4Gbnd7BoHZNkGgU4yk9x6
	VgvWmv1WJriQTwudENU43bDHZADfanbTPAHYjFwldOLsBiPC8xSTRB0wCzKFWpTAlSQThwQ2reud3
	O6lUzNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rWU-00000006wJY-0ToZ;
	Wed, 01 Oct 2025 07:45:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3rWQ-00000006wIS-0asX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 07:45:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46e52279279so23680885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 00:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759304708; x=1759909508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg7VWjS0JkeDUM38Rnu5q8oeFtV0qmFaVpXseuYx1QE=;
        b=DjuqbijF1H9t7TSZhEb8HK1hAHTA27wpSefXrerhymehCrSXZuRpGK1raZ57qGDiWq
         Ny6xCr01rkTR3ljWMsNGrTQsEYXsxzPyUEum+WrlaV7jXEx9/6xHqE2jumZ8gyPaN6lp
         ABykNEPvp/bJ18BU0nospEsuu0zr2rSEh5w4/mw18ijmlz5setUhdrz9Xup2RTIovBxZ
         sX8bYekYOLcO8fxQUzmAP4baIrQDBelGTNUmtjGddmZzBapRcnibzyoZYPERa75tM8bQ
         iq6NxOvLmWjKxLOF1r1CcjgakcBIEJ3FZgLEZnKBHIe3LhIkaQIxRRvla8pAhbNpfbqF
         KTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759304708; x=1759909508;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qg7VWjS0JkeDUM38Rnu5q8oeFtV0qmFaVpXseuYx1QE=;
        b=nxpwtKyIBZEs2Daq5u5zIAiFirzGXmsx7500SnMV0YZ/eSFFPfaG14F/bYkxbBsH8L
         7VFPyH0yLjyb6kzbhLBZJUwjgw7Hju5DnZ4/P64Doon07bZ2SdaklCipCFhOo6ACYPK8
         NwAAfSxBNYyECaWooCiK9HiJaar+YEuMCe+qBKedMe++KeBCSY99hoOK16Cohy0Hm4no
         c43rHT4Qgmaea3RnsQ2qlde9xM38+TMHCIYJ5hCnP4K1u40FWzuaExzkHavleB8TD5fx
         RhVKEH7upYwE3MNE28TuEYIG2KBHny8OBUBgPxQrRLZOlIOKmyUgmjSyq+i8CZnKzWzk
         48kg==
X-Forwarded-Encrypted: i=1; AJvYcCXnu8wXt/ymtawnB8WvKrdtGFOJVQDc1KdBnIfnpoBAqYX2Z+nqCpxyjmkb3VBjZ6S/sxAzrkwCyoJZcvczd/+4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8oy6za/g3Ak/DPTSsD2HcgPW6PMLRKK4VZWlwwojSbdcnGzVP
	UO9kA4VG9BI4bGVDZ+Ka+zLMzJ8zxrmp4NXDHjQPLdb7sfwD8uGlbXDeQkPvR9DVZ8g=
X-Gm-Gg: ASbGncsdi2kK8qabgERttQSW/RYxXj3Y4xNaK3DlCKrknpQ3dwmHGh3eraqHT366ZoU
	ioGLU7CPM4qpRHHyKdSdgi5LthOX1difWYfwJaDuPxdbUHk5VehCjrgHUm3rSjsw3GFI4GNLwil
	caeUJ2O5K3IH3yy9XF8oiWlfy7XrXAnE3aT9svDgEvfKN1DZMHubZbDv8jk0H3RnWbFJN3Bi8xi
	3c89FyUt5VOXIA9GpjjuUYzgtJ6gLpTfwzYE+aXxkIQR6m3y1duXOFBDVK4JvicToMMLavZdYcS
	CwB7mIzaHUjeQheCG0YpevJLrQ5WuNbM5QqXq5EDIVLWc9phkUZ4uKUmVIVxDJTG0NygEvuXczm
	KugyE2puHZ95BEy/zfuAiFvHmyMmII/PV5rY7byX3X236fQ==
X-Google-Smtp-Source: AGHT+IFoRjI2Zw2x09D63Jf0YC7whoQC5cYnsETwVyuJVa3Ra7wHW3S2yFZ3fp1jDTOz8cPlStVCVA==
X-Received: by 2002:a05:600c:6812:b0:45f:2cf9:c229 with SMTP id 5b1f17b1804b1-46e611a1fa9mr20772605e9.0.1759304707793;
        Wed, 01 Oct 2025 00:45:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ec6d:2bf4:7406:4872])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e619a6fc8sm26382545e9.13.2025.10.01.00.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:45:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for
 A4 and A5 SoCs
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
	(Chuan Liu via's message of "Tue, 30 Sep 2025 17:37:13 +0800")
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 01 Oct 2025 09:45:06 +0200
Message-ID: <1jv7kz3w1p.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_004510_450095_880EC285 
X-CRM114-Status: GOOD (  23.88  )
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

On Tue 30 Sep 2025 at 17:37, Chuan Liu via B4 Relay <devnull+chuan.liu.amlo=
gic.com@kernel.org> wrote:

> This patch series includes changes related to the PLL and peripheral
> clocks for both the A4 and A5 SoCs.
>
> The patches for A5 were previously submitted up to V3 by Xianwei.
> https://lore.kernel.org/all/20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com/
> After friendly coordination, I=E2=80=99ve taken over and continued the
> submission as part of this series. The dt-bindings patch retains Rob's
> original "Reviewed-by" tag, and I hope this hasn=E2=80=99t caused any
> additional confusion.

... and yet you restart the versioning of the series making it harder
for people to follow that

>
> Both A4 and A5 belong to the Audio series. Judging by their names, one
> might assume that A5 is an upgrade to A4, but in fact, A5 was released
> a year earlier than A4.
>
> Since there are differences in the PLLs and peripheral clocks between
> the A4 and A5 SoCs (especially the PLL), and taking into account factors
> such as memory footprint and maintainability, this series does not
> attempt to merge the two into a shared driver as was done for
> G12A/G12B/SM1.

... and we end up with 19 patches series while it could be splitted into
manageable series, for each controller of each SoC

>
> This patch series includes all related dt-bindings, driver, and dts
> changes for the PLLs and peripheral clocks. Following our past convention
> for clock-related submissions, the dts changes are placed at the end
> and submitted separately. If this ordering makes it harder for
> maintainers to review or pick patches, please feel free to point it out.
>
> Co-developed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Chuan Liu (19):
>       dt-bindings: clock: Add Amlogic A4 SCMI clock controller
>       dt-bindings: clock: Add Amlogic A4 PLL clock controller
>       dt-bindings: clock: Add Amlogic A4 peripherals clock controller
>       clk: amlogic: Optimize PLL enable timing
>       clk: amlogic: Correct l_detect bit control
>       clk: amlogic: Fix out-of-range PLL frequency setting
>       clk: amlogic: Add A4 PLL clock controller driver
>       clk: amlogic: Add A4 clock peripherals controller driver
>       arm64: dts: amlogic: A4: Add scmi-clk node
>       arm64: dts: amlogic: A4: Add PLL controller node
>       arm64: dts: amlogic: A4: Add peripherals clock controller node
>       dt-bindings: clock: Add Amlogic A5 SCMI clock controller support
>       dt-bindings: clock: Add Amlogic A5 PLL clock controller
>       dt-bindings: clock: Add Amlogic A5 peripherals clock controller
>       clk: amlogic: Add A5 PLL clock controller driver
>       clk: amlogic: Add A5 clock peripherals controller driver
>       arm64: dts: amlogic: A5: Add scmi-clk node
>       arm64: dts: amlogic: A5: Add PLL controller node
>       arm64: dts: amlogic: A5: Add peripheral clock controller node
>
>  .../clock/amlogic,a4-peripherals-clkc.yaml         | 122 +++
>  .../bindings/clock/amlogic,a4-pll-clkc.yaml        |  61 ++
>  .../clock/amlogic,a5-peripherals-clkc.yaml         | 134 ++++
>  .../bindings/clock/amlogic,a5-pll-clkc.yaml        |  63 ++
>  arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  80 ++
>  arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  87 ++
>  drivers/clk/meson/Kconfig                          |  53 ++
>  drivers/clk/meson/Makefile                         |   4 +
>  drivers/clk/meson/a1-pll.c                         |   1 +
>  drivers/clk/meson/a4-peripherals.c                 | 764 +++++++++++++++=
+++
>  drivers/clk/meson/a4-pll.c                         | 242 ++++++
>  drivers/clk/meson/a5-peripherals.c                 | 883 +++++++++++++++=
++++++
>  drivers/clk/meson/a5-pll.c                         | 476 +++++++++++
>  drivers/clk/meson/clk-pll.c                        |  76 +-
>  drivers/clk/meson/clk-pll.h                        |   2 +
>  .../clock/amlogic,a4-peripherals-clkc.h            | 129 +++
>  include/dt-bindings/clock/amlogic,a4-pll-clkc.h    |  15 +
>  include/dt-bindings/clock/amlogic,a4-scmi-clkc.h   |  42 +
>  .../clock/amlogic,a5-peripherals-clkc.h            | 132 +++
>  include/dt-bindings/clock/amlogic,a5-pll-clkc.h    |  24 +
>  include/dt-bindings/clock/amlogic,a5-scmi-clkc.h   |  44 +
>  21 files changed, 3406 insertions(+), 28 deletions(-)
> ---
> base-commit: 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
> change-id: 20250928-a4_a5_add_clock_driver-2b7c9d695633
>
> Best regards,

--=20
Jerome

