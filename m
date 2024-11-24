Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F20D3B7C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 22:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UuJeCai5tiWosHWBozDPvC6IfFLgO2kYlWjyCFqxDc=; b=PQirh4C9xoZUkcAtKaeD9hXwcm
	GhGDXBEee4zILEUr0MIdsLgM7duBqEPc0WRzrYMA9Dh3jXazE2JQ7votIU1EfWJGZa+QHPOVbhR8H
	EPsfD4fBkFN2MA5nKLzo9NngpF3Rphe3ZBpUKYo+Z1aPuoe75mhbDJJvC+0f+BwXhAkw78oEKVkBh
	El/tiOvCcFeKeaZUb9jnZqQ3oclgCMqmL2O250h1wTfTCxx6Yp4hl5JNv+PGqy5YAwKBLCkPIiCR6
	pYv9BsVKg6KblluEsavWhYkJ65mSMElfMKMsjvxixkx8CF7i51l+OHMsFVWhjBesH7sClkzjY7vHL
	B6rP30ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFLPc-00000006kdz-2csP;
	Sun, 24 Nov 2024 22:49:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFLK0-00000006j5W-1JpZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 22:43:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4264D5C57A3;
	Sun, 24 Nov 2024 22:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDF25C4CEE2;
	Sun, 24 Nov 2024 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732488194;
	bh=ASdzTe34Z+d59Brp4wy1vpf4xly9YpxzqxiqU7BbVP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=shGXhO9qj4Vod1iK+HMfXSDtqQM9s5/H9cVNvy9RVzvhnza9IjZ027ogdED4byS5t
	 s+MJfWb+EDnSjLCrQE2wkRMpy2r+OT48KiIvxre5hd/5jRTpuVzNTGxXvleFFsPJ/s
	 twNYGcGnOdfSSA4U92WGbF+F1BfSSTx/aUIHBvq4PQDUQFMgjgmiU+yahbdvA2m3BP
	 OwzxwkFlUzZuQyGMhKzAMDNxInvEU0t75cAPpm0UB+6r/9H+SXmRUZ+u0b+E1UutWI
	 xX+WUhbR06ib5z6Rv1oYqcUunJUV5uebXwulyGyLs5F+WHyZqfwE2Yi1KUDX4nKw7n
	 ZgYsYAVZZsJSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9EED3B7C4;
	Sun, 24 Nov 2024 22:43:13 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 24 Nov 2024 23:42:35 +0100
Subject: [PATCH RFC net-next v6 04/15] net: phy: Add helper for mapping
 RGMII link speed to clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-upstream_s32cc_gmac-v6-4-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732488190; l=1509;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=fpWmpczGATKRZSZUfvD41WjUjGR83jNPIPJUZeOtjsk=;
 b=n+FUBIb08C4MW29U1TwIN+jAnwb5gQDX3x+iM8uBEh3wGvLkmbG8sYsamLmxZ3aCohoJLLMAT
 Zv6nMCNB+zzDPC7y7MBxFnFTGp/4Qv7JsyO2YTO7YrQKqRXCBCU24Ks
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_144316_441120_4EAFDB74 
X-CRM114-Status: GOOD (  10.82  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The RGMII interface supports three data rates: 10/100 Mbps
and 1 Gbps. These speeds correspond to clock frequencies
of 2.5/25 MHz and 125 MHz, respectively.

Many Ethernet drivers, including glues in stmmac, follow
a similar pattern of converting RGMII speed to clock frequency.

To simplify code, define the helper rgmii_clock(speed)
to convert connection speed to clock frequency.

Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 include/linux/phy.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 77c6d6451638..9d0717ccd5c0 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -298,6 +298,29 @@ static inline const char *phy_modes(phy_interface_t interface)
 	}
 }
 
+/**
+ * rgmii_clock - map link speed to the clock rate
+ * @speed: link speed value
+ *
+ * Description: maps RGMII supported link speeds
+ * into the clock rates.
+ *
+ * Returns: clock rate or negative errno
+ */
+static inline long rgmii_clock(int speed)
+{
+	switch (speed) {
+	case SPEED_10:
+		return 2500000;
+	case SPEED_100:
+		return 25000000;
+	case SPEED_1000:
+		return 125000000;
+	default:
+		return -EINVAL;
+	}
+}
+
 #define PHY_INIT_TIMEOUT	100000
 #define PHY_FORCE_TIMEOUT	10
 

-- 
2.47.0



