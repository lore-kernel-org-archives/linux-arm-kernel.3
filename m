Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E133C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wj8VPdl7JJMUxkOQJdXb1UsPb2KJIUo3/JtoqwRQfiE=; b=kcMHy/bAHQndDa9GxAuaqIL89e
	AtTeOab9LTpwx5ogo0Fwh0bCxVdHsgyuzjVJByMEkDvvXX8VqalOBapNky/LaKZUYS+/77XtWjJlc
	CiuCgxG0MOYhTaiCsAlFwnODmAHWfg6eNA2mHMdVGEm/R5h80E679jd+B0RkAXwfJt8huIlgxExIg
	OVbuhBFZ1dzqcKYM++y5TKXDJwxXht08vuJ4j18jexhPSyY8aGlae1KAl1P890m0yDyVRFugBM2m3
	2WkumyJ+nJxWqeUnYGan+wdvFqh4g1he8eHHfl+x+VwD7sUNgvutuL1kE8qDnO3/VCtZab/8a0CdS
	N1RtSdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNZh-00000004VVr-1v3e;
	Tue, 18 Mar 2025 03:25:05 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNKZ-00000004TOB-29CD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742267367; x=1773803367;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RAZGfMmK/uDYInMN3Xs3DNFQYHhdYcUfUBmMsD3eoG0=;
  b=BE4esuB9xPRm+NmmHuic/A7Dg9bFcIh4inBPd6heGwar+rvO1crESpa0
   EVYpRLL1h2cZSI0wErb4jVel5WkUu8HFqf8qvgONSc9YQDNbklRYTfoQU
   DEJeqCqfST2mGI5AvqTCSyZ9Qp2oCzFnX0yqWCh9Ur/iWLtyv7A9kZuFw
   rg1punUG1fUPw5bh5HIMucp8Mr1I2Ud3kykJBVDoP93ORX9+n7+wIrTtl
   dXS3UVucmt4JwP+CFs2ui8ObnnKX30aXtX8kwljfhVWhjlqwhYBNwPLrf
   VpFCwxWDqTDkzuhAWHv0lF9VMKPuf6vQsiw8vBJixBMIMosH/03Pp8XSH
   A==;
X-CSE-ConnectionGUID: u91tsN7sSaypYfcwv/wiOw==
X-CSE-MsgGUID: ahUJFhhwTE266iyqpDAPJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54383078"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="54383078"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 20:09:26 -0700
X-CSE-ConnectionGUID: NdZjE5swTIKwx89FIAMv7A==
X-CSE-MsgGUID: OYbGeDgtSVec095CgxBV8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126313887"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2025 20:09:18 -0700
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Hariprasad Kelam <hkelam@marvell.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Chwee-Lin Choong <chwee.lin.choong@intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH iwl-next v10 08/14] igc: use FIELD_PREP and GENMASK for existing RX packet buffer size
Date: Mon, 17 Mar 2025 23:07:36 -0400
Message-Id: <20250318030742.2567080-9-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_200927_602621_30DA7050 
X-CRM114-Status: GOOD (  10.70  )
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
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index db937931c646..3564d15df57b 100644
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
2.34.1


