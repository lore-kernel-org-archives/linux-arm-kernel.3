Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77FCC369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 16:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5toSrzdFJtTn9IV4YIfzEf6RqQEIYi3HO2AyZesJoZ8=; b=Xn/XbY/vcnoHaNH+j4xumsIaBw
	wharQUKpm8U0XyX54iaFxeiL0IIc7B0xncW/KQPRyDIgVsp32QbOhxGeUnmo+UObccKPAXIusPsiQ
	9ul4bZuoC70gAsH6Srv7AY0lsD99OEEWK4vuDFG9Ibb0TW7rtzUPafQ3OxdSm9GmZt2QJw56r0YKL
	ZMX39uGHEeNYR28YQ/dNnnISdOgftx4NszymaTce3gKwdYT3Y123tnAMWvMKGjy9eld2+IPp0v9eV
	7ObIhRhue+Qp8iwEX9tutxmNq31gqsG5QBShqSYtPD+YJfwwb+qpKq8vPRCWDm0IZOBpjzvPNhP3o
	TpZxUSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5oxT-0000000H5pR-1nis;
	Fri, 18 Apr 2025 16:52:55 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ojf-0000000Gygf-0K20
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 16:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744994319; x=1776530319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QL8UnrxzhOjr9Cxq9AJgHKXXFDVi01UtywCQhOOKU4s=;
  b=gHjRjKgi12jCIHMezRtNYpY36kbeVQUM9J5UOcKh/NLDOP8zHGwX39CP
   4NkWJcJD5r+MezXeZBi/fQdX6z5ca47+YnvEpJE+1kxAgvzmikTqwxGa4
   1+kjEXnbRTtA0U/IM/sgd4BoMEYHUWsM2bUUY+bK00yg5WlOIw5wHd3Ka
   W/PFac6E92MJVlDV7XjRReaUFN0gxl/VIJB0IIatPuA8qqObn4+0fgOgv
   Dbfj3CVNttg/cMgSSU9gtmKD1oSkou+M4BHWNJ+uXg7z+8x8Kbg72YL8E
   xcbhm/IzsprSKguzUlm8q6RWw+50TaiDANmEAfS/kD31FweobxsoCYO6F
   Q==;
X-CSE-ConnectionGUID: gncPMZExTi6O2Kx8fZNDiw==
X-CSE-MsgGUID: nEpjpGcLReGlBdSZDYK2rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454364"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="50454364"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 09:38:35 -0700
X-CSE-ConnectionGUID: ewWXYFpNT8a5NZBC4ftn7Q==
X-CSE-MsgGUID: cyKMxUMgTzSlCh/Mk596Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="130892259"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:34 -0700
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
Subject: [PATCH net-next 06/14] igc: use FIELD_PREP and GENMASK for existing TX packet buffer size
Date: Fri, 18 Apr 2025 09:38:12 -0700
Message-ID: <20250418163822.3519810-7-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_093839_137447_74851E0E 
X-CRM114-Status: GOOD (  10.77  )
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
Tested-by: Mor Bar-Gabay <morx.bar.gabay@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 23 ++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index 34b3b1a7610e..ec8f926362eb 100644
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
2.47.1


