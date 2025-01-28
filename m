Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE685C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjfjNKm/xo2FxoguYUayqpH53OkqmwqZ6YW5PTiaRAA=; b=mNcNW5neoEa6NZso+GtHrxIEyg
	S2julkvEKI8w94RwCzySyVwHWpj2f3pBzBZSdsVMiWVwZDqlmNwuUnO6F/swMQIU+R1PaEsutPqqq
	al76WAhOMoxPsPmMvDNzqIiTkA39hGlc7W3j8wZd9zm4VAB+fmAHQlVYg63kp2iaptkEHrPdz6+ap
	owK/jMNVvv/q6Pg2RrpUFqW8FCWavOKqlH2ipCXg9UC9a7PxpQjl5AHdgAuGNxDAuMWROyD24WH+P
	83z6JTSBGmFAj5Dun6paEao4v3fPsJl9wk2gGLMc7HVfpohCknJqfbtHV0zDcmQE5TGMIEcfea8Ay
	LQ8Pe3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoFS-00000005I1q-07aD;
	Tue, 28 Jan 2025 16:15:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcnpg-00000005CZV-1BiO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 15:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QjfjNKm/xo2FxoguYUayqpH53OkqmwqZ6YW5PTiaRAA=; b=nT5Dv/isQyqg2A6Zpg5uYzZgJV
	GJgeT+5RxL5VFevCe7+etGRGUz0qWi3s/wBMlrtc0EVIQDuOlxdTZaYiLXsXWWwNBz7HQinSj7pxx
	f2kjB4IFBIa+Xq66IJqhnK4xSfq1xGuqO1FcUGJ+BKidPxrRI3q1CGob+pjrkdKm/ZicxKoRaOjH2
	dLYychnTrxIu8VEabL7f4GDHgCuhSBe+mD1OnRh2U64+3bBiBMh944L7gbLlY+w8I46ehYvzRNjkV
	Th9YXbyRPR8phuCyUM+l0BVFct+jMkhHUltRse7/EKgUlc74BxyJbx8wkc5GM4tBDej5cTZ51tLs9
	abt1woqA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59942 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tcnpb-0007YU-28;
	Tue, 28 Jan 2025 15:48:51 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tcnpI-0037I6-CA; Tue, 28 Jan 2025 15:48:32 +0000
In-Reply-To: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
References: <Z5j7yCYSsQ7beznD@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	 Vladimir Oltean <olteanv@gmail.com>,
	 Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH RFC net-next 21/22] net: xpcs: clean up xpcs_config_eee()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tcnpI-0037I6-CA@rmk-PC.armlinux.org.uk>
Date: Tue, 28 Jan 2025 15:48:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_074856_343350_E50FC3A8 
X-CRM114-Status: GOOD (  11.54  )
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

There is now no need to pass the mult_fact into xpcs_config_eee(), so
let's remove that argument and use xpcs->eee_mult_fact directly. While
changing the function signature, as we pass true/false for enable, use
"bool" instead of "int" for this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6a28a4eae21c..cae6e8377191 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -602,8 +602,7 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		__set_bit(compat->interface, interfaces);
 }
 
-static int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
-			   int enable)
+static int xpcs_config_eee(struct dw_xpcs *xpcs, bool enable)
 {
 	u16 mask, val;
 	int ret;
@@ -618,7 +617,7 @@ static int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns,
 		      DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
 		      DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
 		      FIELD_PREP(DW_VR_MII_EEE_MULT_FACT_100NS,
-				 mult_fact_100ns);
+				 xpcs->eee_mult_fact);
 	else
 		val = 0;
 
@@ -1197,14 +1196,14 @@ static void xpcs_disable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
-	xpcs_config_eee(xpcs, 0, false);
+	xpcs_config_eee(xpcs, false);
 }
 
 static void xpcs_enable_eee(struct phylink_pcs *pcs)
 {
 	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
 
-	xpcs_config_eee(xpcs, xpcs->eee_mult_fact, true);
+	xpcs_config_eee(xpcs, true);
 }
 
 /**
-- 
2.30.2


