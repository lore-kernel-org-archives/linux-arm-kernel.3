Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F0CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjV5Td/24R7h6W/jbCMD4UabtRQNn6Mt9mud721CkxY=; b=dcrk9HpSw+r7VmsveukZlKKRA4
	RF0mXHO+yOmWopWLNgkiSID9ODGhjsmxKtb5+An9f8JO9FKT7lplUBgxl8AzBMrrYLi+K3Nz5Y8L+
	n+nd7icw36PqgAaAv+6tERleFDScxtNXJAVHx2BgMRQHwnDX/FQyAOAn03vljWJwO1or6SZ5elcAB
	BZZcUPG3WnYhtxqXY6UKJhKF+NpJXHbP9eMjvOTj5Dn4so4UDnqvgsK+cx7ojFfgPL0WHON6O4HPb
	Wkt6W+cdnPC195sEifXVCWn8DXIBMLV7rTdMiuRKmWGI87A54nSMa9iAVUlG9UadUOj4DtuK5zKXp
	/AA2vC6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApsa-0000000DmP9-3n1M;
	Mon, 20 Oct 2025 13:24:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApsX-0000000DmNO-2vYE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 13:24:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 609F71063;
	Mon, 20 Oct 2025 06:24:38 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 083B23F66E;
	Mon, 20 Oct 2025 06:24:44 -0700 (PDT)
Date: Mon, 20 Oct 2025 14:24:34 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mturquette@baylibre.com,
 sboyd@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
Message-ID: <20251020142434.066f53b8@donnerap.manchester.arm.com>
In-Reply-To: <20251019172647.80379-1-jernej.skrabec@gmail.com>
References: <20251019172647.80379-1-jernej.skrabec@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_062449_800296_01391432 
X-CRM114-Status: GOOD (  18.00  )
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

On Sun, 19 Oct 2025 19:26:47 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> bus-r-cpucfg clock is important for peripheral which takes care for
> powering CPU cores on and off. Since this operation is done by firmware
> (TF-A), mark is as critical. That way Linux won't interfere with that
> clock.

Many thanks, makes sense. I hammered /sys/devices/system/cpu/cpu<x>/online
like a 1000 times in a random loop now, and it survived - after I excluded
CPU0 from this. Offlining CPU0 works, but it doesn't come back online
again. But that's probably something in TF-A, so nothing that affects this
patch:

> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> index 70ce0ca0cb7d..c5b0d4a2e397 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -125,7 +125,7 @@ static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
>  static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
>  			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
>  static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
> -			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
> +			 &r_apb0_clk.common.hw, 0x22c, BIT(0), CLK_IS_CRITICAL);
>  
>  static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
>  	&r_ahb_clk.common,


