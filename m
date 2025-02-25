Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DDEC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyvddXJudmim1yoVeF2sZBvah7MinIT5ZBHD+XI91UM=; b=2momcypK8pSKaBQPbmj2DNHWgd
	JTgCN6w7Yj4LISyiCruhAznVZTlm8iiT4bhFOgV71r3Pg+PXjMsNVNLcIsYYiJVtsHoXs9E2S/9DW
	wehepZhE4QtNn9gRyXgpKhHy9nEcXSmcOWilbt264yABD62duJZtpujdWpelXJV3PYt2LyPo7pH/z
	PC/++Ru7X0yb+XEfWFMCOxOstV6PFH5Cqjw4Y4kFajqZXqMc4Rq0qrN2hs1ZfmXA039YjznzAm943
	nE+9DWFIlvvde3/UJpxzgc7fo+zh6DxezP6Sfblm9BeIm4g8zteWe1V/lrBjDNqM+mvPzTFsTe1kf
	TYpxVFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrCz-0000000GaM7-0g2a;
	Tue, 25 Feb 2025 09:26:33 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqo2-0000000GUZe-29m1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 09:00:48 +0000
Message-ID: <9cf9c128-9f66-488c-bd43-3f1752ec4eaa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740474041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YyvddXJudmim1yoVeF2sZBvah7MinIT5ZBHD+XI91UM=;
	b=B6wq9Mq3uylr8OfT/MoCcqJNqcVngx4TPD6UK0+RB4M0sFWDXL91l5ukvrfU6ywvlsS3ml
	4qvMg0EmJFYFbI40yubALIDts/0glf0WXptuRXkY5cLq9ITuCrPkKo6uc9rNTFW00PilKj
	b0A+ABQ+npLY2eBgHx6CdEK+gsDCmcw=
Date: Tue, 25 Feb 2025 17:00:29 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 1/4] stmmac: loongson: Pass correct arg to PCI
 function
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
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250224135321.36603-2-phasta@kernel.org>
 <20250224135321.36603-3-phasta@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250224135321.36603-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010046_975286_BA9E5446 
X-CRM114-Status: GOOD (  16.89  )
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
> pcim_iomap_regions() should receive the driver's name as its third
> parameter, not the PCI device's name.
>
> Define the driver name with a macro and use it at the appropriate
> places, including pcim_iomap_regions().
>
> Cc: stable@vger.kernel.org # v5.14+
> Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index bfe6e2d631bd..73a6715a93e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -11,6 +11,8 @@
>   #include "dwmac_dma.h"
>   #include "dwmac1000.h"
>   
> +#define DRIVER_NAME "dwmac-loongson-pci"
> +
>   /* Normal Loongson Tx Summary */
>   #define DMA_INTR_ENA_NIE_TX_LOONGSON	0x00040000
>   /* Normal Loongson Rx Summary */
> @@ -555,7 +557,7 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>   	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
>   		if (pci_resource_len(pdev, i) == 0)
>   			continue;
> -		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> +		ret = pcim_iomap_regions(pdev, BIT(0), DRIVER_NAME);
>   		if (ret)
>   			goto err_disable_device;
>   		break;
> @@ -673,7 +675,7 @@ static const struct pci_device_id loongson_dwmac_id_table[] = {
>   MODULE_DEVICE_TABLE(pci, loongson_dwmac_id_table);
>   
>   static struct pci_driver loongson_dwmac_driver = {
> -	.name = "dwmac-loongson-pci",
> +	.name = DRIVER_NAME,
>   	.id_table = loongson_dwmac_id_table,
>   	.probe = loongson_dwmac_probe,
>   	.remove = loongson_dwmac_remove,

