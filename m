Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217B4CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 15:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZtv5kbth628kTnUK+fDvEY/2S0WoSxVvPU3B2+mRwI=; b=aO29W1GHH3T7AlRr5NMYMOU39b
	RdUfuCBrKUbDuxGlGXcwOkQPT6LQ9PjpGI7X+VhGoreK9Y+TGW67eLILP/Mbl6waqT6mFvAmaiIPc
	9UvBpphS27t07XSxalHi5oyS9OlhoiCa73ZdNZLghKuHG3Lq/R8HZ7MA83PO5izPeq1gHy0xy6SR7
	gEbC5S7qJoDs7HLmokiX1OW+IV0zYHYRKtCh7YKobY87UuiMat2evl5V0RhZPCGdIDFJ2+Q2M/PIP
	iSMVggWsbUNoMygS7LnnHEYEvssJYr98lcmNceZsAsQUJE3t++yrm4VCALWvas6zTGHZzmAXM5IeF
	ncp/U4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoO7S-0000000AsIu-3SbG;
	Tue, 19 Aug 2025 15:19:26 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLRU-0000000AQsi-2XoC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:27:57 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e94e6c6150eso595583276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606475; x=1756211275; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yZtv5kbth628kTnUK+fDvEY/2S0WoSxVvPU3B2+mRwI=;
        b=BR7iLlwtWxGyjba+AuW0KyRAtxTuSvZSZiXbVKSulfLEE1ZSSqQKEVxYsYeRU/2+X+
         K6DiClf3yBLOc1yc+YTjbRXuPW94OQqT8lUkrRYWKTn7xejCTX4TxYQ2tBcwYTjBQd1u
         fobZFgppKx7dBneSoxcWNCGSaSnQ4vvZx2IUkNCJYR2hceVx78De0Kt/WXlA+ZA5skfk
         bj/+90YURo/5sb4j85a322uAdye+J32JCH9zBBaIwtq7UtXrkhTXvZeDJD+DWedQYx5+
         EFZPShpeQ/d2ZkP6kz/w401tmSubpX0ArhrN6oSZMAJIKVOmDVSS/Bn127LofFs6RLgC
         QpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606475; x=1756211275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZtv5kbth628kTnUK+fDvEY/2S0WoSxVvPU3B2+mRwI=;
        b=nlXoZU3HlpWu+7aD+/WXFYrc+eo0pBqq/dhw78BTb460Xi6P1verzggDSIKnap0s61
         SJFDNLZJJgf76i5uWBRkme1YgO48LRtm1OzEeq7te7gZQub7q810sQx7WEh03Z994K3M
         9iYjXpWdy7UbTD2XRgc9pTaxep+UfDUl4IOPhGYdAZkU0oH/rJ/CbUFQ03ZrGh1QexV5
         /yvSbsEJwpNFcfQpJtDbhu7uFcDFC6DxEedPqaypNZijTbNASu+xGzqQ5h39J0jR7DhV
         LiwwosbZDImirCxG3gGIifhpBeWfiEL9kCl5/Obd/A5fv3eplAGiwldV4sxqGbMw48Ct
         eQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTUPE6opOApXkFffmNt8TgGCqvGtk9IEIBkhqYmfz6iskDa++NwaF9+47+TBoYzCAdlGdCpnhor5+L6L8ILJj1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy29LZom5nNQ1ymyfZN2NVmy0UW4sAgxRQpNdpwaot2zNtWQdc3
	cfKEyuG5FNPqTk4Q6v94lR49GKTbw1RSw89nL/eVOKmXQeqXS9Ho/T50LGVh3gOaEN1TkJ0H8vF
	Ggj0ZqdjSHuENLlT/MBxhoGKpPBMdWyUYLLv/EiLxzA==
X-Gm-Gg: ASbGncsHBsnpm5OF4W1wE7SI4NF9oqkWuFlNoOKrhJh+Uel6kougvxXoeu3J6Jqpl0z
	oj5aPJVs/DjMMeMt94PXHdrmxcg4A4ReSeWoEdrZ2FW0EI3AqsPgMJh+rPr6KuzkyyQtndwoY3U
	xcDnkGmRR1t+JiQtKH67E6tJRpcbi91nK7Gp9xtO4/5uFzMAj3pXRHvlf9A1f3vU/gkziqyuU9f
	JoC/I4=
X-Google-Smtp-Source: AGHT+IGPSjRE772VSErcWH57I2UwSaBhGARpWSDSr8nygBbsS+Ayx0vpuG9nPJpw7rtBlA7oFHKd2+vlR9/sAMgL0DE=
X-Received: by 2002:a05:690c:55c7:20b0:71f:a20b:6d39 with SMTP id
 00721157ae682-71fa20b735bmr9906017b3.27.1755606475553; Tue, 19 Aug 2025
 05:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250805074746.29457-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Aug 2025 14:27:19 +0200
X-Gm-Features: Ac12FXzmR131GzmNGplYUoHaNI20Fn5hCBuzfHUqZVmIB9H896qML1tj6z64tsY
Message-ID: <CAPDyKFoe9=4KgOsPUX6FOE+yPxdUqAxRec5yKY2h6uFOeUvvDQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] pmdomain: Partial refactor, support modem and RTFF
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, y.oudjana@protonmail.com, 
	fshao@chromium.org, wenst@chromium.org, lihongbo22@huawei.com, 
	mandyjh.liu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_052756_645655_9F215249 
X-CRM114-Status: GOOD (  34.64  )
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

On Tue, 5 Aug 2025 at 09:48, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v3:
>  - Dropped specified items for cells restriction as suggested by Rob
>  - Fixed an issue in patch 4 still referencing "mediatek,bus-protection"
>    as it is entirely replaced by "access-controllers"
>
> Changes in v2:
>  - Added #access-controller-cells allowance for MT8188/95 infracfg_ao
>
> This series is a subset of [1], leaving out the Hardware Voter specific
> bits for MT8196 until the discussion around it reaches a conclusion.
>
> Even though the proposed code was born as a preparation to support the
> MT8196/MT6991 SoCs power domain controllers, it is a necessary cleanup
> for all power domain controllers of all of the currently supported SoCs
> from MediaTek.
>
> You may also notice the addition of support for modem power sequences:
> this was brought up 6 months ago (or more) by community contributors
> (mainly Yassine Oudjana) that were trying to upstream the MediaTek
> MT6735 Smartphone SoC and needed support to provide power to the MD
> subsystem - so, even though in this specific series the code for the
> modem power sequence is not yet triggered by any SoC, please please
> please, let it in.
> Besides, "a bunch" of upstream supported SoCs do have the MD power
> domain even though it wasn't added to their drivers (because if there
> was no support in the driver, it would just crash the system); the
> addition is something that I plan to do at some point, but definitely
> not now as I have no bandwidth for that (bar MT8196, which will have
> this domain).
>
> Compared to v1 in [1]:
>  - Changed mediatek,bus-protection to access-controllers
>    as suggested by Rob (thanks!)
>  - Added commits to document #access-controller-cells on all of
>    the access control providers
>
> In the meanwhile.... relevant excerpt from the old series:
>
> This series refactors the bus protection regmaps retrieval to avoid
> searching in all power domain devicetree subnodes for vendor properties
> to get syscons for different busses, and adds a new property which is
> located in the power controller root node containing handles to the same.
>
> Retrocompatibility is retained and was tested on multiple SoCs in the
> Collabora lab - specifically, on Genio 350/510/700/1200, and manually
> on MT6795 Helio (Xperia M5 Smartphone), MT8186, MT8192 and MT8195
> Chromebooks.
>
> This was tested *three times*:
>  - Before the per-SoC conversion in drivers/pmdomain/mediatek
>  - With per-SoC conversion code but with *legacy* devicetree
>  - With per-SoC conversion code and with *new* devicetree conversion
>
> All of those tests were successful on all of the aforementioned SoCs.
>
> This also adds support for:
>  - Modem power domain for both old and new MediaTek SoCs, useful for
>    bringing up the GSM/3G/4G/5G modem for both laptop and smartphone use
>  - RTFF MCU HW, as found in MT8196 Chromebooks and MT6991 Dimensity 9400
>
> ...and prepares the pmdomain code to accomodate only the directly
> controlled power domains for MT8196 (HW Voter support was left out).
>
> [1] https://lore.kernel.org/all/20250623120154.109429-1-angelogioacchino.delregno@collabora.com
>
> AngeloGioacchino Del Regno (10):
>   dt-bindings: memory: mtk-smi: Document #access-controller-cells
>   dt-bindings: clock: mediatek: Document #access-controller-cells
>   dt-bindings: power: mediatek: Document access-controllers property
>   pmdomain: mediatek: Refactor bus protection regmaps retrieval
>   pmdomain: mediatek: Handle SoCs with inverted SRAM power-down bits
>   pmdomain: mediatek: Move ctl sequences out of power_on/off functions
>   pmdomain: mediatek: Add support for modem power sequences
>   pmdomain: mediatek: Add support for RTFF Hardware in MT8196/MT6991
>   pmdomain: mediatek: Convert all SoCs to new style regmap retrieval
>   arm64: dts: mediatek: Convert all SoCs to use access-controllers
>
>  .../bindings/clock/mediatek,infracfg.yaml     |   3 +
>  .../clock/mediatek,mt8186-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8188-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8192-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8195-sys-clock.yaml      |  15 +
>  .../clock/mediatek,mt8365-sys-clock.yaml      |  15 +
>  .../mediatek,smi-common.yaml                  |  16 +
>  .../power/mediatek,power-controller.yaml      |  37 ++
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi      |   5 +-
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi      |   6 +-
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   4 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  17 +-
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  12 +-
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  23 +-
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  13 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  20 +-
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  16 +-
>  drivers/pmdomain/mediatek/mt6795-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8167-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8173-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8183-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8186-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8188-pm-domains.h |   6 +
>  drivers/pmdomain/mediatek/mt8192-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8195-pm-domains.h |   5 +
>  drivers/pmdomain/mediatek/mt8365-pm-domains.h |  14 +-
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    | 399 +++++++++++++++---
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |  74 +++-
>  28 files changed, 594 insertions(+), 181 deletions(-)
>

Patch 3->9 applied for next, thanks!

Note, patch 3 is also available on the immutable dt branch for SoC
maintainers to pull in.

Kind regards
Uffe

