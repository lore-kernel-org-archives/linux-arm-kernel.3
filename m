Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955DEC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2zIMHrDMq/1rVu7mSYz5FdoQpd9TCLFKHxSveT/LnM=; b=K8/Qi/JBFS4RJxlnbxIFKuNXqC
	1jM2nRM4ZgxW+rvvxDKW6kUAkUUbtTFI9crcJh3kWb1dLDbOIsRa2HWRjVWS+Ynm9axT+n0yDVcXu
	OU/PDnXlSUZ0s2GQGPTQ0cv5tMlRxz4qXB1i9f1WQSY0SvsMWCUrrbNRflcy5xnJkHUKsQ7MNuJoq
	lUXrVRt93T7+P6zAK0Oh29IEqsy/cLKPxUaFcQ3FnxDrKvXzFMOOGUvMiGENRQgWxpR7+J3rotzOV
	lnE2UE9msSzxgsdfKjiXLW+B4dkViVrF6fLo2b55kfyez4mDdtgCqJHflTeKIoCtotAzIscLDYzHy
	8gWHOP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Nh6-00000002wyp-3dZd;
	Mon, 14 Apr 2025 17:34:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4NdQ-00000002wMe-2Nru
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 17:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=p2zIMHrDMq/1rVu7mSYz5FdoQpd9TCLFKHxSveT/LnM=; b=uiQtc286DG+TEz1K2TajQcfXO3
	aQ0Y9O0hmoN5pCPsCMlbmDgwvhULDn5VvCjNv1LLl1N/SIYOowrisvGqF03MaajJguqGvyX9mrfMl
	GOolssWUjGb+kAbkALZ2H5E00Z30Hu9ZfS0Y7kzSADc+y/wW9dmsnwzOabuIRQv0L1p8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4NdM-009Eyo-Ic; Mon, 14 Apr 2025 19:30:12 +0200
Date: Mon, 14 Apr 2025 19:30:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: ingenic: convert to
 stmmac_pltfr_pm_ops
Message-ID: <df7dfb2e-ac3b-4d27-b7a1-2a36e2ee4567@lunn.ch>
References: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
 <E1u4M5N-000YGD-5i@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u4M5N-000YGD-5i@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_103016_609054_A0FD8311 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Apr 14, 2025 at 04:51:01PM +0100, Russell King (Oracle) wrote:
> Convert the Ingenic glue driver to use the generic stmmac platform
> power management operations.
> 
> In order to do this, we need to make ingenic_mac_init() arguments
> compatible with plat_dat->init() by adding a plat_dat member to struct
> ingenic_mac. This allows the custom suspend/resume operations to be
> removed, and the PM ops pointer replaced with stmmac_pltfr_pm_ops.
> 
> This will adds runtime PM and noirq suspend/resume ops to this driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

