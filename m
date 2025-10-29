Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04D5CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 00:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M3WA5E7+cy9RohdVFrjxmxJVZbOtCukuTF1uMkF0/0U=; b=3HFH0LlRwTcNoyAxle5vNjvK2v
	IjjrA+HzBJDR9bflBql0gtbp0w2vZe5t9dPo1f/bedsQC8IyWFckfoz4SUK9bNyXkcCaXPr2hlhw/
	/tQBKWs7teOXjYwd8VPiNEwLUXwGzOsz387Yguo+BMbqODE6dWxZE35DQ4k5X9MnjmvOeipgfU5RS
	DVoxSBdhx2dlh8MzhMevMYcK6vC8EEfadPXdFBsFZYUReIjnr6azCcjBYP7AKlzBpD1y3x9TzniW0
	1PniiWPjU6vWbwdWq77VJbSdeGu8L3jXbtsnHJDxe+A7IbVIpWpFM3VwRafXS/3yLu2Pp1pXLlmIa
	mDgO7Lzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtdA-0000000Gp30-1Igz;
	Wed, 29 Oct 2025 00:01:36 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtd7-0000000Gp25-1rYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 00:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M3WA5E7+cy9RohdVFrjxmxJVZbOtCukuTF1uMkF0/0U=; b=Vyad4FrEExaL7FkATlCAhSO1Tm
	SdG0BZo7VdEY0Tt0bvik1+wXq6izLDz10l+Gh+ibkFdT8pEvvIKdv8+c2EKZzQPeDfoMEJmLdtiKs
	1ur4x7fRCKhId0rUbGKvX8yagFrABdz+Hgq+0FZqZmJfoLvl+0pOPYWjBr3sKRQ9UXzuubm+tu9qx
	W+FCY9OYF1q35EXP6+Yw2J79AGCTMRp+jZACw6YqmUp5OdH4X2JiWOoslYCNemsQYJuoYTVdSoii/
	p/ZF+W8K8jFqMNmboMn8+4bRnyJdzcBdtP3AUxgG+hg2/XRvca6W8kk929WjWlMt7SW6irJE4r5pV
	peELBMCA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57384)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vDtd1-000000003g6-34U2;
	Wed, 29 Oct 2025 00:01:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vDtcz-000000006yS-2jNj;
	Wed, 29 Oct 2025 00:01:25 +0000
Date: Wed, 29 Oct 2025 00:01:25 +0000
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
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next v3 0/8] net: stmmac: hwif.c cleanups
Message-ID: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_170133_487722_DAA01282 
X-CRM114-Status: UNSURE (   9.72  )
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

This series cleans up hwif.c:

- move the reading of the version information out of stmmac_hwif_init()
  into its own function, stmmac_get_version(), storing the result in a
  new struct.

- simplify stmmac_get_version().

- read the version register once, passing it to stmmac_get_id() and
  stmmac_get_dev_id().

- move stmmac_get_id() and stmmac_get_dev_id() into
  stmmac_get_version()

- define version register fields and use FIELD_GET() to decode

- start tackling the big loop in stmmac_hwif_init() - provide a
  function, stmmac_hwif_find(), which looks up the hwif entry, thus
  making a much smaller loop, which improves readability of this code.

- change the use of '^' to '!=' when comparing the dev_id, which is
  what is really meant here.

- reorganise the test after calling stmmac_hwif_init() so that we
  handle the error case in the indented code, and the success case
  with no indent, which is the classical arrangement.

---
v3:
- fix conflict with PCS IRQ changes
v2:
- fix "verison" typo, impacting patches 2, 3, and 4.
- added reviewed-by / tested-bys

 drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
 drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
 2 files changed, 98 insertions(+), 71 deletions(-)
 
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

