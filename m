Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FD9D60D0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 01:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhqwq7tcm/27fuNPEhxvLaIj0zcTCyFQj9NCsNSuOng=; b=s4zsr3jyrt8fH20zgdo1kkxDv2
	LEwbYIsED6W62+F+aD6IfFQ3DQBsdipkEweSCy/sXu+YL9aWSFc9SKG2UQE2pB0UBDKYJr1cluO80
	EUXZHQzQQW+KXH+eNQm13W0VzMhjwSscvU8PEu27RK2mP/oBWo0a4kfIuhwpi7ImSn6IrxDLBusME
	0pjpyuwKqcZpnvy9W8gGEd6qkh9TCFzubKqprFrb2JD3PQwozubRpsa/Y3aERWBO8qfLShdIpsbXf
	zVtHdcw5tem/AaQd0Q1tLGHYnA/L0rNrd4xDLUnSWrbtuN9D18GzLwhwxDRoDHmPK2dU1aXjzJ2/v
	tGlIbRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDAo-0000000B57a-1EbZ;
	Tue, 19 Nov 2024 01:36:58 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDD9s-0000000B50W-14KB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 01:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vhqwq7tcm/27fuNPEhxvLaIj0zcTCyFQj9NCsNSuOng=; b=zsrEApgB1Yzs0IM2FGZIAy2rO9
	0scyimONNmLRwI3Ofm3tscl5i2utIyG+0WI7BVLQvV+2Hi892nb5usgejZG/ADbJ0ByPdV2TjF0GE
	hJlwOQZCWRSaRF/k+GwWqy3ogrdgaWhnM73XAAODxSH9C4knzD/gI2H9RFbw9SA8JlIQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDD9g-00DjPP-NG; Tue, 19 Nov 2024 02:35:48 +0100
Date: Tue, 19 Nov 2024 02:35:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Suraj Gupta <suraj.gupta2@amd.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com, horms@kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, git@amd.com, harini.katakam@amd.com
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Message-ID: <9d26a588-d9ac-43c5-bedc-22cb1f0923dd@lunn.ch>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_173600_290620_2FE8BC2A 
X-CRM114-Status: GOOD (  17.56  )
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

On Mon, Nov 18, 2024 at 11:00:22AM -0500, Sean Anderson wrote:
> On 11/18/24 10:56, Russell King (Oracle) wrote:
> > On Mon, Nov 18, 2024 at 01:48:22PM +0530, Suraj Gupta wrote:
> >> Add AXI 2.5G MAC support, which is an incremental speed upgrade
> >> of AXI 1G MAC and supports 2.5G speed only. "max-speed" DT property
> >> is used in driver to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
> >> If max-speed property is missing, 1G is assumed to support backward
> >> compatibility.
> >> 
> >> Co-developed-by: Harini Katakam <harini.katakam@amd.com>
> >> Signed-off-by: Harini Katakam <harini.katakam@amd.com>
> >> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> >> ---
> > 
> > ...
> > 
> >> -	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
> >> -		MAC_10FD | MAC_100FD | MAC_1000FD;
> >> +	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
> >> +
> >> +	/* Set MAC capabilities based on MAC type */
> >> +	if (lp->max_speed == SPEED_1000)
> >> +		lp->phylink_config.mac_capabilities |= MAC_10FD | MAC_100FD | MAC_1000FD;
> >> +	else
> >> +		lp->phylink_config.mac_capabilities |= MAC_2500FD;
> > 
> > The MAC can only operate at (10M, 100M, 1G) _or_ 2.5G ?
> 
> It's a PCS limitation. It either does (1000Base-X and/or SGMII) OR
> (2500Base-X). The MAC itself doesn't have this limitation AFAIK.


And can the PCS change between these modes? It is pretty typical to
use SGMII for 10/100/1G and then swap to 2500BaseX for 2.5G.

	Andrew

