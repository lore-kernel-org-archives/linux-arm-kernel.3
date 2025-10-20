Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B6FCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxdKLquGDy40MTK1OxxcobkJRKlQRkZ2NfGTEbx+iDA=; b=fkU/zAF7MHsmduRPHAjs0xtpOw
	Ut6i5aM6SDtX3sjvsjd2MEXsokJNHLvxX6OeNRFe5i5Lxe3ol+ePOQt+nRaWau1n8VWVnllxQVbdm
	z4BUAaLYiEUEmv1aFQaqtq3e8w0/b96/MkuBGyWTdSUMS4FB6TJ9qBn91JuSj4EkfkdCpFaPsWka1
	Njgo0p+OYaXg7UK+7XPDyTkP469/vA2x4yl1AJ1F9xUppkCjpIaXtgwzXap+v+Fx9Tf5CE9t7R+m4
	/XN7Gyn9JPwjdRO8XXokhFLCWQJftcHaX+DrFe8dHabMAfaaUySeHuGtST7kSshrGkcZmEIodMzA3
	kd3sksGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmlO-0000000CjKd-1ewl;
	Mon, 20 Oct 2025 10:05:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAml2-0000000CiyW-2kw7;
	Mon, 20 Oct 2025 10:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954690;
	bh=wvumRtQ3KWxNLuSCqqYpTqD88kqpmy34MP/x6Tf0kEs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ms6CiYVST6M90q1cs07+V3lOwJ1cYQQ8Sk+nWwbFl6Gal5W+CbF3WAItwDCo9+v0K
	 SJ2wLYvWHDYLLB1RcKLmLbuDEA8CRrIBA++yJLxn9NXhnr1hEvCBIw9UE3tu4apvlQ
	 jKhC93BuucPPIN4WzrEuv/YOwjDjIIAAkG7VKi5/BhXv44Ak8Mxg1rx0oRswc0Y6Jf
	 QNpQeOBSlsCOp3zw5joRiHZ4jQULcKjOShxWQs98L4oGM1XO2Dz1hIOqqRZnIDDWmz
	 y7G4Hsi9cDZo52cZRL52ZaHWuIv2ba9fdo/N5E1dOW3z7NyJbTdWCJKE2EHEAx/CNY
	 ukiXDPayF6FSQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB73617E108C;
	Mon, 20 Oct 2025 12:04:49 +0200 (CEST)
Message-ID: <24b74989-4e31-49e3-8652-c2439f368b26@collabora.com>
Date: Mon, 20 Oct 2025 12:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/20] soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write
 API for SoCs without subsys ID
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-11-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030452_885443_CEC81E2B 
X-CRM114-Status: GOOD (  16.96  )
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

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> This patch extends the cmdq_pkt_write API to support SoCs that do not
> have subsys ID mapping by introducing new register write APIs:
> - cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() replace
>    cmdq_pkt_write()
> - cmdq_pkt_write_mask_pa() and cmdq_pkt_write_mask_subsys() replace
>    cmdq_pkt_write_mask()
> 
> To ensure consistent function pointer interfaces, both
> cmdq_pkt_write_pa() and cmdq_pkt_write_subsys() provide subsys and
> pa_base parameters. This unifies how register writes are invoked,
> regardless of whether subsys ID is supported by the device.
> 
> All GCEs support writing registers by PA (with mask) without subsys,
> but this requires extra GCE instructions to convert the PA into a GCE
> readable format, reducing performance compared to using subsys directly.
> Therefore, subsys is preferred for register writes when available.
> 
> API documentation and function pointer declarations in cmdq_client_reg
> have been updated. The original write APIs will be removed after all
> CMDQ users transition to the new interfaces.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 54 +++++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  | 83 ++++++++++++++++++++++++++
>   2 files changed, 137 insertions(+)
> 

> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 154d0511a0ad..f6dc43c036bd 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -57,6 +57,10 @@ struct cmdq_client_reg {
>   	phys_addr_t pa_base;
>   	u16 offset;
>   	u16 size;
> +	int (*reg_write)(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
> +			 u16 offset, u32 value);

(*pkt_write)

> +	int (*reg_write_mask)(struct cmdq_pkt *pkt, u8 subsys, u32 pa_base,
> +			      u16 offset, u32 value, u32 mask);

(*pkt_write_mask)

those names make a lot more sense.

After applying the requested changes,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   };

