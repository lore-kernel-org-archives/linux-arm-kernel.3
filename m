Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C2BC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMe1/Ur8E/Ndy277n7ed1HuYZiSqnMKvnMqR2MQV7oA=; b=D10YAZyL6E83IsXR8QlYKMCWNa
	hx4VSnSez9tYemWmbASBmW1K/yk3sirWX9aszLtLXVWzxtUVINEWxzmF5PJ4orKy7ET3YwvPTDPAJ
	O0WijrWIfrau6dIeaa61RHQydFnQEtiOWbj6z/8IRKEHOk+otN1f1NGyIq0MC+CC+BUu3G9CSglQU
	dGLAILT67jYQm69U77Xrl43Vg+JASWCTVp1rcMuhkUNs8ILDaD/Dim3wzXD8vEs1YsqMBDq3ySukR
	ixhP1L2lbgOiXzHPuSw96mmTH7rKBG85g3xwIhyT5+ru3iDrunLv7W6uMS3lfAtOowa1ITBVm788h
	M89iUhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61zW-00000002j09-0h4g;
	Mon, 14 Sep 2026 08:24:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61zO-00000002iqo-4AJe;
	Mon, 14 Sep 2026 08:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789374272;
	bh=0EtsyqxjBVKgaPGF/DW7DAhx963k6RccThtCKykmuBQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sc2R1FmEMeIKgP6RqTaGjT3tn/DiE+ku9cJ8FxvAVdJvCvu/gd3PQTHkrWj4PQbC0
	 ARtkhj+dkaVXwql9321a3OXGVEvvBsuUjxhdbTPSt2Lh0SnL4O2E+TUWaTZby6/L0O
	 T+Zz5AbRFSvQdcWoK7rY1a2t7j9uubwHuJDUYFiWsjKrEkXxUlXe9OrE94vI1JNSoE
	 KOI4qkONd2jRDuCQDkns/AjXz9yojPFB7tMnDEgsjKzLeBnI1ddlRvj/kxPdkwpRPn
	 e1k+PslxWTnhCyund/gCShGhQp9FZNYgOdEdsCBFZOFbJXMB1F6ZnzfhNhRBHWMnfg
	 asXbISnLxHktw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB51C17E05D3;
	Mon, 14 Sep 2026 10:24:31 +0200 (CEST)
Message-ID: <ce216fc7-5eeb-4147-b80c-e6cb532879bf@collabora.com>
Date: Mon, 14 Sep 2026 10:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: mediatek: mt8173-mfgtop: do not use the clk API
 from power_on
To: Ryan Brue <ryanbrue.dev@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_012435_204834_903FC164 
X-CRM114-Status: GOOD (  32.47  )
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

On 9/13/26 23:47, Ryan Brue wrote:
> clk_mt8173_mfgtop_power_on() calls clk_prepare_enable() on the mfg_26m gate
> that this same driver provides. That is a layering inversion which cannot
> work: clk_core_prepare() calls clk_pm_runtime_get() on the clock provider
> -- this driver's own device -- and genpd power transitions run at _noirq
> time, where runtime PM is disabled and pm_runtime_resume_and_get() returns
> -EACCES.
> 
> Measured on mt8173 (amazon-suez) during resume from suspend-to-RAM,
> immediately after the secondary CPUs come back up:
> 
>    clk-mt8173-mfgtop 13fff000.clock-controller: 26 MHz clock enable failed: -13
> 
> The failure is not survivable, because genpd_sync_power_on() ignores what
> power_on() returns and marks the domain on regardless. The clock is then
> left ungated-but-unprepared, and the next power_off() underflows its
> refcount:
> 
>    mfg_26m already disabled
>    mfg_26m already unprepared
>    WARNING: drivers/clk/clk.c:1048 at clk_core_unprepare
>    Workqueue: pm genpd_power_off_work_fn
>      clk_unprepare / clk_mt8173_mfgtop_power_off / _genpd_power_off
> 
> Gate the bit with a direct regmap write instead. The vendor driver
> (mtk_mfgsys.c) also drives the four MFG CG bits with raw register writes
> from its power sequencing. The runtime-PM path was never affected, only the
> _noirq transitions of system suspend and resume. mfg_26m stays registered
> as a clock for any consumer that wants it; nothing currently does.
> 
> Because the gate is now driven from the domain callbacks, its enable count
> in the clock framework stays 0 while the domain is on. Mark it
> CLK_IGNORE_UNUSED so that clk_disable_unused() does not gate the 26 MHz
> clock under an already-powered domain when a consumer probes before late
> init; the domain callbacks are the only writers.
> 
> Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

I don't exactly like this, but it's the least complicated way of doing this, and
it's also the one that is less likely to break over time, so...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in v2:
> - Mark mfg_26m CLK_IGNORE_UNUSED: with the gate driven from the domain
>    callbacks its CCF enable count stays 0, so clk_disable_unused() would gate
>    the 26 MHz clock under an already-powered domain if a consumer probed
>    before late init (reported by the Sashiko review of v1). Verified on the
>    Fire HD 10: the gate follows the domain (hardware Y with the GPU active, N
>    after unbind) while the enable count stays 0, and the GPU keeps working.
> - Link to v1: https://patch.msgid.link/20260912-mfgtop-no-clk-api-power-on-v1-1-def157ad1277@gmail.com
> ---
>   drivers/clk/mediatek/clk-mt8173-mfgtop.c | 29 +++++++++++------------------
>   1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
> index 5669ca9954dc..53918ad7f402 100644
> --- a/drivers/clk/mediatek/clk-mt8173-mfgtop.c
> +++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
> @@ -30,6 +30,8 @@ static const struct mtk_gate_regs mfg_cg_regs = {
>   	.set_ofs = 0x0004,
>   };
>   
> +#define MFG_CG_26M	BIT(3)
> +
>   #define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
>   	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
>   
> @@ -38,7 +40,8 @@ static const struct mtk_gate mfg_clks[] = {
>   	GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
>   	GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
>   	GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
> -	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
> +	/* Driven by the power domain callbacks, not by a clk consumer */
> +	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, CLK_IGNORE_UNUSED),
>   };
>   
>   struct mt8173_mfgtop_data {
> @@ -46,7 +49,6 @@ struct mt8173_mfgtop_data {
>   	struct regmap *regmap;
>   	struct generic_pm_domain genpd;
>   	struct of_phandle_args parent_pd, child_pd;
> -	struct clk *clk_26m;
>   };
>   
>   /* Delay count in clock cycles */
> @@ -66,12 +68,12 @@ struct mt8173_mfgtop_data {
>   static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
>   {
>   	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
> -	int ret;
>   
> -	/* drives internal power management */
> -	ret = clk_prepare_enable(data->clk_26m);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * Drives internal power management. Written directly: the clk API
> +	 * needs runtime PM, which is disabled during _noirq transitions.
> +	 */
> +	regmap_write(data->regmap, mfg_cg_regs.clr_ofs, MFG_CG_26M);
>   
>   	/* Power on/off delays for various signals */
>   	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
> @@ -103,7 +105,7 @@ static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
>   	regmap_write(data->regmap, 0xec, 0);
>   
>   	/* drives internal power management */
> -	clk_disable_unprepare(data->clk_26m);
> +	regmap_write(data->regmap, mfg_cg_regs.set_ofs, MFG_CG_26M);
>   
>   	return 0;
>   }
> @@ -155,16 +157,10 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
>   		goto put_pm_runtime;
>   	}
>   
> -	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
> -	if (IS_ERR(data->clk_26m)) {
> -		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
> -		goto unregister_clks;
> -	}
> -
>   	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
>   	if (ret) {
>   		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
> -		goto put_26m_clk;
> +		goto unregister_clks;
>   	}
>   
>   	data->genpd.name = "mfg-top";
> @@ -197,8 +193,6 @@ static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
>   	pm_genpd_remove(&data->genpd);
>   del_clk_provider:
>   	of_clk_del_provider(node);
> -put_26m_clk:
> -	clk_put(data->clk_26m);
>   unregister_clks:
>   	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
>   put_pm_runtime:
> @@ -217,7 +211,6 @@ static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
>   	of_genpd_del_provider(node);
>   	pm_genpd_remove(&data->genpd);
>   	of_clk_del_provider(node);
> -	clk_put(data->clk_26m);
>   	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
>   	of_node_put(data->parent_pd.np);
>   }
> 
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260912-mfgtop-no-clk-api-power-on-a5e0a3a43b33
> 
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>


