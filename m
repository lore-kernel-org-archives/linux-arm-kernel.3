Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FFBE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 12:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45CZAwIamAG8WuVB/J0OCl/kYd5Vjv/J3SFjjvjhd8s=; b=W6EXGRLCr56y/Epo3vKThjO+b3
	hnNCNnTNlW22EVITf2AEk3olt2tEoYhB2N4zvf/TJn+0yK8xV5HrO8NtgvYDfUb3gy66FcRZiJfha
	OXFQrylZz0HRBcSabNAB0ssyvtn721UkUSw90CotqSw7zWzCIGIM5VuAsv+uOhA3jrxsSlqIiv69G
	m823/RjQ2GNpfctbtXKZuQq0sEKi2X91yfJyIzhZHcTmYxXFDJe5gDbvZdFan7gurkJqWICas2kBN
	ExRHVcpYpbmgO5BuArZDoOKRBNSRkwk5svAfbVY7fPfTNfZ4J/J5FXemWgLdc5JsS8xTa2LHPVxLi
	sWcdm1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmTT-00000001Ggd-3ySc;
	Mon, 06 Jan 2025 12:44:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUmBD-00000001DJH-06RA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 12:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=45CZAwIamAG8WuVB/J0OCl/kYd5Vjv/J3SFjjvjhd8s=; b=HY3Od1+Ij8S9Dc5yXZIy0tcbPp
	V5WeSzIWqR3LYC8fEfuwpKIL4rUjnA4rdNQouwbOPk2TgItgnz+zS2is6y+tAcZvVyhSISkf26iVh
	0shJxh9XKjBgW2YAc87jff0WURuq3A1Jr+sUmEAS2fiGUeLggMFpdxsuxhNAFh7qk3Q0cGv+QCej/
	KDfJHvXwXnpJkDTG51xBH+jgXXO7Sb1jbMO0AF/k5K4nyyMlg19eyWQrzMqlLPGswmjhWumqZ+LvI
	nFoR9EdtSJJbwHfAwGv3oxkeg/JnNi8YFPmwQvODGwZ3yjbxj7pIBiwL7JbdzTmRLMfW8thh4lwCh
	J/LTwVuA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51890 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tUmB7-0005tc-0F;
	Mon, 06 Jan 2025 12:25:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tUmB4-007VXt-4o; Mon, 06 Jan 2025 12:25:50 +0000
In-Reply-To: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 13/17] net: stmmac: use boolean for eee_enabled
 and eee_active
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tUmB4-007VXt-4o@rmk-PC.armlinux.org.uk>
Date: Mon, 06 Jan 2025 12:25:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_042559_058435_3CF03599 
X-CRM114-Status: UNSURE (   9.86  )
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

priv->eee_enabled and priv->eee_active are both assigned using boolean
values. Type them as bool rather than int.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 1556804cca38..25ad3f92e14d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -305,9 +305,9 @@ struct stmmac_priv {
 	int clk_csr;
 	struct timer_list eee_ctrl_timer;
 	int lpi_irq;
-	int eee_enabled;
-	int eee_active;
 	u32 tx_lpi_timer;
+	bool eee_enabled;
+	bool eee_active;
 	bool eee_sw_timer_en;
 	unsigned int mode;
 	unsigned int chain_mode;
-- 
2.30.2


