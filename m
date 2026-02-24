Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888D0EFB818
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fV4QC4srgxPWasBRwi85CI5pwqpQSREXoj0SicemL9I=; b=NzO2IZoh44MmOqJucerGOfNDYe
	DmbVyEc9+y8Mwvy7CfGwcvwrP7FVvHLM2GVB0lOuBXP6xAxUygBdm+TmSfP1BJkrYTuEB4YtcvqUx
	1Ys30yN8NP5tcpQFVsNKQvkGv9HWSx+gOY8W4PNmsj5ACBfCX37fcfMAFLt5C/1weCcKe+WGNyfug
	uSeV+5twG1w6HjnD9ky0U76xcRsZEiC0CNU06Tkc4NDZT5iTuWZm/cd0h6UOIHRgLQyZ1CSx/KabS
	4RjohIjBPDIoFkxhShXAqkB7yKg3VTQvH79q2wfkd9a61T+UKXVjB+85lL78Ya/XFXrAOYCJx7euY
	KJk4Bc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoIL-00000001hV1-2eCd;
	Tue, 24 Feb 2026 09:01:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoIG-00000001hUj-0Qpc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fV4QC4srgxPWasBRwi85CI5pwqpQSREXoj0SicemL9I=; b=1jDR7KmibgorBla6kbgIVITyYx
	qm9WuzxywIaFGfUeOouVwPZG3GDg1L7m/y/VjyFiivKU0qipwulPP5cfRQnbwje2H4P+zrbNZdMY+
	MVXgUmn5lJLiChpl8eGFCcADFkja06rrcH1uOT9VGqupwzoDvLN63g12DF1TOQfywV0fCc5BfRDZ3
	grfgLbW9+rs/AxZRRJGkWLnp+OAtIxOfUNs1QJetE9pgSXLi+Qg2D8FrbYcZqOcHcMbMnjGsdPt45
	JCWha5he7bzKmYz4+aZSCWW3XyjHAr6+Cup8G/8PoiAy5WqQRBlXN+4u/+T0Vr5obqO6Kc3DFiJ0H
	xA9b2f7w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52654)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vuoI9-000000004xw-00WP;
	Tue, 24 Feb 2026 09:01:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vuoI5-000000008EU-3dBj;
	Tue, 24 Feb 2026 09:01:13 +0000
Date: Tue, 24 Feb 2026 09:01:13 +0000
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
Subject: [PATCH net-next v2 0/2] net: stmmac: fix interrupt coalescing
Message-ID: <aZ1o2dmfpeiubCik@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_010124_144403_AD101396 
X-CRM114-Status: UNSURE (   9.88  )
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

While cleaning up the descriptor handling, I noticed that the accounting
of transmit "packets" for interrupt coalescing was buggy in that it
takes the difference of the two indexes into the circular list of
transmit discriptors and merely subtracts one from the other without
regard for the indexes wrapping.

This can result in a negative number or very large positive number
which would have the effect of either reducing tx_q->tx_count_frames
or making that very large.

Either way, the result is numerically incorrect, and could trigger
interrupts or not trigger interrupts when required.

This series converts stmmac to use the circ_buf helpers, and then fixes
this problem.

v2: move build fix to correct patch


 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++++++++---------------
 1 file changed, 10 insertions(+), 18 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

