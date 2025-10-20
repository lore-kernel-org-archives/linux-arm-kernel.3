Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98782CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvR/JOCDykbUtNBkJ2YheNXEBp8e8ja99yZKcJe41jk=; b=SVgqRlYNGKyAAv/fY2k/JHpG57
	/JV3OVzSDoJRg2fECTGjK5hK2I9u1nWWp5YpCKwOc/hs4zAjb/bwTDYmdoFUCuhBpnSbtSj/J+6um
	g271Vl8DWKu+Yp5zourUGC9EROqdTYZ91vs9YI6p84TEwlOlnhdvjGWWWIHrsGcq5Pz6YNlcg7Iqt
	tGpd7/b+UH2CHYXQzOULt1oXas4uWJILTjkbOzXKYBqaouzWemNLnfwSVgzVP++FxI9lHXHOSD/0b
	kppAW4mSxI4EYSBZEW8WFl/fIjETcFyTXOlNoACvT0NdkGRa3+oA01XYcc/AnatfP5X5iP+AbWjw+
	XuK2qxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUt7-00000002D45-1DO6;
	Wed, 22 Oct 2025 09:12:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUt2-00000002D20-38tO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tvR/JOCDykbUtNBkJ2YheNXEBp8e8ja99yZKcJe41jk=; b=Rn166uEXHRAoxorCRcipzvbU/Y
	9LYEOK9yuC6IL2lh2+2j0hi6aIl1fJxE2sNKydc1xihXpchLrcP9i5vDopTNPtE1+PhuYWignc4PL
	/6YlFTFIs3+FkMKTw723y1lHHMx/rp+8d1Cig0WScb12/aNttg/tNHV2+hjX5GnOcfbo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vAuyu-00BY4z-B8; Mon, 20 Oct 2025 20:51:44 +0200
Date: Mon, 20 Oct 2025 20:51:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/3] net: phy: Add helper for fixing RGMII PHY mode
 based on internal mac delay
Message-ID: <8da7450f-ef1a-4d8f-9081-a31585e2da19@lunn.ch>
References: <20251020095500.1330057-1-inochiama@gmail.com>
 <20251020095500.1330057-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020095500.1330057-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_021204_796352_D2237146 
X-CRM114-Status: GOOD (  19.09  )
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

On Mon, Oct 20, 2025 at 05:54:58PM +0800, Inochi Amaoto wrote:
> The "phy-mode" property of devicetree indicates whether the PCB has
> delay now, which means the mac needs to modify the PHY mode based
> on whether there is an internal delay in the mac.
> 
> This modification is similar for many ethernet drivers. To simplify
> code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
> mac_rxid) to fix PHY mode based on whether mac adds internal delay.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/net/phy/phy-core.c | 43 ++++++++++++++++++++++++++++++++++++++
>  include/linux/phy.h        |  3 +++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
> index 605ca20ae192..4f258fb409da 100644
> --- a/drivers/net/phy/phy-core.c
> +++ b/drivers/net/phy/phy-core.c
> @@ -101,6 +101,49 @@ const char *phy_rate_matching_to_str(int rate_matching)
>  }
>  EXPORT_SYMBOL_GPL(phy_rate_matching_to_str);
> 
> +/**
> + * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
> + * mode based on whether mac adds internal delay
> + *
> + * @interface: The current interface mode of the port
> + * @mac_txid: True if the mac adds internal tx delay
> + * @mac_rxid: True if the mac adds internal rx delay
> + *
> + * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
> + * not apply the internal delay
> + */

I think a helper like this is a good idea. But there are a couple of
things i don't like about this implementation.

I don't like returning PHY_INTERFACE_MODE_NA on error. I would prefer
-EINVAL.  of_get_phy_mode() passed a phy_interface_t *, and returns an
errno. The same would be good here.

I find:

phy_fix_phy_mode_for_mac_delays(interface, true, false)

hard to read. You cannot see what these true/false mean. Which is Rx
and which is Tx?

Rather than true false, how about passing an
PHY_INTERFACE_MODE_RGMII_* values?

PHY_INTERFACE_MODE_RGMII_ID would indicate the MAC is doing both
delays.  PHY_INTERFACE_MODE_RGMII_RXID the MAC is implementing the RX
delay? I'm open to other ideas here.

	Andrew

