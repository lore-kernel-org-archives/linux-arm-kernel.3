Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511A8C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 02:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JqdjXDM88sRcfHs8bACHsX2p5kwYZxIV4OvMQywdYw=; b=xPqhuGPWet/b8ppRAeiI6/IO58
	jaYOFoAvo+2iVDRgZ/LtwikKfuBwq6wSpcol5yjeGONxdY0R/GIlSVjPELsrMlN9vJCZLqRiRtkPX
	V8T6QWKNaFsvAZ2M/Fdal9IjdCPkOyAIKNqSDD5ewXVcSrNNvboFXAtx+uGCabT43kQtnP5ckPSle
	ZkFHg+t3dTPFBYf7uV25tlmtmLPxi1OGdO5DSu2nSaVIH1i7eDIAQebPG5yeyjc6Whebvt4PnmXXZ
	ai/ek2JiBxgyV1HrnCIyqTZzZ5IQ4pfmnvs20v3pHjyScCSxIBP/pLVdEbix4RWCMfPw5W7KYHFoz
	LzH/x83w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlIOE-00000003n5x-1Nuz;
	Fri, 21 Feb 2025 02:03:42 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlIMi-00000003moL-1cRL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 02:02:10 +0000
Message-ID: <a4e790d1-b849-415f-b2f9-66cf162204e2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740103320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JqdjXDM88sRcfHs8bACHsX2p5kwYZxIV4OvMQywdYw=;
	b=nKTK4z9LxrUw60XZ3wf06j5YoddDQVU6IzWrRl5iiQdRSE8N1tUTAEgpjJNXsrzPA4M6WZ
	xddSJYH5MKzpDexbsRKxymLNDoG4pRfp6Nl1k+ZvxupNNRDWM5JuoeRo4HqqiuAEoKCoJ7
	pYFlosba7/q9E75gZnFnpOWBbKXKwEw=
Date: Fri, 21 Feb 2025 10:01:50 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] stmmac: Replace deprecated PCI functions
To: Philipp Stanner <phasta@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Huacai Chen <chenhuacai@kernel.org>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Qunqin Zhao
 <zhaoqunqin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Philipp Stanner <pstanner@redhat.com>
References: <20250218132120.124038-2-phasta@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250218132120.124038-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_180208_858536_6575C41D 
X-CRM114-Status: GOOD (  29.31  )
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


在 2/18/25 9:21 PM, Philipp Stanner 写道:
> From: Philipp Stanner <pstanner@redhat.com>
>
> The PCI functions
>    - pcim_iomap_regions()
>    - pcim_iomap_table() and
>    - pcim_iounmap_regions()
> have been deprecated.
>
> The usage of pcim_* cleanup functions in the driver detach path (remove
> callback) is actually not necessary, since they perform that cleanup
> automatically.
>
> Furthermore, loongson_dwmac_probe() contains a surplus loop. That loop
> does not use index i in pcim_iomap_regions(), but costantly attempts to
> request and ioremap BAR 0. This would actually fail (since you cannot
> request the same BAR more than once), but presumably never fails because
> the preceding length check detects that all BARs except for 0 do not
> exist.

> Replace them with pcim_iomap_region(). Remove the surplus loop.

So, two things are done in one patch. How about splitting it into two 
patches?


>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> Changes in v2:
>    - Fix build errors because of missing ';'
>    - Address in the commit message why the patch removes a loop. (Andrew)
> ---
>   .../ethernet/stmicro/stmmac/dwmac-loongson.c  | 31 ++++++-------------
>   .../net/ethernet/stmicro/stmmac/stmmac_pci.c  | 24 ++++----------
>   2 files changed, 15 insertions(+), 40 deletions(-)

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index bfe6e2d631bd..6f7c479c1a51 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -11,6 +11,8 @@
>   #include "dwmac_dma.h"
>   #include "dwmac1000.h"
>   
> +#define DRIVER_NAME "dwmac-loongson-pci"

This appears to have nothing to do with the commit message.

I believe it would be better if it were split off and made into

an independent patch.

> +
>   /* Normal Loongson Tx Summary */
>   #define DMA_INTR_ENA_NIE_TX_LOONGSON	0x00040000
>   /* Normal Loongson Rx Summary */
> @@ -520,9 +522,9 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>   {
>   	struct plat_stmmacenet_data *plat;
>   	struct stmmac_pci_info *info;
> -	struct stmmac_resources res;
> +	struct stmmac_resources res = {};
>   	struct loongson_data *ld;
> -	int ret, i;
> +	int ret;
>   
>   	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
>   	if (!plat)
> @@ -552,17 +554,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>   	pci_set_master(pdev);
>   
>   	/* Get the base address of device */
> -	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
> -		if (pci_resource_len(pdev, i) == 0)
> -			continue;
> -		ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
> -		if (ret)
> -			goto err_disable_device;
> -		break;
> -	}
> -
> -	memset(&res, 0, sizeof(res));
> -	res.addr = pcim_iomap_table(pdev)[0];
> +	res.addr = pcim_iomap_region(pdev, 0, DRIVER_NAME);
> +	ret = PTR_ERR_OR_ZERO(res.addr);
> +	if (ret)
> +		goto err_disable_device;
>   
>   	plat->bsp_priv = ld;
>   	plat->setup = loongson_dwmac_setup;

According to the description in the commit message, the reason for

remove the surplus loop here is to fix the problem of requesting

the same BAR multiple times, that's good.

> @@ -606,7 +601,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
>   	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
>   	struct stmmac_priv *priv = netdev_priv(ndev);
>   	struct loongson_data *ld;
> -	int i;
>   
>   	ld = priv->plat->bsp_priv;
>   	stmmac_dvr_remove(&pdev->dev);
> @@ -617,13 +611,6 @@ static void loongson_dwmac_remove(struct pci_dev *pdev)
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

According to the commit message, the reason for removing the surplus

loop here is that there's no need to use the pcim_* cleanup functions in

the `remove()` function. This is different from the modifications in the

`probe()` function. I think it can be split out and made into a separate

patch.


How about splitting it like this?

Patch 1/3: Use the `DRIVER_NAME` macro.

Patch 2/3: remove the surplus loop to fix the problem of requesting the 
same BAR multiple times

Patch 3/3: remove the surplus pcim_* cleanup functions in the `remove()` 
function


Huacai, Qunqin, Would you mind helping to test it?


Thanks,

Yanteng


