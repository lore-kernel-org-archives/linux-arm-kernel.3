Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83777C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3I2oTB5ODPrH8cdex9oHS8XDuW7CaS099dxdnIc2jY=; b=efvdeF/u5aYeSFhADqs9+MbSlw
	c+HpBZnIqZb/ULmzdOO479q8uvsKg+6vLOk0iJrZUlknn44ZivHA3NnBLsolyDZ6PBjpW7+moidLS
	glZs2r5OQJ8sCT/uvadrpYoovHt+5BbrfEptceV8PzZvNbIbkgI0tP0DEXpDRwmfggA2/wJia8tyJ
	mfOpg6/ezG9/xi9M3YLWLD50J0/Hah6oSxIaeBtFab82kvM/2CdBbzCNBqlXRqOlMZaQVp8IteVQM
	26hzb96fPfg1j+z2vpIbXtjtyPKv+uinXzKUAuD7EQbN7WL9WkaLRtzC/RFBb2cqXGrU11pam4t9k
	8sHlyzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Ue-00000002uqb-2zpC;
	Tue, 08 Apr 2025 06:31:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22SO-00000002uGy-20PK;
	Tue, 08 Apr 2025 06:29:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0AB3A48B2F;
	Tue,  8 Apr 2025 06:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAA2C4CEE5;
	Tue,  8 Apr 2025 06:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744093751;
	bh=OLLi5Lp4foT1nQeIS5bBtPzSI/fuO0b+C8fsID1r/r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WNoUfRHmZvqb+BW/YiOmrlVpV5cMcIBLwSFiRZ2Ap6B2KrOsu7JS/Oj2iuTyqE2Vx
	 t3MEOT4Sy9p+1hyiUDlyzxSOOa2x8gxHyoKa2TjRoPJsXeZzuc1TBEgtu5357uq2pY
	 ZZtP2q611R24psKpzeSk+83NDso78CtRAgY6vdvs8P2Yv3H1eUTWHIJj2aSzVPFZvg
	 UK7NdiLPWWX5vFhNpbpqC28s8Gp1xclSmLDFC/4RE+5ClP7GOQ5QNwvhsxLmrW/7+o
	 yHnPx4eFD3it9x2XCJlw3k6M0+lYD6Wo8r3NWNSe5jy4e+egUJaw6nL0h+l4yyp3Gg
	 8KPRSeGTcD9pA==
Date: Tue, 8 Apr 2025 08:29:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 3/3] memory: mtk-smi: mt8188: Use
 devm_pm_runtime_enable
Message-ID: <20250408-woodoo-quick-worm-bf82b4@shite>
References: <20250408033206.12176-1-friday.yang@mediatek.com>
 <20250408033206.12176-4-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408033206.12176-4-friday.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_232912_576897_AE6D3717 
X-CRM114-Status: GOOD (  15.79  )
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

On Tue, Apr 08, 2025 at 11:31:56AM GMT, Friday Yang wrote:
> Replace pm_runtime_enable with the devres-enabled version which
> can trigger pm_runtime_disable.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index f25d46d2ef33..daef6d350419 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_link_remove;
> 
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		goto err_link_remove;
> +
>  	platform_set_drvdata(pdev, larb);
>  	ret = component_add(dev, &mtk_smi_larb_component_ops);
>  	if (ret)
> -		goto err_pm_disable;
> +		goto err_link_remove;
> 
>  	return 0;
> 
> -err_pm_disable:
> -	pm_runtime_disable(dev);

You now broke/changed the order of cleanup without any explanation.

Best regards,
Krzysztof


