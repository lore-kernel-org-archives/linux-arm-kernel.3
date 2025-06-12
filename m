Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D7CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 09:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vOEJaBIS2LMFLReKHfYmqBjG6t3lYdDRrc4GkwUVpE=; b=tqGiZ2FBmFkQXiRXNyR6InHT8C
	xLMhHoSg/JB/ytaUuqWPbfknLLki+dLsZAb6GCsrkMKZ1WPIbd+P1dJhsaoCcSZWqtnKV4GAEUBD4
	sQ5QuukPzPsFmcFWlqxEB2qzEHaI6JR6wcVk7Q/8TT2GQKmW9HRb0TlcNfnPQKEokyE8EgYkKnWKv
	XcwOu8O8TzCw5nvHXM7FLoneuekoDZApRLYzehRmJOR4vkfbd2ch4nyx5TE1EHfnfT1rp5rkU+xLu
	fCLIB1GwOmxsJtnRnMtKKNINzRO378aOtTPH2noQbUxE7DMXwqhVDyBqtITRnHI/1Pvm0Ufj30qIv
	iEcy8bjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeWs-0000000CrVQ-0xqw;
	Thu, 12 Jun 2025 09:47:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdG3-0000000CcFV-3cYW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 08:26:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C3F4339;
	Thu, 12 Jun 2025 01:25:37 -0700 (PDT)
Received: from [10.1.32.165] (e134369.arm.com [10.1.32.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A6393F59E;
	Thu, 12 Jun 2025 01:25:55 -0700 (PDT)
Message-ID: <4383f1ad-2782-4cd9-b21e-55d3a1500e65@arm.com>
Date: Thu, 12 Jun 2025 09:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: sunxi-ng: a523: Mark MBUS clock as critical
To: Chen-Yu Tsai <wens@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250607135029.2085140-1-wens@kernel.org>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250607135029.2085140-1-wens@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_012559_949379_A05FDE4B 
X-CRM114-Status: GOOD (  19.02  )
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

Hi Chen-Yu,

thanks for your research on this!

On 07/06/2025 14:50, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The MBUS serves as the main data bus for various DMA masters in the
> system. If its clock is not enabled, the DMA operations will stall,
> leading to the peripherals stalling or timing out. This has been
> observed as USB or MMC hosts timing out waiting for transactions
> when the clock is automatically disabled by the CCF due to it not
> being used.
> 
> Mark the clock as critical so that it never gets disabled.

Yes, we do this for all the other SoCs, and I somehow missed that for 
the A523.
I am still scratching my head how this worked for me, though, but the 
patch is pretty surely correct:

> Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> index 9efb9fd24b42..1a9a1cb869e2 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -385,7 +385,8 @@ static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
>   					    0, 0,		/* no P */
>   					    24, 3,	/* mux */
>   					    BIT(31),	/* gate */
> -					    0, CCU_FEATURE_UPDATE_BIT);
> +					    CLK_IS_CRITICAL,
> +					    CCU_FEATURE_UPDATE_BIT);
>   
>   static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
>   


