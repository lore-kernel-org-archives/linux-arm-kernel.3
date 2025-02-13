Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5575C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KV5C98I/LRqywPZKUBEyHWkSBV5mfoVaexgU2HkSRYY=; b=fz+aQmf1fbpFwfBmEC0aRjWK1J
	IbhaDh352BCjPvFzowNatxkQXkFZt1aCGLAINYSpQ/ANSk7gtBax3BQCya28qxjeucPcoIKT9Io2k
	6dJBUEi3/AaAcNt2TPs/vg8KO9uDA9gd9kphAtB/pNbDTxKxZfeWrhnUCdFbt+3CCrvKcBlFgwWaD
	U6+VYSa/kVE8LpiLTbQvyMc+VyWJcu1gFIue3XeEd7aoyCXDBwl8lQUsnZictJJISmLKdYcyyJg8f
	FHNs/Yok8O56BhOKKp4m4xGhUwG5PkM+3JQqq2JJzMiMkEe7vKbRL2zT9DsIWASB+AorywWUIsx1K
	HbIL4h7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVPP-0000000ARF1-3r40;
	Thu, 13 Feb 2025 09:21:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVFP-0000000AOho-3FO9;
	Thu, 13 Feb 2025 09:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KV5C98I/LRqywPZKUBEyHWkSBV5mfoVaexgU2HkSRYY=; b=FHKPeciZuEcM5wkuV85GDTvkeB
	de68VNbqN90ENT8s2DIP+ji5goQOWCDVknZRxBG15appf1F0LAR/UzARWezSkdzyEOLAN9GWjAX9a
	AozPbDPm4XZ2UnoEG/uEIiwQVt4+wHYevtV9wAU9hEnhGYXKKEI9lUvXfWzyYFb0SYNQ9OWFwmyAv
	HJVJty0Ea/yyFw7+VvapEmG0Y1ML5mSHNPlB0e85RGmhC8U0V24500NtlGzE1+4neViZVoSHhwd8D
	If330fBza54lqvfUfxO/rAwGfipdI0WFzBjZOtzOQxMem9mQVt6OxuVPeiIB4O64hBtH3wba4w0LA
	Z7mckHBw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60554)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tiVFF-0000VT-0J;
	Thu, 13 Feb 2025 09:10:54 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tiVFB-00021H-16;
	Thu, 13 Feb 2025 09:10:49 +0000
Date: Thu, 13 Feb 2025 09:10:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Qingfang Deng <dqfext@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next v2] net: ethernet: mediatek: add EEE support
Message-ID: <Z623GQHI_FHyDyjE@shell.armlinux.org.uk>
References: <20250210125246.1950142-1-dqfext@gmail.com>
 <a42ec2d4-2e4f-4d1d-b204-b637c1106690@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a42ec2d4-2e4f-4d1d-b204-b637c1106690@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_011103_808662_632F142E 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, Feb 13, 2025 at 10:04:50AM +0100, Paolo Abeni wrote:
> On 2/10/25 1:52 PM, Qingfang Deng wrote:
> > Add EEE support to MediaTek SoC Ethernet. The register fields are
> > similar to the ones in MT7531, except that the LPI threshold is in
> > milliseconds.
> > 
> > Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> 
> @Felix, @Sean, @Lorenzo: could you please have a look?

That would be a waste of time, because it's implementing the "old way"
including using phy_init_eee() which Andrew wants to get rid of. It
should be using phylink's EEE management.

The patches for the mt753x driver converting that over have now been
apparently merged last night according to patchwork into net-next, but
something's gone wrong because there's no updates to the git trees
on korg,

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

