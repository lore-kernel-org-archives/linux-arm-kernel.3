Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB17C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 22:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ucl/GOWiAbFSVtfu4fuiBKlLWVdkIuebAW+pzGN/cWQ=; b=GEE8FSgXDgwz9adEbxl65FzumC
	w4XGNnObTLLLoFrCApWuGUlvYwSXC9DX/Mz4Na8KCNHaq/8c4umZZOoNFGQF+/uhlsqyuN2iRKwbq
	Jvx00cRaK3eCQjj2iNppYiaO8JnhmWrwTrYq+jdKAbF+I4GcJR7Fh8HMCnYmgyrOlQINWFRgvMCRR
	PwEdIOMqNyvulfjJdVKx1LJ952/AwF/RkkePIjg4R2dFGST9ajjAXv6D3f5ulKcv2GHOf/XEC1qT+
	+cbG+arETDGev1tWmBv12RykEhtTS2lBAPaBbYG2ZWspxj/HgMcDQTgFozbBqvjPcOE+yO8BCuV3r
	7wZW3oug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWnf-0000000BNmn-12dB;
	Fri, 07 Feb 2025 22:26:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWmG-0000000BNYO-1wJd;
	Fri, 07 Feb 2025 22:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ucl/GOWiAbFSVtfu4fuiBKlLWVdkIuebAW+pzGN/cWQ=; b=0EwlWid4ktr90Dkzk/x4n56Lde
	5e9qMNBwVHipCinIIpY8zIZrMqh0Bmp8qp3lFauwxNpRChQIKvy9nLM9KFyHFHb2HnjUUHKNnmDcj
	tSL0cz+8Y/TeVV5xuIA++gMJKOz7dK7LztAoddAl9HE5UirHc/786tEfkG3+Jb4j8Rdpx0ZeGqRLL
	qDFdVfYElp0kdtCUCAbEvB4g6L+rGp/OGFglOFUxs83jt7fliek64uHU7eQesiizQiIOInFfiI+2T
	DkXFrRa/QRSOVJBIgtHTSUdDrvuUOEOrSDovdc1eHQZwgFpmvy+wePFZo3NFLplkvfcnMLbcu48+1
	IdskfqXA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47456)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tgWm1-0007Ay-1q;
	Fri, 07 Feb 2025 22:24:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tgWlw-0004oo-0L;
	Fri, 07 Feb 2025 22:24:28 +0000
Date: Fri, 7 Feb 2025 22:24:27 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] net: dsa: allow use of phylink managed
 EEE support
Message-ID: <Z6aIGzHWdzF5Rlci@shell.armlinux.org.uk>
References: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
 <E1tgO70-003ilF-1x@rmk-PC.armlinux.org.uk>
 <20250207151959.jab2c36oejmdhf3k@skbuf>
 <Z6Yn2jTVmbEmhPf9@shell.armlinux.org.uk>
 <20250207213823.2uofelxulqxpdtka@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207213823.2uofelxulqxpdtka@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_142448_500461_147B3651 
X-CRM114-Status: GOOD (  24.91  )
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

On Fri, Feb 07, 2025 at 11:38:23PM +0200, Vladimir Oltean wrote:
> On Fri, Feb 07, 2025 at 03:33:46PM +0000, Russell King (Oracle) wrote:
> > Bah - actually I _did_ update the patch, but in a different tree:
> 
> I'm glad there's a reasonable explanation for what appears to be an
> oversight on your part, and I wish to make nothing more out of the event
> in itself.
> 
> I just want you to know that it was really hard for me, looking back in
> that thread to make sure I'm not misremembering that I asked for this
> change, to get reminded how quick you were to jump to an insulting and
> sarcastic conclusion in that same reply. It was a shit reaction and it
> really didn't sit well with me then, and it still doesn't sit any better
> re-reading it 3 weeks later either.

It was not intended to be insulting and sarcastic. It was based on a
general observation from a whole raft of patch series that has led me
to the conclusion that cover messages are basically completely ignored.

Many times, I've posed questions in cover messages... and have _never_
got a response to those questions.

I'd even started experimenting putting stuff in the cover messages to
provoke some kind of a response... and got nothing.

I had got to the point of wondering why I'm bothering to write
expansive and detailed cover messages.

Everything was pointing towards cover messages being wholesale
ignored - and it was a complete waste of time writing them.

Having got to that point, to then get asked, basically, "why are you
including this patch" when I already said in the cover message for
the _RFC_ series (requesting comments - obviously not a submission)
that the 10th patch was preparatory for DSA, and would be included
along with a user when it's submitted - that all suggested to me
that, yet again, the cover message hadn't been read.

You've said that you do read them (thanks) but I think you're probably
the only one, and I still question their value given the lack of
engagement with cover messages.

This is a serious point. What use are cover messages on patch series
beyond providing an anchor to tie a patch series to and provide a
diffstat? Given my observations over the last year, I don't think
including very much else adds any value. Certainly not asking
pertinent questions. Certainly not describing the patches in the
series. Certainly not describing the overall rationale, nor
(apparently) the plan for the patches.

You may have noticed that I'm no longer putting as much effort into
cover messages - and this is precisely why. I honestly don't see
that there's any point in spending much time on cover messages anymore.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

