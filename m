Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24B310987B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JLXg8A2dB6C/6B3r2jVXzkuVuzKHB/KU8OzuEFwRTtg=; b=z3QqZ61z+VQxij3gxm+oOcGoYz
	rojVWUvat3loH7dYyppxwbgzpgLE5LTGihcl9qXkBotHzdZwAW7Yx5eiGCqwz7GQxA2Yo9IHiAKy9
	q4QnYIOzcF7yijxBWLPgJ3zVms/BZx34/pCajK5dQuicsqIdBdtFKpQJpgen8wlUJHqcwHisTWaKP
	/c+e8v80zzQFqDdaJvQ4FYAtsP/UvDWZNDr6CViocpiyY9wNDzxT1+4ZB3VZYynFLEQSn0UGFIy+g
	VryMKX0LTK3B4oBLezVFERexnzZXb8pZ2sy+PQVHvm6PI3lxzMrWdQule1bzSVPr61eaT1RBe2H28
	dIEoxG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d04-0000000DBJp-05uX;
	Fri, 20 Mar 2026 16:47:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3d02-0000000DBJ0-0EGK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JLXg8A2dB6C/6B3r2jVXzkuVuzKHB/KU8OzuEFwRTtg=; b=FjUYwxKJ/I5gBvDEJi2ksZy4LW
	8N0+cGay7O2i2LKYMFL8RZNNTNqNn4SK65jEwfyHLBwxhf3PPkPXFMhGa+vRu0umK56hp4hrGf4oa
	HmOd5znMCf2L15mFo/WOUZZBylMSf8cLw5d3jyDYgYIASG7CX81m3aSCFgqauExrrJY3FGKLdZ5G+
	UujfMnDbY1UDfwB/1TJEFoGiPOJ42OVvxxupUGh+MePmb5SqGGXa4ZVY3845U/Nf7f/W9uHZc6RlZ
	sWUJyo7rscXslLY/LSsTZ4Ad7VEdir/vFts8Nv0s1v4vwCoDYXN8N3k2cUnJuT1UsUYQqspcHDPob
	8GWe9jwA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46752)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w3czv-000000006Kx-2eGQ;
	Fri, 20 Mar 2026 16:46:55 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w3czs-000000000yz-3eck;
	Fri, 20 Mar 2026 16:46:52 +0000
Date: Fri, 20 Mar 2026 16:46:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/6] net: stmmac: cleanup stmmac_xmit()
Message-ID: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_094702_093325_C0AEAF95 
X-CRM114-Status: UNSURE (   5.94  )
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

This series continues on from part 2 of the descriptor cleanups, making
stmmac_xmit() more readable.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 103 +++++++++++-----------
 1 file changed, 52 insertions(+), 51 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

