Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED8CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgWaxOLgJgmfLcv6CbU5VSl0bHdWpy4SM/JjXFjiHxo=; b=WcD/hXpLza2a8OmbKu7lPar+9M
	Sy05DP4NHi4RN4NQjWjzbgqkO2Qw9V7IK5I6xvIuXQhl/LODJ+vKuiNTR0Jhcocm8BsxoL/n402nL
	/mmGyAZX92oL4X2L3Bpd0+y66DjgJVtlez/mRxdb6cwk1YDGT1QIjH7Z+M/YlRgG2AbVWBL/hVo0X
	zgtB+LNR2f7GyM2Vk+1H9PblAtEiPKQPoDYrA4kslxbIKDh5aK+2cUq3g5LADXkzeCbeJ7L0EFdLf
	v6akU+OdmIHChDnuh/ilNuKMg9ZekJaCiDUqMBIgM3gwJQXcK+ZlsqKhFrggFiWX4PX5FEFX7LpL5
	AyvSLnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc5L-000000047H8-2clg;
	Fri, 05 Sep 2025 19:26:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuY7F-00000002eVW-3zHV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 15:12:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F49C152B;
	Fri,  5 Sep 2025 08:12:33 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B7F93F6A8;
	Fri,  5 Sep 2025 08:12:39 -0700 (PDT)
Date: Fri, 5 Sep 2025 16:12:36 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] clk: sunxi-ng: mp: Fix dual-divider clock rate
 readback
Message-ID: <20250905161236.51b6ecee@donnerap>
In-Reply-To: <20250830170901.1996227-4-wens@kernel.org>
References: <20250830170901.1996227-1-wens@kernel.org>
	<20250830170901.1996227-4-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_081242_032152_C20A5EB3 
X-CRM114-Status: GOOD (  18.50  )
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

On Sun, 31 Aug 2025 01:08:56 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> When dual-divider clock support was introduced, the P divider offset was
> left out of the .recalc_rate readback function. This causes the clock
> rate to become bogus or even zero (possibly due to the P divider being
> 1, leading to a divide-by-zero).

Ah, a nice catch, thanks for that! Just curious, how did you find this?
The MMC clocks use the dual divider type as well, but I didn't observe
them being wrong?

Regardless:

> Fix this by incorporating the P divider offset into the calculation.
> 
> Fixes: 45717804b75e ("clk: sunxi-ng: mp: introduce dual-divider clock")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>  drivers/clk/sunxi-ng/ccu_mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
> index 354c981943b6..4221b1888b38 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.c
> +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> @@ -185,7 +185,7 @@ static unsigned long ccu_mp_recalc_rate(struct clk_hw *hw,
>  	p &= (1 << cmp->p.width) - 1;
>  
>  	if (cmp->common.features & CCU_FEATURE_DUAL_DIV)
> -		rate = (parent_rate / p) / m;
> +		rate = (parent_rate / (p + cmp->p.offset)) / m;
>  	else
>  		rate = (parent_rate >> p) / m;
>  


