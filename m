Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65422E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 11:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0CAjk3X1Da4pfjgTSIhgq/wctR6IO/zVhEcA9rA6Fo=; b=1hMKmotnoiZJWh4O3UT9vk38BU
	SlTzWJ7/liFufsih53kmSEgduU9fCHg/j95Q3pOSHZ0WsKGaQJNCcrkVA+G4zA/zNTa812B4BRC9l
	ys2Mitar37tIMoXx1GdgGBqCmMgpz6eGwNBLf14kd4xtukCX+baCCKqAgc3Ekl09cBZrDJHN6chDi
	diwDT7tZlz5cKy7Um1tAWadW+LOMK3ZFfsNR7Wh+XmLCHvmkks69Lp0KIvhN8CHzl8eNDZBGRqHc8
	9yVHQFhudC0VbTPbiO4tmrn4skfAAEBhMmcsl4S8p+EvcJ59/ci6uXWMnB3mks3Ig2CyzEiZ2XWIR
	xGMWnttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7nV-00000004YqG-1KuD;
	Tue, 07 Jan 2025 11:30:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV7la-00000004YN5-0QvU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:28:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25E8DA40AC8;
	Tue,  7 Jan 2025 11:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF24DC4CED6;
	Tue,  7 Jan 2025 11:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736249336;
	bh=a/nUa1LpYlu8s73KEhuvs+6oTFnQ69UQk445ZrCficQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gImPgzFWKdaLfhzGloiicMj18CgRTePlPywu2sxqZzJB7pXfAAPZTTzPlM2C7keyA
	 AAwwEKlIqBk+qKD6ZN670879wOhRm2SVeuE1Q5WW5BVoso2KdTqx5BOD6XMEKOpQD7
	 vcrMImtbS9DRqzk2wHZjJp7TnPk+xw2R6tOrquuOIIxtuzSEVLhvw4KxP1I9u2r0mR
	 A0zSxUozsvlgs/KDIbGMSn3t5vIhlNGvSN2Teu0WhSqU4STXkemsvEqruKTHLnWZ/4
	 efI7l28N48n3OW3n7inOwPcRKmfyLLpiDbkhBA049t33h1iAmYfpV3CFTvjUg/Xk7T
	 hk7erpGh03HAw==
Date: Tue, 7 Jan 2025 11:28:51 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 03/17] net: stmmac: use correct type for
 tx_lpi_timer
Message-ID: <20250107112851.GE33144@kernel.org>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAE-007VWv-UW@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_032858_211479_52C2EE19 
X-CRM114-Status: GOOD (  17.46  )
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

On Mon, Jan 06, 2025 at 12:24:58PM +0000, Russell King (Oracle) wrote:
> The ethtool interface uses u32 for tx_lpi_timer, and so does phylib.
> Use u32 to store this internally within stmmac rather than "int"
> which could misinterpret large values.
> 
> Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> should be unsigned to avoid a negative number being interpreted as a
> very large positive number.
> 
> Also correct "value" in dwmac4_set_eee_lpi_entry_timer() to use u32
> rather than int, which is derived from tx_lpi_timer, even though
> masking with STMMAC_ET_MAX will truncate the sign bits. u32 is the
> value argument type for writel().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9a9169ca7cd2..b0ef439b715b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -111,8 +111,8 @@ static const u32 default_msg_level = (NETIF_MSG_DRV | NETIF_MSG_PROBE |
>  				      NETIF_MSG_IFDOWN | NETIF_MSG_TIMER);
>  
>  #define STMMAC_DEFAULT_LPI_TIMER	1000
> -static int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> -module_param(eee_timer, int, 0644);
> +static unsigned int eee_timer = STMMAC_DEFAULT_LPI_TIMER;
> +module_param(eee_timer, uint, 0644);
>  MODULE_PARM_DESC(eee_timer, "LPI tx expiration time in msec");
>  #define STMMAC_LPI_T(x) (jiffies + usecs_to_jiffies(x))
>  

Hi Russell,

now that eee_timer is unsigned the following check in stmmac_verify_args()
can never be true. I guess it should be removed.

        if (eee_timer < 0)
                eee_timer = STMMAC_DEFAULT_LPI_TIMER;

Flagged by Smatch.

...

