Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EA01061B1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 19:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAc7YHSQrwJfKCXX2f47zs5maWQYLeQ6iIc2j8sAEX0=; b=df1WpxdOAkaenhxcqLE1ENYpWZ
	KnnjBVtt78pW8GtbgWVPH0WFvLtEDwZ4Y9byC6MKGjG7EkMeehZi7XP4zT1R+j4vBHNBpswIOBt+6
	zJdec07wDdo3Hy/+R78xJ5OfTETJe+cWb81N755qZfgVymJv/VtG1DmAZAEMO0neOIVGFWpWz0Y8s
	31MAWC68O0SwcxzPD56ND6C9laB0qeFHSGGJH0P2I7JDWF6Exeb/JEHDLOcp10sfpWL+WNKsQbrIs
	QFY40YzptdVbJYDufAvgLfWy7i691xADd+lIFAjMuRFp9SnJ0zIG3ZmtfkVoxEZbPRjb2fTXTAjzE
	O9xGsaBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hzo-0000000Bm0h-1y3R;
	Mon, 30 Mar 2026 19:09:56 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hzm-0000000Bm09-0Ibi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 19:09:55 +0000
Message-ID: <9bec08b6-c97b-4e04-8940-d08afa831722@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774897790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fAc7YHSQrwJfKCXX2f47zs5maWQYLeQ6iIc2j8sAEX0=;
	b=tPR/aBRWQ8VkUoJzfAOYOUvQmkoyvMwtDry/5SZEN21PjHOm7y6bKd0IAplfRoed63tUu/
	Sb99GaNLgRWU71EMf9gWSKdfP5Rsb3lTobGalag4XHMXBRLAwpyJT9VVg932E7RM5xIFAF
	CNlDqcaku08E0KDQgTF7EtzQZ0p1IMo=
Date: Mon, 30 Mar 2026 15:09:38 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net V2 1/2] net: xilinx: axienet: Correct BD length masks
 to match AXIDMA IP spec
To: Suraj Gupta <suraj.gupta2@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Michal Simek <michal.simek@amd.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Ariane Keller <ariane.keller@tik.ee.ethz.ch>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260327073238.134948-1-suraj.gupta2@amd.com>
 <20260327073238.134948-2-suraj.gupta2@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20260327073238.134948-2-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_120954_521737_6682281C 
X-CRM114-Status: GOOD (  14.59  )
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

On 3/27/26 03:32, Suraj Gupta wrote:
> The XAXIDMA_BD_CTRL_LENGTH_MASK and XAXIDMA_BD_STS_ACTUAL_LEN_MASK
> macros were defined as 0x007FFFFF (23 bits), but the AXI DMA IP
> product guide (PG021) specifies the buffer length field as bits 25:0
> (26 bits). Update both masks to match the IP documentation.
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
> index 5ff742103beb..fcd3aaef27fc 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
> @@ -105,7 +105,7 @@
>  #define XAXIDMA_BD_HAS_DRE_MASK		0xF00 /* Whether has DRE mask */
>  #define XAXIDMA_BD_WORDLEN_MASK		0xFF /* Whether has DRE mask */
>  
> -#define XAXIDMA_BD_CTRL_LENGTH_MASK	0x007FFFFF /* Requested len */
> +#define XAXIDMA_BD_CTRL_LENGTH_MASK	GENMASK(25, 0) /* Requested len */
>  #define XAXIDMA_BD_CTRL_TXSOF_MASK	0x08000000 /* First tx packet */
>  #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
>  #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
> @@ -130,7 +130,7 @@
>  #define XAXIDMA_BD_CTRL_TXEOF_MASK	0x04000000 /* Last tx packet */
>  #define XAXIDMA_BD_CTRL_ALL_MASK	0x0C000000 /* All control bits */
>  
> -#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK	0x007FFFFF /* Actual len */
> +#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK	GENMASK(25, 0) /* Actual len */
>  #define XAXIDMA_BD_STS_COMPLETE_MASK	0x80000000 /* Completed */
>  #define XAXIDMA_BD_STS_DEC_ERR_MASK	0x40000000 /* Decode error */
>  #define XAXIDMA_BD_STS_SLV_ERR_MASK	0x20000000 /* Slave error */

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

