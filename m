Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BD7C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLHCkOQCNBodgL/bDWc/dLG8A1S5U39KEwi8eztVGO0=; b=NIUCTILclB0Xy467Jerc0GUk42
	9P2oAMCM9cbbHPJFYrb/2lc/hqLMuH/+E2Dztep5CPMkfHnv/fvIefi/Fp3crfXgKnrLMvgb3ZILP
	4jd27AnyonRxLmW+Xs/Rm/hEtYyVf/6KvaF7KRVmI41za0jGC+6or1mxl01b4axLb/oopgbRs/UJ/
	WPlegGs4dNvQwBa+iGd0S1qsB2HbuDXcPlV8/uHsLLj2AnTO0Iy6k1tFQJGWzOLMQB6DBI6LPTgnA
	QoS+JC/vw17GkdBwq7vhxBygaQlTr0WAr2+YPSFQu4jIk7ZzCBAhEkN4a5e8IlSlO4DLbghAXyh6T
	+v8KrOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kpj-00000003nOL-30J9;
	Sat, 05 Sep 2026 07:29:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kph-00000003nMm-3S5N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:29:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5BC514E41530;
	Sat,  5 Sep 2026 07:29:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F47D60580;
	Sat,  5 Sep 2026 07:29:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A969311C79BC4;
	Sat,  5 Sep 2026 09:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788593335; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wLHCkOQCNBodgL/bDWc/dLG8A1S5U39KEwi8eztVGO0=;
	b=TKH59S3b/AE9WIAT+ChXZT1h0rzOhLWx7Ojz6BkFa8v4Wypep/3aThhaJvnmj63AP/ugKs
	Gn4ktRiOUmrMhIDiu3QlzhcmHKgwnzgDd5TfsQ99s6CnRgmrEdqPDAIAjf9IP3bb7kt6Bk
	KAZ5ckLW9z/i6unIBkADUBlbGEJvZebJmO0yWUIc/pevIuxuj0DoqhJsV0EUYi6eBf8y7P
	++aJ8lM/7fUqYz3RBGlyv+P10pZWEv6qxnOhJcfUbgv6Gox5UNA3hgQtnWM7fMSH0RLvnt
	7jejW+HK4zNNE3dAHIXU7/afkwSd+rdiSTNcBN7JFypcYbsGm+zW8TbTHh4S1A==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Yao Zi <me@ziyao.cc>,
	Frank <Frank.Sae@motor-comm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next v2 3/3] net: phy: motorcomm: Enable analog frontend on YT8531S
Date: Sat,  5 Sep 2026 09:28:28 +0200
Message-ID: <20260905072830.28986-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905072830.28986-1-maxime.chevallier@bootlin.com>
References: <20260905072830.28986-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_002902_008848_88DE5A29 
X-CRM114-Status: GOOD (  13.41  )
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

The YT6801 PCIe NIC includes the dwmac-motorcomm IP for the MAC part, as
well as a YT8531S PHY, configured in GMII mode.

It seems this PHY requires the Analog Front-end (AFE) DAC clock to be
enabled for link to reliably establish, otherwise the link just doesn't
come up.

Let's enable it at config_init() whenever the PHY is in GMII mode.

This logic has been extracted from the vendor driver provided by
Motorcomm.

It's really unclear if this is specific to the integrated version of
that PHY, and how this potentially interacts with the fiber mode this
PHY supports, so this configuration is only enabled when the interface
is GMII, i.e. the PHY is integrated.

With this, the PHY reliably establishes link and the YT6801 PCIe card
becomes fully functional. Supend/Resume was also tested, the link
stays operational after resume.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: Add details about suspend/resume testing and the fact we only do
    this in GMII mode.

 drivers/net/phy/motorcomm.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
index 36c229460a77..90a4f86f2758 100644
--- a/drivers/net/phy/motorcomm.c
+++ b/drivers/net/phy/motorcomm.c
@@ -144,6 +144,11 @@
 #define YT8521_CLOCK_GATING_REG			0xC
 #define YT8521_CGR_RX_CLK_EN			BIT(12)
 
+/* Analog front-end control register 3 */
+#define YT8531S_EXT_AFE_CTRL3			0x12
+/* Analog front-end DAC clock enable */
+#define YT8531S_AFE_CTRL3_CLKDAC_AON		BIT(13)
+
 #define YT8521_EXTREG_SLEEP_CONTROL1_REG	0x27
 #define YT8521_ESC1R_SLEEP_SW			BIT(15)
 #define YT8521_ESC1R_PLLON_SLP			BIT(14)
@@ -1740,8 +1745,15 @@ static int yt8531s_config_init(struct phy_device *phydev)
 	if (ret)
 		goto err_restore_page;
 
-	if (phy_interface_is_rgmii(phydev))
+	if (phy_interface_is_rgmii(phydev)) {
 		ret = yt8531_set_ds(phydev);
+		if (ret)
+			goto err_restore_page;
+	}
+
+	if (phydev->interface == PHY_INTERFACE_MODE_GMII)
+		ret = ytphy_modify_ext(phydev, YT8531S_EXT_AFE_CTRL3,
+				       0, YT8531S_AFE_CTRL3_CLKDAC_AON);
 
 err_restore_page:
 	return phy_restore_page(phydev, old_page, ret);
-- 
2.55.0


