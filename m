Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8589DE9A049
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 12:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDOxbltY9vIZx2VprPzwy+EvhUWXeLfTB2AEz5x0u+M=; b=r7j5So8LPJ0INncH48xYMssDQW
	GQB8v/EhroxLs5+6/GEcTyd9QExo4nkE5OzfXQQRHPt51JZrtt08rAHAt3qYVOWS8OQWjLfPp+TOp
	Jo/uuztPPYKwtZtLPBN9wrdBAtIGvm7tVhBqskUgH5wHUiz+Y4/EWIuGlay21yuDmNiFftnqZ7Lao
	2Foq2qlBBcgV7MYtn1IJX74/hmCt0SwRwcJ80k2OUDw3hfmAGFd1Cn/l0+dPo67V/EUEQWK+vxnnb
	h3t61rdLCdZKLG5kGE/NrDGxU5uXe3w61FxzfXn4QW5/7VSNlvdrymithqQCH6XYA0YlRMuzDOckq
	1I1mWzfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3Uk-0000000BMBG-1ZAF;
	Thu, 19 Feb 2026 12:51:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3Uh-0000000BM91-2L8F;
	Thu, 19 Feb 2026 12:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UDOxbltY9vIZx2VprPzwy+EvhUWXeLfTB2AEz5x0u+M=; b=rtv5p8KP8OshhgsHP1UZ/+ekfj
	VSGvjKAS8hpU8++KVTCWysrnEmAmtrOAPQHEiK8dGueMMMzSOVDKTwhowrlXPT6hDzftvnD2AVkY/
	Vq8Blx+Z2K1KM3pV67RlucIf10qa1WhvuYE135nWFFKNq5mYCjWVabksQ2GQ983kpOTo9jKiZOhOt
	HAR9Vs7Ct9wLW2YBbUwf0s/KOH6Q3K5ZmE9/QOLtqqsFTPCcQPmDklg5MaNGKxijXvRGz2cFC99I8
	UInBtQTcmiF17I0mot9TUDY+o3YuvsYfz7gG2EWY6yHzTM3DO19F9eakZFWUnNRaGPI9YybosvMjr
	wX6MT57Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49826 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vt3UY-000000000sN-3o8D;
	Thu, 19 Feb 2026 12:50:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vt3UX-0000000A5eK-22qr;
	Thu, 19 Feb 2026 12:50:49 +0000
In-Reply-To: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
References: <aZcGxDBwfMXHbo_O@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next+ 5/9] phy: qcom-sgmii-eth: remove .set_speed()
 implementation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vt3UX-0000000A5eK-22qr@rmk-PC.armlinux.org.uk>
Date: Thu, 19 Feb 2026 12:50:49 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_045100_372274_2F43F567 
X-CRM114-Status: GOOD (  10.03  )
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

Now that the qcom-ethqos driver has migrated to use phy_set_mode_ext()
rather than phy_set_speed() to configure the SerDes, the support for
phy_set_speed() is now obsolete. Remove support for this method.

Using the MAC speed for the SerDes is never correct due to the PCS
encoding. For SGMII and 2500BASE-X, the PCS uses 8B10B encoding, and
so:

  MAC rate * PCS output bits / PCS input bits = SerDes rate
   1000M   *       10        /       8        = 1250M
   2500M   *       10        /       8        = 3125M

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 4ea3dce7719f..dcfdb7d0e8ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -318,16 +318,6 @@ static int qcom_dwmac_sgmii_phy_set_mode(struct phy *phy, enum phy_mode mode,
 	return qcom_dwmac_sgmii_phy_calibrate(phy);
 }
 
-static int qcom_dwmac_sgmii_phy_set_speed(struct phy *phy, int speed)
-{
-	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
-
-	if (speed != data->speed)
-		data->speed = speed;
-
-	return qcom_dwmac_sgmii_phy_calibrate(phy);
-}
-
 static int qcom_dwmac_sgmii_phy_validate(struct phy *phy, enum phy_mode mode,
 					 int submode,
 					 union phy_configure_opts *opts)
@@ -341,7 +331,6 @@ static const struct phy_ops qcom_dwmac_sgmii_phy_ops = {
 	.power_on	= qcom_dwmac_sgmii_phy_power_on,
 	.power_off	= qcom_dwmac_sgmii_phy_power_off,
 	.set_mode	= qcom_dwmac_sgmii_phy_set_mode,
-	.set_speed	= qcom_dwmac_sgmii_phy_set_speed,
 	.validate	= qcom_dwmac_sgmii_phy_validate,
 	.calibrate	= qcom_dwmac_sgmii_phy_calibrate,
 	.owner		= THIS_MODULE,
-- 
2.47.3


