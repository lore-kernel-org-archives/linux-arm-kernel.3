Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CA8EA3F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rv7yW98OoRgTousE8IWDfe5nMbnqjPN7IlweunYrkU4=; b=B+dAhmBFqO2maCKTH8WPJl7AEK
	UNtDKtEjgdDzDQsgfwSPpSkCibNiYYeiHXlPTNk6YTzSGYJNTcCkeyplHCKbHwjEIPpm4jQ7t14ST
	2a79yQqo6tCeriRiQ2HMRqypmacSTal7QwyuOKldEjfNEpHlXP/gvZzOXuXQE/7oi8D01qcdZD6Xq
	/hqfNbb2X/HYi2g8MKCwfDMQfTSBMeJFhsyFQ62kNZvQb81+DncNcuT13fdFvHhn/njKFyL7SkH+2
	ngsvVwzFipl7TnzREfRgfxmcC0mydBMRQ6lgBEySdxm7dokTg34wrKi5iL2aKItL12bCsdB7TL4Tu
	sb0e9FiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqOS-0000000HCmj-06el;
	Tue, 10 Feb 2026 16:15:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqOP-0000000HCln-1Y7X;
	Tue, 10 Feb 2026 16:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770740110;
	bh=ESssw3AcJ/djN6ROZdEIy2RGCShV5/2AG674QUn3s1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jq81/DkTQ50k6Du5aMe0jYXrIYsIr/tvNvYgUjxFVCpxwVzet94JC+4xhx/51iUFy
	 u12/nuIG0maHLuTKHDy1FHtFRA1IvYUsa0anxLnyGfW4IsqA0rkYNqjFhA8ESQq3yy
	 QJoT9vjvz6kUc5WJU3MpeJ2WBAQglUq67AhX2wWJ2MtTL4B+rvRG6mXXnTcE+4V8Xn
	 zLSjWVDKybK49QUm0xvmkuZtDysk+8sPa5C+JC0L2gLtPgizqjeF3onvlHtA0IoNw9
	 czQ8UYDkErtlZh44Wdj9eKm8AjQPssLcSR+EN0jICAnRzDOjhpDCWErvxSV0p6ei+g
	 Bj6fBpva8gLpg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:7872:ec71:6d40:b8ea])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A360417E0C21;
	Tue, 10 Feb 2026 17:15:09 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: aford173@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	broonie@kernel.org,
	laura.nao@collabora.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	nfraprado@collabora.com,
	sboyd@kernel.org,
	ulf.hansson@linaro.org
Subject: Re: [PATCH 5/5] drivers: clk: mediatek: Fix error finding regmap
Date: Tue, 10 Feb 2026 17:14:57 +0100
Message-Id: <20260210161457.43020-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260210053708.17239-5-aford173@gmail.com>
References: <20260210053708.17239-5-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_081513_567689_86E26B37 
X-CRM114-Status: GOOD (  18.98  )
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

Hi,

On 2/10/26 06:37, Adam Ford wrote:
> The clock driver for clk-mt8196-vdisp-ao doesn't use the same common clk
> functions that other clocks use.  As such, this clock returns an error:
>
>   Cannot find regmap for /soc: -ENOMEM
>   clk-mt8196-vdisp-ao 3e800000.syscon: probe with driver clk-mt8196-vdisp-ao failed with error -12
>
> Fix this by using the common clock calls.  With this patch, the following
> new clocks properly enumerate:
>
>   mm_v_disp_vdisp_ao_config
>   mm_v_disp_dpc
>   mm_v_smi_sub_somm0
>
> Fixes: d4fb7e15a520 ("clk: mediatek: Add MT8196 disp-ao clock support")
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt8196-vdisp_ao.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
> index fddb69d1c3eb..070c60f40b64 100644
> --- a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
> +++ b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
> @@ -67,8 +67,8 @@ static const struct of_device_id of_match_clk_mt8196_vdisp_ao[] = {
>  MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vdisp_ao);
>  
>  static struct platform_driver clk_mt8196_vdisp_ao_drv = {
> -	.probe = mtk_clk_pdev_probe,
> -	.remove = mtk_clk_pdev_remove,
> +	.probe = mtk_clk_simple_probe,
> +	.remove = mtk_clk_simple_remove,
>  	.driver = {
>  		.name = "clk-mt8196-vdisp-ao",
>  		.of_match_table = of_match_clk_mt8196_vdisp_ao,

This driver is actually expected to be registered by the mtk-mmsys 
driver via platform_device_register_data() (related changes are in a 
pending series [1]), which is why it is probed via mtk_clk_pdev_probe.

[1] https://lore.kernel.org/all/20250828080855.3502514-8-paul-pl.chen@mediatek.com/

Best,

Laura


