Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6888CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIENXqf8u+8JhNiCMIsNIzxV5JF/3qK7/yHU9HKG2Uk=; b=Ie4KpLWpI4XT/d8/RrTXL4z5YQ
	OL8nwzL/8d4Bi25OjL24GBQmWpZGjeudrVJ96/6BdkmvNljzcrN/ZEmbEVmn/bYNORuu4H/FBp5hW
	seD+safuFqtUtAPRVygb3qbInJFVWs0jzod87iY9o9jqFUOazzlXYHjzCVaIYYO0MmLvDoRJDgiee
	FjUe/QUHYGBYJ3ro+sg5bEOiEK0aJ3hyg0m3bhjPzIxAuCH3NN9qbtDvZH4NiLUMTEBBe/Tvhr+wR
	3rwI7Rkmy8X8Vi2Gq3kFM9PXOjqDsqt9JOy5edao3KoZ5hfa2Kg5bvNJcDRVhB0Cs+7fId8kLXNOA
	Ee/K0FYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggKD-0000000CA2m-1QpU;
	Mon, 06 Jul 2026 10:13:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggKB-0000000CA2K-0dYo;
	Mon, 06 Jul 2026 10:13:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03D4C16F3;
	Mon,  6 Jul 2026 03:13:09 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB3B63F85F;
	Mon,  6 Jul 2026 03:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783332793; bh=M+wWN+uhCsm+rCwBHGw7kCZppIs5qzAmwl9BelRZ0b4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gLTLe2CCOD8CeaMQbjekS2D9KXffduPDMInyWVeVj4gpzEeyf4qp3/wDi/0LN7rKO
	 qh9RO0bbr6W3QC2PluaOFUaezI9y02AmJ90H5yvUJ+65oBhGjCwY17SCFHgGzRrdgT
	 kKQbKjBea2EKF87NxI6ece8hXBwdADN2CDLCtniQ=
Message-ID: <d8042dd2-303e-4f24-b7bf-74ae080f4ae6@arm.com>
Date: Mon, 6 Jul 2026 12:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: allwinner: sun4i-usb: disable the PHY2 PMU clock
 after SIDDQ setup
To: raoxu <raoxu@uniontech.com>, vkoul@kernel.org
Cc: wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 neil.armstrong@linaro.org, marco.crivellari@suse.com,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <1368E4E3485E881C+20260706093549.867442-1-raoxu@uniontech.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <1368E4E3485E881C+20260706093549.867442-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031315_262997_BBBA7363 
X-CRM114-Status: GOOD (  16.10  )
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

On 7/6/26 11:35, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> sun4i_usb_phy_init() temporarily enables PHY2's clk2 when a SoC needs
> PHY2 SIDDQ setup while initializing another PHY. However, after updating
> PHY2's PMU register it disables the clk2 pointer from the PHY currently
> being initialized.
> 
> This leaves PHY2's clk2 enabled and also drops an extra reference from
> the current PHY's clk2, causing the prepare/enable accounting to become
> unbalanced.
> 
> Disable the same PHY2 clk2 that was enabled for the auxiliary PMU access.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
>   drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> index e2fbf8ccf99e..839856c09e30 100644
> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> @@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
>   			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
>   		}
> 
> -		clk_disable_unprepare(phy->clk2);
> +		clk_disable_unprepare(phy2->clk2);

Interesting, this looks about right, and matches the comment above, 
noting that phy2->clk2 is just temporarily needed. I don't remember 
further details, only that this workaround was quite annoying and messy ;-)

However I am wondering how this worked so far: This should sabotage the 
access to the local REG_HCI_PHY_CTL access in the next few lines ...
Any idea why this worked nevertheless?

Thanks,
Andre

>   	}
> 
>   	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
> --
> 2.50.1
> 


