Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254F9F31E5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dd++4tKmdtMOvBBnnnoIYGKrXxRrKVRPTAqrEQXWV6w=; b=WjecMOzCYFEOid0bmhNjR0vGc2
	HAuNOoCrSM1w8CPaD/2m7Mfr9JMoP09XZKjE7vxGjZjO90SrfWd1W+xbI1AkQBrG/Y70bT0Qnoskr
	JnA15H12GjqsreEYRxY7tlJmdQztjufbI1/ggT1CHTALNmsB4uNi3/3QDlDyd1fRudGRHrpG/Z1q3
	pGFBUkopoETCtj5AxgTzvSxUGK5do56cDPoPADmrn9TA5e/kd/Y9suVJOLzhc1oiJsjMYWkzx5wN+
	lx+ArB0EKK7KeGJCwBOSqDM2YMNxbRHfwb2Ur4sllJHNJIlVgcU1iDZCEU4d/xVYWCW77bA9HQQIX
	XuFEB4MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAs47-0000000AuQh-0293;
	Thu, 09 Apr 2026 16:17:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAs45-0000000AuPc-0TAs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 16:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Dd++4tKmdtMOvBBnnnoIYGKrXxRrKVRPTAqrEQXWV6w=; b=lzseZNXAHNB8VGospEKU+WILFk
	sYd2bdEtrFdshGRKyzaYgpQpxiHtaRuC7qIiBSZ7cBGCBZEzEGvcVYdbaN3U0IndulheHaQqJLGKl
	ZijNKS80e8Sz8pi3LZDRboXSmA9X7V/c+WQAsrHljmdsGa1gMhu81vlTFO605XcSec7J+OKQXQKX3
	AmSnCO0TLxIUmPqhmJmax/aHPMXw/vptQ5efr1LG1hLyr5MAY7J/wlyRN4y6ZBVkVcKynvyLkK6Y6
	Bc8z1VVZwnTXNQXvKHCG1QqeV+pFKrmHBMNwFVy6BVChKmKlgfYbPkJHJXKY6mGOpivm9giPrIVbL
	reicNc8A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51834)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAs3z-000000003rq-3Ub9;
	Thu, 09 Apr 2026 17:17:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAs3v-000000004Ys-2ghu;
	Thu, 09 Apr 2026 17:16:59 +0100
Date: Thu, 9 Apr 2026 17:16:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-ext4@vger.kernel.org, dmaengine@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: BUG: net-next (7.0-rc6 based and later) fails to boot on Jetson
 Xavier NX
Message-ID: <adfQ-44bKs2I4FrN@shell.armlinux.org.uk>
References: <adZTGOjjJrVJOcT8@shell.armlinux.org.uk>
 <adZfTi3R6jtsjXx-@shell.armlinux.org.uk>
 <adZ9grUg71f518Fg@shell.armlinux.org.uk>
 <adZ_ZmjcE8S22vR1@shell.armlinux.org.uk>
 <3a1d0520-3402-47b2-9d7b-4e14a3cd07a4@arm.com>
 <adayAMR_dEA6W5vW@shell.armlinux.org.uk>
 <adeaiSAnkaggqPsA@willie-the-truck>
 <CAHk-=whO3F1u+nme4cnYMy5baYmb7CH=wE63dcNaPLWD0vKaew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whO3F1u+nme4cnYMy5baYmb7CH=wE63dcNaPLWD0vKaew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_091709_153421_DFCDD8EE 
X-CRM114-Status: GOOD (  13.45  )
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

On Thu, Apr 09, 2026 at 08:37:53AM -0700, Linus Torvalds wrote:
> On Thu, 9 Apr 2026 at 05:24, Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, Apr 08, 2026 at 08:52:32PM +0100, Russell King (Oracle) wrote:
> > > What's the status on the iommu fix? Is it merged into mainline yet?
> > > If it isn't already, that means net-next remains unbootable going
> > > into the merge window without manually carrying the fix locally.
> >
> > I'll pick it up for 7.0 in the iommu tree.
> 
> ... and now it's in my tree.

Thanks, I see you merged it prior to the net tree, which should mean
the fix finds its way into net-next! Yay! Double thanks for that!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

