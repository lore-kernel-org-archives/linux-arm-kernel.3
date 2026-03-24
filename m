Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A79F54AB0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NKICP8GHoT4bJxqLdw1SWv1lXjP8XrIpBwPEDAPuuw=; b=e5Hmpl8fVlb50NMQAvX61c7A2T
	nwcDXrcxZGUBLfVVhClMc4jOq8f4j3lMnINRMdyMa49JPltGoBqN8vC4r8nXT4KeDm5jACyi+ICPi
	EZPqcTqPIxmEfurbqsnQ1JIfH6++96nMKxt8sDYVcVkRfTeo7rADyaRfNhhXIZBMAOHvaeOlFcW9k
	cpkxaJXm/jmE6LPGf5EiBGXpElMhicmZyOQoSt1PLK9mvT3uh1MhuxXnEXM3yOfjPs3N31IheebwH
	xbT5ftiLk0DeiiDEKGD9N5NcGwyeRP49nKINJPluNSjuod6XpWQlYyLRm3+uFQGaNFuX/oJ+IYs/C
	zpNV5PFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51gA-00000001X9X-045Z;
	Tue, 24 Mar 2026 13:20:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51g7-00000001X6x-1SXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3NKICP8GHoT4bJxqLdw1SWv1lXjP8XrIpBwPEDAPuuw=; b=EHwK9RgdAbvrFJ3h0GS2aoNoXn
	lqcry7WXYbqw8jR01Nq/c8IvOPS2RBpFNxLMhV7jl0WJM9GFw792BDPWC/BiuSBW7C0WC2dtz3fj3
	gmf8p+0SZmcPQFgBqwhBqYnp5lSpL/baKC8scaMbU+fDKjZO1NNZtufUjbPzkQRAdpbVYN8P1YKqa
	sGNUAoXpJDOuCG9jvSwAS3L2HrGkcvFvBB4IofEs9lTGP8caZ6PxKPoD7HmVbnogikE9C+q0MsJN+
	DttRN9DvVjn/P26R4rOeafH8+9hbOkcu4YTNVZ9yDFbQqw89myebK4lx9+vfqK6bav5T3RbEC0whh
	cpOOT9qg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50598 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Ys-0000000025P-0LUz;
	Tue, 24 Mar 2026 13:12:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Yh-0000000DwWS-3tCI;
	Tue, 24 Mar 2026 13:12:35 +0000
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
Subject: [PATCH net-next 13/15] net: stmmac: qcom-ethqos: move loopback
 decision next to reg update
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Yh-0000000DwWS-3tCI@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:12:35 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_062015_396031_C3AF8626 
X-CRM114-Status: GOOD (  12.44  )
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

Move the loopback decision next to the register update, and make the
local variable unsigned. As a result, there is now no need for the
comment referring to the programming being later.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f9d6e97f197a..3faea7ceebd3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -374,9 +374,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	unsigned int prg_rclk_dly;
+	unsigned int prg_rclk_dly, loopback;
 	int phase_shift;
-	int loopback;
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
 	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
@@ -389,12 +388,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	/* Determine if this platform wants loopback enabled after programming */
-	if (ethqos->rgmii_config_loopback_en)
-		loopback = RGMII_CONFIG_LOOPBACK_EN;
-	else
-		loopback = 0;
-
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
@@ -476,6 +469,11 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
+	if (ethqos->rgmii_config_loopback_en)
+		loopback = RGMII_CONFIG_LOOPBACK_EN;
+	else
+		loopback = 0;
+
 	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
 		      RGMII_IO_MACRO_CONFIG);
 
-- 
2.47.3


