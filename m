Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B110BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bs5JFlI0fqgJR6o0K6Prq9ED/CcnFGO8oBoULAy4wJM=; b=nmLdsE2rHuTdjVmZRroA+EIFv5
	MjRB5xHHUgmaI47arGiJwzLZiFoMgBeuDm3uzTQ4FWp5OO40Ycd54sTnCbfA1lY1phtKIsJd7Mif3
	BgVcjj043qKzgKc9jSogZR9FvK1iMjKtxFnRnOwm/A1hQwHvxP4zBhfyUnx+wapr2rS9e5nJEwcdx
	TxZKdiZX/jyNxvbu2gc/sMIduoBfJ7nNmZ4ZPXR+fHIe+8IPjBbzSRMUjXOFdAOE0PsXIHgZyxnsv
	cJ0z9gZKpC58jsUgH9X+/twwoqW5yLdkd1VtQ67hnGr+ZZDM+5sVBYUKDZokVEmzgcqyMgP2hUNdZ
	PE4e/utQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62mf-00000006zS8-3obT;
	Fri, 27 Mar 2026 08:43:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62ma-00000006zRN-2QvD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bs5JFlI0fqgJR6o0K6Prq9ED/CcnFGO8oBoULAy4wJM=; b=CqIo8RuGIP+k5XqO3bGvU9yQrk
	LNaluosJn0UhU0kRJP3NvqxWMcK7RllkIT8LVRIRR5lTiKwKLpYmWm/jf7OIGox62mPibeoaQ74CP
	h/9iIudbeTytF4KlhsUUQGpM/eF9zZa3ENxIt/rGrAJ5DOjTofbwVtWXgSoiYtzSuV7Z7X9A/hL30
	AniE2poGYTRgvFKR+mkl2dUfs9/aL2f83hRzlfaf3j+nKiClfQqZ/27mK57AvxDm30e94V5Tqs0fu
	53b5YmcdNk9VWCnYrwOTmCy25B0iH6/e68SX8ZWrsPbGTO/IWN9gPjb0+ZU5ac+7MIr7kmv7unRIe
	HuLO+s8A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w62mT-000000005o4-2GVA;
	Fri, 27 Mar 2026 08:43:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w62mQ-000000007uQ-12rM;
	Fri, 27 Mar 2026 08:42:58 +0000
Date: Fri, 27 Mar 2026 08:42:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 00/15] net: stmmac: qcom-ethqos: more cleanups
Message-ID: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_014309_277633_184FD33E 
X-CRM114-Status: UNSURE (   8.24  )
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

Further cleanups to qcom-ethqos, mainly concentrating on the RGMII
code, making it clearer what the differences are for each speed, thus
making the code more readable.

I'm still not really happy with this. The speed specific configuration
remains split between ethqos_fix_mac_speed_rgmii() and
ethqos_rgmii_macro_init(), where the latter is only ever called from
the former. So, I think further work is needed here - maybe it needs
restructuring into the various componenet parts of the RGMII block?

v2:
- patch 2: fix typo in commit message
- patch 3: fix ethqos_fix_mac_speed() comment

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 220 ++++++++-------------
 1 file changed, 87 insertions(+), 133 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

