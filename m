Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A69C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 22:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbunFVDc+z4ZNinhUozXF0DHGNkTGheh1l4/+ElGHqw=; b=muBTzyrEreSArqR0vEbMosUO6l
	K/Cgbad0h6Sjy2kypyg57p17XpGnmsqP3EXWyGOra0A8yjfG18Dsm+hSB9Dqb1aR2ky7BKyQl1jFM
	7PTLg0YL1ozKZHgG+c3LekhxEoSjUeUsJcdBrYIP2QwAqpR6G3OE3SUX5m9jiXpij/mpxqniSaj4U
	5JrL4D6ohsU8jKwqCi10d3xr6vQaGa114BG25ASD+w6VkAy8XGTQ18aCojxGTXTr1cghtbiK7e3dV
	vGxPkf3uhSewhxlx8aPhtwy+5JtrsBO+1Z6lmYHTkKUAT4b3IauakyAADuID9+oTc4B2WEpeBZwF+
	1Yu1pWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BRL-0000000B4BU-1Jlf;
	Wed, 16 Apr 2025 22:41:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BOL-0000000B3jZ-3rPe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 22:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5D516156A;
	Wed, 16 Apr 2025 22:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B09C4CEE2;
	Wed, 16 Apr 2025 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744843080;
	bh=ZbunFVDc+z4ZNinhUozXF0DHGNkTGheh1l4/+ElGHqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E/X2YL400qWMrxAg+hIq73VEMNHFiId2k2Opfic6Sq38awI1C2UzakpJejoi72Ix6
	 bLSj5m8BuF5SxVEnOcnB6EM1hmbL1KzxtBeLHUmEWg6kFnmaYj4L7ydrYFjlDwqJir
	 /IgqZ9KKrjFfb1vrZ8Y4ohZOfi9c0qwfTGAy8cBVZF9o6HSLSYZkJ+xfi3b0cyW8Ou
	 4Vwm2ZdCDo0FaBPpD917lz+B1Heb42XfFHn5C6cRh1QApEvajKczPAiK2VDTORg2Qq
	 KSXXUZEucpeut6mJS3Hh47LpSOF0TZrd+x72bTh343o5ORvUZJ1saIzQTzpaFSk412
	 LtJEDJgeWlsNA==
Date: Wed, 16 Apr 2025 15:37:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: call phylink_start() and
 phylink_stop() in XDP functions
Message-ID: <20250416153758.3f0b7dfc@kernel.org>
In-Reply-To: <Z__w52jL05YbqSTW@shell.armlinux.org.uk>
References: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
	<E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
	<20250414174342.67fe4b1d@kernel.org>
	<Z_4s5DmCPKB8SUJv@shell.armlinux.org.uk>
	<Z__w52jL05YbqSTW@shell.armlinux.org.uk>
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

On Wed, 16 Apr 2025 19:03:19 +0100 Russell King (Oracle) wrote:
> "This change will have the side effect of printing link messages to
> the kernel log, even though the physical link hasn't changed state.
> This matches the carrier state."

So I did misunderstand. I thought we lose physical link. This paragraph
looks good, then, it'd correct my guess.

