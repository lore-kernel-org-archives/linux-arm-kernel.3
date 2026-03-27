Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022E710BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tibx8vMHnptfbpbnZSF056sU8aLPqP44jmZNN4Qx7ek=; b=BjvmpXF72VSZVJSheGrAmoT0Ol
	4joXeP74McoYbIxZGEs6UKxoxe+89IwunVBGW7OUH38iHKaAOJpuXAtWPcvz23jfUrf/Xg2Ub5V8r
	U6gNvUih81VSX9BACP8F1eRwnGNRhmFOtldwKZZy3Y+ZgxioZuNbGYRK77lP6woaSzfZ0SK0TAfLU
	nm/EZ9QzPfYslAhTy/RlWxJ3V1NG3AXdlotTXB8liaXBMJRTnLV9hn+LAovx9KGz7YkC8RdB7MDXf
	37y0pOyiR6iwWCIcBk0j0IgTziYHYhGX6JW8RuUw8xphSLOkBxV4UdA9MTK3nO7ywSVc4NAe71GqU
	ydbBJf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nt-00000006zyT-0rNH;
	Fri, 27 Mar 2026 08:44:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nn-00000006zsj-05l5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=tibx8vMHnptfbpbnZSF056sU8aLPqP44jmZNN4Qx7ek=; b=b72Ab5NNvLXcOIE4olQAwuBSTz
	YQ9NLEGnem+V93iTsII1RW/uFumBYsUdgc3A5ppljcEqPMKQcCrdFbpDgZIVG09GKydo0DNKBsFly
	qPQhowMiaXeHw3phHkMaTJRFUXTqZxDlgex1lT8oLmqFLn3MqrbvApMT3ZnLX4r0mbpJm3StAqbQu
	/bVIMxf1xr1WovqpP9/feCIbXtdaKl4QlyO6xweRZotrUmho6cBeCF47YF8nD+D5Mu8WMcVbrXKxK
	Ccbm5pEznbBXqnaPTH6ekKS8ZDTRvmRg9BI20xgyfsWV4wlOdn/LOBbPR+QxhrnWqsJcLF9imr9/y
	l3ky5Tbw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nk-00000009ztT-0ioP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tibx8vMHnptfbpbnZSF056sU8aLPqP44jmZNN4Qx7ek=; b=0pTJoRAjwemnv5nkxuXicwRVqa
	+zYlOE/UPTBpsxAPRefqK9Qf5PQ2kYqrNMRSHxpM6W86z0udBdSjBQ3NPPP8++/Fpq5kzzl8VbVKJ
	Sat+froEoBrPdSJKiOfEvgmmq3DVXCLkarIIYHHgULiucgyLqimrEz48ipRJD/i61bMuNn7+gVxjH
	G/JybZcBuzgwzZLzGnCMYLEK7JbZbVHlKvfFeGSLcGj3yNIqYxZTp8O/t6rntBwTMyWXTsy+eO7IB
	/oHwCDKh8R8sv+p51RDswyeLse3dJn79DV8XQDhsxVxxENHem96nnR98Cc1M67mk9TFUBGTLc6B2C
	2oYVqZBg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60928 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nb-000000005qg-3v4L;
	Fri, 27 Mar 2026 08:44:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62nZ-0000000E3Ce-0lyP;
	Fri, 27 Mar 2026 08:44:09 +0000
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
Subject: [PATCH net-next v2 09/15] net: stmmac: qcom-ethqos: move
 RGMII_CONFIG2_RSVD_CONFIG15 out
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62nZ-0000000E3Ce-0lyP@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:09 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084420_379608_CD5FE089 
X-CRM114-Status: UNSURE (   8.30  )
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

All paths through the switch clear the RGMII_CONFIG2_RSVD_CONFIG15
field. move it out of the switch statement.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2751def922df..13f4df0a90d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -434,10 +434,11 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      FIELD_PREP(RGMII_CONFIG_MAX_SPD_PRG_9, 19),
 			      RGMII_IO_MACRO_CONFIG);
 
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
+		      RGMII_IO_MACRO_CONFIG2);
+
 	switch (speed) {
 	case SPEED_1000:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -462,9 +463,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      RGMII_IO_MACRO_CONFIG2);
-
 		if (ethqos->has_emac_ge_3)
 			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_IO_MACRO_CONFIG2);
@@ -485,8 +483,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      RGMII_IO_MACRO_CONFIG2);
 		if (ethqos->has_emac_ge_3)
 			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_IO_MACRO_CONFIG2);
-- 
2.47.3


