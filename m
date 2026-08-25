Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB42C61CE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcRF+Ez8X25jX81OBa0aRS4U+pKAW1gVpgBJJkiwHLw=; b=J1boajS6sCDDdsfA0YmpovzSct
	lKp/w05iT7PXomlUlIMBT+cF802vJ1LKY66UOHwTKzWB8SDb8zVlAgCZEcEAVWU9vWSHdjlaFzaMU
	wAVRNEv57rw/21bqWh+ESmJnLU9mYshMxXmXRSh35KY5cqmojU6QjscsO6c6wkIYLrnPdfbtDnQT4
	fOxgpkFBG1mUMtN+DcJooxyohLbChrK+o/QMWUktQJYx3yp8in3dfEw22USRjvP9yh6FzhgIaT59P
	UcCqcGuj3CCqfW4W90ygfJXqM2VBRm3XO2p/Jp6q5qQQQfwqCRR+vDJugGXYt0QYGqNFURh2hkpPh
	B1pN/gYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoS8-00000000bpv-0fcS;
	Tue, 25 Aug 2026 10:32:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyoS3-00000000bpN-3yOn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 10:32:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A3F71BF7;
	Tue, 25 Aug 2026 03:32:11 -0700 (PDT)
Received: from [10.1.31.148] (e142021.arm.com [10.1.31.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6B313F7D8;
	Tue, 25 Aug 2026 03:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787653935; bh=Tsxi2Q13JLZntOlrs0aLxbld635jIPf+JkdjCgc9bSI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QOv1dLDfG0UNmyJ2VQE0AaDZv92EGE1qm9y4Pu6MsK7wVPVj1aCwzqS/FNSWwCgWW
	 WfzFzRkRshkDtapxyPO9JsOUefIZmjasDM3mxAeWKtnRaFM9wzM+mGWdRNPPi0BC4P
	 mSdooJGvXr2GnbdxqCZIpzQ8fHkAPqy+i8N6HvRk=
Message-ID: <95b5fee4-70e8-4b2d-96fa-bce267ff13f5@arm.com>
Date: Tue, 25 Aug 2026 11:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: sun4i-emac: Fix IRQ error handling
To: phucduc.bui@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Linus Walleij <linusw@kernel.org>,
 Kees Cook <kees@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Stefan Roese <sr@denx.de>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260824100901.31675-1-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260824100901.31675-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_033220_035557_97BFE0A6 
X-CRM114-Status: GOOD (  18.13  )
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

On 8/24/26 12:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails.
> The current code checks for -ENXIO and therefore does not detect the
> failure.
> 
> Check for a zero return value and convert it to -ENXIO.

Yes, the return value is the IRQ number, or 0 in case of a missing IRQ.

> Fixes: 492205050d77 ("net: Add EMAC ethernet driver found on Allwinner A10 SoC's")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>   drivers/net/ethernet/allwinner/sun4i-emac.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
> index 42174249ef61..942454e29488 100644
> --- a/drivers/net/ethernet/allwinner/sun4i-emac.c
> +++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
> @@ -996,9 +996,9 @@ static int emac_probe(struct platform_device *pdev)
>   	/* fill in parameters for net-dev structure */
>   	ndev->base_addr = (unsigned long)db->membase;
>   	ndev->irq = irq_of_parse_and_map(np, 0);
> -	if (ndev->irq == -ENXIO) {
> +	if (!ndev->irq) {
>   		netdev_err(ndev, "No irq resource\n");
> -		ret = ndev->irq;
> +		ret = -ENXIO;
>   		goto out_iounmap;
>   	}
>   


