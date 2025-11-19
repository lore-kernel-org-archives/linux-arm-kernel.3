Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB32CF34C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTNOqgaZlRM7M6ydZWtUNZLt3QeCgjYKGj5gs/tpHsA=; b=YOpt4sTsac0lkXUS29Zp0Qh+py
	wOw9PW0vK5WCmz7CeLfUvfNYTuSgYlwBLwgbLc07d/+nHeua5+sgNmQws7dFtLxQrN9QqgCKIt+u/
	l273QQcO6ESuMBY847zERNqbJPJntQmQac0Tyok7ngT3JARv/IUOlYbCtIf5NmCz8K4cg9JcpJr1G
	56WJzsm9FMRP/7di3uPoVC488wwVgUzX4aMnKFEYY7IbdSgyawU6M+u9vV0+qaGGyHE5zv0+ZemqN
	sEt48c9vH/wc7KxDl8sv7K2FUtEBIbl7lGXqHdY/QIwbmHE9ICdi+uTKIPNNkqrfpUAhTeEr4oytS
	TUVNMGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjbY-00000003QFZ-0DLI;
	Wed, 19 Nov 2025 14:56:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjbS-00000003QER-43Tl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:56:18 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251119145608euoutp01bddc6cafed9f5b90ef8427453d6548f0~5cESLcNCL2989829898euoutp01_
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 14:56:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251119145608euoutp01bddc6cafed9f5b90ef8427453d6548f0~5cESLcNCL2989829898euoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763564168;
	bh=bTNOqgaZlRM7M6ydZWtUNZLt3QeCgjYKGj5gs/tpHsA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=pvf8N5GNJzdWKkKbxIxfhxtvIqvVRjK2vXIEPuwGUxCXklo4bzKPbxvu4LPhrsmyM
	 9e97DCqbG1y/p+Xn/eQvA3D/oBvxIWxtqpI6JIljahRcgph41sV4ABzIZlEF1dsDLD
	 ntxVCWv27H6J0KDd9svUG0xMeVPatpHwd5BwGxEc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251119145608eucas1p2bafd557fd8e8730f7482117f024d6e29~5cER5zeD30435804358eucas1p2H;
	Wed, 19 Nov 2025 14:56:08 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251119145607eusmtip22c2420a597a9ce378c48929f165f131a~5cERKU-j22216322163eusmtip2x;
	Wed, 19 Nov 2025 14:56:07 +0000 (GMT)
Message-ID: <94216440-dea1-4346-9086-fc20a3e6fe7b@samsung.com>
Date: Wed, 19 Nov 2025 15:56:07 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] of/irq: Handle explicit interrupt parent
To: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring
	<robh@kernel.org>, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marc Zyngier
	<maz@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251119145608eucas1p2bafd557fd8e8730f7482117f024d6e29
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251119131924eucas1p1667eb6127eeb0f19671bc02b0e67fb02
X-EPHeader: CA
X-CMS-RootMailID: 20251119131924eucas1p1667eb6127eeb0f19671bc02b0e67fb02
References: <CGME20251119131924eucas1p1667eb6127eeb0f19671bc02b0e67fb02@eucas1p1.samsung.com>
	<e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_065616_434265_12FDF23F 
X-CRM114-Status: GOOD (  20.19  )
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

On 19.11.2025 14:19, Geert Uytterhoeven wrote:
> If an interrupt controller is used as a proxy, it may have an
> "interrupt-parent" property, but lack "interrupts" and
> "interrupts-extended" properties.  In that case, the "interrupt-parent"
> property in the interrupt controller node is ignored, causing the
> interrupt controller to fail to probe, and leading to system boot
> failures or crashes.
>
> Fix this by also considering an explicit "interrupt-parent" property in
> the interrupt controller node itself.
>
> Fixes: 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt parent for nodes without interrupts")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/20251118115037.1866871-1-m.szyprowski@samsung.com
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/b037f67a-b241-4689-9914-57ff578c1454@sirena.org.uk
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

This fixes the issue observed on 32bit Samsung Exynos based boards.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   drivers/of/irq.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index a68272db9879bedf..f374d8b212b8669c 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -685,6 +685,8 @@ void __init of_irq_init(const struct of_device_id *matches)
>   		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
>   		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
>   			desc->interrupt_parent = of_irq_find_parent(np);
> +		else if (!desc->interrupt_parent)
> +			desc->interrupt_parent = of_parse_phandle(np, "interrupt-parent", 0);
>   		if (desc->interrupt_parent == np) {
>   			of_node_put(desc->interrupt_parent);
>   			desc->interrupt_parent = NULL;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


