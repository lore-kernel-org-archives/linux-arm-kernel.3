Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE48C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqgZX36tq3stw7WUYgCHB9nJa4XRCAPBMvSex21T0K4=; b=ofbWNe2rN547CxSGaVxPSW5GuB
	N2HfKqcUFF8Ir5neykqnVlJchVyhKFtGT+WmYIicQcYyjcI6ZyLFGcciDubPmbIUFMBB505meZJ6v
	DNlGNkFWUkOva/mO9pkCr+YEZDH7jNQKjGi5nyZo8O1lNBOLnVmx4GMdwXZGrUTYCxDTi3vAY8Vo2
	1idfBO7u30h2fCiqghITT5mgGBNPh6nyAlqVpUfjp4xAGnbgK2wtj5RZdkQUrskrTTw88RcSRmRA5
	zTk4H+V+4CHAC6PrU/3DrgNZhRi4ArkR6uLXOjEOP39va0dFLT+8ADhpy4b1ZBPFgQahKCdal1284
	HbmECXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvu1M-00000005qzV-3ZI7;
	Mon, 17 Aug 2026 09:52:44 +0000
Received: from out-105.mta1.migadu.com ([2001:41d0:203:375::69] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvu1J-00000005qyO-47p4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 09:52:43 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1ja/V7nTbqqmXtS7BPIrWfg4KU9kF4ez22A8VfBaMI8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786960357; v=1; x=1787565157;
 b=rNBIXpmLrBTjiANagf23NRgfs9kWm35rmmTr4Ow8pICWezRCNVk6uU3+YuBcZuGHVxjZS4uX
 y3cfo2iEVK9dgR4U9AoDc6bRQlqvNnrl6+LRwk4l3oSdnHhAV/nHmcTNLxegh7rzLsxj5v+IRFe
 mbDpEoDaZb892vReEfpyLAHg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from [IPV6:2408:820c:270a:b561:544d:9f6f:ea74:16a5] (2a14:7586:6109:1::198)
	by smtp.migadu.com with ESMTPS id 051eb70d1ed59f2d;
	Mon, 17 Aug 2026 09:52:37 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <29a29de8-ce58-40d5-9161-5ac36b7368c1@linux.dev>
Date: Mon, 17 Aug 2026 17:52:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Daniel Pawlik <pawlik.dan@gmail.com>, netdev@vger.kernel.org
Cc: lorenzo@kernel.org, win847@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260817090601.1256389-1-pawlik.dan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_025242_298668_1C521BB5 
X-CRM114-Status: GOOD (  18.14  )
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

On 2026/8/17 17:06, Daniel Pawlik wrote:
> On EN7581 + MT7996 (Gemtek W1700K), mapping small caller buffers with
> DMA_BIDIRECTIONAL regresses NPU version probe: the mailbox completes
> successfully but WLAN_FUNC_GET_WAIT_NPU_VERSION reads as 0.0 instead of
> 0.1111.
>
> Allocate at least SMP_CACHE_BYTES for each mailbox payload and map
> ALIGN(len, SMP_CACHE_BYTES) with DMA_BIDIRECTIONAL while programming
> the original payload length into the mailbox length register.
>
> Tested on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996), kernel
> 6.18.44, including two cold reboots and sustained WiFi use.
>
> Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260814110017.2795022-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260809152813.585797-1-pawlik.dan@gmail.com/
> Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
> Assisted-by: Cursor:composer-2
> Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
> ---
>   drivers/net/ethernet/airoha/airoha_npu.c | 25 +++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
>
> --
> 2.55.0
>
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
> index b679bed952de..d560b8763753 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -5,6 +5,7 @@
>    */
>
>   #include <linux/devcoredump.h>
> +#include <linux/dma-mapping.h>
>   #include <linux/firmware.h>
>   #include <linux/platform_device.h>
>   #include <linux/of_net.h>
> @@ -160,15 +161,21 @@ struct wlan_mbox_data {
>   	DECLARE_FLEX_ARRAY(u8, d);
>   };
>
> +static size_t airoha_npu_mbox_size(size_t len)
> +{
> +	return ALIGN(max(len, SMP_CACHE_BYTES), SMP_CACHE_BYTES);

SMP_CACHE_BYTES defaults to L1_CACHE_BYTES on Aarch64. On Cortex-A53 
this is fine, but some CPU's L2 cache line size might differ. For 
portability, please use dma_get_cache_alignment() instead.

Also "max" is redundant.

> +}
> +
>   static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
>   			       void *p, int size)
>   {
>   	u16 core = 0; /* FIXME */
>   	u32 val, offset = core << 4;
>   	dma_addr_t dma_addr;
> +	size_t map_len = airoha_npu_mbox_size(size);
>   	int ret;
>
> -	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
> +	dma_addr = dma_map_single(npu->dev, p, map_len, DMA_BIDIRECTIONAL);
You don't have to align the size passed to DMA API. The underlying 
implementation already aligns it.
>   	ret = dma_mapping_error(npu->dev, dma_addr);
>   	if (ret)
>   		return ret;
> @@ -191,7 +198,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
>
>   	spin_unlock_bh(&npu->cores[core].lock);
>
> -	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
> +	dma_unmap_single(npu->dev, dma_addr, map_len, DMA_BIDIRECTIONAL);
>
>   	return ret;
>   }

Best regards,

Qingfang


