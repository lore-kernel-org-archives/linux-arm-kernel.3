Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A70D10A88C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoPRntc725ITLfGgqIRFU6DPMCxT8aSkgEEY7vmF7eg=; b=BackaEzDmTBNjj6q9NEr0T10dJ
	W+U+NfbFTEOFx+jIj7MD1KMEQRQIYpRToHNKLSturO/naY27ntVMDaF/G1UYalcObTM/BJQt6rtR6
	01KjIqvUZ8vItTLsfDf8GwzLHiU6oNO2Mc2Lj738WlQFgb1Pi357u5kggdeX7KL2lpE7X6oK+dw/A
	7h5hck8xGdhOXFvVcd6U/210Nj7QaNoP3VMJws0qC0L6FjupX4605coW4530tC6nLrwpGZO/7oiRl
	ehVjWBlVm2fUU73GRNM9IlifrNSELgPo0bSk4wbDZ+Rv90uZcFeDkzc8WE8w4kNMUeiYKGnaW4clI
	GrfqmbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mP8-00000005ivi-0bfL;
	Thu, 26 Mar 2026 15:13:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mP3-00000005iuQ-3cVk;
	Thu, 26 Mar 2026 15:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yoPRntc725ITLfGgqIRFU6DPMCxT8aSkgEEY7vmF7eg=; b=YLuLyUr8vwasLtKLoNTx842J2L
	DhoPufecckhHL/YoiQgqmGbZCRWCvKeV24NjWI7pYFZwZsDGZBiRA4UpzU49fcoy3XNe0euSq3tdN
	gE7dWwfeZonPegJJaBCEUJDmwLzVmkP0OHVOIqgJ6i/FaFXxvCGlqeibMl1HmdsII+JSv2p6ITqbh
	qPxOJpvQvkfRVF2dEKefl3xUDKA/ZletVCC1uOd7MnuVPgC8ZNG8BsW2GT8ruQPTTzPvncwXEeoi9
	UW5BD91NMIR1pS58nMn+HLqZ94G/wyUrU49tO1VSwZz7TGqWqg/7H4fOif1pmLUuMxO7TUZVqFxgN
	rX6aIMZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57924)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5mOh-000000004vM-3Dlj;
	Thu, 26 Mar 2026 15:13:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5mOd-0000000077d-3cH2;
	Thu, 26 Mar 2026 15:13:19 +0000
Date: Thu, 26 Mar 2026 15:13:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
Message-ID: <acVND6DdpM9czIwU@shell.armlinux.org.uk>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
 <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_081346_206024_637A66DE 
X-CRM114-Status: GOOD (  11.38  )
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

On Thu, Mar 26, 2026 at 01:04:15PM +0100, Louis-Alexis Eyraud wrote:
> +static int an8801r_set_wol(struct phy_device *phydev,
> +			   struct ethtool_wolinfo *wol)
> +{
> +	struct net_device *attach_dev = phydev->attached_dev;
> +	const unsigned char *macaddr = attach_dev->dev_addr;

This isn't a criticism for this patch, but a discussion point for
phylib itself.

It occurs to me that there's a weakness in the phylib interface for WoL,
specifically when WoL is enabled at the PHY, but someone then changes
the interface's MAC address - there doesn't seem to be a way for the
address programmed into the PHY to be updated. Should there be?

Do we instead expect users to disable WoL before changing the MAC for
a network interface?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

