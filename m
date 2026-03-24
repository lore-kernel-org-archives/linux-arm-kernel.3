Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB86CF54AA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1QZg5J1wBw76UYVfAUUPPw5lf/Tu4jryU0wvfBdZZ0=; b=jM+2yvYB2HaWY4y/lv2iU0fJER
	msmIzt+hMYZWTVS98fNbWfM9YR09tStTs63H862jxGIP4A8yzo6YL1JmbS+iTCOk9ncPudfYwKJBt
	t2uLzKfmJbek64cFNqwghrjVDbfN0yobu51VQoh+QLF/58ZSNjN1NwUvo+DcRU5+OpqalfARdqiyG
	hkFWQWaPVOdrPzZXv1h61xfBmGjZGV2WIXte58CMW/dLKzbgkBRvcnreqS3V6lf5qmSlRLn5vVzAm
	kf57u86t5ko8A5y4dfiPHoJ1enuHt4o9rQiBZSvLOx2dJNgVUIkbkRGQPhFiAqgvtRiWz00lZQdlQ
	TDjLB9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51g1-00000001X5B-0mMP;
	Tue, 24 Mar 2026 13:20:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51fy-00000001X4H-48eY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I1QZg5J1wBw76UYVfAUUPPw5lf/Tu4jryU0wvfBdZZ0=; b=OM+YlRhwgM/rwbeTnYrY4ZL44V
	lUn4S9oTaZaq+kFO+G4NTj+BZyi9UrFrgCXhtd7hJAet6LQNmnD7OQ2zX0P8B8RxsLL9LEoz6O0P2
	JT6OxIWIl6mwb7os+PCDDiS8FEhI+8lkbbd5FrrCB94C6q6cJuxxJoIojbSE7aYWr5Xw+7ay7C+Bg
	zEsOju5yaUl+3+55rKZJDftK1+PmcxU4/L1MU+R/s8vchp1NI8FYGeCYm4s/6prWZnz7vuP+MrJHp
	PPkIpP80fFMnVyavGODmG577GD/LfKRaYRrAzjMwGgPruWC5ovQjFjR9dmJrkeAJuw1UcpR9OMK3D
	oyASmLwA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50596 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w51Yn-0000000025J-2OOn;
	Tue, 24 Mar 2026 13:12:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w51Yc-0000000DwWM-3REd;
	Tue, 24 Mar 2026 13:12:30 +0000
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
Subject: [PATCH net-next 12/15] net: stmmac: qcom-ethqos: simplify
 prg_rclk_dly programming
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w51Yc-0000000DwWM-3REd@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Mar 2026 13:12:30 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_062007_065901_CF5AEA56 
X-CRM114-Status: GOOD (  11.73  )
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
index c88c693137d6..f9d6e97f197a 100644
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


