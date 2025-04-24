Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DDBC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7E0igRN0goWZT53emNsgMknLEdpCU0Z3PHf0cpn4M4=; b=K+Vne0PTnv+KhMDuSTwdXNArPn
	lE2Qmb9mFJdAa7KWdSIOdQWemQst57r+DxBw6HUTTwmxN8ghjQZWAi0MSaF2xgiu87ppANblQuvOf
	51CLXwahIO+m/uHX94oht7lv+7v/9Kiu6NrqxOAgMjNRXkm+kGK8pw1T4VS0gRTPNBwRtUXcaok1L
	lPW3FGT0fOPowrrP8Qwlkt7y285q33CYpzTDlBJ1cQkln4qNcf8WNdTwKdmtG1UUVbopOdgIgEfiY
	gIymg+aIa5Dzy1n3S8TAGRCGkAQ1Cnk+jS4QxUe+EqytGLC8n8o2U2Mc3H3ucYQyEJMsfNycnDvk+
	dF1/c3SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3Z-0000000EacP-2NKf;
	Thu, 24 Apr 2025 16:04:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vkg-0000000E2yA-35xo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=R7E0igRN0goWZT53emNsgMknLEdpCU0Z3PHf0cpn4M4=; b=M34qZugqYq7x6S26YtmcPCqPio
	KuZCRgcANW1O/zmu9txnWc/YLvQN/nqtoLgXeJd4f+LegtaBStGFX/csqPrJVBh12ei7nywbk6UXg
	fbRBYUKIqedh4axwO40A94m7GYV3fU2H/6tBF+D80hFG4I9Q8n8zHX2y/jEdmztulzaEfyWhugqsL
	AX6GZ23Abwl1o+To2QruXtMYavNx3xHhZZ1beN/SoG+ZMHy3u/s1BPzmihD+53DIi4zdAdYmdAhbZ
	2M6mCZFbF6TRkS0KhJBMX+7RS+V1AwRdvz8SyRqRjfsUjw4Hy3DUFc9f0zabaLP5+gHC3aRRGiKIQ
	n+OGfgyg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39516)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u7vkY-0007Mr-0A;
	Thu, 24 Apr 2025 13:32:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u7vkU-00015d-0J;
	Thu, 24 Apr 2025 13:32:14 +0100
Date: Thu, 24 Apr 2025 13:32:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Tien Sung Ang <tien.sung.ang@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	G Thomas Rohan <rohan.g.thomas@altera.com>
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: Refactor VLAN implementation
Message-ID: <aAovTY6Q-4S__0Mh@shell.armlinux.org.uk>
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-2-boon.khai.ng@altera.com>
 <43ef6713-9ae1-468c-bc43-2c7e463e04f4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43ef6713-9ae1-468c-bc43-2c7e463e04f4@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_053226_774560_E6BAFB45 
X-CRM114-Status: GOOD (  24.21  )
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

On Thu, Apr 24, 2025 at 02:04:04PM +0200, Paolo Abeni wrote:
> On 4/21/25 6:29 PM, Boon Khai Ng wrote:
> > Refactor VLAN implementation by moving common code for DWMAC4 and
> > DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> > DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> > for the VLAN ID and VLAN VALID bit field.
> > 
> > The descriptor format for VLAN is not moved to the common code due
> > to hardware-specific differences between DWMAC4 and DWXGMAC.
> > 
> > For the DWMAC4 IP, the Receive Normal Descriptor 0 (RDES0) is
> > formatted as follows:
> >     31                                                0
> >       ------------------------ -----------------------
> > RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
> >       ------------------------ -----------------------
> > 
> > For the DWXGMAC IP, the RDES0 format varies based on the
> > Tunneled Frame bit (TNP):
> > 
> > a) For Non-Tunneled Frame (TNP=0)
> > 
> >     31                                                0
> >       ------------------------ -----------------------
> > RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
> >       ------------------------ -----------------------
> > 
> > b) For Tunneled Frame (TNP=1)
> > 
> >      31                   8 7                3 2      0
> >       --------------------- ------------------ -------
> > RDES0| VNID/VSID           | Reserved         | OL2L3 |
> >       --------------------- ------------------ ------
> > 
> > The logic for handling tunneled frames is not yet implemented
> > in the dwxgmac2_wrback_get_rx_vlan_tci() function. Therefore,
> > it is prudent to maintain separate functions within their
> > respective descriptor driver files
> > (dwxgmac2_descs.c and dwmac4_descs.c).
> > 
> > Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> 
> This patch does IMHO too many things together, and should be split in
> several ones, i.e.:
> - just moving the code in a separate file
> - rename functions and simbols.
> - other random changes...
> 
> > -	ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> > -				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> > -				 1000, 500000);
> > -	if (ret) {
> > -		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> > -		return -EBUSY;
> > -	}
> 
> > +	for (i = 0; i < timeout; i++) {
> > +		val = readl(ioaddr + VLAN_TAG);
> > +		if (!(val & VLAN_TAG_CTRL_OB))
> > +			return 0;
> > +		udelay(1);
> > +	}
> > +
> > +	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> > +
> > +	return -EBUSY;
> 
> ... like the above on (which looks unnecessary?!?)

Also looks like a backward step, because we ask people to use the helper
macros where possible.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

