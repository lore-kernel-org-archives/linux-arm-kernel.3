Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD038C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98hCqnM7PvtH1WOmu6PCfn1BDMnhpvymPcyHlxtBppg=; b=CmnMkIv0Xh7R0Y3sPMPJhiYHOl
	3ckL3NZ1H57x/7gBpp24DOtc9styqrwWPemitpR+A4XQwlAZkepi3XU3hq9e20uEqjAhRfg4TKvBf
	S66J+AttuKC4nnhZoo+0EceItGWSCF+/Tv1OT+e5D5jivTJrOqQxARrdjYm8TL4gyRTOsBNwnLUrl
	Mk9wBAEpVItEVlFay+H9FQ9FmqRS04BIPqXLV1/u2Tnx3VFCdSwVGwc+Z/bQIrKac2wks+3ar5e9O
	3oORuwphTrx/ofL22eq6SRR/BHcgm/pZ9kqp9/HFsfNIniV95y0ntUrG1f77sH+gMIZkL1X+DeMCh
	Pw0bE3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0F3-0000000B3EB-1LTh;
	Fri, 28 Feb 2025 13:17:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0CN-0000000B2h8-0ByB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 13:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=98hCqnM7PvtH1WOmu6PCfn1BDMnhpvymPcyHlxtBppg=; b=zlYoCj6pLOyE34hE3h5gS2SFIK
	RCJGF2jbyFEXUXJ6qcVFmP9+QrXW/tC8XEvP4rHVeOGo5cXXSCckCy7ldTLGJp6Os2YKM33YobwmT
	YJKjAfercPP9677cfJpruUJdD9onvYv+ZrK9iZD6S+mr2U26K12K5EpHZGv1vR9+O9ZM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1to0CD-000wqV-7Y; Fri, 28 Feb 2025 14:14:29 +0100
Date: Fri, 28 Feb 2025 14:14:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 1/5] net: stmmac: call phylink_start() and
 phylink_stop() in XDP functions
Message-ID: <7706823a-a787-4c7e-a6ac-9a4feaf76dee@lunn.ch>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRe-0057S9-6W@rmk-PC.armlinux.org.uk>
 <20250228153122.00007c75@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228153122.00007c75@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_051439_093024_FFE6B2AB 
X-CRM114-Status: GOOD (  18.85  )
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

On Fri, Feb 28, 2025 at 03:31:22PM +0800, Furong Xu wrote:
> On Thu, 27 Feb 2025 15:05:02 +0000
> "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Phylink does not permit drivers to mess with the netif carrier, as
> > this will de-synchronise phylink with the MAC driver. Moreover,
> > setting and clearing the TE and RE bits via stmmac_mac_set() in this
> > path is also wrong as the link may not be up.
> > 
> > Replace the netif_carrier_on(), netif_carrier_off() and
> > stmmac_mac_set() calls with the appropriate phylink_start() and
> > phylink_stop() calls, thereby allowing phylink to manage the netif
> > carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> > methods.
> > 
> > Note that RE should only be set after the DMA is ready to avoid the
> > receive FIFO between the MAC and DMA blocks overflowing, so
> > phylink_start() needs to be placed after DMA has been started.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
 
> XDP programs work like a charm both before and after this patch.
> 
> Tested-by: Furong Xu <0x1207@gmail.com>

Thanks for testing this.

Could you give a little details of how you actually tested it?

The issues here is, when is the link set admin up, requiring that
phylink triggers an autoneg etc.

For plain old TCP/IP, you at some point use:

ip link set eth42 up

which will cause the core to call the drivers open() method, which
then triggers phylnk.

The carrier manipulation which this code replaces seems to suggest you
can load an XDP program while the interface is admin down, and that
action of loading the program will implicitly set the carrier up.

Did you test loading an XDP program on an interface which is admin
down?

	Andrew

