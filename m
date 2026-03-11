Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7321049524
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BYxECjAf/3z/8zbu3rDMRNzt6GWu02sPG+fcCTbQXIc=; b=DqvgA80scCfgBwksF9fXniM6Fi
	HMbvuH62v5KBRnnMlBLJZa7bdI0OSEfK049pExM9bZj+tabGMkWYOR8OzM4V0vWLBADKBdW51tuCQ
	oUma6OOq5VlEZsDckZVZYYzfyHrTIO4EotkWyZ+i4UpBuLxrJ9ucZp0hpwav88Hz1lvMZduInW2+n
	5ZoUqOq3sIaZrBH3rTgsrUxfIxiWV27DYNh0/o3MIEzRFVMEFc4RuqnTDL0Qm2eCR6u5rATO8L0iQ
	6LrDvvEOazBVqIvOwUqBn+MOrQ6d6jLentLyF2crDCwP6K2vYZRo070Dg++60nl9BPawmkiK0jFb1
	6Nc96b6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GES-0000000BKO6-3g30;
	Wed, 11 Mar 2026 09:52:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GER-0000000BKNJ-0Vq5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BYxECjAf/3z/8zbu3rDMRNzt6GWu02sPG+fcCTbQXIc=; b=rLziUR6FlAwwuEYG98evTchBwE
	WkkP9qvK3fhbwYIwgiBRHMpm5X8AQX4IC9uw+rWeMr5OjpHregu59mi8HU/MGqRKtky7ajYoRqo1f
	Vods+WFxMq9uIuqae3HMAFf9QmauWopQKgQsXLeO0EsOXexAImCaeesz/p3WlL50lGvlbmEL5iRIW
	ogZwmybG7APdq32S0MAK/T+I8WoVbYNAHdAdz3vbleFhbUqfmxblL064+KpGIwkhue6Pwb0YZjIft
	OaDQKQN7q1o0q0D9rkLfr3pRJ4dZhL2Mb2o2AlNSmmaeEPXrmLtQdQ+azvvpelTRGZ/ekzIMNv29s
	7l3TGTSw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57338)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w0GEE-00000000662-0oAE;
	Wed, 11 Mar 2026 09:51:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w0GE9-00000000692-1IDS;
	Wed, 11 Mar 2026 09:51:41 +0000
Date: Wed, 11 Mar 2026 09:51:41 +0000
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
Subject: [PATCH net-next 00/15] net: stmmac: clean up descriptor handling
 part 1
Message-ID: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_025159_156595_0874510F 
X-CRM114-Status: UNSURE (   6.65  )
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

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 458 +++++++++-------------
 2 files changed, 194 insertions(+), 272 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

