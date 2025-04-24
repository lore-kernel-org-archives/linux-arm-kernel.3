Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F3AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMYDdYk6v2fk/NRGrYSuLQvSnrBN2QQzR4iMcZlSWwc=; b=TZ+ZsGbpzqzy2RXgdHudI6d0NR
	77yAW0EkLbg+BD6BWk4JBpcRD4i0UArDz9dIB9chKa9kOTZMo/L/2aTN03sujVfsOdvRT29Cpc1Bq
	0fGLxOuWV39wLV1YAoIhuN0oMs/p06WpU8Kv/boKXbRku1V4d+spnKYCtpRxa6N2NwyzUjlP4FzYD
	uGi7xLY8d+KUQXVRbWGVYvautSnDrYtgkGahJHv6mpOh4yp7GYg562xVlMjXJQNRaZk/9DqgcK5BH
	mLAEOXoUplMAU/N+IcA0J84CSW8+U42W52aTCsU6oFkVaQGE/gES9/gxvOtWe9h74rnnBOCnXNb2S
	qQH+BtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wne-0000000EDbb-2BNo;
	Thu, 24 Apr 2025 13:39:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vV4-0000000E05J-1NNJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 12:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lMYDdYk6v2fk/NRGrYSuLQvSnrBN2QQzR4iMcZlSWwc=; b=K6qmy7GYkIiIp5mWokoIz9PLg1
	Ybna4KGpVs8D9gvtcI4/PYWxygn3UhKDwKk7vCxaOrZrPwQ3dyXDpQnymGfHn/FGZMlofyFuCdpL7
	PjLoDLiV0hqQvunYFIVAtR8GPwC1b2bc3PGNyvd3otrseOWgLFQGLhGp1Te1tazX1EyWkAhmZvzVB
	RRYXBXbgJ8h36Rluh4pXyNJ2oKcwEmmTJyoxh4OBAeJrCYqLi9DmL4hZyeXGjaIXEeX7FL0yj1Jra
	6T9LmC/rlto1OhQXrOhUZ6/m6pPhP1i9ZARkcHMtlKMn4B2TiSXhCmRmoBAkaAdjKI3OuXnYp48o4
	dymqkAJw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7vV1-0000000Bmd8-1LnG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C3E85C6394;
	Thu, 24 Apr 2025 12:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC87C4CEE3;
	Thu, 24 Apr 2025 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745496971;
	bh=Sf0ybRK9DYsCxZ5Je/2MG9IakhbW6jd2lRTZlZQzniw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oe51ROCqK35W//I58nfZjw9T19a9u3WVnBJB0SkIp3x39DQ7ql8iB0byUcTix9qCE
	 kZcy0a7XB+8uEXdqyJEA5ZXVFElPivKUlHovhEnK6Xrq4cXaAY0AQg5s4mQoaYJlDK
	 Pz8JmgYFrFGRSuf04xqzh3mZr2pcmqaNxzxK/Thnrcf3UQ4v8XT/0JUcy+C3UBTUzS
	 sfZTv9+jSh9WJTAKEVMPUsKU8AvLRMaAdxVo3n8DxEduUqvdHw6Z3G2zHhUK0UHqCh
	 OBrRynyn5GyXNZbV/uEfFTIvdekG9eVkwHEIW7xSRx0WchZ089/QSS/LQuqiDYN23P
	 zjAwyzQoD4VYA==
Date: Thu, 24 Apr 2025 13:16:04 +0100
From: Simon Horman <horms@kernel.org>
To: Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Tien Sung Ang <tien.sung.ang@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: Refactor VLAN implementation
Message-ID: <20250424121604.GE3042781@horms.kernel.org>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-2-boon.khai.ng@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421162930.10237-2-boon.khai.ng@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_131615_658582_E8598E6C 
X-CRM114-Status: GOOD (  26.49  )
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

On Tue, Apr 22, 2025 at 12:29:29AM +0800, Boon Khai Ng wrote:
> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> The descriptor format for VLAN is not moved to the common code due
> to hardware-specific differences between DWMAC4 and DWXGMAC.
> 
> For the DWMAC4 IP, the Receive Normal Descriptor 0 (RDES0) is
> formatted as follows:
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> For the DWXGMAC IP, the RDES0 format varies based on the
> Tunneled Frame bit (TNP):
> 
> a) For Non-Tunneled Frame (TNP=0)
> 
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> b) For Tunneled Frame (TNP=1)
> 
>      31                   8 7                3 2      0
>       --------------------- ------------------ -------
> RDES0| VNID/VSID           | Reserved         | OL2L3 |
>       --------------------- ------------------ ------
> 
> The logic for handling tunneled frames is not yet implemented
> in the dwxgmac2_wrback_get_rx_vlan_tci() function. Therefore,
> it is prudent to maintain separate functions within their
> respective descriptor driver files
> (dwxgmac2_descs.c and dwmac4_descs.c).
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index a6d395c6bacd..d9f41c047e5e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -614,76 +614,6 @@ static int dwxgmac2_rss_configure(struct mac_device_info *hw,
>  	return 0;
>  }
>  
> -static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
> -				      u16 perfect_match, bool is_double)
> -{
> -	void __iomem *ioaddr = hw->pcsr;
> -
> -	writel(hash, ioaddr + XGMAC_VLAN_HASH_TABLE);
> -
> -	if (hash) {
> -		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value |= XGMAC_FILTER_VTFE;
> -
> -		writel(value, ioaddr + XGMAC_PACKET_FILTER);

Here the XGMAC_FILTER_VTFE bit of XGMAC_PACKET_FILTER is set.
However, this logic does not appear in vlan_update_hash()

> -
> -		value = readl(ioaddr + XGMAC_VLAN_TAG);
> -
> -		value |= XGMAC_VLAN_VTHM | XGMAC_VLAN_ETV;
> -		if (is_double) {
> -			value |= XGMAC_VLAN_EDVLP;
> -			value |= XGMAC_VLAN_ESVL;
> -			value |= XGMAC_VLAN_DOVLTC;
> -		} else {
> -			value &= ~XGMAC_VLAN_EDVLP;
> -			value &= ~XGMAC_VLAN_ESVL;
> -			value &= ~XGMAC_VLAN_DOVLTC;
> -		}

And likewise, here value is based on reading from XGMAC_VLAN_TAG.
Whereas in vlan_update_hash is constructed without reading from
XGMAC_VLAN_TAG.

Can I clarify that this is intentional and that vlan_update_hash(),
which is based on the DWMAC4 implementation, will also work for DWXGMAC IP?

> -
> -		value &= ~XGMAC_VLAN_VID;
> -		writel(value, ioaddr + XGMAC_VLAN_TAG);
> -	} else if (perfect_match) {
> -		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value |= XGMAC_FILTER_VTFE;
> -
> -		writel(value, ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value = readl(ioaddr + XGMAC_VLAN_TAG);
> -
> -		value &= ~XGMAC_VLAN_VTHM;
> -		value |= XGMAC_VLAN_ETV;
> -		if (is_double) {
> -			value |= XGMAC_VLAN_EDVLP;
> -			value |= XGMAC_VLAN_ESVL;
> -			value |= XGMAC_VLAN_DOVLTC;
> -		} else {
> -			value &= ~XGMAC_VLAN_EDVLP;
> -			value &= ~XGMAC_VLAN_ESVL;
> -			value &= ~XGMAC_VLAN_DOVLTC;
> -		}
> -
> -		value &= ~XGMAC_VLAN_VID;
> -		writel(value | perfect_match, ioaddr + XGMAC_VLAN_TAG);
> -	} else {
> -		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value &= ~XGMAC_FILTER_VTFE;
> -
> -		writel(value, ioaddr + XGMAC_PACKET_FILTER);
> -
> -		value = readl(ioaddr + XGMAC_VLAN_TAG);
> -
> -		value &= ~(XGMAC_VLAN_VTHM | XGMAC_VLAN_ETV);
> -		value &= ~(XGMAC_VLAN_EDVLP | XGMAC_VLAN_ESVL);
> -		value &= ~XGMAC_VLAN_DOVLTC;
> -		value &= ~XGMAC_VLAN_VID;
> -
> -		writel(value, ioaddr + XGMAC_VLAN_TAG);
> -	}
> -}

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c

...

> +static int vlan_write_filter(struct net_device *dev,
> +			     struct mac_device_info *hw,
> +			     u8 index, u32 data)
> +{
> +	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
> +	int i, timeout = 10;
> +	u32 val;
> +
> +	if (index >= hw->num_vlan)
> +		return -EINVAL;
> +
> +	writel(data, ioaddr + VLAN_TAG_DATA);
> +
> +	val = readl(ioaddr + VLAN_TAG);
> +	val &= ~(VLAN_TAG_CTRL_OFS_MASK |
> +		VLAN_TAG_CTRL_CT |
> +		VLAN_TAG_CTRL_OB);
> +	val |= (index << VLAN_TAG_CTRL_OFS_SHIFT) | VLAN_TAG_CTRL_OB;
> +
> +	writel(val, ioaddr + VLAN_TAG);
> +
> +	for (i = 0; i < timeout; i++) {
> +		val = readl(ioaddr + VLAN_TAG);
> +		if (!(val & VLAN_TAG_CTRL_OB))
> +			return 0;
> +		udelay(1);
> +	}

I am curious to know why readl_poll_timeout() isn't used here
as was the case in dwmac4_write_vlan_filter().

> +
> +	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> +
> +	return -EBUSY;
> +}

...

