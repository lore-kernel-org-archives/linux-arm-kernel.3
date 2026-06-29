Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0142CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G67qeINcThvr9unh9wEXsyMZVKpN32CweVhhELeDY0=; b=d/zv5Tz7/Xj3RdEgElco0XbkHk
	qd91WQMfUpCicskvVt198pzgNnER9gXK5YsFW6p9WQXtzHg5EcnGZKFzRYcmUnNLP8O1rvxiWBrx7
	AwxsbpQw8pEvkKC33Xt+53QnQ+2Fh4HzZB87VdX5SScojL/5mcRLOrz8ncWv7CIObu+7gIZERjdLO
	KgqIPN/DA1DRw3DyiLPKdAfHagGffO/Iwwlb6TIBCmC4qtZkFjODrhb4ykCnXrEo/gufiG2oqb37B
	+9hOz9N+M9rLxBIH1qpzAAsFFi8U9AmtvVdmRtnHnwZMBPLTror/LWLvHA8EnJ9mYjB5ZhQm/v/q4
	QzSdvusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBTV-0000000EdFd-2LSn;
	Mon, 29 Jun 2026 12:52:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBTS-0000000EdE3-0PwD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:52:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493a97fad2fso13666595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782737548; x=1783342348; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0G67qeINcThvr9unh9wEXsyMZVKpN32CweVhhELeDY0=;
        b=GQtrgq/G6wv85ZNUT3VnD/3F77UFYSp2SkGyX7fXh5QIMKFa8ewZf2iBeXAzfD3eDU
         kCulE0PJ24H30blkh4LTkZbc5T6BL0FO+yG3aQtNrNdHZas7cIfy+Z3kePlyJD3I5gCN
         CDVTG4S/5dAKQUWdSgp7S1sCEzoVEPsai1iaFHgDBa+bN2unyiKAlYEGf5funqSPs9he
         HhibBRsN/n4u+a8Jh5PUSp5pI0nJFfTmUqjQgRwM4RnQJHBi4nG8FCYqMY4TQrggNwJz
         fm3+3aNUxtF3jxAGDzedjJxxnd28CNny3ul7koNNhcjwpVDZaEyvZfWOASIg9LC9NhBU
         2YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737548; x=1783342348;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0G67qeINcThvr9unh9wEXsyMZVKpN32CweVhhELeDY0=;
        b=RTjEqdG4J0tjVpoTLO/eWKbq5BFeyiaLnQudlFrTjXKTwAHmkC7XAOv9vK6sA45ib1
         DA8JtBclAy47yTLfkkROtGBPvBBAAk6JKidgqKIzCsiwjJ1xdC5yGOzfBNMkKiOiSK7N
         ecb4Hyk94JgeSeUlv/N6gOS9pgw356iEkX4jjiYMKF70k+wqr6p+AfXJwp0lBygZgk5K
         yg5lUhmRz+cyU33lx5phSasGNymJV8rdBO+h1nPJlWb7lj/zRVsJpE3JY2e8GdH5Xvsz
         Z5GwLb2VUtRXC3cqFGeDG7AaI5MdtilXY8VQBeAG0AEGK9E8HWid8E3b9/DL9D8z1iQF
         r7dQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bgcOdOoBg8FzI6xUYEoBfxpR0XxJKiO6yoGtIRVCC28CwGVCTv3BDoYiTGj/B/rMnpu6nw46L0muitdzcazV9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1uf+z5lpXv5FBrbY/jS+ci1MyKysOUuS2ZbDgyN649Wl+uSmt
	fib4Zh9sEcSL6r5JS8mhq34dxAVSQbZd6vakq20pVKeX4Qpnu+nsi9utOYX4G13bScc=
X-Gm-Gg: AfdE7cllfw6GU6Hp6bXlG5z8i8Y6mBgyVajBlsot9cS3tFjjT7G4bLKOPW5zJjTapcA
	Ng/FxRTt4pQnpRZQyU8P1gc32RNtEgwVfNk9ria5GCj56vqL9t5K4BpfEOlH2e4G7Py6fMWdfnD
	1oQB5DK/A0p6tuIA7anE/u7kXrIq8hTFiuAOuq+rfY29H7NZW+mg5sFG6U+NUiSkhdVwgcCz5Tf
	oEAfGGn5NN2bp9QHBewdrvdGlkmMoo7Q4X6fXxUPVPJdvzKDhaOdV4C3Lj11HAbdDqaj9lqzrgR
	7gU8X0nqLAgeUA4Nwp400UX2VULNGKOtA7it3BGQTzFNTbCSvA1FNL/HpbmuPOA0tVZDfZS8M9C
	GYRza7xSD03zUAEEQz2ZLJKUOMc5hgd2H4FnRrEV51Yc5mgE0wBxIRP7uQBq94ahxaGhroZBkLs
	yfE8fNNO8IwbU=
X-Received: by 2002:a05:600c:4f8f:b0:493:a75e:cf2e with SMTP id 5b1f17b1804b1-493a75ed171mr81258945e9.25.1782737548101;
        Mon, 29 Jun 2026 05:52:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926f94f213sm276984895e9.12.2026.06.29.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:52:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,
  Richard Cochran <richardcochran@gmail.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org,  netdev@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733
 CCU and PRCM
In-Reply-To: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech> (Junhui Liu's
	message of "Tue, 10 Mar 2026 16:33:53 +0800")
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 14:52:25 +0200
Message-ID: <1jo6gta4qe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_055230_163236_C4D537E7 
X-CRM114-Status: GOOD (  21.54  )
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

On mar. 10 mars 2026 at 16:33, Junhui Liu <junhui.liu@pigmoral.tech> wrote:

> Add support for the main CCU and the PRCM module (R-CCU) found in the
> Allwinner A733 SoC. The clock architecture of the A733 is an evolution
> of the previous A523 design but introduces several significant changes.
>
> One of the key changes is the introduction of a "pll-ref" clock that
> normalizes the physical oscillator frequency (which can be 19.2MHz,
> 24MHz, or 26MHz) into a consistent 24MHz reference for the entire clock
> tree. Additionally, while the A733 inherits many module clock structures
> from the A523, the MCU_CCU has been removed, and the overall clock tree
> has been expanded to support more new functional units.
>
> Also update the sunxi-ng SDM (Sigma-Delta Modulation) helper to support
> a new dual-pattern register design. On the A733, the SDM enable bit has
> been moved from the main PLL register to a second pattern register
> (PATTERN1). The driver is updated to handle this register layout to
> ensure accurate frequency synthesis for "pll-audio0".
>
> This is marked as RFC because the parent clocks for several instances in
> the main CCU are difficult to determine as the user manual provides
> limited information on their specific clock sources. In these cases, the
> implementation follows vendor practices and previous SoC designs,
> generally defaulting to "hosc" where documentation is lacking. In
> contrast, the bus clock gates in the PRCM (R-CCU) are explicitly defined
> based on the Memory Map in the manual, which clearly associates each
> module with its respective bus. Feedback or insights on these specific
> clock parents would be greatly appreciated.
>
> This functionally relies on the RTC series for the A733 SoC [1].
>
> Link: https://lore.kernel.org/all/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech/ [1]
>

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> Junhui Liu (8):
>       dt-bindings: clk: sun60i-a733-ccu: Add allwinner A733 support
>       clk: sunxi-ng: sdm: Add dual patterns support
>       clk: sunxi-ng: a733: Add PRCM CCU
>       clk: sunxi-ng: a733: Add PLL clocks support
>       clk: sunxi-ng: a733: Add bus clocks support
>       clk: sunxi-ng: a733: Add mod clocks support
>       clk: sunxi-ng: a733: Add bus clock gates
>       clk: sunxi-ng: a733: Add reset lines
>
>  .../bindings/clock/allwinner,sun60i-a733-ccu.yaml  |  107 +
>  drivers/clk/sunxi-ng/Kconfig                       |   10 +
>  drivers/clk/sunxi-ng/Makefile                      |    4 +
>  drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c           |  276 +++
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c             | 2375 ++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_sdm.c                     |   51 +-
>  drivers/clk/sunxi-ng/ccu_sdm.h                     |   32 +-
>  include/dt-bindings/clock/sun60i-a733-ccu.h        |  289 +++
>  include/dt-bindings/clock/sun60i-a733-r-ccu.h      |   39 +
>  include/dt-bindings/reset/sun60i-a733-ccu.h        |  131 ++
>  include/dt-bindings/reset/sun60i-a733-r-ccu.h      |   23 +
>  11 files changed, 3311 insertions(+), 26 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260202-a733-clk-0d4fc00a9f9c
>
> Best regards,

-- 
Jerome

