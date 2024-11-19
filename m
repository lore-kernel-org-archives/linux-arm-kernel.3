Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335F4D6C291
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 20:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M75wr+RtGR69btb4zt6e59/ZF6kWZbGMj4HSvNiWvzU=; b=acdcNekAYk36ht4c1EGk4XCIhc
	mPu1Lm+R5UwUZ76R3vbsSm96EFsSAEiv+YFkPQ5MREHKdrziaHWhDBUdGKYk10J7wK4mjpnyoNXFL
	LTry9hT409ORqJhk9dxoIOWgEM81H0/E6r28445tpTT7NyJbwTLzSHMAXt8MxwVGGI0NkmpVGhumr
	VroyCzzaDAHYyOt3wpoyCgdNWeJGR6GmLZoh+UBE7GdqZSv5XJL+zQs8xbUaLLAs+nmBQ2sR9wYa7
	pQ4/prdKFN6WWC62FZSk+MSfjK5reGCkU1+WI58q06Q1cfLwf5bsV/g3+EJoKbXcSiwITi2yYb12o
	bWbLTTvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUXf-0000000DeCJ-40No;
	Tue, 19 Nov 2024 20:09:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDUWj-0000000De3X-0YBY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 20:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M75wr+RtGR69btb4zt6e59/ZF6kWZbGMj4HSvNiWvzU=; b=f+e0gTq0vLIOgdCVVAy5MBA56G
	+oGx3wA072dSyK4Tp5LcqUgRzQqPHkpyv2Ma2mhVdCMwwmodTIXnF+NmETti+7WSnr40jH2PQ/NlJ
	2QscEibO6cdC85nZidaoFHBUUCGrULKLM/81tcA2qEFsUdEtQchnrISF6aXgfZLGIR6PB9eEm8Gmr
	wHiGc1xZv4/K4nCGZbdxRLpfegEGXYrRDGuILdFwJkJpTKRsjop4b/NxfGf4iBAuJTTHDKxp/gei9
	dl/PXC4Q0FJfSZkgY/3FgqF8XF2X5KkyiHcz1ng9VcDwHEljCqW5wjdVWANPgcWIHx4l7vTqoH9qS
	IXAhD9zQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38454)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDUWO-0004Ky-2Z;
	Tue, 19 Nov 2024 20:08:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDUWM-0006KU-05;
	Tue, 19 Nov 2024 20:08:22 +0000
Date: Tue, 19 Nov 2024 20:08:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	jacob.e.keller@intel.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/8] net: sparx5: use
 phy_interface_mode_is_rgmii()
Message-ID: <ZzzwNci1cHqsfHm4@shell.armlinux.org.uk>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
 <20241118-sparx5-lan969x-switch-driver-4-v3-4-3cefee5e7e3a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-sparx5-lan969x-switch-driver-4-v3-4-3cefee5e7e3a@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_120845_166622_63B60998 
X-CRM114-Status: GOOD (  13.65  )
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

On Mon, Nov 18, 2024 at 02:00:50PM +0100, Daniel Machon wrote:
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
> index f8562c1a894d..cb55e05e5611 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
> @@ -32,6 +32,9 @@ sparx5_phylink_mac_select_pcs(struct phylink_config *config,
>  {
>  	struct sparx5_port *port = netdev_priv(to_net_dev(config->dev));
>  
> +	if (phy_interface_mode_is_rgmii(interface))
> +		return NULL;
> +
>  	return &port->phylink_pcs;

Maybe turn this into positive logic - return the PCS only when the
interface mode requires the PCS?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

