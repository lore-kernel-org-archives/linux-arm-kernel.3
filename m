Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E298CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qNGKgnMkm6N0a34ArXOzNjX3fTe4GCYWTtnKll+z7TA=; b=lXDjX2asW7VGUe2cLJGLnhD1nj
	Vk5FI9DFcKL+lpHChiqEZDt+26vi6VTMXMD0Z5R3JK3Xk5m94vrnMjNQwBPfHkk/emUpeG/jrF0X8
	Dzi5j0vGXadJQFkH8f5CDJ71HNDCYi6Y46v8Bpe9UeKXmAg54ze41Ibq2JcXchKMmU1xQ2xZXIdLf
	qHDQZCfBx1DFiseYk4cCMnKhvtCNiQFORkUo6DsEqw0FP6eTJPYvS9J9vV0ica6tFgBJ8c1BX/Iz3
	zNwsbxud7O7JUNm1MaNLyrofSeybaEbgGIAgFLiQ4JJ51sdUxPCwuIrZctIN8OeDgWE+jW9hdL5+m
	WUBzOEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBt1O-00000005znz-2Neb;
	Thu, 23 Oct 2025 10:58:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBt1M-00000005znd-3sdB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 10:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qNGKgnMkm6N0a34ArXOzNjX3fTe4GCYWTtnKll+z7TA=; b=Vo4MIiRfyHNRUscorfDM2/WOE+
	41TOMbZ/qQpN4QtO+oFf2EFpHe03toytLAivMuDtRJF6x8M16xbeVOrA8JQl8HwymcoIzP4c4O6Jf
	NCAmA6iZQ5I6/8i/xZbPnXziAmvjlSFD974zsQ2/HEPYDv5NqJKlQO+ZhzwQcfh05YCVc750IXVm0
	3EybN0Xz1J5Hg7BMUp3kY2o+Sw54x9cx8nXnxw/Z+fnxc5i0T1zuxhvLhtmHfjUgBE5/GfIKvhyCc
	r8HPePXiy+8MBBJilicxlzwsXUqg0E5L0uuE6n89f2TKdJliV0ncU+TVqkTMHhaw3jZAvBu0nJrdL
	aJCwddtQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58128)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBt19-000000006Dh-3jCL;
	Thu, 23 Oct 2025 11:58:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBt17-000000001cq-0c85;
	Thu, 23 Oct 2025 11:58:01 +0100
Date: Thu, 23 Oct 2025 11:58:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Rohan G Thomas <rohan.g.thomas@intel.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net v3 2/3] net: stmmac: Consider Tx VLAN offload tag
 length for maxSDU
Message-ID: <aPoKOIfCGvDEIWS7@shell.armlinux.org.uk>
References: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
 <20251017-qbv-fixes-v3-2-d3a42e32646a@altera.com>
 <aPI6MEVp9WBR3nRo@shell.armlinux.org.uk>
 <ac0a8cd8-b1bc-4cdb-a199-cc92c748b84b@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac0a8cd8-b1bc-4cdb-a199-cc92c748b84b@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_035816_985989_74CFC605 
X-CRM114-Status: GOOD (  20.56  )
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

On Sat, Oct 18, 2025 at 07:36:26AM +0530, G Thomas, Rohan wrote:
> Hi Russell,
> 
> Thanks, I'll update the commit message.
> 
> On 10/17/2025 6:14 PM, Russell King (Oracle) wrote:
> > On Fri, Oct 17, 2025 at 02:11:20PM +0800, Rohan G Thomas via B4 Relay wrote:
> > > From: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > 
> > > On hardware with Tx VLAN offload enabled, add the VLAN tag length to
> > > the skb length before checking the Qbv maxSDU if Tx VLAN offload is
> > > requested for the packet. Add 4 bytes for 802.1Q tag.
> > 
> > This needs to say _why_. Please describe the problem that the current
> > code suffers from. (e.g. the packet becomes too long for the queue to
> > handle, which causes it to be dropped - which is my guess.)
> > 
> > We shouldn't be guessing the reasons behind changes.
> > 
> 
> Queue maxSDU requirement of 802.1 Qbv standard requires mac to drop
> packets that exceeds maxSDU length and maxSDU doesn't include preamble,
> destination and source address, or FCS but includes ethernet type and VLAN
> header.
> 
> On hardware with Tx VLAN offload enabled, VLAN header length is not
> included in the skb->len, when Tx VLAN offload is requested. This leads
> to incorrect length checks and allows transmission of oversized packets.
> Add the VLAN_HLEN to the skb->len before checking the Qbv maxSDU if Tx
> VLAN offload is requested for the packet.
> 
> This patch ensures that the VLAN header length (`VLAN_HLEN`) is
> accounted for in the SDU length check when VLAN offload is requested.

Please put that in the commit message, thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

