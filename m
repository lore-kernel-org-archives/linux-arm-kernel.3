Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230CCC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xf4/wbfnbhPo6b7R5dWEe48U/hI2PDkqjc4rlK2/RLI=; b=G1qz3uvBOkitKRib0lmbMiRi7B
	TjBlRyWeOqAtvVwb8Kehkt4jrZ3gIyUprcNMFypxue/8/hGNaqr4+/H1DnlgoF83eux7ceqo2TejG
	x9CSUzqye1DiI+EOek8uLI9azv5OhO4L16HpLmrMV1C2G2u0FZ+0sPC3jSEwApWWwvhNeAlq4Agzq
	uTGhgqrP8V907bh0yG47QnOySbO+04Y46rdeU3FgtrIjPN7swGsIOEFGTqV89yL5YdOGCu/wWf/DJ
	jLCTsFJbxtpxulf+BhmmyeUlayJhh4XqdhP9wnlXLFQrkWsjOqopWqUHHcfBULSOFu/P5RYmsEc4N
	cakcM+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtpU-0000000HPX6-3pdy;
	Mon, 03 Aug 2026 14:39:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtpS-0000000HPVe-1fzk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:39:47 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69ECC5B3;
	Mon,  3 Aug 2026 16:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785767914;
	bh=TnyB/lE62Vgv0XTcDZMRiCAeP+lIpfxoxN39z6lueKE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aLvbaW7+8hS7GdDEXnxKqZKAW0LR2Ggpf4gUlFDFsbx6m15yYrZHzZDZwVnh5yt4a
	 nw/7UKMIyruyqLqBX7mylRUDGwkCmp1GBiV8zaiy8eakfsCO9VPc3meMrJifqH/HqQ
	 8pk2ZgEQlJ7wr2gZfDhZfhKZtqcHKXg2OnNfWOBc=
Message-ID: <a976b47c-164b-4d6b-ba88-169b401c1c93@ideasonboard.com>
Date: Mon, 3 Aug 2026 17:39:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead
 of atomic variant
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vishal Sagar <vishal.sagar@amd.com>
References: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073946_599023_A4F98B8E 
X-CRM114-Status: GOOD (  16.25  )
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

On 03/08/2026 16:20, Tomi Valkeinen wrote:
> All callers of xilinx_dma_poll_timeout() pass a zero delay and a 1
> second timeout (XILINX_DMA_LOOP_COUNT). With a zero delay,
> readl_poll_timeout_atomic() does not measure wall clock time, and the
> actual timeout can be much more than 1 second.
> 
> This is very visible when a channel reset never completes, e.g. with a
> VDMA whose stream-side clock isn't running. Probe appears to hang, and
> only minutes later fails with:
> 
>    xilinx-vdma a0050000.dma: reset timeout, cr 4, sr 0
>    xilinx-vdma a0050000.dma: Reset channel failed
> 
> Switch to readl_poll_timeout(), which checks the deadline against
> ktime_get().
> 
> Calling xilinx_dma_poll_timeout() from atomic context is still safe even
> after this change, as readl_poll_timeout() with zero delay never sleeps.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/dma/xilinx/xilinx_dma.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 404235c17353..6e8c786147f7 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -530,7 +530,7 @@ struct xilinx_dma_device {
>   #define to_dma_tx_descriptor(tx) \
>   	container_of(tx, struct xilinx_dma_tx_descriptor, async_tx)
>   #define xilinx_dma_poll_timeout(chan, reg, val, cond, delay_us, timeout_us) \
> -	readl_poll_timeout_atomic(chan->xdev->regs + chan->ctrl_offset + reg, \
> +	readl_poll_timeout(chan->xdev->regs + chan->ctrl_offset + reg, \
>   				  val, cond, delay_us, timeout_us)
As commented by Sashiko, readl_poll_timeout API doc says "Must not be 
called from atomic context if sleep_us or timeout_us are used".

Maybe a better fix is to continue using readl_poll_timeout_atomic, but 
use a small (non-zero) delay_us, and decrease the timeout_us. Using a 
one second timeout when calling from atomic context doesn't sound very 
good in any case.

  Tomi


