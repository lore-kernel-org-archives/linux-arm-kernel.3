Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB39C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6K3rMkGKwZc5jvMd/z4ZpGe61fYCEZVXizmE07X2kg8=; b=b02X5Y1CNpSfybrPEYIVwhYBoA
	qU65jYFeqwaZC8isnRKbYcYa+F0lkSoW//SBm7VUuQarcywjkv3uYkmy62kUHUK1/YdAvqGyxFZPR
	KvMNZ2wnui2IMOLnitPI/4d6Qu0H3Guy6pYp3tfoiUijwNw8CEp3NaBsVxUS31eeN/wfwMBKf3uoo
	7djT6tekwXtFEdRK2vTYzpQbAX60A0fy3QdGY4tAEHoOFNs/SF8Umh7e82C/4n8NnnJ5w8aNz4P8e
	AC92ADcHUwNUQDS5vgmL9FHp+Jfm0ePP6r0kFFUcfKgBWJJdK3JUmMo2tNNv2QBqratl6JYsAKSWK
	nviCutJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNUj-00000004V1s-1cgR;
	Tue, 18 Mar 2025 03:19:57 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNKB-00000004TJp-0uUg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742267343; x=1773803343;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cRb+CbjWo0ZjK0e4vuvO/MeSF/KtBDAkMvyjIUZVP0Y=;
  b=FRMVhL9av5aicfXTQLX/RisbwJ4+NZr5yI3ScPkoA9o0Z/PpbL122O2e
   hFsoltAKCUxYs0skfeJ8mqCGnkJ+ou/uf3VrJ4kVj/It0gr3l5oq/3w3F
   qVeW5BM6STr9prXVNHUnujBPNThUNfswFbZYhpsEQ35Nda6saSGzL5V+y
   2GxQObc3HeIiJE5fW5gbYCLoEioN0JqwSdkQJd/mvf416x8mlQiQYm8u7
   8NovkdVX5y4RE2ZG9uqzMzfUbvD4HmGUfbVZeXlc8nmwimvkHyfP3Rm1R
   HcForriTEliyDshW0fw6FzyUdTIQRMSnPWs5DTnHWvd+HyeU1Bb5c5xpv
   g==;
X-CSE-ConnectionGUID: JqQ2K6mQRDGPrWG46JF2CQ==
X-CSE-MsgGUID: k+4HfLJoQTOnte8OY+Wd+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54382978"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="54382978"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 20:09:02 -0700
X-CSE-ConnectionGUID: 6ScQ+CC6QASbNGSWqJ1K2Q==
X-CSE-MsgGUID: 8G7UL6nyQd65/FtNHfjpZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="126313814"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2025 20:08:55 -0700
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
Subject: [PATCH iwl-next v10 05/14] igc: rename I225_RXPBSIZE_DEFAULT and I225_TXPBSIZE_DEFAULT
Date: Mon, 17 Mar 2025 23:07:33 -0400
Message-Id: <20250318030742.2567080-6-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
References: <20250318030742.2567080-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_200903_299179_CD5835CA 
X-CRM114-Status: GOOD (  13.28  )
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

Rename RX and TX packet buffer size macros in preparation for an
upcoming patch that will refactor buffer size handling using FIELD_PREP
and GENMASK.

Changes:
- Rename I225_RXPBSIZE_DEFAULT to IGC_RXPBSIZE_EXP_BMC_DEFAULT.
  The EXP_BMC suffix explicitly indicates Express and BMC buffer
  default values, improving readability and reusability for the
  upcoming changes, while also better reflecting the current buffer
  allocations.
- Rename I225_TXPBSIZE_DEFAULT to IGC_TXPBSIZE_DEFAULT.

These registers apply to both i225 and i226, so using the IGC prefix
aligns with existing macro naming conventions.

Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 7 ++++---
 drivers/net/ethernet/intel/igc/igc_main.c    | 4 ++--
 drivers/net/ethernet/intel/igc/igc_tsn.c     | 2 +-
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index 8e449904aa7d..b6744ece64f0 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -396,9 +396,10 @@
 #define IGC_RCTL_PMCF		0x00800000 /* pass MAC control frames */
 #define IGC_RCTL_SECRC		0x04000000 /* Strip Ethernet CRC */
 
-#define I225_RXPBSIZE_DEFAULT	0x000000A2 /* RXPBSIZE default */
-#define I225_TXPBSIZE_DEFAULT	0x04000014 /* TXPBSIZE default */
-#define IGC_RXPBS_CFG_TS_EN	0x80000000 /* Timestamp in Rx buffer */
+/* RXPBSIZE default value for Express and BMC buffer */
+#define IGC_RXPBSIZE_EXP_BMC_DEFAULT	0x000000A2
+#define IGC_TXPBSIZE_DEFAULT		0x04000014 /* TXPBSIZE default */
+#define IGC_RXPBS_CFG_TS_EN		0x80000000 /* Timestamp in Rx buffer */
 
 #define IGC_TXPBSIZE_TSN	0x04145145 /* 5k bytes buffer for each queue */
 
diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 99123eef610b..6f0110e3ac22 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -7156,8 +7156,8 @@ static int igc_probe(struct pci_dev *pdev,
 	}
 
 	/* configure RXPBSIZE and TXPBSIZE */
-	wr32(IGC_RXPBS, I225_RXPBSIZE_DEFAULT);
-	wr32(IGC_TXPBS, I225_TXPBSIZE_DEFAULT);
+	wr32(IGC_RXPBS, IGC_RXPBSIZE_EXP_BMC_DEFAULT);
+	wr32(IGC_TXPBS, IGC_TXPBSIZE_DEFAULT);
 
 	timer_setup(&adapter->watchdog_timer, igc_watchdog, 0);
 	timer_setup(&adapter->phy_info_timer, igc_update_phy_info, 0);
diff --git a/drivers/net/ethernet/intel/igc/igc_tsn.c b/drivers/net/ethernet/intel/igc/igc_tsn.c
index 1e44374ca1ff..498741d83ca6 100644
--- a/drivers/net/ethernet/intel/igc/igc_tsn.c
+++ b/drivers/net/ethernet/intel/igc/igc_tsn.c
@@ -136,7 +136,7 @@ static int igc_tsn_disable_offload(struct igc_adapter *adapter)
 	int i;
 
 	wr32(IGC_GTXOFFSET, 0);
-	wr32(IGC_TXPBS, I225_TXPBSIZE_DEFAULT);
+	wr32(IGC_TXPBS, IGC_TXPBSIZE_DEFAULT);
 	wr32(IGC_DTXMXPKTSZ, IGC_DTXMXPKTSZ_DEFAULT);
 
 	if (igc_is_device_id_i226(hw))
-- 
2.34.1


