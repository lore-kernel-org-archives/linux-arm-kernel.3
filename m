Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95177D2AB33
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUD7v1wm0Jg5VpltZUrd0TSJuZblbrkqsBeqp691CjA=; b=rQpV102VSw+Fyzghj15zHqk3f7
	VligI8PFVPgxPW6PnNqCaCnzaPb7soHcRsz+0xup0XAQU3CuOLd4q6rvmPu7Q/HQQArDa59dutzbq
	kTBD2yrxIQwRv4v/7LWdYE5yiobXUfSUHfGkN/QavFRqsJ/ZZu8s36Y3DN1ZUtGmCNcXFJV5gKQFR
	DKfLWX1BHmUhTeMfxGgFa3FBycVPk5Eb1p0sijf9zn4nfDblFTppcdElsoP3win+squ+bRsn4yw56
	QV30gJereO3AnOEuMpko3qdEdS9Ma7kc/3EjqOXWfKfNow88lsJZ7YhNnTtjisP6RrxU3ro+TwE2g
	FAjJ9AVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lKe-0000000EP40-2DFt;
	Tue, 29 Oct 2024 12:28:20 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5knu-0000000EIpp-0DGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 11:54:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B18B71C000E;
	Tue, 29 Oct 2024 11:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730202868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUD7v1wm0Jg5VpltZUrd0TSJuZblbrkqsBeqp691CjA=;
	b=GNwaBCtEDNN5Vtvtqfbwo/7F8ONXzQ6v5nt0z2SdjKzWqPCJq1/aIlYovSp1dCy2uNc1JS
	kfXhxirXXt81klReWhrCRVPXaDM7CCPuGVTUFPZJQo9evFC2rK5/5ru5vVMA8cxvR5/WdQ
	g/KV7QTTx0PmM8+OujqpratJ504Lac0vquiWKyIae9BupmCrtsXdUAo/Wp6fx3sstme784
	voTA6xpCtPPq17SlBn4s4DcxR63Slur0haH7BKFkWvhhzT1iWDIDPX5DjAOzkXmS+30JXt
	yKyxoJg1c5IHfja6KdLPe0HyabP2lRhZYeFNVCuT/w3VW4Xr6PtD43WQj0EH+Q==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 6/7] net: stmmac: Enable timestamping interrupt on dwmac1000
Date: Tue, 29 Oct 2024 12:54:14 +0100
Message-ID: <20241029115419.1160201-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_045430_303473_73899FB8 
X-CRM114-Status: UNSURE (   9.95  )
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

The default configuration for the interrupts on dwmac1000 have the
timestamping interrupt masked. Now that the timestamping has been
adapted to dwmac1000, enable the timestamping interrupt on these
platforms.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 600fea8f712f..9cc98f21a83f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -41,8 +41,7 @@
 #define	GMAC_INT_DISABLE_PCS	(GMAC_INT_DISABLE_RGMII | \
 				 GMAC_INT_DISABLE_PCSLINK | \
 				 GMAC_INT_DISABLE_PCSAN)
-#define	GMAC_INT_DEFAULT_MASK	(GMAC_INT_DISABLE_TIMESTAMP | \
-				 GMAC_INT_DISABLE_PCS)
+#define	GMAC_INT_DEFAULT_MASK	GMAC_INT_DISABLE_PCS
 
 /* PMT Control and Status */
 #define GMAC_PMT		0x0000002c
-- 
2.47.0


