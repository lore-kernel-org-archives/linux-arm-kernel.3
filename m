Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF60BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikKQhOvjTFsxhuP/UUycw802kvwD0C3mBIi4Nalcuk0=; b=IncEw9dH4+cT+hXZGi4O+1VUlA
	ZwUo4CmSnUy7VUnbuhNGBI4/RlI1OILFuvK27xDunMoNwqz4R402Jws9ccrUhz4vayEdftx7Q0mBZ
	G59xW2cXFcXu6lAi+H6SGB3jiAf6yXaJkpVhhWmAXoExao0k6P/b6nM8XNR9D38Z/yAicFEhzJBpn
	b3qiM4ARavjWYesC8gO8DJafH8R8Lgi6CzCmkSBxyYjYaT3H/m36n6CriJA0iDBASwZ7EjvLeLcPO
	XTq0941IhAWKflvyXwAcV1OxyG9hoVt4iScmwf7bZwWFZhUCdHi4t2/MtMKvTclb9Effg3sJcbS4f
	pHveEF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RBu-00000009xjM-2hn9;
	Thu, 03 Apr 2025 20:29:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RA5-00000009xL4-1o7Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 20:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ikKQhOvjTFsxhuP/UUycw802kvwD0C3mBIi4Nalcuk0=; b=UL/+KbaqYkQjwWdJ/s1IhbWwr8
	CEdOBhqCajp9OPBlHlITyxVYIfTpLVzJFHSLB4ngKCbhDcJENF9PDg4bAUbBsqreZGc9IR8fw17gY
	6hoPotAgb+LuDYkgtY4XBJ2s7ujD8aJ7EFe+hj1vhYHF5JIICVMua7rK+7fs9uQb1pnSf7WfbtkfJ
	FJJKqYBjz4c95HCzZMC6iSLYQawU7yofU1w8pDOXFmJHFqrOA4MdFi+W6XK6YZ0cfJNNq6hVdpdFI
	YQb5q0ZY+1sw9SqqiopiTBwBEmyU62Q+jyi5HwnAAqwWS63KumrPKnGMeQ5vDla8ctpoRjrec0YwT
	FHPCemxQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50296)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u0R9i-0000ts-2k;
	Thu, 03 Apr 2025 21:27:20 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u0R9e-00053J-03;
	Thu, 03 Apr 2025 21:27:14 +0100
Date: Thu, 3 Apr 2025 21:27:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>, upstream@airoha.com,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Robert Hancock <robert.hancock@calian.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC net-next PATCH 07/13] net: pcs: Add Xilinx PCS driver
Message-ID: <Z-7vIbvtjIGS5hzr@shell.armlinux.org.uk>
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250403181907.1947517-8-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403181907.1947517-8-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_132741_747961_7106715C 
X-CRM114-Status: GOOD (  15.73  )
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

On Thu, Apr 03, 2025 at 02:19:01PM -0400, Sean Anderson wrote:
> +static int xilinx_pcs_validate(struct phylink_pcs *pcs,
> +			       unsigned long *supported,
> +			       const struct phylink_link_state *state)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(xilinx_supported) = { 0 };
> +
> +	phylink_set_port_modes(xilinx_supported);
> +	phylink_set(xilinx_supported, Autoneg);
> +	phylink_set(xilinx_supported, Pause);
> +	phylink_set(xilinx_supported, Asym_Pause);
> +	switch (state->interface) {
> +	case PHY_INTERFACE_MODE_SGMII:
> +		/* Half duplex not supported */
> +		phylink_set(xilinx_supported, 10baseT_Full);
> +		phylink_set(xilinx_supported, 100baseT_Full);
> +		phylink_set(xilinx_supported, 1000baseT_Full);
> +		break;
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +		phylink_set(xilinx_supported, 1000baseX_Full);
> +		break;
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +		phylink_set(xilinx_supported, 2500baseX_Full);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	linkmode_and(supported, supported, xilinx_supported);
> +	return 0;

You can not assume that an interface mode implies any particular media.
For example, you can not assume that just because you have SGMII, that
the only supported media is BaseT. This has been a fundamental principle
in phylink's validation since day one.

Phylink documentation for the pcs_validate() callback states:

 * Validate the interface mode, and advertising's autoneg bit, removing any
 * media ethtool link modes that would not be supportable from the supported
 * mask. Phylink will propagate the changes to the advertising mask. See the
 * &struct phylink_mac_ops validate() method.

and if we look at the MAC ops validate (before it was removed):

- * Clear bits in the @supported and @state->advertising masks that
- * are not supportable by the MAC.
- *
- * Note that the PHY may be able to transform from one connection
- * technology to another, so, eg, don't clear 1000BaseX just
- * because the MAC is unable to BaseX mode. This is more about
- * clearing unsupported speeds and duplex settings. The port modes
- * should not be cleared; phylink_set_port_modes() will help with this.

PHYs can and do take SGMII and provide both BaseT and BaseX or BaseR
connections. A PCS that is not directly media facing can not dictate
the link modes.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

