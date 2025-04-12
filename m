Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE24C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VR3FFlMBN8HRj0XAqVkThi23aRwTjX+yZE7rM3zkE2E=; b=y+7U1z9hrOOCdXZIAdiAWOFrL8
	AMFSxbixpI2LCVUvAkQuOIfOxFRq4mpFtYb5IL8+8bQxsy2eaXFdj97+b88PepntveQx/8qckoAHd
	xbzfAcBerNm78vGXWoTwk0Ks0hdgI2AeKRn90ZwqFYpPDcL582o54xGEuTojquF8WlYjgpfmt0RTG
	kZVNvVNuJYauIZsNlqm8iO/HXHOnh8f0hcD5mF1WgKmC4CmKjbh4SDbPbJg5dqQXOkJUSgLMuy6Hp
	+xgkMBBEoNSSWBUK7I+mppraNVAGUvR5/gCHPHeMc80D2IdIqoD/Q4BXN3ekfKPi/m82zzA7DPJal
	NTOQoh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bcG-0000000FzdX-0Qi9;
	Sat, 12 Apr 2025 14:13:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3bZ0-0000000FzF1-3hpb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 14:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VR3FFlMBN8HRj0XAqVkThi23aRwTjX+yZE7rM3zkE2E=; b=xIvfwDSML00COazWAJNDsih+Sy
	TSYIUiY7mYICIfNCV6U2Ug/N9e29FzdVQC3qyT/2qo1ojvF3wBUIJmo8pmpUsCrHCXxSIEGFfEkVO
	jQgjMJpIqNjMut1LogXWaPyNauYILtqAbDGm1jNI0h04iK2jFLyAyrTMIoD7CoySJUeOhdkkNG6Pz
	9p2SNsXHbGxCS/3MWxy1Smnr0bIUDsfJPwrqCbx8YGnKhybH6GnlcnhUhbZtWCTTLRBNfubQshzrX
	r1YtWZSZCmYZ7xPj16Bz6ozA8wo755B7NuzeZ32p+ColEZeS88wYMg/l/0VOyLWcAZ/if16F+Do3h
	7KPeIovw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38022 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1u3bYw-0004aF-1F;
	Sat, 12 Apr 2025 15:10:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1u3bYL-000EcE-5c; Sat, 12 Apr 2025 15:09:49 +0100
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 1/4] net: stmmac: qcom-ethqos: set serdes speed using
 serdes_speed
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1u3bYL-000EcE-5c@rmk-PC.armlinux.org.uk>
Date: Sat, 12 Apr 2025 15:09:49 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_071030_918732_AADF87A8 
X-CRM114-Status: GOOD (  11.05  )
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

ethqos->serdes_speed represents the current speed the serdes was
configured for, which should be the same as ethqos->speed. Since we
wish to remove ethqos->speed to simplify the code, switch to using the
serdes_speed instead.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0e4da216f942..5d8cd4336a8c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -709,7 +709,7 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->speed);
+	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
-- 
2.30.2


