Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E71F54AAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9580yafoCa1RxAXg+BY7iUMy1G/+IM8etLdguxInS2Q=; b=sRDfxxUfuewwj6rP/G6AITVD76
	GbSaVM2KuRWC88e0dVQBjEk6WbWn73XAU4kEZjjlqenbsvBCVAQSA/PKYFz9jKX4ePbtosIcJD/NT
	8bnADu1/IeiThYyQUDoc0RuvOeDiZwMP96Y9Ro4SGPp7Ml4T0NWT1X83hhXPtg7G9YK+Sa1NnYl7g
	gacHoAXjJDssPTYTfXvhzPwhjUc/nqmiD/3fFaw7m8JpLvAYErbWNVrxpdlRK4Vp63r2X/tdKG0rK
	F+QGMWJnQbTuWjb50sbTLOIHNLsu8wh1aalmfv9x+y2S0pEmHJklPY+ecsjRXj2Zh6eGg6gnCkDzV
	WqbDHxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51YB-00000001V8w-1z90;
	Tue, 24 Mar 2026 13:12:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Y8-00000001V5b-4AsY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9580yafoCa1RxAXg+BY7iUMy1G/+IM8etLdguxInS2Q=; b=gI4NFi3LaT6vUHZMkSe9Ec9GAc
	pWuDbfB2whLvmS/i/HWRthcsBt+Gs8TVCm0pkTf1Qv3GEYv/drzn11dp9XSepSW+HJBCsukZfnH6Z
	8P1BpeNY7qVAJDBY7JJxmgasBJFY4z7g0RAeAxceUiHkCfTFVo5zLsEfTDU8sVpUokxbLbMFB2ryM
	VYo6Byh8k/MB3yFEXR6RksTxpUofvyxe3voysFSLPKMY/M7bhJwgdnQJwoApQlZ5QT6HhcMpbhOgK
	t7v/7Wbr0yc2AT/TSNf4Fw3T+xOzuSHglmpYjut0t7VnoYFf2H2PCk5hJTvObrWB8FyiLJXC7kV5/
	zh+oiKDg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38010 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Xz-0000000023L-0ZLz;
	Tue, 24 Mar 2026 13:11:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Xx-0000000DwVb-34Rx;
	Tue, 24 Mar 2026 13:11:49 +0000
In-Reply-To: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 04/15] net: stmmac: qcom-ethqos: move detection of
 invalid RGMII speed
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Xx-0000000DwVb-34Rx@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:11:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_061201_040503_BB631C65 
X-CRM114-Status: GOOD (  11.02  )
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

Move detection of invalid RGMII speeds (which will never be triggered)
before the switch() to allow register modifications that are common to
all speeds to be moved out of the switch.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 84f713ec8c28..7e389db40e8b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -397,6 +397,11 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
+	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
+		dev_err(dev, "Invalid speed %d\n", speed);
+		return -EINVAL;
+	}
+
 	switch (speed) {
 	case SPEED_1000:
 		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
@@ -510,9 +515,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
 			      loopback, RGMII_IO_MACRO_CONFIG);
 		break;
-	default:
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
 	}
 
 	return 0;
-- 
2.47.3


