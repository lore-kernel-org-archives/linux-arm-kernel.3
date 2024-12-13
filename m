Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECC0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bQC/f+ngK7vY3gU8HjH2GhzMwPXvxLIwJFxXKAK+bs=; b=h3LxJnvVBykEnWMqZ9Qy4tjNea
	yR8gdC8rJNWze2faVealdQMHPqDgn3lLk3CO6bP3R+S8AuABRhFwnOZE74z3Ig6TgJ5XIV6eKKJJ7
	VOf9VZDa/Dy7k4vvcGKrNUIQ164Al4iY5phA/vwhuw9vUH+8FNgEaQO3hak57TV0L0f7x8Gy6fQyl
	WvL98J6DcX9rKM+Yl37vAK+793pZMxoDZ2Wo58ARGRnNwQmwm59fzZKy2PY8dNZghhlumSxr9pS/l
	zaY4lFX/2yg+NdWaXdvX/YQsozsQdDW2bqXixdgBlHN0JeQ64k9dP/2abSoEFIZKPNenywhnsM5FP
	DDvsEL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBgu-00000004sfX-1eMD;
	Fri, 13 Dec 2024 19:51:12 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBf1-00000004sL1-3PgX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5bQC/f+ngK7vY3gU8HjH2GhzMwPXvxLIwJFxXKAK+bs=; b=cz/DjlHrD9RTa7cCUxkRhWc2nY
	Lo9TtOlrd+CFq/Mpp6bbCjaH+TjXXnH4CxrzWK3JcN5txeQt5rhp+BdH9g6OqtZ04g3NfvEpu9G4m
	S0w7wmw219AvKvke1HZ6PS/pvq9LuGZpDXaPI1s4dnBv5UoPxAlYWX6dzS4uMa8F8HnhOD7W134u9
	bhtcSDXD36xo4Khf+PRPip+aHzuJI1nhbekvdshp6yulVg/Dc6T6gxmieQb4KCyfKh50VIaC9L7yV
	aYIO7Sb24mKsWE/oOCRTa1U2wNqOjCa57JEZBXpYIctIxfLARqW3iscilWSLccBrjg9l+Hintxo1T
	e0uRDsvg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54006)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tMBen-0007GK-0O;
	Fri, 13 Dec 2024 19:49:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tMBel-0006Z0-1j;
	Fri, 13 Dec 2024 19:48:59 +0000
Date: Fri, 13 Dec 2024 19:48:59 +0000
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
	linux-arm-kernel@lists.infradead.org, robert.marko@sartura.hr
Subject: Re: [PATCH net-next v4 6/9] net: sparx5: verify RGMII speeds
Message-ID: <Z1yPq6OEziTNjWHK@shell.armlinux.org.uk>
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
 <20241213-sparx5-lan969x-switch-driver-4-v4-6-d1a72c9c4714@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-sparx5-lan969x-switch-driver-4-v4-6-d1a72c9c4714@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_114915_847923_BE4DB2A4 
X-CRM114-Status: GOOD (  10.78  )
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

On Fri, Dec 13, 2024 at 02:41:05PM +0100, Daniel Machon wrote:
> When doing a port config, we verify the port speed against the PHY mode
> and supported speeds of that PHY mode. Add checks for the four RGMII phy
> modes: RGMII, RGMII_ID, RGMII_TXID and RGMII_RXID.
> 
> Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
> Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

You do realise that phylink knows what speeds each interface supports
(see phylink_get_capabilities()) and restricts the media advertisement
to ensure that ethtool link modes that can't be supported by the MAC
capabilities and set of interfaces that would be used are not
advertised.

This should mean none of your verification ever triggers. If it does,
then I'd like to know about it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

