Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2348C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+uneR/mJS3GnAKzOPOj3taPV7XZaDcHgKVZzaJi0fo=; b=xMSxapjl1MHypfBkUT3v9yZhdx
	zqw1XI1vUrfluqF7PkBBBJmk1+NQykStBeioqPXp0srGj4FnwNEBlPHgA4ytkbPC18S/4BG73eKCq
	5kW+wvY3l6d2TSVeMfWqreiaXZ/UkqTFyMYXirhUOmnrBvgtHskYilHP4TcJk8FZGKSFnM2raf0k+
	TFMqW5MwcsTOn6qExCM7uxz9TtYSgyN/0fn/zJfIJsD56sZLdijHBXDg4P5gkHc3U4ubdJZoHFQ+L
	bOIlB2yjcT3pgHcTnIoa9gzWH9sLoNBSY9pYreImK9oXTljZtCm+sh2+FLe3tlhH3gBzyDh+fGfAX
	S04bKVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrUS-0000000GfLV-1pPb;
	Tue, 25 Feb 2025 09:44:36 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqy5-0000000GWpN-1pxU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:11:10 +0000
Message-ID: <425215fb-8fb5-4412-87e7-1d29c4ac0b7f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740474667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+uneR/mJS3GnAKzOPOj3taPV7XZaDcHgKVZzaJi0fo=;
	b=DDefn0rw48FmnpU4dE1uzQN58xOKblryXKII2hPkQlzaPz9m/h8jhLz7SHxlkpRBfpxqtO
	zqlhWACWT2n6KotMuGTBKZH/4KDxrB1BeTioPMtSI5wvaY4aXn8wOp8uFvSG3FE52bafWy
	gbI0sciBbXJFt9Pdp4DL92u1CiJP6VA=
Date: Tue, 25 Feb 2025 17:10:58 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 3/4] stmmac: Remove pcim_* functions for
 driver detach
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Philipp Stanner
 <pstanner@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Qing Zhang <zhangqing@loongson.cn>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-5-phasta@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250224135321.36603-5-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_011109_682253_71A3315E 
X-CRM114-Status: GOOD (  17.11  )
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


在 2/24/25 9:53 PM, Philipp Stanner 写道:
> Functions prefixed with "pcim_" are managed devres functions which
> perform automatic cleanup once the driver unloads. It is, thus, not
> necessary to call any cleanup functions in remove() callbacks.
>
> Remove the pcim_ cleanup function calls in the remove() callbacks.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  7 -------
>   drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c     | 10 ----------
>   2 files changed, 17 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index e3cacd085b3f..f3ea6016be68 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -614,13 +614,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
>   	if (ld->loongson_id == DWMAC_CORE_LS_MULTICHAN)
>   		loongson_dwmac_msi_clear(pdev);
>   
> -	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -		if (pci_resource_len(pdev, i) == 0)
> -			continue;
> -		pcim_iounmap_regions(pdev, BIT(i));
> -		break;
> -	}
> -
>   	pci_disable_device(pdev);
>   }
>   
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> index 352b01678c22..91ff6c15f977 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
> @@ -227,20 +227,10 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
>    *
>    * @pdev: platform device pointer

>    * Description: this function calls the main to free the net resources

There is a missing full stop. You commented on the next email,

and it seems that you are already preparing for v4.  With this


Reviewed-by: Yanteng Si <si.yanteng@linux.dev>

Thanks,
Yanteng

> - * and releases the PCI resources.
>    */
>   static void stmmac_pci_remove(struct pci_dev *pdev)
>   {
> -	int i;
> -
>   	stmmac_dvr_remove(&pdev->dev);
> -
> -	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -		if (pci_resource_len(pdev, i) == 0)
> -			continue;
> -		pcim_iounmap_regions(pdev, BIT(i));
> -		break;
> -	}
>   }
>   
>   static int __maybe_unused stmmac_pci_suspend(struct device *dev)

