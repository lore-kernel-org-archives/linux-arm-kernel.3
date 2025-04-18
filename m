Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044A8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKyfjblJrl+mzp7MGtTrVu9waSptBz00LkVp+X4+dHA=; b=0x/2FJ4aBbttHE0GfVUjHbHdCP
	B4jYsDCixaDuik2Yzam71HFn0ajumlWALSHdjMPwroDz/Ob0A3tKhPr5r2w2w7CkyVdXwBoOucS74
	6fRbo+bPiPFj+VMIH7Df4h2kUSHIvL1+utLVIecgNvGfbwtHalxVP80SYueSfhTUH4bgnfDq6HilA
	i4if/PQOk8KAHALgYup1El0clpyM3XQwk4EiVO4izcZkSgWqfkJMxzRQHMmv5yfkXbNrEI89MEZ4c
	CKlo/Snq5T7/NN83Y3tmxjn7ZzUqI6D2tB7LxqKTf0SE1stL8T/vHxwiGV3GC98/MdwXTVz4NDXDY
	25l13Ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ork-0000000H4PM-0m0J;
	Fri, 18 Apr 2025 16:47:00 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ojd-0000000Gygf-2ksP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 16:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744994318; x=1776530318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AtORh+C/RnJb7OaKXNfLBopb4E8qh/pXxldrFvkHkzU=;
  b=doweCxZNDSaHQDCjIINy+AVO61S+2wQWb142WrJuXrl8f+JBzL22R5a8
   lgGmmdJedKVZbdKFS42oJtfTNWfARei39GinIc3rw6XQWoai1JuxT7A2E
   ChrpGfZbTAK795GgWZ7Dotc2QX+0Jua6iwE9elSNAWJai0r7/z2xcXCkT
   TdgiQ/ymRWjA68N3GhtGqCK12wY+xTKFHIvM6IApaoOcqnSU0KJcYudW8
   9E8TW5fBRWU8W/9vWGCcUrlKmJh0mOb+e3WNSihyOrAJ4BuSuhKxm173H
   DNIh7pBhZlF/pMRrneiTj1cfumy2b16kXjRMzlFnRR1OJzl3XTsIBqRq0
   A==;
X-CSE-ConnectionGUID: 14SCoraZTou6u5OkXuAicw==
X-CSE-MsgGUID: xM4U8D95TTmPPXLNUAmPQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="50454302"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="50454302"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 09:38:34 -0700
X-CSE-ConnectionGUID: j8lM+5MhSPaoaOGxcyCz4Q==
X-CSE-MsgGUID: zpLoSDBVRjiVUq3GJybrwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="130892238"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orviesa009.jf.intel.com with ESMTP; 18 Apr 2025 09:38:33 -0700
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
	bpf@vger.kernel.org
Subject: [PATCH net-next 03/14] net: ethtool: mm: reset verification status when link is down
Date: Fri, 18 Apr 2025 09:38:09 -0700
Message-ID: <20250418163822.3519810-4-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_093837_749370_C6A5226D 
X-CRM114-Status: GOOD (  10.92  )
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

When the link partner goes down, "ethtool --show-mm" still displays
"Verification status: SUCCEEDED," reflecting a previous state that is
no longer valid.

Reset the verification status to ensure it reflects the current state.

Reviewed-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 net/ethtool/mm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/ethtool/mm.c b/net/ethtool/mm.c
index bfd988464d7d..ad9b40034003 100644
--- a/net/ethtool/mm.c
+++ b/net/ethtool/mm.c
@@ -415,6 +415,10 @@ void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
 		/* New link => maybe new partner => new verification process */
 		ethtool_mmsv_apply(mmsv);
 	} else {
+		/* Reset the reported verification state while the link is down */
+		if (mmsv->verify_enabled)
+			mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
+
 		/* No link or pMAC not enabled */
 		ethtool_mmsv_configure_pmac(mmsv, false);
 		ethtool_mmsv_configure_tx(mmsv, false);
-- 
2.47.1


