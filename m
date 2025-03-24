Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAAFC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WiA+Xe+qiZGoPpJkEhjdACrTWE/ADK5dWkUWQQYaZ5A=; b=bJGm7QqS3T1kTzyDmBO1GSHTch
	vbaHhehBx5vgQvDZ7VPR8O7/T3s4vqfLIjccAQM3B+VhCuCRBTjygdklJohjbt6vlJchn+AdQgqlq
	MWgN48nBuo9m/5dbpupTrSt0+mUM3w4wtYZLB4cR13CkwonPuFlYG8Yr8aDI+h65sOGuxLk5cFXlg
	mdQfwZjNE8n9psvyfTOlMSJpUQn/q+MTiZEjHuwpZ4k0ikQELwwaHyX5TpKTFZgxQhcoZQg3hS+Vf
	DV7cCwxPR0e5IloiHFXDFjEmqdZ81v/dVZxD0L9BRSQiCajPwS3wsmSTHjKAikzLg2PiOVNjt5t03
	6ZSppq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbem-00000002MuV-3Dyk;
	Mon, 24 Mar 2025 06:51:32 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbHx-00000002K11-2Y4S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742797677; x=1774333677;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eITHe9O29qurQr+w4lnf9ce6r8QgdKu3VSz+sAB0QJc=;
  b=Kz1c6gg+Ias6OFknNF5dyEMfUNnD3OsOmHWhm0ZpymJk8xrV1UTYyD1J
   Kd2vlnW1hff7ekdCF1jVu6VNYXKL6DrkbJ/SCRiCRBTyCltZGvGBcz4BR
   rj0ZBqo/WvG4KMoDbbZlGHpOSgay6enaiUzdpWaYa+55GjfdGJa44eJ9d
   oeh8fw6A6luUz+Y7Go7EJpD9X6jtOHqfA6SYwKGwAWRlRoU+kr7t5tyIw
   tiX8T7Y5Ggxem0GvZhBCEbMJIQa1TBBKluV3PeACyORHCrzk3up374RJ9
   HdaJ1rz1uUr7VWGNl9RVXaIvFpFqZurnormgU3LhPHCn2TeXedpKBa2ao
   w==;
X-CSE-ConnectionGUID: Eu8LPwZbTI2GxU3XoC3tOA==
X-CSE-MsgGUID: WI3H4FyjSIiKE28t4TCr4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="47638763"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="47638763"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 23:27:56 -0700
X-CSE-ConnectionGUID: B48+T+GRQwqiLpAT4hNPdA==
X-CSE-MsgGUID: BDisJXbXTsSeVaZTCIRHpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; 
   d="scan'208";a="124901989"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by orviesa008.jf.intel.com with ESMTP; 23 Mar 2025 23:27:54 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v1 1/1] stmmac: intel: interface switching support for RPL-P platform
Date: Mon, 24 Mar 2025 14:27:42 +0800
Message-Id: <20250324062742.462771-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232757_707048_731C72D2 
X-CRM114-Status: GOOD (  10.47  )
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

Based on the patch series [1], the enablement of interface switching for
RPL-P will use the same handling as ADL-N.

Link: https://patchwork.kernel.org/project/netdevbpf/cover/20250227121522.1802832-1-yong.liang.choong@linux.intel.com/ [1]

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 5910571a954f..c8bb9265bbb4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1437,7 +1437,7 @@ static const struct pci_device_id intel_eth_pci_id_table[] = {
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_0, &adls_sgmii1g_phy0_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLS_SGMII1G_1, &adls_sgmii1g_phy1_info) },
 	{ PCI_DEVICE_DATA(INTEL, ADLN_SGMII1G, &adln_sgmii1g_phy0_info) },
-	{ PCI_DEVICE_DATA(INTEL, RPLP_SGMII1G, &tgl_sgmii1g_phy0_info) },
+	{ PCI_DEVICE_DATA(INTEL, RPLP_SGMII1G, &adln_sgmii1g_phy0_info) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, intel_eth_pci_id_table);
-- 
2.34.1


