Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BBFE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01Z6NUQGGVdbdysyHi9D4NLqyojbqR+9GRrkbvVdFFQ=; b=2IrdAGomaMX+Rg4zyyj6ustDVO
	TfMoFvPdc4halGu1+ovywwmLXNfirJjJ1SSBz4dbFoqb8RoHAJUEV3cLxE6PhOPtIU2AM67mmEKyO
	0oBj+CELyl+rEl+ojlqgV0d8dbBDx4x5JT+J7ou9Z6jmd9a8Jr+YDz8yzK2SYwTxpNzwEX8gBlCnx
	x4M5Knosv7tufPBqqkFF58inRuiYyF2JaWVGRytUhdplq6A3+1jhYuyXzA9OMHVMI+Epm3RE+K/Hq
	h8yXRFpeBTWzbWXSIMgS0/pLDMx5Gg6ndKSAzLENcMRpJdtgVOBGXbsb/MswBUVFr6KlR6wgya+Lt
	HVhvV3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIxC-00000004zKr-3Y4r;
	Mon, 13 Jan 2025 11:49:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXItX-00000004ydS-1ik3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 11:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=01Z6NUQGGVdbdysyHi9D4NLqyojbqR+9GRrkbvVdFFQ=; b=T+m+cyWomkZSFmtWRgo7licQxk
	NvfzfAJ1ovjuv71ka1EmpDj0ZlEI2HY1wnUj8pwBsXm1OVWhG0G7tGMjm2+e42kRtpfAgfDv67G6T
	XrxR/Y6xnjDwGaQWrQjg+KYrn3ED0Yq8R8IkF/NF0IPvUa8h9pdKJgYCpZTh6FlEaM7Xaog065Qpt
	WZvOMg8WiHAQ9m44puZksVWP7JPgKUdKiTp02rpyJk8EJ7oW/ZjvNO+6sL29nJXeOjlOp8Cecavo7
	xhexAXMuynJWK10Gz0rawMrWG59AQAYzXm04QSOItIe9x4BRY1BnnHXzFC7PRSVC/tvllwSb5GCAy
	XldcMVoQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48028 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tXItQ-0006V9-0L;
	Mon, 13 Jan 2025 11:46:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tXIt7-000MB0-0W; Mon, 13 Jan 2025 11:45:45 +0000
In-Reply-To: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
References: <Z4T84SbaC4D-fN5y@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 2/9] net: stmmac: correct priv->eee_sw_timer_en
 setting
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tXIt7-000MB0-0W@rmk-PC.armlinux.org.uk>
Date: Mon, 13 Jan 2025 11:45:45 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_034611_447275_05FBB7EB 
X-CRM114-Status: GOOD (  11.76  )
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

If we are disabling EEE/LPI, then we should not be enabling software
mode. The only time when we should is if EEE is active, and we are
wanting to use software-timed EEE mode.

Therefore, in the disable path of stmmac_eee_init(), ensure that
priv->eee_sw_timer_en is set false as we are going to be calling
del_timer_sync() on the timer.

This will allow us to simplify some fast-path tests in later patches.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8130b0f614d8..f1e416b03349 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -478,7 +478,7 @@ static void stmmac_eee_init(struct stmmac_priv *priv, bool active)
 	if (!priv->eee_active) {
 		if (priv->eee_enabled) {
 			netdev_dbg(priv->dev, "disable EEE\n");
-			priv->eee_sw_timer_en = true;
+			priv->eee_sw_timer_en = false;
 			stmmac_disable_hw_lpi_timer(priv);
 			del_timer_sync(&priv->eee_ctrl_timer);
 			stmmac_set_eee_timer(priv, priv->hw, 0,
-- 
2.30.2


