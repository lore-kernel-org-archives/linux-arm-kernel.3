Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E95CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 23:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ScJmt+/0Os57nukiGynVFNomd71ekgTNx8UM6wvsiM=; b=ABP2Oq+kzCuZH6zwRJR5gMTOSs
	39V1wDA6SQxq/rNt73LQn7JD+0mXeQjpQTax9cSVXS1zFddM6JcEf5QHoJjMfgpWNszU06kdxV39S
	qx7uRtJQcUvGFZf1QxcRFY1XmZ9nmWDc/dwO+XDfkX7prZ4xl/5LcfNZpFO9i7JD7UKjPRiuNkuWN
	ra7R8HMnm2KU2eC4ghqHUiZx+6PfLItIMwPo3Glg03UM3MNYm9eK2RLhx5m1y/Q/Fjj3t/tkPUIK3
	HvgVNQEfEVJX9KUdJ3JgwNbch/JLUoe62YuXYRgHNaNenCHdrPn0wbq3PG0NhTYo4STikQUElCtN9
	L52q9JXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtZX-0000000Goo9-2q8K;
	Tue, 28 Oct 2025 23:57:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtZV-0000000Gonb-1aOq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 23:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+ScJmt+/0Os57nukiGynVFNomd71ekgTNx8UM6wvsiM=; b=DtBgppHxDmU/Kd/3Ruec8pBeu9
	6L3U554pxuSnq3NejqoXqHrRGkn4CGgFOyXlGnlK2d3m8IhamY8ccmOa/Weu3O3yKOFJHEUx+1Y/4
	LmIEwOegwyaAUS7t2ONwQ8gbkOo4Ol4aZP4uDJtf31ZGScnCN104FG6jGbZIRqX9wvCqtkXNQB0Dh
	t1SBNH/GoA5fPpPFsDtqTHqtyMZyEMZ/vZ39fryyZhzCP0a78gVpIMzPiDGBO+oMyndDGoWGg7V/d
	Om1WFXacBpBrjt0/M+XKNHB0TWaxBLR6z7exMpMC/BriAozJJzMvxfpNrI3fPxfRtYBLekG4RtUxP
	hqt671pg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56542)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDtZP-000000003fK-1CVt;
	Tue, 28 Oct 2025 23:57:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDtZN-000000006xv-1h3p;
	Tue, 28 Oct 2025 23:57:41 +0000
Date: Tue, 28 Oct 2025 23:57:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
Message-ID: <aQFYdRZV9CQVuqFu@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
 <20251028164257.067bdbcd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028164257.067bdbcd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_165749_443409_6A8D2EDC 
X-CRM114-Status: GOOD (  17.60  )
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

On Tue, Oct 28, 2025 at 04:42:57PM -0700, Jakub Kicinski wrote:
> On Fri, 24 Oct 2025 13:48:23 +0100 Russell King (Oracle) wrote:
> > This series cleans up hwif.c:
> > 
> > - move the reading of the version information out of stmmac_hwif_init()
> >   into its own function, stmmac_get_version(), storing the result in a
> >   new struct.
> > 
> > - simplify stmmac_get_version().
> > 
> > - read the version register once, passing it to stmmac_get_id() and
> >   stmmac_get_dev_id().
> > 
> > - move stmmac_get_id() and stmmac_get_dev_id() into
> >   stmmac_get_version()
> > 
> > - define version register fields and use FIELD_GET() to decode
> > 
> > - start tackling the big loop in stmmac_hwif_init() - provide a
> >   function, stmmac_hwif_find(), which looks up the hwif entry, thus
> >   making a much smaller loop, which improves readability of this code.
> > 
> > - change the use of '^' to '!=' when comparing the dev_id, which is
> >   what is really meant here.
> > 
> > - reorganise the test after calling stmmac_hwif_init() so that we
> >   handle the error case in the indented code, and the success case
> >   with no indent, which is the classical arrangement.
> 
> This one needs a respin (patch 6 vs your IRQ masking changes?).

Ah, I see it, rebase can cope with that, but not application. Bah.
Another week of waiting for it to be applied. :(

I'm going to start sending larger patch series...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

