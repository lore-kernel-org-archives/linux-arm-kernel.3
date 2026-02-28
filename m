Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7605FEE4F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WSC+x8uVZHs33FUD0D+hzb2u7fJBpKzmuTeHd4PpGc=; b=joBKqVIFg0AlkH8L3UVb3AZyq0
	H2wixObMAEyx+MYxFlguNVXdSZbtVjW/XzdahtcbUPQe34vFCj7+yXraofUS7f0j7APGXTT8wALKQ
	pur88WMw/2bDakuAToot1Ugq8tL46h9Zn4vmzobRkm464C9hHhea82Q3xceVRCshF2CfqN5PA6bCQ
	vIBYw510cbVeepA/Kgwt//aT6w4Kb9K66+MZofQb5mtjHG08AQyXC59EGsXcLGhfl2P/YrmVVW0aK
	X7ZjeUKMgwcELs4MKjfzl6I4rkxrYtUjdZk+LrwsUVtGtk63rMthUNZh5H4DLIqhPdBS+D7ihpoJ2
	5cHAbk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwNDn-0000000A3RR-2Rqt;
	Sat, 28 Feb 2026 16:31:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwNDm-0000000A3RD-1OwL;
	Sat, 28 Feb 2026 16:31:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B7CD600CB;
	Sat, 28 Feb 2026 16:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818F0C116D0;
	Sat, 28 Feb 2026 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772296273;
	bh=nT2o6uADu1l9was26u2c5s17fQJ4nx20mIidrP/gZI4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p+YPb6ttQ6QDD9awfMfrizt7DNQtdRhfQkE38+s34ZDF/Tb7oKq1yGHoUU4NHwH1z
	 XTdf58qtRQ9sn2EGxvAzzK2mvu59VEQzYM+vrXrq2bDMMfKFq2AxK3HJavAVWsCqLJ
	 ROhc2MGrzX2RKFbzMj/iH8HnGEywkIKDyIP1pTAWvuEWJWExxGjma3aLSU8T3SGBMf
	 vrA/jjKFj5l6RUobRqeY01LDJt3tKB5lLWTozwgfK71REtg980NbVjcwuK3O86AaoS
	 MR5ybCFQv5gZZphy/a5gk4wYeRe8b6oc/2sHJAdHXorD3PhbsnlCkdH+8Wa3prueqO
	 IXAcB158q1qqQ==
Date: Sat, 28 Feb 2026 08:31:11 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260228083111.5df8550c@kernel.org>
In-Reply-To: <20260227165556.5cf9e844@kernel.org>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
	<aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
	<20260227165556.5cf9e844@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > The AI review for patch 7 says:
> > 
> >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> >   .set_mode() and .validate() methods") by making phy_power_on() call
> >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> >   before attempting calibration.
> > 
> >   Should this commit include:
> > 
> >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > 
> > which is _wrong_, this isn't a bug fix.  
> 
> Yes, that's what I thought but then I saw the other thread..

Trying to apply this now but stmmac parts don't apply on Linus's tree,
and Vinod wants a tag :( What do we do? 

Could you, perhaps, send us a PR with this on top of Linus's tree 
(a resolution of the inevitable conflict with net-next would be helpful
too).

Or do we give up on the tag?

