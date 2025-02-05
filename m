Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6EBC02197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 16:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQmaHYcX4kSHNC5WcNtxux8lMrgIRKUaKugL4PZ1nTI=; b=ZytMc53qq9zoJqrQ08BGJDdG+q
	oLsroh5+gg16DhfL1IuFuba2T3ElNmbm9UfKWrzXe9pqTNuf51cxCA0rj1GfvBV21kV5Cq6zVWDRT
	dDJdVbuaJpsoDuc2i9Ogw8XpCAeZm7QKZuknWSyJpGHXuzAS+Wyp1v2TSwL8c/qKu5fgc6B067Z4U
	JRwHOnBdv8FkvZDrKUNQ8U5yN5GngQItJDqsSm6ZewqeFf9SvB9kGac5kcjIs6SNj/YXBnkYVRaGa
	EYbEf0nD+fntbvlmLsuSM1ocdhLue4yMy7Z2juaW5YBawA+FVzqNtibcbCcs4T4BAQ+KKBnShhUhD
	IcMHyazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhpq-00000003t4I-2oXQ;
	Wed, 05 Feb 2025 16:01:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhoS-00000003skA-2TYs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YQmaHYcX4kSHNC5WcNtxux8lMrgIRKUaKugL4PZ1nTI=; b=Q6pivajQwCs/0BR8aHjA2zgzhx
	XSLlH5hTv7B02RtMAVVWhc0AMRRbF5jEkLar2wEGpnOq8YhV4OVBXGbULrkZR6cBqDcmVC+blfQ66
	/aLTDjcz2vsW0vb9+WEiNn4TG79qsLgy5Y3R/CzqozJgG1J+kRnQnC1Quny8KFEuIjJfVNFGPjX9V
	ShIwVYQbFccDc37snxuf6t1fN5pz6+9yLNDh1tQNV4j2kXFff1uKbPyzLq+jvE65jl32nVqBAtYFV
	D0/k7YzDcFyJ8dkEFVnHdLfH2xUniqdmjMhSpHk1/VPB/qCGXPy5JdH6JPfcgOp9S7+T8sa4/UmFA
	+ZtZPljA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36620)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tfhoJ-0007bW-14;
	Wed, 05 Feb 2025 15:59:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tfhoG-0002X9-1F;
	Wed, 05 Feb 2025 15:59:28 +0000
Date: Wed, 5 Feb 2025 15:59:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Domenico Andreoli <domenico.andreoli@linux.com>
Cc: Jason Montleon <jason@montleon.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"si.yanteng@linux.dev" <si.yanteng@linux.dev>,
	"pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [REGRESSION,6.14.0-rc1]: rk_gmac-dwmac: no ethernet device shows
 up (NanoPi M4)
Message-ID: <Z6OK4PXGa_ixzQQc@shell.armlinux.org.uk>
References: <Z6CfoZtq7CBgc393@localhost>
 <INKEBRCGF47MsjO5WHpLcf1OTcQHw2KG6_Ez-K9QiTwAnb4MRVErnxoUT1euX_o9oRrxUILDRDvlOZ7ezguCU4maUyvkk-UqU52l6xLsF8U=@montleon.com>
 <Z6NEyCRHTVfnM1vf@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6NEyCRHTVfnM1vf@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_075940_627131_EC263FEC 
X-CRM114-Status: GOOD (  15.03  )
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

On Wed, Feb 05, 2025 at 12:00:24PM +0100, Domenico Andreoli wrote:
> On Wed, Feb 05, 2025 at 04:19:58AM +0000, Jason Montleon wrote:
> > On Monday, February 3rd, 2025 at 5:51 AM, Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> > > Hi,
> > >
> > > This morning I tried 6.14.0-rc1 on my NanoPi M4, the ethernet does not
> > > show up.
> > 
> > I am experiencing similar behavior on the Lichee Pi 4A with thead-dwmac. It works fine on 6.12.12 and 6.13.1, but with 6.14-rc1 I don't see these last several lines of output as in your case. I did also see the same new error:
> > +stmmaceth ffe7070000.ethernet: Can't specify Rx FIFO size
> > 
> > It looks like this message was introduced in the following commit and if I build with it reverted my ethernet interfaces work again.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/ethernet/stmicro?h=v6.14-rc1&id=8865d22656b442b8d0fb019e6acb2292b99a9c3c
> 
> Confirmed, reverting it resurrects the ethernet also for me.

This is a known issue. A revert has been submitted:

https://lore.kernel.org/r/E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

