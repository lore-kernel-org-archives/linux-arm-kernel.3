Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C80E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVsFHs3qP+DP2safQz7Gvj7+Xv1tZ9kq80hiFL5KwOU=; b=IV8v7amlv2xBYyXJAe7Zk/yvC9
	FNYzEWjD/FBr+16rv+i4eRsWv9/VM6EilstudYZSYFdqu+V33j7jZ6AmkgbPSNwiCixz/x6EDfHey
	4oBGYoqR2mGxbfv/Ou82+fblz/VNiuShpGFujd1p7D0jl2dWIhfW+m2B/+RBuBPXSrvhXxrM0nebM
	oT4mF3DxZyKMEESR9/e/iY70rxeimEVHLghQM+gWb8RvYZFIB3n46kxHt4+Hkp2A32atGLCJroDBk
	SbI/JRFriLt+XFGgTiJLYkFw/OiHJOvOlPOznSpzZ8XLKXM9iviWNIZGgFXLBmO6LxTqdIn0a9qNY
	c2+mbUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKhv-0000000Glmp-3T1Y;
	Fri, 10 Jan 2025 19:30:11 +0000
Received: from out-175.mta1.migadu.com ([2001:41d0:203:375::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKeK-0000000Gksk-2wyj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:26:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736537186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVsFHs3qP+DP2safQz7Gvj7+Xv1tZ9kq80hiFL5KwOU=;
	b=d9VHJliJysr3BgF96L92TeT8PV8DCQK/9SR4YtZJUVug3g+9IlWDRPXUvVmo7gV3TcttI1
	LWPdDIlfCFzZjZt61kIwN5+MINL0iwJBSy2MjEwSKhERsABaJb7+aX0gpJ3a3plyWHjpQE
	LIVp2yvBUwzid6TnLUUMs5Lhk6iQzFY=
From: Sean Anderson <sean.anderson@linux.dev>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v3 2/6] net: xilinx: axienet: Report an error for bad coalesce settings
Date: Fri, 10 Jan 2025 14:26:12 -0500
Message-Id: <20250110192616.2075055-3-sean.anderson@linux.dev>
In-Reply-To: <20250110192616.2075055-1-sean.anderson@linux.dev>
References: <20250110192616.2075055-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_112630_294411_9DD10485 
X-CRM114-Status: GOOD (  10.65  )
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

Instead of silently ignoring invalid/unsupported settings, report an
error. Additionally, relax the check for non-zero usecs to apply only
when it will be used (i.e. when frames != 1).

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed by: Shannon Nelson <shannon.nelson@amd.com>
---

(no changes since v2)

Changes in v2:
- New

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 62638e2a086e..ccc4a1620015 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2059,14 +2059,25 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 		return -EINVAL;
 	}
 
-	if (ecoalesce->rx_max_coalesced_frames)
-		lp->coalesce_count_rx = ecoalesce->rx_max_coalesced_frames;
-	if (ecoalesce->rx_coalesce_usecs)
-		lp->coalesce_usec_rx = ecoalesce->rx_coalesce_usecs;
-	if (ecoalesce->tx_max_coalesced_frames)
-		lp->coalesce_count_tx = ecoalesce->tx_max_coalesced_frames;
-	if (ecoalesce->tx_coalesce_usecs)
-		lp->coalesce_usec_tx = ecoalesce->tx_coalesce_usecs;
+	if (!ecoalesce->rx_max_coalesced_frames ||
+	    !ecoalesce->tx_max_coalesced_frames) {
+		NL_SET_ERR_MSG(extack, "frames must be non-zero");
+		return -EINVAL;
+	}
+
+	if ((ecoalesce->rx_max_coalesced_frames > 1 &&
+	     !ecoalesce->rx_coalesce_usecs) ||
+	    (ecoalesce->tx_max_coalesced_frames > 1 &&
+	     !ecoalesce->tx_coalesce_usecs)) {
+		NL_SET_ERR_MSG(extack,
+			       "usecs must be non-zero when frames is greater than one");
+		return -EINVAL;
+	}
+
+	lp->coalesce_count_rx = ecoalesce->rx_max_coalesced_frames;
+	lp->coalesce_usec_rx = ecoalesce->rx_coalesce_usecs;
+	lp->coalesce_count_tx = ecoalesce->tx_max_coalesced_frames;
+	lp->coalesce_usec_tx = ecoalesce->tx_coalesce_usecs;
 
 	return 0;
 }
-- 
2.35.1.1320.gc452695387.dirty


