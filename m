Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BB0CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 01:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDwkTqOgmwxqXqkIzich47iD5eb1x6hgJlV+oeHQedE=; b=PBNWCIhRW7qZl21k8Eau7C5OhE
	IMMup6K8DyHF8lFKPCoyQMCgGC0INLU0h4ahAM5watXthHdj9GBizTXin2/KzPHg9T/mtSIsqXu7a
	TA1bSSIbLxHAh0qnN20zJcyrLbfqMRb3IaWKujzlnv2xNZQf3X36wS8ZkfgnUkGsaavwgyp56WfUo
	aCchZ6INx7Mb5bsy1wSoZwjpwdCmvIX9E9HsjRPkq66lKYp0zzJ65XwuLurdHvreHrk47U8kcCQZX
	xNVVt1jsaGWGOFZubeGAaxCsXGmRyKuMUoyH6VfRBu6hL/otiQrAG4wcz0aopdoEEYy9oNHCGgZe8
	EVo/GtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhKc-000000071Yg-30Qi;
	Fri, 15 May 2026 01:27:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhKa-000000071Y1-2q8S;
	Fri, 15 May 2026 01:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B1424382D;
	Fri, 15 May 2026 01:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9D4C2BCB3;
	Fri, 15 May 2026 01:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778808431;
	bh=jds/KUEnMypQxF/dsmHVwU7tav2q16u3klT9lSJO4Dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKn5CzOw33zLhbULxmodZj4uSBxZUoymOm3B0RWi06fo/Tj2RARVGhm2M6dBAApiH
	 hZdpobN+XsohyfcO+zcpdWbhWFuz+9THuBp/UQBrRu5mAHgEFO/nDgHtth+FviXQem
	 /K4dEkKuze88YD2gaGUbeg7IO9LX6wXwlPwCBdpv1unf/Vvd3zNC9AwuirSn1ocquu
	 LPtaOWT8gpJtSbqvCL/0WpfaECf1gYilANfyrwqjI1psxqkVZxVBgU0Xr/WW5ke+JY
	 OFrjwxtt27geZM/MJWdFqpITcKcRyFl7HDV6OxZY+YyfPMsF26p1GhijOUUowI4pYB
	 AURsy24vtCkRw==
Date: Fri, 15 May 2026 10:27:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: lirongqing <lirongqing@baidu.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek: Fix operator precedence in
 PCIE_FTS_NUM_L0 macro
Message-ID: <20260515012505.GA3166828@rocinante>
References: <20260515005552.2343-1-lirongqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515005552.2343-1-lirongqing@baidu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_182712_741746_9901BE10 
X-CRM114-Status: GOOD (  15.78  )
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

Hello,

> The original PCIE_FTS_NUM_L0(x) macro was buggy due to improper operator
> precedence, where ((x) & 0xff << 8) was evaluated as ((x) & 0xff00).
> 
> Instead of just fixing the parentheses, use the standard FIELD_PREP()
> macro. This makes the code more robust by automatically handling masks
> and shifts, while also adding compile-time type and range checking to
> ensure the value fits within PCIE_FTS_NUM_MASK.
> 
> Fixes: 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller support")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 7572252..00f0e29 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -61,7 +61,7 @@
>  /* MediaTek specific configuration registers */
>  #define PCIE_FTS_NUM		0x70c
>  #define PCIE_FTS_NUM_MASK	GENMASK(15, 8)
> -#define PCIE_FTS_NUM_L0(x)	((x) & 0xff << 8)
> +#define PCIE_FTS_NUM_L0(x)	FIELD_PREP(PCIE_FTS_NUM_MASK, x)

Aww.  Nice catch!  Thank you for fixing this!

Happy to offer:

  Reviewed-by: Krzysztof Wilczyński <kwilczynski@kernel.org>

All the best,

	Krzysztof

