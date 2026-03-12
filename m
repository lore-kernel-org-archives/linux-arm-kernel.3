Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74491FED2F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QGGXMDXa0VPsXy4Ds73Aq8P4YCy5IKmGXAyyVhbf4x0=; b=WZcaIxhQS8oiH53nuZ7+2Z3rEg
	K/8F3aQEqFXbAxi7TYjtMA30BQUIHvmg/gfrK8XcAuv6eQDxymOq8zURB+I9K78uLqd+mXWGIci4q
	a/OFuX2nstLnO1SCVpaWIqaF+FpDt3+MpAFiTVsPNsDi0xQ7XQfz+mkLpV0iGA1SfsdrbgvfHom1b
	NFUb+M4KUKCtgt+w5nfHaJ3KIfhxAHndnyejHwC0mmBP4tCXoxu57ZLqmQcqksDK/FjksjeNNDPHz
	2DJQrQZT1Z5U+RmA4ElvvQmwOZVNMddRqVYbUUnKbMbHm/77F91dR+GZFaEJ6ucSJthRL/tvxh3jD
	57ZICn0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cxD-0000000Doyd-3tHF;
	Thu, 12 Mar 2026 10:07:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cx7-0000000Doxs-0g7N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QGGXMDXa0VPsXy4Ds73Aq8P4YCy5IKmGXAyyVhbf4x0=; b=ptLEAFDJGp4fx9qSpKHj2Itgo5
	JQnod4Rmm5wsc3b3L4lAlnnZATG8w5IDZfyLNeYRxCjW8+pAOxmwTdTmCJJxfKyEuoT2xwSxTtb6I
	JpIhJHyGOPiVl7EbQbq0Vpkm/G3gr62Vbl5kYzQNEiKN6fWcQTcKVcK38pIrOBzu+5cHEckGPbD3S
	o8l9TsotNVOzFkfaWOjP8a5IIVdj1zLqpupR41SQ/qnkJ6YcSFdy7IOcafcob53gzSMjo/IvmyXt3
	r4vcXj9UTMqKNAnXmY0WGY+631TV9iXY6kEG2cRRvYLgNJR2seZ6kHoEjvvdRCYw3gb6kEtHdhA9a
	ofDHPgwA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39742)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w0cwv-000000007Wn-3sLz;
	Thu, 12 Mar 2026 10:07:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w0cwt-0000000078T-0Z4n;
	Thu, 12 Mar 2026 10:07:23 +0000
Date: Thu, 12 Mar 2026 10:07:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 00/15] net: stmmac: clean up descriptor handling
 part 1
Message-ID: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_030737_204087_B982149F 
X-CRM114-Status: UNSURE (   7.23  )
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

Part 1 of cleaning up the stmmac descriptor handling. Rearrange the
struct stmmac_tx_info to pack better, and introduce helpers for
duplicated code handing the transmit and receive descriptors. Remove
unnecessary struct members that are only transitorily used.

 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 458 +++++++++------------
 3 files changed, 195 insertions(+), 273 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

