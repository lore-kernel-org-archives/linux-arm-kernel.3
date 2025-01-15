Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A770C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5HzedHrDTTaaYhW4c4vjlkU8W6+KNnjRLtnJ7FWDig=; b=27Wdb6MugVxyRGINymxEjJMWwf
	2rufo3Iene0eZN/pIIWGC/oCtOE5FLriqFJZVF3LutAAe3Afi7Hm+P4oelL/nZWqeuZMXKDiUlai/
	Y2DsDhhsh2wOuEt06KsH+tZB0fKGalNSWehkLvmslJcjHpfHcu2G6msugmWwETgjlAnKu9Bot35PC
	RqBkNV0EePHftDAwa6nKcXf7WHTDWOGwijODHem4WBFoTBxHbrtzc04rMRizIcpkPt42Z8oLJI/b6
	9+sOqHNEefJW5EaYaskBMFwPG6q4Bjc6UHaVLtW1a2fSwyCno4gd5QMIprkDSTICPNCnrLrJ+E5IX
	lhaPA8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4nh-0000000CCBU-3VtO;
	Wed, 15 Jan 2025 14:55:21 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4mQ-0000000CC3c-0prL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:54:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42FD420007;
	Wed, 15 Jan 2025 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736952837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5HzedHrDTTaaYhW4c4vjlkU8W6+KNnjRLtnJ7FWDig=;
	b=O7Sa1k/bt4nVGHriNYjerugIhcrT6/4qoUmwt0nufvXWFJ0XoYacyu2lg1IYfE8wX7Bu+G
	W6u81AHHSIj+ToXo849sJQBQtCuU1LCh/YEmGB17dubCFOBDFyAzq0j+7oCuTghMMAi1k0
	frCjkp8x88ZXzRPlKUU2dD3kIcg9Vvrr9oxBZO6++rOdLwrXejmgQes2HJy4CROUk5Co54
	NwYk4Y3Muq0uhV1a70EoamSEZynuayFfa1z/Yg6+67UENHzS6n93Wakae4bZGZ/REU+NJG
	+ke/eejMCpTCGV18rORimootvxuBCANSIXH7DYqIiiSaokT/o//9vNuFVUbKrQ==
Date: Wed, 15 Jan 2025 15:53:54 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Bryan Whitehead <bryan.whitehead@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Marcin Wojtas
 <marcin.s.wojtas@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, UNGLinuxDriver@microchip.com, Vladimir Oltean
 <olteanv@gmail.com>
Subject: Re: [PATCH RFC net-next 06/10] net: mvpp2: add EEE implementation
Message-ID: <20250115155354.0acdacc7@fedora.home>
In-Reply-To: <E1tXhUz-000n0k-IY@rmk-PC.armlinux.org.uk>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
	<E1tXhUz-000n0k-IY@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_065402_369450_20274D76 
X-CRM114-Status: GOOD (  16.02  )
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

Hello Russell,

On Tue, 14 Jan 2025 14:02:29 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Add EEE support for mvpp2, using phylink's EEE implementation, which
> means we just need to implement the two methods for LPI control, and
> with the initial configuration. Only SGMII mode is supported, so only
> 100M and 1G speeds.
> 
> Disabling LPI requires clearing a single bit. Enabling LPI needs a full
> configuration of several values, as the timer values are dependent on
> the MAC operating speed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> --
> v3: split LPI timer limit and validation into separate patches
> ---
>  drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  5 ++
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 86 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
> 
> diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> index 9e02e4367bec..364d038da7ea 100644
> --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> @@ -481,6 +481,11 @@
>  #define MVPP22_GMAC_INT_SUM_MASK		0xa4
>  #define     MVPP22_GMAC_INT_SUM_MASK_LINK_STAT	BIT(1)
>  #define	    MVPP22_GMAC_INT_SUM_MASK_PTP	BIT(2)
> +#define MVPP2_GMAC_LPI_CTRL0			0xc0
> +#define     MVPP2_GMAC_LPI_CTRL0_TS_MASK	GENMASK(8, 8)

I think this should be GENMASK(15, 8) :)

The rest looks good to me,

Thanks,

Maxime

