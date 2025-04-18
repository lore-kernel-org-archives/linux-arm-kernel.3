Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D53AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 16:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uV23oiHxT5ydPzbbcm1pA9n4ngowxm+lOTkZLPm5Smw=; b=mvMKKgxo/R6JYQTt+gya2VBa2Q
	Ak8jQU55EvIytn5+0+FW4udP9BbIKDxJFMCp3hVWStqV9AIFXIvPamQCismMNeyfzPo7prz7olKML
	j2Ldkr0agobjgxHZsBYIaCzQB5QfEZvN6joNENPH0QP9UZ2nhqHQoJo0T3vxGm+mhaxu5LM6wR2RB
	DLnN2TeT3P/4KgatWkf21X8sAvlZDryBFB78JQMtUNtIXfzwJsjsPJC54Z0xzhUmnZ1XFmWgyOp51
	nO5MzOV3fziVoH0WIeSHH1su+lY3Vi/s/JLosgvNbbAj8v09UNGAvWual4axZYe2y+2HlN05BdviI
	fIbEoqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ozN-0000000H6PR-1EQR;
	Fri, 18 Apr 2025 16:54:53 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ojf-0000000Gygc-1dHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 16:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744994319; x=1776530319;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2hcr7RkzabYlbqbjd/UmRQGPg75CpH7103MgtxpOV5U=;
  b=NbUwyKSwRrxpr4PQXMeEOo0VBYPjKDUjMaz8CEf61tPa7MEgBvYX1v5j
   6Yca9eQMwAaV4mQkTxnXo8ZChIgQxApHqmf0Ju4dOXV0oLI993ebhXb1i
   Z0E91Jc92gGJyZOoZCFaZeP+3PJpC1DPkWOgL12jvaxQOtgP8nKk2DLo4
   2tDPvbMF2dSbCfVjFxmqeR/6OxHIgJznO/Bj31TqMcXk+mbFoaANkRUMz
   DhR8pfEFgcg/SoJaiackY2192GNKarG5Tiil6y4uOtG5sM1lHiIk6nhbZ
   WY9+DBDgD9fQ6nqcCGy0VdWVCytaKuDvo5CkgJJkjcwfknbQ5UZqQT3ng
   g==;
X-CSE-ConnectionGUID: T5lRROE/Rg6p9zdq4evj2Q==
X-CSE-MsgGUID: Mk7fKJXxRmqPRm4/h/q1iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454386"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="50454386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 09:38:36 -0700
X-CSE-ConnectionGUID: IStYbDlET/60oIESx3FNNg==
X-CSE-MsgGUID: 5y2ycaERQ4ykVJ2he9yAeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="130892266"
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
Subject: [PATCH net-next 07/14] igc: optimize TX packet buffer utilization for TSN mode
Date: Fri, 18 Apr 2025 09:38:13 -0700
Message-ID: <20250418163822.3519810-8-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_093839_469422_512F2641 
X-CRM114-Status: GOOD (  11.35  )
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

In preparation for upcoming frame preemption patches, optimize the TX
packet buffer size. The total packet buffer size (RX + TX) is 64KB, with
a maximum of 34KB for either RX or TX. Split the buffer evenly,
allocating 32KB to each.

For TX, assign 7KB to each of the four TX packet buffers (total 28KB)
and reserve 4KB for BMC.

References:
I225/I226 SW User Manual Section 4.7.9, Section 8.3.2

Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Tested-by: Mor Bar-Gabay <morx.bar.gabay@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index ec8f926362eb..5502edd6261f 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -419,8 +419,8 @@
 	IGC_TXPB0SIZE(20) | IGC_TXPB1SIZE(0) | IGC_TXPB2SIZE(0) | \
 	IGC_TXPB3SIZE(0) | IGC_OS2BMCPBSIZE(4))
 #define IGC_TXPBSIZE_TSN ( \
-	IGC_TXPB0SIZE(5) | IGC_TXPB1SIZE(5) | IGC_TXPB2SIZE(5) | \
-	IGC_TXPB3SIZE(5) | IGC_OS2BMCPBSIZE(4))
+	IGC_TXPB0SIZE(7) | IGC_TXPB1SIZE(7) | IGC_TXPB2SIZE(7) | \
+	IGC_TXPB3SIZE(7) | IGC_OS2BMCPBSIZE(4))
 
 #define IGC_DTXMXPKTSZ_TSN	0x19 /* 1600 bytes of max TX DMA packet size */
 #define IGC_DTXMXPKTSZ_DEFAULT	0x98 /* 9728-byte Jumbo frames */
-- 
2.47.1


