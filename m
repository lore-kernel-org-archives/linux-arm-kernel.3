Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2F610BA445
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LNWaMcIs4JGbtFmo7TG6CV62xRuHUPhsuBNMqPht2M=; b=ThYVmbpXIyDQj2Bf9DZg5jQS1T
	5aoAofpIQYHV7enWCV8Tm5i94M1fDcTv57u6f1lmrYaobe7Vptk9UflFUZkFhirMlJWQ30WW/7eJw
	1BEMa1Peizrsyz+GKjqg69BE/jqFZ36MpbZ4rGHROvYwc96J5jNytvGyBuVMSoJGxbt8M9mKA9sKm
	SVaEl27dB5hu9dOgSCbu7araAapscDo0fYIBXffheZ2M6tR8lqAHMtO4wEXkYebeSbRkdEm+tjxTW
	CBmITZfzX7bIjAGbgDYvZDl4+wH9j5NHRV/cqhNXOfTfnRZRgu8nmoKzHRNjPVzl2Gos1AIBV/T+U
	1zqJsDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62o8-000000070An-175e;
	Fri, 27 Mar 2026 08:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62o2-00000007068-2hiV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=7LNWaMcIs4JGbtFmo7TG6CV62xRuHUPhsuBNMqPht2M=; b=A3ayFHBO4ktg2g9I41bDtg0OBu
	s7Eo6TJf8zNlKOWg3J9elX1+XNXisHtCAGouZOTUdR8QS5+GNiZk/9k0LDbgvqEVP9LaL5YVDzjNv
	1l4132kQqQ50JsJULcvdJOtsVzSrGW6kSVttQLOIrUG17kW6Q4Ymyi9UGmi9waOJs2TGaw0idEZq4
	0MNlzJJQ6VVVCL7cPZCg0PsHPQl5XfJcVatoN4ktJuZHAC0rdtRRbPzWxBctG7A4omvuxpLwitGSY
	jL7ohlO7jpwUthzl36+za5tJqWm91vsjzB5ncsugXdwDuUpW8riUTxgTrKqLXUdhYPDBYfwPP8liv
	SXhdn8iQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nz-00000009zxB-2PQg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7LNWaMcIs4JGbtFmo7TG6CV62xRuHUPhsuBNMqPht2M=; b=u6GQkVaaGpeJLFrK/LsXhFNrKb
	UyXf2KeIKozmFd3gLA/yPLk9Z9B3b+Lra3c7cuZmzErF5i5BL/OTMyjtXS1afDU9Gn54USnYF5/hQ
	OS5Ejpm+IYlRrADWIV3Ia3Jk4u/mqymzpx/pOYSjvn1nlsN82ke2yiWAIcx7FkjP+V2E8s8TvAMru
	v3j+v4qX1UjOIv9xqFM7fB2knM/UcvXP49Vo9c5gjTpCLNCjk2CID0J/07wuPQKsy/lnpEOI6Z4vr
	dVmM1aBFGqE+q3Fb6A+hr/ObQeEwXsq9yLrKESIkcrSoAJSGUG4+cY6CtdqHtk9He3PUAh8rOFhJ2
	JSWf3NAg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56514 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nr-000000005rd-09Pp;
	Fri, 27 Mar 2026 08:44:27 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62no-0000000E3Cw-2EmH;
	Fri, 27 Mar 2026 08:44:24 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 12/15] net: stmmac: qcom-ethqos: simplify
 prg_rclk_dly programming
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62no-0000000E3Cw-2EmH@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:24 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084435_823636_D6BB3EE0 
X-CRM114-Status: GOOD (  11.66  )
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

Rather than coding the entire register update twice with different
values, use a local variable to specify the value and have one
register update statement that uses this local variable. This results
in neater code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 7690ae0bb008..580deec1dc30 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -374,6 +374,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
+	unsigned int prg_rclk_dly;
 	int phase_shift;
 	int loopback;
 
@@ -461,16 +462,16 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 */
 		if (ethqos->has_emac_ge_3) {
 			/* 0.9 ns */
-			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-						 115), SDCC_HC_REG_DDR_CONFIG);
+			prg_rclk_dly = 115;
 		} else {
 			/* 1.8 ns */
-			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
-						 57), SDCC_HC_REG_DDR_CONFIG);
+			prg_rclk_dly = 57;
 		}
 
+		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+			      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
+					 prg_rclk_dly), SDCC_HC_REG_DDR_CONFIG);
+
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
-- 
2.47.3


