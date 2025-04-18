Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6B9C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eyh7LA4ZZI2Gyw5dRXE+IXYk7MEy1NxIGXLhi+Z1Y8w=; b=N+Nq3dDLCnivVDNz8E41GKBX+h
	nvIxA2VumFiHXv2qsGp4h6RlvtZcvr1amlza/UijRBMI05UHLnSQv5lluLJKyPIy32TSNAKY4/Gyx
	daki1uuuI2c0n5H5WnG9gFc0XAjQXf/ZN0RFivVXch3tZ0Dbq3o4qx9EubLFjKQhZzkkwA7o3FJ24
	i3GcCZlS1OlfOnQNo+AcEeHIkVl0tkbZV1R3c227dl719SobdI0hkk3btBWzh9uNmZmuoUj8A3gTT
	7sPOfbDf00FaXMsegPpTN660uLDs0tuCsWsI2slHT9gEIfYmmkl2vYLkAaoROepuP8nEBzKtj1JCI
	7zQF+rPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5p1I-0000000H6s8-49D8;
	Fri, 18 Apr 2025 16:56:53 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ojf-0000000GyhG-2uTN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 16:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744994320; x=1776530320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q7xILmCUIdiQQUv2BVkO4pHZIFRPAtA5ohjA3TYi4Dw=;
  b=APSexM6jDcQbVbRfeCjwLa8m5iriVlXZro/S98WMsatg/NPXBz0Za1r9
   QWBuGzKDs1i7KSO73iSpnnpnANYLapFfwMJdkK35EJFG5TjoZsDHHmv6v
   viqmDa6Tibss6UeA9J6qSmh/FI0BSrzXaDoJTEQz9OH9pHpx8pKtSXPD9
   X5oqWNl1+M04M7/gqQKPNdqL5jRzO2/vRCjwf7MJaYz2auEmac7HHyuay
   iczy+KQE0EgVB6RLf0O0NJ4JOEIkAkv87rqYv4CVR9WgpR75SGuc1Vsl9
   JpAg5lV86JH+NEyUfO/wbcl3tDhGGKJrh0nUPBYDo9Gdbo1M/sNs9wnuH
   A==;
X-CSE-ConnectionGUID: pCmliQ7TRFKc5sw8VNLLKA==
X-CSE-MsgGUID: MgtYGvyBTySOo35p35/2qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454411"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="50454411"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 09:38:36 -0700
X-CSE-ConnectionGUID: bUoT+eHZQxO+bo78FB1r8w==
X-CSE-MsgGUID: QPxAPYuNQympF3jUo5HBDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="130892274"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:35 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	netdev@vger.kernel.org
Cc: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	anthony.l.nguyen@intel.com,
	vinicius.gomes@intel.com,
	vitaly.lifshits@intel.com,
	dima.ruinskiy@intel.com,
	przemyslaw.kitszel@intel.com,
	chwee.lin.choong@intel.com,
	yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com,
	horms@kernel.org,
	linux@armlinux.org.uk,
	xiaolei.wang@windriver.com,
	hayashi.kunihiko@socionext.com,
	ast@kernel.org,
	jesper.nilsson@axis.com,
	mcoquelin.stm32@gmail.com,
	rmk+kernel@armlinux.org.uk,
	fancer.lancer@gmail.com,
	kory.maincent@bootlin.com,
	linux-stm32@st-md-mailman.stormreply.com,
	hkelam@marvell.com,
	alexandre.torgue@foss.st.com,
	daniel@iogearbox.net,
	linux-arm-kernel@lists.infradead.org,
	hawk@kernel.org,
	quic_jsuraj@quicinc.com,
	gal@nvidia.com,
	john.fastabend@gmail.com,
	0x1207@gmail.com,
	bpf@vger.kernel.org,
	Mor Bar-Gabay <morx.bar.gabay@intel.com>
Subject: [PATCH net-next 08/14] igc: use FIELD_PREP and GENMASK for existing RX packet buffer size
Date: Fri, 18 Apr 2025 09:38:14 -0700
Message-ID: <20250418163822.3519810-9-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_093839_776894_33EDE607 
X-CRM114-Status: GOOD (  10.58  )
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

From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>

Prepare for an upcoming patch that modifies the RX buffer size in TSN mode.
Refactor IGC_RXPBSIZE_EXP_BMC_DEFAULT and IGC_RXPBS_CFG_TS_EN using
FIELD_PREP and GENMASK to improve clarity and maintainability. Refactor
both macros for consistency, even though the upcoming patch only use
IGC_RXPBSIZE_EXP_BMC_DEFAULT.

The newly introduced macros follow the naming from the i226 SW User Manual
for easy reference.

I've tested IGC_RXPBSIZE_EXP_BMC_DEFAULT and IGC_RXPBS_CFG_TS_EN before
and after the refactoring, and their values remain unchanged.

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Tested-by: Mor Bar-Gabay <morx.bar.gabay@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index 5502edd6261f..12a16a7acb03 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -396,9 +396,20 @@
 #define IGC_RCTL_PMCF		0x00800000 /* pass MAC control frames */
 #define IGC_RCTL_SECRC		0x04000000 /* Strip Ethernet CRC */
 
-/* RXPBSIZE default value for Express and BMC buffer */
-#define IGC_RXPBSIZE_EXP_BMC_DEFAULT	0x000000A2
-#define IGC_RXPBS_CFG_TS_EN		0x80000000 /* Timestamp in Rx buffer */
+/* Mask for RX packet buffer size */
+#define IGC_RXPBSIZE_EXP_MASK		GENMASK(5, 0)
+#define IGC_BMC2OSPBSIZE_MASK		GENMASK(11, 6)
+/* Mask for timestamp in RX buffer */
+#define IGC_RXPBS_CFG_TS_EN_MASK	GENMASK(31, 31)
+/* High-priority RX packet buffer size (KB). Used for Express traffic when preemption is enabled */
+#define IGC_RXPBSIZE_EXP(x)		FIELD_PREP(IGC_RXPBSIZE_EXP_MASK, (x))
+/* BMC to OS packet buffer size in KB */
+#define IGC_BMC2OSPBSIZE(x)		FIELD_PREP(IGC_BMC2OSPBSIZE_MASK, (x))
+/* Enable RX packet buffer for timestamp descriptor, saving 16 bytes per packet if set */
+#define IGC_RXPBS_CFG_TS_EN		FIELD_PREP(IGC_RXPBS_CFG_TS_EN_MASK, 1)
+/* Default value following I225/I226 SW User Manual Section 8.3.1 */
+#define IGC_RXPBSIZE_EXP_BMC_DEFAULT ( \
+	IGC_RXPBSIZE_EXP(34) | IGC_BMC2OSPBSIZE(2))
 
 /* Mask for TX packet buffer size */
 #define IGC_TXPB0SIZE_MASK		GENMASK(5, 0)
-- 
2.47.1


