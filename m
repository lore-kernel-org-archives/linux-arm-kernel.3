Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DAAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O59KnZLHiovTg73M0ZN85RlgzlPGbqBmEqXvrhttMUc=; b=OPeZ9W9RVjZlihzk4A6zoKkonx
	5ZCe69VWWhXdRzNyR7b8d8x7sWBYu2si8NwOvWN7q4ab+/ZvPeozO/Y0I7/rlikk1HHVnoPXYWvv9
	56L3+y2bIyVbFnvNa0/lnWPr+VtVldMHfHyKYlsp3lEV9JqK9xt+ntro1v51u5iPvlDlKxWVXoj9c
	0mtrg6Lo1WB+tbujW5/3UnNj5HkXmSiBqO51hgkyFrvPfduTklTdYE1OObWIRfpp0h83kwW2KpT+V
	goyCC9J9gG/qHwmefRdOLmKG2bd8LR62nBdlS4gr7bvz/4kUNZW4jPOo0WV5pCGGFaJIi6YeFiRe1
	8Jz5/7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUGF-000000002kU-21O9;
	Mon, 10 Feb 2025 13:55:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thT7p-0000000HRHu-1K9O;
	Mon, 10 Feb 2025 12:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O59KnZLHiovTg73M0ZN85RlgzlPGbqBmEqXvrhttMUc=; b=FCulMwwT/VBV5v3+qBMsFI55J7
	b51moXqXfLmADtv/ptciZ2Gc522ASRi943R6boXmbacSV9agb6T47gbTeWgKQQOmbXgOX3HYUbnuU
	2t/beNHojSmmxlD1jEomoyJx4oofpk2xhbQ5pJsbnfaZJajG4usN/LT8J+I6bBB79+X2UFAOWjBAw
	Uj5CqdeVa2qaqyNw50pRCia3+aKQPRMNcq1tnp6TkCYC66Mlc8Q9hj0VueZNWv4BuN7L4xNXzMMYH
	FXEplvE9d0WMzXoHX1Rq+tDM2CiA/7rEYG8H1LZvteu2XsP0itcGsGClsAxvrGjnPRp7uhu4Re9HB
	CZvSCC3g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1thT7f-0006rI-2K;
	Mon, 10 Feb 2025 12:42:47 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1thT7b-0007VZ-2A;
	Mon, 10 Feb 2025 12:42:43 +0000
Date: Mon, 10 Feb 2025 12:42:43 +0000
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
Message-ID: <Z6n0Qz788I_igV8M@shell.armlinux.org.uk>
References: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
 <E1tgO70-003ilF-1x@rmk-PC.armlinux.org.uk>
 <20250207151959.jab2c36oejmdhf3k@skbuf>
 <Z6Yn2jTVmbEmhPf9@shell.armlinux.org.uk>
 <20250207213823.2uofelxulqxpdtka@skbuf>
 <Z6aIGzHWdzF5Rlci@shell.armlinux.org.uk>
 <20250210123701.7gdt56l5m6t5c6ge@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210123701.7gdt56l5m6t5c6ge@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_044257_351565_2062C98F 
X-CRM114-Status: GOOD (  18.96  )
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

On Mon, Feb 10, 2025 at 02:37:01PM +0200, Vladimir Oltean wrote:
> On Fri, Feb 07, 2025 at 10:24:27PM +0000, Russell King (Oracle) wrote:
> > You may have noticed that I'm no longer putting as much effort into
> > cover messages - and this is precisely why. I honestly don't see
> > that there's any point in spending much time on cover messages anymore.
> 
> I have things to do and places to be, and I'm sure you do too, so
> I won't drag this out more than I need to. I'll just give you one
> self-contained example of what bothers me, from this very thread.
> I'm not even expecting you to change all of a sudden, I know it's hard
> and takes time and a deeper understanding of what is happening.
> 
> First of all, if "I tend not to read cover messages" isn't sarcastic
> when you've make it pretty obvious so many times that this is important
> to you, then I don't know what sarcasm is.

Sorry, but I disagree with you on this.

I'm getting tired of having to tip-toe around issues like this, I'm not
going to spend anymore time on this thread.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

