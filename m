Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA07C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oO4CQSw7rzK75d5plA2q9hqOs/JoONpaksjhGIVo/pI=; b=rQAwYsOmuAOXmQkfY54nE9aLVk
	BuLophJPnKZQJrfqfWeQiWuEaJskG2kWRfICNwKGvIMNThwLKO39Gi78gqC1RYPBPq/Ju0a9sJf90
	4Z2dbOu0Jp6Y0ax18K9eAfP0Ft9v2jTc2PvEAZxP6qB4g32Bb51EjQJc6Pno7yAXeeE122GbAq5+6
	iEfE+2UEUIT3mKL1CX3sYIDCQXG/Y8ioFT6UxscEeId5xxVQjpZAuv4CMWAr+665XoOnKrLgwQ8cb
	uxaMNzyU6eUUx63t3+uXIqREoE4qRQptfXVsbP8fdzLGD3CYOICmaDgtHS6sWTC+MsOE2gnYZvj1X
	PFqZipxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNWO-00000004VCQ-0BM0;
	Tue, 18 Mar 2025 03:21:40 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNKI-00000004TKc-3Hr6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742267350; x=1773803350;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=O0fK5/NJ16oq12TJBtAiaYUTMAWhtIJvsRgrDuLihXc=;
  b=h8J2LCEC15MIExvYONydrAbB0GvHyF5SRfaVaecXpfcyjeTxGNQ3DI5l
   +DXfuKv41fdE4/tR5SAW2CYbCUD3YL+Q7J4YqnDGUK+on89WYWfhwotrY
   Gi8Q/159TlCPGeiYsQoc/1d9Szrxtxxdhnb0z8HWANsiUeH5DcaNY4k9t
   O7kyfQiL7yqguH4V7zPeocZI73g+NRlkljIvn7p/By1tfIP+aUAr5yehk
   Zy2hODuRDf17TAktjYGk7F03GtIRxveiybMu/8jdkTmUSjjwjRjYmFpyf
   guXPR0GINDrTO2RMYQ+5DKvFAHuqinh/LTUpO9n7Mf6+NLmRt9gjLj+ZE
   A==;
X-CSE-ConnectionGUID: 7PxW/pubRgugBfx8PwMo4Q==
X-CSE-MsgGUID: DcoN46uUQYi1pj+1LWZhhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54382994"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="54382994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 20:09:10 -0700
X-CSE-ConnectionGUID: lymCxIyuRPicsXPF/Gr7Dw==
X-CSE-MsgGUID: FYsgDx6pTFWhjwheNf0n3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126313844"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2025 20:09:02 -0700
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
Subject: [PATCH iwl-next v10 06/14] igc: use FIELD_PREP and GENMASK for existing TX packet buffer size
Date: Mon, 17 Mar 2025 23:07:34 -0400
Message-Id: <20250318030742.2567080-7-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_200910_857366_7F6302E0 
X-CRM114-Status: GOOD (  10.90  )
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

In preparation for an upcoming patch that will modify the TX buffer size
in  TSN mode, replace IGC_TXPBSIZE_TSN and IGC_TXPBSIZE_DEFAULT
implementation with new macros that utilizes FIELD_PREP and GENMASK for
clarity.

The newly introduced macros follow the naming from the i226 SW User Manual
for easy reference.

I've tested IGC_TXPBSIZE_TSN and IGC_TXPBSIZE_DEFAULT before and after the
refactoring, and their values remain unchanged.

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 23 ++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index b6744ece64f0..b180e1497cc5 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -398,10 +398,29 @@
 
 /* RXPBSIZE default value for Express and BMC buffer */
 #define IGC_RXPBSIZE_EXP_BMC_DEFAULT	0x000000A2
-#define IGC_TXPBSIZE_DEFAULT		0x04000014 /* TXPBSIZE default */
 #define IGC_RXPBS_CFG_TS_EN		0x80000000 /* Timestamp in Rx buffer */
 
-#define IGC_TXPBSIZE_TSN	0x04145145 /* 5k bytes buffer for each queue */
+/* Mask for TX packet buffer size */
+#define IGC_TXPB0SIZE_MASK		GENMASK(5, 0)
+#define IGC_TXPB1SIZE_MASK		GENMASK(11, 6)
+#define IGC_TXPB2SIZE_MASK		GENMASK(17, 12)
+#define IGC_TXPB3SIZE_MASK		GENMASK(23, 18)
+/* Mask for OS to BMC packet buffer size */
+#define IGC_OS2BMCPBSIZE_MASK		GENMASK(29, 24)
+/* TX Packet buffer size in KB */
+#define IGC_TXPB0SIZE(x)		FIELD_PREP(IGC_TXPB0SIZE_MASK, (x))
+#define IGC_TXPB1SIZE(x)		FIELD_PREP(IGC_TXPB1SIZE_MASK, (x))
+#define IGC_TXPB2SIZE(x)		FIELD_PREP(IGC_TXPB2SIZE_MASK, (x))
+#define IGC_TXPB3SIZE(x)		FIELD_PREP(IGC_TXPB3SIZE_MASK, (x))
+/* OS to BMC packet buffer size in KB */
+#define IGC_OS2BMCPBSIZE(x)		FIELD_PREP(IGC_OS2BMCPBSIZE_MASK, (x))
+/* Default value following I225/I226 SW User Manual Section 8.3.2 */
+#define IGC_TXPBSIZE_DEFAULT ( \
+	IGC_TXPB0SIZE(20) | IGC_TXPB1SIZE(0) | IGC_TXPB2SIZE(0) | \
+	IGC_TXPB3SIZE(0) | IGC_OS2BMCPBSIZE(4))
+#define IGC_TXPBSIZE_TSN ( \
+	IGC_TXPB0SIZE(5) | IGC_TXPB1SIZE(5) | IGC_TXPB2SIZE(5) | \
+	IGC_TXPB3SIZE(5) | IGC_OS2BMCPBSIZE(4))
 
 #define IGC_DTXMXPKTSZ_TSN	0x19 /* 1600 bytes of max TX DMA packet size */
 #define IGC_DTXMXPKTSZ_DEFAULT	0x98 /* 9728-byte Jumbo frames */
-- 
2.34.1


