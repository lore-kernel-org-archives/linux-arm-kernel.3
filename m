Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269A4C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKePTgLtlr7um5Ie/91xISsNX94n0i0W0VoW9XReHKI=; b=nrcKqmI32dwZ0hd/ouoAVQtybL
	PgloKz3/9of6HXDjOqxSJ8RLEZVVQwbxVQ4fE7l9RSmpokn+U5awC6R6GgnJB9LXx4gfk6kEG1QJ7
	Iy+KqjysKgG5zm4YJIDdBlJk7qRvIAjwF5oybiNI8JeidjtbBCodEm73E5lQun4V91Q/vyQJhEkD/
	KGrsbTT8CwFl8PCT44QYZJQkLJ0uq6+ruwYpps4j/rHv0TuIPnP3d1yKlO/qfJ6u2/rzRfiiS0LeB
	2NRBPHSluYzqB8qAJSBxtAKQZ8Hf9sTg73yZewRcZBMdkMGBUUy0BziYDexThTL8TqsxMBK9mxy4V
	xEC3ygVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1rb-00000006PfV-2IoT;
	Thu, 06 Feb 2025 13:24:15 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1nW-00000006OUr-2cNi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 13:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738848002; x=1770384002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNtTlK3zrQ3pUqE98n7LamGp1Phad6RbqOSjmk69PnU=;
  b=EwknouY0MfmOrtYMORvXRgU/TpYJTNyosL8XTzgcVl+VLD+KCNurpdPM
   rLD/3m/PSH1EqOTjtDwLAIkrN2w+LKFsR8n5el2MT+M1w42tshzyc8nt8
   248K3XE8MAtABuPMmlfTcrzPu3ri1yGm31qtZ6zjaXBBnJDWma0aoAup1
   qMvIyeUzYiqJH7ubA/styMJUY7Ok0wZKqcemKBaR+PZAcNhjS6Ctn/aEV
   TEyxnMEYOBXQzLRI0tQtxk6RRQ4w8l9rVKz5prSagRMYceA24rBDzPp0t
   7DnP8WQoNSqFJomb1C3OPxrb69tzHiTe7rbotEdroJaSHVS0cDoxM4GPg
   w==;
X-CSE-ConnectionGUID: H+yn5Jh3Tsy5WKLPYAn6Sw==
X-CSE-MsgGUID: uKz06XHRT7CX0l4XUGqLqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43203666"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="43203666"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 05:20:02 -0800
X-CSE-ConnectionGUID: 9/TJMZRrRaG+Sr4uP18YlA==
X-CSE-MsgGUID: DZg8n8SMThKMUL8EM0SwPg==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116397203"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 05:19:55 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v7 1/7] net: phylink: use pl->link_interface in phylink_expects_phy()
Date: Thu,  6 Feb 2025 21:18:53 +0800
Message-Id: <20250206131859.2960543-2-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_052002_712910_3B7495A6 
X-CRM114-Status: GOOD (  10.81  )
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

The phylink_expects_phy() function allows MAC drivers to check if they are
expecting a PHY to attach. The checking condition in phylink_expects_phy()
aims to achieve the same result as the checking condition in
phylink_attach_phy().

However, the checking condition in phylink_expects_phy() uses
pl->link_config.interface, while phylink_attach_phy() uses
pl->link_interface.

Initially, both pl->link_interface and pl->link_config.interface are set
to SGMII, and pl->cfg_link_an_mode is set to MLO_AN_INBAND.

When the interface switches from SGMII to 2500BASE-X,
pl->link_config.interface is updated by phylink_major_config().
At this point, pl->cfg_link_an_mode remains MLO_AN_INBAND, and
pl->link_config.interface is set to 2500BASE-X.
Subsequently, when the STMMAC link goes down and comes up again,
it is blocked by phylink_expects_phy().

Since phylink_expects_phy() and phylink_attach_phy() aim to achieve the
same result, phylink_expects_phy() should check pl->link_interface,
which never changes, instead of pl->link_config.interface, which is
updated by phylink_major_config().

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/phy/phylink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 214b62fba991..c173cd8db475 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2046,7 +2046,7 @@ bool phylink_expects_phy(struct phylink *pl)
 {
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
 	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
-	     phy_interface_mode_is_8023z(pl->link_config.interface)))
+	     phy_interface_mode_is_8023z(pl->link_interface)))
 		return false;
 	return true;
 }
-- 
2.34.1


