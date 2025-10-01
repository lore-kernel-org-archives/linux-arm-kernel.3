Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A33FCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWzUSZLBPnRDG1EX47ty3oJT7qhStcUkwCdRjbBiVMk=; b=afca4XoOmSrjkgKC9M0uZNNFTO
	MB28Axwz7o6ql1Gxb5I1b4jqYdQez3t6c2ZCs2sfa41OReLBIYt1TtEzx9nYimVr5Dgi0UIa5k9dR
	Ld+bg2IRdR23ZyidIEMMb6Q0uOiQobXrMhK4CxVX/jF7Tznx7RhVQ0r/Qjg6HqPlmcADfhR9c3jcu
	vO8A8v87e/qcTfOtXSyQv6BZ0TyE7RYCv/zv0WMcb1MsqFCfUwf3r8Od1+gf4ZWb7wSZb331beW+i
	MTpPW3KyzUsYtZR33PcKffv7I7CP9Ivj+32s18rWDd+Ce25X5pmB2Sq24385wkjQoY28IP44ofirk
	gbNhSJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vCd-00000007Qne-46jB;
	Wed, 01 Oct 2025 11:40:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vCa-00000007Qmq-0Lyo;
	Wed, 01 Oct 2025 11:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318854;
	bh=pe7+znf6mpyZlP+jxhc4JLkMrXrdb9R9nlQiJWAL+Ro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S05kqDyNRj+pe9gVvonHeRgxc9guOFsO7g6gLLdPFYpQ/9tT5CQdQdvMTE1VksqrB
	 rmrGEPCDvOKU2Dc/a68BHzcbqMBSseRUjeHmSnVf2ZORiPxtBzoVfecyuvQyDPAIrR
	 KOKTA6Bbbb0Eu4S+tUrceHpnEzJACVC1xROtoMHBywqK7g5K8jxdC8cXjihSr7OdST
	 Dfrb9c66uo1GUqRSUSzWyPhLD5+QHxyjbXB3y5dL6UBRm+hXEMujV4+OKBKodLC1KG
	 1XQ6P8rkBoWLo0I+jl6Ed/Brji/egH4mmYS5DTotXN26ouvfonaX0EYe02QSgSRPsR
	 84ai4DMes2oDQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 769AE17E12DA;
	Wed,  1 Oct 2025 13:40:53 +0200 (CEST)
Message-ID: <bddf658c-c9b1-48c7-b39c-0720e9d4c934@collabora.com>
Date: Wed, 1 Oct 2025 13:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: mediatek: Pass device to clk_hw_register for
 PLLs
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Guangjie Song <guangjie.song@mediatek.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250929-mtk-pll-rpm-v1-0-49541777878d@collabora.com>
 <20250929-mtk-pll-rpm-v1-3-49541777878d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250929-mtk-pll-rpm-v1-3-49541777878d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_044056_280748_FAAD5020 
X-CRM114-Status: GOOD (  20.44  )
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

Il 29/09/25 14:13, Nicolas Frattaroli ha scritto:
> Passing the struct device pointer to clk_hw_register allows for runtime
> power management to work for the registered clocks. However, the
> mediatek PLL clocks do not do this.
> 
> Change this by adding a struct device pointer argument to
> mtk_clk_register_pll, and fix up the only other user of it. Also add a
> new member to the struct mtk_clk_pll for the struct device pointer,
> which is set by mtk_clk_register_pll and is used by
> mtk_clk_register_pll_ops.
> 
> If mtk_clk_register_pll is called with a NULL struct device pointer,
> then everything still works as expected; the clock core will simply
> treat them as previously, i.e. without runtime power management.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/clk/mediatek/clk-pll.c   | 9 ++++++---
>   drivers/clk/mediatek/clk-pll.h   | 4 +++-
>   drivers/clk/mediatek/clk-pllfh.c | 2 +-
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 

..snip..

> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
> index 83630ee07ee976bf980c8cf2dd35ea24c1b40821..62bfe4a480f14a0a742fb094aff0e6d1a79fe0c3 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
> @@ -220,7 +220,7 @@ int mtk_clk_register_pllfhs(struct device_node *node,
>   		if (use_fhctl)
>   			hw = mtk_clk_register_pllfh(pll, pllfh, base);
>   		else
> -			hw = mtk_clk_register_pll(pll, base);
> +			hw = mtk_clk_register_pll(NULL, pll, base);
>   

Seriously, you've done all that work in patch [2/4], and now you're doing that
just only with PLLFH?

Nicolas, c'mon. It's just 5 minutes ahead. :-D

Cheers,
Angelo

>   		if (IS_ERR(hw)) {
>   			pr_err("Failed to register %s clk %s: %ld\n",
> 


