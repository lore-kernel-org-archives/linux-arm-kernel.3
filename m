Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DD0D12D49
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+y2QMykRjhaG+PDz43DPVOX9kNsX0ZYGqEKpJPmxSA=; b=U4ckl8I5yo9QvzCLD0Dnej0rfl
	1jPpfyWUXgRBmZZhn7Dojf6RPaPBv3L8v8jS+iXfWkAQQ9uBv3GjVabGqd4S2hDa2j4FRTNWkj/7X
	2pY3QumN4E4t5+0FCBtvglqd4cMD9n0Rg9KiG0U0oKhxppj1mIhmzcJS7mcwaH3qMgyu2e+eszeP+
	OD6proHgD36vB/LOxjwruFBeF0QoKPCGnW7xnbwzKgO3e61RZvgJhm1uKbuHkFaUzF7Hn3GboYvzh
	DHliwvZJl4ZFSNCyaLfy+hzaZWIRIPXw5vPN3Ger1Lfao6J5690bE0+dgx0isqojpsPhqpsei+tYC
	GxjW4Y0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAB0D-0000000FFIn-1NbD;
	Sun, 10 Nov 2024 16:41:29 +0000
Received: from violet.fr.zoreil.com ([2001:4b98:dc0:41:216:3eff:fe56:8398])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAAyO-0000000FF7n-0FWR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 16:39:40 +0000
Received: from violet.fr.zoreil.com ([127.0.0.1])
	by violet.fr.zoreil.com (8.17.1/8.17.1) with ESMTP id 4AAGbouY3930604;
	Sun, 10 Nov 2024 17:37:50 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 4AAGbouY3930604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
	s=v20220413; t=1731256670;
	bh=5+y2QMykRjhaG+PDz43DPVOX9kNsX0ZYGqEKpJPmxSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFkxxDRaq1CSSsHRAAocoXu+u98Fyc5BN4GR4nHWXkWF9G4P4eEIgMKVy9d4t4ZBx
	 67hd1nY0BOtuujJ85otrSRji5KektIdUuvhwvsToPqe4Q8utQnGKfPgxcaEBz42GxQ
	 aqLq3/kra2W7ijiY9fEnrh/5yk7KY5bQZ8QjDUt0=
Received: (from romieu@localhost)
	by violet.fr.zoreil.com (8.17.1/8.17.1/Submit) id 4AAGblIR3930603;
	Sun, 10 Nov 2024 17:37:47 +0100
Date: Sun, 10 Nov 2024 17:37:47 +0100
From: Francois Romieu <romieu@fr.zoreil.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
        Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Marcin Wojtas <marcin.s.wojtas@gmail.com>,
        Byungho An <bh74.an@samsung.com>,
        Kevin Brace <kevinbrace@bracecomputerlab.com>,
        Michal Simek <michal.simek@amd.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, Zhao Qiang <qiang.zhao@nxp.com>,
        "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
        "open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next] net: use pdev instead of OF funcs
Message-ID: <20241110163747.GA3930570@electric-eye.fr.zoreil.com>
References: <20241109233821.8619-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109233821.8619-1-rosenp@gmail.com>
X-Organisation: Land of Sunshine Inc.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_083939_098773_0D2953B3 
X-CRM114-Status: GOOD (  12.88  )
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

Rosen Penev <rosenp@gmail.com> :
> np here is ofdev->dev.of_node. Better to use the proper functions as
> there's no use of children or anything else.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
[...]
> diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
> index 894911f3d560..f079242c33e2 100644
> --- a/drivers/net/ethernet/via/via-rhine.c
> +++ b/drivers/net/ethernet/via/via-rhine.c
> @@ -1127,7 +1127,7 @@ static int rhine_init_one_platform(struct platform_device *pdev)
>  	if (IS_ERR(ioaddr))
>  		return PTR_ERR(ioaddr);
>  
> -	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	irq = platform_get_irq(pdev, 0);
>  	if (!irq)
>  		return -EINVAL;
>  
> diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
> index dd4a07c97eee..4aac9599c14d 100644
> --- a/drivers/net/ethernet/via/via-velocity.c
> +++ b/drivers/net/ethernet/via/via-velocity.c
> @@ -2950,7 +2950,7 @@ static int velocity_platform_probe(struct platform_device *pdev)
>  	if (!info)
>  		return -EINVAL;
>  
> -	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	irq = platform_get_irq(pdev, 0);
>  	if (!irq)
>  		return -EINVAL;
>  

The change makes sense. However neither the description nor the commit message
really match here.

-- 
Ueimor

