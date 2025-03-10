Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BB9C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=itOKGgzpHi7KgaNmFHmHfax9kY4jmtqWEweC2RyI/Og=; b=ZvXABbZC2YLjkmd8x2EAcvEwYH
	FOjF6l1RfYS7pzVeweUcvqmCa3wGYdkDKt4MVV6fZ3vLkTuTihrpm5P2jTUs5inxIsavgYDSpfZR9
	QfMIzXUnLBD/O6QxSZigXwY3LIVGBzNEG6s+yo/CP0ybtsO9h4diGVkPtPP2jGg1kRIn8SApxvqqm
	VTzfkPJXYtzHfrLCITnKAEL12EnGlhnlHDkM6RJQ5VmMdLyF8FXvGtPvOhN8Pzw8nI16wt+UhAqlQ
	xNLbDBnJEBNa7lb/wOdYBPEG1oP9G9/I2Kkflle18PzRciftV6i+gv8eRCro7HifQyYYI2P6FBhtP
	k/7QdEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdEO-00000002nx1-01tk;
	Mon, 10 Mar 2025 13:31:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcIJ-00000002dNX-0pFr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=itOKGgzpHi7KgaNmFHmHfax9kY4jmtqWEweC2RyI/Og=; b=erPLNA9wWzqDRpmp0jTUNuVy8R
	jHoaL6nv4fDf/jTi6npkgPDWsRHfZpbV/JUCNy7xFneykv3fIKU8bDnM6pGxIYVpTD2kwzYjJjR4A
	VQa5K0G93KLS31qrG03TYdVqFV4Z9zOt1lLJFKJqL+tRH4VNi2+Z6gXTLa1kynvf9a+XhqlIT7Zo7
	ho1BYiMtFsvOVWshin+zBspSykHdSP/bqqBdQs7wq++fc0MPQNBgQxrnXfsBOF+uLtI3Q86BObTUj
	N/ESrcqixtcf+FSXaP3TKKokW3raS17kxirnnwX423itWxAjrmR4Zv1uI8jmhJ8Z2bFv+frFaKHFq
	angen7XQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38120)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1trcIB-0002dh-1b;
	Mon, 10 Mar 2025 12:31:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1trcI8-0002TM-19;
	Mon, 10 Mar 2025 12:31:32 +0000
Date: Mon, 10 Mar 2025 12:31:32 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/2] net: stmmac: avoid unnecessary work in
 stmmac_release()/stmmac_dvr_remove()
Message-ID: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_053143_235985_8FD5C9B4 
X-CRM114-Status: UNSURE (   6.90  )
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

Hi,

This small series is a subset of a RFC I sent earlier. These two
patches remove code that is unnecessary and/or wrong in these paths.
Details in each commit.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 -----
 1 file changed, 5 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

