Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6712ED65C58
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8NT0ilLNLQv2fbYQnuudZNQtXrZHfRBWCgEeAGsrXE=; b=PR/eed45vEd5MQjOgHm7YlPpHS
	0XJ5LU+9sJQp9qmWa4dPEP8YXCjrqBeBxW9U/35Igogosjrp2Z9dVLRGqA3zpqBcr87w+5WLB1Fim
	wpRki3FHHAuSyCvuE2ssij5DwB+mLjrUdhaq0If16ylEC6scDjK24VA/erN6r7KITDu7GKKMW1YND
	uFg4BdzVZu2lhkZu1AQAFEXoV+djkAzcaRsoBqvzWyUBss7bex21YS+Fr/oZ1rYQkqwVj7QdCRjqp
	lAahvVYSR9H3R6K9tHUyoHgblZ9B3oEbsKjYznSODuD0ed2FvYhpEyu56ck6N7Yd67liPyTE0k1id
	QNy79izA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBV8B-00000009CJg-3Uq3;
	Thu, 14 Nov 2024 08:23:11 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBV2n-00000009BU8-1zAX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 08:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731572258; x=1763108258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xrJukahaxgNQYaY6Ib9PxdkI6uOeHardKxoJD+xZf7U=;
  b=MlMrFEFBLT9YeaZKjbMOg9TyU/k3CxrAr49Y6F3jevhDMtCud1BYgELT
   jjnJ5JLoiNenYZj3GxAsHJZHG0qjC9swX0fiJtxbULw7rpHMbbBxBQ9uj
   dcp4pbAN3Hq1MPuJ14Qp6WIOeR5xHroFWwVGT/JESCGjUc8SNY5wcFF0A
   trwwN4HDvXxGhjHCXKHq4rt0bqH8B9x4iMhPOvd6wNn3Z1FTzovRdes/Z
   s3/pam1vdAuw8C0ZjdHwnMOSYEVNSMaVdJaRHgEzSu0/CAzMcG33Dlqgy
   IO8qsXg0rQZx4HbFpmBem3gfJVcQhdIKB8fntthSC8CoxRFX8YkRlS/2L
   w==;
X-CSE-ConnectionGUID: w8ikwESoRge8y/rgLs+q5Q==
X-CSE-MsgGUID: Ou6kJYVzTVKe8O3FdAswoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="42921283"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="42921283"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 00:17:37 -0800
X-CSE-ConnectionGUID: 6xlRLCGzRvCeAy4d+oc+aA==
X-CSE-MsgGUID: U32PUQYWQBSJGnHUzKVuGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="88553864"
Received: from unknown (HELO YongLiang-Ubuntu20-iLBPG12.png.intel.com) ([10.88.229.33])
  by fmviesa010.fm.intel.com with ESMTP; 14 Nov 2024 00:17:33 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net v1 2/2] net: stmmac: set initial EEE policy configuration
Date: Thu, 14 Nov 2024 16:16:53 +0800
Message-Id: <20241114081653.3939346-3-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
References: <20241114081653.3939346-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_001737_597543_D5C19A49 
X-CRM114-Status: UNSURE (   9.59  )
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

Set the initial eee_cfg values to have 'ethtool --show-eee ' display
the initial EEE configuration.

Fixes: 49168d1980e2 ("net: phy: Add phy_support_eee() indicating MAC support EEE")
Cc: <stable@vger.kernel.org>
Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7bf275f127c9..5fce52a9412e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1204,7 +1204,7 @@ static int stmmac_init_phy(struct net_device *dev)
 			netdev_err(priv->dev, "no phy at addr %d\n", addr);
 			return -ENODEV;
 		}
-
+		phy_support_eee(phydev);
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	} else {
 		fwnode_handle_put(phy_fwnode);
-- 
2.34.1


