Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB92DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cjiYB/uowYFXiRivyJJw9KQxslDZjaml/1h2OkBzYY8=; b=46HjrN9A8r1ktPNexZiaL2FRIX
	ZL3YMKX0OgswXDQwqUim1Hj/gs2hC5L/fb9w4Mdrx8LWIU/jpA7XOXjwdbCQnlShibRMONPUob5c6
	IKV05I3uEZGW3MEWltYjAwJk/w4G0ljW2/dk0QILB86Db+tq8igU6G1RBLSS5+ALe1Vvu1CNa5AAr
	/v9IFuFIFqM3djhPkzSi0SlJd9lAlHSIVvr1ILhqifUuMBEHgJGdFkV6cI5mDo2BnAwWn+pdTXOoF
	NYBDRnXeptDzLXwTpTuqGT4XaDCeW4NiELJ8E+kCxRx/t84/JJNNSGD0flBrcKcvvJwr1HgrB4cK0
	rCcS9HtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytDc-0000000CFzL-01qr;
	Wed, 17 Sep 2025 14:33:12 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytDY-0000000CFwF-48Di
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 14:33:10 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-ea5bc345eddso890634276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119588; x=1758724388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjiYB/uowYFXiRivyJJw9KQxslDZjaml/1h2OkBzYY8=;
        b=c2owRb+GislLPasVkUD+DdoSJ7m4ki3rFyKEE48eA+kfOeXEj+8ugYyW4nPJXOJM8y
         SKhSzROttgSNX8wVBYijCmlffF02DaVGmkUJoB2HuWAgwy1wS2rQQ/l0yI/Fn5qgkmFa
         7+qP0U8O0d+cfeZ6qvQkqoy2/jcyj05VnroDVDFf2Wh5dhhlP7KUTnaH1Lw3iYQgNLNk
         8ELbq7KRncLokTbTV396eINVqDGKfx+WLNR+zUVK27QJEBymzkSE5BQ2yfcVua8jQZC7
         EsIqfnSpvmFu5YM6bQ4xVG2+6tENPM487m3WITT8hWQdlNIB2UuNvYta916roYIHqFrw
         jQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119588; x=1758724388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjiYB/uowYFXiRivyJJw9KQxslDZjaml/1h2OkBzYY8=;
        b=l1LCSZ0tLJwjCnhbJsmd/CLB/3r8S8t3VZl/7o2HS09hj2JDro9HHI6Nhe/XrZAkT/
         YGav5u+Q/9qSsOMu/LmtEc6ymnfBUiUZNAUrZJTHJHAhMyiNq8OORfwQ/b3hf2hZ/OqC
         OuSbO/99gqkrHzr7R2odrprFHygmSepvz3JeIOUo1STJ4ULjgIObi7v27eACJQFoxyxH
         tLljBNf3VUVVcMNjIudrRTHGMAgz9QiIumBgwS0ixxO2P8KjwweIxByLkb7TDUajjidM
         A6B/iKfpjxR52UbIxaF4D+NTAPMDhDrzYYj2S6eymcb4r0ICSr0eDCnsa7+wfq1QfAfa
         q0cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGrtNtYtwkkY9MMD50LAFQEE2SJCGj9hNRs/cAa9Ml/+aFpFtnJe2gebwbMWt3o5OFUst5nEBgv1s3JNYIdWsM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg35AYs+7f0BbKIASKNkkakgwynLcw+DDsNW7kPpzQRVAW/rxQ
	mO6nEOgsFoVVNXmpL5ZgRRmKjnJX20fBAovGfGhz98WpXe+EyQR2lHYxzm499CplpS/k98OZTAg
	f0ptV3aiJykJnv9lgbg1XTs609uAvZ5AzIcexNHMFMA==
X-Gm-Gg: ASbGnctskuUSaJ8raENYhd9OUYPI4T0IsBVf97Pnq0Xm0UuxKNIj/s9k1/U0rjxjT1t
	Yl28gb3/6obdidO5r4TONClK4eaMjIu03JBzNe/IXdak/sbxvPdu+HEGEGVwuPnveUi5wcUR9WF
	EJ/pzzkIa4M0W4GwLMJN4ugOmeRAJC5H6yBih012e+DneFtnzuPOmnChTZCuxjSOxgE+l8xALaL
	xKU0CeS
X-Google-Smtp-Source: AGHT+IFQl4sxW4LUcoi3bIXsptHrliwBwP5f8RO+yo+IAgyckDyrm2VPVmx1uys1O5NAXNsLjZqsLa4xcMjhuXJl5zs=
X-Received: by 2002:a05:6902:3101:b0:ea4:6:9024 with SMTP id
 3f1490d57ef6-ea5c03aecffmr2119553276.8.1758119587602; Wed, 17 Sep 2025
 07:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Sep 2025 16:32:30 +0200
X-Gm-Features: AS18NWB4VWSVduLAS3dHprEYP38MnWvLvmP0MGgnFO0V0b-XHaevM6W4A6ssrDo
Message-ID: <CAPDyKFri+vsC9U7hhPukgWR2sRec5M0i8XtmyA7dVgJ-8Ewe_A@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Marvell PXA1908 power domains
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_073309_029150_012A9E7A 
X-CRM114-Status: GOOD (  17.30  )
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

On Sat, 13 Sept 2025 at 23:16, Duje Mihanovi=C4=87 <dujemihanovic32@gmail.c=
om> wrote:
>
> Hello,
>
> This series implements support for the power domains found in Marvell's
> PXA1908 SoC. The domains control power for the graphics, video and image
> processors along with the DSI PHY.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
> Changes in v4:
> - Address maintainer comments
> - Rebase on v6.17-rc5
> - Link to v3: https://lore.kernel.org/r/20250829-pxa1908-genpd-v3-0-2aaca=
aaca271@dujemihanovic.xyz
>
> Changes in v3:
> - Move driver back to pmdomain subsystem
> - Instantiate using auxiliary bus
> - Small fixes and refactors
> - Rebase on v6.17-rc3
> - Link to v2: https://lore.kernel.org/r/20250821-pxa1908-genpd-v2-0-eba41=
3edd526@dujemihanovic.xyz
>
> Changes in v2:
> - Move driver to clk subsystem (domains are instantiated by clock
>   driver)
> - Drop power controller schema
> - Drop RFC prefix
> - Rebase on v6.17-rc2
> - Link to v1: https://lore.kernel.org/r/20250806-pxa1908-genpd-v1-0-16409=
309fc72@dujemihanovic.xyz
>
> ---
> Duje Mihanovi=C4=87 (4):
>       dt-bindings: clock: marvell,pxa1908: Add syscon compatible to apmu
>       pmdomain: marvell: Add PXA1908 power domains
>       clk: mmp: pxa1908: Instantiate power driver through auxiliary bus
>       arm64: dts: marvell: pxa1908: Add power domains
>
>  .../devicetree/bindings/clock/marvell,pxa1908.yaml |  30 ++-
>  MAINTAINERS                                        |   4 +
>  .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |   1 +
>  arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |   5 +-
>  drivers/clk/Kconfig                                |   1 +
>  drivers/clk/mmp/Kconfig                            |  10 +
>  drivers/clk/mmp/Makefile                           |   5 +-
>  drivers/clk/mmp/clk-pxa1908-apmu.c                 |   7 +
>  drivers/pmdomain/Kconfig                           |   1 +
>  drivers/pmdomain/Makefile                          |   1 +
>  drivers/pmdomain/marvell/Kconfig                   |  18 ++
>  drivers/pmdomain/marvell/Makefile                  |   3 +
>  .../pmdomain/marvell/pxa1908-power-controller.c    | 274 +++++++++++++++=
++++++
>  include/dt-bindings/power/marvell,pxa1908-power.h  |  17 ++
>  14 files changed, 369 insertions(+), 8 deletions(-)
> ---
> base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
> change-id: 20250803-pxa1908-genpd-15918db5260c
>
> Best regards,
> --
> Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Patch 1 -> 2 applied for next, thanks!

Note, the DT patch (patch 1) is available on the immutable dt branch
too for clock/soc maintainers to pull, if needed.

Kind regards
Uffe

