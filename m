Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E279D185DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e90SFEWXzFdLA8zLbqG5A+4EPPS19gYfKfGjqnh7To=; b=Tsbg0bHPnotIiIntpxMCm1sSW3
	Y/CjhAxBJ3fg8L5g/YJtMp/xEThIABy7ajjk/cswp1/UF6qWkg33lbd4w8s4GZGToY+TbPoHxnKnP
	V4FrMUtbXRNp8u6cn1KYM+/eDlzzJjGQkH9OYhospBmKk0D140tK92Hxv+Ks+GFvvTRPdMKw0Sc84
	0kWgSug9OgvQH7bHv2UMJuiSDwiSmLH5pKBO2kcxI3SnbeBcmxn7E+xlez6jMS96Bwu0XxTNE8EAj
	tf00T80PyXKVWusdPyLwEjsVJLkWsoCOtBBwo6sI3nT4Cj11o1zNzCpHjz6CQiTNr9X7hDy3Lvt8v
	LLWwA0oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdopb-0000000GwDz-2z5B;
	Thu, 08 Jan 2026 12:09:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdopZ-0000000GwDY-1NZx;
	Thu, 08 Jan 2026 12:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767874168;
	bh=q0TlDqpr415sq727uuVVX4LyTiAOn5O9CGBq1T+5u5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X6DBAXPGYo6G7Y2+a2GriXbE3SBz4uZEUzVNJiatCA25v20IsluEZJEpDAs1lM48v
	 rvU8IAIQDxDViRGTGd8HXh7uOs9Fyj0OVdtzoC/6Z3uB5LPQr9PoMzUm+xvA4/f+d1
	 DjXTs7qgGRyf0J+Hq+YGuaRRN8FArMODeHh8S9fU80u44nyQdZCam0jvzaciS/CdO9
	 VREtv9ox10zpqn+px+AO+O8LwbwCSAVce6Hn9H2jXXmsq82Hr3IQ8deRop4VeKx9kI
	 rTPlWxHBN9etr7LzfOheJ0BMt73xKUYxfqVPs4FXNpEhKPwsJax1VkJeFFWzmQ09Jc
	 Lo8ql6Lv4Y+6g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9B5A17E13D8;
	Thu,  8 Jan 2026 13:09:27 +0100 (CET)
Message-ID: <f73a57bf-8527-4d1d-9f2e-78fe3c9973cb@collabora.com>
Date: Thu, 8 Jan 2026 13:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 0/5] MediaTek PLL Refactors and Fixes
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_040933_577753_15E90A11 
X-CRM114-Status: GOOD (  20.11  )
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

Il 15/12/25 11:23, Nicolas Frattaroli ha scritto:
> This series refactors all users of mtk-pll, just so we can enable
> runtime power management for the clock controllers that want it. It's
> also generally more useful to have the struct device in the pll code,
> rather than the device node.
> 
> Also fix up MT8196 mfgpll to declare its parent-child relationship with
> mfg_eb, and fix the common clock framework core to take
> CLK_OPS_PARENT_ENABLE into account for the recalc_rate op as well.
> 
> The reason why this is all in the same series is that it grew out of me
> first modelling this as an RPM clock for mfgpll, which Angelo disagreed
> with, so I did some investigation and it seems MFG_EB indeed is a parent
> clock. However, the earlier refactoring to pass the device pointer down
> is still useful.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v3:
> - Make device_node forward declaration a device forward declaration
> - Remove forward declarations of struct clk_ops and struct
>    clk_hw_onecell_data. (clk-provider.h include remains as it's needed
>    for a complete type of clk_hw)
> - Move PLL_PARENT_EN flag to individual mfgpll definitions.
> - Link to v2: https://lore.kernel.org/r/20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com
> 
> Changes in v2:
> - Drop bindings patch
> - Drop mfgpll RPM patch
> - Add patch to also transition pllfh to passing device
> - Add fixes patch to make CLK_OPS_PARENT_ENABLE also apply to the
>    recalc_rate operation
> - Remodel mfgpll's mfg_eb dependency as parent-child with
>    CLK_OPS_PARENT_ENABLE
> - Link to v1: https://lore.kernel.org/r/20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com
> 
> ---
> Nicolas Frattaroli (5):
>        clk: Respect CLK_OPS_PARENT_ENABLE during recalc
>        clk: mediatek: Refactor pll registration to pass device
>        clk: mediatek: Pass device to clk_hw_register for PLLs
>        clk: mediatek: Refactor pllfh registration to pass device
>        clk: mediatek: Add mfg_eb as parent to mt8196 mfgpll clocks
> 
>   drivers/clk/clk.c                            | 13 +++++++++++++
>   drivers/clk/mediatek/clk-mt2701.c            |  2 +-
>   drivers/clk/mediatek/clk-mt2712-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c |  4 ++--
>   drivers/clk/mediatek/clk-mt6765.c            |  2 +-
>   drivers/clk/mediatek/clk-mt6779.c            |  2 +-
>   drivers/clk/mediatek/clk-mt6795-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt6797.c            |  2 +-
>   drivers/clk/mediatek/clk-mt7622-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt7629.c            |  2 +-
>   drivers/clk/mediatek/clk-mt7981-apmixed.c    |  2 +-
>   drivers/clk/mediatek/clk-mt7986-apmixed.c    |  2 +-
>   drivers/clk/mediatek/clk-mt7988-apmixed.c    |  2 +-
>   drivers/clk/mediatek/clk-mt8135-apmixedsys.c |  3 ++-
>   drivers/clk/mediatek/clk-mt8167-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 14 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8186-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8188-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8192-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8195-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8195-apusys_pll.c |  3 ++-
>   drivers/clk/mediatek/clk-mt8196-apmixedsys.c |  3 ++-
>   drivers/clk/mediatek/clk-mt8196-mcu.c        |  2 +-
>   drivers/clk/mediatek/clk-mt8196-mfg.c        | 15 ++++++++-------
>   drivers/clk/mediatek/clk-mt8196-vlpckgen.c   |  2 +-
>   drivers/clk/mediatek/clk-mt8365-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-mt8516-apmixedsys.c |  2 +-
>   drivers/clk/mediatek/clk-pll.c               | 19 +++++++++++++------
>   drivers/clk/mediatek/clk-pll.h               | 15 ++++++++-------
>   drivers/clk/mediatek/clk-pllfh.c             | 13 ++++++++-----
>   drivers/clk/mediatek/clk-pllfh.h             |  2 +-
>   32 files changed, 87 insertions(+), 59 deletions(-)
> ---
> base-commit: adff43957b0d8b9f6ad0e1b1f6daa7136f9ffbef
> change-id: 20250929-mtk-pll-rpm-bf28192dd016
> 
> Best regards,



