Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE7C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVepUB8wNc5o/qy4cZIKZFKgWZyZswKdukCpSAPj37g=; b=cVRBc9lCf2UxuGMTIb7w6tWXd9
	NFxq/JfLeOIFzLkBqPdOJVPD8wff208v7aV8l/pzRGp1Lo35ZBqfG4dUascsTwog8boNaEy3+WtT5
	MnBBO9MtcDonKXU4AMeTE20jSB8gHs1XAb8FgkdVKrFlBpAfTHJkPU2tEftQon/yjexQpWmW+P/Zf
	nRWfCRqMEI75h+E1QkXDwE/ea1qhffW7slr1izWLNRm/Hk8tjffskHUAsRv4x4u1z/cLt8xPdg6dk
	ek+e6mNcYr46gki0qqF+Vwn/TGh48owuAvmBmgaRMlwIbprYQq8ckg63k2CpuJ2iHiPEhuy0eu7IY
	jknRmqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tac5H-0000000AUKu-17sd;
	Wed, 22 Jan 2025 14:51:59 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tac3y-0000000AUG2-3j5e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 14:50:40 +0000
Message-ID: <b812d344-d507-479b-a086-5a36cb6e27a3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737557436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVepUB8wNc5o/qy4cZIKZFKgWZyZswKdukCpSAPj37g=;
	b=Ej19VAxcsUvhezxaX0uloN/wcxKKvTXMdPAgfW0IZxhMKvFKxJ6Mnd/U8AZnGMjco7aKLf
	JaC7flAnQsDhg0jT2fF2q9CpeacgMbidm0iPsifRsP0b1+Z3m/zZcRq2QEtOqLK+6mEUIE
	vFzECwFVDwfojEio8AC6gWoY8ZMaUTU=
Date: Wed, 22 Jan 2025 22:49:41 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: dwmac-loongson: Set correct
 {tx,rx}_fifo_size
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Chong Qiao <qiaochong@loongson.cn>, linux-arm-kernel@lists.infradead.org,
 fancer.lancer@gmail.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250121093703.2660482-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250121093703.2660482-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_065039_217333_6799351E 
X-CRM114-Status: GOOD (  12.72  )
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

在 1/21/25 17:37, Huacai Chen 写道:
> Now for dwmac-loongson {tx,rx}_fifo_size are uninitialised, which means
> zero. This means dwmac-loongson doesn't support changing MTU, so set the
> correct tx_fifo_size and rx_fifo_size for it (16KB multiplied by channel
> counts).
> 
> Note: the Fixes tag is not exactly right, but it is a key commit of the
> dwmac-loongson series.
> 
> Cc: stable@vger.kernel.org
> Fixes: ad72f783de06827a1f ("net: stmmac: Add multi-channel support")
> Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Acked-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index bfe6e2d631bd..79acdf38c525 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -574,6 +574,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>   	if (ret)
>   		goto err_disable_device;
>   
> +	plat->tx_fifo_size = SZ_16K * plat->tx_queues_to_use;
> +	plat->rx_fifo_size = SZ_16K * plat->rx_queues_to_use;
> +
>   	if (dev_of_node(&pdev->dev))
>   		ret = loongson_dwmac_dt_config(pdev, plat, &res);
>   	else


