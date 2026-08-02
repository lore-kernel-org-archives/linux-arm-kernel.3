Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BA4C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 08:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKnaB2dgGbJ5jB9Xzqclr9jITWfqjGY6bJtLu77qqnc=; b=vhhvAeWkz8de7FoTXlyEX4Z8ER
	FCcGCDZoxdMH0xu02hENanz5jYKngzRjK7oB8tEzo0v5p5cscLtQwiIrr88Y/ajYC+6L3Z9rTOrk1
	1RUElfYrCjuLmlw1DnoGvzX5KOoAOF7JfPTt/B0TDsttYXBOd8K3k6DB33txvw/AExqne5pje1qtg
	nUoZ6QNL8NkX3UnwqOyQaEKSAb2BQzIISXsAx9/ziqZa76q8KBUxE3i0lV/WgmS4KvA36GsZzgYDi
	M5jjVXbkKgkS3YdgmmZrnJR2MA5mYsUEOELuYeLjGUCy9XUX01F2B3Im799xdm/1Lo6WMF2Sre49X
	U8fVqWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqRy3-0000000FUnt-15qP;
	Sun, 02 Aug 2026 08:54:47 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqRxz-0000000FUnH-3Gp0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 08:54:46 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 6BFD2EC0179;
	Sun,  2 Aug 2026 04:54:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 02 Aug 2026 04:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785660880; x=1785747280; bh=gKnaB2dgGb
	J5jB9Xzqclr9jITWfqjGY6bJtLu77qqnc=; b=Fw1gnukaBRsrcTW3cxsRi2amJD
	d3GFcnfZ7Nvsb+22c2QSRdV8Z24aZB1RENV5xCAiJbmmIr86rM23ndfQnoL4GTu+
	v1G3YDjRJ8fMN+LCQXl5Hd3s0ngOOjEs27ocWWGmLAKWn3w80cqSazX+5f+5aPYw
	IIEqFr7oqVze0pWDVoKxsSKoaWG8fh17lJ7nuQR/eKqj8VKR+dvskrZXZJQDtiQN
	K6HLHtVCZTETb+1NtqTD+fQNGRGfON+UaILntg+EBf8hs9nAWFGR1qRoDr1UjC/b
	WTOjmYG6eVZxaVLurzqqbxAe/nbc3Xvr3Y3MisanFBN6bge0hkW+2w4aLUPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785660880; x=1785747280; bh=gKnaB2dgGbJ5jB9Xzqclr9jITWfqjGY6bJt
	Lu77qqnc=; b=P/GIfVBpg20l/U0WCJx9Bxxd2EgVIYPdHxxP/qqf8fRJ4JeqboQ
	2zkMBgFkZWqhwqaY7W5gws94zPdyFpDS8skKKLIaRIfmO7yuLrMAa6cIk4No261q
	izWwcqghLE4hBFkh9mrXQfVkPKNUt91oZ2e75z94gi0DshnUx5LzNuHwcoLX+3Qd
	KIRVddRQ8BMS8mNQ0Yy8lfJioGD0chMG5eELPne8oDKflg2VAq4P7VOt+B+eCPiC
	qweE+Hqg3WFvRqjcPnRB9toYwGvb5gXf4b7LkTSe0t5gz467AKKGPHNJX+1qAMwh
	cDRrCnzZRCLch4ktFFBDRkMZMHSQXUTR49A==
X-ME-Sender: <xms:zwVvapF1AnkQpn43vRVWKZMJJM07o5oMtQCs8EpYNU9L871B_u8iVg>
    <xme:zwVvajic2AvG2rqELf6UO6qEcqG78nI69Qc7QRGFTgM2umKSRLPrwKeSa4ZG46NEc
    Whah2r5FoCebZPyZgccGy76HRa4pyrhFrv5HGpjxgZjP4dl37-VYw>
X-ME-Received: <xmr:zwVvauhbn1pEHyRxGnGjrfgR0Y2FydPrLOC_OP19Z-ciEihpYV0KsGFgBVzUaZFtcuQiTgQpvK5nf1WLxMSoCMs-t9LX2zdzhNQ>
X-ME-Proxy-Cause: dmFkZTG1UE0N2DlUNxsWY7EVfblw8xV1Uq53IGZDVc5JfJgYvhuiA4K+Wbd9VzYSvAY4H2
    ZdlRzurNW+y/PNikHFY+9wr9wz95bHx/8tG0mlHcYx9HhDhB0h0OEMF2NWcKgE+63h932Z
    g+FwQvLym/t/+tZaThPh0W/+vydnAL15XYn3Xoj7KugiCjjw822xnY2dr8pLuU8GzIc0N1
    YA9AQ/SUUDMes4tmHsDJzp/3+DKKO6017of3tv9XnPRqmaVw4tbwSbh3txUvzVID3LCin5
    hDXyqDoDo+F5qtLhYWjNSc+QFqwBvA+j1E8UC1ulSvHSa9SqhmFTiU7VGYUTpVdVZiwgFa
    dpmM6bZbotYpMaRO8FLKeXAuxe3f4034tOA+lbqBLKVpL3EINQbrDA6zzkcbdsMUs5XeBw
    rlrD/RUTTCFhRpiCf2Q3UC8bwhjMQEL0jRFYeafYzTENDec4jWP+tKSq4KJXNcDhj+s0ps
    dgfsCuFwEKhiiT2zRsLnwIVtJhVijDHWC9mpBHc0Zw4mHm/2yxNmb3ZlzZCraVnuDl7jX9
    jZAnQ+uL8kFph6+EYJLFoWMPVaE657uHERvA4ddjhIa6GLN+ZAcksSfsQglGJvQiFLUbhr
    yxVMBEdarPT2s5tdYvpL5IauJemfnyqe9IN13nmi3oC9FjP8v/YRGtp0znCQ
X-ME-Proxy: <xmx:zwVvaunQakql0sbJwooUmiUbF6KHfsaYOnVmfxX88lYoqQO5pYm49A>
    <xmx:zwVvaqbccy7LKxUq3IrOKJC35xpWwvGgh0vBuON7fcU-H2Dolj51vg>
    <xmx:zwVvapyWen3RLprAYXYAjgu1IxYiRTZshBQ_MYq0s_hFjHceDxwsJA>
    <xmx:zwVvapbZDfNtiICrSXo2b7ISE555IhY-J4Oof357S8xnBwtqju_-LQ>
    <xmx:0AVvai6DjE2d69OFh2Z0nXIiNf82eh9zV5qiuWwoSh5bHYCqao-OmQ9W>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 04:54:39 -0400 (EDT)
Date: Sun, 2 Aug 2026 10:54:37 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dmaengine: apple-admac: Add M3 generation ADMACs
Message-ID: <20260802085437.GA806854@robin.jannau.net>
References: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
 <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729-t603x-admac-v2-2-e4b2bb6ca45e@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_015444_372180_427EE95D 
X-CRM114-Status: GOOD (  18.58  )
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

On Wed, Jul 29, 2026 at 01:46:35PM +0200, Sasha Finkelstein wrote:
> The admacs present on t8122 and t603x SoCs need additional writes in
> order to operate correctly. The exact purpose of this register
> is unknown
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/dma/apple-admac.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 14a5ee14a481..72ff677c8ce5 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -39,10 +39,14 @@
>  
>  #define FLAG_DESC_NOTIFY	BIT(16)
>  
> +#define T8122_UNK_28_VAL	0x200000

maybe BIT(21)

>  #define REG_TX_START		0x0000
>  #define REG_TX_STOP		0x0004
>  #define REG_RX_START		0x0008
>  #define REG_RX_STOP		0x000c
> +#define REG_UNK_28		0x0028
> +#define REG_UNK_2C		0x002c
>  #define REG_IMPRINT		0x0090
>  #define REG_TX_SRAM_SIZE	0x0094
>  #define REG_RX_SRAM_SIZE	0x0098
> @@ -127,6 +131,7 @@ struct admac_data {
>  	struct mutex cache_alloc_lock;
>  	struct admac_sram txcache, rxcache;
>  
> +	bool set_unk28;
>  	int irq;
>  	int irq_index;
>  	int nchannels;
> @@ -147,6 +152,10 @@ struct admac_tx {
>  	struct list_head node;
>  };
>  
> +struct admac_hw {
> +	bool set_unk28;
> +};
> +
>  static int admac_alloc_sram_carveout(struct admac_data *ad,
>  				     enum dma_transfer_direction dir,
>  				     u32 *out)
> @@ -747,6 +756,11 @@ static int admac_device_config(struct dma_chan *chan,
>  	u32 bus_width = readl_relaxed(ad->base + REG_BUS_WIDTH(adchan->no)) &
>  		~(BUS_WIDTH_WORD_SIZE | BUS_WIDTH_FRAME_SIZE);
>  
> +	if (ad->set_unk28) {
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_28);
> +		writel_relaxed(T8122_UNK_28_VAL, ad->base + REG_UNK_2C);
> +	}

can this be done in probe? This writes the same value for every channel
without obvious way how the bit in those two registers can reset? If it
needs to be done here a comment explaining why would be useful.

If it can be done in probe we could avoid putting set_unk28 into struct
admac_data.

Janne

