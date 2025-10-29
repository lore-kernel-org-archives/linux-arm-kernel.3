Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A71CCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 00:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8qaGiSq8vOSodTV9ZqArOMgGtWwjBiwAMF3IEA5ym8=; b=GNcSnjI3H7sORAx4RY+YIaawtS
	xgZN8kUFCAJJVjh88PNdVZY4DOwsvMpHGFA6oB69Mp+A42nY4Y8Dmr92THjNEWzKawSfh7bBffOW7
	bAN11ORWNKXtBDcFa0zm58Fegg5dES4HljkhUkxCvLfu07T++G4Fgg6akwMaj1Ks8eKqu8+3RogR9
	VeEw9TjP+9Yr9WLT7a1jyZkbGmG7S9NgCnhl69bWw1x7A3pOVrMwdBL4rap96KG3A/rvkqDQx8U/u
	iYyF8mIbItWErQ7/q14hzW1tieL08mDV59qolVxhJkARG4XW9jCeW3Vbvw8c99aEWzz//xU57naz2
	dIKz8O4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtlt-0000000Gq9L-3uH8;
	Wed, 29 Oct 2025 00:10:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtls-0000000Gq92-0RXD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 00:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F33DB44530;
	Wed, 29 Oct 2025 00:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4AFC4CEE7;
	Wed, 29 Oct 2025 00:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761696634;
	bh=fWgybk4zJ8v4uHqTzhcQSKCfyRk/m+NFcuLw6/SBDzM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zn4kwfwOegS/wt629E7r632Ghchk7SkSaKzoVi1YnCYk5rAH7oe/FBdM6821dOQNb
	 LxlB0YKKva0KpERflFyEiCVobvKbcUoS9FLzTzFFHVt/rKuhWuVdCTpyKWCMtPOu/K
	 SuABN8f5i/32fGANHjargfgjvpLSLLFZP2+f6Zki5YZ8Ks/JqsYRFBBPkwUMUSBpUF
	 uD396HYImedHwG3FC7MjQjs+DvWPk9KLbnn9BChud1S8EXO5icOTSfdZlWbwiTU1EU
	 Q5GG7HQPCNuYcJvJJlNyTORq25lJU7Dao3ne591kyt68s7dACakMq53gyk9kUlcC+E
	 LeRdbWgc4Ebzg==
Date: Tue, 28 Oct 2025 17:10:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
Message-ID: <20251028171033.0a9a5a63@kernel.org>
In-Reply-To: <aQFYdRZV9CQVuqFu@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
	<20251028164257.067bdbcd@kernel.org>
	<aQFYdRZV9CQVuqFu@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_171036_211068_AA97BF81 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

On Tue, 28 Oct 2025 23:57:41 +0000 Russell King (Oracle) wrote:
> > This one needs a respin (patch 6 vs your IRQ masking changes?).  
> 
> Ah, I see it, rebase can cope with that, but not application. Bah.
> Another week of waiting for it to be applied. :(
> 
> I'm going to start sending larger patch series...

I could have told you earlier, too. I assumed it's conflicting with
Maxime's patches and I didn't get to those yesterday :(

