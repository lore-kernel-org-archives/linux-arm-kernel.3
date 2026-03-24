Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B8FF54AD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+QAOWGvbep1Tnu9V/+K+Lu30vG9XZkA8aIFGgqFC18=; b=gcyslQ5MDURQKJn/p36N/pb6nw
	seqaKMvmVnBDEv1Y6qg17sAdtyS4sEiEjGT22VKFYF7axor8eBUvw2b8rKTta1eGwfwkFRfiRfBUe
	NVN0qagTJeMmjTkp0pk+dFYMXDIFj0sa0nk9a84MNalRfxz8TrcjgeYxYFa/QUegu2m9FNbIIbRCL
	DNbuiNsI6Xj11Kv1MvvP4fT6WT04SOiuox7e9TYI74H/cCtfvPWod3EKbCv1Rj7uJIDUzdECxFw+0
	Qdizun9TR6PHPkInUYKTVN1H70zFkImsphx06W5habev8OKiWA2NgHg6bJkP486mNFn25Jz6a90r8
	zV3Ojgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54KJ-00000001r0c-36lz;
	Tue, 24 Mar 2026 16:09:55 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54KG-00000001qvs-3q2v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 16:09:54 +0000
Message-ID: <2e5451ee-e185-4824-a5a3-99e65e789a06@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774368561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+QAOWGvbep1Tnu9V/+K+Lu30vG9XZkA8aIFGgqFC18=;
	b=Jt6wfH+hwscFwKQnj9JuCykDau/QyXvDs+W5bhpVZlAXcndZ45osSwi/YVAp/gU1Twiv/6
	hvA+7U6Yj9GRUq+tv0PcfNkYP34yGL2lnn2BW8TndFRfZeOXjFKdxm+ZB4Gsb8hf9vfdFN
	bIADTxvTRtZ3Cngx1UL1B0LgGELolnY=
Date: Tue, 24 Mar 2026 12:09:07 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net 1/2] net: xilinx: axienet: Correct BD length masks to
 match AXIDMA IP spec
To: Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, michal.simek@amd.com, radhey.shyam.pandey@amd.com,
 horms@kernel.org
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harini.katakam@amd.com
References: <20260324145353.1899248-1-suraj.gupta2@amd.com>
 <20260324145353.1899248-2-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260324145353.1899248-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_090953_103927_5FB09DE1 
X-CRM114-Status: GOOD (  14.88  )
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

On 3/24/26 10:53, Suraj Gupta wrote:
> The XAXIDMA_BD_CTRL_LENGTH_MASK and XAXIDMA_BD_STS_ACTUAL_LEN_MASK
> macros were defined as 0x007FFFFF (23 bits), but the AXI DMA IP
> product guide (PG021) specifies the buffer length field as bits 25:0
> (26 bits). Update both masks to 0x03FFFFFF to match the IP
> documentation.
> 
> In practice this had no functional impact, since Ethernet frames are
> far smaller than 2^23 bytes and the extra bits were always zero, but
> the masks should still reflect the hardware specification.
> 
> Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
>  drivers/net/ethernet/xilinx/xilinx_axienet.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> index 5ff742103beb..602389843342 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> @@ -105,7 +105,7 @@
>  #define XAXIDMA_BD_HAS_DRE_MASK		0xF00 /* Whether has DRE mask */
>  #define XAXIDMA_BD_WORDLEN_MASK		0xFF /* Whether has DRE mask */
>  
> -#define XAXIDMA_BD_CTRL_LENGTH_MASK	0x007FFFFF /* Requested len */
> +#define XAXIDMA_BD_CTRL_LENGTH_MASK	0x03FFFFFF /* Requested len */
>  #define XAXIDMA_BD_CTRL_TXSOF_MASK	0x08000000 /* First tx packet */
>  #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
>  #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
> @@ -130,7 +130,7 @@
>  #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
>  #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
>  
> -#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK	0x007FFFFF /* Actual len */
> +#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK	0x03FFFFFF /* Actual len */

I think

#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK GENMASK(25, 0)

is clearer.

>  #define XAXIDMA_BD_STS_COMPLETE_MASK	0x80000000 /* Completed */
>  #define XAXIDMA_BD_STS_DEC_ERR_MASK	0x40000000 /* Decode error */
>  #define XAXIDMA_BD_STS_SLV_ERR_MASK	0x20000000 /* Slave error */


