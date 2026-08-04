Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA81DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xd/A/k5scoEkiSfkxEsnxNSvX+fTeIItseFvpU0+3U=; b=aadElJZK2U3fbl9LHyvLRDcDHw
	I/YHhZ8cYL/LipCSsgvWTrGznXCqFnxMgGVGZU26ABc+cGOiJUgKCAFFT3mvWjPzD/0O+Y+aZWFJa
	Y0GyLcWuBdmF0jey90Q/gFav1nclY+/lPp3zfWxp4YELeH+eWa0mBzBwyC39+HnuM0w0ex1AVOpmM
	p1jND5RPEBqw+bJ+KyQws7gS/5o0ROTWJ91p6y9wWIKtFdiZcAWV+uF4dGYt0yRH0sJl5CIfs+Und
	na9Hux9fe0RCPedZ+cOZaDVfua7Pd1MgS5YVcA713zMMN6Rnjzja2JQfNB0WlJirmd4NLoJBZE9t5
	nq0dbfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr57c-00000000rEH-1yOk;
	Tue, 04 Aug 2026 02:43:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr57a-00000000rDr-0oyX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 02:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5xd/A/k5scoEkiSfkxEsnxNSvX+fTeIItseFvpU0+3U=; b=HkvcuGbT7wWBfvr6qcREZl62zE
	gPFazdXpsM7+ig4sGAA+An7X07pznvVmjoOpIHcMCugq+/KBJjD6aa7xbG/itZNNKWYObTMUxA/QF
	VZtic05EpfJy4txj+JVSHDxN7lX60fBPDZCzbtF1RLynmG4gUTj2KGThGOQ4hCLTSg8c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wr57I-00FtfC-Ic; Tue, 04 Aug 2026 04:42:56 +0200
Date: Tue, 4 Aug 2026 04:42:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Liu Changjie <liucj1228@outlook.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] net: phy: maxio: prepare for more DT properties
Message-ID: <4d855daa-a426-4f46-985c-181e3b0eb7f1@lunn.ch>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
 <20260803101452.2993721-2-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803101452.2993721-2-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_194314_256902_76A61F8F 
X-CRM114-Status: GOOD (  18.93  )
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

On Mon, Aug 03, 2026 at 12:14:47PM +0200, Andre Przywara wrote:
> The probe routine for the Maxio PHY returns early if the optional
> maxio,clk-out-frequency-hz property is not found. That prevents looking
> for other properties.
> 
> Refactor the routine to handle the property in an if-clause, to allow
> more actions in the probe routine later.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/net/phy/maxio.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/phy/maxio.c b/drivers/net/phy/maxio.c
> index d2cb23895646..95a2169f25df 100644
> --- a/drivers/net/phy/maxio.c
> +++ b/drivers/net/phy/maxio.c
> @@ -43,18 +43,18 @@ static int maxio_mae0621a_probe(struct phy_device *phydev)
>  
>  	ret = device_property_read_u32(dev, "maxio,clk-out-frequency-hz",
>  				       &frequency);
> -	if (ret == -EINVAL)
> -		return 0;
> -	if (ret)
> +	if (!ret) {
> +		if (frequency != 125000000) {
> +			phydev_err(phydev, "invalid CLKOUT frequency %u\n",
> +				   frequency);
> +			return -EINVAL;
> +		}
> +
> +		priv->clk_out_125m = true;
> +	} else if (ret != -EINVAL) {
>  		return ret;

The normal pattern is to check for errors and return them. So i would
do this test first.

 	ret = device_property_read_u32(dev, "maxio,clk-out-frequency-hz",
  				       &frequency);
        if (ret) {
	   if (ret != -EINVAL)
	        return ret;
	} else {
		if (frequency != 125000000) {
			phydev_err(phydev, "invalid CLKOUT frequency %u\n",
				   frequency);
			return -EINVAL;
		}

		priv->clk_out_125m = true;
        }


	Andrew

