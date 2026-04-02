Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC87D6AAF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUbBy1R8qutWlwjlRQhac0BmXJK/rX9BjT6Dj9HxJQQ=; b=JWLlQaCktGG3ugZibTz+hN4mwR
	ITXOt/P+jlQ35C1Re60rzusqAkfaAPbQfUgfzq1GzzHu/Z2xcNRTh3Xy928k2OYXq7wZ4Yk1s328i
	le4h40cmLrnMFpSBQyhbu4WCUiVztoOIgIs6fs91cqSZ/Br+79QHSb27CtWGA1vUgkCE202AZ/cgs
	DpR/bN8LrwKuAVh5B3h15AZDgiR0Wegz2rrTiwNs3FrSukkJ91eorVRT6V7OHFz47WXdqRBfjf3bb
	wZwRyvI7shlmbd99MFYADYImlg8KyoWb2YVORiCfdGsGNgTEuU/zJiMGMS3h/NjEOYfFWSK2T2gTI
	EtMlRFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Los-00000000aoV-2jxR;
	Thu, 02 Apr 2026 17:27:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Loq-00000000ao4-0J3G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QUbBy1R8qutWlwjlRQhac0BmXJK/rX9BjT6Dj9HxJQQ=; b=wDot2J5qtw3A6g2m333Laq2P5Y
	CbrFxolUQ2lEuAsFpcFJekG2vVb/DEVj5HBKSawTJ1zPeSE8SkDf+RJuJ/PUfke7Cjvn8Q/dA8I0C
	MjmwpTj/TS9TfEp8lT1bWI7ONKujEpViZ6lYyf3qLUKLbmEGQvgluausuLtGS8yIOI+YjO8/XaD7r
	OAaCFspJcOMXpgqp5HGEKKiMCXmkWV7zHC/tnl0mJmIdFM4gOfIILQpok75hiywGRZ4LudorzQpiH
	ZBIZyRN0TyGBfsZrrC5x3mTVF1O2KZhb6iLgvQa+Yy9IKNLtllhNZNMSdgx0eyjVI6d+Q4nPU+bZ8
	5Hh6cvPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56110)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w8Log-000000004l2-2BYS;
	Thu, 02 Apr 2026 18:26:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w8Loe-000000005wa-28B6;
	Thu, 02 Apr 2026 18:26:48 +0100
Date: Thu, 2 Apr 2026 18:26:48 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] stmmac crash/stall fixes when under memory
 pressure
Message-ID: <ac6m2E6FIu4azGj0@shell.armlinux.org.uk>
References: <20260401041929.12392-1-CFSworks@gmail.com>
 <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_102700_703354_BD46579A 
X-CRM114-Status: GOOD (  24.57  )
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

On Thu, Apr 02, 2026 at 06:16:45PM +0100, Russell King (Oracle) wrote:
> On Tue, Mar 31, 2026 at 09:19:27PM -0700, Sam Edwards wrote:
> > Hi netdev,
> > 
> > This is v4 of my series containing a pair of bugfixes for the stmmac driver's
> > receive pipeline. These issues occur when stmmac_rx_refill() does not (fully)
> > succeed, which happens more frequently when free memory is low.
> > 
> > The first patch closes Bugzilla bug #221010 [1], where stmmac_rx() can circle
> > around to a still-dirty descriptor (with a NULL buffer pointer), mistake it for
> > a filled descriptor (due to OWN=0), and attempt to dereference the buffer.
> > 
> > In testing that patch, I discovered a second issue: starvation of available RX
> > buffers causes the NIC to stop sending interrupts; if the driver stops polling,
> > it will wait indefinitely for an interrupt that will never come. (Note: the
> > first patch makes this issue more prominent -- mostly because it lets the
> > system survive long enough to exhibit it -- but doesn't *cause* it.) The second
> > patch addresses that problem as well.
> > 
> > Both patches are minimal, appropriate for stable, and designated to `net`. My
> > focus is on small, obviously-correct, easy-to-explain changes: I'll follow up
> > with another patch/series (something like [2]) for `net-next` that fixes the
> > ring in a more robust way.
> > 
> > The tx and zc paths seem to have similar low-memory bugs, to be addressed in
> > separate series.
> 
> I've tested this on my Jetson Xavier platform. One of the issues I've
> had is that running iperf3 results in the receive side stalling because
> it runs out of descriptors. However, despite the receive ring
> eventually being re-filled and the hardware appropriately prodded, it
> steadfastly refuses to restart, despite the descriptors having been
> updated.

I'll make it clear: this problem exists without your patches, so it
is not a regression.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

