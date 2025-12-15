Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F91D5B846
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jD2gSrbwz8qwRcQAUIoCa/YtmLX1qZ3zgXWUCARLWUM=; b=hHMTPGJ/kfegwFnkvwv9e0YT1F
	ZR/yKLVTlTcpbelJUJwhah8hUZooCg3k4LOqmqwAGBqyfoCfV1Mc6FDUryBFPOtzDOqruV6JbE2F0
	mCw3Zvtjetlvc5doDT5TEOybfHnJfgnGWbVuK+Wgss+JcMtLaLiVIwT9CqBq1QIRB1BFpvSpfG6+K
	nWhkoatUS/4grD7kF4MP3BHG5s7+pA3S2QJ1P+xR+7nFAF/PmI401dPf+UhyicVK/zbnzInKGukbs
	TIV/cK8fHnND3nd/EiWA1uBeZzsqRxcYxjpcsgk8cqayj+NoYlextfnF8120DcMWaCcZ3Tq9SA74s
	1j0Km4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAxE-00000003wgR-14qA;
	Mon, 15 Dec 2025 15:57:44 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAxC-00000003wfc-2Rn5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:57:43 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-78d6a3c3b77so37910747b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765814261; x=1766419061; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jD2gSrbwz8qwRcQAUIoCa/YtmLX1qZ3zgXWUCARLWUM=;
        b=rMols9/mrUSbTUddwKN6k9wAc8Dt/pNmqUaHDu0ZTG1sZtAxOWKyAwFF2TZf6P2nyw
         jTspD+lUxPHM11WMnCjtHk54BWdOczpBisKNP4pbGr2+OoS9lv3IZCgwfzi+UYsa8Qss
         nbFaCwXZce5sZQe1EA66uCobTembjpAyLffG03uPnT+6nw98uViPN0UQLwvDQn/SIMDS
         xFMbTQ360SBf2BRZcBACyjoJP0dWptoJiMPdvfxB7x0yUKf5tskaIrczDmbDwBTSN78w
         7o8eIitn/JWPniC/yUr1e4kJOsXjLPGN+RvQor4kouN8TA3yrsujhnm9qR3FS/oLW2al
         kSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814261; x=1766419061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD2gSrbwz8qwRcQAUIoCa/YtmLX1qZ3zgXWUCARLWUM=;
        b=WPSkNgQAumJv/KiTdSYhrTY7eQfAQaMx0rgL+PKG4jZNt3zS5Jp5ZuDMXdnQkNFh8y
         AuKsf7lmUUmQZl15/Op1XTXrr/sD7RouDc8zAQBEzGlDsXe7D6oK9icK7I7+tW4RSMsm
         xEc6770wONDxFtlMc2v2cvD4bC3X0AwcZO0WLw05fwHeKg9IREW9jFe5xZmFlpO6EqSZ
         V2p3PyyDsTu0YnRCRPVHtLbG8ec+I+UmCK8H8zgnDzP0knJlXWm7gcNfy6xk/Spk4173
         FL2GlTUlltw7raTkMu+XPHqxfK5w1nfgu79wjescQuFjYC7RATOWdXuxzoz6ijA172HY
         f+sw==
X-Forwarded-Encrypted: i=1; AJvYcCWvtgZry1o4pqhMkXo4Fkq2Ucwp7irmVH/5aq1CgSHKZy4f+wnru+75/Dl+WUy2y0YPxiD74h6sEJXSB+0w0jbc@lists.infradead.org
X-Gm-Message-State: AOJu0YxZylPOLoQt04gTMKjnfxi4pWyglnyqjgm8X7S0HElgOtvNpQlz
	76LAKNc6q1FZGNlBTJuCdta89SeHrFUJ3N+L3fQhA6p7hHJhnbXYXVvZm2k3XmZcTBi7+Ycr6rR
	liqEo7tiHpLCt88kyM1vOsn6zfVV5Lv9VHlUdYe0uvQ==
X-Gm-Gg: AY/fxX6q3BCDbtxZBTtb8ebpOd2ahDHVCk6PvmktGDCiTIbu7qcPG3d4s9GGHDkTQkH
	wxJLz4egM2S1fJlfAI6qJMbWpBOP0KWXGZ6g3XniHSYSFBXgw2wpf2ynHgk1+oYsyPyr/Ee3Swk
	heR9MhI0NrYt3fMnc4Olb45wrPZfQ8xCWmvnfCf/IEuGEbFYswjvtzGkfJxs1hp+ijgLIZB9QWT
	CUbKULsLTfV9iBUCnOpgQxOweF9qWOZ24ZVLUFOuwKPu6jJQnpFGbzHDuRAce7+PhPbgMx5
X-Google-Smtp-Source: AGHT+IHnzK21TfrVLiBrKEfsBY0yy3nNModkqTwvqLIVjQPjpPnPxA37IWTaMsN5LsanoFGI3JzdpIiVMlmjMLIYn+0=
X-Received: by 2002:a53:acc2:0:20b0:63f:af94:79d2 with SMTP id
 956f58d0204a3-6447a58f4a3mr9014275d50.34.1765814261319; Mon, 15 Dec 2025
 07:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
In-Reply-To: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:57:03 +0100
X-Gm-Features: AQt7F2pOE88ysP1TXeUkBFRRwGo0OeDBvPna4LwWc08y3UTdwUmGokrHz2XyogY
Message-ID: <CAPDyKFrsRTmvc4JmFAT_mCEEaG9yGkZn_JJqqyqCnB-AmpZgsQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] Add support for MT8189 clock/power controller
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Richard Cochran <richardcochran@gmail.com>, Qiqi Wang <qiqi.wang@mediatek.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075742_650965_230BDE47 
X-CRM114-Status: GOOD (  20.43  )
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

On Mon, 15 Dec 2025 at 04:50, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
>
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>
> Changes since v4:
> - Fix dt_binding_check warning.
> - Check prepare_enable before set_parent to ensure our reference clock is ready.
> - Enable fhctl in apmixed driver.
> - Refine clock drivers:
>   - Change subsys name, regs base/size (clock related part, instead of whole subsys).
>   - Simply code with GATE_MTK macro.
>   - Add MODULE_DEVICE_TABLE, MODULE_DESCRIPTION
>   - Register remove callback mtk_clk_simple_remove.
>   - Remove most of CLK_OPS_PARENT_ENABLE and CLK_IGNORE_UNUSED which may block bringup,
>       but some subsys will power off before we disable unused clocks, so still need here.

I assume I can pick the pmdomain related changes (patch2, patch20 and
patch21) from this series, as they are independent from the clock
changes, right?

Kind regards
Uffe


>
> changes since v3:
> - Add power-controller dt-schema to mediatek,power-controller.yaml.
> - Separates clock commit to small parts (by sub-system).
> - Change to mtk-pm-domains for new MTK pm framework.
>
> changes since v2:
> - Fix dt-schema checking fails
> - Merge dt-binding files and dt-schema files into one patch.
> - Add vendor information to dt-binding file name.
> - Remove NR define in dt-binding header.
> - Add struct member description.
>
>   This series add support for the clock and power controllers
> of MediaTek's new SoC, MT8189. With these changes,
> other modules can easily manage clock and power resources
> using standard Linux APIs, such as the Common Clock Framework (CCF)
> and pm_runtime on MT8189 platform.
>
> Irving-CH Lin (21):
>   dt-bindings: clock: mediatek: Add MT8189 clock definitions
>   dt-bindings: power: mediatek: Add MT8189 power domain definitions
>   clk: mediatek: clk-mux: Make sure bypass clk enabled while setting MFG
>     rate
>   clk: mediatek: Add MT8189 apmixedsys clock support
>   clk: mediatek: Add MT8189 topckgen clock support
>   clk: mediatek: Add MT8189 vlpckgen clock support
>   clk: mediatek: Add MT8189 vlpcfg clock support
>   clk: mediatek: Add MT8189 bus clock support
>   clk: mediatek: Add MT8189 cam clock support
>   clk: mediatek: Add MT8189 dbgao clock support
>   clk: mediatek: Add MT8189 dvfsrc clock support
>   clk: mediatek: Add MT8189 i2c clock support
>   clk: mediatek: Add MT8189 img clock support
>   clk: mediatek: Add MT8189 mdp clock support
>   clk: mediatek: Add MT8189 mfg clock support
>   clk: mediatek: Add MT8189 dispsys clock support
>   clk: mediatek: Add MT8189 scp clock support
>   clk: mediatek: Add MT8189 ufs clock support
>   clk: mediatek: Add MT8189 vcodec clock support
>   pmdomain: mediatek: Add bus protect control flow for MT8189
>   pmdomain: mediatek: Add power domain driver for MT8189 SoC
>
>  .../bindings/clock/mediatek,mt8189-clock.yaml |   90 ++
>  .../clock/mediatek,mt8189-sys-clock.yaml      |   58 +
>  .../power/mediatek,power-controller.yaml      |    1 +
>  drivers/clk/mediatek/Kconfig                  |  146 +++
>  drivers/clk/mediatek/Makefile                 |   14 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c  |  192 ++++
>  drivers/clk/mediatek/clk-mt8189-bus.c         |  196 ++++
>  drivers/clk/mediatek/clk-mt8189-cam.c         |  108 ++
>  drivers/clk/mediatek/clk-mt8189-dbgao.c       |   94 ++
>  drivers/clk/mediatek/clk-mt8189-dispsys.c     |  172 +++
>  drivers/clk/mediatek/clk-mt8189-dvfsrc.c      |   54 +
>  drivers/clk/mediatek/clk-mt8189-iic.c         |  118 ++
>  drivers/clk/mediatek/clk-mt8189-img.c         |  107 ++
>  drivers/clk/mediatek/clk-mt8189-mdpsys.c      |   91 ++
>  drivers/clk/mediatek/clk-mt8189-mfg.c         |   53 +
>  drivers/clk/mediatek/clk-mt8189-scp.c         |   73 ++
>  drivers/clk/mediatek/clk-mt8189-topckgen.c    | 1020 +++++++++++++++++
>  drivers/clk/mediatek/clk-mt8189-ufs.c         |   89 ++
>  drivers/clk/mediatek/clk-mt8189-vcodec.c      |   93 ++
>  drivers/clk/mediatek/clk-mt8189-vlpcfg.c      |  111 ++
>  drivers/clk/mediatek/clk-mt8189-vlpckgen.c    |  280 +++++
>  drivers/clk/mediatek/clk-mux.c                |    9 +-
>  drivers/pmdomain/mediatek/mt8189-pm-domains.h |  485 ++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    |   36 +-
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |    5 +
>  .../dt-bindings/clock/mediatek,mt8189-clk.h   |  580 ++++++++++
>  .../dt-bindings/power/mediatek,mt8189-power.h |   38 +
>  27 files changed, 4306 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8189-sys-clock.yaml
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-apmixedsys.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-bus.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-cam.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-dbgao.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-dispsys.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-dvfsrc.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-iic.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-img.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-mdpsys.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-mfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-scp.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-topckgen.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-ufs.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-vcodec.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpcfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt8189-vlpckgen.c
>  create mode 100644 drivers/pmdomain/mediatek/mt8189-pm-domains.h
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8189-clk.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
>
> --
> 2.45.2
>

