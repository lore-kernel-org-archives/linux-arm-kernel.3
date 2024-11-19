Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27E4D4415D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KfrneJwcEYheNMfrfNjo9ZS+UmR5Cm/dBZt4GtnUto=; b=CzPl5Vxm9fLrLvFu7i3MX41SZL
	hIuW2tIwZ1ZSOHkOqak4JUcXZo2egLk4+DMt1kBrV9el8V4XeOGnHDaprxoz7+YsQ2OVCOs52sh/Z
	w/u+iuD0zIvPdjAoORfOt81yqdQNsnF95rtF3Zt5GllYXpaK0Va7iqoXng1oQEzvIcbEXAD2pqvBd
	h2+qE5FuGqDDg5yQWCgNQqOoEb0NmwyD/TuLt0xlCunjqRNVbJdvk4Wj0aWBNtcoZNtz10Pls9KwA
	xotcogJidscX9UZUXRNuEZMUcxTGVamp2Zw0SLKJuqdmItezXE3W+vH4zG8FWHqkGeUdyWvhB+Yai
	aRURttiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDO9P-0000000CUTp-3fgR;
	Tue, 19 Nov 2024 13:20:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDO8T-0000000CUKL-0Qww
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1KfrneJwcEYheNMfrfNjo9ZS+UmR5Cm/dBZt4GtnUto=; b=Yuo+S+ABzgWzxo66fZkvUu6o27
	vfWE9FjKlYV+KJ8wcwM7CebRfvCMx7OARYV8OdeXQavI+GSleh17Vu3BiH1aJQDg9HYMutx4QxydA
	x8YYT4e4um83vyek8UCkxqm0MKotYh/If+v/TadtBVchaqBqNjZ7F4UpO4iMdQ+itOG9kou99WkT5
	8+Sudruhf7TBRjsVtyaqMYTn4OQWENzMYAAfVbGP+KKSgydLanki238hkjHHo7/0ZmNYhv9aC8Jht
	Wy2vsk4WBAYk5DeDwse5jm5kepiHqpr1AGiOKAFjS9iRM1AkF7LnrZF7dmVix9kCeFKuLtXGss+Pa
	XZsl+D4A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38246)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDO8B-0003a0-2D;
	Tue, 19 Nov 2024 13:19:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDO89-00065G-0t;
	Tue, 19 Nov 2024 13:18:57 +0000
Date: Tue, 19 Nov 2024 13:18:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Message-ID: <ZzyQQV4qM_fTrpMf@shell.armlinux.org.uk>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
 <Zztml-Te38P3M7cM@shell.armlinux.org.uk>
 <BL3PR12MB65716077E66F2141CC618DD9C9202@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB65716077E66F2141CC618DD9C9202@BL3PR12MB6571.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_051917_427310_19CB6C7E 
X-CRM114-Status: GOOD (  25.36  )
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

On Tue, Nov 19, 2024 at 10:28:48AM +0000, Gupta, Suraj wrote:
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > 
> > On Mon, Nov 18, 2024 at 11:00:22AM -0500, Sean Anderson wrote:
> > > On 11/18/24 10:56, Russell King (Oracle) wrote:
> > > > On Mon, Nov 18, 2024 at 01:48:22PM +0530, Suraj Gupta wrote:
> > > >> Add AXI 2.5G MAC support, which is an incremental speed upgrade of
> > > >> AXI 1G MAC and supports 2.5G speed only. "max-speed" DT property is
> > > >> used in driver to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
> > > >> If max-speed property is missing, 1G is assumed to support backward
> > > >> compatibility.
> > > >>
> > > >> Co-developed-by: Harini Katakam <harini.katakam@amd.com>
> > > >> Signed-off-by: Harini Katakam <harini.katakam@amd.com>
> > > >> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> > > >> ---
> > > >
> > > > ...
> > > >
> > > >> -  lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE |
> > MAC_ASYM_PAUSE |
> > > >> -          MAC_10FD | MAC_100FD | MAC_1000FD;
> > > >> +  lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE |
> > > >> + MAC_ASYM_PAUSE;
> > > >> +
> > > >> +  /* Set MAC capabilities based on MAC type */  if (lp->max_speed
> > > >> + == SPEED_1000)
> > > >> +          lp->phylink_config.mac_capabilities |= MAC_10FD |
> > > >> + MAC_100FD | MAC_1000FD;  else
> > > >> +          lp->phylink_config.mac_capabilities |= MAC_2500FD;
> > > >
> > > > The MAC can only operate at (10M, 100M, 1G) _or_ 2.5G ?
> > >
> > > It's a PCS limitation. It either does (1000Base-X and/or SGMII) OR
> > > (2500Base-X). The MAC itself doesn't have this limitation AFAIK.
> > 
> > That means the patch is definitely wrong, and the proposed DT change is also
> > wrong.
> > 
> > If it's a limitation of the PCS, that limitation should be applied via the PCS's
> > .pcs_validate() method, not at the MAC level.
> > 
> As mentioned in IP PG (https://docs.amd.com/r/en-US/pg051-tri-mode-eth-mac/Ethernet-Overview#:~:text=Typical%20Ethernet%20Architecture-,MAC,-For%2010/100), it's limitation in MAC also.

I'm not reading it as a limitation of the MAC.

The limitation stated there is that internal mode (GMII) is only
supported for 2.5Gbps speeds. At 2.5Gbps speeds, the clock rate is
increased from 125MHz to 312.5MHz (which makes it non-compliant
with 802.3-2008, because that version doesn't define 2.5Gbps speeds.)

So long as the clock rate and interface can be safely switched, I
don't see any reason to restrict the MAC itself to be either
10/100/1G _or_ 2.5G.

Note that 2.5G will only become available if it is supported by one
of the supported interface modes (e.g. 2500base-X). If the supported
interface modes do not include a mode that supports >1G, then 2.5G
won't be available even if MAC_2500FD is set in mac_capabilities.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

